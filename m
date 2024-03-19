Return-Path: <xdp-newbies+bounces-58-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978187F896
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 08:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E718F1F21A96
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Mar 2024 07:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9D7535C2;
	Tue, 19 Mar 2024 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7RHOtTn"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819101E536
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710834775; cv=none; b=KCgq5oFMng+mvkZSq+3BJIOSV0CNsM3SLi2HjIJCIq36kBb/gR3sAF2AMWkNJghMdQS4JSqMOhrBxA47nokqXs4EDq1qbv2cukyZo9YmIIw4xON56AjJ30zHfmkyrOdXHrROgx2udHqckq/bOzute4O8HwMK08Fl4JNLZIJdrBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710834775; c=relaxed/simple;
	bh=E7WQZKaJKmVj9kotUKSxuZzv3AfuOSbPBcnwNZ+Awp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A16y4fIuoZ2OW/fsUvTAZPX7h2CsvO+6+CPQ5mladZ0YPciWQdx25nsMXwAxJe6+kyPW6IpG+pmDbMpeZIw40H+KrdN0kAH3KMc61559WpDPCf8uFa4VToG7fEwHDjej8NBtUMwJMI5tGvw+BRDdcNzZP/SOGaiIPyWJX6j4jYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7RHOtTn; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-789db727eddso104887385a.1
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Mar 2024 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710834772; x=1711439572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y9dLZNyUlajb71MiwdTUqjcEk/+bt/nmUXYxZobdRA=;
        b=b7RHOtTnaDsMQ4AO9SyryPou7ZmMw5iHReYWuIWSBvZizEOiaDdecAAkNEa4MLaVb2
         xfpVrZ/EyHQyHH5RCpdYu2SreigoArCqHbKNdmODLDj6+zK+2jGRfejs/iHS9Ycs+QKW
         oXrBCWHZGDOhu5kzeM2mR5BYD+f7ck2hSAY2hVY0orkWNiwvS+elOE+qYnogAgTPT1X8
         CsBacauUr8ioN/AjVdWzzIjOTB4q0hNOFVNKybVPvCOn4UtVBhDJDrQCq83BEB/lz9iq
         1xvk5kJtOi2L6QN7QkiNgd+QfBhC2M+n2udOB4d/ZPt/yeMBGryetP3sytRaqO7pCCsI
         0mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710834772; x=1711439572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y9dLZNyUlajb71MiwdTUqjcEk/+bt/nmUXYxZobdRA=;
        b=TrZ3pSYqswRVpRnTp79+n65Izc4JTy7yH1JJ/eFuITGOLg/zCdgl+oKICKA35QClgx
         Wtl0VtZ4o1xoa3b60rXthnWLy7WnwhpfYYK/MHdpUlE9MO/EdZB+owINHhedebbANtKs
         RucFmZlEP9A17Yh5PADSwq8j4l9X/ZPvbj3BEDa52tZ33RG4XFvZD34Y3pastKS7kGlA
         0CuiY4EPFPazmWnwxVFqA5xoGOdf+a1r2pwukMRDCVT4Ew0AyveVwfjwqomIQdZutHSh
         mxKYPH0sGyS5g6dM/TjD03gc5sfwMnxrFH2RNUqCSMZlIkCLpuJeDEbSBsgtyde97G1y
         A4qg==
X-Forwarded-Encrypted: i=1; AJvYcCUFeMSjHZ/L3ubcx7nlo5x4YtSoJUlaydvhGkiQLCTJ8PlyN4ES5/bIHJsWZDeooVQ/iG4GcUBl5K6hOS+fOCaGEGXlviqLpeALeno=
X-Gm-Message-State: AOJu0YxY0kxxqDg8ndvHEx5xVfDrrKqeN5ycSbOtbFb99cnpmrEwCyE9
	gs1yAD/aFh3BQhHAhejn3B/NjfwPHQmb6JcECdvQQRFgwwubKDhLTkBcAs8lS6lrvHgSBgQDIgh
	1FsKgzq3M8qXr5M5FQC+TvJbE3CA=
