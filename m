Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3FD8EB47
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Aug 2019 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731795AbfHOMOc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Aug 2019 08:14:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38972 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731778AbfHOMOc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Aug 2019 08:14:32 -0400
Received: by mail-lf1-f68.google.com with SMTP id x3so1501858lfn.6
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Aug 2019 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aIVfXCW1+kiXSGueAdzDW1yyefj6NecEzYan4H+pqQc=;
        b=IWRo0YgIC5PrnJ7KHBk5p2MKI1bMnA25MrpR3+u6sXtARJMClbHlRjCEeBl8LlYmw+
         CuA31luU5HMV8WIcc8wNZzm3INx7zoxVpNydrj/gZHlq3e6d7oTsqmtP/NkFCyrMsRvF
         36oQVwiV3yUfI0TdJSpqkg73xRcBNxJBbyaqRQE+Xe/z1xejqHw1z1j67k8meNUe1BVU
         Mb7yn4eVM87G0tC/eNq9T/gJtQiOquVYAIS0t5nmxbHTyZkgyvRm0tyaatmWjeeghO1g
         3Ab7WzGzwRqzwZ5zQS5gisf5Nnj7vvq543McaqHLPDAo0FNTP+icYMYi/mj7t2rAzo1k
         ybsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aIVfXCW1+kiXSGueAdzDW1yyefj6NecEzYan4H+pqQc=;
        b=tOhDC0/wGYMp8gq6c5Mxq6tcoNRbPAknaQd6YrqdHs7xsvnzBM17PrjtLzmcbyANmz
         ukt/uX7qoGuQfEWD7fBaaxGD6CuVsnpJYr8hRtoDfJqhQqLDSMDMz4QSLqhl20vtCJAC
         tCVsQAoKZCpevNFTg/dZc7Rg1FOJOIRP394eDsEjzHdrvJVkTCSnOahpow20iqy08A9I
         4U9vdPzecdypb26Ne+Wt9sOACYGzJ3YJYdGaFF2Uv5r4NZLa4lwopgAme+iOojC0uuSL
         UWGqCWYlz7AhW4sX+p7Oath665wvaAOo5dSkmQk3KaJbizQyYYEfrDPO9jyqaNdzX41D
         oacw==
X-Gm-Message-State: APjAAAXYvHvluAC0e/b/+F5pIcTZ9nVBQR9hLsSe4//F0jL4I7fGMlFc
        kGhtDHaj+a6AdzqoukAynAHt4w==
X-Google-Smtp-Source: APXvYqzfFMtyr4sHYyHuVpFusHpNj+KZyw1KwJMVehQBwCRbpnsZoYpaoPpgtFyivFAAYDHobXOLkA==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr2300688lfn.75.1565871270040;
        Thu, 15 Aug 2019 05:14:30 -0700 (PDT)
Received: from localhost.localdomain (168-200-94-178.pool.ukrtel.net. [178.94.200.168])
        by smtp.gmail.com with ESMTPSA id q25sm462060ljg.30.2019.08.15.05.14.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 05:14:29 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     magnus.karlsson@intel.com, bjorn.topel@intel.com
Cc:     davem@davemloft.net, hawk@kernel.org, john.fastabend@gmail.com,
        jakub.kicinski@netronome.com, daniel@iogearbox.net,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        xdp-newbies@vger.kernel.org, linux-kernel@vger.kernel.org,
        jlemon@flugsvamp.com, yhs@fb.com, andrii.nakryiko@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH bpf-next v2 3/3] samples: bpf: syscal_nrs: use mmap2 if defined
Date:   Thu, 15 Aug 2019 15:13:56 +0300
Message-Id: <20190815121356.8848-4-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190815121356.8848-1-ivan.khoronzhuk@linaro.org>
References: <20190815121356.8848-1-ivan.khoronzhuk@linaro.org>
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

For arm32 xdp sockets mmap2 is preferred, so use it if it's defined.
Declaration of __NR_mmap can be skipped and it breaks build.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 samples/bpf/syscall_nrs.c  |  6 ++++++
 samples/bpf/tracex5_kern.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/samples/bpf/syscall_nrs.c b/samples/bpf/syscall_nrs.c
index 516e255cbe8f..88f940052450 100644
--- a/samples/bpf/syscall_nrs.c
+++ b/samples/bpf/syscall_nrs.c
@@ -9,5 +9,11 @@ void syscall_defines(void)
 	COMMENT("Linux system call numbers.");
 	SYSNR(__NR_write);
 	SYSNR(__NR_read);
+#ifdef __NR_mmap2
+	SYSNR(__NR_mmap2);
+#endif
+#ifdef __NR_mmap
 	SYSNR(__NR_mmap);
+#endif
+
 }
diff --git a/samples/bpf/tracex5_kern.c b/samples/bpf/tracex5_kern.c
index f57f4e1ea1ec..35cb0eed3be5 100644
--- a/samples/bpf/tracex5_kern.c
+++ b/samples/bpf/tracex5_kern.c
@@ -68,12 +68,25 @@ PROG(SYS__NR_read)(struct pt_regs *ctx)
 	return 0;
 }
 
+#ifdef __NR_mmap2
+PROG(SYS__NR_mmap2)(struct pt_regs *ctx)
+{
+	char fmt[] = "mmap2\n";
+
+	bpf_trace_printk(fmt, sizeof(fmt));
+	return 0;
+}
+#endif
+
+#ifdef __NR_mmap
 PROG(SYS__NR_mmap)(struct pt_regs *ctx)
 {
 	char fmt[] = "mmap\n";
+
 	bpf_trace_printk(fmt, sizeof(fmt));
 	return 0;
 }
+#endif
 
 char _license[] SEC("license") = "GPL";
 u32 _version SEC("version") = LINUX_VERSION_CODE;
-- 
2.17.1

