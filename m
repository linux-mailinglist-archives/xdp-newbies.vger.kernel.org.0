Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3492165294
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Feb 2020 23:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgBSWeq (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Feb 2020 17:34:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57096 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgBSWeq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Feb 2020 17:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582151684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7nl8XmgRfVXFQsqJYp+U1pyKQ6mhV4WooSWhRcLVnvo=;
        b=AfPgRIyqzigqHLLavjV0ABIHwrvYH3mOxqVx3KdhPhwTBDGDJA4I5ipLmcwWj4dkI2zLJc
        10K20+aXw4A0fb+ConNCmPfASeaYucCRFE5MkjwbnJmL6xqJprf3E1qbZy6WLrgJULWC4S
        lJtfBLEb1w7Wd8HDRCnM4OwQA2WeSLE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-R15Ka3_JOiWdlH5CrRbvjQ-1; Wed, 19 Feb 2020 17:34:42 -0500
X-MC-Unique: R15Ka3_JOiWdlH5CrRbvjQ-1
Received: by mail-lf1-f70.google.com with SMTP id k26so545900lfm.0
        for <xdp-newbies@vger.kernel.org>; Wed, 19 Feb 2020 14:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=7nl8XmgRfVXFQsqJYp+U1pyKQ6mhV4WooSWhRcLVnvo=;
        b=QtsOnFM1/3tx2G/vb5MiFDGKK5irVNFTvQoC4zhtIXxJbzP8HRoMd/wYWyI0jzYoDp
         /cxGYClfrsZthc1E58LMs5BPM+ScyV+yJKceR3eUSKSIs+TwnUoPtlPp41uCDbbHXwmg
         J2+gb287gcdUEPvhwtOc0bhRMg9BEFQ42nBMfd03XXJhZLthu95SjCSnW8Xwcg8a1lJl
         tLEPSIaJlzuDlQW5eVrrOp8A/XsTmACV7gGmZu9EgLzYFybU3On+i8/l1GoBFr52K1dD
         lwkkirr8qlBcmL1m71uWYq8IKPv3vKSS4psFVU5tuqVpBJ8xibnMXQKHopIdQHkNU13N
         e7sg==
X-Gm-Message-State: APjAAAUpIxWcMe8YjFmPITzA4GNZoMpMnSYUkrsdwei1K1kvvRLFmpwf
        P1lRft3TG1U6eH5LqDBO6ztBnxkChehL1KPTKUX7l4M52255NJreAC+sPz2cp1cTmotNsr5ihxt
        jvUNkFOAcrqDaDH7bl8PhTss=
X-Received: by 2002:a2e:721a:: with SMTP id n26mr17063383ljc.128.1582151681031;
        Wed, 19 Feb 2020 14:34:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvWQFtxPjk1/T6HMqQjAhCQGTZZ+/vNOQhiEwlpDfZyoOdoBkZV6JpADcyTcoKqcxKbmS3Bw==
X-Received: by 2002:a2e:721a:: with SMTP id n26mr17063368ljc.128.1582151680748;
        Wed, 19 Feb 2020 14:34:40 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id x23sm538480lff.24.2020.02.19.14.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:34:39 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 3320E180365; Wed, 19 Feb 2020 23:34:39 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Capture xdp packets in an fentry BPF hook
In-Reply-To: <CAADnVQJzbAu3tdqn1DbyK+VFwYjp5rpgJOpPFLEcoe_mEr3YEw@mail.gmail.com>
References: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com> <20200219203626.ozkdoyhyexwxwbbt@ast-mbp> <87o8tuw7gj.fsf@toke.dk> <CAADnVQJzbAu3tdqn1DbyK+VFwYjp5rpgJOpPFLEcoe_mEr3YEw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 19 Feb 2020 23:34:39 +0100
Message-ID: <87ftf6w6io.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:

> On Wed, Feb 19, 2020 at 2:14 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:
>>
>> > On Wed, Feb 19, 2020 at 03:38:40PM +0100, Eelco Chaudron wrote:
>> >> Hi Alexei at al.,
>> >>
>> >> I'm getting closer to finally have an xdpdump tool that uses the bpf
>> >> fentry/fexit tracepoints, but I ran into a final hurdle...
>> >>
>> >> To stuff the packet into a perf ring I'll need to use the
>> >> bpf_perf_event_output(), but unfortunately, this is a program of trac=
e type,
>> >> and not XDP so the packet data is not added automatically :(
>> >>
>> >> Secondly even trying to pass the actual packet data as a reference to
>> >> bpf_perf_event_output() will not work as the verifier wants the data =
to be
>> >> on the fp.
>> >>
>> >> Even worse, the trace program gets the XDP info not thought the ctx, =
but
>> >> trough the fentry/fexit input value, i.e.:
>> >>
>> >>      SEC("fentry/func")
>> >>      int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)...
>> >>
>> >>      struct net_device {
>> >>          int ifindex;
>> >>      } __attribute__((preserve_access_index));
>> >>
>> >>      struct xdp_rxq_info {
>> >>          struct net_device *dev;
>> >>          __u32 queue_index;
>> >>      } __attribute__((preserve_access_index));
>> >>
>> >>      struct xdp_buff {
>> >>          void *data;
>> >>          void *data_end;
>> >>          void *data_meta;
>> >>          void *data_hard_start;
>> >>          unsigned long handle;
>> >>          struct xdp_rxq_info *rxq;
>> >>      } __attribute__((preserve_access_index));
>> >>
>> >> Hence even trying to copy in bytes to a local buffer is not allowed b=
y the
>> >> verifier, i.e. __u8 *data =3D (u8 *)(long)xdp->data;
>> >>
>> >> Can you let me know how you envisioned a BPF entry hook to capture pa=
ckets
>> >> from XDP. Am I missing something, or is there something missing from =
the
>> >> infrastructure?
>> >
>> > Tracing of XDP is missing a helper similar to bpf_skb_output() for skb.
>> > Its first arg will be 'struct xdp_buff *' and .arg1_type =3D ARG_PTR_T=
O_BTF_ID
>> > then it will work similar to bpf_skb_output() in progs/kfree_skb.c.
>>
>> What about freplace? Since that is also using the tracing
>> infrastructure, will the replacing program also be considered a tracing
>> program by the verifier? Or is it possible to load a program with an XDP
>> type, but still use it for freplace?
>
> Please see freplace example in progs/fexit_bpf2bpf.c
> freplace is not a separate type of program.
> It's not tracing and it's not networking.
> It's an extension of the target program.
> If target prog is xdp prog the extension will have access
> to the same struct xdp_md and the same xdp helpers.

Ah, great! It would seem I had not really looked at those examples,
other than to notice they were there. Thanks for the pointer, and sorry
for being dense! :)

-Toke

