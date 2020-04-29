Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29031BDB1B
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Apr 2020 13:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgD2LvY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Apr 2020 07:51:24 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31809 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726511AbgD2LvY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Apr 2020 07:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588161083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=iD1+QqoAzcz9BZqPDAA8FX7h7o3hholgP3szeYuT0IQ=;
        b=FrpRAO/pgYRG0ztfRPojSVgB2DiRO7cAv+p8kJG0heEoTL4JudiIsphuhDVLhi14EVgf7p
        CpBfCDYxlqvqoSzQwmQ8LYo+WDbTlsSgdDZ62b6jbLl1Lvl9kYzOejKue1XGBy/GdckIWF
        DUZsMPGoX9sJS3t9X6OKUaI8VtHFog8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-ADpUIBqWNeiDhGh6yX0gGw-1; Wed, 29 Apr 2020 07:51:22 -0400
X-MC-Unique: ADpUIBqWNeiDhGh6yX0gGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E16804A40;
        Wed, 29 Apr 2020 11:51:21 +0000 (UTC)
Received: from [10.36.113.137] (ovpn-113-137.ams2.redhat.com [10.36.113.137])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 25B345D9C9;
        Wed, 29 Apr 2020 11:51:17 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>
Cc:     "Toke =?utf-8?b?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=" <toke@redhat.com>
Subject: fentry/fexit trace to BPF_PROG_TYPE_EXT BPF program not working
Date:   Wed, 29 Apr 2020 13:51:15 +0200
Message-ID: <666CF27B-18B4-420B-A0FC-29947DB1682D@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Alexie at al.

I was trying to attach a fentry/fexit trace to BPF_PROG_TYPE_EXT BPF 
program but I'm getting a verifier error, and not sure why. Is this 
supported?

This is the error:

libbpf: -- BEGIN DUMP LOG ---
libbpf:
arg#0 type is not a struct
Unrecognized arg#0 type PTR
; int BPF_PROG(trace_on_entry, struct xdp_md *xdp)
0: (79) r1 = *(u64 *)(r1 +0)
invalid bpf_context access off=0 size=8
processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 
peak_states 0 mark_read 0
libbpf: -- END LOG --

This is the actual fentry code using the BPF_PROG macro from 
tools/lib/bpf/bpf_tracing.h:

SEC("fentry/func")
int BPF_PROG(trace_on_entry, struct xdp_md *xdp)
{
     trace_to_perf_buffer(xdp, false, 0);
     return 0;
}

And some more details from bpftool on the program I try to attach to:

# bpftool prog show id 165
165: ext  name xdp_test_I  tag b5a46c6e9935298c  gpl
     loaded_at 2020-04-28T13:41:00+0000  uid 0
     xlated 136B  jited 108B  memlock 4096B
     btf_id 432

# bpftool prog dump xlated id 165
int xdp_test_I(struct xdp_md * ctx):
; int xdp_test_I(struct xdp_md *ctx)
    0: (b7) r2 = 10
; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
    1: (6b) *(u16 *)(r10 -8) = r2
    2: (18) r2 = 0x752520676f727020
    4: (7b) *(u64 *)(r10 -16) = r2
    5: (18) r2 = 0x3a5d315b53534150
    7: (7b) *(u64 *)(r10 -24) = r2
    8: (79) r3 = *(u64 *)(r1 +40)
    9: (79) r3 = *(u64 *)(r3 +0)
   10: (61) r3 = *(u32 *)(r3 +256)
   11: (bf) r1 = r10
;
   12: (07) r1 += -24
; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
   13: (b7) r2 = 18
   14: (85) call bpf_trace_printk#-54752
; return XDP_PASS;
   15: (b7) r0 = 2
   16: (95) exit

Thanks in advance...

//Eelco

