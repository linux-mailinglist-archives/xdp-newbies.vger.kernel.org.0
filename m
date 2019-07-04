Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7B95FE96
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 01:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbfGDXOj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jul 2019 19:14:39 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43944 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727680AbfGDXOi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jul 2019 19:14:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so5089860lfk.10
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2019 16:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=kQHpY4yAX9tuFqi39cDVI528gNTKLvGMgp0fqlEEE4DscT2m11B0xfPLDzS1j+aNlZ
         UGMk4PmMzG9FjNTsoVkPBdsX5iAy54gTqfhQ/kkz1CJfRr6/yZPK6hdSNfh52Ye2n2Z/
         7K1NL3GmJfoDXyyJRppCGfHFJcBQmsQ46cOe6yjy7ZT9VnXN/dCd6d5C5H+OXYUSIcU/
         HA/ERprLUpxQi6I5rKcKODbM6zC6zJ89Q9AXb1sKtMe4+xhPbdzfhVvc/TrPTPHtcCHR
         IOCXKtNAOOOZ5q4fu+AHhPqh1/fAlMu7ALbCkPIvW8scV45AIsE51nY0Q9hCsrzhCYk6
         NKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=ppLYoAkAE4fJoIb3iO1MMgnWwfFlR1/mWXSLZtrG9bMAi9CyVy0gc/SpL/t5fCTVcz
         EWtz7jkeOFokw7S8jD5grM0oJrV+R3qhmmH9CkHv7ei1moZ185V/mw5N/73UVhv3DJav
         163oP403FRCbLo02NY5eB8XK/3ERcyGst/bg/5OPtF5EACl926x98OW9DN2nUfpQRg2s
         /wI4QAPYPsdcrGgKcpHSqTDc5HYFhvE2sxVcLN+0h7e9s0MZge0vh4E1ZO9QeKpNA4CP
         wuN9CQN6ci+pfb/WcEcjUlNi1XJm1MVitdPTgGkJ453dL2KVE/Z5SN3sWPz54q+ZE64L
         984A==
X-Gm-Message-State: APjAAAX2TS1ELb5JKDrFLFEUcPcdaG27cVLHeUO0QOPh5LmWP4zWkRVm
        5/934aQtjbK358ZWRl7ISrXMww==
X-Google-Smtp-Source: APXvYqzfalFMVIaHNS8AIz3ENvdFXkSmu5akxzmRLBfyyInkhLR4IJea8MvWY4XesoVIHHVkHIME8g==
X-Received: by 2002:a05:6512:70:: with SMTP id i16mr413464lfo.26.1562282076772;
        Thu, 04 Jul 2019 16:14:36 -0700 (PDT)
Received: from localhost.localdomain ([46.211.39.135])
        by smtp.gmail.com with ESMTPSA id q6sm1407269lji.70.2019.07.04.16.14.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 16:14:36 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v7 net-next 4/5] net: ethernet: ti: cpsw_ethtool: allow res split while down
Date:   Fri,  5 Jul 2019 02:14:05 +0300
Message-Id: <20190704231406.27083-5-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704231406.27083-1-ivan.khoronzhuk@linaro.org>
References: <20190704231406.27083-1-ivan.khoronzhuk@linaro.org>
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

