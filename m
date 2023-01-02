Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFB565B13B
	for <lists+xdp-newbies@lfdr.de>; Mon,  2 Jan 2023 12:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjABLeu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 2 Jan 2023 06:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjABLes (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 2 Jan 2023 06:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F911AD
        for <xdp-newbies@vger.kernel.org>; Mon,  2 Jan 2023 03:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672659240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HocqtOzzdOLhN0ypmMDiVsYaNwS5FzyMDh58nJ5Wauo=;
        b=Hz/Z6Q5WrgLqUYtvE76s4VNWGpgragKzaPLYCOVVb1NJQe2YwishIaFbtTpyR21wBQfUUj
        qqmOtmymDDv5H2IktRomH2J7ys1mXbkdoS0dRFt8Dzjf25QH494wb5dUYy2yIYpNebLRGE
        W4QUFoJLchGk7YuYdR7wOQd8otM84+s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-NuVMJSESN42EBi-Tl0IuUw-1; Mon, 02 Jan 2023 06:33:59 -0500
X-MC-Unique: NuVMJSESN42EBi-Tl0IuUw-1
Received: by mail-ed1-f71.google.com with SMTP id t17-20020a056402525100b00478b85eecedso17885886edd.18
        for <xdp-newbies@vger.kernel.org>; Mon, 02 Jan 2023 03:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HocqtOzzdOLhN0ypmMDiVsYaNwS5FzyMDh58nJ5Wauo=;
        b=LGrvlskFhudo+05Ni2hhG9FnmfdgRuSxKu6XDlbP+CVugNp4BeIXOHHcsK6P2dp81V
         dGwFduWqlIKF9HLohbRk60BHGGkqfut3ONrpEXDZIwiYJJ2aI7K6sVUOKvUZr1fQ6fAw
         SYTdjFvLfDQ9Ugbw5JXzxbeB7s8ZgjJMnVOGxF7y+fhWD5m7fka+BDnaPc3uhIEwhvU5
         tEUhLSGNIxpaqixxrRCFHO8FxpLlo+tsAvmtmm7BqzxZPZ8/HnpyiszbCOsto2Yz8ObD
         xtkUKYZyAOvLeHA2TESzWXZrY5SOTUdNXb9/OsZncaTLox6lfvB4ClJiTFVdG3BgsXyC
         d0Tw==
X-Gm-Message-State: AFqh2koZEXwbnNFCckIBosMYiXMLV+PBpwzdMgj4RoYyUBpBtohcnSjt
        Ix2fPBigSHfnLrMlq/0wZpHEp5oFDZDYvntb2KJNjQwLsT+jN4wdz8XDwdtNtzKQ548bBwfP/Np
        3lDEoE9wMb3XXx1Sh3CKvDVs=
X-Received: by 2002:a17:907:2c6c:b0:828:7581:f01f with SMTP id ib12-20020a1709072c6c00b008287581f01fmr30783386ejc.23.1672659237061;
        Mon, 02 Jan 2023 03:33:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDTAPn5QSahkAuI0voIqsg/47Nm61DD0PSMXr1k3TTYaiTKTkupIkZVSSWP76SKqtlqlr3Rw==
X-Received: by 2002:a17:907:2c6c:b0:828:7581:f01f with SMTP id ib12-20020a1709072c6c00b008287581f01fmr30783362ejc.23.1672659236160;
        Mon, 02 Jan 2023 03:33:56 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b0073d796a1043sm12814273eju.123.2023.01.02.03.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:33:55 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 40F438A2256; Mon,  2 Jan 2023 12:33:48 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Redirect packet back to host stack after AF_XDP?
In-Reply-To: <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
 <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 02 Jan 2023 12:33:48 +0100
Message-ID: <87bknh5fxf.fsf@toke.dk>
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

> On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> Vincent Li <vincent.mc.li@gmail.com> writes:
>>
>> > Hi,
>> >
>> > If I have an user space stack like mTCP works on top of AF_XDP as tcp
>> > stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
>> > or other tcp attack, and redirect good tcp packet back to linux host
>> > stack after mTCP filtering, is that possible?
>>
>> Not really, no. You can inject it using regular userspace methods (say,
>> a TUN device), or using AF_XDP on a veth device. But in both cases the
>> packet will come in on a different interface, so it's not really
>> transparent. And performance is not great either.
>
> I have thought about it more :) what about this scenario
>
>
> good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->NIC2
>
> NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
> redirect good tcp rst/ack to NIC2, is that possible?

You can do this if NIC2 is a veth device: you inject packets into the
veth on the TX side, they come out on the other side and from the kernel
PoV it looks like all packets come in on the peer veth. You'll need to
redirect packets the other way as well.

> any performance impact?

Yes, obviously :)

>> In general, if you want to filter traffic before passing it on to the
>> kernel, the best bet is to implement your filtering in BPF and run it as
>> an XDP program.
>
> I am thinking for scenario like tcp rst/ack flood DDOS attack to NIC1
> above, I can't simply drop every rst/ack because there could be
> legitimate rst/ack, in this case since mTCP can validate legitimate
> stateful tcp connection, drop flooding rst/ack packet, redirect good
> rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
> able to do stateful TCP packet filtering, does that make sense to you?

It makes sense in the "it can probably be made to work" sense. Not in
the "why would anyone want to do this" sense. If you're trying to
protect against SYN flooding using XDP there are better solutions than
proxying things through a userspace TCP stack. See for instance Maxim's
synproxy patches:

https://lore.kernel.org/r/20220615134847.3753567-1-maximmi@nvidia.com

-Toke

