Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B19440ED3A
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Sep 2021 00:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240873AbhIPWRJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Sep 2021 18:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240827AbhIPWRJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Sep 2021 18:17:09 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420AFC061574
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Sep 2021 15:15:48 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id bk29so11258297qkb.8
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Sep 2021 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2aXSCrVVZjae2ffU0iMPA+7ZKoB3bFLzxqJQor7yz68=;
        b=oNIgLHDBjA8c7fXpwLZc/UHlQ3auepCKdVaGajHLCaiARP6N6+LmR3dAnazujtasnD
         uICRa0IaGnzveZjkBoy5d2ffx2BMq0ipWJnyACnIko3vEvQpMY4vQnsxXTHcXzoM+B+p
         YQMA6RD5WGuB+MwvELTZyDMrvWipFhPc+T33w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2aXSCrVVZjae2ffU0iMPA+7ZKoB3bFLzxqJQor7yz68=;
        b=PjNU+0mWveLS5mhgdjv5X/uVChjZe4u6xlJSKR1Qh0320FX2248arMCXxJPHmZrN1L
         M5jwOEddjeLguxlDebtS+1OznvuT2gSTzL81u2kKFVqGgcLaPq5KYyqgOAwklmk9Wamm
         g4vVhRFQLrF5HabDJtBm+bff6ZBTF1sXWucNr0xIvONYvfp2ydag3KWB8mfLVny45GPa
         jBeIcpDy22h0nhslbjoytsbe+7rP192sJIbOQ6gtI6mZ0KMGguOgERL1vg9JfpiepRGv
         awZXBXicip3hqM4m8TyAcRJnFpmkOXa76zLT4kIBKL8cCtQHnLuMPrq9yiFxeM/lQgNQ
         srwg==
X-Gm-Message-State: AOAM532BbcczXSFY8d03GRAL/FWH9q/QSzYb0gym/JNzLB8Pd/hKMn0l
        5D6RdqP5bA95F1/TJUuKfjEy+YbzJcKe8Uq8SBJh0TwU5gZdZM1z
X-Google-Smtp-Source: ABdhPJykGc+Yyj7rOpJRobOayZ5hTmCqb/jUbcXZc4nnF4gT9qxbquVg/j1e5q2+VyqetL94/3+7h51JYHBxwGBEzwg=
X-Received: by 2002:a25:7390:: with SMTP id o138mr10060636ybc.205.1631830546970;
 Thu, 16 Sep 2021 15:15:46 -0700 (PDT)
MIME-Version: 1.0
From:   Neal Shukla <nshukla@riotgames.com>
Date:   Thu, 16 Sep 2021 15:15:36 -0700
Message-ID: <CAJwr_MfAwrWu1XiSQoEVR-vRs0jbLXi9G4HBsxeRFQDJi0V6Eg@mail.gmail.com>
Subject: Issue with verifier error
To:     Xdp <xdp-newbies@vger.kernel.org>
Cc:     Lisa Watanabe <lwatanabe@riotgames.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

We've encountered a compiler issue which leads to issues with the
verifier. We compile with clang using the O2 optimization level. When we
have a call to bpf_ntohs(udp_header->dest) and attempt to load the debug version
we get a verifier error. Removing the bpf_ntohs(udp_header->dest) call and
loading the debug version results in no errors, as does loading the
non-debug version of our code.

[Working code]
__u16 port_index = udp_header->dest;
__u64 tenant_id = (*tenants_by_port)[port_index];
if (tenant_id == INVALID_TENANT_ID) {
    debug_trace_printk(
        "Failed to find tenant for port %d\n",
        bpf_ntohs(port_index)
    );
    update_metric(&metrics_map, MISSING_TENANT + entry_metric_offset);
    packet_metadata->return_action = ACTION_DROP;
    return PROGRAM_RETURN_CONTINUE;
}

[Code which leads to verifier error]
__u16 port_index = bpf_ntohs(udp_header->dest);
__u64 tenant_id = (*tenants_by_port)[port_index];
if (tenant_id == INVALID_TENANT_ID) {
    debug_trace_printk(
        "Failed to find tenant for port %d\n",
        port_index
    );
    update_metric(&metrics_map, MISSING_TENANT + entry_metric_offset);
    packet_metadata->return_action = ACTION_DROP;
    return PROGRAM_RETURN_CONTINUE;
}

[Verifier error]
from 346 to 424: R0=map_value(id=0,off=0,ks=4,vs=524288,imm=0)
R6=mem(id=0,ref_obj_id=0,off=0,imm=0) R7=ctx(id=0,off=0,imm=0)
R8=pkt(id=0,off=0,r=42,imm=0) R9=pkt(id=0,off=30,r=42,imm=0) R10=fp0
; __u16 port_index = bpf_ntohs(udp_header->dest);
424: (69) r3 = *(u16 *)(r8 +36)
425: (dc) r3 = be16 r3
; __u64 tenant_id = (*tenants_by_port)[port_index];
426: (bf) r1 = r3
427: (67) r1 <<= 3
428: (0f) r0 += r1
last_idx 428 first_idx 424
regs=2 stack=0 before 427: (67) r1 <<= 3
regs=2 stack=0 before 426: (bf) r1 = r3
regs=8 stack=0 before 425: (dc) r3 = be16 r3
regs=9 stack=0 before 424: (69) r3 = *(u16 *)(r8 +36)
    R0_rw=map_value(id=0,off=0,ks=4,vs=524288,imm=0)
