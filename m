Return-Path: <xdp-newbies+bounces-138-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D7972432
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Sep 2024 23:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0CE71C22BEC
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Sep 2024 21:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0F518B478;
	Mon,  9 Sep 2024 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3vUo1Q6E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/LDxeoDB"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88366178CC8;
	Mon,  9 Sep 2024 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916035; cv=none; b=GP46+VEkOIEi9z/BdPj/ff4ekMRLz7bt0ou5tBjDD3ab1SN431w8XBiPiMuCtjM2o+8RhZ0zETCwrzm2CjThorpeTnHCkCdgVBmjVr2XHKwl2BIjNSt+BL7XXdRDqalst4InS81SvbZQEsvKyehIun0GFCoUjGHeFvJcbg6SzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916035; c=relaxed/simple;
	bh=l8RFvQvy45dX+U0oegyvg58M7Rrq3sg++EAnk6lwz18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Py6LVygj+fnJKo6dD6UW3AZKcdclCVrPOSfwUbFRStR4V4DSLdVolYkH/0i0iQ+HmrhXiZ2JyDz7+W1AjkkNjTrE/VcPK/cYhBfx9xwcOURTgRlxC/PoKTbAsWQa+pn2oymP0n9KJCxXN8tb6Tybl2Mn8AYNkNKZK/ebrPF+YPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3vUo1Q6E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/LDxeoDB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Florian Kauer <florian.kauer@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725916031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1kuFpZpWeJWLvsFXiLDVH/pZ9m0VjY5XQDuskkb2mAM=;
	b=3vUo1Q6EXItFr13CRNwbWKKJtU6Hww57YiIn+2xN4REBYC5yd7xH9rjruLxgF/v+0ZiPrl
	P9+eHskEH5lX74Pmwh4ZFeSmnCV7rsKBsS8QVv3wqrOCWah0Hb0GE9Ltt7djJg7o+dgBmi
	86y70v/niGghHnd5HkSEimy3V8Nt/w8hb8GH4XsM5ZTojaNu/7US6gFtu52wrfOw0WjzbC
	f07y6gROwFfFLJFTEWbDysEgCKfDP1268p7hwjFRvxUNdnhgHSQFlCvUCRp3Qr9N+8j705
	BVMSrRZjhoHJ2CwGtG4/FUpWixhoQo6LKal1rqNXuMdV7MpFko0pEpC26bfYWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725916031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1kuFpZpWeJWLvsFXiLDVH/pZ9m0VjY5XQDuskkb2mAM=;
	b=/LDxeoDBmDjAhCiKgTGYiZZcEB7fhduAM/H8aUl6UDxr0xSSoMxeSgRmOpaL32OxeVFQ8l
	S5Pu+nKunF8/eNCg==
