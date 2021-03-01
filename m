Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3DF32831A
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Mar 2021 17:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237492AbhCAQIi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Mar 2021 11:08:38 -0500
Received: from dal2relay144.mxroute.com ([64.40.26.144]:46155 "EHLO
        dal2relay144.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237555AbhCAQGa (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 1 Mar 2021 11:06:30 -0500
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Mar 2021 11:06:29 EST
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal2relay144.mxroute.com (ZoneMTA) with ESMTPSA id 177ee848d79000ced5.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 01 Mar 2021 16:00:00 +0000
X-Zone-Loop: e016fae610c241ff7c712781fd436e6e307e85db521f
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6qnmTpRprVJMcUWm/YvyqVFwdgzdFiOMZ/bwaTFBwR0=; b=t5lTX1oHZ6j4nFNsw4UXRsg6R8
        X8PLMRLE6sPK8D+NqPWJqhOs0bxRuITaIvRvQN0JWqAnq2q39lznjALH13k6I0PyaIXTfJt9jHmdG
        eAyKmdHYhZL1tB3nfgxXyWpw9n3ROqmzlPxjJhqUVYq9cpNK673/oi6J/mEPEoDiFL/G5OxLw41PV
        tzQuwO4gkaQb6qHyU+ByShXfkVNnx3FIZ4oE6+NuZuYCIR7rR0y69/F7RkTLZll0GN1+DliJGn093
        wuJfisnp/mJorL29WsnlDK7fhi8e4x2bIIR76mbiitQzkwj+lzdezBHHrhuv7+KZCLwftAuXgpodS
        k6YJ3lPA==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: Putting Into Account Packet End (ctx->data_end)
Message-ID: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
Date:   Mon, 1 Mar 2021 09:59:56 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,

I wasn't sure if this belonged on the BPF mailing list or XDP Newbies. 
However, I figured I'd send it to the XDP Newbies list first since the 
project I'm making involves XDP.

In my project, I'm trying to create a pointer that puts in account the 
ctx->data_end pointer. The new pointer is an unsigned 32-bit integer 
that is suppose to represent an IPv4 address. Here's an example of the code.

```
void *data_end = (void *)(long)ctx->data_end;

//uint32_t *icmpdata = data_end - sizeof(uint32_t);
uint32_t *icmpdata = data_end;
icmpdata -= sizeof(uint32_t);

if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
{
     return XDP_DROP;
}
```

I'm trying to replace the last four bytes of the packet with this IPv4 
address. When I do this, I receive the following BPF verifier error when 
running the XDP program.

```
R7 invalid mem access 'pkt_end'
processed 909 insns (limit 100000000) max_states_per_insn 3 total_states 
30 peak_states 30 mark_read 25
```

To my understanding, this is due to accessing the packet end (data_end). 
However, I'm curious why this is prohibited if we're trying to go back 
four bytes into memory.

I've also tried calculating the length of the packet and using ctx->data 
like the following.

```
void *data = (void *)(long)ctx->data;

unsigned int len = (ctx->data_end - ctx->data);

uint32_t *icmpdata = data + len;
icmpdata -= sizeof(uint32_t);

if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
{
     return XDP_DROP;
}
```

However, this states the offset is outside of the packet.

```
invalid access to packet, off=-16 size=4, R2(id=56,off=-16,r=0)
R2 offset is outside of the packet
processed 931 insns (limit 100000000) max_states_per_insn 3 total_states 
29 peak_states 29 mark_read 24
```

I'm sure there is something I'm doing wrong with the check. With that 
said, I believe I found the verifier check it's running into below.

https://github.com/torvalds/linux/blob/master/kernel/bpf/verifier.c#L2882

It looks like the `mem_size` argument is 0 and offset is below 0 which 
is causing it to fail. I'm not sure why, but I'd assume it's because the 
verifier believes `len` could be negative. Though, I tried adding checks 
for `len` and ran into the same issue.

The XDP project I'm working on is a basic layer 3/4 forwarding program 
that does source port mapping when forwarding the packets. I have it 
working for TCP/UDP packets. However, for ICMP, I have nothing to keep 
track of within the headers. Therefore, I'm trying to add four bytes to 
the packet and appending the client's IPv4 address to the end of the 
packet before forwarding. When the packet comes back, I parse the last 
four bytes of the packet which is suppose to indicate the client IP 
address and remove the last four bytes of the packet. Below is the 
source code at the moment.

https://github.com/gamemann/XDP-Forwarding/blob/master/src/xdp_prog.c#L181

I hope this is enough information, but if isn't, please let me know. I 
also apologize if this is something silly I'm missing/not understanding.

Thank you for your time!

