Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C06E664FF4
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Jan 2023 00:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbjAJX2n (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 18:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235288AbjAJX2i (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 18:28:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269465F54
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 15:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673393270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k5Qfi0lbqiY8Ka8n+xxJjMx/kp63iZmB5B+T0sIAguk=;
        b=VOW8xoiF403apxcXd39cpGgvraJzyP5cyv8ZDeiAdgL0lqdZVGcmimxRsHv2TBDP2aL6L0
        /lQ/VATBDiiVwZp+1+a6Lv6a+7tedLj5EQqp714t/Vmi7M23TzUIs4nuZ2Z7YWfmmBbbwx
        sRl36Z92fVoHV7ezYAiTry7hwMa12c8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-SjbPmUqeM26JZ7R-fimKgQ-1; Tue, 10 Jan 2023 18:27:48 -0500
X-MC-Unique: SjbPmUqeM26JZ7R-fimKgQ-1
Received: by mail-ej1-f71.google.com with SMTP id qb2-20020a1709077e8200b00842b790008fso8927470ejc.21
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 15:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5Qfi0lbqiY8Ka8n+xxJjMx/kp63iZmB5B+T0sIAguk=;
        b=5mzDw4yh3VtrvJlgfygZ52UoLlYJSpd6E7fPvSd703s0Gjb/7ZMrSsfRj8tedZKKer
         2yBeKBhPdaPCBMj+6Mb8OTpF3TJ70XrGHCBfRODhCobcuqX/wDry8L6wyfkMqJHoy6Gn
         lkmZjLN502cui+K0ZkRrDKs4lYItH/Qcai+U27EOmvGODKBkL0WROWssNLnJpBKHuROi
         OlUyCD9hcAupGdtlv3VSiWumpHRYFkt7TiPcd5u8BcUvotGqmafeGuJMBVYjCwoGGsEe
         o0etThdCr2BSCeHAqzr7WTclJSN7arHZXchRu7rbNXlt2BI/i/03nzXNT0WAdd0PZ3qv
         wpzQ==
X-Gm-Message-State: AFqh2ko6+kIT5pNj622ztNaNEDFyGGcEuyC0eQhH6OHZBc2/WmZ+1u49
        fZiYZZ/OY0BpzCGsAdRxU8aMvznRuqrEilBX1K8O67digG6NQytKcWViVLjWMWGRrQgkVzkwEcg
        3A5Y5Haxhl9Y8Sbf7jhepT5E=
X-Received: by 2002:a50:a401:0:b0:46d:53d7:d21e with SMTP id u1-20020a50a401000000b0046d53d7d21emr64053896edb.27.1673393267514;
        Tue, 10 Jan 2023 15:27:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuu/LkOFWh7BRiC9GnjaNvRaJBQUyd+7EciXvL69N0XpTbWrBLVWPFv9gBDov/aWJBwK+dLjw==
X-Received: by 2002:a50:a401:0:b0:46d:53d7:d21e with SMTP id u1-20020a50a401000000b0046d53d7d21emr64053889edb.27.1673393267135;
        Tue, 10 Jan 2023 15:27:47 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id fu17-20020a170907b01100b0084c723b4c40sm5546537ejc.103.2023.01.10.15.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 15:27:46 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C974A900350; Wed, 11 Jan 2023 00:27:45 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Redirect packet back to host stack after AF_XDP?
In-Reply-To: <CAK3+h2wQo2LUDqaqymTz=kJ08tBy_m4C6KieBsn-PLn_PbY6Og@mail.gmail.com>
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
 <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
 <87bknh5fxf.fsf@toke.dk>
 <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
 <87tu0yh0r6.fsf@toke.dk>
 <CAK3+h2wQo2LUDqaqymTz=kJ08tBy_m4C6KieBsn-PLn_PbY6Og@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 11 Jan 2023 00:27:45 +0100
Message-ID: <87lemageby.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Vincent Li <vincent.mc.li@gmail.com> writes:

> On Tue, Jan 10, 2023 at 7:23 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> Vincent Li <vincent.mc.li@gmail.com> writes:
>>
>> > On Mon, Jan 2, 2023 at 3:34 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
>> >>
>> >> Vincent Li <vincent.mc.li@gmail.com> writes:
>> >>
>> >> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>> >> >>
>> >> >> Vincent Li <vincent.mc.li@gmail.com> writes:
>> >> >>
>> >> >> > Hi,
>> >> >> >
>> >> >> > If I have an user space stack like mTCP works on top of AF_XDP a=
s tcp
>> >> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack f=
lood
>> >> >> > or other tcp attack, and redirect good tcp packet back to linux =
host
>> >> >> > stack after mTCP filtering, is that possible?
>> >> >>
>> >> >> Not really, no. You can inject it using regular userspace methods =
(say,
>> >> >> a TUN device), or using AF_XDP on a veth device. But in both cases=
 the
>> >> >> packet will come in on a different interface, so it's not really
>> >> >> transparent. And performance is not great either.
>> >> >
>> >> > I have thought about it more :) what about this scenario
>> >> >
>> >> >
>> >> > good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->N=
IC2
>> >> >
>> >> > NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
>> >> > redirect good tcp rst/ack to NIC2, is that possible?
>> >>
>> >> You can do this if NIC2 is a veth device: you inject packets into the
>> >> veth on the TX side, they come out on the other side and from the ker=
nel
>> >> PoV it looks like all packets come in on the peer veth. You'll need to
>> >> redirect packets the other way as well.
>> >>
>> >> > any performance impact?
>> >>
>> >> Yes, obviously :)
>> >>
>> >> >> In general, if you want to filter traffic before passing it on to =
the
>> >> >> kernel, the best bet is to implement your filtering in BPF and run=
 it as
