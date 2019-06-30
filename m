Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B975B0FA
	for <lists+xdp-newbies@lfdr.de>; Sun, 30 Jun 2019 19:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfF3RZD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 30 Jun 2019 13:25:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35955 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbfF3RYV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 30 Jun 2019 13:24:21 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so10656682ljj.3
        for <xdp-newbies@vger.kernel.org>; Sun, 30 Jun 2019 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nq/Fr5ga9FfpVS/76WeiZ/F4W2Ps3KMUrYs9XpFLQ9U=;
        b=m1JAM7jxFgTTz626vancR3myj2YTI3HwhDD7dSUSDqSEUDyxH1XHZ2EEnLnVnn/qlI
         YxSSLoc73DU2PCt2xfh0xIbhq8klGUM3v+ZbDDWMneprkyzGABPoZ9ctMMwlzF/cYrLd
         MHbdR4Xcp2TpPZoh6TmEHa44MAwIwgYPTkCCr0wBB4eKg7uraRSZqVf1KsXxDrGMJOZW
         1AJMRLsbfzeQUpxusMQ1wf45FSQ3uFsbOtWgDZiPIXZWVPzGKN3Vijin3G4TZLwCdoZf
         FOe6jeR/5X8iTXcM/2nuyvN/TIBJfK+DfL9aKDLwROpfrywo0umBSH0RbhSBRd9QleH+
         eMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nq/Fr5ga9FfpVS/76WeiZ/F4W2Ps3KMUrYs9XpFLQ9U=;
        b=EtbuhQzk5HZUX4yyDjjSaAiKaijSAYKovk3TAipxQoNIuNmxF8ubTCzbdSw2oRDdNL
         5SwGJYDrkL3z6m9vF8d2BDpSJcCfCmnzg9QHcZ9N1lrEmgCsV41yDuVC7yjIIlx0C85U
         tOupjEPyh2HOtBY1Ns7bfDfZrt2+7OdfgsgJZKwkQ4ZE3hN4kuClZ1f2Sn2Pbnrc64xS
         WPsVDmXFVzaf+7C8qW6UN3P7GqF01AWcINzheZDDHI5bfuS3hKm0KXQRI1BzMFioyuZR
         MfSEGYzb/dMveg1BdHn9t5avrxUODB6zxHraEO6EkYN0L+Z599sMDJCHkHYtJRgmSY1L
         +E/A==
X-Gm-Message-State: APjAAAXVzXf7iqESIkX1tZtQWEsSsF5DrNzJ6q/k/WD5MrGuIvWYE4mQ
        DQpZlQIrX1NzaUAUJRqSxFCFiw==
X-Google-Smtp-Source: APXvYqzXmPkPa9jeYtmnG7N/HecA9UovGa5vhR7RygW3HsNln2nuwphpbqFOO2/41bTIpk6LVbkBng==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr9598881ljq.184.1561915458893;
        Sun, 30 Jun 2019 10:24:18 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id c1sm2273795lfh.13.2019.06.30.10.24.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 10:24:18 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 1/6] xdp: allow same allocator usage
Date:   Sun, 30 Jun 2019 20:23:43 +0300
Message-Id: <20190630172348.5692-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
References: <20190630172348.5692-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

XDP rxqs can be same for ndevs running under same rx napi softirq.
But there is no ability to register same allocator for both rxqs,
by fact it can same rxq but has different ndev as a reference.

Due to last changes allocator destroy can be defered till the moment
all packets are recycled by destination interface, afterwards it's
freed. In order to schedule allocator destroy only after all users are
unregistered, add refcnt to allocator object and schedule to destroy
only it reaches 0.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 include/net/xdp_priv.h |  1 +
 net/core/xdp.c         | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/net/xdp_priv.h b/include/net/xdp_priv.h
index 6a8cba6ea79a..995b21da2f27 100644
--- a/include/net/xdp_priv.h
+++ b/include/net/xdp_priv.h
@@ -18,6 +18,7 @@ struct xdp_mem_allocator {
 	struct rcu_head rcu;
 	struct delayed_work defer_wq;
 	unsigned long defer_warn;
+	unsigned long refcnt;
 };
 
 #endif /* __LINUX_NET_XDP_PRIV_H__ */
diff --git a/net/core/xdp.c b/net/core/xdp.c
index b29d7b513a18..a44621190fdc 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -98,6 +98,18 @@ bool __mem_id_disconnect(int id, bool force)
 		WARN(1, "Request remove non-existing id(%d), driver bug?", id);
 		return true;
 	}
+
+	/* to avoid calling hash lookup twice, decrement refcnt here till it
+	 * reaches zero, then it can be called from workqueue afterwards.
+	 */
+	if (xa->refcnt)
+		xa->refcnt--;
+
+	if (xa->refcnt) {
+		mutex_unlock(&mem_id_lock);
+		return true;
+	}
+
 	xa->disconnect_cnt++;
 
 	/* Detects in-flight packet-pages for page_pool */
@@ -312,6 +324,33 @@ static bool __is_supported_mem_type(enum xdp_mem_type type)
 	return true;
 }
 
+static struct xdp_mem_allocator *xdp_allocator_get(void *allocator)
+{
+	struct xdp_mem_allocator *xae, *xa = NULL;
+	struct rhashtable_iter iter;
+
+	mutex_lock(&mem_id_lock);
+	rhashtable_walk_enter(mem_id_ht, &iter);
+	do {
+		rhashtable_walk_start(&iter);
+
+		while ((xae = rhashtable_walk_next(&iter)) && !IS_ERR(xae)) {
+			if (xae->allocator == allocator) {
+				xae->refcnt++;
+				xa = xae;
+				break;
+			}
+		}
+
+		rhashtable_walk_stop(&iter);
+
+	} while (xae == ERR_PTR(-EAGAIN));
+	rhashtable_walk_exit(&iter);
+	mutex_unlock(&mem_id_lock);
+
+	return xa;
+}
+
 int xdp_rxq_info_reg_mem_model(struct xdp_rxq_info *xdp_rxq,
 			       enum xdp_mem_type type, void *allocator)
 {
@@ -347,6 +386,12 @@ int xdp_rxq_info_reg_mem_model(struct xdp_rxq_info *xdp_rxq,
 		}
 	}
 
+	xdp_alloc = xdp_allocator_get(allocator);
+	if (xdp_alloc) {
+		xdp_rxq->mem.id = xdp_alloc->mem.id;
+		return 0;
+	}
+
 	xdp_alloc = kzalloc(sizeof(*xdp_alloc), gfp);
 	if (!xdp_alloc)
 		return -ENOMEM;
@@ -360,6 +405,7 @@ int xdp_rxq_info_reg_mem_model(struct xdp_rxq_info *xdp_rxq,
 	xdp_rxq->mem.id = id;
 	xdp_alloc->mem  = xdp_rxq->mem;
 	xdp_alloc->allocator = allocator;
+	xdp_alloc->refcnt = 1;
 
 	/* Insert allocator into ID lookup table */
 	ptr = rhashtable_insert_slow(mem_id_ht, &id, &xdp_alloc->node);
-- 
2.17.1

