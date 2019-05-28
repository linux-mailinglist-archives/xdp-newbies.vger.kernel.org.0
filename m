Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48E02CEEF
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 May 2019 20:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfE1Sru (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 May 2019 14:47:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41499 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfE1Sru (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 May 2019 14:47:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id z3so6893772pgp.8
        for <xdp-newbies@vger.kernel.org>; Tue, 28 May 2019 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jW23EVTaONU8fGl2rO/gh8exrFRja4BdXSBKXyg60v0=;
        b=uurnpCfsYtTcOD+DDoo5/vvROcC25DPkJZQVnOHa1NtI+Y6CdsSZ18Jv0TzrpPV2M4
         RizCON6yrAu71UY9bjyfxW/OSZCszU5Z/Mc3qMd1fAdIOZg7Z22XzJFxHKhCYMcpUsIV
         XftRLJs192LBdmYKLdJRVINTMeeo0DruiEz40QHbXnAsJhVPcoOL6KfpGT5BI/0s0u19
         7UIABKC9gP2BX55+S2FpM82c3I0BoWAUstiXoi3nVp6I0iPkzy1vBrWVMJ8t9nT4WtMA
         HZUxjSWSeVBQbuisIm4dX5dPs8pMuPNJbHcXwNn8wfrf+xwRD6rOLi1AdqTdaqUcblEy
         S8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jW23EVTaONU8fGl2rO/gh8exrFRja4BdXSBKXyg60v0=;
        b=WbI7k77jMHJVig7ey87KoYCKIy6tARS+qj+drWZCCifXmVKRt++kS5hfo8pBoDupWO
         gjvwDOlWh+buNgJ8VYH6SOyt5cLvdVJdbfddHB4w5vnTG8QF9V011Cjf7pWfml5vElq9
         OrY6IijJXa0H9paCNtF5peTmMxS6uLp/8sAKhIvHXOgc1us+ZepE0MWDz624nLk8UsJD
         Xx/IVHb9T9ptZtQpp1j37LJu+Eqtpr3xmlFykYqoIdmuhcCWCM2dcID6s85FZYuky//j
         HHYAZeiWi4T1dhFAsMbYU5xSsrBUr7bI7gSg5vxXo2jyeqFeacb4DMQYjtp6YdQq1Kqz
         KXlg==
X-Gm-Message-State: APjAAAV2VI4IIIND/zkGB5+3VI/dvyCN1OGiUJ+o1QE4Q3i/c94iL/+4
        6OtX4pPwHs+urUkyu5SsUrP7qAPn+ao=
X-Google-Smtp-Source: APXvYqy8fD6xjAOYZRBAhKNbtsp/4z1yBh/JvX0ohy5Hx7W/1qso4HPAiE3tLai2iVeCXys7xYS3Kg==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr134329271pgl.103.1559069269408;
        Tue, 28 May 2019 11:47:49 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id n12sm14213608pgq.54.2019.05.28.11.47.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:47:48 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
X-Google-Original-From: Stephen Hemminger <sthemmin@microsoft.com>
To:     davem@davemloft.net, saeedm@mellanox.com, jasowang@redhat.com,
        brouer@redhat.com
Cc:     netdev@vger.kernel.org, xdp-newbies@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>
Subject: [PATCH PATCH v4 1/2] netvsc: unshare skb in VF rx handler
Date:   Tue, 28 May 2019 11:47:30 -0700
Message-Id: <20190528184731.7464-2-sthemmin@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528184731.7464-1-sthemmin@microsoft.com>
References: <20190528184731.7464-1-sthemmin@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The netvsc VF skb handler should make sure that skb is not
shared. Similar logic already exists in bonding and team device
drivers.

This is not an issue in practice because the VF devicex
does not send up shared skb's. But the netvsc driver
should do the right thing if it did.

Fixes: 0c195567a8f6 ("netvsc: transparent VF management")
Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
---
 drivers/net/hyperv/netvsc_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index 06393b215102..9873b8679f81 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -2000,6 +2000,12 @@ static rx_handler_result_t netvsc_vf_handle_frame(struct sk_buff **pskb)
 	struct netvsc_vf_pcpu_stats *pcpu_stats
 		 = this_cpu_ptr(ndev_ctx->vf_stats);
 
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (unlikely(!skb))
+		return RX_HANDLER_CONSUMED;
+
+	*pskb = skb;
+
 	skb->dev = ndev;
 
 	u64_stats_update_begin(&pcpu_stats->syncp);
-- 
2.20.1

