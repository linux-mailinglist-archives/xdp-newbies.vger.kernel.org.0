Return-Path: <xdp-newbies+bounces-113-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63092C311
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Jul 2024 20:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52571F21EE8
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Jul 2024 18:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4698417B036;
	Tue,  9 Jul 2024 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=servicepipe.ru header.i=@servicepipe.ru header.b="DNj/PDnU"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [178.154.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588E22BAE5
	for <xdp-newbies@vger.kernel.org>; Tue,  9 Jul 2024 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548390; cv=none; b=SGyNgRbEpOSFDAvsa0rzXxkSj20MbFqwoqbc2L34HELJ+L9ilaUgnr4AFQtHjNfeDmB6JoVag+lZYrWWXGLVNn5fUY+wIDkT9RMtGlDpQ6VBdlY7AzGko1JzZkfY4TTep/p4hh7jGa5dDuInGhPnrtVGXmNdHyjzVx+V53D5lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548390; c=relaxed/simple;
	bh=XI3WdLctZ2ndHJ6OMW1H9yNkwOuUyqJrz6dawhf+kx8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=d7bQOSY0uMmhktgDVcSNfoE3CG2iaQuC+FA9DJKjizMoK9ircwlxON5+yZAB7ZTjzAjRTzT5zZSYteN1MprBIk0rn9zx3icvIiVrnjBHqTmxe3xl+BVIWAONWT3cAg/Y+PXcBsFeQn9qww2VFl06OYtsZC+KUqPgKIOj39gT4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=servicepipe.ru; spf=pass smtp.mailfrom=servicepipe.ru; dkim=pass (1024-bit key) header.d=servicepipe.ru header.i=@servicepipe.ru header.b=DNj/PDnU; arc=none smtp.client-ip=178.154.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=servicepipe.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=servicepipe.ru
Received: from mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:75a0:0:640:88d1:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id B82E446C75
	for <xdp-newbies@vger.kernel.org>; Tue,  9 Jul 2024 21:06:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 96iiHXCOoiE0-RwUZNm9b;
	Tue, 09 Jul 2024 21:06:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=servicepipe.ru;
	s=mail; t=1720548370;
	bh=TJN7sBlo9CVNwSkWmH7GqRrQaoLb6QlVRPdGBw5EMx8=;
	h=Subject:From:To:Date:Message-ID;
	b=DNj/PDnUWz/gdxTY7XxhtC4WDwvmw2qWH15yC7uVrH5GeP8pbla6Ht3M8lXyl+kT5
	 opIPlmP8pwJ6wHqyvLz5qtObt/fr/AeKc78MXaAWTie/3a9g4mfHuAcEmBU6Hhai9D
	 YKolCDoFoalCsf/zmzSTtqRVgy+I5tzjkr3utSVg=
Authentication-Results: mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net; dkim=pass header.i=@servicepipe.ru
Message-ID: <0a127d15-6417-4a9d-9a6d-9d159b63bfd9@servicepipe.ru>
Date: Tue, 9 Jul 2024 21:06:09 +0300
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xdp-newbies@vger.kernel.org
Content-Language: en-US, ru-RU
From: Vadim Goncharov <vgoncharov@servicepipe.ru>
Subject: eBPF verifier "invalid access to packet offset is outside" - clang
 optimizer bug?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

I am going via https://github.com/xdp-project/xdp-tutorial and after 3rd lesson

trying to create a simple program for searching TCP timestamp option and

incrementing it by one. However, after two dozen tries eBPF verifier

still doesn't accept my code. I was digging into verifier sources and

found that access ("r=123") propagates to all registers with the same "id="

after comparison with packet_end (usually data_end variable in xdp-tutorial).

So I learned to place such checks as late as possible to actual access,

but this still did not help.

But carefully and boringly going via disassembler and verifier output,

I've found that clang optimizer ignores just checked register, and

calculates from another, raising verifier's complain. Moreover, it

generates not optimal code sometimes! In my (currently) last try, this

looks like:

; if (optlen != TCPOPT_TS_LEN || changed) {

240: (79) r0 = *(u64 *)(r10 -16)      ; R0_w=P0 R10=fp0 fp-16=00000000

241: (4f) r9 |= r0                    ; R0_w=P0 R9_w=0

242: (57) r9 &= 1                     ; R9_w=0

243: (b7) r0 = 309                    ; R0_w=309

244: (55) if r9 != 0x0 goto pc+150    ; R9_w=0

245: (b7) r0 = 300                    ; R0_w=300

; ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

246: (25) if r7 > 0x22 goto pc+148    ; R7=scalar(id=163,umin=2,umax=34,var_off=(0x0; 0x3f))

; ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

247: (bf) r6 = r1                     ; R1=pkt(id=11,off=18,r=40,umax=60,var_off=(0x0; 0x3c)) R6_w=pkt(id=11,off=18,r=40,umax=60,var_off=(0x0; 0x3c))

248: (0f) r6 += r7                    ; R6_w=pkt(id=167,off=18,r=0,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127) R7=scalar(id=163,umin=2,umax=34,var_off=(0x0; 0x3f))

249: (bf) r9 = r6                     ; R6_w=pkt(id=167,off=18,r=0,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127) R9_w=pkt(id=167,off=18,r=0,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127)

250: (07) r9 += 26                    ; R9_w=pkt(id=167,off=44,r=0,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127)

251: (b7) r0 = 300                    ; R0=300

; ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

252: (2d) if r9 > r2 goto pc+142      ; R2=pkt_end(off=0,imm=0) R9=pkt(id=167,off=44,r=44,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127)

253: (b7) r0 = 300                    ; R0_w=300

; ACCESS_OPT_PTR(chgptr, cur+5);

254: (2d) if r9 > r2 goto pc+140      ; R2=pkt_end(off=0,imm=0) R9=pkt(id=167,off=44,r=44,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127)

; old = bpf_ntohs(*(unsigned short *)chgptr);

255: (bf) r0 = r1                     ; R0_w=pkt(id=11,off=18,r=40,umax=60,var_off=(0x0; 0x3c)) R1=pkt(id=11,off=18,r=40,umax=60,var_off=(0x0; 0x3c))

256: (0f) r0 += r7                    ; R0_w=pkt(id=168,off=18,r=0,umin=2,umax=94,var_off=(0x0; 0x7f),s32_min=0,s32_max=127,u32_max=127) R7=scalar(id=163,umin=2,umax=34,var_off=(0x0; 0x3f))

257: (69) r9 = *(u16 *)(r0 +24)

invalid access to packet, off=42 size=2, R0(id=168,off=42,r=0)

R0 offset is outside of the packet

processed 2565 insns (limit 1000000) max_states_per_insn 9 total_states 92 peak_states 73 mark_read 12

-- END PROG LOAD LOG --

and in disassembler (`llvm-objdump -lS nuc_ts_prog_kern.o`), with my comments added:

0000000000000780 <LBB0_64>:

; LBB0_64(): //r1=tcph r2=end r4=size r5=40 r6=size-cur r7=cur r8=10 r9=8

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:181

;             if (optlen != TCPOPT_TS_LEN || changed) {

      240:    79 a0 f0 ff 00 00 00 00    r0 = *(u64 *)(r10 - 16)  //changed

      241:    4f 09 00 00 00 00 00 00    r9 |= r0

      242:    57 09 00 00 01 00 00 00    r9 &= 1

      243:    b7 00 00 00 35 01 00 00    r0 = 309

      244:    55 09 96 00 00 00 00 00    if r9 != 0 goto +150 <LBB0_103>

      245:    b7 00 00 00 2c 01 00 00    r0 = 300

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:188

;             ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

      246:    25 07 94 00 22 00 00 00    if r7 > 34 goto +148 <LBB0_103>

      247:    bf 16 00 00 00 00 00 00    r6 = r1

      248:    0f 76 00 00 00 00 00 00    r6 += r7

      249:    bf 69 00 00 00 00 00 00    r9 = r6

      250:    07 09 00 00 1a 00 00 00    r9 += 26

      251:    b7 00 00 00 2c 01 00 00    r0 = 300

      252:    2d 29 8e 00 00 00 00 00    if r9 > r2 goto +142 <LBB0_103>

      253:    b7 00 00 00 2c 01 00 00    r0 = 300

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:190

;             ACCESS_OPT_PTR(chgptr, cur+5);

      254:    2d 29 8c 00 00 00 00 00    if r9 > r2 goto +140 <LBB0_103>

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:189

;             old = bpf_ntohs(*(unsigned short *)chgptr);

      255:    bf 10 00 00 00 00 00 00    r0 = r1

      256:    0f 70 00 00 00 00 00 00    r0 += r7  // <== HERE

      257:    69 09 18 00 00 00 00 00    r9 = *(u16 *)(r0 + 24)

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:191

;             *((__u8*)chgptr) += 1;

      258:    bf 90 00 00 00 00 00 00    r0 = r9

      259:    77 00 00 00 08 00 00 00    r0 >>= 8

      260:    07 00 00 00 01 00 00 00    r0 += 1

      261:    73 06 19 00 00 00 00 00    *(u8 *)(r6 + 25) = r0

; /home/vadimgon/xdp-tutorial/nuc_ts_prog_kern.c:154

;     while (cur < size && cur < 40) {

      262:    0f 78 00 00 00 00 00 00    r8 += r7

As you can see, it checks `r9` even *twice*, and `r9` gets desired "r=44",

but then discards r9 and uses r0 with no such checks from optimiser.

I tried to patch this manually:

* first, doing

   llc -march=bpf -filetype=asm -o nuc_ts_prog_kern.s nuc_ts_prog_kern.ll

* then, I patch eBPF assemby in just one byte:

--- nuc_ts_prog_kern.s~ 2024-07-05 21:59:36.754767691 +0300

+++ nuc_ts_prog_kern.s  2024-07-05 21:59:44.138807845 +0300

@@ -1395,7 +1395,7 @@

  .Ltmp412:

         r0 = r1

         r0 += r7

-       r9 = *(u16 *)(r0 + 24)

+       r9 = *(u16 *)(r6 + 24)

         .loc    0 191 21                        # nuc_ts_prog_kern.c:191:21

  .Ltmp413:

         r0 = r9

* and getting actual object file:

   llvm-mc -triple bpf -filetype=obj -o nuc_ts_prog_kern.o nuc_ts_prog_kern.s

then after this eBPF verifier accepts and loads program into kernel!

So, the questions are:

1) could this be considered a clang bug?

2) even if "yes" to first question, what could be done to trick clang

    into emitting more "correct" (from verifier's POV) code?

I am new to this list, so don't know the proper way to post multiple

files (versions of code) here, are attaches allowed? So for the first

post let me try just copypaste the last version of code into message

(hope Thunderbird will not smash it).

=== How to reproduce:

This is Ubuntu 22.04, kernel 6.5.0-35, clang 14.

Do

  git clone --recurse-submodules https://github.com/xdp-project/xdp-tutorial.git

  cd xdp-tutorial

and initial lib setup by their README, then put .h and .c file directly

into this directory. Compile with:

clang -S -target bpf -D __BPF_TRACING__ -Wno-visibility -DBPF_DIR_MNT="/sys/fs/bpf" -DBPF_OBJECT_PATH="/usr/local/lib/bpf" -DDEBUG -I/usr/include/x86_64-linux-gnu  -I./lib/install/include -Wall -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -Werror -O2 -emit-llvm -c -g -o nuc_ts_prog_kern.ll nuc_ts_prog_kern.c && llc -march=bpf -filetype=obj -o nuc_ts_prog_kern.o nuc_ts_prog_kern.ll

The sources:

$ cat nuc_ts_common_kern_user.h

/* Common for timestamp incrementing BPF kernel prog and it's userland prog */

#ifndef __NUC_TS_COMMON_KERN_USER_H

#define __NUC_TS_COMMON_KERN_USER_H

enum stat_types {

         STAT_VERIFIERHAPPY = 0,

         STAT_ETHSHORT,

         STAT_VLANSHORT,

         STAT_NONIP,

         STAT_IPTOTSHORT,

         STAT_IPHDRSHORT,

         STAT_IP6EXTHDRSHORT,

         STAT_NONTCP,

         STAT_TCPSHORT,

         STAT_TCPINVALID,

         STAT_TCPOPTOVERFLOW,

         STAT_NONTS,

         STAT_TS_INCREMENTED,

         STAT_MAX, //keep last

};

/* keep in sync with above*/

static const char *stat_entry_names[STAT_MAX] = {

         [STAT_VERIFIERHAPPY]  = "BPFVERIFIER",

         [STAT_ETHSHORT]       = "ETHSHORT",

         [STAT_VLANSHORT]      = "VLANSHORT",

         [STAT_NONIP]          = "NONIP",

         [STAT_IPTOTSHORT]     = "IPTOTSHORT",

         [STAT_IPHDRSHORT]     = "IPHDRSHORT",

         [STAT_IP6EXTHDRSHORT] = "IP6EXTHDRSHORT",

         [STAT_NONTCP]         = "NONTCP",

         [STAT_TCPSHORT]       = "TCPSHORT",

         [STAT_TCPINVALID]     = "TCPINVALID",

         [STAT_TCPOPTOVERFLOW] = "TCPOPTOVERFLOW",

         [STAT_NONTS]          = "NONTS",

         [STAT_TS_INCREMENTED] = "TS_INCREMENTED",

};

#endif

$ cat nuc_ts_prog_kern.c

#include <linux/bpf.h>

#include <linux/in.h>

#include <bpf/bpf_helpers.h>

#include <bpf/bpf_endian.h>

#include "common/parsing_helpers.h"

#include "nuc_ts_common_kern_user.h"

#define TCPOPT_TS_KIND 8  /* Timestamp option has Kind=8 */

#define TCPOPT_TS_LEN 10  /* and length 10, per RFC 1323 */

/* map to count errors */

struct {

         __uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);

         __type(key, __u32);

         __type(value, __u64);

         __uint(max_entries, STAT_MAX);

} xdp_errstats_map SEC(".maps");

char _license[] SEC("license") = "GPL";

static void rec2stat(__u32 error)

{

         long *value;

         value = bpf_map_lookup_elem(&xdp_errstats_map, &error);

         if (value)

                 *value += 1;

}

static int parse_ipv4(void **nh_pos, void *data_end, __u64 *l4_off)

{

         struct iphdr *iph = *nh_pos;

         if (iph + 1 > data_end) {

                 rec2stat(STAT_IPHDRSHORT);

                 return 0;

         }

         if (*nh_pos + (0x0fff & 1 + bpf_ntohs(iph->tot_len)) > data_end) {

                 rec2stat(STAT_IPTOTSHORT);

                 return 0;

         }

         if (iph->ihl < 5) {

                 rec2stat(STAT_IPHDRSHORT);

                 return 0;

         }

         *l4_off = 20 + 4*(iph->ihl - 5);

         if (*nh_pos + *l4_off > data_end) {

                 rec2stat(STAT_IPHDRSHORT);

                 return 0;

         }

         return iph->protocol;

}

static int parse_ipv6(void **nh_pos, void *data_end, __u64 *l4_off)

{

         struct ipv6hdr *ip6h = *nh_pos;

         if (ip6h + 1 > data_end) {

                 rec2stat(STAT_IPHDRSHORT);

                 return 0;

         }

         if (*nh_pos + (0xefff & 1 + bpf_ntohs(ip6h->payload_len)) > data_end) {

                 rec2stat(STAT_IPTOTSHORT);

                 return 0;

         }

         *l4_off = sizeof(struct ipv6hdr);

         __u8 next_hdr_type = ip6h->nexthdr;

         struct ipv6_opt_hdr *hdr = *nh_pos + *l4_off;

         for (int i = 0; i < 6; ++i) {

                 if (hdr + 1 > data_end) {

                         rec2stat(STAT_IP6EXTHDRSHORT);

                         return 0;

                 }

                 switch (next_hdr_type) {

                 case IPPROTO_HOPOPTS:

                 case IPPROTO_DSTOPTS:

                 case IPPROTO_ROUTING:

                 case IPPROTO_MH:

                         *l4_off += (hdr->hdrlen + 1) * 8;

                         next_hdr_type = hdr->nexthdr;

                         break;

                 case IPPROTO_AH:

                         *l4_off += (hdr->hdrlen + 2) * 4;

                         next_hdr_type = hdr->nexthdr;

                         break;

                 case IPPROTO_FRAGMENT:

                         *l4_off += 8;

                         next_hdr_type = hdr->nexthdr;

                         break;

                 default:

                         /* Found a header that is not an IPv6 extension header */

                         return next_hdr_type;

                 }

         }

         return next_hdr_type;

}

/* -1 format err, 0 untouched, 1 modified */

static int process_tcp(void **nh_pos, __u64 l4_off, void *data_end)

{

         __u64 size, old_ofs, changed = 0, open, cur = 0;

         __u64 optkind, optlen, err = STAT_VERIFIERHAPPY;

         *nh_pos += l4_off & 0xff;

         struct tcphdr *tcph = *nh_pos;

         if (tcph + 1 > data_end) {

                 err = STAT_TCPSHORT;

                 goto err_past_end;

         }

         size = 4*tcph->doff;

         *nh_pos += 20;

         if ((*nh_pos + size > data_end)) {

                 err = STAT_TCPSHORT;

                 goto err_past_end;

         }

         if (size < 20) {

                 err = STAT_TCPINVALID;

                 goto err_past_end;

         }

         size -= 20;;

         if (size == 0)  /* no options - pass as-is */

                 return 0;

         __u32 sum;

         unsigned short old;

         void *chgptr;

/* make verifier happy */

#define ACCESS_OPT_PTR(setptr, offs)    do {                    \

                 if ((offs) > 39) goto err_past_end;             \

                 (setptr) = (void*)(*nh_pos + (offs));           \

                 if ((setptr) + 1 > data_end)    \

                         goto err_past_end;                      \

         } while(0)

#define ACCESS_OPT_PTR_SHORT(setptr, offs)      do {            \

                 if ((offs) > 38) goto err_past_end;             \

                 (setptr) = (void*)(*nh_pos + (offs));           \

                 if ((setptr) + 2 > data_end)    \

                         goto err_past_end;                      \

         } while(0)

#define ACCESS_OPT_BYTE(setvar, offs)   do {                    \

                 void *tmp;                                      \

                 ACCESS_OPT_PTR(tmp, offs);                      \

                 (setvar) = *( (__u8*)tmp );                     \

         } while(0)

         while (cur < size && cur < 40) {

                 open = 261;     /* just marker in disasm */

                 ACCESS_OPT_BYTE(optkind, cur);

                 /* Single-byte options */

                 if (optkind == 0)       /* End of Options */

                         break;

                 if (optkind == 1) {     /* NOP */

                         cur++;

                         continue;

                 }

                 /* Kind and length bytes options */

                 if (cur+1 >= size) {

                         err = STAT_TCPOPTOVERFLOW;

                         goto err_past_end;

                 }

                 ACCESS_OPT_BYTE(optlen, cur+1);

                 if (optlen < 2) {

                         err = STAT_TCPINVALID;

                         goto err_past_end;

                 }

                 if (optlen > size - cur)

                         goto unclosed;

                 if (optkind == TCPOPT_TS_KIND) {

                         if (optlen != TCPOPT_TS_LEN || changed) {

                                 err = STAT_TCPINVALID;

                                 goto err_past_end;

                         }

                         /* increment TSval */

                         old_ofs = cur+4; // FIXME word align from tcp start

                         ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

                         old = bpf_ntohs(*(unsigned short *)chgptr);

                         ACCESS_OPT_PTR(chgptr, cur+5);

                         *((__u8*)chgptr) += 1;

                         changed = 1;

                 }

                 /* Skip to next option */

                 cur += optlen;

                 open = 0;

         }

         if (open)

                 goto unclosed;

         /* Update checksum incrementally per RFC 1141 */

         if (changed) {

                 ACCESS_OPT_PTR_SHORT(chgptr, old_ofs);

                 sum = old + (~bpf_ntohs(*(unsigned short *)chgptr) & 0xffff);

                 sum += bpf_ntohs(tcph->check);

                 sum = (sum & 0xffff) + (sum>>16);

                 tcph->check = bpf_htons(sum + (sum>>16));

                 return 1;

         }

         return 0;

