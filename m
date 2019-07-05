Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E34608B5
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 17:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfGEPFk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jul 2019 11:05:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37152 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfGEPFK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jul 2019 11:05:10 -0400
Received: by mail-lf1-f68.google.com with SMTP id c9so4788915lfh.4
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jul 2019 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F7JFqzRXqxTzUkcqfAtcONZlOP60PRysVxN4UPvDiWY=;
        b=Ieh5tUIFFf4fyOoqWEJgWTVcVPpBHB9GWUbg6g1TUA2M8gjQ9lHzA0I/eb5kRhWVz3
         RYuJjOvGeo8cyQV92RuJd1vpnWynzeBBqo3vj4VL8dLfPkHU0L21ZQvx/4oQVVPhJe9n
         EEYrazIQL+pPqCCVo59R3gRlZClC32lDK20D91FOg85tJRHiEmH7VaHz7JeG/SA0PyaE
         oFk+6MrEe7d9Q9Nzj8FESl7rYXEq5rePXowIf8A4wf1HuMKVQjUrm4pVmygSH1bEnKC1
         UsfSOPQtk9rbfaMJVGmrd2KjZt/Vq4T7UOTGInOikSlCAQvJdO2sCnU5gXosKqHoWRZ7
         LQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F7JFqzRXqxTzUkcqfAtcONZlOP60PRysVxN4UPvDiWY=;
        b=d6njNecz7KxE6s625N6JoKxqA7QeR2o1OHKutpGVXslf52CpGbTmzvkmaE8cXZMI4a
         j6L7UnIlyFonQBeBQ7kKEVKILh5nsG8F/tNwIEhv1TYvyXaSkm539WWjViKxZfEGUSLC
         C2lFayN0dlO2Qdck4aytcqS4aPRdfJTswtYnyLeSNSVHW3x7/qOuhyiJr1AcLz2850V1
         ZgHwvi+k/2oqa4HF4BZKn1QmnDoyBeacFqdAZDZ080K7JM7t2Gh6jeokiqnYq+fGFFd3
         STKDP0OpkrF1WQuOKSimHcuGBZWPxBG2wNdZju+IXz2u3DN06i7Xsfsz4Onr5Ew0WQRs
         TFbw==
X-Gm-Message-State: APjAAAUxHfm84D/Cjc7tWBsmbee0J29ttrM0yexztf3lAjvSJRm98oFQ
        aaAJdvx7UhCYIbasLf06ZZHwMw==
X-Google-Smtp-Source: APXvYqw8NhT159MurPvFHk3R1l30kN53m2i01B5nJXu+shJfFvrC3ZqblHtcDUP9f7bk5l1hA32vcA==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr2375159lfm.186.1562339108040;
        Fri, 05 Jul 2019 08:05:08 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id y4sm1433660lfc.56.2019.07.05.08.05.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 08:05:07 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v8 net-next 2/5] net: ethernet: ti: davinci_cpdma: add dma mapped submit
Date:   Fri,  5 Jul 2019 18:04:59 +0300
Message-Id: <20190705150502.6600-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
References: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
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