X-Google-Smtp-Source: AGHT+IG3UccIEbxbZ3MKjv0xFdbHw3/XpMspipyoQ+ElOQUGOFjjl3wMBtO/2x/yQkBpnwnfJ/Udn3ZUHaG7L7CuSD0=
X-Received: by 2002:a05:6214:2c0a:b0:691:ca1:ce8a with SMTP id
 qq10-20020a0562142c0a00b006910ca1ce8amr12971202qvb.6.1710834772264; Tue, 19
 Mar 2024 00:52:52 -0700 (PDT)
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
In-Reply-To: <CAD0p+fUp9SGOwCNMB676inLTOAETdo2vki02dx7=gc_MmCKATA@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 19 Mar 2024 08:52:41 +0100
Message-ID: <CAJ8uoz25bTNDXsDDd1J5zKcoTAtEpAf35WTkFBZi6hyMJvRsRA@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Christian Deacon <christian.m.deacon@gmail.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Mar 2024 at 19:41, Christian Deacon
<christian.m.deacon@gmail.com> wrote:
>
> Resending the following email to the XDP Newbies mailing list since it
> was rejected due to HTML contents (I've switched email clients and
> forgot to disable HTML, I apologize).
>
> Hey everyone,
>
> I was wondering if there was an update to this. I'm currently running
> into the same issue with a similar setup.
>
> When running the XDP program on a bonding device via native mode,
> packets redirected to the AF_XDP sockets with `bpf_redirect_map()`
> inside the XDP program do not make it to the AF_XDP sockets. Switching
> between zero copy and copy mode does not make a difference along with
> setting the need wakeup flag.
>
> I've tried the latest mainline kernel `6.8.1-060801`, but that did not
> make a difference. If the XDP program is attached with SKB mode,
> packets do show up on the AF_XDP sockets as mentioned in this thread
> already.
>
> While I haven't confirmed it on my side, I'm assuming the
> `xsk_rcv_check()` function is the issue here. I'm unsure if skipping
> this check for the time being would work for my needs, but I'm hoping
> a better solution will be implemented to the mainline kernel.
>
> I also saw there was another similar issue on this mailing list with
> the title "Switching packets between queues in XDP program". However,
> judging from the last reply in that thread, the fix implemented
> wouldn't help with the bonding driver.
>
> Any help is appreciated and thank you for your time!

You are correct in that the fix above does not address the bonding
case and that the problem is indeed that XDP reports the device as the
real NIC and that the AF_XDP socket is bound to the bonding device.
Therefore xdp->dev !=3D xsk->dev (in principle, not the actual code) and
all packets will be discarded. I got as far as sketching on a solution
but I do not have the bandwidth at the moment to implement it.
Unfortunately it is not a one-liner or even just one hundred lines of
code. Let me know what you think, or if someone can come up with an
easier solution.

*** Suggestion on how to implement AF_XDP for the bond device

Two steps: XDP_DRV mode then zero-copy mode

* XDP_DRV:

For XDP_DRV mode, the problem to overcome is this piece of code
in xsk_rcv_check():

        struct net_device *dev =3D xdp->rxq->dev;
        u32 qid =3D xdp->rxq->queue_index;

        if (!dev->_rx[qid].pool || xs->umem !=3D dev->_rx[qid].pool->umem)
                return -EINVAL;

xs is the socket that was bound to the bonding device e.g., bond0. So
xs->dev points to bond0. xdp->rxq->dev, on the other hand, comes from
XDP and the real driver e.g. eth0, thus xs->dev !=3D xdp->rxq->dev. The
problem here is that only _rx[] of bond0 is populated with the pool
pointer at bind time, so dev->_rx[qid].pool is NULL as it refers to
the _rx of eth0 that was never set. The solution here is then to make
sure that the _rx[] of bond0 is propagated to eth0 (and any other device
bonded to bond0).

Two new features are needed to support this:

1) A helper that copies _rx[].pool from one struct to another
2) A new xsk_bind netdev event that a driver can subscribe to. Will be call=
ed
   whenever a xsk socket is bound to a device.

In the case the socket is bound to bond0 before eth0 is bonded to
bond0, only 1) needs to be used in the bonding driver.

In the case the socket is bound to bond0 after bonding of eth0 to
bond0, the bonding driver need to subscribe to 2) and in the event
handle call 1).

* ZERO-COPY

1) Relay through the XDP_SETUP_XSK_POOL command in NDO_BPF to the
   bonded devices.

2) Relay through the ndo_xsk_wakeup to the bonded devices.

Standby mode seems straight-forward to support.

