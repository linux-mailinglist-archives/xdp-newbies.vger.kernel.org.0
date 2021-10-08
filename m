Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA54426FA9
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Oct 2021 19:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhJHRiT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 8 Oct 2021 13:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50692 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238284AbhJHRiT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 8 Oct 2021 13:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633714583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4V46Lo/I9nCtkNEkkniUo5wHgJJVZQFvt1dx2yNTIN4=;
        b=cV/8DDlm0HsC15Lk+uGfSaVPV5T55f5T6v9m4ciIQYeySaSxaIXLZ+OgNQ5JgHEAun8htV
        /KhKd8nuBOlPXr8vO5YqstcdEW1iYl1F/RcxBN8Nan9et89VEYku0jL0s4ER8LntVoQuax
        PZ2UmSPqiFfPIyzSM8kBxfjb82m6dO0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-ZQKQRc32NIesKq9KXcr3RA-1; Fri, 08 Oct 2021 13:36:21 -0400
X-MC-Unique: ZQKQRc32NIesKq9KXcr3RA-1
Received: by mail-ed1-f69.google.com with SMTP id x5-20020a50f185000000b003db0f796903so9850041edl.18
        for <xdp-newbies@vger.kernel.org>; Fri, 08 Oct 2021 10:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=4V46Lo/I9nCtkNEkkniUo5wHgJJVZQFvt1dx2yNTIN4=;
        b=GaNDyWvtz6f2bQvopeY8WXUEXoU3efpMKDW30OHHIEXXron9r/CZ3j0C/12epYQoJ5
         j5um9VPlCeLfYJsuP0gMb7V9COd10UH3ZF0HcM1bA4JXw2HyVw4SmjfFAAtVU7wJE3o1
         767k8edj4bhA37BejhoJUwE+l1w99FVHH1Z9rd9tdiU7jrFiGh6iQxh6qSd7K59vf5Qk
         ZLqpvn/wV/sB8yqrTwKyLdW/aA/Kg7bSV8/pu7AlT64yl6VGGGrqNf+JQ1cxMNvXUysZ
         n3UI2uYVdnvPEYY3fcFb4dxsMuBTMk2QCu9Mz2LsR5CHdSAYK2yRPWKI9mOece9kmqRk
         9J0A==
X-Gm-Message-State: AOAM531JZTIMwelzLMUcyS8fS8kpsnO071ni9s98Ckib6V+F56DkDxQR
        h5NvKjGS46PCekhgfa+oxgp+FFnb9MIqc46NbM6OOyLcuNaDl77KZu+qykcsIP+Y5cbqstOnWqb
        RAlLyKQuFl2DfKG/o1jjXt7M=
X-Received: by 2002:a05:6402:26d1:: with SMTP id x17mr15264995edd.367.1633714579734;
        Fri, 08 Oct 2021 10:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVoWZb6fa/AfbqT3gZ7ro0g9oJ2Fy42G46eVZJjOLKR+TnkZZsBhL4p49h3ybFcrE9AFTXeA==
X-Received: by 2002:a05:6402:26d1:: with SMTP id x17mr15264924edd.367.1633714579329;
        Fri, 08 Oct 2021 10:36:19 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id z8sm1180681ejd.94.2021.10.08.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 10:36:18 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id F2C3B180151; Fri,  8 Oct 2021 19:36:16 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     xdp-newbies@vger.kernel.org, Jesper Brouer <brouer@redhat.com>
Subject: Re: xdp-cpumap-tc multi queue schema and traffic mirroring
In-Reply-To: <20211008105050.5c70c225@pulsar>
References: <20211006181848.20300152@pulsar> <875yu8n4xp.fsf@toke.dk>
 <20211008105050.5c70c225@pulsar>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 08 Oct 2021 19:36:16 +0200
Message-ID: <87k0inl8q7.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Ethy H. Brito" <ethy.brito@inexo.com.br> writes:

> On Thu, 07 Oct 2021 19:02:58 +0200
> Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:
>
>> "Ethy H. Brito" <ethy.brito@inexo.com.br> writes:
>>=20
>> > Hi All
>> >
>> > Before I moved to XDP cpumap bandwidth control "philosophy" I used to =
snoop
>> > inside the htb classes (mainly the default one) mirroring traffic to a
>> > dummy interface then run tcpdump on that like:
>> >
>> > 	tc filter add dev eth0 parent 1: protocol all prio 0xffff \
>> > 	u32 match u32 0 0 flowid 1:$shp action mirred egress mirror dev
>> > dummy0
>> >
>> > Then "tcpdump -npi dummy0" used to show me all that classid "1:$shp" w=
as
>> > carrying.
>> >
>> > Now, with the multi queue environment XDP creates, I can't make mirror=
ing
>> > to work. For instance: I need to see what is going on with HTB classid
>> > e:102, so I tried:=20
>> > 	tc filter add dev eth0 parent e: ... e:102 action mirred egress ...
>> >
>> > and "tcpdump -npi dummy0" prints traffic that has nothing to do with
>> > classid e:102. I can confirm the traffic is pored thru the class since=
 its
>> > bandwidth is controlled/limited correctly.=20=20
>
>
> Hi Toke, et All.
>
>>=20
>> The xdp-cpumap-tc utility will attach a filter to the egress interface,
>> presumably that is taking priority and short-circuit your mirred filter?
>
> This makes sense.=20
> But How to circumvent this??
>
> Snooping the default class (classes, in xdp-cpumap case) is essencial
> to catch misconfigured mappings.

Well, it's possible to chain multiple filters, they just need to be
configured properly. Not sure exactly what the right incantation is, but
it'll likely require at least changing the priority of the filter
installed by xdp-cpumap. I'd suggest you open an issue on the github
repository, as that is really the appropriate place to discuss this, as
it's not really XDP-specific...

-Toke

