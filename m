Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965945B0F6
	for <lists+xdp-newbies@lfdr.de>; Sun, 30 Jun 2019 19:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfF3RYx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 30 Jun 2019 13:24:53 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34245 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbfF3RYY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 30 Jun 2019 13:24:24 -0400
Received: by mail-lj1-f194.google.com with SMTP id p17so10669021ljg.1
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Jun 2019 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uUkBROZO3WakB4095Sqlp9gekMGTEEFtZPkRqC6risY=;
        b=uM/mKdfkiRjikWMeGLjOxOlcNobeB2PCrFWOmSy/QtV7Zsq52w/Gy5oRsJqd9UggZx
         Lyqbs6ExkSsMzUjJETRoZDJXY9pMe1ZkHXh/R1sIIz8bLDB25qSz6F4DaVH7AV5+sHfv
         1f0baQOqGfw+PBMOv5dADsX+o3W+3Q9pVXtJZxc0JuS1lbsjXcAFAZwrnrTpSlBFh9XV
         J2uFs9tD8k66Q4XIjckj4WN9swTcCRH6y+n3LDHz0PrNP039e8YF3jWW6Js07RE7n/UE
         FuQufsOTvvgpChK2FKg0yDTuMqfV83AS8PjQfDie2BCSoqab9kPy56ScG9/FrQEDHLmq
         SDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uUkBROZO3WakB4095Sqlp9gekMGTEEFtZPkRqC6risY=;
        b=HmNVq8QBw42c0vnW5K6lgK8Ht29l0GwI8fcWM+YFi4hmM/MYRqZcs3u5ui3WEdqhvN
         2RBb82Ztx6kWQNTFypvSMtJh81Y87I7wjn+/LbsUgWetw4s8TcMmL8Tq5zURzhwpmdwZ
         8RID6t9njyEvAxETBevElCyvICG7fpApUVxzXAXtfgcqks5yiBDArfLQm6unIgLG88/C
         2CIui2aZvRM3aCpdhLVj94aJxlZB1w1LyFPovx8qbmRDifTJmvCuqyqefwJ/zSuncAcm
         xYPmBHCBab2QdbV8xkI9eNiLX2MWA0LDxBZTUCo6g/zhFzq3EOrTy9iMqp9WJ0wR6hp4
         5Eag==
X-Gm-Message-State: APjAAAWJLNbuCLNuYrio6oBuuk3QuY9FW8SmWsomR0QNGAOqwCCEC5RT
        qm/xv7448xQiv1t/Xm1g0EK1Fg==
X-Google-Smtp-Source: APXvYqwsL8R2TVbeV5aEhdmMQehA9L7CU1wJdpURGN5CoaeB4uTTKPZJDGH0IasikzP5ayeCPqfpow==
X-Received: by 2002:a2e:740a:: with SMTP id p10mr7897078ljc.19.1561915462387;
        Sun, 30 Jun 2019 10:24:22 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id c1sm2273795lfh.13.2019.06.30.10.24.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 10:24:21 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 4/6] net: ethernet: ti: davinci_cpdma: allow desc split while down
Date:   Sun, 30 Jun 2019 20:23:46 +0300
Message-Id: <20190630172348.5692-5-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
References: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
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
index 7c19eebbabcc..6ab0cec8560a 100644
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
index ea25b23c8058..7dc2c1ee6238 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -1427,8 +1427,16 @@ int cpdma_get_num_tx_descs(struct cpdma_ctlr *ctlr)
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
index aafa8889c789..df66b8c797ee 100644
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