How to deal with round-robin mode in the bonding driver? Not possible
to have multiple bonded devices access the same ring. Would require
multiple rings and copying to them. Also not clear how to propagate
the need_wakeup flags of the individual network devices to the one of
the bond device. I think this kind of functionality is much better
performed in user-space with a lib. Simpler and faster.

>
> On Mon, Mar 18, 2024 at 2:33=E2=80=AFPM Christian Deacon
> <christian.m.deacon@gmail.com> wrote:
> >
> > Hey everyone,
> >
> > I was wondering if there was an update to this. I'm currently running i=
nto the same issue with a similar setup.
> >
> > When running the XDP program on a bonding device via native mode, packe=
ts redirected to the AF_XDP sockets with `bpf_redirect_map()` inside the XD=
P program do not make it to the AF_XDP sockets. Switching between zero copy=
 and copy mode does not make a difference along with setting the need wakeu=
p flag.
> >
> > I've tried the latest mainline kernel `6.8.1-060801`, but that did not =
make a difference. If the XDP program is attached with SKB mode, packets do=
 show up on the AF_XDP sockets as mentioned in this thread already.
> >
> > While I haven't confirmed it on my side, I'm assuming the `xsk_rcv_chec=
k()` function is the issue here. I'm unsure if skipping this check for the =
time being would work for my needs, but I'm hoping a better solution will b=
e implemented to the mainline kernel.
> >
> > I also saw there was another similar issue on this mailing list with th=
e title "Switching packets between queues in XDP program". However, judging=
 from the last reply in that thread, the fix implemented wouldn't help with=
 the bonding driver.
> >
> > Any help is appreciated and thank you for your time!
> >
> > On Fri, Jan 19, 2024 at 8:04=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgense=
n <toke@redhat.com> wrote:
> >>
> >> Prashant Batra <prbatra.mail@gmail.com> writes:
> >>
> >> > Just to get your expert opinion on this, I am sharing at a very high
> >> > level what my objectives are-
> >> > For Rx handling:
> >> > Demultiplex the packets received on the physical/bond interface base=
d
> >> > on the packet's src + dst combination and direct it to the process
> >> > (Pn) handling that src + dst packets.
> >> >     a) One way of doing this is to pick all packets in userspace in =
a
> >> > central process (Pc) using AF_XDP socket (ZC with phy device and
> >> > XDP_DRV with bond) and then Pc passes it using shared memory to the
> >> > correct process (Pn) for further handling.
> >> > ens1f0/bond (AF_XDP) -> Pc -> Pn
> >> >     b) The other way is to run a xdp code attached to the phy/bond
> >> > device which based on the src + dst redirects the packets to the vet=
h
> >> > pair (one per process Pn). The packet is then forwarded to the other
> >> > end of the veth-pair over which there is an AF_XDP socket opened.The
> >> > advantage here is that the packet demultiplex happens in the kernel
> >> > and there is no Pc process needed.
> >> > ens1f0/bond (XDP_REDIRECT_IF) ->vethext -> vethint ( AF_XDP) -> Pn
> >>
> >> Adding in Jesper, Lorenzo and Maryam, as we've had various discussions
> >> around improving AF_XDP support in containers, which seems to have som=
e
> >> overlap with your use case. Basically, what we have been discussing is
> >> that your (b) approach has many desirable properties, also from a
> >> container management PoV, and we believe it is possible to make it
> >> perform reasonably well on both RX and TX.
> >>
> >> It's most likely never going to be completely zero-copy because of the
> >> veth traversal, but we should be able to get it down to a single copy =
at
> >> least.
> >>
> >> However, there is some work to be done before we can realise this
> >> potential; but having more people interested in the use case may help
> >> here :)
> >>
> >> > Regarding netkit, I don't see much documentation or samples availabl=
e
> >> > except the selftest available in the kernel code. If you have or kno=
w
> >> > of some samples that might fit in the above requirements that will
> >> > surely help. Does it fit in the above requirement?
> >>
> >> Netkit does not support XDP at all, and I doubt it ever will. Rather, =
it
> >> is meant for optimising the use of BPF in the kernel stack (skb) path,
> >> so it doesn't sound like it's a good fit for your use case if you want
> >> to go directly from XDP to userspace.
> >>
> >> -Toke
> >>
> >>
>

