Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556BD43C8B3
	for <lists+xdp-newbies@lfdr.de>; Wed, 27 Oct 2021 13:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241677AbhJ0LiU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 27 Oct 2021 07:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30521 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241689AbhJ0LiN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 27 Oct 2021 07:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635334547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u0KqRhzJIqW6BTnIYapXSGKnw/28ESNxKuek/QZbiHg=;
        b=DUfr/9VtRBsUlmdJe8GAuddmQc3tOv/nS0c0aZtMOb4Axl/IOJ9axhqbiZJ8taKdnxT5hN
        MaFip+eGcfAfoeoTG5b7lW0l7T0HAaiutBC4yTQWARgXBiI6YRb9kfNGX00nk7AJO8Kr78
        wTUG6iZ55CzXQHbqhc8qJEZzu2DIJIU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-TP8dunh8P4aRTEniFnJNcw-1; Wed, 27 Oct 2021 07:35:46 -0400
X-MC-Unique: TP8dunh8P4aRTEniFnJNcw-1
Received: by mail-ed1-f71.google.com with SMTP id u17-20020a50d511000000b003daa3828c13so1998769edi.12
        for <xdp-newbies@vger.kernel.org>; Wed, 27 Oct 2021 04:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=u0KqRhzJIqW6BTnIYapXSGKnw/28ESNxKuek/QZbiHg=;
        b=XLSw6UrW7jFNqVaknNjnHf/j4zvCgiQrEAivTcq4ktHzW/FPcBhk1d8LzRZaM7FFME
         Ii3U0+Zuxyg97xS8AFMLCd00ZFWgShFK4H7WbbuiAefg8aicb71GV8uk9Ef8UC2t3P5U
         eajaVQhp9Wrt0V34rAmys2XvrtgARGoLPcMilfPOa7CtqSSCIQE8uIVbIRHJmKt0uwfa
         dkjG1A2TzvnueI5PdsJITQoGdRwBWGVPeeKWJGE7uWcFNedE6I1DrbD2dAwE4SL3ApZR
         Ll5g5Q+GooGafLTJfdsgrX8lgZ2wT0i2Qs+ZEGl2m4BdXDIRpi0erpCwSu5KqB0H5dtw
         RmYQ==
X-Gm-Message-State: AOAM531lcZCrDHGCRkxYg9ShJlanESif51SrGzV9OGx2kUNQLOkTKvEg
        oOgvv79ZM+eYBImxz7C7WRDoI5uXp+Z32Zn8X4lTJvUienp0TK22TWn+U7GCdtW7DFYzUz/egP/
        OEOSleqArW+owiOoLlJvqF6k=
X-Received: by 2002:a05:6402:278a:: with SMTP id b10mr26661020ede.390.1635334544890;
        Wed, 27 Oct 2021 04:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt+kyk0sDnc99QgZuoQBPKBOJNQ7eLntSnmIa/8Fc6FZvV7lINTQi+1aWL2gLpijjBmZJTvg==
X-Received: by 2002:a05:6402:278a:: with SMTP id b10mr26660969ede.390.1635334544447;
        Wed, 27 Oct 2021 04:35:44 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id m5sm6816429ejc.62.2021.10.27.04.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 04:35:43 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 94D8F180262; Wed, 27 Oct 2021 13:35:42 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jun Hu <hujun.work@gmail.com>, Konrad Zemek <konrad@zemek.io>
Cc:     xdp-newbies@vger.kernel.org, Jesper Brouer <brouer@redhat.com>
Subject: Re: AF_XDP socket TX path interact with TC?
In-Reply-To: <CAEM4-kBho+aUNNSAoGWWF-Ou=2QC+7b6OD6m+JixOHCcye9RFw@mail.gmail.com>
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
 <875ytlcrdi.fsf@toke.dk>
 <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
 <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
 <CAEM4-kBho+aUNNSAoGWWF-Ou=2QC+7b6OD6m+JixOHCcye9RFw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 27 Oct 2021 13:35:42 +0200
Message-ID: <87pmrqaeep.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jun Hu <hujun.work@gmail.com> writes:

> On Tue, Oct 26, 2021 at 4:08 AM Konrad Zemek <konrad@zemek.io> wrote:
>>
>> On Monday, October 25th, 2021 at 8:26 PM, Jun Hu <hujun.work@gmail.com> =
wrote:
>>
>> > On Mon, Oct 25, 2021 at 3:48 AM Toke H=C3=B8iland-J=C3=B8rgensen toke@=
redhat.com wrote:
>> >
>> > > Jun Hu hujun.work@gmail.com writes:
>> > >
>> > > > Hi,
>> > > >
>> > > > I want to put a timestamp in the egress packets, and I want to use
>> > > >
>> > > > AF_XDP socket for both sending and receiving packets; since a XDP
>> > > >
>> > > > kernel program only work in ingress direction, I wonder if I could=
 use
>> > > >
>> > > > a tc kernel program to change a packet sent out via an AF_XDP sock=
et?
>> > > >
>> > > > I searched around, but couldn't find any direct answer...
>> > >
>> > > Nope, AF_XDP bypasses the stack completely, so TC won't see the pack=
et
>> > >
>> > > on egress...
>> > >
>> > > -Toke
>> >
>> > Ok, thanks for the clarification, I guess I have to wait for the XDP
>> >
>> > egress support ...
>>
>> You can also directly modify the packet that you send out through an
>> AF_XDP socket, before putting it on the outgoing queue. Is there
>> anything specific that you would want to do in an egress-attached BPF
>> program that you would not be able to do in the userspace program
>> that manages your AF_XDP socket?
>>
>> Konrad
>
> Yes, that's what I am doing right now, however ideally I want to add a
> timestamp to the packet as close as it egress the NIC; since AF_XDP
> doesn't have access to hardware timestamp, that's why I was searching
> for an alternative solution.

Cc. Jesper, as I believe timestamps is one of his initial use cases for
xdp-hints (hardware metadata).

-Toke

