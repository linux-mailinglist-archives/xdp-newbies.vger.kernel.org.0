Return-Path: <xdp-newbies+bounces-106-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C5D9286E9
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 12:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B7D1C21D47
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA181482FC;
	Fri,  5 Jul 2024 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rf1f2e40";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Hvik/o2"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415522313;
	Fri,  5 Jul 2024 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720175975; cv=none; b=oazU1/AU6EGhHidKWtv5BWQAK5WJ9zIjJpF9eNjptYfWTK+hn8rWoQ5WIrUJIVAh83g0mK95xw6V3yd/Dm7si4mqW8qLvnhUuJcwPpoyKEA4HT4CEyMV8hrQHu4FvKYYMnPTKjFrA/mv1PnmYtE8UEGYGXJkVJzozStMZnEn6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720175975; c=relaxed/simple;
	bh=xx/iXhdnMcMeu42vvxLQvR6u1PLDs0h9EQj+jxb0oII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GMrKS5zOI3ExWiDiKCJHqZ/vDBap5/YNr+AECGdLWntFBdGPL2CwvRaORR+dGlGTJZVyUI1SxJxodLkgV9GaLjMtH+Io3PFlmD1Ei+3wOU9fL9qxBNVqn33mbvlbxaReQxkZekg6tosKznsK273Bs8BSXHvwJtDUvuDsaCQgLf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rf1f2e40; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Hvik/o2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Florian Kauer <florian.kauer@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720175971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ShxsTHt1keFbzwb179iWJMWKlP8VZz8CCQNUg1KVQts=;
	b=Rf1f2e40NMk9h1adpFVVyrtKgt7fygDdrswuWY45TKG1ZLsIfsrHLt3kIuNZktls2MG6OC
	lg0jEvJ8nbN60dldQcCswnpFXpbCL9nPJEU4i2bq454MdZ9jCTyiyEUiyuHX7wA6xAWgwL
	+87HY7NedY4y9vtxcvQ18iAEyDpaltgZJNrNq/E9AopqDZRXIAarcHImRZAMpkOZSIr8x/
	Aadc+ry86YmtDs09+CT+M+upqwaR/1KNGgUiU6G4y4MJ3XVk8JdYaJvHSRlkiIEAz6EgaL
	LrOe2edlbRMiCeI0BVY+X3RrMzla5C0YAOcxzNtHY4C8P5AOHH1MaSC57hBKUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720175971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ShxsTHt1keFbzwb179iWJMWKlP8VZz8CCQNUg1KVQts=;
	b=4Hvik/o20U/SecpmUM+UXTPQpKhPwx1nFudt/7TEC6t9ZY8Chv4EWS7Z0wnzIr5u/7lsEP
	0XthIRrtdSpMDOCw==
To: toke@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com
Cc: Florian Kauer <florian.kauer@linutronix.de>,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xdp-newbies@vger.kernel.org
Subject: [PATCH] bpf: provide map key to BPF program after redirect
Date: Fri,  5 Jul 2024 12:38:53 +0200
Message-Id: <20240705103853.21235-1-florian.kauer@linutronix.de>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both DEVMAP as well as CPUMAP provide the possibility
to attach BPF programs to their entries that will be
executed after a redirect was performed.

With BPF_F_BROADCAST it is in also possible to execute
BPF programs for multiple clones of the same XDP frame
which is, for example, useful for establishing redundant
traffic paths by setting, for example, different VLAN tags
for the replicated XDP frames.

Currently, this program itself has no information about
the map entry that led to its execution. While egress_ifindex
can be used to get this information indirectly and can
be used for path dependent processing of the replicated frames,
it does not work if multiple entries share the same egress_ifindex.

Therefore, extend the xdp_md struct with a map_key
that contains the key of the associated map entry
after performing a redirect.

See
https://lore.kernel.org/xdp-newbies/5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de/T/#u
for the discussion that led to this patch.

Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
---
 include/net/xdp.h        |  3 +++
 include/uapi/linux/bpf.h |  2 ++
 kernel/bpf/devmap.c      |  6 +++++-
 net/core/filter.c        | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index e6770dd40c91..e70f4dfea1a2 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -86,6 +86,7 @@ struct xdp_buff {
 	struct xdp_txq_info *txq;
 	u32 frame_sz; /* frame size to deduce data_hard_end/reserved tailroom*/
 	u32 flags; /* supported values defined in xdp_buff_flags */
+	u64 map_key; /* set during redirect via a map */
 };
 
 static __always_inline bool xdp_buff_has_frags(struct xdp_buff *xdp)