Date: Mon, 09 Sep 2024 23:06:56 +0200
Subject: [PATCH] bpf: devmap: allow for repeated redirect
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAHBj32YC/yWNS47CMBBErxJ5jaW202m7cxXEom03g8Un4GTQS
 Ii7jwXLV6V69TKrtqqrmYeXafqsa11uHdxuMPkktx+1tXQ2HjwCA9uiT73Y8yKXxR7rn21aatO
 8WYpIIxMjT870+b1p7z/q/eHLTR+//WH7huYuWz51/zwQ+ygaArrgg47JS0KJGf1ECUgiOUAQ+
 HiTrGrzcr3WbR6iEmemcgzB9U0HzT5ELQkDAI+TK4pFyBze73+dDLyY7AAAAA==
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 xdp-newbies@vger.kernel.org, Florian Kauer <florian.kauer@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=9305;
 i=florian.kauer@linutronix.de; h=from:subject:message-id;
 bh=l8RFvQvy45dX+U0oegyvg58M7Rrq3sg++EAnk6lwz18=;
 b=owEBbQKS/ZANAwAKATKF5IolV+EkAcsmYgBm32N6bYwzjxIcqtwZW1gMChPXvtpHV838n/Cyr
 kZTFXonTlWJAjMEAAEKAB0WIQSG5cmCLvpm5t9g7UUyheSKJVfhJAUCZt9jegAKCRAyheSKJVfh
 JA1eD/0dsqc5m+40sYaRFDVVF0isNkFzOaiZELOETddXJlgJaFRlZf/0+cFJ4d0/T0NeZvFbShs
 7OvTqG6vIB4t+DNw/U7Xrcii8BOw4mDT0l9XCtL2HbNsFmvE7YiwdAcD2XZKO7+f5oO5lgASvqF
 TjKsPwGNXWhdOwe+CaxBLVUdp05I384VokgWpvTTOcFpQjqouBS+pEEdsaY+gH8GmCfKK7QHCgn
 o5GFnGFClsl0BcjkesZVx+csc4tUVPWxNTmo8wJso+sr7FvMqPiBsSKKKrXWs7qVrY9QX+egvS4
 M+8fT+gJJLuQifJaLx2mQCAKnupFirQuO381ITgGV6ygAx9RPQhLJuTxW4evPOEXXHtW6ow6CDy
 hp0tjXSYO2VUMNf88kus7ZBaI/ZOr3lReNVdLChfD1NquVPC5MONiU/S6wL+Mj7ubFeIv4HKdfh
 YDkQBW2mWaG4Bx6Y4rn2N6It11pNhNn9Sw6QjKtVuu2g3j31t/8hvPvSE6X48ZK5k7dkVdeeYAc
 zpgdLDG9AGSIuJyZf/wU9D0cJrOlFMhPs6Yois7Nw7/safH9YJVobtPtXxMlwhGLCfmcmY0wFWz
 P1Fq0oFsNMnWVKBIccptupym5VtsnLjmHvFULB87BX4UV+6+FIVe0XeQkU1M1gmvipsYqfvXhLt
 lLrrTNPqFq6uMmw==
X-Developer-Key: i=florian.kauer@linutronix.de; a=openpgp;
 fpr=F17D8B54133C2229493E64A0B5976DD65251944E

Currently, returning XDP_REDIRECT from a xdp/devmap program
is considered as invalid action and an exception is traced.

While it might seem counterintuitive to redirect in a xdp/devmap
program (why not just redirect to the correct interface in the
first program?), we faced several use cases where supporting
this would be very useful.

Most importantly, they occur when the first redirect is used
with the BPF_F_BROADCAST flag. Using this together with xdp/devmap
programs, enables to perform different actions on clones of
the same incoming frame. In that case, it is often useful
to redirect either to a different CPU or device AFTER the cloning.

For example:
- Replicate the frame (for redundancy according to IEEE 802.1CB FRER)
  and then use the second redirect with a cpumap to select
  the path-specific egress queue.

- Also, one of the paths might need an encapsulation that
  exceeds the MTU. So a second redirect can be used back
  to the ingress interface to send an ICMP FRAG_NEEDED packet.

- For OAM purposes, you might want to send one frame with
  OAM information back, while the original frame in passed forward.

To enable these use cases, add the XDP_REDIRECT case to
dev_map_bpf_prog_run. Also, when this is called from inside
xdp_do_flush, the redirect might add further entries to the
flush lists that are currently processed. Therefore, loop inside
xdp_do_flush until no more additional redirects were added.

Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
---
 include/linux/bpf.h        |  4 ++--
 include/trace/events/xdp.h | 10 ++++++----
 kernel/bpf/devmap.c        | 37 +++++++++++++++++++++++++++--------
 net/core/filter.c          | 48 +++++++++++++++++++++++++++-------------------
 4 files changed, 65 insertions(+), 34 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 3b94ec161e8c..1b57cbabf199 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2498,7 +2498,7 @@ struct sk_buff;
 struct bpf_dtab_netdev;
 struct bpf_cpu_map_entry;
 
