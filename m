Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7248113A28C
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2020 09:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgANILI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jan 2020 03:11:08 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26675 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgANILI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jan 2020 03:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578989467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O7Cgo6wE4DP28cfUbp35ujQylbg1ZWOSVM3Q++ft5Lg=;
        b=Xibgq2mih7lLiKlKMR8dstnz5uHXkOQx5gqPJ7uMMQ/sHXUpS5VsZ6IrpKGWDfCgnGlRFc
        JQtCpmJgcIdWsLDjGFu7lPxcMccgsg2ozPd7JvRRA7gtT2CjnheNrWv0jhxp72SNf3eiWh
        zCVTo+jvXaLKh/9YlQtA1z8YIA3tnqU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-wvBkR4NoOG2wP_07P1Cyqw-1; Tue, 14 Jan 2020 03:11:06 -0500
X-MC-Unique: wvBkR4NoOG2wP_07P1Cyqw-1
Received: by mail-lf1-f72.google.com with SMTP id v10so2613599lfa.14
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Jan 2020 00:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=O7Cgo6wE4DP28cfUbp35ujQylbg1ZWOSVM3Q++ft5Lg=;
        b=Fvr6tSvnXslQ6NFmx7sYUds0vMDeCz4+J8Ly+Aa0W6aPW/Q6osJgtQ9iiwG/OdgNmV
         sCiOYjgVhAa+UgcQ04O3HdIZt32qA1HOFQ5CoEI8Y6tF5C61U7QlWNXVbZ3BQYErHJf3
         Hx04ylbkDtKp2Zvy1pbN/Jk6j7t8DHjUVF3ih/4iHRStPzJLd4BJJ65iBRzrugUtfXXP
         e1z0rb2e5Phz/A7B2eyKKBmodcbwLlyYw/I8uZUXIP1wgjVOoNvJvXZIInKayT4thqnV
         VW/wqsiOYzaY2MBlNbUCnLTEe6pzzfoJFp6IUz2TkLzFuK0JVfy7R3TAPXmpmNZC9DY7
         0H/w==
X-Gm-Message-State: APjAAAW449DIfOAaADjSc/v1Go3A3V0dvrZHiAHANtBrMP4nvN/s+Amq
        rSt68msZfFWScU0ywclU4pDpFAlFeJV/GoQm2sic06HEDQMvl/hBZEjJY8GhQ1qngeiCR829/ND
        raPB3+JfVeHHvzEjfCeq9gxk=
X-Received: by 2002:a2e:b554:: with SMTP id a20mr12505336ljn.25.1578989464646;
        Tue, 14 Jan 2020 00:11:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxU3UUOnvpRdk/OO/009VFKZpslNw0dWF+t37Nqgvsh0m5RbKQbsxnCiSLowmhWpzrZNKjGZA==
X-Received: by 2002:a2e:b554:: with SMTP id a20mr12505322ljn.25.1578989464440;
        Tue, 14 Jan 2020 00:11:04 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id g15sm7065770ljk.8.2020.01.14.00.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 00:11:03 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D1D561804D6; Tue, 14 Jan 2020 09:11:02 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Ryan Goodfellow <rgoodfel@isi.edu>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
In-Reply-To: <CAJ8uoz2o0gQJOFjSsw3NEJ4vdyKfoLgj=vF3ZTj0v3bbA993qw@mail.gmail.com>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com> <87k15vwsax.fsf@toke.dk> <20200113152530.GC68570@smtp.ads.isi.edu> <877e1vwaep.fsf@toke.dk> <CAJ8uoz2o0gQJOFjSsw3NEJ4vdyKfoLgj=vF3ZTj0v3bbA993qw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 14 Jan 2020 09:11:02 +0100
Message-ID: <874kwywj8p.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Magnus Karlsson <magnus.karlsson@gmail.com> writes:

> On Mon, Jan 13, 2020 at 6:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> Ryan Goodfellow <rgoodfel@isi.edu> writes:
>>
>> > On Mon, Jan 13, 2020 at 11:43:02AM +0100, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
>> >>> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
>> >>>> On Mon, Jan 13, 2020 at 1:28 AM Ryan Goodfellow <rgoodfel@isi.edu> =
wrote:
>> >>>>  The reason for wanting large memory maps is that our use case for =
XDP is network
>> >>>>  emulation - and sometimes that means introducing delay factors tha=
t can require
>> >>>>  a rather large in-memory packet buffers.
>> >>>>
>> >>>>  If there is interest in including this program in the official BPF=
 samples I'm happy to
>> >>>>  submit a patch. Any comments on the program are also much apprecia=
ted.
>> >>>
>> >>>  More examples are always useful, but the question is if it should
>> >>>  reside in samples or outside the kernel in some other repo? Is there
>> >>>  some good place in xdp-project github that could be used for this
>> >>>  purpose?
>> >>
>> >> We could certainly create something; either a new xdp-samples
>> >> repository, or an example-programs/ subdir of the xdp-tutorial? Which=
 of
>> >> those makes the most sense depends on the size of the program I think=
...
>> >>
>> >> -Toke
>> >>
>> >
>> > I'm happy to provide patches or pull-requests in either case. The user=
space
>> > program is 1 file with 555 lines and the BPF program is 28 lines. I've
>> > tested the userspace program with the 5.5 kernel. The BPF program requ=
ires
>> > clang-9 to work properly (due to BTF features IIRC).
>> >
>> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-m=
oa/samples/bpf/xdpsock_multidev.c
>> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-m=
oa/samples/bpf/xdpsock_multidev_kern.c
>> >
>> > The primary usefulness of this program relative to what's out there is
>> > that it pushes packets between interfaces using a common memory map.
>>
>> Hmm, yeah, this could live in either samples or as standalone. IDK,
>> Magnus what do you think?
>
> Let us try the kernel samples first. Then and if the folks on the
> mailing list do not want more samples in there, we fall back on the
> xdp-tutorial repo.

ACK, SGTM :)

-Toke

