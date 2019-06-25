Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09FF15568E
	for <lists+xdp-newbies@lfdr.de>; Tue, 25 Jun 2019 20:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732488AbfFYR75 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 25 Jun 2019 13:59:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37268 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732407AbfFYR75 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 25 Jun 2019 13:59:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so17180005ljf.4
        for <xdp-newbies@vger.kernel.org>; Tue, 25 Jun 2019 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F7JFqzRXqxTzUkcqfAtcONZlOP60PRysVxN4UPvDiWY=;
        b=ZadifqpCxAG5Bc754uL5Fhovr0r1XyRVOO1iONYf27GIXt8S2gj8Ja0ArmE2RSIBuT
         k3wNjjzrTLE/8Nj6fRGG5TdXYcIlj9ndlz5gT2xGXjEmH+WQDegmUtKXXwM8FS/exvi6
         ogDi1sUcp9JoBT2F5aatoKSStsET9jc8LhZCEX7VkYejhx4laKXGrWzz55Fjz/a70zVU
         jVEhhvcq+Byj0LjMg+aO78FYXrJmsB/3uMnpl/qAeCmGJZYM6oYXYublMDwGkjuTSNf2
         p7D019H3CyzIVq1vmlHcgtxRbqNCA0/0shsdNxjPhFQEXh1XQldkv2Dezh9ynvo9qEXl
         R6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F7JFqzRXqxTzUkcqfAtcONZlOP60PRysVxN4UPvDiWY=;
        b=uaeTCIMS9tKZuic2ZdM908jVg7PI6GvMnvDT/ANng9Ik+Clqrg03EK00WM9IEmUWsb
         sGANIv4sWeuKCjr2mzfETq7T00or3gYxErezNcVtCQiRPEhT7J3qm5uCm8VWrxTrvw7n
         RoaCsug3eb3QbzPVbucyDMX/vnq/3ACDGJ4MO9v8eKpv2/sA0aByPsn+jhlDwVq6nRY+
         b+ENYX68i9r0H7/3q/69vYKgItWVHYVvsByxG277CxeWX4/YM/6XkFmFG/qJl5XSWePl
         saRvWCLeG8hSaoiSkaw8d3o076/7TQzJbyB7WJYbwqkqIOfuvRlqbBTXttcjfC0Drpcu
         IfGA==
X-Gm-Message-State: APjAAAV1XV8bivU2JgjWEN0vu3uoHCp3nbduAPTLaYsTArcMvqkEfVf9
        jRJbO6t/wMW6KpzL++mmcgvp6g==
X-Google-Smtp-Source: APXvYqx4m9irLzPWQV8N9V/2vVsbjwpZb29dlh+ftKww4JJ1/ZW0pHgBwDbkjtaO1bd1eA5k1y+2bg==
X-Received: by 2002:a2e:658e:: with SMTP id e14mr54400481ljf.147.1561485594696;
        Tue, 25 Jun 2019 10:59:54 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g76sm2367597lje.43.2019.06.25.10.59.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 10:59:54 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com, hawk@kernel.org,
        brouer@redhat.com, saeedm@mellanox.com, leon@kernel.org
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 2/4] net: ethernet: ti: davinci_cpdma: add dma mapped submit
Date:   Tue, 25 Jun 2019 20:59:46 +0300
Message-Id: <20190625175948.24771-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org>
References: <20190625175948.24771-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

In case if dma mapped packet needs to be sent, like with XDP
page pool, the "mapped" submit can be used. This patch adds dma
mapped submit based on regular one.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/davinci_cpdma.c | 89 ++++++++++++++++++++++---
 drivers/net/ethernet/ti/davinci_cpdma.h |  4 ++
 2 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 5cf1758d425b..8da46394c0e7 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -139,6 +139,7 @@ struct submit_info {
 	int directed;
 	void *token;
 	void *data;
+	int flags;
 	int len;
 };
 
@@ -184,6 +185,8 @@ static struct cpdma_control_info controls[] = {
 				 (directed << CPDMA_TO_PORT_SHIFT));	\
 	} while (0)
 
+#define CPDMA_DMA_EXT_MAP		BIT(16)
+
 static void cpdma_desc_pool_destroy(struct cpdma_ctlr *ctlr)
 {
 	struct cpdma_desc_pool *pool = ctlr->pool;
@@ -1015,6 +1018,7 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 	struct cpdma_chan		*chan = si->chan;
 	struct cpdma_ctlr		*ctlr = chan->ctlr;
 	int				len = si->len;
+	int				swlen = len;
 	struct cpdma_desc __iomem	*desc;
 	dma_addr_t			buffer;
 	u32				mode;
@@ -1036,16 +1040,22 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 		chan->stats.runt_transmit_buff++;
 	}
 
-	buffer = dma_map_single(ctlr->dev, si->data, len, chan->dir);
-	ret = dma_mapping_error(ctlr->dev, buffer);
-	if (ret) {
-		cpdma_desc_free(ctlr->pool, desc, 1);
-		return -EINVAL;
-	}
-
 	mode = CPDMA_DESC_OWNER | CPDMA_DESC_SOP | CPDMA_DESC_EOP;
 	cpdma_desc_to_port(chan, mode, si->directed);
 