-void __dev_flush(struct list_head *flush_list);
+void __dev_flush(struct list_head *flush_list, int *redirects);
 int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
 		    struct net_device *dev_rx);
 int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_frame *xdpf,
@@ -2740,7 +2740,7 @@ static inline struct bpf_token *bpf_token_get_from_fd(u32 ufd)
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline void __dev_flush(struct list_head *flush_list)
+static inline void __dev_flush(struct list_head *flush_list, int *redirects)
 {
 }
 
diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
index a7e5452b5d21..fba2c457e727 100644
--- a/include/trace/events/xdp.h
+++ b/include/trace/events/xdp.h
@@ -269,9 +269,9 @@ TRACE_EVENT(xdp_devmap_xmit,
 
 	TP_PROTO(const struct net_device *from_dev,
 		 const struct net_device *to_dev,
-		 int sent, int drops, int err),
+		 int sent, int drops, int redirects, int err),
 
-	TP_ARGS(from_dev, to_dev, sent, drops, err),
+	TP_ARGS(from_dev, to_dev, sent, drops, redirects, err),
 
 	TP_STRUCT__entry(
 		__field(int, from_ifindex)
@@ -279,6 +279,7 @@ TRACE_EVENT(xdp_devmap_xmit,
 		__field(int, to_ifindex)
 		__field(int, drops)
 		__field(int, sent)
+		__field(int, redirects)
 		__field(int, err)
 	),
 
@@ -288,16 +289,17 @@ TRACE_EVENT(xdp_devmap_xmit,
 		__entry->to_ifindex	= to_dev->ifindex;
 		__entry->drops		= drops;
 		__entry->sent		= sent;
+		__entry->redirects	= redirects;
 		__entry->err		= err;
 	),
 
 	TP_printk("ndo_xdp_xmit"
 		  " from_ifindex=%d to_ifindex=%d action=%s"
-		  " sent=%d drops=%d"
+		  " sent=%d drops=%d redirects=%d"
 		  " err=%d",
 		  __entry->from_ifindex, __entry->to_ifindex,
 		  __print_symbolic(__entry->act, __XDP_ACT_SYM_TAB),
-		  __entry->sent, __entry->drops,
+		  __entry->sent, __entry->drops, __entry->redirects,
 		  __entry->err)
 );
 
diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 7878be18e9d2..89bdec49ea40 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -334,7 +334,8 @@ static int dev_map_hash_get_next_key(struct bpf_map *map, void *key,
 static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
 				struct xdp_frame **frames, int n,
 				struct net_device *tx_dev,
-				struct net_device *rx_dev)
+				struct net_device *rx_dev,
+				int *redirects)
 {
 	struct xdp_txq_info txq = { .dev = tx_dev };
 	struct xdp_rxq_info rxq = { .dev = rx_dev };
@@ -359,6 +360,13 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
 			else
 				frames[nframes++] = xdpf;
 			break;
+		case XDP_REDIRECT:
+			err = xdp_do_redirect(rx_dev, &xdp, xdp_prog);
+			if (unlikely(err))
+				xdp_return_frame_rx_napi(xdpf);
+			else
+				*redirects += 1;
+			break;
 		default:
 			bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
 			fallthrough;
@@ -373,7 +381,7 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
 	return nframes; /* sent frames count */
 }
 
-static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
+static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags, int *redirects)
 {
 	struct net_device *dev = bq->dev;
 	unsigned int cnt = bq->count;
@@ -390,8 +398,10 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
 		prefetch(xdpf);
 	}
 
+	int new_redirects = 0;
 	if (bq->xdp_prog) {
-		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx);
+		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx,
+				&new_redirects);
 		if (!to_send)
 			goto out;
 	}
@@ -413,19 +423,21 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
 
 out:
 	bq->count = 0;
-	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent, err);
+	*redirects += new_redirects;
+	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent - new_redirects,
+			new_redirects, err);
 }
 
 /* __dev_flush is called from xdp_do_flush() which _must_ be signalled from the
  * driver before returning from its napi->poll() routine. See the comment above
  * xdp_do_flush() in filter.c.
  */
