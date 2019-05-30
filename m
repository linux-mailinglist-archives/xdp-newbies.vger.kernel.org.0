Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7AE4301BD
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 May 2019 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfE3SVA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 May 2019 14:21:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43921 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfE3SVA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 May 2019 14:21:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id z5so6994634lji.10
        for <xdp-newbies@vger.kernel.org>; Thu, 30 May 2019 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VwtitAHrkRTmSXybjYU2tYI3XhcpB8SZvJGlF0k7LR8=;
        b=BDljY3oUWcpSunX+BtsT3CUu8PlMz94C8FclzAwWRJkbl78QD3AXsjwE75dUI2Dqyg
         npYb2IV6svaRmO83F/ZPNySqRcy7YvA2+rlK2mI1mNNnH8+G4yara9URDlhWf+vqC+vS
         fZpWNJgofl1agt//ekdfueAUnvx9u3YirGyFAg1D1qzOkX9cz2Mi/b8IAdfAIt388pmL
         zDKPYy7xDfR6YPvMmWx32IPsyEo1ATPjq3neS6BAUd9+05qBGraq5mYLanHSBrHCWPXP
         33Nz7aHrB08n9cDUEE4Q6usnwQZKe9aXG0iVSrmMsTlNoKL/ds+J9OcxxafkW3bc7JOo
         Fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VwtitAHrkRTmSXybjYU2tYI3XhcpB8SZvJGlF0k7LR8=;
        b=MpJlGpNNVdeNLnyVe/ZWLtP4IhVgB9XVI3pttHy3RLU/K7ULB55VIWYNfnVVK+m69b
         PJ9sRDLROoPCOQhZOgJKXLwqGTHyP6LYjNhTmvmOoeK/Y5iceSHdwzY4mN7hjoe8iCDf
         8nwH1ZuDmK6A6Zb//QfEyJFr/vfPAMcqqI7e2Wv/igYzuOAhN2L99M2YLfxRafFP8lnJ
         VL2zBPiIgX7M9KioiFrCwxHx9Qc/4bcjju5ZmgHEfXc3HPNQmWMm1xQ1qvM6+gqPRheD
         PCFJPXnpqmdAj3F0lLQ4l7zW3VdD0RbtzgRJTisdI2nDIFSKwtiAWzlUbTomL4rrsMST
         AKIA==
X-Gm-Message-State: APjAAAXh8IxoNwqDXsR1H88KwJJ39w+CCHpjGoYU/Hz8TXJKbo54CEVG
        HxgwC5azJnb3fdrqkkCkWqkPhyMpmWk=
X-Google-Smtp-Source: APXvYqzfAktHqEgChn6MQOcHJmJcQV53y0dNuo1ujinr8fruawSyO7qQhcDlqMAkH3MmHLTKJxnZaA==
X-Received: by 2002:a2e:9bc5:: with SMTP id w5mr3077209ljj.87.1559240457629;
        Thu, 30 May 2019 11:20:57 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id v7sm388946lfe.11.2019.05.30.11.20.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 11:20:57 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 6/7] net: ethernet: ti: davinci_cpdma: return handler status
Date:   Thu, 30 May 2019 21:20:38 +0300
Message-Id: <20190530182039.4945-7-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
References: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This change is needed to return flush status of rx handler for
flushing redirected xdp frames after processing channel packets.
Do it as separate patch for simplicity.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c          | 23 +++++++++++------
 drivers/net/ethernet/ti/cpsw_ethtool.c  |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.h     |  2 +-
 drivers/net/ethernet/ti/davinci_cpdma.c | 34 +++++++++++++++----------
 drivers/net/ethernet/ti/davinci_cpdma.h |  4 +--
 drivers/net/ethernet/ti/davinci_emac.c  | 18 ++++++++-----
 6 files changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 3430503e1053..d89ad428315c 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -337,7 +337,7 @@ void cpsw_intr_disable(struct cpsw_common *cpsw)
 	return;
 }
 
