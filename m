Return-Path: <xdp-newbies+bounces-57-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09887EFE7
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 Mar 2024 19:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8771F23E97
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 Mar 2024 18:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787664779F;
	Mon, 18 Mar 2024 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkS+WNL2"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72443AC8
	for <xdp-newbies@vger.kernel.org>; Mon, 18 Mar 2024 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710787274; cv=none; b=mv+AnyYZD1LsqqBnKWO/i1kqHhvKfa1A0UnSDsNjmbofuC3FmFxrVJAnxI3SSRHINP2tdNbtQt6B2q5gGrSvTmg3cUwdFJeNn6LsfY8bTqHPhg4xdDrsSW5059oROwJayiQvufPurfw5/JB0BskvXblWtEVrvS+BFYG5xx08F0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710787274; c=relaxed/simple;
	bh=2mkR8Tev8G1M+aUc8WBFv6udQ5KlLQh0dPk2o+Rw9Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUnQ7/2dvRbtfvMaMVHxHbtHlIGiMJ8hH0zMKPateLtHZ8LemO0ET7ogECBDbrUwA9XNEdGI5qEouBNPMlQiWndxpvD56G9YlRKhmRjSMPsVzakh4nKTM+MCiqQxrFNq0Vrm85CfPiAvICQCkMI7MEcZd3Ll8qm4jDp9NWLgUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkS+WNL2; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a47a9f7755so1947564eaf.0
        for <xdp-newbies@vger.kernel.org>; Mon, 18 Mar 2024 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710787272; x=1711392072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHO8ntjccfH+tefsMjl4ENPYSj2eglgxecyuu3uQGvI=;
        b=QkS+WNL2JnaSUDSxtjJNQy82RCoJGC0b04IcFAtkx9l6/Ngm7qFE+FhhlmNzpXZvOs
         2Pq+XGpciNeamjFFPj3T2JmsqkAQFiGqmcx87j2lB4ZeSUpkaperd+kUgMIY2fTpWywg
         A5VBrqg1mf1KtOhYnvu15Ohq8mNo8f+sLdVp4D6LaNRj1TtOzogq39W4wkKI0nEHwSL9
         eE4UlYiKMYAT7UKxbSqb5SIoTv1iFokqf8vZHHbzO5OiL12h8QqSjwLoTUxAdF9Osmjl
         q3H8sUAlMxCbiALu10Ki2lSwTa6WCW/P+XKNKGRZ1KrEs01sqBXYBlwgbB2Er+LJYSmR
         ueDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710787272; x=1711392072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHO8ntjccfH+tefsMjl4ENPYSj2eglgxecyuu3uQGvI=;
        b=uWGoAYzrLSdfdT4j6NZUFy4U9c/Ta+58p8bSgdY/CbEL4zDk0U0fHeaByf/zmfEUt6
         zTiwW8gZAbxNkG6y+yB6v2YgFVitt5jaFRk3SkXXfjHZj2yJm/yVp/F/2quJyyRQV1BE
         xIsKVfhGzGIcl4Oatvq39PQ3UB8yqpm7BkbVWrX5eq8EPaGoHyCMlrJZ+cYNraueGJhN
         L/i3oABPEqU+3OcKAxA/AcEgUNyscNcQvlo9yMY3D78OkfZYzJVvwT+UlnbwB9ZeAKVM
         AeztDYSHgKClqwD90HrOJw3UH7vhjb5l+NDKd5c0YkJcmeTVARBK9SnDDz/TyvoXyU9B
         fKSQ==
X-Gm-Message-State: AOJu0Yyro7+gERfRENvDVmHdiZtRohXCEVE6mizbYadoAH1eWBNdqEN+
	BgixSLpgipcze63S6WF3zYTQRxppNABs9hOJJTzLBeSxAXIorDCBajUh6tAH3mPvfW3Pkhb/VHJ
	U4v7ynhU36cIhhwdgggDRJjApN8YXVQQAUzzvyw==
