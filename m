Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C3A220FA
	for <lists+xdp-newbies@lfdr.de>; Sat, 18 May 2019 02:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbfERArU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 May 2019 20:47:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39581 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729314AbfERArU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 May 2019 20:47:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id w8so8789756wrl.6
        for <xdp-newbies@vger.kernel.org>; Fri, 17 May 2019 17:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3DgH/GDCuXwmaYTsULk4dUFQoi/liSrcO0NR43ZPuKo=;
        b=Sbo0OLzswK+JSAwgGvJy4lXL0dxMcW2LCI7uYCsKRp7JevJWvyRDVCR0Py7Rc0iy+4
         /VbCQBewcrHXF8IS8y4RIVQd9s3RTJI9s5rxwLVS+Oovv6npIPwd7vpE2bbPP9LuM1m2
         sP4saICUgp01mkJGvEu6iOyoHf3FmLXaFWp0oin6W/tcYHLtb0k8W6kTZy53bJIOILBS
         3wClgdwDbp36PBUDZ3KFPRWryKwvwVoTo1K7m4vhllo8v4a8evl9LSHtEdkDeAbzjOT0
         svuxbQXGMC1uiA/Vjm+CEEtxVBvl+2LgqYmVhOPzh46tow5pM0qHAIIIJ/Py4So7WQrs
         PHpw==
X-Gm-Message-State: APjAAAXUQyWetWS3T0Sxyo0tjuFQN5llGlOiNOvQdgvTPQcFJL7MOt7M
        rnnn1PPQx10xY8YOZ3HJlVRM7fPaDps=
X-Google-Smtp-Source: APXvYqyPuu6yDKmkE/iulwPr5oaCAy2nYejJOHvbx+dwfpn42/EFXnjF/9CJyGfWaI6bOs3fVtV7Iw==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr15259481wrv.303.1558140438471;
        Fri, 17 May 2019 17:47:18 -0700 (PDT)
Received: from raver.teknoraver.net (net-47-53-225-211.cust.vodafonedsl.it. [47.53.225.211])
        by smtp.gmail.com with ESMTPSA id n2sm14832005wra.89.2019.05.17.17.47.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 May 2019 17:47:17 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 4/5] samples/bpf: fix tracex5_user build error
Date:   Sat, 18 May 2019 02:46:38 +0200
Message-Id: <20190518004639.20648-4-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518004639.20648-1-mcroce@redhat.com>
References: <20190518004639.20648-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Add missing symbols to tools/include/linux/filter.h to fix a build failure:

make -C samples/bpf/../../tools/lib/bpf/ RM='rm -rf' LDFLAGS= srctree=samples/bpf/../../ O=
  HOSTCC  samples/bpf/tracex5_user.o
samples/bpf/tracex5_user.c: In function ‘install_accept_all_seccomp’:
samples/bpf/tracex5_user.c:17:21: error: array type has incomplete element type ‘struct sock_filter’
   17 |  struct sock_filter filter[] = {
      |                     ^~~~~~
samples/bpf/tracex5_user.c:18:3: warning: implicit declaration of function ‘BPF_STMT’; did you mean ‘BPF_STX’? [-Wimplicit-function-declaration]
   18 |   BPF_STMT(BPF_RET+BPF_K, SECCOMP_RET_ALLOW),
      |   ^~~~~~~~
      |   BPF_STX
samples/bpf/tracex5_user.c:20:9: error: variable ‘prog’ has initializer but incomplete type
   20 |  struct sock_fprog prog = {
      |         ^~~~~~~~~~
samples/bpf/tracex5_user.c:21:4: error: ‘struct sock_fprog’ has no member named ‘len’
   21 |   .len = (unsigned short)(sizeof(filter)/sizeof(filter[0])),
      |    ^~~
samples/bpf/tracex5_user.c:21:10: warning: excess elements in struct initializer
   21 |   .len = (unsigned short)(sizeof(filter)/sizeof(filter[0])),
      |          ^
samples/bpf/tracex5_user.c:21:10: note: (near initialization for ‘prog’)
samples/bpf/tracex5_user.c:22:4: error: ‘struct sock_fprog’ has no member named ‘filter’
   22 |   .filter = filter,
      |    ^~~~~~
samples/bpf/tracex5_user.c:22:13: warning: excess elements in struct initializer
   22 |   .filter = filter,
      |             ^~~~~~
samples/bpf/tracex5_user.c:22:13: note: (near initialization for ‘prog’)
samples/bpf/tracex5_user.c:20:20: error: storage size of ‘prog’ isn’t known
   20 |  struct sock_fprog prog = {
      |                    ^~~~
samples/bpf/tracex5_user.c:20:20: warning: unused variable ‘prog’ [-Wunused-variable]
samples/bpf/tracex5_user.c:17:21: warning: unused variable ‘filter’ [-Wunused-variable]
   17 |  struct sock_filter filter[] = {
      |                     ^~~~~~
make[2]: *** [scripts/Makefile.host:109: samples/bpf/tracex5_user.o] Error 1
make[1]: *** [Makefile:1763: samples/bpf/] Error 2

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 tools/include/linux/filter.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/include/linux/filter.h b/tools/include/linux/filter.h
index ca28b6ab8db7..6b2ed7eccfa5 100644
--- a/tools/include/linux/filter.h
+++ b/tools/include/linux/filter.h
@@ -7,6 +7,33 @@
 
 #include <linux/bpf.h>
 
+/*
+ *	Try and keep these values and structures similar to BSD, especially
+ *	the BPF code definitions which need to match so you can share filters
+ */
+
+struct sock_filter {	/* Filter block */
+	__u16	code;   /* Actual filter code */
+	__u8	jt;	/* Jump true */
+	__u8	jf;	/* Jump false */
+	__u32	k;      /* Generic multiuse field */
+};
+
+struct sock_fprog {	/* Required for SO_ATTACH_FILTER. */
+	unsigned short		len;	/* Number of filter blocks */
+	struct sock_filter __user *filter;
+};
+
+/*
+ * Macros for filter block array initializers.
+ */
+#ifndef BPF_STMT
+#define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
+#endif
+#ifndef BPF_JUMP
+#define BPF_JUMP(code, k, jt, jf) { (unsigned short)(code), jt, jf, k }
+#endif
+
 /* ArgX, context and stack frame pointer register positions. Note,
  * Arg1, Arg2, Arg3, etc are used as argument mappings of function
  * calls in BPF_CALL instruction.
-- 
2.21.0

