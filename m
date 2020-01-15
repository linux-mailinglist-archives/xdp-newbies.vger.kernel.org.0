Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642A613CFDE
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 23:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgAOWLR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 17:11:17 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:46738 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbgAOWLR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 17:11:17 -0500
Received: by mail-ed1-f49.google.com with SMTP id m8so17016523edi.13
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XqPlpfjz1/stWxqKoHvD7BEH0eUwl9TUryFGwlp7UkA=;
        b=GUpXLP9+saR99PMYwzs2ZTC2WqKhtgecP3ZkID3I4+eaayvx/3xEmGfFDg3ss8g3zc
         D+6OC7rPo1tyx5ip8lmdbZPfztKRSXSKRpCZ+Dsao2IeFwDq4DHvph6GNUd5CHdTt0ow
         xCiWncFclWmSwxuHsqQbAULzwgWIiTeFMwAz7+BYgc3viymRqy1JGenA96NEiwrkvIh6
         +ykPph/A0ey8zHafN/y38G9e6n+IxrUZf89uye6+MfzS8yINaebSO+bHXgOH7+wxbf5z
         dhsokRb9XqTTJKm/MaGif8dfUFhrBweeQJCELT7l+1QivXxhcBlrzwW7e1CJI8ZLGbfC
         b2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XqPlpfjz1/stWxqKoHvD7BEH0eUwl9TUryFGwlp7UkA=;
        b=BCgMSQh5yur10wackyufsNy9oHAxxvAOghT5BiMTGKHQaqQqkGOaYzQ7VhV+kkeOMT
         jO5UfNHv7amgf5S4SmhdeXtK3p5/DBrfHpCcnCumdCtF6xgyMfSL8UJ8E5BqO+0rwW49
         9Hn4nyTJVzprZJoTpY/c8wZarwgkVZF1pY25qzadKn52zeq7tX21EbXmP98TJzDujWT5
         H3zzwC21+18DUoqilvFMVid/c2vsBoLnTKXVlzmlcJ4gjWCX8hoTM4t70+aklCV8DyPf
         /mGbfcUZMeeVR/hyL3ICtEhrJ+NOssE0nksKFrx31EaphDahS6ZgMjEwp4UZNBL+eH7R
         aoSg==
X-Gm-Message-State: APjAAAXUZDJ7OqcmEQU/CYYyS66g9HQWGWSoBTZtOrbNAXvy7JdouW0b
        WK3R77aj+vY7AuKUBA61OQ38klsUcf3BbBgtQFY+SkHV
X-Google-Smtp-Source: APXvYqwj/qpt6hRIOwZyscXV7YiOjwe2lVtiX5fCTLcWaol6AAd1uVapAreA9yjoRvSS5KAkBkShMWk+o5q8Hr/yKO4=
X-Received: by 2002:a05:6402:1742:: with SMTP id v2mr33354433edx.171.1579126274808;
 Wed, 15 Jan 2020 14:11:14 -0800 (PST)
MIME-Version: 1.0
From:   Vincent Li <mchun.li@gmail.com>
Date:   Wed, 15 Jan 2020 14:11:04 -0800
Message-ID: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
Subject: XDP invalid memory access
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I am writing a sample XDP program to parse tcp packet options, code
below, compiled ok, when I attach it to a network interface

#clang -O2 -emit-llvm -c tcp_option.c -o - |llc -march=bpf
-filetype=obj -o tcp_option.o


# ip link set dev enp3s0 xdpgeneric object tcp_option.o verbose


Prog section 'prog' rejected: Permission denied (13)!

 - Type:         6

 - Instructions: 42 (0 over limit)

 - License:      GPL


Verifier analysis:


0: (61) r2 = *(u32 *)(r1 +4)

1: (61) r1 = *(u32 *)(r1 +0)

2: (bf) r3 = r1

3: (07) r3 += 54

4: (b7) r0 = 2

5: (2d) if r3 > r2 goto pc+35

 R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
R2_w=pkt_end(id=0,off=0,imm=0) R3_w=pkt(id=0,off=54,r=54,imm=0)
R10=fp0

6: (71) r2 = *(u8 *)(r1 +12)

7: (71) r3 = *(u8 *)(r1 +13)

8: (67) r3 <<= 8

9: (4f) r3 |= r2

10: (b7) r0 = 2

11: (55) if r3 != 0x8 goto pc+29

 R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
R2_w=inv(id=0,umax_value=255,var_off=(0x0; 0xff)) R3_w=inv8 R10=fp0

12: (71) r2 = *(u8 *)(r1 +23)

13: (b7) r0 = 2

14: (55) if r2 != 0x6 goto pc+26

 R0=inv2 R1=pkt(id=0,off=0,r=54,imm=0) R2=inv6 R3=inv8 R10=fp0

15: (69) r1 = *(u16 *)(r1 +46)

