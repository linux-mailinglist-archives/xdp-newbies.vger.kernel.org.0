Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42EEC590670
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Aug 2022 20:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbiHKSWC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Aug 2022 14:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbiHKSWB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Aug 2022 14:22:01 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13160624F
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660242121; x=1691778121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lG9de6PWaNRO4kEZpCYYyOruufRPG8gNRUIrhfg2PM0=;
  b=Twa2a6Lg8bx7TZkmVk8nsRCnFFokfePxN1AEwFRdD+5UxMiimnvgPOUe
   noTR6lgkWKeg9SG0kb/JBUfHZfqRhEle4FpIMYdz29nfHv9mxpI5eC5/i
   LxEf9VMYQUhi0z3lZ5kLCQo6PHadIiDhyFnKqk96QnQ6LeP9S3CBtcTWD
   y3XST+91FxPBbPu2DMnwA5Qnv4IqN3d7RQe/7DNpjlWxwNYlNMW0sGIKE
   uVTDQIL8tXW3paa4DM1/NMrx5Um46prTKtgp4TsLGbvl3lbJA9ubxaxDZ
   9/uSncyNv21Pk/hT7fdc44W5AwBJyTNz+nfqAUjIHdEzJUoFO4PVn1be+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="377719618"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="377719618"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 11:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="933426166"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2022 11:21:59 -0700
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     intel-wired-lan@lists.osuosl.org
Cc:     magnus.karlsson@intel.com, alasdair.mcwilliam@outlook.com,
        xdp-newbies@vger.kernel.org,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH intel-net 2/2] ice: xsk: use Rx ring's XDP ring when picking NAPI context
Date:   Thu, 11 Aug 2022 20:21:49 +0200
Message-Id: <20220811182149.145358-3-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220811182149.145358-1-maciej.fijalkowski@intel.com>
References: <20220811182149.145358-1-maciej.fijalkowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Ice driver allocates per cpu XDP queues so that redirect path can safely
use smp_processor_id() as an index to the array. At the same time
though, XDP rings are used to pick NAPI context to call napi_schedule()
or set NAPIF_STATE_MISSED. When user reduces queue count, say to 8, and
num_possible_cpus() of underlying platform is 44, then this means queue
vectors with correlated NAPI contexts will carry several XDP queues.

This in turn can result in a broken behavior where NAPI context of
interest will never be scheduled and AF_XDP socket will not process any
traffic.

To fix this, let us change the way how XDP rings are assigned to Rx
rings and use this information later on when setting
ice_tx_ring::xsk_pool pointer. For each Rx ring, grab the associated
queue vector and walk through Tx ring's linked list. Once we stumble
upon XDP ring in it, assign this ring to ice_rx_ring::xdp_ring.

Previous [0] approach of fixing this issue was for txonly scenario
because of the described grouping of XDP rings across queue vectors. So,
relying on Rx ring meant that NAPI context could be scheduled with a
queue vector without XDP ring with associated XSK pool.

[0]: https://lore.kernel.org/netdev/20220707161128.54215-1-maciej.fijalkowski@intel.com/

Fixes: 2d4238f55697 ("ice: Add support for AF_XDP")
Fixes: 22bf877e528f ("ice: introduce XDP_TX fallback path")
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 drivers/net/ethernet/intel/ice/ice.h      | 36 +++++++++++++++--------
 drivers/net/ethernet/intel/ice/ice_lib.c  |  4 +--
 drivers/net/ethernet/intel/ice/ice_main.c | 25 +++++++++++-----
 drivers/net/ethernet/intel/ice/ice_xsk.c  | 12 ++++----
 4 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 1a2e54dbc5a1..5444e55996c8 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -685,8 +685,8 @@ static inline void ice_set_ring_xdp(struct ice_tx_ring *ring)
  * ice_xsk_pool - get XSK buffer pool bound to a ring
  * @ring: Rx ring to use
  *
- * Returns a pointer to xdp_umem structure if there is a buffer pool present,
- * NULL otherwise.
+ * Returns a pointer to xsk_buff_pool structure if there is a buffer pool
+ * present, NULL otherwise.
  */
 static inline struct xsk_buff_pool *ice_xsk_pool(struct ice_rx_ring *ring)
 {
@@ -700,23 +700,33 @@ static inline struct xsk_buff_pool *ice_xsk_pool(struct ice_rx_ring *ring)
 }
 
 /**
- * ice_tx_xsk_pool - get XSK buffer pool bound to a ring
- * @ring: Tx ring to use
+ * ice_tx_xsk_pool - assign XSK buff pool to XDP ring
+ * @vsi: pointer to VSI
+ * @qid: index of a queue to look at XSK buff pool presence
  *
- * Returns a pointer to xdp_umem structure if there is a buffer pool present,
- * NULL otherwise. Tx equivalent of ice_xsk_pool.
+ * Sets XSK buff pool pointer on XDP ring.
+ *
+ * XDP ring is picked from Rx ring, whereas Rx ring is picked based on provided
+ * queue id. Reason for doing so is that queue vectors might have assigned more
+ * than one XDP ring, e.g. when user reduced the queue count on netdev; Rx ring
+ * carries a pointer to one of these XDP rings for its own purposes, such as
+ * handling XDP_TX action, therefore we can piggyback here on the
+ * rx_ring->xdp_ring assignment that was done during XDP rings initialization.
  */
