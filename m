Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987B550365B
	for <lists+xdp-newbies@lfdr.de>; Sat, 16 Apr 2022 13:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbiDPLec (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 16 Apr 2022 07:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbiDPLeb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 16 Apr 2022 07:34:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3230940E52
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 04:31:59 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id l7so19387631ejn.2
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:subject;
        bh=CTgatSO2RgScOluif9tyt6I7sBVurTWonIKFH77Ehc4=;
        b=AkAjLe8awadrZ83ZiIbYO6wGEizd4A9mHv0DiyyiDsngC/tU7vvz+AHOsk1LFh5Abq
         1OLlHjRNpD+4FxaymT1Aab9B+6DfGL6YibcGdJxlTzHmPhABITa4x5vn1JEVFCkR79wd
         2D/q0RN97g1FrtxW1BOd8CxmGSDC52GSrJK86JpWAsYQ0XRsKmBWICtELj6fwOhBZren
         HgZyOkcPYbMzGLmPJnDHSimIR4FyS5/SgcruFLafwa+6rPTIYLH5tVecPneMLaT45M3d
         LLmTKmw7Umr2xLlnzjQ59V41ccLjYZSLyq4qGlgEopvJ5BTDSLWbOFSpqMawdazbHmGm
         xQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:subject;
        bh=CTgatSO2RgScOluif9tyt6I7sBVurTWonIKFH77Ehc4=;
        b=dkJDkqzz40Zqzn65EXfkCjoFOLOqfAg0PJLDU/h8tmKcATjCxkJ63vFWcxtXTLkBz2
         e10Sezupq4JtHaO9/RriAEvtB2TLaXEHyIQGCZ0dJp6J9E5LmO97IMXPPDeim+bYS5Sf
         JR1G+4OloRU/3nysrXbCgaUgtN+bx4m2G4UyxwpBJngOtMkXP5F5hGxgqvy0MtIEDapo
         ukBk9aIXCDspGf1ty2AjSnB7lDYaX4QO9AteTz3PxsAILIpJOtmrNAIvAmqcAYeRO0Xe
         s9bPmsLh/bSDx8MA53Rt8vVQ/VaiJCOGHwopf0+RRgetmjKbfMj13pNFm7KimVr90HEK
         VzTQ==
X-Gm-Message-State: AOAM531AvGQYgBszB7fWf6f2BzQE0DzUO1L79D5F5w4wmTov/tP/ocTs
        mIQOMolyErMG87qfQxNdD96Xu/E64nIQnQ==
X-Google-Smtp-Source: ABdhPJwrQlqzn6SasXSE3LR4DiJwHGdTTH1R3dFE1ltl/WVVw/WHcIL/s3CN8BmWu/ANcuIszMQ4kA==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id k24-20020a17090632d800b006ced8500f79mr2308747ejk.414.1650108717284;
        Sat, 16 Apr 2022 04:31:57 -0700 (PDT)
Received: from gmail.com ([37.163.63.240])
        by smtp.gmail.com with ESMTPSA id l13-20020a056402254d00b0041d9247d8efsm4174089edb.26.2022.04.16.04.31.56
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 04:31:56 -0700 (PDT)
Message-ID: <625aa92c.1c69fb81.af47c.3497@mx.google.com>
Date:   Sat, 16 Apr 2022 13:36:53 +0200
From:   ctxspi@gmail.com
To:     xdp-newbies@vger.kernel.org
Subject: XDP invalid mem access
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi

On my virtual machine with kernel: Linux host.mydomain.cxm 5.16.9-1.el8.elrepo.x86_64 #1 SMP PREEMPT Thu Feb 10 10:45:17 EST 2022 x86_64 x86_64 x86_64 GNU/Linux

I'am trying to add vlan support ETH_P_8021Q, but when I load this code on interface:

static __always_inline int mienro_process_packet(struct xdp_md *ctx, u32 flags)
{
	const __u32 ifingress = ctx->ingress_ifindex;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct bpf_fib_lookup fib_params;
	struct ipv6hdr *ip6h = NULL;
	struct iphdr *iph = NULL;
	u16 h_proto = 0;
	u64 nh_off = 0;
	int rc;

	if (data + sizeof(struct ethhdr) > data_end)
		return XDP_DROP;

	if (((struct ethhdr *)data)->h_proto == htons(ETH_P_8021Q))
	{
		nh_off = sizeof(struct vlan_ethhdr);

		if (data + sizeof(struct vlan_ethhdr) > data_end)
			return XDP_DROP;

		h_proto = ((struct vlan_ethhdr *)data)->h_vlan_encapsulated_proto;
	}
	else
	{
		nh_off = sizeof(struct ethhdr); // layer 2 header length
		h_proto = ((struct ethhdr *)data)->h_proto;
	}

	if (data + nh_off > data_end)
		return XDP_DROP;

	if (h_proto == htons(ETH_P_IP))
	{
		iph = data + nh_off;

		if (iph + 1 > data_end)
			return XDP_DROP;

		__builtin_memset(&fib_params, 0, sizeof(fib_params));
		fib_params.ifindex = ctx->ingress_ifindex;
		fib_params.family	= AF_INET;
		fib_params.tos		= iph->tos;
		fib_params.l4_protocol	= iph->protocol;
		fib_params.sport	= 0;
		fib_params.dport	= 0;
		fib_params.tot_len	= ntohs(iph->tot_len);
		fib_params.ipv4_src	= iph->saddr;
		fib_params.ipv4_dst	= iph->daddr;
	}
	else if (h_proto == htons(ETH_P_IPV6))
	{
		ip6h = data + nh_off;

		if (ip6h + 1 > data_end)
			return XDP_DROP;

		__builtin_memset(&fib_params, 0, sizeof(fib_params));
		fib_params.ifindex = ctx->ingress_ifindex;
		fib_params.family				= AF_INET6;
		fib_params.flowinfo				= *(__be32 *)ip6h & IPV6_FLOWINFO_MASK;
		fib_params.l4_protocol			= ip6h->nexthdr;
		fib_params.sport				= 0;
		fib_params.dport				= 0;
		fib_params.tot_len				= ntohs(ip6h->payload_len);
		*((struct in6_addr *)fib_params.ipv6_src)	= ip6h->saddr;
		*((struct in6_addr *)fib_params.ipv6_dst)	= ip6h->daddr;
	}
	else
		return XDP_DROP;

	rc = bpf_fib_lookup(ctx, &fib_params, sizeof(fib_params), flags);

	if (rc == BPF_FIB_LKUP_RET_SUCCESS)
	{
		if (h_proto == htons(ETH_P_IP))
		{
			if (iph->protocol == IPPROTO_TCP)
				return XDP_PASS;

			return XDP_DROP;
		}
		else if (h_proto == htons(ETH_P_IPV6))
		{
			if (ip6h && ip6h->nexthdr == IPPROTO_TCP)
				return XDP_PASS;

			return XDP_DROP;
		}

		return XDP_DROP;
	}
	else if (rc == BPF_FIB_LKUP_RET_NOT_FWDED)
	{
		if (h_proto   == htons(ETH_P_IP))
		{
			if (iph->protocol == IPPROTO_TCP)
				return XDP_PASS;

			return XDP_DROP;
		}
		else if (h_proto == htons(ETH_P_IPV6))
		{
			if (ip6h && ip6h->nexthdr == IPPROTO_TCP)
				return XDP_PASS;

			return XDP_DROP;
		}

		return XDP_DROP;
	}

	return XDP_DROP;
}

SEC("mienro_lan") int mienro_lan_prog(struct xdp_md *ctx)
{
	return mienro_process_packet(ctx, 0);
}

SEC("mienro_lan_direct") int mienro_lan_direct_prog(struct xdp_md *ctx)
{
	return mienro_process_packet(ctx, BPF_FIB_LOOKUP_DIRECT);
}

char _license[] SEC("license") = "GPL";


... libbpf return me a good: R6 invalid mem access 'inv'.

Where I'am wrong, I'am missing some validation?
I intentionally preferred to use XDP_PASS everywhere just to simplify the code.

Also I would be curious to understand what the last two lines between these four indicate above all.

libbpf: elf: skipping unrecognized data section(19) .eh_frame
libbpf: elf: skipping relo section(20) .rel.eh_frame for section(19)
libbpf: load bpf program failed: Permission denied
btf_vmlinux is malformed

Thanks

Marco



================================================================================================================

libbpf: elf: skipping unrecognized data section(19) .eh_frame
libbpf: elf: skipping relo section(20) .rel.eh_frame for section(19)
.eh_frame
libbpf: load bpf program failed: Permission denied
libbpf: -- BEGIN DUMP LOG ---
libbpf:
btf_vmlinux is malformed
R1 type=ctx expected=fp
; SEC("mienro_lan") int mienro_lan_prog(struct xdp_md *ctx)
0: (b7) r0 = 1
; void *data_end = (void *)(long)ctx->data_end;
1: (61) r2 = *(u32 *)(r1 +4)
; void *data = (void *)(long)ctx->data;
2: (61) r6 = *(u32 *)(r1 +0)
; if (data + sizeof(struct ethhdr) > data_end)
3: (bf) r3 = r6
4: (07) r3 += 14
; if (data + sizeof(struct ethhdr) > data_end)
5: (2d) if r3 > r2 goto pc+139
 R0_w=inv1 R1=ctx(id=0,off=0,imm=0) R2_w=pkt_end(id=0,off=0,imm=0)
R3_w=pkt(id=0,off=14,r=14,imm=0) R6_w=pkt(id=0,off=0,r=14,imm=0) R10=fp0
; if (((struct ethhdr *)data)->h_proto == htons(ETH_P_8021Q))
6: (71) r3 = *(u8 *)(r6 +12)
7: (71) r7 = *(u8 *)(r6 +13)
8: (67) r7 <<= 8
9: (4f) r7 |= r3
10: (b7) r3 = 14
; if (((struct ethhdr *)data)->h_proto == htons(ETH_P_8021Q))
11: (55) if r7 != 0x81 goto pc+6
 R0_w=inv1 R1=ctx(id=0,off=0,imm=0) R2_w=pkt_end(id=0,off=0,imm=0)
R3_w=inv14 R6_w=pkt(id=0,off=0,r=14,imm=0) R7_w=inv129 R10=fp0
; if (data + sizeof(struct vlan_ethhdr) > data_end)
12: (bf) r3 = r6
13: (07) r3 += 18
;
14: (b7) r0 = 1
; if (data + sizeof(struct vlan_ethhdr) > data_end)
15: (2d) if r3 > r2 goto pc+129
 R0=inv1 R1=ctx(id=0,off=0,imm=0) R2=pkt_end(id=0,off=0,imm=0)
R3=pkt(id=0,off=18,r=18,imm=0) R6=pkt(id=0,off=0,r=18,imm=0) R7=inv129
R10=fp0
16: (b7) r3 = 18
; h_proto = ((struct vlan_ethhdr *)data)->h_vlan_encapsulated_proto;
17: (69) r7 = *(u16 *)(r6 +16)
; if (data + nh_off > data_end)
18: (0f) r6 += r3
last_idx 18 first_idx 15
regs=8 stack=0 before 17: (69) r7 = *(u16 *)(r6 +16)
regs=8 stack=0 before 16: (b7) r3 = 18
;
19: (b7) r0 = 1
; if (data + nh_off > data_end)
20: (2d) if r6 > r2 goto pc+124
 R0_w=inv1 R1=ctx(id=0,off=0,imm=0) R2=pkt_end(id=0,off=0,imm=0)
R3_w=invP18 R6_w=pkt(id=0,off=18,r=18,imm=0)
R7_w=inv(id=0,umax_value=65535,var_off=(0x0; 0xffff)) R10=fp0
; if (h_proto == htons(ETH_P_IP))
21: (bf) r3 = r7
22: (57) r3 &= 65535
; if (h_proto == htons(ETH_P_IP))
23: (55) if r3 != 0x8 goto pc+31

from 23 to 55: R0=inv1 R1=ctx(id=0,off=0,imm=0)
R2=pkt_end(id=0,off=0,imm=0) R3=inv(id=0,umax_value=65535,var_off=(0x0;
0xffff)) R6=pkt(id=0,off=18,r=18,imm=0)
R7=inv(id=1,umax_value=65535,var_off=(0x0; 0xffff)) R10=fp0
;
55: (b7) r0 = 1
; else if (h_proto == htons(ETH_P_IPV6))
56: (55) if r3 != 0xdd86 goto pc+88
 R0=inv1 R1=ctx(id=0,off=0,imm=0) R2=pkt_end(id=0,off=0,imm=0) R3=inv56710
R6=pkt(id=0,off=18,r=18,imm=0) R7=inv(id=1,umax_value=65535,var_off=(0x0;
0xffff)) R10=fp0
; if (ip6h + 1 > data_end)
57: (bf) r3 = r6
58: (07) r3 += 40
;
59: (b7) r0 = 1
; if (ip6h + 1 > data_end)
60: (2d) if r3 > r2 goto pc+84
 R0_w=inv1 R1=ctx(id=0,off=0,imm=0) R2=pkt_end(id=0,off=0,imm=0)
R3_w=pkt(id=0,off=58,r=58,imm=0) R6=pkt(id=0,off=18,r=58,imm=0)
R7=inv(id=1,umax_value=65535,var_off=(0x0; 0xffff)) R10=fp0
61: (b7) r2 = 0
; __builtin_memset(&fib_params, 0, sizeof(fib_params));
62: (7b) *(u64 *)(r10 -8) = r2
last_idx 62 first_idx 56
regs=4 stack=0 before 61: (b7) r2 = 0
63: (7b) *(u64 *)(r10 -16) = r2
64: (7b) *(u64 *)(r10 -24) = r2
65: (7b) *(u64 *)(r10 -32) = r2
66: (7b) *(u64 *)(r10 -40) = r2
67: (7b) *(u64 *)(r10 -48) = r2
68: (7b) *(u64 *)(r10 -56) = r2
69: (7b) *(u64 *)(r10 -64) = r2
; fib_params.ifindex = ctx->ingress_ifindex;
70: (61) r3 = *(u32 *)(r1 +12)
71: (b7) r4 = 10
; fib_params.family = AF_INET6;
72: (73) *(u8 *)(r10 -64) = r4
; fib_params.ifindex = ctx->ingress_ifindex;
73: (63) *(u32 *)(r10 -56) = r3
; fib_params.flowinfo = *(__be32 *)ip6h & IPV6_FLOWINFO_MASK;
74: (61) r3 = *(u32 *)(r6 +0)
75: (18) r4 = 0xffffff0f
; fib_params.flowinfo = *(__be32 *)ip6h & IPV6_FLOWINFO_MASK;
77: (5f) r3 &= r4
; fib_params.flowinfo = *(__be32 *)ip6h & IPV6_FLOWINFO_MASK;
78: (63) *(u32 *)(r10 -52) = r3
; fib_params.l4_protocol = ip6h->nexthdr;
79: (71) r3 = *(u8 *)(r6 +6)
; fib_params.l4_protocol = ip6h->nexthdr;
80: (73) *(u8 *)(r10 -63) = r3
; fib_params.dport = 0;
81: (6b) *(u16 *)(r10 -60) = r2
; fib_params.sport = 0;
82: (6b) *(u16 *)(r10 -62) = r2
; fib_params.tot_len = ntohs(ip6h->payload_len);
83: (69) r2 = *(u16 *)(r6 +4)
84: (dc) r2 = be16 r2
; fib_params.tot_len = ntohs(ip6h->payload_len);
85: (6b) *(u16 *)(r10 -58) = r2
; *((struct in6_addr *)fib_params.ipv6_src) = ip6h->saddr;
86: (61) r2 = *(u32 *)(r6 +12)
87: (67) r2 <<= 32
88: (61) r3 = *(u32 *)(r6 +8)
89: (4f) r2 |= r3
90: (7b) *(u64 *)(r10 -48) = r2
91: (61) r2 = *(u32 *)(r6 +20)
92: (67) r2 <<= 32
93: (61) r3 = *(u32 *)(r6 +16)
94: (4f) r2 |= r3
95: (7b) *(u64 *)(r10 -40) = r2
; *((struct in6_addr *)fib_params.ipv6_dst) = ip6h->daddr;
96: (61) r2 = *(u32 *)(r6 +36)
97: (67) r2 <<= 32
98: (61) r3 = *(u32 *)(r6 +32)
99: (4f) r2 |= r3
100: (7b) *(u64 *)(r10 -24) = r2
101: (61) r2 = *(u32 *)(r6 +28)
102: (67) r2 <<= 32
103: (61) r3 = *(u32 *)(r6 +24)
104: (4f) r2 |= r3
105: (7b) *(u64 *)(r10 -32) = r2
;
106: (bf) r8 = r6
107: (b7) r6 = 0
108: (bf) r2 = r10
109: (07) r2 += -64
; rc = bpf_fib_lookup(ctx, &fib_params, sizeof(fib_params), flags);
110: (b7) r3 = 64
111: (b7) r4 = 0
112: (85) call bpf_fib_lookup#69
last_idx 112 first_idx 108
regs=8 stack=0 before 111: (b7) r4 = 0
regs=8 stack=0 before 110: (b7) r3 = 64
113: (bf) r1 = r0
114: (67) r1 <<= 32
115: (77) r1 >>= 32
; if (rc == BPF_FIB_LKUP_RET_SUCCESS) // FORWARD_SECTION
116: (15) if r1 == 0x4 goto pc+8
 R0_w=inv(id=3) R1_w=inv(id=0,umax_value=4294967295,var_off=(0x0;
0xffffffff)) R6=inv0 R7=inv(id=1,umax_value=65535,var_off=(0x0; 0xffff))
R8=pkt(id=0,off=18,r=58,imm=0) R10=fp0 fp-8=mmmmmmmm fp-16=mmmmmmmm
fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmmmmmm fp-48=mmmmmmmm fp-56=mmmmmmmm
fp-64=mmmmmmmm
;
117: (b7) r0 = 1
; if (rc == BPF_FIB_LKUP_RET_SUCCESS) // FORWARD_SECTION
118: (55) if r1 != 0x0 goto pc+26
 R0=inv1 R1=inv0 R6=inv0 R7=inv(id=1,umax_value=65535,var_off=(0x0;
0xffff)) R8=pkt(id=0,off=18,r=58,imm=0) R10=fp0 fp-8=mmmmmmmm
fp-16=mmmmmmmm fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmmmmmm fp-48=mmmmmmmm
fp-56=mmmmmmmm fp-64=mmmmmmmm
; if (h_proto == htons(ETH_P_IP))
119: (57) r7 &= 65535
; if (h_proto == htons(ETH_P_IP))
120: (55) if r7 != 0x8 goto pc+10
 R0=inv1 R1=inv0 R6=inv0 R7_w=inv8 R8=pkt(id=0,off=18,r=58,imm=0) R10=fp0
fp-8=mmmmmmmm fp-16=mmmmmmmm fp-24=mmmmmmmm fp-32=mmmmmmmm fp-40=mmmmmmmm
fp-48=mmmmmmmm fp-56=mmmmmmmm fp-64=mmmmmmmm
; if (iph->protocol == IPPROTO_TCP)
121: (71) r1 = *(u8 *)(r6 +9)
R6 invalid mem access 'inv'
processed 165 insns (limit 1000000) max_states_per_insn 1 total_states 10
peak_states 10 mark_read 3

libbpf: -- END LOG --
