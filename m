Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2643558FBB0
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Aug 2022 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiHKLzt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Aug 2022 07:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbiHKLzt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Aug 2022 07:55:49 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232A391D30
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 04:55:48 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k17so2484156wmr.2
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=kErmYbZ+52FQDk2zeNDJRO+i7YB6oaFxEENBMPuk24o=;
        b=XtqHDvvdJxjIY6u4325FeYkS3l5FruEpk7iiue14+wSB9IL+E0E2bXCnRlYi9CwhOx
         GzAqf26OLcSiIZgaU3tRZ5ld5qwz3ITMRd0OEh4W4iCphH6JE34b0MoHoi5vr9NXQeJD
         qIXWgGooy/p99wGuQ3pvEpw/Prf47svhbi4Zu+3I5zXByWsrEiWaFfw6LFJwUSFiyl1q
         feo1EVApqFjVOyj5dnA2UROKyxmGmQK7ZIT7gs/LcfWa80EmCQaFglmk5nrKV91/RVD0
         HJQ4Cjui3Uir6CNS9EyvxKGAh9Ml+cJgIZvaBN6D0cAClDOTMyjhBfGcERhi+MHgQMJc
         xliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kErmYbZ+52FQDk2zeNDJRO+i7YB6oaFxEENBMPuk24o=;
        b=BTESPU2qBwTYl76w0wDUrsH1XfMM1F2tAhVXzBOixXA+LK+v3SWCdX4IKBLfpgtfLd
         CRZ15lV7I9y+jcFLRYdt/ANSSVKhhdWC455CwCJavsYmU57QsY9NlanAnbh0QdMtDmQI
         lIb84Wy/z0VmE/OL2iyO0/EhdqvwGI4VBuLrR5+u0PAa0WlsfPfgnKXonttMKVl/Achq
         CQOq+ARuCHMshzzxo/6ptxoVdFqbqgScAub4Aj81qqcbKFvdIQDJ0X6rcofTlFVlT5Pc
         HeAZk51Pi1TEhDYiuhXaCE26H0IjnfoI3M1G8FxB7ixaJsSANQHnlH0IQ+YoD7/+mKht
         SxGA==
X-Gm-Message-State: ACgBeo2CJ821rLzFqJk/71TY6C2Rn+Yulw+WCwICPpMJyXaiWF4znrRP
        b3k4v7VSLIzGuWzFAGbwbi/VM8bzd8/wLw9l
X-Google-Smtp-Source: AA6agR47mOxywzrhmUg8rVeMkSgsplXx21LlbNMefC8YRPBTpaJgRdAmWUC0zVbNY6BRn+7Zh0Sj3g==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id bi17-20020a05600c3d9100b003a54132b6a0mr5148509wmb.126.1660218946575;
        Thu, 11 Aug 2022 04:55:46 -0700 (PDT)
Received: from localhost.localdomain (c-5eea60cf-74736162.cust.telenor.se. [94.234.96.207])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d5551000000b0021e4f595590sm19107353wrw.28.2022.08.11.04.55.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Aug 2022 04:55:45 -0700 (PDT)
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
To:     magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
        xdp-newbies@vger.kernel.org
Cc:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Subject: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Date:   Thu, 11 Aug 2022 13:55:23 +0200
Message-Id: <20220811115523.30742-1-magnus.karlsson@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

From: Magnus Karlsson <magnus.karlsson@intel.com>

Fix an issue in XDP_SHARED_UMEM mode together with aligned mode were
packets are corrupted for the second and any further sockets bound to
the same umem. In other words, this does not affect the first socket
bound to the umem. The culprit for this bug is that the initialization
of the DMA addresses for the pre-populated xsk buffer pool entries was
not performed for any socket but the first one bound to the umem. Only
the linear array of DMA addresses was populated. Fix this by
populating the DMA addresses in the xsk buffer pool for every socket
bound to the same umem.

Fixes: 94033cd8e73b8 ("xsk: Optimize for aligned case")
Reported-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Tested-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Link: https://lore.kernel.org/xdp-newbies/6205E10C-292E-4995-9D10-409649354226@outlook.com/
Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
---
 net/xdp/xsk_buff_pool.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index f70112176b7c..9b09da63a7c3 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -379,6 +379,14 @@ static void xp_check_dma_contiguity(struct xsk_dma_map *dma_map)
 
 static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dma_map *dma_map)
 {
+	u32 i;
+
+	for (i = 0; i < pool->heads_cnt; i++) {
+		struct xdp_buff_xsk *xskb = &pool->heads[i];
+
+		xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
+	}
+
 	pool->dma_pages = kvcalloc(dma_map->dma_pages_cnt, sizeof(*pool->dma_pages), GFP_KERNEL);
 	if (!pool->dma_pages)
 		return -ENOMEM;
@@ -428,12 +436,6 @@ int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
 
 	if (pool->unaligned)
 		xp_check_dma_contiguity(dma_map);
-	else
-		for (i = 0; i < pool->heads_cnt; i++) {
-			struct xdp_buff_xsk *xskb = &pool->heads[i];
-
-			xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
-		}
 
 	err = xp_init_dma_info(pool, dma_map);
 	if (err) {

base-commit: 46c8229c4317ba8576a206d285a34783390ba6ab
-- 
2.34.1