-void __dev_flush(struct list_head *flush_list)
+void __dev_flush(struct list_head *flush_list, int *redirects)
 {
 	struct xdp_dev_bulk_queue *bq, *tmp;
 
 	list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
-		bq_xmit_all(bq, XDP_XMIT_FLUSH);
+		bq_xmit_all(bq, XDP_XMIT_FLUSH, redirects);
 		bq->dev_rx = NULL;
 		bq->xdp_prog = NULL;
 		__list_del_clearprev(&bq->flush_node);
@@ -458,8 +470,17 @@ static void bq_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
 {
 	struct xdp_dev_bulk_queue *bq = this_cpu_ptr(dev->xdp_bulkq);
 
-	if (unlikely(bq->count == DEV_MAP_BULK_SIZE))
-		bq_xmit_all(bq, 0);
+	if (unlikely(bq->count == DEV_MAP_BULK_SIZE)) {
+		int redirects = 0;
+
+		bq_xmit_all(bq, 0, &redirects);
+
+		/* according to comment above xdp_do_flush() in
+		 * filter.c, xdp_do_flush is always called at
+		 * the end of the NAPI anyway, so no need to act
+		 * on the redirects here
+		 */
+	}
 
 	/* Ingress dev_rx will be the same for all xdp_frame's in
 	 * bulk_queue, because bq stored per-CPU and must be flushed
diff --git a/net/core/filter.c b/net/core/filter.c
index 8569cd2482ee..b33fc0b1444a 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4287,14 +4287,18 @@ static const struct bpf_func_proto bpf_xdp_adjust_meta_proto = {
 void xdp_do_flush(void)
 {
 	struct list_head *lh_map, *lh_dev, *lh_xsk;
+	int redirect;
 
-	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
-	if (lh_dev)
-		__dev_flush(lh_dev);
-	if (lh_map)
-		__cpu_map_flush(lh_map);
-	if (lh_xsk)
-		__xsk_map_flush(lh_xsk);
+	do {
+		redirect = 0;
+		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
+		if (lh_dev)
+			__dev_flush(lh_dev, &redirect);
+		if (lh_map)
+			__cpu_map_flush(lh_map);
+		if (lh_xsk)
+			__xsk_map_flush(lh_xsk);
+	} while (redirect > 0);
 }
 EXPORT_SYMBOL_GPL(xdp_do_flush);
 
@@ -4303,20 +4307,24 @@ void xdp_do_check_flushed(struct napi_struct *napi)
 {
 	struct list_head *lh_map, *lh_dev, *lh_xsk;
 	bool missed = false;
+	int redirect;
 
-	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
-	if (lh_dev) {
-		__dev_flush(lh_dev);
-		missed = true;
-	}
-	if (lh_map) {
-		__cpu_map_flush(lh_map);
-		missed = true;
-	}
-	if (lh_xsk) {
-		__xsk_map_flush(lh_xsk);
-		missed = true;
-	}
+	do {
+		redirect = 0;
+		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
+		if (lh_dev) {
+			__dev_flush(lh_dev, &redirect);
+			missed = true;
+		}
+		if (lh_map) {
+			__cpu_map_flush(lh_map);
+			missed = true;
+		}
+		if (lh_xsk) {
+			__xsk_map_flush(lh_xsk);
+			missed = true;
+		}
+	} while (redirect > 0);
 
 	WARN_ONCE(missed, "Missing xdp_do_flush() invocation after NAPI by %ps\n",
 		  napi->poll);

---
base-commit: 8e69c96df771ab469cec278edb47009351de4da6
change-id: 20240909-devel-koalo-fix-redirect-684639694951
prerequisite-patch-id: 6928ae7741727e3b2ab4a8c4256b06a861040a01

Best regards,
-- 
Florian Kauer <florian.kauer@linutronix.de>


