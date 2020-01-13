Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B1113971E
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Jan 2020 18:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgAMRJl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Jan 2020 12:09:41 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33964 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728760AbgAMRJl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Jan 2020 12:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578935380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3Q7t2HuTrXU0FGUToA5LJXXF6pXto99vbV57EGwKgo=;
        b=EAQLzGjX0d5uSP9aRt0eQAoNJAxVEBXlMdgQsL9TTBfLnsHKuRTjT/VdklPpu4glw4ZsOf
        0/q/r1E/xCNV52Ms78RHZLBAYximKxVlT2WmtOjxLm0RJK50U8XQPNy/HvoHymEqI3NViB
        HaAXdAmdDkGBUltKzsweYrbCCKN08A8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-FrKu4-NpNeCbwwzX60nCVw-1; Mon, 13 Jan 2020 12:09:38 -0500
X-MC-Unique: FrKu4-NpNeCbwwzX60nCVw-1
Received: by mail-lf1-f71.google.com with SMTP id x79so2094695lff.19
        for <xdp-newbies@vger.kernel.org>; Mon, 13 Jan 2020 09:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=e3Q7t2HuTrXU0FGUToA5LJXXF6pXto99vbV57EGwKgo=;
        b=WDTd/J/Rpu59aWOU1HL4C+HWkJPe+cEWuTnTdxpVDmlfS4E709/gJZu3fq9+O8YJ6I
         teVz5zk4IpkEQViWm2gNLmRAhYxZvdmg4LFO1OGCB2Zf+Z9c2XGcgrx9C0ZBEpcmWfiM
         KLCz9PpZVlRMxF85FU32pusZF2HM1m/5bhOEoCCH+yD75yGodGjuIZ3wjORX6SBtVXj5
         dNInkCc3M9FQMcAurdoZ9jxRSHdN/bjjSLOPyLsAWm3cXCBnR9wVqRut2SaeSbROx7HU
         eeqI1G0U7T4/S8yCSIrN3pGc6tCd8FTASOGWCevQhY1ETBIXjRAU0E3X69Jj7wInMtFg
         RtRg==
X-Gm-Message-State: APjAAAW5xFbuhSJVvgAXpWWXCyuTzE66wdkdT4pRDPWaYZsdd2vz1MFR
        sZzmZHzkYAC8esH5m8cmcpuxTp7ZeFO0ynFpZxqY8Vl0eFjinTNfMtYtaQ7P5ew4MRMkdHVYzmp
        Eiwwkk2c6y67gT4nTT7wruQ8=
X-Received: by 2002:a2e:854b:: with SMTP id u11mr11679191ljj.90.1578935377267;
        Mon, 13 Jan 2020 09:09:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYdbhqG9R72EEEnO+8x5GRuPpIDqkNON5K3Y+eeP7Skr+N3+76k1eUzVsK47gP83BGFf81oA==
X-Received: by 2002:a2e:854b:: with SMTP id u11mr11679179ljj.90.1578935377080;
        Mon, 13 Jan 2020 09:09:37 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id j204sm5958538lfj.38.2020.01.13.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 09:09:35 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0885D1804D6; Mon, 13 Jan 2020 18:09:35 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
In-Reply-To: <20200113152530.GC68570@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com> <87k15vwsax.fsf@toke.dk> <20200113152530.GC68570@smtp.ads.isi.edu>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 13 Jan 2020 18:09:34 +0100
Message-ID: <877e1vwaep.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Ryan Goodfellow <rgoodfel@isi.edu> writes:

> On Mon, Jan 13, 2020 at 11:43:02AM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>>> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
>>>> On Mon, Jan 13, 2020 at 1:28 AM Ryan Goodfellow <rgoodfel@isi.edu> wro=
te:
>>>>  The reason for wanting large memory maps is that our use case for XDP=
 is network
>>>>  emulation - and sometimes that means introducing delay factors that c=
an require
>>>>  a rather large in-memory packet buffers.
>>>>=20
>>>>  If there is interest in including this program in the official BPF sa=
mples I'm happy to
>>>>  submit a patch. Any comments on the program are also much appreciated.
>>>=20
>>>  More examples are always useful, but the question is if it should
>>>  reside in samples or outside the kernel in some other repo? Is there
>>>  some good place in xdp-project github that could be used for this
>>>  purpose?
>>
>> We could certainly create something; either a new xdp-samples
>> repository, or an example-programs/ subdir of the xdp-tutorial? Which of
>> those makes the most sense depends on the size of the program I think...
>>=20
>> -Toke
>>=20
>
> I'm happy to provide patches or pull-requests in either case. The userspa=
ce
> program is 1 file with 555 lines and the BPF program is 28 lines. I've=20
> tested the userspace program with the 5.5 kernel. The BPF program require=
s=20
> clang-9 to work properly (due to BTF features IIRC).
>
> - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-moa/=
samples/bpf/xdpsock_multidev.c
> - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-moa/=
samples/bpf/xdpsock_multidev_kern.c
>
> The primary usefulness of this program relative to what's out there is
> that it pushes packets between interfaces using a common memory map.

Hmm, yeah, this could live in either samples or as standalone. IDK,
Magnus what do you think?

-Toke