>> >> >> an XDP program.
>> >> >
>> >> > I am thinking for scenario like tcp rst/ack flood DDOS attack to NI=
C1
>> >> > above, I can't simply drop every rst/ack because there could be
>> >> > legitimate rst/ack, in this case since mTCP can validate legitimate
>> >> > stateful tcp connection, drop flooding rst/ack packet, redirect good
>> >> > rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
>> >> > able to do stateful TCP packet filtering, does that make sense to y=
ou?
>> >>
>> >> It makes sense in the "it can probably be made to work" sense. Not in
>> >> the "why would anyone want to do this" sense. If you're trying to
>> >> protect against SYN flooding using XDP there are better solutions than
>> >> proxying things through a user space TCP stack. See for instance Maxi=
m's
>> >> synproxy patches:
>> >>
>> >
>> > SYN flooding is just one of the example, what I have in mind is an
>> > user space TCP/IP stack runs on top of AF_XDP as middle box/proxy for
>> > packet filtering or load balancing, like F5 BIG-IP runs an user space
>> > TCP/IP stack on top of AF_XDP. I thought open source mTCP + AF_XDP
>> > could be a similar use case as middle box.  user space TCP/IP stack +
>> > AF_XDP as middle box/proxy,  the performance is not going to be good?
>>
>> Well, you can certainly build a proxy using AF_XDP by intercepting all
>> the traffic and bridging it onto a veth device, say. I've certainly
>> heard of people doing that. It'll have some non-trivial overhead,
>> though; even if AF_XDP is fairly high performance, you're still making
>> all traffic take an extra hop through userspace, and you'll lose
>> features like hardware TSO, etc. Whether it can be done with "good"
>> performance depends on your use case, I guess (i.e., how do you define
>> "good performance"?).
>>
>> I guess I don't really see the utility in having a user-space TCP stack
>> be a middlebox? If you're doing packet-level filtering, you could just
>> do that in regular XDP (and the same for load balancing, see e.g.,
>> Katran), and if you want to do application-level filtering (say, a WAF),
>> you could just use the kernel TCP stack?
>>
>
> the reason I mention user-space TCP stack is user space stack appears
> performs better than kernel TCP stack, and we see user-space stack +
> DPDK for high speed packet processing applications out there, since
> XDP/AF_XDP seems to be competing with DPDK, so I thought why not user
> space stack + AF_XDP :)

Well, there's a difference between running a user-level stack directly
in the end application, or using it as a middlebox. The latter just adds
overhead, and again, I really don't see why you'd want to do that?

Also, the mTCP web site cites tests against a 3.10 kernel, and the code
doesn't look like it's been touched for years. So I'd suggest running
some up-to-date tests against a modern kernel (and trying things like
io_uring if your concern is syscall overhead for small flows) before
drawing any conclusions about performance :)

That being said, it's certainly *possible* to do what you're suggesting;
there's even a PMD driver in DPDK for AF_XDP, so in that sense it's
pluggable. So, like, feel free to try it out? I'm just cautioning
against thinking it some kind of magic bullet; packet processing at high
speeds in software is *hard*, so the details matter a lot, and it's
really easy to throw away any performance gains by inefficiencies
elsewhere in the stack (which goes for both the kernel stack, XDP, and
AF_XDP).

-Toke

