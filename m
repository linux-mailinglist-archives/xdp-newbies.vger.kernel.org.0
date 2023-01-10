Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B2664494
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Jan 2023 16:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237888AbjAJPYs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 10:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238793AbjAJPYX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 10:24:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533F876219
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673364211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wiczRkr4dRbRLNPCJlkTu8xiGzIe93uo9k4dBBdQ/qo=;
        b=VUBr7wU3GpgZEY6rKMrMjpuHS3HjZ+r3tcFfRspgFC6kBbgekO3knTf7qnvNmm1MUoH0yi
        npnYaVRp2G5+H1z5XwEMap7Whw3V3M/ZZD5f7UoeJO0FNi4r/NEy0dEWQUlb9CRDGJh8Iz
        NYUfR1kS0aIhqK1/6B2zZybnX1ELP+Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-gJOY0vL3MGqclaTuJyolZQ-1; Tue, 10 Jan 2023 10:23:30 -0500
X-MC-Unique: gJOY0vL3MGqclaTuJyolZQ-1
Received: by mail-ed1-f70.google.com with SMTP id v8-20020a056402348800b0048db0688c80so7845732edc.15
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 07:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiczRkr4dRbRLNPCJlkTu8xiGzIe93uo9k4dBBdQ/qo=;
        b=Xyjwrm0o7VdXfEMKmTTuHMg/69ck7hf0DHvCs5v7BYsOS2/Ci6HsU8t9ldpeyh9P9D
         JvE2uruP3C9mCM0YALLW5ya2Kmcgl1Fzk83ejlLSAG6sgSdObAaItn5H7iADrzX+ZPrT
         rY+4y3j+7xz68Iw23VhsKPmfC7uZGO8irxcyWEjxCWXG0Ur84F1OgoPy5aTd11o0bhaV
         uRiF77rv5q1vmQUEpJ5Udvnz5R2+UskeGyVfak9RhTl6kh0U/DTiMhWpzMt5c1mwMPfB
         slKmpDJwGlm7BsNwh6zBeIKGfQ6v/xL1om7/hAGOqc68f9AUk3+863hwSucL8Hy/922e
         HerA==
X-Gm-Message-State: AFqh2koFXkR0RgK9meQbbhjjL+2vNlfBMuY0RIJDvAz4f4nvBMpqLqK3
        pIW8VVmIrhu3Zs8QY57x+fdbs3x/artDwYB8QQUQ7LfXXQQ3Z0dX31CwZ0wp6aGDZibE+TQHVTP
        TaAgJua5w+TKyJ4DNjjU6Bv0=
X-Received: by 2002:a05:6402:3784:b0:46d:cead:4eab with SMTP id et4-20020a056402378400b0046dcead4eabmr61813050edb.6.1673364207941;
        Tue, 10 Jan 2023 07:23:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZnWpbgbw8nxD8gwIDPp0bMzR3hkq4401XCzmUuldApg6ohhSwNXzjDzuIq3kCQ6OuHXf45Q==
X-Received: by 2002:a05:6402:3784:b0:46d:cead:4eab with SMTP id et4-20020a056402378400b0046dcead4eabmr61812993edb.6.1673364207157;
        Tue, 10 Jan 2023 07:23:27 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007a4e02e32ffsm5088462ejc.60.2023.01.10.07.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 07:23:26 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D2DD3900249; Tue, 10 Jan 2023 16:23:25 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Redirect packet back to host stack after AF_XDP?
In-Reply-To: <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
 <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
 <87bknh5fxf.fsf@toke.dk>
 <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 10 Jan 2023 16:23:25 +0100
Message-ID: <87tu0yh0r6.fsf@toke.dk>
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

> On Mon, Jan 2, 2023 at 3:34 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
>>
>> Vincent Li <vincent.mc.li@gmail.com> writes:
>>
>> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke=
@redhat.com> wrote:
>> >>
>> >> Vincent Li <vincent.mc.li@gmail.com> writes:
>> >>
>> >> > Hi,
>> >> >
>> >> > If I have an user space stack like mTCP works on top of AF_XDP as t=
cp
>> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
>> >> > or other tcp attack, and redirect good tcp packet back to linux host
>> >> > stack after mTCP filtering, is that possible?
>> >>
>> >> Not really, no. You can inject it using regular userspace methods (sa=
y,
>> >> a TUN device), or using AF_XDP on a veth device. But in both cases the
>> >> packet will come in on a different interface, so it's not really
>> >> transparent. And performance is not great either.
>> >
>> > I have thought about it more :) what about this scenario
>> >
>> >
>> > good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->NIC2
>> >
>> > NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
>> > redirect good tcp rst/ack to NIC2, is that possible?
>>
>> You can do this if NIC2 is a veth device: you inject packets into the
>> veth on the TX side, they come out on the other side and from the kernel
>> PoV it looks like all packets come in on the peer veth. You'll need to
>> redirect packets the other way as well.
>>
>> > any performance impact?
>>
>> Yes, obviously :)
>>
>> >> In general, if you want to filter traffic before passing it on to the
>> >> kernel, the best bet is to implement your filtering in BPF and run it=
 as
>> >> an XDP program.
>> >
>> > I am thinking for scenario like tcp rst/ack flood DDOS attack to NIC1
>> > above, I can't simply drop every rst/ack because there could be
>> > legitimate rst/ack, in this case since mTCP can validate legitimate
>> > stateful tcp connection, drop flooding rst/ack packet, redirect good
>> > rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
>> > able to do stateful TCP packet filtering, does that make sense to you?
>>
>> It makes sense in the "it can probably be made to work" sense. Not in
>> the "why would anyone want to do this" sense. If you're trying to
>> protect against SYN flooding using XDP there are better solutions than
>> proxying things through a user space TCP stack. See for instance Maxim's
>> synproxy patches:
>>
>
> SYN flooding is just one of the example, what I have in mind is an
> user space TCP/IP stack runs on top of AF_XDP as middle box/proxy for
> packet filtering or load balancing, like F5 BIG-IP runs an user space
> TCP/IP stack on top of AF_XDP. I thought open source mTCP + AF_XDP
> could be a similar use case as middle box.  user space TCP/IP stack +
> AF_XDP as middle box/proxy,  the performance is not going to be good?

Well, you can certainly build a proxy using AF_XDP by intercepting all
the traffic and bridging it onto a veth device, say. I've certainly
heard of people doing that. It'll have some non-trivial overhead,
though; even if AF_XDP is fairly high performance, you're still making
all traffic take an extra hop through userspace, and you'll lose
features like hardware TSO, etc. Whether it can be done with "good"
performance depends on your use case, I guess (i.e., how do you define
"good performance"?).

I guess I don't really see the utility in having a user-space TCP stack
be a middlebox? If you're doing packet-level filtering, you could just
do that in regular XDP (and the same for load balancing, see e.g.,
Katran), and if you want to do application-level filtering (say, a WAF),
you could just use the kernel TCP stack?

>> https://lore.kernel.org/r/20220615134847.3753567-1-maximmi@nvidia.com
>
> thanks,  it appears it requires iptables rules setup to work with the
> synproxy if I recall correctly

Might be; not familiar with the details of that...

-Toke

