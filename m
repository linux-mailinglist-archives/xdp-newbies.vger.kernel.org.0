Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CAA64DA0B
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Dec 2022 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiLOLJs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Dec 2022 06:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiLOLJs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Dec 2022 06:09:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255D3240B5
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Dec 2022 03:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671102542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vxQqpdZpolFOsFM3PGGTfFIaFyAJujZSSmgYdcrNLn4=;
        b=G8FwCVh/zEeG8Kp53BlEm1jAXye4phTeaj8OtyWHeOnZMnxIewghEnoDnHrLcdyuYzMK66
        GQtNWL3zQ9+rp+LbduXnX1B3mYpA9ebmMilOH+S2otIwk5zybbovhOfdJzeixpqx2ynvvS
        m5qSnuXPUPVDhhZ1HEDCftKWkpNaM2w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-pmkvwh04PlOaLRJEbrdzjQ-1; Thu, 15 Dec 2022 06:09:00 -0500
X-MC-Unique: pmkvwh04PlOaLRJEbrdzjQ-1
Received: by mail-ej1-f70.google.com with SMTP id sh37-20020a1709076ea500b007c09b177cd1so13374118ejc.12
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Dec 2022 03:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxQqpdZpolFOsFM3PGGTfFIaFyAJujZSSmgYdcrNLn4=;
        b=utmX8vp5XKY1XOw/I1y6dMOCowdujLq2mzx2Z0GHcp/wWslReNVfCJOUSx1vLkr7DA
         eCeWTtlFG3W70TZtYLz1OvWIEz+xUI/sEjLm6mOH6KJy2V+fnGlf5T480+uR8aCUG8Jv
         3EkEFf0OWQ9N6WFgiRXlavhsW9ZIFIkDDJiHhasnChcXGRJfxgOgaU9U+3ctJE4xIB7G
         nGXJMAgzrbxkpbAYDNX5ZmTzovo+D4MjVjkiG+yhm8LZcNsWLYJGcpTrMSUyFxsAMpSy
         woCCASGJSe/w38Z1tnjgS4rlpvhRMeF1HrcmX9AVXpyWNXisDsvwoUW2Rv1GWMxauJas
         UC5A==
X-Gm-Message-State: ANoB5pl+FKrHHD+ljATXBTbGXFMENhwF2+Q3m5VbKbju3eDWC5SzlhPe
        PncnreiS0GRnEYGwhq7fZTzyRYEVYeO8wMc+2v430lLgNsWpzPAlhJT/SWz9jvB5vu/baN3R2VB
        wRQ/xkhacY8hnaqkohhablaw=
X-Received: by 2002:a17:907:7850:b0:7c3:15cc:76d0 with SMTP id lb16-20020a170907785000b007c315cc76d0mr5883767ejc.47.1671102538047;
        Thu, 15 Dec 2022 03:08:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6f6txpwWiLqYBjOil4mI9u70/YvmA4nWXCi8/28FU/q/MDrX0GJYSgAK/ZSRE1Wz4BDN0VyA==
X-Received: by 2002:a17:907:7850:b0:7c3:15cc:76d0 with SMTP id lb16-20020a170907785000b007c315cc76d0mr5883730ejc.47.1671102537178;
        Thu, 15 Dec 2022 03:08:57 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id e17-20020a170906315100b007aee7ca1199sm7086953eje.10.2022.12.15.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 03:08:56 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id BFC7182F7AA; Thu, 15 Dec 2022 12:08:55 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Redirect packet back to host stack after AF_XDP?
In-Reply-To: <CAK3+h2zpbpfTV31XU5Vr2kb5F0=zE5z9gMyb6Bu7LBuHQxEBMA@mail.gmail.com>
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk>
 <CAK3+h2zpbpfTV31XU5Vr2kb5F0=zE5z9gMyb6Bu7LBuHQxEBMA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 15 Dec 2022 12:08:55 +0100
Message-ID: <87len8exfc.fsf@toke.dk>
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
>>
> I see
>
>> In general, if you want to filter traffic before passing it on to the
>> kernel, the best bet is to implement your filtering in BPF and run it as
>> an XDP program.
>>
> I read about this
> https://eric-keller.github.io/papers/2020/HybridNetworkStack_ieee_nfvsdn2=
020_slides.pdf,
> thought that is good idea to run mTCP on top of AF_XDP as  anti DDOS
> tool

Right, that slide deck seems awfully hand-wavy about how they're getting
packets back into the kernel, though... I guess you could ask the author
how they're doing it? :)

-Toke

