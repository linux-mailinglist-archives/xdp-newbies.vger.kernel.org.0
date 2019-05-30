Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3DC301B8
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 May 2019 20:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfE3SUy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 May 2019 14:20:54 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44635 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbfE3SUx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 May 2019 14:20:53 -0400
Received: by mail-lj1-f196.google.com with SMTP id e13so6968486ljl.11
        for <xdp-newbies@vger.kernel.org>; Thu, 30 May 2019 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AdSMTsu+LtgUCnPNRXGwSYsCPQyqbNfQqw5/RcvDJNQ=;
        b=NTEyy87mbpZennf/zO3UY3SG/jU34eWt9oBeag4D8YjahXlGpvo7jFJ45TsemIdnir
         GDDTpbKLurGeDuALSvM6j7s2xNdezurfEaq3Do0FdVu1zSrcVUfBnzEjlX9CPvMPhzYJ
         syvG28Ahiha6P8q/z1kIyl0178d00DQHN+sX/j5wk8ko44/63zLEGfJyi7VPUdIJ0LKG
         TgaTpYJ6tpJG3xAZrI95TMKLk8q+WGk0L19nUTHjuhUVz5EeWBCSPoZe7eWVxtRSZtYW
         kYjH1/WFTyKdQ+VO2y6VV9nuGp1SruffgOv8KjxhvVfDhLZ+qlpEcUfBKzBd6xbaakTA
         2nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AdSMTsu+LtgUCnPNRXGwSYsCPQyqbNfQqw5/RcvDJNQ=;
        b=eNn/qe/eiPUOz9SXWA/Oz6CngN4fkZToF9GjEfPTqoN+34bOoJncOicpfzQG5NfnvL
         epDFILqX+lfBecAiAR0UYYdozaBPkoJcTuEmCPE8wPLKDU6LczRyOdFPXbDAMZmfojGA
         GEfv+0ZgMF92T6Osrt9Bpiukah121WH4Seo0k+87dh8XYsMLF2hgCQi2r4NYaUEjQ7Q+
         3clwZ3rm2sKzwgXsqLL29a7h0iv1lUUUU96bLh51MsEV9G/aR2SBdVUPYB5COaiV6aKR
         Nfe+NPGmxS/84FtLPUVpnthB7LPR0Ec6wNlfbWFAa6bMpXAt+zO4LuZjFnS5SO36XoAu
         8lwg==
X-Gm-Message-State: APjAAAXaoG00FBjrOWqnG8nyvrL+/UzxkFFCrB7uIIWR6uMpNrxyiJVv
        IMeKo1rwpaUkITg3hJywa7S3Fg==
X-Google-Smtp-Source: APXvYqwcOOLVdQF2eRwE44U7qP1o+9tRsDYFuMaBYPD6l5MItx//FH0w80EsZyjHpAQDOz9EOA3SFQ==
X-Received: by 2002:a2e:9756:: with SMTP id f22mr3083605ljj.30.1559240451067;
        Thu, 30 May 2019 11:20:51 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id v7sm388946lfe.11.2019.05.30.11.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 11:20:50 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 1/7] net: page_pool: add helper function to retrieve dma addresses
Date:   Thu, 30 May 2019 21:20:33 +0300
Message-Id: <20190530182039.4945-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
References: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>

On a previous patch dma addr was stored in 'struct page'.
Use that to retrieve DMA addresses used by network drivers

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 include/net/page_pool.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 694d055e01ef..b885d86cb7a1 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -132,6 +132,11 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
 	__page_pool_put_page(pool, page, true);
 }
 
+static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
+{
+	return page->dma_addr;
+}
+
 static inline bool is_page_pool_compiled_in(void)
 {
 #ifdef CONFIG_PAGE_POOL
-- 
2.17.1

