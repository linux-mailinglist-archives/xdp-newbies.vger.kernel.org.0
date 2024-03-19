Return-Path: <xdp-newbies+bounces-60-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09C87FD8E
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 13:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B697B21467
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 12:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02B47FBB2;
	Tue, 19 Mar 2024 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZfqfsob"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71D7FBBA
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710851410; cv=none; b=eTFSSnkzT8gwLv8CzCFYclfbYyPEComjO+cvO+5PYzmQg2yli2XeY9mlAPrUrPf4Tec9EczmOjmBEKuM0V2s+7+UKQmUPDkxWPXDa+l0xZ8cQGJ1+eZ/g9jcbIxpAHdSvgNukYcukqoyk/Mdv6EXhsfj4/3mTNo13HEzO/CKd6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710851410; c=relaxed/simple;
	bh=lPvIfO3QT4F7zW6MYXKqdYevJZT2sG3xblOzR9Cc4iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfsnz4N3R9H4+sRSzOR770cAD1UFvg3n3p18WAel2OfM8cr0eSAJJn6LvHG/i8eYQmP8/9Sa6+4vU1QONY5dU0iPh39XPn4VVkzcIL1/bZ5JtvN0BajkJ40qYCU4BzzmxpIqngQYYqUoh3LVW26hD19WqN0892athuE8PYbPu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZfqfsob; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-691276a8ed8so12429166d6.1
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710851408; x=1711456208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n5kvxHdV8UQU3B2PM54/8we4ezeVNL8PiQ4VOWg0Uk=;
        b=hZfqfsob2kfNG747smUW7tKlUCP8fZiQr/f3N9arCNZ6EjnmfGSxzwtx8wRbrhfcFw
         mRm2mcnokROxUIXTUyMSCYa1HJUk1lNqJY1lwits0wNfPTuJd/nvr+7vzunuo11r+Hxp
         kRTDzCzzF0ZOXY/Vu4nwfBCj/6ouqH3z4UH2+hGGysXDLs2X4PJL8J7f+nIe0Zzox94+
         b443UqZ0aL7/rGvnMRJdcUo4iVCx/eO1ubvn7SoCVSwYPQk8qtL55jDxLwOFtHl3b0Yq
         mLYsfUqD5cCXX69D0GPblU2N3M6BA0VqGjMqlU2+Lp189FEYyLkXXW+DMMkrxcbeq64I
         BB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710851408; x=1711456208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0n5kvxHdV8UQU3B2PM54/8we4ezeVNL8PiQ4VOWg0Uk=;
        b=B8g7yeWR1J88Fl99kf24LK+6EnKfwjWYqOg5mceVsmLHniwYpTkCmR1xzkyr/3lwUQ
         DuKb/lVj0OZjKISwrSNMfBJ6FfJWzfJGjMM8uWBxjLFK40pwIWkULvsCr4ypvlBsgQp6
         zLc9zdK9d3ombOGzHYEzAF4OQMlX9ZK3i+BNPEqkgATnsLfNG/98P9gg6AWOl2DgLCgw
         w5/wwkeOonWZhOvbibClmpZ3bWV1WmzUhOyIK5GnZNyDrfWAqSSWB9BTqzDD6Zm/mBWI
         lM19xnApZVj8o/7PbCXRKSVVkqGUq6ocBVtOzf76OiK6wlPk5F8cBjn7ha41C97TnvxV
         hxJg==
X-Forwarded-Encrypted: i=1; AJvYcCWrUa0+4qo9g2knkc9UAcX7ztjExkVqibsmepm0P3UaiRAWjhBmzzU7hqfzE1OKkR6TFmFC8AHi/gkredRx+EwMlPxp4UV8jhhk+ks=
X-Gm-Message-State: AOJu0YywJGgK+sEmAlAv1/iGyyV3DF6Q8FqOYeKWEGgwAk35j1SmlLtX
	WM0ome3NJTneCTL2DzgcQXBQNCy9kWjYD/XdO6BVU+gn08ShxuJ93xePyeHOjJqcTZqG6DXBB7K
	yXtIEsMzJhzyxVAebcCHr8X0cHOrPqphLgzs=
X-Google-Smtp-Source: AGHT+IGjMpHcxif/pnvYbc5c/orkAgDIvQiT1TLWGWDAZcV0B8NUaVx9J9bSU9BfUEAvPS/tAjYo3UfPUp24KVW2KSU=
X-Received: by 2002:a05:6214:5708:b0:690:b65f:2607 with SMTP id
 qn8-20020a056214570800b00690b65f2607mr2330292qvb.6.1710851406286; Tue, 19 Mar
 2024 05:30:06 -0700 (PDT)
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
 <CAD0p+fUp9SGOwCNMB676inLTOAETdo2vki02dx7=gc_MmCKATA@mail.gmail.com>
 <CAJ8uoz25bTNDXsDDd1J5zKcoTAtEpAf35WTkFBZi6hyMJvRsRA@mail.gmail.com> <87a5muzb69.fsf@toke.dk>
