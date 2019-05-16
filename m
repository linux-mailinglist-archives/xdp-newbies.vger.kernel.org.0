Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E272105D
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 May 2019 23:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbfEPVyb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 May 2019 17:54:31 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45874 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbfEPVya (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 May 2019 17:54:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id a5so2252799pls.12
        for <xdp-newbies@vger.kernel.org>; Thu, 16 May 2019 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuy+4KeQUeW3R7SNZ+HYiTwXxQ5E43mgDn+NwskHEzs=;
        b=IcpzO48FvAJ670uKYLzhbsBgfyBFMhvCUcuBw6bCpeLGFuiE/+Koz9cZ+cDKHugSuh
         dbFUDbXbqXa4me+xIhFnv+8VFY0Ox2jf2KZrPkGEPPmYckaqOBBKGz3ETPiMFAZGDN3w
         dOyNu4ImP+vRTD66t/z3Qm//GvhRW/oLChJ9CHQWZ/tWyTEPjr8uLtzLfv5925y5yWyj
         1lZQYsUQMVBKVlEZDti1fSZNghCV8NG8tbxZpwo9Q8IQuT78eNtS91T+eMoOjqAi9V/n
         ZHnJ109iB+FRb7wEPTHJw5upLIIZP/XfQJcMswQFJiii5PTlM4wI0SxXT0kGBav0E+w4
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuy+4KeQUeW3R7SNZ+HYiTwXxQ5E43mgDn+NwskHEzs=;
        b=DRjCrqbK5ViXP2WFIRRFmooxIyd+MTabRj8SZ19FVJZ3646FEjP2GiWDBct9mbzdrL
         e8J7n0ZHxUesqCUG3wx6pdCepQhtY7jDOnnQIRvV1iscpjdDbQY2sF/rkuINB+QA1OSL
         FULj4CHMnn4Qcxh2Qm2ZZPRNlM8lRKFpt9/Y4t+f6/NNbegu96+IxCCEqRTPGnudiC4Y
         nNUYo/hKwSo0vZKXJZZoPP0meQbusIHJrV4Sh1S/j7Hl1UscKvZe4ZHlAeUl1vqrDXhe
         qtDBaGMH6s3TXPZsdWqYd74QxX19ihyi3I8T65QmvbEm/GC7rGq83x3Y+8ESivMm1P06
         TnSA==
X-Gm-Message-State: APjAAAWfwJKtC9daXRKRrqKoIZ8HVq7ioyGP+58wNNJWP913KQLCtV/v
        /Lh3L1m7stsRwfulh1T55QOy3w==
X-Google-Smtp-Source: APXvYqze6mU3ZczpGFKB7O1KBUB7ctB0WhYsf9IFGEuMKNxecLDDaXlHc4sSU1Ax4HNfYvY4GRIPDg==
X-Received: by 2002:a17:902:2f03:: with SMTP id s3mr26178463plb.203.1558043669895;
        Thu, 16 May 2019 14:54:29 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id d15sm19842506pfm.186.2019.05.16.14.54.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 14:54:29 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
X-Google-Original-From: Stephen Hemminger <sthemmin@microsoft.com>
To:     netdev@vger.kernel.org, davem@davemloft.net
Cc:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org,
        Stephen Hemminger <sthemmin@microsoft.com>
Subject: [PATCH net 3/3] netdevice: clarify meaning of rx_handler_result
Date:   Thu, 16 May 2019 14:54:23 -0700
Message-Id: <20190516215423.14185-4-sthemmin@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516215423.14185-1-sthemmin@microsoft.com>
References: <20190516215423.14185-1-sthemmin@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Make the language in comment about rx_handler_result clearer.
Especially the meaning of RX_HANDLER_ANOTHER.

Replace use of "should" with "must" to be in line with common
usage in standards documents.

Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
---
 include/linux/netdevice.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 44b47e9df94a..56f613561909 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -374,10 +374,10 @@ typedef enum gro_result gro_result_t;
 
 /*
  * enum rx_handler_result - Possible return values for rx_handlers.
- * @RX_HANDLER_CONSUMED: skb was consumed by rx_handler, do not process it
- * further.
- * @RX_HANDLER_ANOTHER: Do another round in receive path. This is indicated in
- * case skb->dev was changed by rx_handler.
+ * @RX_HANDLER_CONSUMED: skb was consumed by rx_handler.
+ *  Do not process it further.
+ * @RX_HANDLER_ANOTHER: skb->dev was modified by rx_handler,
+ *  Do another round in receive path. This is indicated in
  * @RX_HANDLER_EXACT: Force exact delivery, no wildcard.
  * @RX_HANDLER_PASS: Do nothing, pass the skb as if no rx_handler was called.
  *
@@ -394,20 +394,20 @@ typedef enum gro_result gro_result_t;
  * Upon return, rx_handler is expected to tell __netif_receive_skb() what to
  * do with the skb.
  *
- * If the rx_handler consumed the skb in some way, it should return
+ * If the rx_handler consumed the skb in some way, it must return
  * RX_HANDLER_CONSUMED. This is appropriate when the rx_handler arranged for
  * the skb to be delivered in some other way.
  *
  * If the rx_handler changed skb->dev, to divert the skb to another
- * net_device, it should return RX_HANDLER_ANOTHER. The rx_handler for the
+ * net_device, it must return RX_HANDLER_ANOTHER. The rx_handler for the
  * new device will be called if it exists.
  *
- * If the rx_handler decides the skb should be ignored, it should return
+ * If the rx_handler decides the skb should be ignored, it must return
  * RX_HANDLER_EXACT. The skb will only be delivered to protocol handlers that
  * are registered on exact device (ptype->dev == skb->dev).
  *
  * If the rx_handler didn't change skb->dev, but wants the skb to be normally
- * delivered, it should return RX_HANDLER_PASS.
+ * delivered, it must return RX_HANDLER_PASS.
  *
  * A device without a registered rx_handler will behave as if rx_handler
  * returned RX_HANDLER_PASS.
-- 
2.20.1

