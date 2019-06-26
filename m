Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33E3C56E2F
	for <lists+xdp-newbies@lfdr.de>; Wed, 26 Jun 2019 17:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfFZP7S (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 26 Jun 2019 11:59:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33245 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFZP7S (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 26 Jun 2019 11:59:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so1964707lfe.0
        for <xdp-newbies@vger.kernel.org>; Wed, 26 Jun 2019 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=w3F+tqbuCaIkVEmb3xZOgqKho6J48v4zfZ9zqPryVN8=;
        b=g9V3FeUtFTWjdbosHMyZt4xm7w+kP7xwYdEacmzFkudE1y+O7N4jJ0o1485yPZ2KkV
         nE+9UENFAt22ikKN4VKWQsipR+VEnTM7ixoyzwPP0V6SnB1WMndNPVu0YtEYpWTyiSxW
         aDDIJ+QdEVHzhEbSwqWwItJ1ePptdzA73s771bAn8LtrY1GVRVbI5jK7isj2UJjeM01x
         pZXuRDiQpNPRezH1rd5nGe2EDGLrPqomN9gmggQCsn6kydp+UC530gotK5JtrcUOZPTv
         Z5narCZ1IsA10kj13uHoOyheyRkC638s8UVM6Nwguobhli26k3OUWn5HLVpXt/iyT/5c
         YJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w3F+tqbuCaIkVEmb3xZOgqKho6J48v4zfZ9zqPryVN8=;
        b=MX4Z+T4iFkHep0ecCIZAG2Bx5suMCvZWTGV6gtkVqB+xCRfD+/4GkQN8pKuK814h0C
         HYzYKHEh31ZM2Jun958agGn3llELFBJojg0az4HHHG3ZPDAdG+hEXWVAvUtFSr2KqVkC
         mEav+2VyqMZJQsccMJ3+BhdsFldLcjx9D5ex7+bPQkEBCod7dvHGft3crH16uCrxytyR
         FXQsXDkwXqXOyYpgWNTDtd5AoTeSyeuejIikoheByRHVK5QwD2XuFKWlazQXiAJLcpKI
         CXjmf263+4a0/EjAxmZkswtZUIxzOrcCxxETFMEKgn0rGu1nPdn4ZBpt+vEp1sZzvVw5
         vwxw==
X-Gm-Message-State: APjAAAUSDwbrLc3wHbkMHj90g2a4ONZsWS7bneoMpQCpZw+ER6EC9VbY
        u0BOiTnUy2mSPUQUu4Opjhb+cA==
X-Google-Smtp-Source: APXvYqwxPGGkHGeCrj0vxlOHZFHSZuMOUZLSiXgf7NgyB/aIkSZ03HweWLPeu8yjUokOOKyyRr1TDw==
X-Received: by 2002:a19:4f50:: with SMTP id a16mr3070485lfk.24.1561564755631;
        Wed, 26 Jun 2019 08:59:15 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id p27sm2504052lfo.16.2019.06.26.08.59.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 08:59:15 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     bjorn.topel@intel.com, magnus.karlsson@intel.com,
        davem@davemloft.net
Cc:     ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, netdev@vger.kernel.org,
        bpf@vger.kernel.org, xdp-newbies@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next] xdp: xdp_umem: fix umem pages mapping for 32bits systems
Date:   Wed, 26 Jun 2019 18:59:11 +0300
Message-Id: <20190626155911.13574-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Use kmap instead of page_address as it's not always in low memory.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 net/xdp/xdp_umem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 9c6de4f114f8..d3c1411420fd 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -169,6 +169,14 @@ static void xdp_umem_clear_dev(struct xdp_umem *umem)
 	}
 }
 
+static void xdp_umem_unmap_pages(struct xdp_umem *umem)
+{
+	unsigned int i;
+
+	for (i = 0; i < umem->npgs; i++)
+		kunmap(umem->pgs[i]);
+}
+
 static void xdp_umem_unpin_pages(struct xdp_umem *umem)
 {
 	unsigned int i;
@@ -210,6 +218,7 @@ static void xdp_umem_release(struct xdp_umem *umem)
 
 	xsk_reuseq_destroy(umem);
 
+	xdp_umem_unmap_pages(umem);
 	xdp_umem_unpin_pages(umem);
 
 	kfree(umem->pages);
@@ -372,7 +381,7 @@ static int xdp_umem_reg(struct xdp_umem *umem, struct xdp_umem_reg *mr)
 	}
 
 	for (i = 0; i < umem->npgs; i++)
-		umem->pages[i].addr = page_address(umem->pgs[i]);
+		umem->pages[i].addr = kmap(umem->pgs[i]);
 
 	return 0;
 
-- 
2.17.1

