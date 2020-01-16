Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BA913D6E6
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 10:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgAPJcM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 04:32:12 -0500
Received: from mga04.intel.com ([192.55.52.120]:63734 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgAPJcL (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 04:32:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 01:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,325,1574150400"; 
   d="scan'208";a="220312478"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2020 01:32:09 -0800
Date:   Thu, 16 Jan 2020 03:24:59 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Vincent Li <mchun.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org, daniel@iogearbox.net, andriin@fb.com,
        dsahern@gmail.com
Subject: Re: XDP invalid memory access
Message-ID: <20200116022459.GA2853@ranger.igk.intel.com>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 15, 2020 at 02:11:04PM -0800, Vincent Li wrote:
> Hi,
> 
> I am writing a sample XDP program to parse tcp packet options, code
> below, compiled ok, when I attach it to a network interface
> 
> #clang -O2 -emit-llvm -c tcp_option.c -o - |llc -march=bpf
> -filetype=obj -o tcp_option.o
> 
> 
> # ip link set dev enp3s0 xdpgeneric object tcp_option.o verbose
> 
> 
> Prog section 'prog' rejected: Permission denied (13)!
> 
>  - Type:         6
> 
>  - Instructions: 42 (0 over limit)
> 
>  - License:      GPL
> 
> 
> Verifier analysis:
> 
> 
> 0: (61) r2 = *(u32 *)(r1 +4)
> 
> 1: (61) r1 = *(u32 *)(r1 +0)
> 
> 2: (bf) r3 = r1
> 
> 3: (07) r3 += 54
> 
> 4: (b7) r0 = 2
> 
> 5: (2d) if r3 > r2 goto pc+35
> 
>  R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
> R2_w=pkt_end(id=0,off=0,imm=0) R3_w=pkt(id=0,off=54,r=54,imm=0)
> R10=fp0
> 
> 6: (71) r2 = *(u8 *)(r1 +12)
> 
> 7: (71) r3 = *(u8 *)(r1 +13)
> 
> 8: (67) r3 <<= 8
> 
> 9: (4f) r3 |= r2
> 
> 10: (b7) r0 = 2
> 
> 11: (55) if r3 != 0x8 goto pc+29
> 
>  R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
> R2_w=inv(id=0,umax_value=255,var_off=(0x0; 0xff)) R3_w=inv8 R10=fp0
> 
> 12: (71) r2 = *(u8 *)(r1 +23)
> 
> 13: (b7) r0 = 2
> 
> 14: (55) if r2 != 0x6 goto pc+26
> 
>  R0=inv2 R1=pkt(id=0,off=0,r=54,imm=0) R2=inv6 R3=inv8 R10=fp0
> 
> 15: (69) r1 = *(u16 *)(r1 +46)
> 
> 16: (bf) r2 = r1
> 
> 17: (57) r2 &= 7936
> 
> 18: (b7) r0 = 2
> 
> 19: (55) if r2 != 0x200 goto pc+21
> 
>  R0_w=inv2 R1_w=inv(id=0,umax_value=65535,var_off=(0x0; 0xffff))
> R2_w=inv512 R3=inv8 R10=fp0
> 
> 20: (77) r1 >>= 2
> 
> 21: (57) r1 &= 60
> 
> 22: (07) r1 += -20
> 
> 23: (18) r2 = 0x0
> 
> 25: (63) *(u32 *)(r2 +0) = r1
> 
> R2 invalid mem access 'inv' <----------------

So it's not out of the bounds access but rather null dereference since r2
has been loaded with 0 on previous insn.

> 
> processed 25 insns (limit 1000000) max_states_per_insn 0 total_states
> 1 peak_states 1 mark_read 1
> 
> 
> it appears optlen = tcphdr->doff*4 - sizeof(*tcphdr); is invalid ? if
> I comment out lines between 60 and 73, no problem with invalid mem
> access

I see that optlen is a global variable. This line might be valid but
you're using iproute2's loader for your XDP program, right? AFAIK it
doesn't have support for BPF global variables, only libbpf does (Daniel,
Andrii? is that true?).

So you have to either make the optlen a local variable or go with writing
the loader part that is based on libbpf usage (see samples/bpf directory
in kernel tree, for example xdp1_user.c).

Could you next time try a little better with the format of data you're
providing? I'm pretty sure other folks would have spotted earlier that
optlen is global if the code was properly formatted :)

To wrap this rant up, making optlen a local var does the job for me.

