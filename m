Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C37CA62B10
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2019 23:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404817AbfGHVfB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Jul 2019 17:35:01 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:39846 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404664AbfGHVen (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 8 Jul 2019 17:34:43 -0400
Received: by mail-lf1-f52.google.com with SMTP id v85so8989114lfa.6
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2019 14:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=ui6Ji331Gj4iwXnkewrzPZ/m3RPsSXRJWkE7ReaRNP99ArpS/s3Y8NOJ1YBuphMqgG
         hs2b/ERPkCcI5cCgjFjbBnM6cgvYsVSaH2tw5e372IW2I8kz+60ZaJLQtuYXv6EYA8UN
         /o8YBdjETAyImMGUap37phy9QX7QkvEk55lFo7E9i91UC8z9XsIZXV5QaP20y7X8MGXf
         2AfVXtFI887KCOJ3BIENfyL44EuD5nDPFaTfwfUy8sIK6I4H3VYBMjInQZrs3lqxF7iO
         RhQkAaavW480NkS+JEwqB6/IA8a9708QIoYKU8cdZ5fvQDX7T32VI/loHpxbusuvIqHr
         3Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=BDY7KwrKaFTEI01rgUlW1xqnvTWk/bhvPQg2bDzqrtSWfRsQBMX/ubXBs/vooCIPJ1
         aL6PKNi0orxgiCX46bCnMy7me4ZIr9lj9dMshzpA2WeiP5RFj6zdvVmfkw2Lt6wzP5CG
         TDK/xbWM87nGmVBRdvfki2XUSDHr49L7EG16qB9ogIg++IiO7aKK/eTNfMWcbsofUymZ
         MFxQiTFD+da60lQFH4vPghNVsaYo1k2B9JcajMBDMERrevf70m/Y7Sg+P0xWq2vqsIZM
         UCLuWBimH2eoMG53+4lef2L+e+Me84KRA981kpg1rqHmFxUQUmEmCAPmnvxilxNmbcNF
         PEpA==
X-Gm-Message-State: APjAAAUCZ09ZVWuKAtYvy+nr6s/VhQpvDA2qXUHzCYWad6eKGe/gzqc1
        Ym9VGxLuIxZjYDbqJWNMTxMtZQ==
X-Google-Smtp-Source: APXvYqzOK7r1sVzrmHhyBFjRJhnHfySDAsEp640O12i3UrVbcpz4hCXQcS/+sBymbE8pSsVmHAP1UQ==
X-Received: by 2002:a19:c150:: with SMTP id r77mr10408764lff.76.1562621681121;
        Mon, 08 Jul 2019 14:34:41 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id o24sm3883096ljg.6.2019.07.08.14.34.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:34:40 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v9 net-next 4/5] net: ethernet: ti: cpsw_ethtool: allow res split while down
Date:   Tue,  9 Jul 2019 00:34:31 +0300
Message-Id: <20190708213432.8525-5-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
References: <20190708213432.8525-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

That's possible to set channel num while interfaces are down. When
interface gets up it should resplit budget. This resplit can happen
after phy is up but only if speed is changed, so should be set before
this, for this allow it to happen while changing number of channels,
when interfaces are down.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw_ethtool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index c477e6b620d6..e4d7185fde49 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -620,8 +620,7 @@ int cpsw_set_channels_common(struct net_device *ndev,
 		}
 	}
 
-	if (cpsw->usage_count)
-		cpsw_split_res(cpsw);
+	cpsw_split_res(cpsw);
 
 	ret = cpsw_resume_data_pass(ndev);
 	if (!ret)
-- 
2.17.1