-void cpsw_tx_handler(void *token, int len, int status)
+int cpsw_tx_handler(void *token, int len, int status)
 {
 	struct netdev_queue	*txq;
 	struct sk_buff		*skb = token;
@@ -355,6 +355,7 @@ void cpsw_tx_handler(void *token, int len, int status)
 	ndev->stats.tx_packets++;
 	ndev->stats.tx_bytes += len;
 	dev_kfree_skb_any(skb);
+	return 0;
 }
 
 static void cpsw_rx_vlan_encap(struct sk_buff *skb)
@@ -400,7 +401,7 @@ static void cpsw_rx_vlan_encap(struct sk_buff *skb)
 	}
 }
 
-static void cpsw_rx_handler(void *token, int len, int status)
+static int cpsw_rx_handler(void *token, int len, int status)
 {
 	struct cpdma_chan	*ch;
 	struct sk_buff		*skb = token;
@@ -434,7 +435,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 
 		/* the interface is going down, skbs are purged */
 		dev_kfree_skb_any(skb);
-		return;
+		return 0;
 	}
 
 	new_skb = netdev_alloc_skb_ip_align(ndev, cpsw->rx_packet_max);
@@ -459,7 +460,7 @@ static void cpsw_rx_handler(void *token, int len, int status)
 requeue:
 	if (netif_dormant(ndev)) {
 		dev_kfree_skb_any(new_skb);
-		return;
+		return 0;
 	}
 
 	ch = cpsw->rxv[skb_get_queue_mapping(new_skb)].ch;
@@ -467,6 +468,8 @@ static void cpsw_rx_handler(void *token, int len, int status)
 				skb_tailroom(new_skb), 0);
 	if (WARN_ON(ret < 0))
 		dev_kfree_skb_any(new_skb);
+
+	return 0;
 }
 
 void cpsw_split_res(struct cpsw_common *cpsw)
@@ -605,7 +608,8 @@ static int cpsw_tx_mq_poll(struct napi_struct *napi_tx, int budget)
 		else
 			cur_budget = txv->budget;
 
-		num_tx += cpdma_chan_process(txv->ch, cur_budget);
+		cpdma_chan_process(txv->ch, &cur_budget);
+		num_tx += cur_budget;
 		if (num_tx >= budget)
 			break;
 	}
@@ -623,7 +627,8 @@ static int cpsw_tx_poll(struct napi_struct *napi_tx, int budget)
 	struct cpsw_common *cpsw = napi_to_cpsw(napi_tx);
 	int num_tx;
 
-	num_tx = cpdma_chan_process(cpsw->txv[0].ch, budget);
+	num_tx = budget;
+	cpdma_chan_process(cpsw->txv[0].ch, &num_tx);
 	if (num_tx < budget) {
 		napi_complete(napi_tx);
 		writel(0xff, &cpsw->wr_regs->tx_en);
@@ -655,7 +660,8 @@ static int cpsw_rx_mq_poll(struct napi_struct *napi_rx, int budget)
 		else
 			cur_budget = rxv->budget;
 
-		num_rx += cpdma_chan_process(rxv->ch, cur_budget);
+		cpdma_chan_process(rxv->ch, &cur_budget);
+		num_rx += cur_budget;
 		if (num_rx >= budget)
 			break;
 	}
@@ -673,7 +679,8 @@ static int cpsw_rx_poll(struct napi_struct *napi_rx, int budget)
 	struct cpsw_common *cpsw = napi_to_cpsw(napi_rx);
 	int num_rx;
 