-static inline struct xsk_buff_pool *ice_tx_xsk_pool(struct ice_tx_ring *ring)
+static inline void ice_tx_xsk_pool(struct ice_vsi *vsi, u16 qid)
 {
-	struct ice_vsi *vsi = ring->vsi;
-	u16 qid;
+	struct ice_tx_ring *ring;
 
-	qid = ring->q_index - vsi->alloc_txq;
+	ring = vsi->rx_rings[qid]->xdp_ring;
+	if (!ring)
+		return;
 
-	if (!ice_is_xdp_ena_vsi(vsi) || !test_bit(qid, vsi->af_xdp_zc_qps))
-		return NULL;
+	if (!ice_is_xdp_ena_vsi(vsi) || !test_bit(qid, vsi->af_xdp_zc_qps)) {
+		ring->xsk_pool = NULL;
+		return;
+	}
 
-	return xsk_get_pool_from_qid(vsi->netdev, qid);
+	ring->xsk_pool = xsk_get_pool_from_qid(vsi->netdev, qid);
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index bc357dfae306..97faf1bd4272 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1986,8 +1986,8 @@ int ice_vsi_cfg_xdp_txqs(struct ice_vsi *vsi)
 	if (ret)
 		return ret;
 
-	ice_for_each_xdp_txq(vsi, i)
-		vsi->xdp_rings[i]->xsk_pool = ice_tx_xsk_pool(vsi->xdp_rings[i]);
+	ice_for_each_rxq(vsi, i)
+		ice_tx_xsk_pool(vsi, i);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 313716615e98..7e2f67f699bd 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -2579,7 +2579,6 @@ static int ice_xdp_alloc_setup_rings(struct ice_vsi *vsi)
 		if (ice_setup_tx_ring(xdp_ring))
 			goto free_xdp_rings;
 		ice_set_ring_xdp(xdp_ring);
-		xdp_ring->xsk_pool = ice_tx_xsk_pool(xdp_ring);
 		spin_lock_init(&xdp_ring->tx_lock);
 		for (j = 0; j < xdp_ring->count; j++) {
 			tx_desc = ICE_TX_DESC(xdp_ring, j);
@@ -2587,13 +2586,6 @@ static int ice_xdp_alloc_setup_rings(struct ice_vsi *vsi)
 		}
 	}
 
-	ice_for_each_rxq(vsi, i) {
-		if (static_key_enabled(&ice_xdp_locking_key))
-			vsi->rx_rings[i]->xdp_ring = vsi->xdp_rings[i % vsi->num_xdp_txq];
-		else
-			vsi->rx_rings[i]->xdp_ring = vsi->xdp_rings[i];
-	}
-
 	return 0;
 
 free_xdp_rings:
@@ -2683,6 +2675,23 @@ int ice_prepare_xdp_rings(struct ice_vsi *vsi, struct bpf_prog *prog)
 		xdp_rings_rem -= xdp_rings_per_v;
 	}
 
+	ice_for_each_rxq(vsi, i) {
+		if (static_key_enabled(&ice_xdp_locking_key)) {
+			vsi->rx_rings[i]->xdp_ring = vsi->xdp_rings[i % vsi->num_xdp_txq];
+		} else {
+			struct ice_q_vector *q_vector = vsi->rx_rings[i]->q_vector;
+			struct ice_tx_ring *ring;
+
+			ice_for_each_tx_ring(ring, q_vector->tx) {
+				if (ice_ring_is_xdp(ring)) {
+					vsi->rx_rings[i]->xdp_ring = ring;
+					break;
+				}
+			}
+		}
+		ice_tx_xsk_pool(vsi, i);
+	}
+
 	/* omit the scheduler update if in reset path; XDP queues will be
 	 * taken into account at the end of ice_vsi_rebuild, where
 	 * ice_cfg_vsi_lan is being called
diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
index 45f88e6ec25e..e48e29258450 100644
--- a/drivers/net/ethernet/intel/ice/ice_xsk.c
+++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
@@ -243,7 +243,7 @@ static int ice_qp_ena(struct ice_vsi *vsi, u16 q_idx)
 		if (err)
 			goto free_buf;
 		ice_set_ring_xdp(xdp_ring);
-		xdp_ring->xsk_pool = ice_tx_xsk_pool(xdp_ring);
+		ice_tx_xsk_pool(vsi, q_idx);
 	}
 
 	err = ice_vsi_cfg_rxq(rx_ring);
@@ -359,7 +359,7 @@ int ice_xsk_pool_setup(struct ice_vsi *vsi, struct xsk_buff_pool *pool, u16 qid)
 	if (if_running) {
 		ret = ice_qp_ena(vsi, qid);
 		if (!ret && pool_present)
-			napi_schedule(&vsi->xdp_rings[qid]->q_vector->napi);
+			napi_schedule(&vsi->rx_rings[qid]->xdp_ring->q_vector->napi);
 		else if (ret)
 			netdev_err(vsi->netdev, "ice_qp_ena error = %d\n", ret);
 	}
@@ -950,13 +950,13 @@ ice_xsk_wakeup(struct net_device *netdev, u32 queue_id,
 	if (!ice_is_xdp_ena_vsi(vsi))
 		return -EINVAL;
 
-	if (queue_id >= vsi->num_txq)
+	if (queue_id >= vsi->num_txq || queue_id >= vsi->num_rxq)
 		return -EINVAL;
 
-	if (!vsi->xdp_rings[queue_id]->xsk_pool)
-		return -EINVAL;
+	ring = vsi->rx_rings[queue_id]->xdp_ring;
 
-	ring = vsi->xdp_rings[queue_id];
+	if (!ring->xsk_pool)
+		return -EINVAL;
 
 	/* The idea here is that if NAPI is running, mark a miss, so
 	 * it will run again. If not, trigger an interrupt and
-- 
2.27.0

