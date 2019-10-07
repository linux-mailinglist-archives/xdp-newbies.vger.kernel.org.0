Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 210F8CDB2F
	for <lists+xdp-newbies@lfdr.de>; Mon,  7 Oct 2019 06:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfJGE6F (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 7 Oct 2019 00:58:05 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43909 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbfJGE6F (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 7 Oct 2019 00:58:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id i32so129884pgl.10
        for <xdp-newbies@vger.kernel.org>; Sun, 06 Oct 2019 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sage.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8EdYmdtbrf6+F/MAWhTLypXhwqGJzWhD4XIFByfyPhE=;
        b=GhJd0tc8YUTvVBQVfmwWKCxH8iiV75+AGU7hgrahFxssWhtLOtL/ndnUZxhrRa7+DI
         ENwKGEZpw05lNfcmJxU1pGU8wpY+4YLDjrsVX4GkHZZAFTDGximUvN3iiNjJspnu6UtA
         2q6LA42psEPxudGHskC07h2RHb1QrmZJhh/gjUSaPzmjEoRIu6e58PORwtCtXNhxK04F
         eHh6LrzFEE5xNg5u6/+ohIZSXcATmNKetumDy5a9jmAaAQsu4ogHFhHCd42u8G35SEg0
         K1U8fLjWBvM8toXvNLc9KBhKAsf3qhxC3ZsyY0GDSOwbSwim4lkZyQe+1OJOOYPD/kge
         pHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8EdYmdtbrf6+F/MAWhTLypXhwqGJzWhD4XIFByfyPhE=;
        b=uUo1v/wxBodk6AuJk+MT7pJOWqxw0PbCcph0JFDlzwWf0HFd3Qj6UY34kwdd2jUgRl
         dJqH6lKjCHs28RveT+21WyNilYlmZoAA/PFm/rwAnpo8E8fQnZ2Dd5h91fzd2QOgfDMu
         XmdD9vDCdOiSIwot1+WxHTZgqaqHaaidkIlXLQXQBIC+yEe400MG9fIJc48wshfb/mvG
         aHx85ZhYhhe7SPm3MDA8xuhCJiawwOk8QnTeuxMuLSbZW7MoHulZwMt8dFXRm5cjdXWL
         6H6lhZLQDDGPXOAlr3OC5c3bx/b31DkWEJKjOyVH/1wzL1uRGxNe0c20OmD0VSk2myOF
         Z96A==
X-Gm-Message-State: APjAAAUyyKp23Yn0nUnug3ZbLPMG9HeRgxRAdnB5e0updypQbloiqb84
        t2p8dBXTxb3IHRtpf/NYxa/PJ9xesBi3XA==
X-Google-Smtp-Source: APXvYqwEW7sGlxlLCNdwYrt2isMJ2qxl5mQ1no94mpHb3sJhlDVb4U6beFGgbvpOkwBL726Z2h6Knw==
X-Received: by 2002:a65:6681:: with SMTP id b1mr1090952pgw.393.1570424284665;
        Sun, 06 Oct 2019 21:58:04 -0700 (PDT)
Received: from dev-instance.c.sage-org.internal (143.139.82.34.bc.googleusercontent.com. [34.82.139.143])
        by smtp.googlemail.com with ESMTPSA id x11sm21565092pja.3.2019.10.06.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 21:58:04 -0700 (PDT)
From:   Eric Sage <eric@sage.org>
To:     netdev@vger.kernel.org
Cc:     bpf@vger.kernel.org, daniel@iogearbox.net,
        xdp-newbies@vger.kernel.org, brouer@redhat.org, ast@kernel.org,
        Eric Sage <eric@sage.org>
Subject: [PATCH] samples/bpf: make xdp_monitor use raw_tracepoints
Date:   Mon,  7 Oct 2019 04:57:26 +0000
Message-Id: <20191007045726.21467-1-eric@sage.org>
X-Mailer: git-send-email 2.18.1
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

raw_tracepoints are an eBPF alternative to standard tracepoints which
attach to a tracepoint without the perf layer being executed, making
them faster.

Since xdp_monitor is supposed to have as little impact on the system as
possible it is switched to using them by append raw_ to the SEC names.

There was also a small issues with 'samples/bpf/bpf_load' - it was
loading the raw_tracepoints with the tracing subsystem name still
attached, which the bpf syscall rejects with a No such file or directory
error. This is now fixed.

Signed-off-by: Eric Sage <eric@sage.org>
---
 samples/bpf/bpf_load.c         |  5 +++--
 samples/bpf/xdp_monitor_kern.c | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/samples/bpf/bpf_load.c b/samples/bpf/bpf_load.c
index 4574b1939e49..6f57eee8e913 100644
--- a/samples/bpf/bpf_load.c
+++ b/samples/bpf/bpf_load.c
@@ -156,9 +156,10 @@ static int load_and_attach(const char *event, struct bpf_insn *prog, int size)
 	}
 
 	if (is_raw_tracepoint) {
-		efd = bpf_raw_tracepoint_open(event + 15, fd);
+		efd = bpf_raw_tracepoint_open(event + 19, fd);
 		if (efd < 0) {
-			printf("tracepoint %s %s\n", event + 15, strerror(errno));
+			printf("tracepoint %s %s\n", event + 19,
+						strerror(errno));
 			return -1;
 		}
 		event_fd[prog_cnt - 1] = efd;
diff --git a/samples/bpf/xdp_monitor_kern.c b/samples/bpf/xdp_monitor_kern.c
index ad10fe700d7d..6f67c38468b9 100644
--- a/samples/bpf/xdp_monitor_kern.c
+++ b/samples/bpf/xdp_monitor_kern.c
@@ -23,10 +23,10 @@ struct bpf_map_def SEC("maps") exception_cnt = {
 };
 
 /* Tracepoint format: /sys/kernel/debug/tracing/events/xdp/xdp_redirect/format
+ * Notice: For raw_tracepoints first 8 bytes are not part of 'format' struct
  * Code in:                kernel/include/trace/events/xdp.h
  */
 struct xdp_redirect_ctx {
-	u64 __pad;		// First 8 bytes are not accessible by bpf code
 	int prog_id;		//	offset:8;  size:4; signed:1;
 	u32 act;		//	offset:12  size:4; signed:0;
 	int ifindex;		//	offset:16  size:4; signed:1;
@@ -65,44 +65,44 @@ int xdp_redirect_collect_stat(struct xdp_redirect_ctx *ctx)
 	 */
 }
 
-SEC("tracepoint/xdp/xdp_redirect_err")
+SEC("raw_tracepoint/xdp/xdp_redirect_err")
 int trace_xdp_redirect_err(struct xdp_redirect_ctx *ctx)
 {
 	return xdp_redirect_collect_stat(ctx);
 }
 
 
-SEC("tracepoint/xdp/xdp_redirect_map_err")
+SEC("raw_tracepoint/xdp/xdp_redirect_map_err")
 int trace_xdp_redirect_map_err(struct xdp_redirect_ctx *ctx)
 {
 	return xdp_redirect_collect_stat(ctx);
 }
 
 /* Likely unloaded when prog starts */
-SEC("tracepoint/xdp/xdp_redirect")
+SEC("raw_tracepoint/xdp/xdp_redirect")
 int trace_xdp_redirect(struct xdp_redirect_ctx *ctx)
 {
 	return xdp_redirect_collect_stat(ctx);
 }
 
 /* Likely unloaded when prog starts */
-SEC("tracepoint/xdp/xdp_redirect_map")
+SEC("raw_tracepoint/xdp/xdp_redirect_map")
 int trace_xdp_redirect_map(struct xdp_redirect_ctx *ctx)
 {
 	return xdp_redirect_collect_stat(ctx);
 }
 
 /* Tracepoint format: /sys/kernel/debug/tracing/events/xdp/xdp_exception/format
+ * Notice: For raw_tracepoints first 8 bytes are not part of 'format' struct
  * Code in:                kernel/include/trace/events/xdp.h
  */
 struct xdp_exception_ctx {
-	u64 __pad;	// First 8 bytes are not accessible by bpf code
 	int prog_id;	//	offset:8;  size:4; signed:1;
 	u32 act;	//	offset:12; size:4; signed:0;
 	int ifindex;	//	offset:16; size:4; signed:1;
 };
 
-SEC("tracepoint/xdp/xdp_exception")
+SEC("raw_tracepoint/xdp/xdp_exception")
 int trace_xdp_exception(struct xdp_exception_ctx *ctx)
 {
 	u64 *cnt;
@@ -144,10 +144,10 @@ struct bpf_map_def SEC("maps") cpumap_kthread_cnt = {
 };
 
 /* Tracepoint: /sys/kernel/debug/tracing/events/xdp/xdp_cpumap_enqueue/format
+ * Notice: For raw_tracepoints first 8 bytes are not part of 'format' struct
  * Code in:         kernel/include/trace/events/xdp.h
  */
 struct cpumap_enqueue_ctx {
-	u64 __pad;		// First 8 bytes are not accessible by bpf code
 	int map_id;		//	offset:8;  size:4; signed:1;
 	u32 act;		//	offset:12; size:4; signed:0;
 	int cpu;		//	offset:16; size:4; signed:1;
@@ -156,7 +156,7 @@ struct cpumap_enqueue_ctx {
 	int to_cpu;		//	offset:28; size:4; signed:1;
 };
 
-SEC("tracepoint/xdp/xdp_cpumap_enqueue")
+SEC("raw_tracepoint/xdp/xdp_cpumap_enqueue")
 int trace_xdp_cpumap_enqueue(struct cpumap_enqueue_ctx *ctx)
 {
 	u32 to_cpu = ctx->to_cpu;
@@ -179,10 +179,10 @@ int trace_xdp_cpumap_enqueue(struct cpumap_enqueue_ctx *ctx)
 }
 
 /* Tracepoint: /sys/kernel/debug/tracing/events/xdp/xdp_cpumap_kthread/format
+ * Notice: For raw_tracepoints first 8 bytes are not part of 'format' struct
  * Code in:         kernel/include/trace/events/xdp.h
  */
 struct cpumap_kthread_ctx {
-	u64 __pad;		// First 8 bytes are not accessible by bpf code
 	int map_id;		//	offset:8;  size:4; signed:1;
 	u32 act;		//	offset:12; size:4; signed:0;
 	int cpu;		//	offset:16; size:4; signed:1;
@@ -191,7 +191,7 @@ struct cpumap_kthread_ctx {
 	int sched;		//	offset:28; size:4; signed:1;
 };
 
-SEC("tracepoint/xdp/xdp_cpumap_kthread")
+SEC("raw_tracepoint/xdp/xdp_cpumap_kthread")
 int trace_xdp_cpumap_kthread(struct cpumap_kthread_ctx *ctx)
 {
 	struct datarec *rec;
@@ -218,10 +218,10 @@ struct bpf_map_def SEC("maps") devmap_xmit_cnt = {
 };
 
 /* Tracepoint: /sys/kernel/debug/tracing/events/xdp/xdp_devmap_xmit/format
+ * Notice: For raw_tracepoints first 8 bytes are not part of 'format' struct
  * Code in:         kernel/include/trace/events/xdp.h
  */
 struct devmap_xmit_ctx {
-	u64 __pad;		// First 8 bytes are not accessible by bpf code
 	int map_id;		//	offset:8;  size:4; signed:1;
 	u32 act;		//	offset:12; size:4; signed:0;
 	u32 map_index;		//	offset:16; size:4; signed:0;
@@ -232,7 +232,7 @@ struct devmap_xmit_ctx {
 	int err;		//	offset:36; size:4; signed:1;
 };
 
-SEC("tracepoint/xdp/xdp_devmap_xmit")
+SEC("raw_tracepoint/xdp/xdp_devmap_xmit")
 int trace_xdp_devmap_xmit(struct devmap_xmit_ctx *ctx)
 {
 	struct datarec *rec;
-- 
2.18.1