+	if (si->flags & CPDMA_DMA_EXT_MAP) {
+		buffer = (u32)si->data;
+		dma_sync_single_for_device(ctlr->dev, buffer, len, chan->dir);
+		swlen |= CPDMA_DMA_EXT_MAP;
+	} else {
+		buffer = dma_map_single(ctlr->dev, si->data, len, chan->dir);
+		ret = dma_mapping_error(ctlr->dev, buffer);
+		if (ret) {
+			cpdma_desc_free(ctlr->pool, desc, 1);
+			return -EINVAL;
+		}
+	}
+
 	/* Relaxed IO accessors can be used here as there is read barrier
 	 * at the end of write sequence.
 	 */
@@ -1055,7 +1065,7 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 	writel_relaxed(mode | len, &desc->hw_mode);
 	writel_relaxed((uintptr_t)si->token, &desc->sw_token);
 	writel_relaxed(buffer, &desc->sw_buffer);
-	writel_relaxed(len, &desc->sw_len);
+	writel_relaxed(swlen, &desc->sw_len);
 	desc_read(desc, sw_len);
 
 	__cpdma_chan_submit(chan, desc);
@@ -1079,6 +1089,32 @@ int cpdma_chan_idle_submit(struct cpdma_chan *chan, void *token, void *data,
 	si.data = data;
 	si.len = len;
 	si.directed = directed;
+	si.flags = 0;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->state == CPDMA_STATE_TEARDOWN) {
+		spin_unlock_irqrestore(&chan->lock, flags);
+		return -EINVAL;
+	}
+
+	ret = cpdma_chan_submit_si(&si);
+	spin_unlock_irqrestore(&chan->lock, flags);
+	return ret;
+}
+
+int cpdma_chan_idle_submit_mapped(struct cpdma_chan *chan, void *token,
+				  dma_addr_t data, int len, int directed)
+{
+	struct submit_info si;
+	unsigned long flags;
+	int ret;
+
+	si.chan = chan;
+	si.token = token;
+	si.data = (void *)(u32)data;
+	si.len = len;
+	si.directed = directed;
+	si.flags = CPDMA_DMA_EXT_MAP;
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->state == CPDMA_STATE_TEARDOWN) {
@@ -1103,6 +1139,32 @@ int cpdma_chan_submit(struct cpdma_chan *chan, void *token, void *data,
 	si.data = data;
 	si.len = len;
 	si.directed = directed;
+	si.flags = 0;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->state != CPDMA_STATE_ACTIVE) {
+		spin_unlock_irqrestore(&chan->lock, flags);
+		return -EINVAL;
+	}
+
+	ret = cpdma_chan_submit_si(&si);
+	spin_unlock_irqrestore(&chan->lock, flags);
+	return ret;
+}
+
+int cpdma_chan_submit_mapped(struct cpdma_chan *chan, void *token,
+			     dma_addr_t data, int len, int directed)
+{
+	struct submit_info si;
+	unsigned long flags;
+	int ret;
+
+	si.chan = chan;
+	si.token = token;
+	si.data = (void *)(u32)data;
+	si.len = len;
+	si.directed = directed;
+	si.flags = CPDMA_DMA_EXT_MAP;
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->state != CPDMA_STATE_ACTIVE) {
@@ -1140,10 +1202,17 @@ static void __cpdma_chan_free(struct cpdma_chan *chan,
 	uintptr_t			token;
 
 	token      = desc_read(desc, sw_token);
-	buff_dma   = desc_read(desc, sw_buffer);
 	origlen    = desc_read(desc, sw_len);
 
-	dma_unmap_single(ctlr->dev, buff_dma, origlen, chan->dir);
+	buff_dma   = desc_read(desc, sw_buffer);
+	if (origlen & CPDMA_DMA_EXT_MAP) {
+		origlen &= ~CPDMA_DMA_EXT_MAP;
+		dma_sync_single_for_cpu(ctlr->dev, buff_dma, origlen,
+					chan->dir);
+	} else {
+		dma_unmap_single(ctlr->dev, buff_dma, origlen, chan->dir);
+	}
+
 	cpdma_desc_free(pool, desc, 1);
 	(*chan->handler)((void *)token, outlen, status);
 }
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.h b/drivers/net/ethernet/ti/davinci_cpdma.h
index 9343c8c73c1b..0271a20c2e09 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.h
+++ b/drivers/net/ethernet/ti/davinci_cpdma.h
@@ -77,8 +77,12 @@ int cpdma_chan_stop(struct cpdma_chan *chan);
 
 int cpdma_chan_get_stats(struct cpdma_chan *chan,
 			 struct cpdma_chan_stats *stats);
+int cpdma_chan_submit_mapped(struct cpdma_chan *chan, void *token,
+			     dma_addr_t data, int len, int directed);
 int cpdma_chan_submit(struct cpdma_chan *chan, void *token, void *data,
 		      int len, int directed);
+int cpdma_chan_idle_submit_mapped(struct cpdma_chan *chan, void *token,
+				  dma_addr_t data, int len, int directed);
 int cpdma_chan_idle_submit(struct cpdma_chan *chan, void *token, void *data,
 			   int len, int directed);
 int cpdma_chan_process(struct cpdma_chan *chan, int quota);
-- 
2.17.1