@@ -175,6 +176,7 @@ struct xdp_frame {
 	struct net_device *dev_rx; /* used by cpumap */
 	u32 frame_sz;
 	u32 flags; /* supported values defined in xdp_buff_flags */
+	u64 map_key; /* set during redirect via a map */
 };
 
 static __always_inline bool xdp_frame_has_frags(struct xdp_frame *frame)
@@ -257,6 +259,7 @@ void xdp_convert_frame_to_buff(struct xdp_frame *frame, struct xdp_buff *xdp)
 	xdp->data_meta = frame->data - frame->metasize;
 	xdp->frame_sz = frame->frame_sz;
 	xdp->flags = frame->flags;
+	xdp->map_key = frame->map_key;
 }
 
 static inline
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 35bcf52dbc65..7dbb0f2a236c 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -6455,6 +6455,8 @@ struct xdp_md {
 	__u32 rx_queue_index;  /* rxq->queue_index  */
 
 	__u32 egress_ifindex;  /* txq->dev->ifindex */
+
+	__u64 map_key; /* set during redirect via a map in xdp_buff */
 };
 
 /* DEVMAP map-value layout
diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index da1fec906b96..fac3e8a6c51e 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -574,6 +574,8 @@ static int dev_map_enqueue_clone(struct bpf_dtab_netdev *obj,
 	if (!nxdpf)
 		return -ENOMEM;
 
+	nxdpf->map_key = obj->idx;
+
 	bq_enqueue(obj->dev, nxdpf, dev_rx, obj->xdp_prog);
 
 	return 0;
@@ -670,8 +672,10 @@ int dev_map_enqueue_multi(struct xdp_frame *xdpf, struct net_device *dev_rx,
 	}
 
 	/* consume the last copy of the frame */
-	if (last_dst)
+	if (last_dst) {
+		xdpf->map_key = last_dst->idx;
 		bq_enqueue(last_dst->dev, xdpf, dev_rx, last_dst->xdp_prog);
+	}
 	else
 		xdp_return_frame_rx_napi(xdpf); /* dtab is empty */
 
diff --git a/net/core/filter.c b/net/core/filter.c
index f1c37c85b858..7762a6d6900f 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4394,10 +4394,12 @@ static __always_inline int __xdp_do_redirect_frame(struct bpf_redirect_info *ri,
 			err = dev_map_enqueue_multi(xdpf, dev, map,
 						    flags & BPF_F_EXCLUDE_INGRESS);
 		} else {
+			xdpf->map_key = ri->tgt_index;
 			err = dev_map_enqueue(fwd, xdpf, dev);
 		}
 		break;
 	case BPF_MAP_TYPE_CPUMAP:
+		xdpf->map_key = ri->tgt_index;
 		err = cpu_map_enqueue(fwd, xdpf, dev);
 		break;
 	case BPF_MAP_TYPE_UNSPEC:
@@ -4407,6 +4409,7 @@ static __always_inline int __xdp_do_redirect_frame(struct bpf_redirect_info *ri,
 				err = -EINVAL;
 				break;
 			}
+			xdpf->map_key = ri->tgt_index;
 			err = dev_xdp_enqueue(fwd, xdpf, dev);
 			break;
 		}
@@ -9022,6 +9025,16 @@ static bool xdp_is_valid_access(int off, int size,
 	case offsetof(struct xdp_md, data_end):
 		info->reg_type = PTR_TO_PACKET_END;
 		break;
+	case offsetof(struct xdp_md, map_key):
+		if (prog->expected_attach_type != BPF_XDP_DEVMAP &&
+		    prog->expected_attach_type != BPF_XDP_CPUMAP) {
+			return false;
+		}
+
+		if (size != sizeof(__u64))
+			return false;
+
+		return true;
 	}
 
 	return __is_valid_xdp_access(off, size);
@@ -10116,6 +10129,11 @@ static u32 xdp_convert_ctx_access(enum bpf_access_type type,
 		*insn++ = BPF_LDX_MEM(BPF_W, si->dst_reg, si->dst_reg,
 				      offsetof(struct net_device, ifindex));
 		break;
+	case offsetof(struct xdp_md, map_key):
+		*insn++ = BPF_LDX_MEM(BPF_FIELD_SIZEOF(struct xdp_buff, map_key),
+				      si->dst_reg, si->src_reg,
+				      offsetof(struct xdp_buff, map_key));
+		break;
 	}
 
 	return insn - insn_buf;
-- 
2.39.2


