Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01566165E8B
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 Feb 2020 14:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgBTNRy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 Feb 2020 08:17:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52912 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728056AbgBTNRy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 Feb 2020 08:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582204672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wAHBFOjHFqWhcjovbgXl14pCqSfduHGqa9U9elG2Q5s=;
        b=ZIbvUqzajkM+8mGYFZBvG9ZRHCWIIp0XR2tHEVxtVLHo3g4dRKe2Rgnu/Tpm1kIF8qlY/z
        mZ4BYmMa++OojTmNJW4UlJVeOtPOrPsJOSSGU/9MvG59ZgzVtvwEpw0N4kTUZRliz2bSeW
        KZF7OG4OhXG/GXYQ4du6uAr+h6MYT4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Bbims1btOQmmBXglQTUcgA-1; Thu, 20 Feb 2020 08:17:51 -0500
X-MC-Unique: Bbims1btOQmmBXglQTUcgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3B5918A6EC0;
        Thu, 20 Feb 2020 13:17:49 +0000 (UTC)
Received: from [10.36.116.253] (ovpn-116-253.ams2.redhat.com [10.36.116.253])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F73100EBAC;
        Thu, 20 Feb 2020 13:17:43 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc:     "Alexei Starovoitov" <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "Toke =?utf-8?b?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=" <toke@redhat.com>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>
Subject: Re: Capture xdp packets in an fentry BPF hook
Date:   Thu, 20 Feb 2020 14:17:41 +0100
Message-ID: <0B0D36B7-283E-468A-8DE1-C733FD9A9896@redhat.com>
In-Reply-To: <20200219203626.ozkdoyhyexwxwbbt@ast-mbp>
References: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com>
 <20200219203626.ozkdoyhyexwxwbbt@ast-mbp>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 19 Feb 2020, at 21:36, Alexei Starovoitov wrote:

> On Wed, Feb 19, 2020 at 03:38:40PM +0100, Eelco Chaudron wrote:
>> Hi Alexei at al.,
>>
>> I'm getting closer to finally have an xdpdump tool that uses the bpf
>> fentry/fexit tracepoints, but I ran into a final hurdle...
>>
>> To stuff the packet into a perf ring I'll need to use the
>> bpf_perf_event_output(), but unfortunately, this is a program of 
>> trace type,
>> and not XDP so the packet data is not added automatically :(
>>
>> Secondly even trying to pass the actual packet data as a reference to
>> bpf_perf_event_output() will not work as the verifier wants the data 
>> to be
>> on the fp.
>>
>> Even worse, the trace program gets the XDP info not thought the ctx, 
>> but
>> trough the fentry/fexit input value, i.e.:
>>
>> 	SEC("fentry/func")
>> 	int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)...
>>
>> 	struct net_device {
>> 	    int ifindex;
>> 	} __attribute__((preserve_access_index));
>>
>> 	struct xdp_rxq_info {
>> 	    struct net_device *dev;
>> 	    __u32 queue_index;
>> 	} __attribute__((preserve_access_index));
>>
>> 	struct xdp_buff {
>> 	    void *data;
>> 	    void *data_end;
>> 	    void *data_meta;
>> 	    void *data_hard_start;
>> 	    unsigned long handle;
>> 	    struct xdp_rxq_info *rxq;
>> 	} __attribute__((preserve_access_index));
>>
>> Hence even trying to copy in bytes to a local buffer is not allowed 
>> by the
>> verifier, i.e. __u8 *data = (u8 *)(long)xdp->data;
>>
>> Can you let me know how you envisioned a BPF entry hook to capture 
>> packets
>> from XDP. Am I missing something, or is there something missing from 
>> the
>> infrastructure?
>
> Tracing of XDP is missing a helper similar to bpf_skb_output() for 
> skb.
> Its first arg will be 'struct xdp_buff *' and .arg1_type = 
> ARG_PTR_TO_BTF_ID
> then it will work similar to bpf_skb_output() in progs/kfree_skb.c.

Thanks for clarifying the needs for a new helper. I will be on PTO next 
week but will work on a bpf_xdp_output() helper when I get back.

Cheers,

Eelco