In-Reply-To: <87a5muzb69.fsf@toke.dk>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 19 Mar 2024 13:29:55 +0100
Message-ID: <CAJ8uoz0a9w-Wtx-75YpGZfpsHDrVQ+Y-4RO_YKr+aBK=i3bSUA@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Christian Deacon <christian.m.deacon@gmail.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Mar 2024 at 12:57, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat=
.com> wrote:
>
> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
>
> > On Mon, 18 Mar 2024 at 19:41, Christian Deacon
> > <christian.m.deacon@gmail.com> wrote:
> >>
> >> Resending the following email to the XDP Newbies mailing list since it
> >> was rejected due to HTML contents (I've switched email clients and
> >> forgot to disable HTML, I apologize).
> >>
> >> Hey everyone,
> >>
> >> I was wondering if there was an update to this. I'm currently running
> >> into the same issue with a similar setup.
> >>
> >> When running the XDP program on a bonding device via native mode,
> >> packets redirected to the AF_XDP sockets with `bpf_redirect_map()`
> >> inside the XDP program do not make it to the AF_XDP sockets. Switching
> >> between zero copy and copy mode does not make a difference along with
> >> setting the need wakeup flag.
> >>
> >> I've tried the latest mainline kernel `6.8.1-060801`, but that did not
> >> make a difference. If the XDP program is attached with SKB mode,
> >> packets do show up on the AF_XDP sockets as mentioned in this thread
> >> already.
> >>
> >> While I haven't confirmed it on my side, I'm assuming the
> >> `xsk_rcv_check()` function is the issue here. I'm unsure if skipping
> >> this check for the time being would work for my needs, but I'm hoping
> >> a better solution will be implemented to the mainline kernel.
> >>
> >> I also saw there was another similar issue on this mailing list with
> >> the title "Switching packets between queues in XDP program". However,
> >> judging from the last reply in that thread, the fix implemented
> >> wouldn't help with the bonding driver.
> >>
> >> Any help is appreciated and thank you for your time!
> >
> > You are correct in that the fix above does not address the bonding
> > case and that the problem is indeed that XDP reports the device as the
> > real NIC and that the AF_XDP socket is bound to the bonding device.
> > Therefore xdp->dev !=3D xsk->dev (in principle, not the actual code) an=
d
> > all packets will be discarded. I got as far as sketching on a solution
> > but I do not have the bandwidth at the moment to implement it.
> > Unfortunately it is not a one-liner or even just one hundred lines of
> > code. Let me know what you think, or if someone can come up with an
> > easier solution.
> >
> > *** Suggestion on how to implement AF_XDP for the bond device
> >
> > Two steps: XDP_DRV mode then zero-copy mode
> >
> > * XDP_DRV:
> >
> > For XDP_DRV mode, the problem to overcome is this piece of code
> > in xsk_rcv_check():
> >
> >         struct net_device *dev =3D xdp->rxq->dev;
> >         u32 qid =3D xdp->rxq->queue_index;
> >
> >         if (!dev->_rx[qid].pool || xs->umem !=3D dev->_rx[qid].pool->um=
em)
> >                 return -EINVAL;
> >
> > xs is the socket that was bound to the bonding device e.g., bond0. So
> > xs->dev points to bond0. xdp->rxq->dev, on the other hand, comes from
> > XDP and the real driver e.g. eth0, thus xs->dev !=3D xdp->rxq->dev. The
> > problem here is that only _rx[] of bond0 is populated with the pool
> > pointer at bind time, so dev->_rx[qid].pool is NULL as it refers to
> > the _rx of eth0 that was never set. The solution here is then to make
> > sure that the _rx[] of bond0 is propagated to eth0 (and any other devic=
e
> > bonded to bond0).
> >
> > Two new features are needed to support this:
> >
> > 1) A helper that copies _rx[].pool from one struct to another
> > 2) A new xsk_bind netdev event that a driver can subscribe to. Will be =
called
> >    whenever a xsk socket is bound to a device.
> >
> > In the case the socket is bound to bond0 before eth0 is bonded to
> > bond0, only 1) needs to be used in the bonding driver.
> >
> > In the case the socket is bound to bond0 after bonding of eth0 to
> > bond0, the bonding driver need to subscribe to 2) and in the event
> > handle call 1).
> >
> > * ZERO-COPY
> >
> > 1) Relay through the XDP_SETUP_XSK_POOL command in NDO_BPF to the
> >    bonded devices.
> >
> > 2) Relay through the ndo_xsk_wakeup to the bonded devices.
> >
> > Standby mode seems straight-forward to support.
> >
> > How to deal with round-robin mode in the bonding driver? Not possible
> > to have multiple bonded devices access the same ring. Would require
> > multiple rings and copying to them. Also not clear how to propagate
> > the need_wakeup flags of the individual network devices to the one of
> > the bond device. I think this kind of functionality is much better
> > performed in user-space with a lib. Simpler and faster.
>
> I think this goes for all the things you mentioned above. There is no
> way we can make this consistent with the in-kernel bond behaviour, so
> it's going to be a pretty leaky abstraction anyway. So I don't think we
> should add all this complexity, it's better to handle this in userspace
> (and just attach to the component interfaces).

Yes, supporting this in user-space would be much simpler and more of
the bonding scenarios could also be supported. I also do not see any
of this added kernel functionality being useful for any other use
case, except bonding.

> In fact, I think supporting XDP at all on the bond interface was a
> mistake; let's not exacerbate it :/
>
> -Toke
>

