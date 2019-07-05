Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44CAC608AC
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2019 17:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfGEPFP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jul 2019 11:05:15 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:37520 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfGEPFM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jul 2019 11:05:12 -0400
Received: by mail-lf1-f49.google.com with SMTP id c9so4789022lfh.4
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jul 2019 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=oDfE98kPmAv8olG5EU/cTLrPDhDZJWfBTXlVneiTLeFEQ9KVnwf7eKt2hlFFPocvxy
         uUe6nfw3ViFwp6yvmIysmpnO+k9Wu4fTfhs3b2tq6dQfOoYCsExy7L4KNXeqdLhAdPB+
         1TD/0Ae8V6EAMs6Bp058Iot84/ZdoxMc4KMgSAsQU52JUMJJXwvWaGJClgWF6teMbUBo
         uxIthothA0rkhAtBjhsvVdG0aikqWxw7xh3yzReaMfq/gpNokRVaTVAT2x/zMcsjRGHC
         9G5We3AuyDNiOJXRYSYb0VMqaQpmIp1a2feZzkvQOtBADs5UthlrQM8CmV6gNxnsdfwn
         h3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h0qJMdNciD39g3Q1jo3+1MbbNG9llP7wamgm8+ijc+0=;
        b=X3MHK7EOQi66ikWebStBsFslj+VRfFmLflznx402JK8XecMGt8o0UTeNXaAx/cGp/J
         eQ0NqXITszqqIbZe3LGAoHDSHjk1lb6pGGS6edpZJ8Z/oh2AV6a0iDK/TC2PWFXO+mLz
         USLtBBN+H+dgt4EAu4ZtK58rcr7FZvEc1R3GAAFQCMXNfphQxofNT1CvpGnNBZ/2Gft+
         LmHBD6cfCRdFWfqSsfet/7+nLPmqAGEZRS9HbZedHyxsc7pQgopbSJ0HXiUoTvg41BeN
         0N2b+RqB2tMzl84FtzFDItQINRL9jVzHkq5tgt74HPjkQY4HvM7emCtVbm0AK2kPJUmo
         ahRw==
X-Gm-Message-State: APjAAAXReDvmH71xtYApOUIs7bBY6tEYqu60GzUQ5baU8xqD6jNDEroy
        HbKuqjI6Y6LkaZ7fFAGyKFznVA==
X-Google-Smtp-Source: APXvYqzQfwbBeTQKyZdYAG35Uh8Vra3vPjcNMNKZk9DOT4QKJnpXvwesQAlh7D0yawCUdKeVyP7mGA==
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr2285518lfp.61.1562339110625;
        Fri, 05 Jul 2019 08:05:10 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id y4sm1433660lfc.56.2019.07.05.08.05.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 08:05:10 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v8 net-next 4/5] net: ethernet: ti: cpsw_ethtool: allow res split while down
Date:   Fri,  5 Jul 2019 18:05:01 +0300
Message-Id: <20190705150502.6600-5-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
References: <20190705150502.6600-1-ivan.khoronzhuk@linaro.org>
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

