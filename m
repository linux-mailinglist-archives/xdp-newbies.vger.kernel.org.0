Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9427224324
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 May 2019 23:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbfETVtl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 May 2019 17:49:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36936 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfETVtl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 May 2019 17:49:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id e15so16241746wrs.4
        for <xdp-newbies@vger.kernel.org>; Mon, 20 May 2019 14:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5T1hy/hqtkGt7VlP8D6U9UrQi3KpGadAce8jNWj5ow4=;
        b=I6OMHDO7ftbnAIwKESsoJ/bOnBSvTkSQdvDY31YrB45B1TMQnsnpln0MylgXZXaZ1E
         tPrU9pfFuNCtyyff2PR/mEtbTgyVq/TrQ74I/y4DDcaj2YVQiDrnMWv6ozN9ysDuM8tG
         wa1a9jlH/q8F62Gs0Y+jiYLbCPt47JbO6td6vw6zaFLqLAijuDGWyYXlaqyqMmaIwxB0
         LUVNMO/ejjEDz3KwVxpIc+SsnDEdZ0ouNBq1NqHoNJWpC4F8F4oENFCt/tt6+58tA+79
         o0sEZfJJ0lxT+HXdJFvVU3TGrGxoM+Vtv2V88e/ToVfsFFqZvezDp1r/YDKP17LNF9Vz
         16vg==
X-Gm-Message-State: APjAAAWGMj/8rygpfvMkue3jw2fsOR45FO+hBemNSzf8xsWlwDnhOcqq
        PJjS1peJI5yT2hnFYgHrHxnutJqXE4E=
X-Google-Smtp-Source: APXvYqwwIQVkX6hg7GUI4p5OpVeKp2TfmVkU01Kf4BLyrzgxI4SENAgED1LTN3xlqtVZ4iOr6RWr6w==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr2492195wrs.84.1558388979591;
        Mon, 20 May 2019 14:49:39 -0700 (PDT)
Received: from raver.teknoraver.net (net-47-53-225-211.cust.vodafonedsl.it. [47.53.225.211])
        by smtp.gmail.com with ESMTPSA id 197sm1466394wma.36.2019.05.20.14.49.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 14:49:38 -0700 (PDT)
From:   Matteo Croce <mcroce@redhat.com>
To:     xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH bpf] samples/bpf: suppress compiler warning
Date:   Mon, 20 May 2019 23:49:38 +0200
Message-Id: <20190520214938.16889-1-mcroce@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

GCC 9 fails to calculate the size of local constant strings and produces a
false positive:

samples/bpf/task_fd_query_user.c: In function ‘test_debug_fs_uprobe’:
samples/bpf/task_fd_query_user.c:242:67: warning: ‘%s’ directive output may be truncated writing up to 255 bytes into a region of size 215 [-Wformat-truncation=]
  242 |  snprintf(buf, sizeof(buf), "/sys/kernel/debug/tracing/events/%ss/%s/id",
      |                                                                   ^~
  243 |    event_type, event_alias);
      |                ~~~~~~~~~~~
samples/bpf/task_fd_query_user.c:242:2: note: ‘snprintf’ output between 45 and 300 bytes into a destination of size 256
  242 |  snprintf(buf, sizeof(buf), "/sys/kernel/debug/tracing/events/%ss/%s/id",
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  243 |    event_type, event_alias);
      |    ~~~~~~~~~~~~~~~~~~~~~~~~

Workaround this by lowering the buffer size to a reasonable value.
Related GCC Bugzilla: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83431

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 samples/bpf/task_fd_query_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/bpf/task_fd_query_user.c b/samples/bpf/task_fd_query_user.c
index aff2b4ae914e..e39938058223 100644
--- a/samples/bpf/task_fd_query_user.c
+++ b/samples/bpf/task_fd_query_user.c
@@ -216,7 +216,7 @@ static int test_debug_fs_uprobe(char *binary_path, long offset, bool is_return)
 {
 	const char *event_type = "uprobe";
 	struct perf_event_attr attr = {};
-	char buf[256], event_alias[256];
+	char buf[256], event_alias[sizeof("test_1234567890")];
 	__u64 probe_offset, probe_addr;
 	__u32 len, prog_id, fd_type;
 	int err, res, kfd, efd;
-- 
2.21.0

