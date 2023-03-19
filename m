Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859076C05F3
	for <lists+xdp-newbies@lfdr.de>; Sun, 19 Mar 2023 23:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjCSWIj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 19 Mar 2023 18:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjCSWIi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 19 Mar 2023 18:08:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5C21207A
        for <xdp-newbies@vger.kernel.org>; Sun, 19 Mar 2023 15:08:28 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m35so6333966wms.4
        for <xdp-newbies@vger.kernel.org>; Sun, 19 Mar 2023 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fr24.com; s=google; t=1679263707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VF6kF1o1a7cu8qLgevPU4rykmBSUA6+nY/q/8AQKG+s=;
        b=W5Ge3+1yMdXtDqoI1dsxoAzFmUHVHc3DWSKGGAq4YRBPegmZ5ByBDYS8IVaWKXQSN0
         Vxjg/hV8MD2+X16iYhT/iozVqmuIoKt7rCNFr2uGZK9w63czAdpXXZctbfWM5NKiYW82
         8IpsFKlj2/211WI+6vNa0u0MfnOrRZQUE6GfDVyuGz8oZdAAZ3e4IWRZJA6mLcoW/M7V
         VaJAgtCegrYxyKEuZf5DflMyrBF/Wh72nTNdedzzKiLKTkOoFJVYE+9fnK2DFa+G2oNH
         ds7YJX2zz/Dfc5V2+/XEmLiP1ahR1a0nkq/zaXr7MQ8o2HDYtxxHQ2hKyi0AR/fgXw9F
         PClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679263707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF6kF1o1a7cu8qLgevPU4rykmBSUA6+nY/q/8AQKG+s=;
        b=tZGKnbKoyo33EoS1xjUC0hVRSLl0cytZw7UV9Rmm8yHqzVM34AiuEcMBALFmBPnhUp
         t/gafY03sqCDZXeTdi5ijoZMZhOV7L13fh0+oaBwXb6J97hgbkZnka0m4LeFoEWGfqI2
         Fq0YW0676DXfy8um8GBNLfYm3jgnZmIniPvBfShAMwBvaIhPjnpAStKjAY4O3RfPl8K9
         i42y7p7kSNnTR5tZLinWu89l2fuCd/Z3u3jSVl1O3JyrMbpmkF5u5uH8IlRh92Q/CPJH
         1fqsWRgNBFyJLZ+ovx4ojVEnr1X4r6BGbwSjUmzsmixQ1XmuLTput5spVHqKchQ5VGh+
         2NDg==
X-Gm-Message-State: AO0yUKVtEMWFj0RdLsNNpY+60Cm/Z/XtQ1Ug4SeQUDxLvFQ9jsTrs8Wb
        1V6AqIg402qjFfuOejyb/r4ZGyoRDVwBQ31kYwNckg==
X-Google-Smtp-Source: AK7set+/YtdgmNKKUtllWNIFhiiVqf/gAREFbBw+6Whcm54QaD6Jicfa7Lbr4HFEPYRcFydRJF4pdQ==
X-Received: by 2002:a7b:c416:0:b0:3ed:e2e6:8ddb with SMTP id k22-20020a7bc416000000b003ede2e68ddbmr1905440wmi.35.1679263707154;
        Sun, 19 Mar 2023 15:08:27 -0700 (PDT)
Received: from sky20.lan (bl20-118-143.dsl.telepac.pt. [2.81.118.143])
        by smtp.googlemail.com with ESMTPSA id t25-20020a1c7719000000b003ecc64edf7esm8631636wmi.39.2023.03.19.15.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 15:08:26 -0700 (PDT)
From:   =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
To:     xdp-newbies@vger.kernel.org, magnus.karlsson@intel.com
Cc:     =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Subject: [PATCH] xsk: allow remap of fill and/or completion rings
Date:   Sun, 19 Mar 2023 22:08:11 +0000
Message-Id: <20230319220811.165506-1-nunog@fr24.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The remap of fill and completion rings was frowned upon as they
control the usage of UMEM which does not support concurrent use.
At the same time this would disallow the remap of this rings
into another process.

A possible use case is that the user wants to transfer the socket/
UMEM ownerwhip to another process (via SYS_pidfd_getfd) and so
would need to also remap this rings.

This will have no impact on current usages and just relaxes the
remap limitation.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
---
 net/xdp/xsk.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 2ac58b282b5eb..2af4ff64b22bd 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1300,10 +1300,11 @@ static int xsk_mmap(struct file *file, struct socket *sock,
 {
 	loff_t offset = (loff_t)vma->vm_pgoff << PAGE_SHIFT;
 	unsigned long size = vma->vm_end - vma->vm_start;
+	int state = READ_ONCE(xs->state);
 	struct xdp_sock *xs = xdp_sk(sock->sk);
 	struct xsk_queue *q = NULL;
 
-	if (READ_ONCE(xs->state) != XSK_READY)
+	if (!(state == XSK_READY || state == XSK_BOUND))
 		return -EBUSY;
 
 	if (offset == XDP_PGOFF_RX_RING) {
@@ -1314,9 +1315,11 @@ static int xsk_mmap(struct file *file, struct socket *sock,
 		/* Matches the smp_wmb() in XDP_UMEM_REG */
 		smp_rmb();
 		if (offset == XDP_UMEM_PGOFF_FILL_RING)
-			q = READ_ONCE(xs->fq_tmp);
+			q = READ_ONCE(state == XSK_READY ? xs->fq_tmp :
+							   xs->pool->fq);
 		else if (offset == XDP_UMEM_PGOFF_COMPLETION_RING)
-			q = READ_ONCE(xs->cq_tmp);
+			q = READ_ONCE(state == XSK_READY ? xs->cq_tmp :
+							   xs->pool->cq);
 	}
 
 	if (!q)
-- 
2.40.0