unclosed:

         err = STAT_TCPOPTOVERFLOW;

err_past_end:

         rec2stat(err);

         return -1;

}

SEC("xdp")

int xdp_tcp_timestamp_incr(struct xdp_md *ctx)

{

         void *data_end = (void *)(long)ctx->data_end;

         void *data = (void *)(long)ctx->data;

         struct ethhdr *eth = data;

         int rc = XDP_DROP;

         __u16 h_proto;

         __u64 nh_off;

         __u32 ipproto;

         __u64 l4_off;

         void *nh_pos;

         nh_off = sizeof(*eth);

         if (data + nh_off > data_end) {

                 rec2stat(STAT_ETHSHORT);

                 return rc;

         }

         h_proto = eth->h_proto;

         /* check VLAN tag; could be repeated to support double-tagged VLAN */

         if (h_proto == bpf_htons(ETH_P_8021Q) || h_proto == bpf_htons(ETH_P_8021AD)) {

                 struct vlan_hdr *vhdr;

                 vhdr = data + nh_off;

                 nh_off += sizeof(struct vlan_hdr);

                 if (data + nh_off > data_end) {

                         rec2stat(STAT_VLANSHORT);

                         return rc;

                 }

                 h_proto = vhdr->h_vlan_encapsulated_proto;

         }

         nh_pos = data + nh_off;

         if (h_proto == bpf_htons(ETH_P_IP))

                 ipproto = parse_ipv4(&nh_pos, data_end, &l4_off);

         else if (h_proto == bpf_htons(ETH_P_IPV6))

                 ipproto = parse_ipv6(&nh_pos, data_end, &l4_off);

         else {

                 rec2stat(STAT_NONIP);

                 return rc;

         }

         if (ipproto != IPPROTO_TCP) {

                 /* pass non-TCP untouched */

                 rec2stat(STAT_NONTCP);

                 rc = XDP_PASS;

         } else {

                 int done = process_tcp(&nh_pos, l4_off, data_end);

                 if (done == -1) {

                         rc = XDP_DROP;

                 } else if (done == 0) {

                         rec2stat(STAT_NONTS);

                         rc = XDP_PASS;

                 } else {

                         rec2stat(STAT_TS_INCREMENTED);

                         rc = XDP_PASS;

                 }

         }

         return rc;

}

-- 

WBR, tg://nuclight


