Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936A03A6C77
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Jun 2021 18:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhFNQyk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Jun 2021 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhFNQyk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Jun 2021 12:54:40 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D772C061574
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Jun 2021 09:52:37 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso10489449pjb.0
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Jun 2021 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:mime-version;
        bh=BjsHyJh40z8lnvQJvycWkR/JAgcT7rs3GctEikPvnng=;
        b=H8/WjQ7XxXo4keRhRpJR4XCj+jTJMPv4qBeS6cHMMGV2nTB6MefWKAhod332lo3FAG
         6ZqGglEhuwEC+ja+FAP2SidHzOiVboLov1Q3/poADjzz5f8Da0QyLnk1rx6H81VJQNq8
         nLWTyoJ9aRYxAm6FnTVwhmNI3FgltrkGL7H2/U84h/rVD/6sdXheirKTZ3R0HxM6QkJl
         lIaHoC+ptmVUmAHV22H2W+F6balv3sNYq7NIm7PMwEAH1FdRYNss18cDJunU2Q+6YMXU
         bCen3KbM2G7q4IS+uENIHpgtnX2pa98kHyuPG6zUkEd30hCk9bsPIsUd+5tLYZmRdgN7
         wxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version;
        bh=BjsHyJh40z8lnvQJvycWkR/JAgcT7rs3GctEikPvnng=;
        b=KKL3KuE2N6eBPR9724RNC7hbcKBElRazFie6q1oVBYiruAeN5aPe75SguxIInnJ/EO
         bKKVSl8lL7jDNV1Q+Z/kqNFYnzZYYTVl3MSyITbagpssPCHaPpWTnuT5qckSI19Cg0gC
         fuB65K6q++8hkZ9GTFfqb+iiLHURxBXI7O05K3HOp4RNKNrmccJpLba0Bsiqlvd5Y5Kr
         xfDD4ztXeTTffVsdZprJiuBxoifnQ36Jpl1X8MQlCMsl4joJpJ5IpSe3LgvOPSMS97CV
         q4fKIKGLqGwCpxg6ymd86TX1+jMprqiNBQ8p1lyBpozueprCaYGoS876vEwiD74XaMxo
         xX3w==
X-Gm-Message-State: AOAM5330GG5aUASloMWR42blTTqNLQ4NDboGoqEFU7cyLkg8/waeMDb9
        G4ZpuF3qkYyHoUOXyVLxzKb0BVJTZmE=
X-Google-Smtp-Source: ABdhPJzADHYYBqdRafr5mx1ETI0tI0YbDwB87H+DcMtKbjXIuU8REu2kyh9O3OmSNlcXE/lWrgsCug==
X-Received: by 2002:a17:90a:6d82:: with SMTP id a2mr19719326pjk.150.1623689554352;
        Mon, 14 Jun 2021 09:52:34 -0700 (PDT)
Received: from sea-l-00029082.olympus.f5net.com (d66-183-43-174.bchsia.telus.net. [66.183.43.174])
        by smtp.gmail.com with ESMTPSA id s16sm4740105pfc.33.2021.06.14.09.52.33
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:52:33 -0700 (PDT)
From:   Vincent Li <vincent.mc.li@gmail.com>
X-Google-Original-From: Vincent Li <vli@gmail.com>
Date:   Mon, 14 Jun 2021 09:52:32 -0700 (PDT)
To:     xdp-newbies@vger.kernel.org
Subject: R6 invalid mem access 'inv'
Message-ID: <d85bbf6-282e-b197-4cd4-7677c4c201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I am newbie to BPF and I have a consistent "R6 invalid mem access 'inv'" 
error in issue https://github.com/cilium/cilium/issues/16517 when 
attempting to rewrite the skb destination MAC address. I am guessing I 
could be missing something basic and not nessarily related to Cilium. 
This is xdp newbie list, but by any chance, anyone could point out where I 
did wrong, I have tried three variant of patches there and I get same "R6 
invalid mem access 'inv'" error at bpf load and verifier time.

one of the patch is simply to hard code the MAC as below, but still got 
the invalid mem access error

diff --git a/bpf/lib/common.h b/bpf/lib/common.h
index 3e1b11a5f..c6e980776 100644
--- a/bpf/lib/common.h
+++ b/bpf/lib/common.h
@@ -23,6 +23,7 @@
  * #endif
  */
 #define NEEDS_TIMEOUT 1
+#define VTEP_MAC  { .addr = { 0xce, 0x72, 0xa7, 0x03, 0x88, 0x58 } }
 
 #ifndef AF_INET
 #define AF_INET 2
diff --git a/bpf/lib/encap.h b/bpf/lib/encap.h
index dfd87bd82..044579b00 100644
--- a/bpf/lib/encap.h
+++ b/bpf/lib/encap.h
@@ -119,6 +119,7 @@ __encap_with_nodeid(struct __ctx_buff *ctx, __u32 
tunnel_endpoint,
        struct bpf_tunnel_key key = {};
        __u32 node_id;
        int ret;
+       union macaddr vtep_mac = VTEP_MAC;
 
        /* When encapsulating, a packet originating from the local host is
         * being considered as a packet from a remote node as it is being
@@ -137,6 +138,8 @@ __encap_with_nodeid(struct __ctx_buff *ctx, __u32 
tunnel_endpoint,
        ret = ctx_set_tunnel_key(ctx, &key, sizeof(key), 
BPF_F_ZERO_CSUM_TX);
        if (unlikely(ret < 0))
                return DROP_WRITE_ERROR;
+       if (eth_store_daddr(ctx, (__u8 *) &vtep_mac.addr, 0) < 0)
+                return DROP_WRITE_ERROR;
 
        send_trace_notify(ctx, TRACE_TO_OVERLAY, seclabel, 0, 0, 
ENCAP_IFINDEX,
                          0, monitor);
 
