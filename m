Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58010301D0
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 May 2019 20:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfE3SVi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 May 2019 14:21:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33496 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfE3SUy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 May 2019 14:20:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so5803776lfe.0
        for <xdp-newbies@vger.kernel.org>; Thu, 30 May 2019 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J8udFRfvbZ6fXOojTQ4C0YPBDnze74Ovvj+f7jr19Fw=;
        b=wU1WwXoEjKxZ3uqM80S4B/iacjxdOKTanw/C0MhErCrltoOGbqOgl6D3+r1s/I5MDs
         43CeGw6Y6RckooIj+upDJFUOq/x8S44sRl4IecU2CAs9bIntSdh8qHidWHvG+s5sZZwr
         tMo1h8S1ts9QZr8NNUvE3T9naG3R4FHAPT23kfi5+VV7aUci43qWu5ZZWJKAHQleHoEy
         /ajuUGqlAVxb3HPheATiiuEdAXwo7PokCTbdy4XNP9sZTvD5RheyUk1vZwg8Azp9xD2i
         pnBXFBTfRa7tQ02r91dRnH9CWokN/c7+ti7EZKQlpvZEfndG6pFqlRF4421kR1+T9DU1
         CSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J8udFRfvbZ6fXOojTQ4C0YPBDnze74Ovvj+f7jr19Fw=;
        b=d/VgOtIk25AgFh/QRFdLWBKAt9bZUdsXqdnl1bDQ95nAs2hRWpxDiyi+GW4Wtz4hhG
         9ZYobFgNSBn0dUOpbswyUQnVX9RMS3PtqdKVsIKnAfnW50OF4AXMeCivo6v5LFl6Tsrg
         9sNswdr4TUbnO+lqWrtC4AQQUqjivFt+XHQhq+HhffOwLz7lcauTBzexJlWwJYX6PEZP
         PSqfuB1u3yvLkj+7PAIWn7OssWlNFesqHqmDXWVMkXzaC/3d0yWmogGuEQ02mksO4zcV
         HsBkaY1+gqG5p7crTsf4Qw6mIC7RXYjci0ks2gQ3ZZeT3yIaEEMGhMwWDKaagNI/bVSD
         vp0Q==
X-Gm-Message-State: APjAAAVCCXmuiqBi/lxPO47BPzsR4npkGuUCfxenzPnfa9ubqDEzY7US
        hzaEvFaOtXX5djzPmckbzrUG2A==
X-Google-Smtp-Source: APXvYqzmIrTETx9SuLnFJbbk7eE7VgPvlT6tOo6LaT1WkjJJjIEn1SeLZrsHAr7qOO6dBn1fCt8qbg==
X-Received: by 2002:ac2:494f:: with SMTP id o15mr2908131lfi.22.1559240452479;
        Thu, 30 May 2019 11:20:52 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id v7sm388946lfe.11.2019.05.30.11.20.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 11:20:51 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 2/7] net: page_pool: add helper function to unmap dma addresses
Date:   Thu, 30 May 2019 21:20:34 +0300
Message-Id: <20190530182039.4945-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
References: <20190530182039.4945-1-ivan.khoronzhuk@linaro.org>
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