X-Google-Smtp-Source: AGHT+IHOyF8wy1FQBIOCJk4alfEkQqroWI0ko/dqHHjdc7ymEp3t+sh1O+Cu7eD8/fK7BN4vvU0PUF4RpYoWajEJWZ0=
X-Received: by 2002:a4a:5bc2:0:b0:5a1:1639:97aa with SMTP id
 g185-20020a4a5bc2000000b005a1163997aamr10797998oob.6.1710787271749; Mon, 18
 Mar 2024 11:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
 <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
 <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com>
 <CAAAYKZM35fLYfibDmq9WB5W5ht2N05prd_N2-ABY07+tWbKMcA@mail.gmail.com>
 <CAJ8uoz3aLQR65GhuO5JSVr=BAB7eJ3R06Cx5mO-bU1upyDt+Cw@mail.gmail.com>
 <CAAAYKZOwckVv+xHmXTg8QpfbRGy=ysy0NTJZb77ij-6ZPCVQMw@mail.gmail.com>
 <CAJ8uoz065BceDsz+DEGVZvKWs2AeAPaB0dKgaX8SsQ36rVN2wg@mail.gmail.com>
 <CAAAYKZPbvTwEzTH0_gPg_jsgUKz8EhDK_whd1AvA0nBRyAgGcg@mail.gmail.com>
 <CAJ8uoz0kBtkQYe0SL_zbAg_7Eo+zZTomshgPcEyJYFvY2S1cvg@mail.gmail.com>
 <CAAAYKZMh9_kifHgcVDZ9-2Ofg=aA_GR7B9bz=D+71qYEviviYQ@mail.gmail.com>
 <CAJ8uoz2JvwUp54mUAKdvHtP8FsxZ2Zw0e8FxwNFMPRwQ8P=oxQ@mail.gmail.com>
 <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com>
 <CAJ8uoz2S5qkbD6odkV=Y8EHijsn5jyU01-6a8pv19eFE3=o1uA@mail.gmail.com>
 <CAAAYKZPeCFbyTadsVJEUUv=HTHN8pnMOwF_i3NfCv-py1FtYDg@mail.gmail.com>
 <87zfx14gqg.fsf@toke.dk> <CAD0p+fUM5DcG44cxYXU3fMd9PgTjhTaMCH_oy=4iejJ41zxHpA@mail.gmail.com>
In-Reply-To: <CAD0p+fUM5DcG44cxYXU3fMd9PgTjhTaMCH_oy=4iejJ41zxHpA@mail.gmail.com>
From: Christian Deacon <christian.m.deacon@gmail.com>
Date: Mon, 18 Mar 2024 14:41:00 -0400
Message-ID: <CAD0p+fUp9SGOwCNMB676inLTOAETdo2vki02dx7=gc_MmCKATA@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending the following email to the XDP Newbies mailing list since it
was rejected due to HTML contents (I've switched email clients and
forgot to disable HTML, I apologize).

Hey everyone,

I was wondering if there was an update to this. I'm currently running
into the same issue with a similar setup.

When running the XDP program on a bonding device via native mode,
packets redirected to the AF_XDP sockets with `bpf_redirect_map()`
inside the XDP program do not make it to the AF_XDP sockets. Switching
between zero copy and copy mode does not make a difference along with
setting the need wakeup flag.

I've tried the latest mainline kernel `6.8.1-060801`, but that did not
make a difference. If the XDP program is attached with SKB mode,
packets do show up on the AF_XDP sockets as mentioned in this thread
already.

While I haven't confirmed it on my side, I'm assuming the
`xsk_rcv_check()` function is the issue here. I'm unsure if skipping
this check for the time being would work for my needs, but I'm hoping
a better solution will be implemented to the mainline kernel.