> 
> 
> 
> 
> 
>      1 #include <stdint.h>
> 
>      2 #include <arpa/inet.h>
> 
>      3 #include <asm/byteorder.h>
> 
>      4 #include <linux/bpf.h>
> 
>      5 #include <linux/if_ether.h>
> 
>      6 #include <linux/ip.h>
> 
>      7 #include <linux/tcp.h>
> 
>      8 #include <linux/pkt_cls.h>
> 
>      9
> 
>     10 /*
> 
>     11 * Sample XDP to parse tcp option.
> 
>     12 * compile it with:
> 
>     13 *      clang -O2 -emit-llvm -c tcp_option.c -o - |llc
> -march=bpf -filetype=obj -o tcp_option.o
> 
>     14  * attach it to a device with XDP as:
> 
>     15  *  ip link set dev lo xdp object tcp_option.o verbose
> 
>     16 */
> 
>     17
> 
>     18 #define SEC(NAME) __attribute__((section(NAME), used))
> 
>     19
> 
>     20 #define TCPOPT_EOL        0       /* End of options (1)              */
> 
>     21 #define TCPOPT_NOP        1       /* No-op (1)                       */
> 
>     22 #define TCPOPT_MAXSEG     2       /* Maximum segment size (4)        */
> 
>     23 #define TCPOPT_WSCALE     3       /* Window scaling (3)              */
> 
>     24 #define TCPOPT_SACKOK     4       /* Selective ACK permitted (2)     */
> 
>     25 #define TCPOPT_SACK       5       /* Actual selective ACK (10-34)    */
> 
>     26 #define TCPOPT_TSTAMP     8       /* Timestamp (10)                  */
> 
>     27
> 
>     28
> 
>     29 /* from bpf_helpers.h */
> 
>     30
> 
>     31 static int (*bpf_trace_printk)(const char *fmt, int fmt_size, ...) =
> 
>     32         (void *) BPF_FUNC_trace_printk;
> 
>     33
> 
>     34 static unsigned long long (*bpf_get_prandom_u32)(void) =
> 
>     35 (void *) BPF_FUNC_get_prandom_u32;
> 
>     36
> 
>     37 const __u8 *op;
> 
>     38 int i, optlen;
> 
>     39
> 
>     40 static int tcp_option(void *data, void *data_end)
> 
>     41 {
> 
>     42 struct ethhdr *eth = (struct ethhdr *)data;
> 
>     43 struct iphdr *iph = (struct iphdr *)(eth + 1);
> 
>     44 struct tcphdr *tcphdr = (struct tcphdr *)(iph + 1);
> 
>     45 int tcplen;
> 
>     46
> 
>     47 /* sanity check needed by the eBPF verifier */
> 
>     48 if ((void *)(tcphdr + 1) > data_end)
> 
>     49 return 0;
> 
>     50
> 
>     51 /* skip non TCP packets */
> 
>     52 if (eth->h_proto != __constant_htons(ETH_P_IP) || iph->protocol
> != IPPROTO_TCP)
> 
>     53 return 0;
> 
>     54
> 
>     55 /* incompatible flags, or PSH already set */
> 
>     56 if (tcphdr->ack || tcphdr->fin || tcphdr->rst || tcphdr->psh)
> 
>     57 return 0;
> 
>     58
> 
>     59 if (tcphdr->syn) {
> 
>     60 optlen = tcphdr->doff*4 - sizeof(*tcphdr);
> 
>     61                 if (!optlen)
> 
>     62                       return -1;
> 
>     63 /*
> 
>     64                 for (i = 0; i < optlen; ) {
> 
>     65                         if (op[i] == TCPOPT_EOL) {
> 
>     66                  char fmt[] = "XDP: tcp opt eol kind seen %d \n";
> 
>     67                  bpf_trace_printk(fmt, sizeof(fmt), op[i]);
> 
>     68 }
> 
>     69                         if (op[i] < 2)
> 
>     70                                 i++;
> 
>     71                         else
> 
>     72                                 i += op[i+1] ? : 1;
> 
>     73                 }
> 
>     74 */
> 
>     75
> 
>     76                char fmt[] = "XDP: tcp syn seen \n";
> 
>     77                bpf_trace_printk(fmt, sizeof(fmt));
> 
>     78
> 
>     79 }
> 
>     80
> 
>     81 return 0;
> 
>     82 }
> 
>     83
> 
>     84 SEC("prog")
> 
>     85 int xdp_main(struct xdp_md *ctx)
> 
>     86 {
> 
>     87 void *data_end = (void *)(uintptr_t)ctx->data_end;
> 
>     88 void *data = (void *)(uintptr_t)ctx->data;
> 
>     89
> 
>     90 if (tcp_option(data, data_end))
> 
>     91 return XDP_DROP;
> 
>     92
> 
>     93 return XDP_PASS;
> 
>     94 }
> 
>     95
> 
>     96
> 
>     97 char _license[] SEC("license") = "GPL";
