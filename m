Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2725B63C26A
	for <lists+xdp-newbies@lfdr.de>; Tue, 29 Nov 2022 15:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbiK2OZ4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Nov 2022 09:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbiK2OZs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Nov 2022 09:25:48 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE2030F46
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669731931; x=1701267931;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=604ATGcTRGn/R3/3w086zACxqXby9kd7hL6TYyb+AUA=;
  b=ZG5QrY+QZTqQXEQIj9jLiDyohpkDUqLBzwRad5CjPRb6lEHuo1OBCoil
   8X6mw3dNxqw4tfsa4mM3FYUWPMx1O8tRqFVsS8tn/vSit38xJKtPOVZf5
   uN/78YES6VIni85GYjd1Jc7v7GomoSB8RZURlH8JG0iyS3WYWYwnznfvB
   40t5ECa09dpSM03zE0AXXCRNzdE5LvfljCxLUDPD5HH/i69dv289BvjHL
   Zo5d6rsYp6mEp0TcTIreOF6eC3k50EGV96yzXnLGTbmjZmM/XdGvfBzHq
   4eYOTf36A+3unOJ6Q/U5RFfN4zCDQPTgSo33SnD4WYaWykvKvu//KbLCN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="315149963"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="315149963"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 06:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="888859326"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="888859326"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2022 06:25:30 -0800
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Robin.Cowley@thehutgroup.com, magnus.karlsson@intel.com
Cc:     xdp-newbies@vger.kernel.org,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH bpf] ice: xsk: do not use xdp_return_frame() on tx_buf->raw_buf
Date:   Tue, 29 Nov 2022 15:25:28 +0100
Message-Id: <20221129142528.4089347-1-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Previously ice XDP xmit routine was changed in a way that it avoids
xdp_buff->xdp_frame conversion as it is simply not needed for handling
XDP_TX action and what is more it saves us CPU cycles. This routine is
re-used on ZC driver to handle XDP_TX action.

Although for XDP_TX on Rx ZC xdp_buff that comes from xsk_buff_pool is
converted to xdp_frame, xdp_frame itself is not stored inside
ice_tx_buf, we only store raw data pointer. Casting this pointer to
xdp_frame and calling against it xdp_return_frame in
ice_clean_xdp_tx_buf() results in undefined behavior.

To fix this, simply call page_frag_free() on tx_buf->raw_buf.
Later intention is to remove the buff->frame conversion in order to
simplify the codebase and improve XDP_TX performance on ZC.

Fixes: 126cdfe1007a ("ice: xsk: Improve AF_XDP ZC Tx and use batching API")
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
index 056c904b83cc..79fa65d1cf20 100644
--- a/drivers/net/ethernet/intel/ice/ice_xsk.c
+++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
@@ -772,7 +772,7 @@ int ice_clean_rx_irq_zc(struct ice_rx_ring *rx_ring, int budget)
 static void
 ice_clean_xdp_tx_buf(struct ice_tx_ring *xdp_ring, struct ice_tx_buf *tx_buf)
 {
-	xdp_return_frame((struct xdp_frame *)tx_buf->raw_buf);
+	page_frag_free(tx_buf->raw_buf);
 	xdp_ring->xdp_tx_active--;
 	dma_unmap_single(xdp_ring->dev, dma_unmap_addr(tx_buf, dma),
 			 dma_unmap_len(tx_buf, len), DMA_TO_DEVICE);
-- 
2.34.1

