Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847D85E1D0
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jul 2019 12:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfGCKTP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jul 2019 06:19:15 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:46301 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbfGCKTO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 3 Jul 2019 06:19:14 -0400
Received: by mail-lf1-f42.google.com with SMTP id z15so1345204lfh.13
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jul 2019 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lLtsucvsZ+6X8j0YIBVtyEFlEwonh01weVxKZ0zmUeo=;
        b=N7ahiyVGoCj6eyemjVWc1fXvSVIP0KHaciHhTwSFTsbnUHHmrTZhhuTHqvv7iR9bDE
         vd3mUe7tU/W3eQ6o/wiHvs0R0HzLxmxNSpnHerJNNYG814T2ZRQ7GlkOpIWGTV/IzuRK
         nL9YkAbW+wayvAuV2n2jtKfE4VF+JD920R1oIYrfdHvirX+Fbeos3qMyL1+iFAyIkqYt
         GjkPd8UTGNJVbd4L7zyC3LYt4XIPN1Z3DcW6F0kJYRzX9v2nHAq44d/v0M41JFP5Do3G
         H4nSozx35eosQr2qUMntLb+qqwcsDt5S5cgwJ2kpkfUcUiX0pqgI7WAmMkgK5iNzqAht
         uOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lLtsucvsZ+6X8j0YIBVtyEFlEwonh01weVxKZ0zmUeo=;
        b=NYIx0s/xq4lATyczHKzL5hbD0pGS3FziJxGNa0VVI21A6DSMU43m1lRc+16D0juAA5
         t9enGx8i+ZocHXnzOqp73a7FSq9fjiy5ZPnYvm6BS48MYjranxKR8EL8NUJQgWSFFRo6
         87fHutLiHCIRWsYbXQ9zdzZnzoO7wV2qFtX6cyPHjLXlrXaIGODE/2+4dtYxFOTnwsM1
         umCDD7HcTt9r9g+veeEGM23rpXoSoJob5tN8nV0vhDy31tg1Ir7E0u9POqax1yoG29Np
         KeZ8Z46N39ScH6SBnjPTsAOZbN2W3ukrTSNH6hKHaB8A3hgn0jfBlX5tq9WMBu94hruP
         fbgw==
X-Gm-Message-State: APjAAAXr4mtUOn1k77aISVJp+oZmE96U8Jo4elgJSsQcg2dnx7vMpHyC
        LIBKyKDQz6NfiudbgCSwWBSxQQ==
X-Google-Smtp-Source: APXvYqw2TVQ/OpZSIQ7ZVajMAp1wWmK6ttP1QNBOQdxDKKL9IzYtVPd2gowk6D1qC0zJAdGxOrv0wQ==
X-Received: by 2002:ac2:5225:: with SMTP id i5mr17389550lfl.157.1562149152126;
        Wed, 03 Jul 2019 03:19:12 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id i9sm67267lfl.10.2019.07.03.03.19.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 03:19:11 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v6 net-next 4/5] net: ethernet: ti: cpsw_ethtool: allow res split while down
Date:   Wed,  3 Jul 2019 13:19:02 +0300
Message-Id: <20190703101903.8411-5-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
References: <20190703101903.8411-1-ivan.khoronzhuk@linaro.org>
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
index 08d7aaee8299..fa4d75f5548e 100644
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

