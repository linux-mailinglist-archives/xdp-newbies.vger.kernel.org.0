Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83C0F5E1D6
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jul 2019 12:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGCKTN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jul 2019 06:19:13 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:45365 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfGCKTN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 3 Jul 2019 06:19:13 -0400
Received: by mail-lf1-f43.google.com with SMTP id u10so1351757lfm.12
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jul 2019 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NO88iVnC5CJGavQX1+oifd5FyeZJrmYwPjjZG7dx1kY=;
        b=xWYBTfuK3oxbaw2ihXoCR1u2W/q6BAnSu9cuBDvpQcBnRxJrqDr3icL3pTOdlndgs+
         QXqo/j3RtvVa44pp6toHXNoIlGVhbRYMfCOW8QQO2ghQ06fy4ypjGdNgj7T9Gi5S4nOH
         fDFkAFjhlOlGDQMVULlWzD8KpUv90CS0+hkcx7poj8wdLN0h+GvIUWY7wWwFh/2e/zKZ
         Th5PGNeqgL0oopeVwiQuJfIXZrkJ/8ZHoOdgNR+0vdq+sL/bAraUeu0UcPNrBlJaB9XP
         8/dgRutS7yeilCIy6OCRqECJt9lk/TMVy8V9XXmgTQE9iCu5K6dIjLmym3X+11dbFgqG
         0OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NO88iVnC5CJGavQX1+oifd5FyeZJrmYwPjjZG7dx1kY=;
        b=cAI/JKcbicMVBxOTrZfPufAQvYL/dQj/mz/FKmLmsaDJ1vqcizyG3ThSa1JeH1uRvN
         Usfltv+wlh1I/mErfGvRSYozZ75hMS5D+Nb2V123rusGmXKv+HXlRLrH6KhsgCzewcac
         Sy2Vxz7ZECnv2bLv++CZaCtxrYJzZM2Yf+14wIsGEfO0Qt5SBBrw+xU1XtR5zmVv3pCr
         iZdFk3jGK/EJTlhFM47Ta2buPBojSOeAxco5l76NT1XjwnBPMp7YNPNWXmyUJsvu6Vd3
         pVzqJJvOSUiJxtlenq4FrOCMmQX0zTERIJeK44vAYM3+orplPhDzGf3VIk9pQBsrqOMg
         ezAQ==
X-Gm-Message-State: APjAAAV6ojU3hZyEmLTsfl5q5uzmLNkGtNEgqokOhgaA0qXLcRDUNFzS
        yVwef5Y7CB5x76B5gFaGAjfIzA==
X-Google-Smtp-Source: APXvYqxC06UjWw2SW6NYQYT0yijU13JSgMPdhUYpNUqdexFnLlc+oZSHl50a1BIfRBYkHx0LORdolw==
X-Received: by 2002:ac2:419a:: with SMTP id z26mr14069127lfh.21.1562149150989;
        Wed, 03 Jul 2019 03:19:10 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id i9sm67267lfl.10.2019.07.03.03.19.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 03:19:10 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v6 net-next 3/5] net: ethernet: ti: davinci_cpdma: allow desc split while down
Date:   Wed,  3 Jul 2019 13:19:01 +0300
Message-Id: <20190703101903.8411-4-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

That's possible to set ring params while interfaces are down. When
interface gets up it uses number of descs to fill rx queue and on
later on changes to create rx pools. Usually, this resplit can happen
after phy is up, but it can be needed before this, so allow it to
happen while setting number of rx descs, when interfaces are down.
Also, if no dependency on intf state, move it to cpdma layer, where
it should be.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw_ethtool.c  |  9 ++++-----
 drivers/net/ethernet/ti/davinci_cpdma.c | 10 +++++++++-
 drivers/net/ethernet/ti/davinci_cpdma.h |  3 +--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index f60dc1dfc443..08d7aaee8299 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -664,15 +664,14 @@ int cpsw_set_ringparam(struct net_device *ndev,
 
 	cpsw_suspend_data_pass(ndev);
 
-	cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
-
-	if (cpsw->usage_count)
-		cpdma_chan_split_pool(cpsw->dma);
+	ret = cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
+	if (ret)
+		goto err;
 
 	ret = cpsw_resume_data_pass(ndev);
 	if (!ret)
 		return 0;
-
+err:
 	dev_err(cpsw->dev, "cannot set ring params, closing device\n");
 	dev_close(ndev);
 	return ret;
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 8da46394c0e7..4167b0b77c8e 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -1423,8 +1423,16 @@ int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr)
 	return ctlr->num_tx_desc;
 }
 
-void cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
+int cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
 {
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
 	ctlr->num_rx_desc = num_rx_desc;
 	ctlr->num_tx_desc = ctlr->pool->num_desc - ctlr->num_rx_desc;
+	ret = cpdma_chan_split_pool(ctlr);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	return ret;
 }
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.h b/drivers/net/ethernet/ti/davinci_cpdma.h
index 0271a20c2e09..d3cfe234d16a 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.h
+++ b/drivers/net/ethernet/ti/davinci_cpdma.h
@@ -116,8 +116,7 @@ enum cpdma_control {
 int cpdma_control_get(struct cpdma_ctlr *ctlr, int control);
 int cpdma_control_set(struct cpdma_ctlr *ctlr, int control, int value);
 int cpdma_get_num_rx_descs(struct cpdma_ctlr *ctlr);
-void cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc);
+int cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc);
 int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr);
-int cpdma_chan_split_pool(struct cpdma_ctlr *ctlr);
 
 #endif
-- 
2.17.1

