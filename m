Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12ECB13F6B8
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 20:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgAPTGl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 14:06:41 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45542 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387569AbgAPTGk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 14:06:40 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so8714819pls.12
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Jan 2020 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=/ORZXh7VXs3uAu7nmrRxrtIve2kt80xbkLSSfbelCdQ=;
        b=c7THiBT5/gNvgV0vQrUyZG7WBqbmvUiXx92yQ6j3jPX5B1Wx3GZ9f9jmbMRn3mK34d
         k5b3EyBOCe59GimrkEGTzvl+ddgRtr6ZFhgm8lbMC4GrYVDuitW18d/0Bc9L3PXRIJxO
         0f4MBylvoazH3BuBBXAWyQ7YjwN/f/o3JdCX/bKawpwSedL103ZrhigXtEc88d4Sbg68
         pojyTGu2mhd/KKm7Rw0Yjm/5v047BC1oymnPIw06WLwOV93Tq8kIpLNR2nMFCeeddxnO
         3oROfoXlQ2lljmBs3T5AbiSRwjuzGcUhX/aaQ7MXSjI54UnQ9udl86aWuuP0bolvlrOO
         /QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=/ORZXh7VXs3uAu7nmrRxrtIve2kt80xbkLSSfbelCdQ=;
        b=nglC0ribf+qSecyelkG8P4GIZmKnscOdJ7Ra24hr3ehkfeGoB8lHI+pq1yn89BptLN
         6w3yopsWwDPW1dXV+LILPbPuiPb1PMoXLc20Fjnsz+Fzg29pk1fYlY9h05xN/wx5T2Nh
         eoKp6UycayhqdQaZ0pVLux+6XVw4JdDcL/nEBs/PwW0dEiYpSheeRAUXiJBU3+apXTN5
         bT5lCt2aBfPXCGUTujuRTn/Tlz4HUOV2D600Z6dlt362J0C4oUeXOTNYnakrwDHp+3su
         Zjp1lx4XE47fUuTgJpXgH3Z64qpBUQc5CtWv+8Hy9XPa/LaBmxgqAiX/W1gP17Z/sWsG
         71mw==
X-Gm-Message-State: APjAAAUJcE5GXZyrz9JZjSI4gr+gpxPUCAuSUIpKl3c/SPMwqB/kph23
        Tdn+uEz2fpWyaUgy27SeDF0=
X-Google-Smtp-Source: APXvYqziytoxBF53rsEVKTSc/C3Y1HQjpLiLIU69tM+Vw5Pg+j2TwWqNSMsKt/JALVoTFH3+r4UO8w==
X-Received: by 2002:a17:902:b58c:: with SMTP id a12mr26033398pls.30.1579201599254;
        Thu, 16 Jan 2020 11:06:39 -0800 (PST)
Received: from [192.168.1.25] (c-71-231-121-172.hsd1.wa.comcast.net. [71.231.121.172])
        by smtp.gmail.com with ESMTPSA id l14sm23405145pgt.42.2020.01.16.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 11:06:37 -0800 (PST)
From:   Vincent Li <mchun.li@gmail.com>
X-Google-Original-From: Vincent Li <guzheng@gmail.com>
Date:   Thu, 16 Jan 2020 11:06:35 -0800 (PST)
X-X-Sender: guzheng@jiadeimac.local
To:     =?ISO-8859-15?Q?Toke_H=F8iland-J=F8rgensen?= <toke@redhat.com>
cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Vincent Li <mchun.li@gmail.com>, xdp-newbies@vger.kernel.org,
        daniel@iogearbox.net, andriin@fb.com, dsahern@gmail.com
Subject: Re: XDP invalid memory access
In-Reply-To: <87y2u7spj3.fsf@toke.dk>
Message-ID: <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com> <20200116022459.GA2853@ranger.igk.intel.com> <87y2u7spj3.fsf@toke.dk>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-781027806-1579201596=:5400"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-781027806-1579201596=:5400
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT



On Thu, 16 Jan 2020, Toke Høiland-Jørgensen wrote:

Hi Toke,

