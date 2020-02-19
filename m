Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4C7165248
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Feb 2020 23:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgBSWO3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Feb 2020 17:14:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57965 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727840AbgBSWO3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Feb 2020 17:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582150468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1mq+TnWxuhK69FmLmLDLviUvrdNVW4M2MdRWczJ81Ls=;
        b=Dk5ZtbFA5MU0YpUyk0jaM17n/3Ogatu7gpkb/N8/whsYfOLro/Y2IWF2D7vU5H1efCh2x+
        2YvH+JZ/6aTrqNpVl5GUXHUL4SF3PL5sxnAC9Sit4dhtP8Mzxf4P/jNxQ7s+LX083AkIeu
        04n3KY3Hi6ExTou7ZIpoLh5rPmSjH/0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-JWsDsEpZMj6PPamjFUvQGA-1; Wed, 19 Feb 2020 17:14:26 -0500
X-MC-Unique: JWsDsEpZMj6PPamjFUvQGA-1
Received: by mail-lj1-f199.google.com with SMTP id y15so159317ljh.22
        for <xdp-newbies@vger.kernel.org>; Wed, 19 Feb 2020 14:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=1mq+TnWxuhK69FmLmLDLviUvrdNVW4M2MdRWczJ81Ls=;
        b=J/LUjegKp5XcEkVgGJwcc2djJ5LdQAoViIaY7tJfHls22umweLhmBC/s4okbv7cpKl
         /2/kOm4Me1fVnjfxPXjOTKdEb0aLb5thZovLHKqN2hxVwEDX78vhViCTBWTG7PwR+U/L
         z6Tc6AUXuXo6UaSi7acYaP/6xZu0PPF7oNIbuYkg/MlbOISSB9q0rtfos8mPKXnMYmB9
         o0myDBVinVn5vz3chzAh0vFD8eO85n+i+1UOnFHs7SQbIxzPNtpGHxjM9NK2tD92aD8j
         dTex6ErhXb3EWSWupuZioGX9X4wM1HEH6M5ZEvVOQ4APkHegvjhnkJVJiwya9etrpzzb
         k5FQ==
X-Gm-Message-State: APjAAAVxxHZjQYcwjSwaoFhHpS3eW1Choghin+HeCOV5aYlZOg1xnJKI
        1NWJBRen7JlGDftdwio1YBlKWiiJbP1fz7i+c9P+ZaHyHvXsyHqBELOrijsTYEFMKba5bDHT2U9
        qbXw11+ZJeSfnYFLrDqI7+A8=
X-Received: by 2002:a19:a416:: with SMTP id q22mr14646932lfc.60.1582150464729;
        Wed, 19 Feb 2020 14:14:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqj7pDwKDqfIMI5nevMw8P2/dqstoN5LJCJLS9isiySrqQr1degZpmcwi3n7xq4wal56kGXA==
X-Received: by 2002:a19:a416:: with SMTP id q22mr14646921lfc.60.1582150464505;
        Wed, 19 Feb 2020 14:14:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id b17sm510552lfp.15.2020.02.19.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:14:23 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id CD7B6180365; Wed, 19 Feb 2020 23:14:20 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Capture xdp packets in an fentry BPF hook
In-Reply-To: <20200219203626.ozkdoyhyexwxwbbt@ast-mbp>
References: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com> <20200219203626.ozkdoyhyexwxwbbt@ast-mbp>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 19 Feb 2020 23:14:20 +0100
Message-ID: <87o8tuw7gj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:

> On Wed, Feb 19, 2020 at 03:38:40PM +0100, Eelco Chaudron wrote:
>> Hi Alexei at al.,
>> 
>> I'm getting closer to finally have an xdpdump tool that uses the bpf
>> fentry/fexit tracepoints, but I ran into a final hurdle...
>> 
>> To stuff the packet into a perf ring I'll need to use the
>> bpf_perf_event_output(), but unfortunately, this is a program of trace type,
>> and not XDP so the packet data is not added automatically :(
>> 
>> Secondly even trying to pass the actual packet data as a reference to
>> bpf_perf_event_output() will not work as the verifier wants the data to be
>> on the fp.
>> 
>> Even worse, the trace program gets the XDP info not thought the ctx, but
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
>> Hence even trying to copy in bytes to a local buffer is not allowed by the
>> verifier, i.e. __u8 *data = (u8 *)(long)xdp->data;
>> 
>> Can you let me know how you envisioned a BPF entry hook to capture packets
>> from XDP. Am I missing something, or is there something missing from the
>> infrastructure?
>
> Tracing of XDP is missing a helper similar to bpf_skb_output() for skb.
> Its first arg will be 'struct xdp_buff *' and .arg1_type = ARG_PTR_TO_BTF_ID
> then it will work similar to bpf_skb_output() in progs/kfree_skb.c.

What about freplace? Since that is also using the tracing
infrastructure, will the replacing program also be considered a tracing
program by the verifier? Or is it possible to load a program with an XDP
type, but still use it for freplace?

-Toke