I also saw there was another similar issue on this mailing list with
the title "Switching packets between queues in XDP program". However,
judging from the last reply in that thread, the fix implemented
wouldn't help with the bonding driver.

Any help is appreciated and thank you for your time!


On Mon, Mar 18, 2024 at 2:33=E2=80=AFPM Christian Deacon
<christian.m.deacon@gmail.com> wrote:
>
> Hey everyone,
>
> I was wondering if there was an update to this. I'm currently running int=
o the same issue with a similar setup.
>
> When running the XDP program on a bonding device via native mode, packets=
 redirected to the AF_XDP sockets with `bpf_redirect_map()` inside the XDP =
program do not make it to the AF_XDP sockets. Switching between zero copy a=
nd copy mode does not make a difference along with setting the need wakeup =
flag.
>
> I've tried the latest mainline kernel `6.8.1-060801`, but that did not ma=
ke a difference. If the XDP program is attached with SKB mode, packets do s=
how up on the AF_XDP sockets as mentioned in this thread already.
>
> While I haven't confirmed it on my side, I'm assuming the `xsk_rcv_check(=
)` function is the issue here. I'm unsure if skipping this check for the ti=
me being would work for my needs, but I'm hoping a better solution will be =
implemented to the mainline kernel.
>
> I also saw there was another similar issue on this mailing list with the =
title "Switching packets between queues in XDP program". However, judging f=
rom the last reply in that thread, the fix implemented wouldn't help with t=
he bonding driver.
>
> Any help is appreciated and thank you for your time!
>
> On Fri, Jan 19, 2024 at 8:04=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com> wrote:
>>
>> Prashant Batra <prbatra.mail@gmail.com> writes:
>>
>> > Just to get your expert opinion on this, I am sharing at a very high
>> > level what my objectives are-
>> > For Rx handling:
>> > Demultiplex the packets received on the physical/bond interface based
>> > on the packet's src + dst combination and direct it to the process
>> > (Pn) handling that src + dst packets.
>> >     a) One way of doing this is to pick all packets in userspace in a
>> > central process (Pc) using AF_XDP socket (ZC with phy device and
>> > XDP_DRV with bond) and then Pc passes it using shared memory to the
>> > correct process (Pn) for further handling.
>> > ens1f0/bond (AF_XDP) -> Pc -> Pn
>> >     b) The other way is to run a xdp code attached to the phy/bond
>> > device which based on the src + dst redirects the packets to the veth
>> > pair (one per process Pn). The packet is then forwarded to the other
>> > end of the veth-pair over which there is an AF_XDP socket opened.The
>> > advantage here is that the packet demultiplex happens in the kernel
>> > and there is no Pc process needed.
>> > ens1f0/bond (XDP_REDIRECT_IF) ->vethext -> vethint ( AF_XDP) -> Pn
>>
>> Adding in Jesper, Lorenzo and Maryam, as we've had various discussions
>> around improving AF_XDP support in containers, which seems to have some
>> overlap with your use case. Basically, what we have been discussing is
>> that your (b) approach has many desirable properties, also from a
>> container management PoV, and we believe it is possible to make it
>> perform reasonably well on both RX and TX.
>>
>> It's most likely never going to be completely zero-copy because of the
>> veth traversal, but we should be able to get it down to a single copy at
>> least.
>>
>> However, there is some work to be done before we can realise this
>> potential; but having more people interested in the use case may help
>> here :)
>>
>> > Regarding netkit, I don't see much documentation or samples available
>> > except the selftest available in the kernel code. If you have or know
>> > of some samples that might fit in the above requirements that will
>> > surely help. Does it fit in the above requirement?
>>
>> Netkit does not support XDP at all, and I doubt it ever will. Rather, it
>> is meant for optimising the use of BPF in the kernel stack (skb) path,
>> so it doesn't sound like it's a good fit for your use case if you want
>> to go directly from XDP to userspace.
>>
>> -Toke
>>
>>