> 
> You could also try the xdp-loader in xdp-tools:
> https://github.com/xdp-project/xdp-tools
> 
> It's somewhat basic still, but should be able to at least load a basic
> program - please file a bug report if it fails.

I tried the xdp-tools xdp-loader, when the optlen is global variable, I 
got:
# xdp-loader load enp3s0 tcp_option.o
Couldn't load BPF program: Relocation failed

if I move the optlen, i variable to local variable, I got:

# xdp-loader load enp3s0 tcp_option.o
Couldn't load eBPF object: Invalid argument(-22)

Here is the complete code:

#include <stdint.h>
#include <arpa/inet.h>
#include <asm/byteorder.h>
#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/pkt_cls.h>

/*
 * Sample XDP to parse tcp option.
 * compile it with:
 * clang -O2 -emit-llvm -c tcp_option.c -o - |llc -march=bpf -filetype=obj -o tcp_option.o
 * attach it to a device with XDP as:
 * 	ip link set dev lo xdp object tcp_option.o verbose
 */

#define SEC(NAME) __attribute__((section(NAME), used))

#define TCPOPT_EOL        0       /* End of options (1)              */
#define TCPOPT_NOP        1       /* No-op (1)                       */
#define TCPOPT_MAXSEG     2       /* Maximum segment size (4)        */
#define TCPOPT_WSCALE     3       /* Window scaling (3)              */
#define TCPOPT_SACKOK     4       /* Selective ACK permitted (2)     */
#define TCPOPT_SACK       5       /* Actual selective ACK (10-34)    */
#define TCPOPT_TSTAMP     8       /* Timestamp (10)                  */


/* from bpf_helpers.h */

static int (*bpf_trace_printk)(const char *fmt, int fmt_size, ...) =
(void *) BPF_FUNC_trace_printk;

static unsigned long long (*bpf_get_prandom_u32)(void) =
(void *) BPF_FUNC_get_prandom_u32;


static int tcp_option(void *data, void *data_end)
{
	struct ethhdr *eth = (struct ethhdr *)data;
	struct iphdr *iph = (struct iphdr *)(eth + 1);
	struct tcphdr *tcphdr = (struct tcphdr *)(iph + 1);
	const __u8 *op;
	int i, optlen;

	/* sanity check needed by the eBPF verifier */
	if ((void *)(tcphdr + 1)  > data_end)
		return 0;

	/* skip non TCP packets */
	if (eth->h_proto != __constant_htons(ETH_P_IP) || iph->protocol != IPPROTO_TCP)
		return 0;

	/* incompatible flags, or PSH already set */
	if (tcphdr->ack || tcphdr->fin || tcphdr->rst || tcphdr->psh)
		return 0;

	if (tcphdr->syn) {
		if (((void *)(tcphdr + 1) + tcphdr->doff*4) > data_end)
			return 0;

		optlen = tcphdr->doff*4 - sizeof(*tcphdr);
		for (i = 0; i < optlen; ) {
			if (op[i] == TCPOPT_EOL ) {
				char fmt[] = "XDP: tcp source : %d tcp option eol\n";
				bpf_trace_printk(fmt, sizeof(fmt), (int)tcphdr->source);
				return 1;
			}
			if (op[i] < 2)
				i++;
			else
				i += op[i+1] ? : 1;
		}
#if 0
		if (tcphdr->doff*4 == 44 || tcphdr->doff*4 == 28) {
			char fmt[] = "XDP: tcp source : %d data offset :%d\n";
			bpf_trace_printk(fmt, sizeof(fmt), (int)tcphdr->source, (int)tcphdr->doff*4);
			return 1;
		}
#endif
	}
	return 0;
}

SEC("prog")
int xdp_main(struct xdp_md *ctx)
{
	void *data_end = (void *)(uintptr_t)ctx->data_end;
	void *data = (void *)(uintptr_t)ctx->data;

	if (tcp_option(data, data_end))
		return XDP_DROP;

	return XDP_PASS;
}


char _license[] SEC("license") = "GPL";
--0-781027806-1579201596=:5400--