-	num_rx = cpdma_chan_process(cpsw->rxv[0].ch, budget);
+	num_rx = budget;
+	cpdma_chan_process(cpsw->rxv[0].ch, &num_rx);
 	if (num_rx < budget) {
 		napi_complete_done(napi_rx, num_rx);
 		writel(0xff, &cpsw->wr_regs->rx_en);
diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index c260bb32aacf..1a7c4818c890 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -538,8 +538,8 @@ static int cpsw_update_channels_res(struct cpsw_priv *priv, int ch_num, int rx,
 				    cpdma_handler_fn rx_handler)
 {
 	struct cpsw_common *cpsw = priv->cpsw;
-	void (*handler)(void *, int, int);
 	struct netdev_queue *queue;
+	cpdma_handler_fn handler;
 	struct cpsw_vector *vec;
 	int ret, *ch, vch;
 
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index 04795b97ee71..2ecb3af59fe9 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -390,7 +390,7 @@ void cpsw_split_res(struct cpsw_common *cpsw);
 int cpsw_fill_rx_channels(struct cpsw_priv *priv);
 void cpsw_intr_enable(struct cpsw_common *cpsw);
 void cpsw_intr_disable(struct cpsw_common *cpsw);
-void cpsw_tx_handler(void *token, int len, int status);
+int cpsw_tx_handler(void *token, int len, int status);
 
 /* ethtool */
 u32 cpsw_get_msglevel(struct net_device *ndev);
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 7f89b2299f05..a59011d315d5 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -1137,15 +1137,16 @@ bool cpdma_check_free_tx_desc(struct cpdma_chan *chan)
 	return free_tx_desc;
 }
 
-static void __cpdma_chan_free(struct cpdma_chan *chan,
-			      struct cpdma_desc __iomem *desc,
-			      int outlen, int status)
+static int __cpdma_chan_free(struct cpdma_chan *chan,
+			     struct cpdma_desc __iomem *desc, int outlen,
+			     int status)
 {
 	struct cpdma_ctlr		*ctlr = chan->ctlr;
 	struct cpdma_desc_pool		*pool = ctlr->pool;
 	dma_addr_t			buff_dma;
 	int				origlen;
 	uintptr_t			token;
+	int				ret;
 
 	token      = desc_read(desc, sw_token);
 	origlen    = desc_read(desc, sw_len);
@@ -1160,14 +1161,16 @@ static void __cpdma_chan_free(struct cpdma_chan *chan,
 	}
 
 	cpdma_desc_free(pool, desc, 1);
-	(*chan->handler)((void *)token, outlen, status);
+	ret = (*chan->handler)((void *)token, outlen, status);
+
+	return ret;
 }
 
 static int __cpdma_chan_process(struct cpdma_chan *chan)
 {
+	int				status, outlen, ret;
 	struct cpdma_ctlr		*ctlr = chan->ctlr;
 	struct cpdma_desc __iomem	*desc;
-	int				status, outlen;
 	int				cb_status = 0;
 	struct cpdma_desc_pool		*pool = ctlr->pool;
 	dma_addr_t			desc_dma;
@@ -1178,7 +1181,7 @@ static int __cpdma_chan_process(struct cpdma_chan *chan)
 	desc = chan->head;
 	if (!desc) {
 		chan->stats.empty_dequeue++;
-		status = -ENOENT;
+		ret = -ENOENT;
 		goto unlock_ret;
 	}
 	desc_dma = desc_phys(pool, desc);
@@ -1187,7 +1190,7 @@ static int __cpdma_chan_process(struct cpdma_chan *chan)
 	outlen	= status & 0x7ff;
 	if (status & CPDMA_DESC_OWNER) {
 		chan->stats.busy_dequeue++;
-		status = -EBUSY;
+		ret = -EBUSY;
 		goto unlock_ret;
 	}
 
@@ -1213,28 +1216,31 @@ static int __cpdma_chan_process(struct cpdma_chan *chan)
 	else
 		cb_status = status;
 
-	__cpdma_chan_free(chan, desc, outlen, cb_status);
-	return status;
+	ret = __cpdma_chan_free(chan, desc, outlen, cb_status);
+	return ret;
 
 unlock_ret:
 	spin_unlock_irqrestore(&chan->lock, flags);
-	return status;
+	return ret;
 }
 
-int cpdma_chan_process(struct cpdma_chan *chan, int quota)
+int cpdma_chan_process(struct cpdma_chan *chan, int *quota)
 {
-	int used = 0, ret = 0;
+	int used = 0, ret = 0, res = 0;
 
 	if (chan->state != CPDMA_STATE_ACTIVE)
 		return -EINVAL;
 
-	while (used < quota) {
+	while (used < *quota) {
 		ret = __cpdma_chan_process(chan);
 		if (ret < 0)
 			break;
+		res |= ret;
 		used++;
 	}
-	return used;
+
+	*quota = used;
+	return res;
 }
 
 int cpdma_chan_start(struct cpdma_chan *chan)
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.h b/drivers/net/ethernet/ti/davinci_cpdma.h
index 8f6f27185c63..56543d375923 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.h
+++ b/drivers/net/ethernet/ti/davinci_cpdma.h
@@ -61,7 +61,7 @@ struct cpdma_chan_stats {
 struct cpdma_ctlr;
 struct cpdma_chan;
 
-typedef void (*cpdma_handler_fn)(void *token, int len, int status);
+typedef int (*cpdma_handler_fn)(void *token, int len, int status);
 
 struct cpdma_ctlr *cpdma_ctlr_create(struct cpdma_params *params);
 int cpdma_ctlr_destroy(struct cpdma_ctlr *ctlr);
@@ -81,7 +81,7 @@ int cpdma_chan_submit_mapped(struct cpdma_chan *chan, void *token,
 			     dma_addr_t data, int len, int directed);
 int cpdma_chan_submit(struct cpdma_chan *chan, void *token, void *data,
 		      int len, int directed);
-int cpdma_chan_process(struct cpdma_chan *chan, int quota);
+int cpdma_chan_process(struct cpdma_chan *chan, int *quota);
 
 int cpdma_ctlr_int_ctrl(struct cpdma_ctlr *ctlr, bool enable);
 void cpdma_ctlr_eoi(struct cpdma_ctlr *ctlr, u32 value);
diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 4bf65cab79e6..3592690b8dd8 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -860,7 +860,7 @@ static struct sk_buff *emac_rx_alloc(struct emac_priv *priv)
 	return skb;
 }
 
-static void emac_rx_handler(void *token, int len, int status)
+static int emac_rx_handler(void *token, int len, int status)
 {
 	struct sk_buff		*skb = token;
 	struct net_device	*ndev = skb->dev;
@@ -871,7 +871,7 @@ static void emac_rx_handler(void *token, int len, int status)
 	/* free and bail if we are shutting down */
 	if (unlikely(!netif_running(ndev))) {
 		dev_kfree_skb_any(skb);
-		return;
+		return 0;
 	}
 
 	/* recycle on receive error */
@@ -892,7 +892,7 @@ static void emac_rx_handler(void *token, int len, int status)
 	if (!skb) {
 		if (netif_msg_rx_err(priv) && net_ratelimit())
 			dev_err(emac_dev, "failed rx buffer alloc\n");
-		return;
+		return 0;
 	}
 
 recycle:
@@ -902,9 +902,11 @@ static void emac_rx_handler(void *token, int len, int status)
 	WARN_ON(ret == -ENOMEM);
 	if (unlikely(ret < 0))
 		dev_kfree_skb_any(skb);
+
+	return 0;
 }
 
-static void emac_tx_handler(void *token, int len, int status)
+static int emac_tx_handler(void *token, int len, int status)
 {
 	struct sk_buff		*skb = token;
 	struct net_device	*ndev = skb->dev;
@@ -917,6 +919,7 @@ static void emac_tx_handler(void *token, int len, int status)
 	ndev->stats.tx_packets++;
 	ndev->stats.tx_bytes += len;
 	dev_kfree_skb_any(skb);
+	return 0;
 }
 
 /**
@@ -1237,8 +1240,8 @@ static int emac_poll(struct napi_struct *napi, int budget)
 		mask = EMAC_DM646X_MAC_IN_VECTOR_TX_INT_VEC;
 
 	if (status & mask) {
-		num_tx_pkts = cpdma_chan_process(priv->txchan,
-					      EMAC_DEF_TX_MAX_SERVICE);
+		num_tx_pkts = EMAC_DEF_TX_MAX_SERVICE;
+		cpdma_chan_process(priv->txchan, &num_tx_pkts);
 	} /* TX processing */
 
 	mask = EMAC_DM644X_MAC_IN_VECTOR_RX_INT_VEC;
@@ -1247,7 +1250,8 @@ static int emac_poll(struct napi_struct *napi, int budget)
 		mask = EMAC_DM646X_MAC_IN_VECTOR_RX_INT_VEC;
 
 	if (status & mask) {
-		num_rx_pkts = cpdma_chan_process(priv->rxchan, budget);
+		num_rx_pkts = budget;
+		cpdma_chan_process(priv->rxchan, &num_rx_pkts);
 	} /* RX processing */
 
 	mask = EMAC_DM644X_MAC_IN_VECTOR_HOST_INT;
-- 
2.17.1

