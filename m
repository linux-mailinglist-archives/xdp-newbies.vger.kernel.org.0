Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D886235DC6
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 Jun 2019 15:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfFENVB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 Jun 2019 09:21:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46995 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfFENUR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 5 Jun 2019 09:20:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id l26so19037902lfh.13
        for <xdp-newbies@vger.kernel.org>; Wed, 05 Jun 2019 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J8udFRfvbZ6fXOojTQ4C0YPBDnze74Ovvj+f7jr19Fw=;
        b=kakw92oc5wH+oxJ6ODpgbLaUIoQW9h/zUc9x9pUca+W4hUS2xJ0UItvFLf9VQu8CIc
         1szBRsbJ0awE7LTjIq4G2XLFuR6NA7/GMra+3MrrKql34p3S1K/0BW9XeVMFhQYKCTzz
         GDEEbdIwXdjGoo65Q5GIPn9ATH2Pplj3ZlximgzKWmvhwJO5uL4xt3wvQPWA9XCOdqby
         pldooEWZ4PPz+4lA99qqmGvqQJJB+5gPWnOAnNelCPYCw6w7kQYvm1e9sfZN8Rio0xT9
         oX8uoCH8Mn8GL0cCRgeiLGtGD9Z2H3fzWi6Nd6Ib1p80OBQKGvSmhpjPo8Pw9YT+Zszq
         pj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J8udFRfvbZ6fXOojTQ4C0YPBDnze74Ovvj+f7jr19Fw=;
        b=NQXO+m+KKwy0KsQl+mfE7SkPfqS2Ibi/LOKgflAF/qxGcqxEKR2epF2kRTXNFCMWzB
         9P8qdQhSycS6CDmvqBZ6r975vTRAkcrDcTztQ2YCXDuTfxNTZGB0+eVIkdF/HBdJubDL
         083FvT657OYFqi2Mm2h/dshdstM0oZfgE9aLrKOtd4zQdzQOTsbE0hVSp6nT3galGlP9
         um6RQByrKr0XAloHkRqt59nt+GAiRlvXIHlViJ91J8QE6mRCkOiZsIyqfqvyW2gYg5dU
         uGD5GgpXdxpo7zYs6OysiBJ3VlsNv/GicskDCFlJBV8ir7oP8DuOfEQZRzml+nHLhLc2
         dfuA==
X-Gm-Message-State: APjAAAWH0bhhzRdOD7rFdo6g3AgzhzCkqrNr2/DakM1uv7Gd40yBZkAV
        lImSvTMCeYm0NB3MR9pGKfuzkg==
X-Google-Smtp-Source: APXvYqxUNjdEnl96GlRKiWrA7aDQd1EXYbFqh9DMeeWi0M9W28w5vnZ2wm2F2zFOSdm42p7PRe2ZeA==
X-Received: by 2002:a19:2753:: with SMTP id n80mr20327221lfn.127.1559740815723;
        Wed, 05 Jun 2019 06:20:15 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id t3sm1893259lfk.59.2019.06.05.06.20.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 06:20:15 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v3 net-next 2/7] net: page_pool: add helper function to unmap dma addresses
Date:   Wed,  5 Jun 2019 16:20:04 +0300
Message-Id: <20190605132009.10734-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
References: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>

On a previous patch dma addr was stored in 'struct page'.
Use that to unmap DMA addresses used by network drivers

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 include/net/page_pool.h | 1 +
 net/core/page_pool.c    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index b885d86cb7a1..ad218cef88c5 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -110,6 +110,7 @@ static inline struct page *page_pool_dev_alloc_pages(struct page_pool *pool)
 struct page_pool *page_pool_create(const struct page_pool_params *params);
 
 void page_pool_destroy(struct page_pool *pool);
+void page_pool_unmap_page(struct page_pool *pool, struct page *page);
 
 /* Never call this directly, use helpers below */
 void __page_pool_put_page(struct page_pool *pool,
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 5b2252c6d49b..205af7bd6d09 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -190,6 +190,13 @@ static void __page_pool_clean_page(struct page_pool *pool,
 	page->dma_addr = 0;
 }
 
+/* unmap the page and clean our state */
+void page_pool_unmap_page(struct page_pool *pool, struct page *page)
+{
+	__page_pool_clean_page(pool, page);
+}
+EXPORT_SYMBOL(page_pool_unmap_page);
+
 /* Return a page to the page allocator, cleaning up our state */
 static void __page_pool_return_page(struct page_pool *pool, struct page *page)
 {
-- 
2.17.1

