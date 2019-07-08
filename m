Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26DC562B13
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 23:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731672AbfGHVfH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 17:35:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35428 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404626AbfGHVel (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 17:34:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so10697135ljh.2
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7qz/APLz7I7SX2iw96+bUAJ1ELRKkJJTwc+HuPvzgEU=;
        b=xJsh55Tw8wSEJOG/LnODO2oV2ggkkhZmpd+yHJBnBhrICWL9AbA7DT9wwdyWIX+XoD
         6MHiaW4LwvqNu1nVC6hp5+APpJ+I9q6qOV0M3uRnHiDh3ynlOoEpF4/XNp/5EvAuagze
         UPx49jNDPPt7YMbhZNqHWBPuWDRz6h5yfHoPkcfMYm9Kus7Iv3FJj46PC6hg9MHS4Ae8
         CT93qsImJs7JCZ+G2rBm7htmfc5ueXAYrLawU5aHdwQEnpQd8Q0dyoft12fp/z2ooyeM
         UOOthITDRr817X1AMOxYbr5CxiBsqnIKaiRcmi0X/JLG7tYqd8BY7/qt4asNd7V63o94
         CMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7qz/APLz7I7SX2iw96+bUAJ1ELRKkJJTwc+HuPvzgEU=;
        b=mAfQ6jytsoc3UjmYAk3UZd5DNxeRs8QeRy8xXgVWYhBwf5BOznw5m/z0u0JiqSaN/Z
         Mwdkth3n3Vs6XBgrApvzWirzPjV8N7rnFOPq4nfa/knylGm2N6sn2yHoDTuiGc+n1KYL
         UK2fr7nA2TGYC7rztpHGpPXWG1sFJIYW+jJ3c4tk2JWZ1gnZA5lAxVet3uQe+49EhCZi
         A0joXpdOU/rPVbJ5jPOd9s5TKjQZjS3DBNN2LOSRNuqXMXUQxa8f9YDCG2WoAbx1pfWr
         9CGZJbkNth4823XUfZyqvMG6EzGhqq71+IishU9h+xUcBJi0TjXeuSI3mWaVAhhEypmW
         sblg==
X-Gm-Message-State: APjAAAWQRi5sTLQJ1uX8AQmJMJm5n9N9z+KzVWdw5hlHxQwCaH33MKiX
        eoVRQld9r+Mr4fSlYq1MoO1J+A==
X-Google-Smtp-Source: APXvYqx1bzJ349b0nUDGfiZacC6DYBYgyqNiEdc+yhPKeeLRjwO8YqDN7ViWOQWxWclESGhkb59tbg==
X-Received: by 2002:a2e:7619:: with SMTP id r25mr11413154ljc.199.1562621679892;
        Mon, 08 Jul 2019 14:34:39 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id o24sm3883096ljg.6.2019.07.08.14.34.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:34:39 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v9 net-next 3/5] net: ethernet: ti: davinci_cpdma: allow desc split while down
Date:   Tue,  9 Jul 2019 00:34:30 +0300
Message-Id: <20190708213432.8525-4-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
References: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
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
 drivers/net/ethernet/ti/cpsw_ethtool.c  | 17 +++++++++++------
 drivers/net/ethernet/ti/davinci_cpdma.c | 17 ++++++++++++++++-
 drivers/net/ethernet/ti/davinci_cpdma.h |  3 +--
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index f60dc1dfc443..c477e6b620d6 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -650,7 +650,7 @@ int cpsw_set_ringparam(struct net_device *ndev,
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
 	struct cpsw_common *cpsw = priv->cpsw;
-	int ret;
+	int descs_num, ret;
 
 	/* ignore ering->tx_pending - only rx_pending adjustment is supported */
 
@@ -659,20 +659,25 @@ int cpsw_set_ringparam(struct net_device *ndev,
 	    ering->rx_pending > (cpsw->descs_pool_size - CPSW_MAX_QUEUES))
 		return -EINVAL;
 
-	if (ering->rx_pending == cpdma_get_num_rx_descs(cpsw->dma))
+	descs_num = cpdma_get_num_rx_descs(cpsw->dma);
+	if (ering->rx_pending == descs_num)
 		return 0;
 
 	cpsw_suspend_data_pass(ndev);
 
-	cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
+	ret = cpdma_set_num_rx_descs(cpsw->dma, ering->rx_pending);
+	if (ret) {
+		if (cpsw_resume_data_pass(ndev))
+			goto err;
 
-	if (cpsw->usage_count)
-		cpdma_chan_split_pool(cpsw->dma);
+		return ret;
+	}
 
 	ret = cpsw_resume_data_pass(ndev);
 	if (!ret)
 		return 0;
-
+err:
+	cpdma_set_num_rx_descs(cpsw->dma, descs_num);
 	dev_err(cpsw->dev, "cannot set ring params, closing device\n");
 	dev_close(ndev);
 	return ret;
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 4e693c3aab27..0ca2a1a254de 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -1423,8 +1423,23 @@ int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr)
 	return ctlr->num_tx_desc;
 }
 
-void cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
+int cpdma_set_num_rx_descs(struct cpdma_ctlr *ctlr, int num_rx_desc)
 {
+	unsigned long flags;
+	int temp, ret;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+
+	temp = ctlr->num_rx_desc;
 	ctlr->num_rx_desc = num_rx_desc;
 	ctlr->num_tx_desc = ctlr->pool->num_desc - ctlr->num_rx_desc;
+	ret = cpdma_chan_split_pool(ctlr);
+	if (ret) {
+		ctlr->num_rx_desc = temp;
+		ctlr->num_tx_desc = ctlr->pool->num_desc - ctlr->num_rx_desc;
+	}
+
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