16: (bf) r2 = r1

17: (57) r2 &= 7936

18: (b7) r0 = 2

19: (55) if r2 != 0x200 goto pc+21

 R0_w=inv2 R1_w=inv(id=0,umax_value=65535,var_off=(0x0; 0xffff))
R2_w=inv512 R3=inv8 R10=fp0

20: (77) r1 >>= 2

21: (57) r1 &= 60

22: (07) r1 += -20

23: (18) r2 = 0x0

25: (63) *(u32 *)(r2 +0) = r1

R2 invalid mem access 'inv' <----------------

processed 25 insns (limit 1000000) max_states_per_insn 0 total_states
1 peak_states 1 mark_read 1


it appears optlen = tcphdr->doff*4 - sizeof(*tcphdr); is invalid ? if
I comment out lines between 60 and 73, no problem with invalid mem
access





     1 #include <stdint.h>

     2 #include <arpa/inet.h>

     3 #include <asm/byteorder.h>

     4 #include <linux/bpf.h>

     5 #include <linux/if_ether.h>

     6 #include <linux/ip.h>

     7 #include <linux/tcp.h>

     8 #include <linux/pkt_cls.h>

     9

    10 /*

    11 * Sample XDP to parse tcp option.

    12 * compile it with:

    13 *      clang -O2 -emit-llvm -c tcp_option.c -o - |llc
-march=bpf -filetype=obj -o tcp_option.o

    14  * attach it to a device with XDP as:

    15  *  ip link set dev lo xdp object tcp_option.o verbose

    16 */

    17

    18 #define SEC(NAME) __attribute__((section(NAME), used))

    19

    20 #define TCPOPT_EOL        0       /* End of options (1)              */

    21 #define TCPOPT_NOP        1       /* No-op (1)                       */

    22 #define TCPOPT_MAXSEG     2       /* Maximum segment size (4)        */

    23 #define TCPOPT_WSCALE     3       /* Window scaling (3)              */

    24 #define TCPOPT_SACKOK     4       /* Selective ACK permitted (2)     */

    25 #define TCPOPT_SACK       5       /* Actual selective ACK (10-34)    */

    26 #define TCPOPT_TSTAMP     8       /* Timestamp (10)                  */

    27

    28

    29 /* from bpf_helpers.h */

    30

    31 static int (*bpf_trace_printk)(const char *fmt, int fmt_size, ...) =

    32         (void *) BPF_FUNC_trace_printk;

    33

    34 static unsigned long long (*bpf_get_prandom_u32)(void) =

    35 (void *) BPF_FUNC_get_prandom_u32;

    36

    37 const __u8 *op;

    38 int i, optlen;

    39

    40 static int tcp_option(void *data, void *data_end)

    41 {

    42 struct ethhdr *eth = (struct ethhdr *)data;

    43 struct iphdr *iph = (struct iphdr *)(eth + 1);

    44 struct tcphdr *tcphdr = (struct tcphdr *)(iph + 1);

    45 int tcplen;

    46

    47 /* sanity check needed by the eBPF verifier */

    48 if ((void *)(tcphdr + 1) > data_end)

    49 return 0;

    50

    51 /* skip non TCP packets */

    52 if (eth->h_proto != __constant_htons(ETH_P_IP) || iph->protocol
!= IPPROTO_TCP)

    53 return 0;

    54

    55 /* incompatible flags, or PSH already set */

    56 if (tcphdr->ack || tcphdr->fin || tcphdr->rst || tcphdr->psh)

    57 return 0;

    58

    59 if (tcphdr->syn) {

    60 optlen = tcphdr->doff*4 - sizeof(*tcphdr);

    61                 if (!optlen)

    62                       return -1;

    63 /*

    64                 for (i = 0; i < optlen; ) {

    65                         if (op[i] == TCPOPT_EOL) {

    66                  char fmt[] = "XDP: tcp opt eol kind seen %d \n";

    67                  bpf_trace_printk(fmt, sizeof(fmt), op[i]);

    68 }

    69                         if (op[i] < 2)

    70                                 i++;

    71                         else

    72                                 i += op[i+1] ? : 1;

    73                 }

    74 */

    75

    76                char fmt[] = "XDP: tcp syn seen \n";

    77                bpf_trace_printk(fmt, sizeof(fmt));

    78

    79 }

    80

    81 return 0;

    82 }

    83

    84 SEC("prog")

    85 int xdp_main(struct xdp_md *ctx)

    86 {

    87 void *data_end = (void *)(uintptr_t)ctx->data_end;

    88 void *data = (void *)(uintptr_t)ctx->data;

    89

    90 if (tcp_option(data, data_end))

    91 return XDP_DROP;

    92

    93 return XDP_PASS;

    94 }

    95

    96

    97 char _license[] SEC("license") = "GPL";