R6=mem(id=0,ref_obj_id=0,off=0,imm=0) R7=ctx(id=0,off=0,imm=0)
R8_r=pkt(id=0,off=0,r=42,imm=0) R9_w=pkt(id=0,off=30,r=42,imm=0)
R10=fp0
parent already had regs=0 stack=0 marks
math between map_value pointer and register with unbounded min value
is not allowed
processed 585 insns (limit 1000000) max_states_per_insn 0 total_states
36 peak_states 36 mark_read 4

[Object dump of working code]
0000000000000d40 <LBB0_51>:
;     __u16 port_index = udp_header->dest;
     424:    69 83 24 00 00 00 00 00    r3 = *(u16 *)(r8 + 36)
;     __u64 tenant_id = (*tenants_by_port)[port_index];
     425:    bf 31 00 00 00 00 00 00    r1 = r3
     426:    67 01 00 00 03 00 00 00    r1 <<= 3
     427:    0f 10 00 00 00 00 00 00    r0 += r1
     428:    79 01 00 00 00 00 00 00    r1 = *(u64 *)(r0 + 0)
;     if (tenant_id == INVALID_TENANT_ID) {
     429:    55 01 1e 00 00 00 00 00    if r1 != 0 goto +30 <LBB0_54>
     430:    b7 08 00 00 00 00 00 00    r8 = 0
;         debug_trace_printk(
     431:    73 8a ca ff 00 00 00 00    *(u8 *)(r10 - 54) = r8
     432:    b7 01 00 00 64 0a 00 00    r1 = 2660
     433:    6b 1a c8 ff 00 00 00 00    *(u16 *)(r10 - 56) = r1
     434:    18 01 00 00 72 20 70 6f 00 00 00 00 72 74 20 25    r1 =
2675266213502787698 ll
     436:    7b 1a c0 ff 00 00 00 00    *(u64 *)(r10 - 64) = r1
     437:    18 01 00 00 65 6e 61 6e 00 00 00 00 74 20 66 6f    r1 =
8027139070274661989 ll
     439:    7b 1a b8 ff 00 00 00 00    *(u64 *)(r10 - 72) = r1
     440:    18 01 00 00 6f 20 66 69 00 00 00 00 6e 64 20 74    r1 =
8367798533031862383 ll
     442:    7b 1a b0 ff 00 00 00 00    *(u64 *)(r10 - 80) = r1
     443:    18 01 00 00 46 61 69 6c 00 00 00 00 65 64 20 74    r1 =
8367798494427701574 ll
     445:    7b 1a a8 ff 00 00 00 00    *(u64 *)(r10 - 88) = r1
     446:    dc 03 00 00 10 00 00 00    r3 = be16 r3
     447:    bf a1 00 00 00 00 00 00    r1 = r10
     448:    07 01 00 00 a8 ff ff ff    r1 += -88
     449:    b7 02 00 00 23 00 00 00    r2 = 35
     450:    85 00 00 00 06 00 00 00    call 6
     451:    b7 01 00 00 08 00 00 00    r1 = 8
;     __u32 key = (__u32) metric;
     452:    63 1a a8 ff 00 00 00 00    *(u32 *)(r10 - 88) = r1
     453:    bf a2 00 00 00 00 00 00    r2 = r10
;         debug_trace_printk(
     454:    07 02 00 00 a8 ff ff ff    r2 += -88
;     __u64 *curr_metric = bpf_map_lookup_elem(map, &key);
     455:    18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00    r1 = 0 ll
     457:    85 00 00 00 01 00 00 00    call 1
;     if (curr_metric) {
     458:    15 00 b8 01 00 00 00 00    if r0 == 0 goto +440 <LBB0_68>
     459:    05 00 b4 01 00 00 00 00    goto +436 <LBB0_67>

[Object dump of code which leads to verifier error]
0000000000000d40 <LBB0_51>:
;     __u16 port_index = bpf_ntohs(udp_header->dest);
     424:    69 83 24 00 00 00 00 00    r3 = *(u16 *)(r8 + 36)
     425:    dc 03 00 00 10 00 00 00    r3 = be16 r3
;     __u64 tenant_id = (*tenants_by_port)[port_index];
     426:    bf 31 00 00 00 00 00 00    r1 = r3
     427:    67 01 00 00 03 00 00 00    r1 <<= 3
     428:    0f 10 00 00 00 00 00 00    r0 += r1
     429:    79 01 00 00 00 00 00 00    r1 = *(u64 *)(r0 + 0)
;     if (tenant_id == INVALID_TENANT_ID) {
     430:    55 01 1d 00 00 00 00 00    if r1 != 0 goto +29 <LBB0_54>
     431:    b7 08 00 00 00 00 00 00    r8 = 0
;         debug_trace_printk(
     432:    73 8a ca ff 00 00 00 00    *(u8 *)(r10 - 54) = r8
     433:    b7 01 00 00 64 0a 00 00    r1 = 2660
     434:    6b 1a c8 ff 00 00 00 00    *(u16 *)(r10 - 56) = r1
     435:    18 01 00 00 72 20 70 6f 00 00 00 00 72 74 20 25    r1 =
2675266213502787698 ll
     437:    7b 1a c0 ff 00 00 00 00    *(u64 *)(r10 - 64) = r1
     438:    18 01 00 00 65 6e 61 6e 00 00 00 00 74 20 66 6f    r1 =
8027139070274661989 ll
     440:    7b 1a b8 ff 00 00 00 00    *(u64 *)(r10 - 72) = r1
     441:    18 01 00 00 6f 20 66 69 00 00 00 00 6e 64 20 74    r1 =
8367798533031862383 ll
     443:    7b 1a b0 ff 00 00 00 00    *(u64 *)(r10 - 80) = r1
     444:    18 01 00 00 46 61 69 6c 00 00 00 00 65 64 20 74    r1 =
8367798494427701574 ll
     446:    7b 1a a8 ff 00 00 00 00    *(u64 *)(r10 - 88) = r1
     447:    bf a1 00 00 00 00 00 00    r1 = r10
     448:    07 01 00 00 a8 ff ff ff    r1 += -88
     449:    b7 02 00 00 23 00 00 00    r2 = 35
     450:    85 00 00 00 06 00 00 00    call 6
     451:    b7 01 00 00 08 00 00 00    r1 = 8
;     __u32 key = (__u32) metric;
     452:    63 1a a8 ff 00 00 00 00    *(u32 *)(r10 - 88) = r1
     453:    bf a2 00 00 00 00 00 00    r2 = r10
;         debug_trace_printk(
     454:    07 02 00 00 a8 ff ff ff    r2 += -88
;     __u64 *curr_metric = bpf_map_lookup_elem(map, &key);
     455:    18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00    r1 = 0 ll
     457:    85 00 00 00 01 00 00 00    call 1
;     if (curr_metric) {
     458:    15 00 b8 01 00 00 00 00    if r0 == 0 goto +440 <LBB0_68>
     459:    05 00 b4 01 00 00 00 00    goto +436 <LBB0_67>


Based on the object dumps and the verifier error it seems the error is with
this line:
 __u64 tenant_id = (*tenants_by_port)[port_index];
Specifically, `port_index` doesn't seem to have a minimum bound. `port_index`
is an unsigned 16 bit integer, and the maximum number of entries for the
bpf map `tenants_by_port` is 65536. This means the every __u16 value should
be a valid index within that map. For some reason, converting the endianess
before the debug statement leads to this verifier error.

If we comment out the debug statement, our verifier error disappears.
[Code with debug_trace_printk commented out]
    __u16 port_index = bpf_ntohs(udp_header->dest);
    __u64 tenant_id = (*tenants_by_port)[port_index];
    if (tenant_id == INVALID_TENANT_ID) {
        // debug_trace_printk(
        //     "Failed to find tenant for port %d\n",
        //     port_index
        // );
        update_metric(&metrics_map, MISSING_TENANT + entry_metric_offset);
        packet_metadata->return_action = ACTION_DROP;
        return PROGRAM_RETURN_CONTINUE;
    }

[Object dump of code with debug_trace_printk commented out]
0000000000000c20 <LBB0_51>:
;     __u16 port_index = bpf_ntohs(udp_header->dest);
     388:    69 81 24 00 00 00 00 00    r1 = *(u16 *)(r8 + 36)
     389:    dc 01 00 00 40 00 00 00    r1 = be64 r1
;     __u64 tenant_id = (*tenants_by_port)[port_index];
     390:    77 01 00 00 2d 00 00 00    r1 >>= 45
     391:    57 01 00 00 f8 ff 07 00    r1 &= 524280
     392:    0f 10 00 00 00 00 00 00    r0 += r1
     393:    79 01 00 00 00 00 00 00    r1 = *(u64 *)(r0 + 0)
;     if (tenant_id == INVALID_TENANT_ID) {
     394:    55 01 2d 00 00 00 00 00    if r1 != 0 goto +45 <LBB0_54>
     395:    b7 01 00 00 08 00 00 00    r1 = 8
;     __u32 key = (__u32) metric;
     396:    63 1a a8 ff 00 00 00 00    *(u32 *)(r10 - 88) = r1
     397:    bf a2 00 00 00 00 00 00    r2 = r10
     398:    07 02 00 00 a8 ff ff ff    r2 += -88
;     __u64 *curr_metric = bpf_map_lookup_elem(map, &key);
     399:    18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00    r1 = 0 ll
     401:    85 00 00 00 01 00 00 00    call 1
;     if (curr_metric) {
     402:    15 00 21 00 00 00 00 00    if r0 == 0 goto +33 <LBB0_16>
     403:    05 00 1d 00 00 00 00 00    goto +29 <LBB0_15>

Any insight into the issue would be much appreciated. Thank you!
- Neal
