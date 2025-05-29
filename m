Return-Path: <xdp-newbies+bounces-181-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98157AC83B9
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 May 2025 23:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42F184E623A
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 May 2025 21:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4062920AF;
	Thu, 29 May 2025 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1NQtjZU"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C93249E5
	for <xdp-newbies@vger.kernel.org>; Thu, 29 May 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748555486; cv=none; b=O8fVsmCJCtIBG2HO4Bwmr5wN5XEejOQrEIz7xfiTRZLRN2vLfnJVFFGhIQttXkJD/lVRtZub+uHbJYQQP5Z44JnnfLrqHzyCtNpaiMNDcAcgXctzJ5SEgBxgDPrgz7LmXjfMCeDOtTTtoAoQ0+AQB2ym2gDL92c43USHZwnUuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748555486; c=relaxed/simple;
	bh=grB8DB+hhCOSZX16xZ1/kKlP/z/NmpmZNp905PYc8Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAYvcBjtS6ej2ddpCm3ZK2JSqZLjFzazNa9rE7oGErbXgPVqEtdNk6iWobtWcEz03fAA1xAPqav8oLxf4N0TJv55IhshRLtCZBxAQ8ZiiMd17Z10s5LX2pM4bIlnVY888NgJAPco1Y2Hs/vfnkxixMXFlAYEq5yy5fCf0rUNcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1NQtjZU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10594812so1701097e87.1
        for <xdp-newbies@vger.kernel.org>; Thu, 29 May 2025 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748555483; x=1749160283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpWpJdGhKRPwgJbDKm0K0eUvgQ/NA4L84iazOqr4o/4=;
        b=X1NQtjZUI48YPAZZcEaN/xj8J3Va9qRKydp/u9D+MLB4cLSwtF8Ks9IMnMY9BEjaC8
         IBsr5LmraUGjc96cufPIxAJ9glmTbyZwnasVV9LtGLAq/+WqXXUV9EhSfTUrNgas6jCT
         lt/utx3JTgb1I1LqOJnYGrhJtWGoOhwPUQGjjdOGvx+BAgutL6UYYOJrUpy4O+JOil1I
         WCI4o8KkPuGlh9y5E0y0ghY5MD34KSvUFo3sgEd2sX3fPhFwkniuUsbbA+3jdOrGEU+j
         aoBBmA5DjCVvpT4xNOocE7HC8pYeBIEbjtsTcm+dBN9Elb8+rlPpFujT6WE7mY0p1ceg
         23Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555483; x=1749160283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpWpJdGhKRPwgJbDKm0K0eUvgQ/NA4L84iazOqr4o/4=;
        b=AsTzJeU+t+kxOl1O75r6KyAxSD60ipBbQ8jLdDeA+HsWsrjRD3VPWdSuvuGRZDeLtN
         EJ2THXE5WlrLD/sVdDs9KzQGeXS1gaqNaWbo+51crJAEM02FhiI/MBGlPap6VP9y62YT
         oQZoivKc/DWgTN2OZBh80bVyDBsF8SMJ2yk/Ggvt0yARfLxCtIJZjgLYNjrI+ObrBtoH
         LLEO2n5BOwBdTrhHbw3gqyA0LguQR7HFv84/gA5tjrxXZhqvF0CBoqRydL06RipmTeBm
         ZYsIDwlmnS9iRyD08HZaBlICXNY5J6b+uAXoABjhEotKdBESK+lvXMPCsPHvrZEJx+vO
         9OZw==
X-Gm-Message-State: AOJu0YziGUY7qdhwiVAAuw0DkmgO97clyqccFKH7WQ4nYZrV798WxU8A
	g1utqBByso+cyhYYNq/HmCBvjV9Dqu+95pFrRX/N7TSY4dthImuFy+O4CYfYNg==
X-Gm-Gg: ASbGncshzk7U1y8b87f+eK/bRo36HO4wDtm63tjTJdxA1n0VEiSQlKAYFYxQVnfCTH4
	VB3QnvF0sGr4BmAG9uP60cLBy71MpMERGO5/+dboDalG69yQ3z5OycMzRUHnq46iTz9AS+ymIjw
	LS030cLloUmOWxynhKhhWx9AUODUsPBtQowd/OU731msrC2rWL6D94y/H5Sig/WnHHG1dm+os50
	wQNt6LGtKlexW8tksTZPJyG7/MAtqOn5DN3Nz87GKDYvwwLHXJo5m5xeHBDyxOJDgK87C5mTigD
	7bc7iDTZhMUuz33JKcbwAcFDCg1NQw/XIu8e8NzaXTD6L2/8pWA/vgxptxGXBhuiZzK9E814Baf
	lyeG5iU2SxDM=
X-Google-Smtp-Source: AGHT+IGfDY9Pe9ESse44EsTauQKLGq63MZmHbVH/fJQRCaQeQ9P68hURiyYb7ZCb3MJl13B9Vv2r4g==
X-Received: by 2002:a05:6512:15a2:b0:553:2f4c:2791 with SMTP id 2adb3069b0e04-5533b92bf69mr338460e87.46.1748555482286;
        Thu, 29 May 2025 14:51:22 -0700 (PDT)
Received: from nuclight.lan (109-252-62-217.nat.spd-mgts.ru. [109.252.62.217])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f4fsm465567e87.140.2025.05.29.14.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:51:22 -0700 (PDT)
Date: Fri, 30 May 2025 00:51:18 +0300
From: Vadim Goncharov <vadimnuclight@gmail.com>
To: Edvard Fagerholm <edvard.fagerholm@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Subject: Re: Expiring flows in an XDP based router
Message-ID: <20250530005118.4eac76a7@nuclight.lan>
In-Reply-To: <CAMF0iZ5uBPTJDzYp=ErtFrGgZY13kUAFibaaNYkgJssD=RFPcQ@mail.gmail.com>
References: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
	<87ecwlki1z.fsf@toke.dk>
	<CAMF0iZ5uBPTJDzYp=ErtFrGgZY13kUAFibaaNYkgJssD=RFPcQ@mail.gmail.com>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; amd64-portbld-freebsd13.4)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 18 May 2025 20:11:13 +0300
Edvard Fagerholm <edvard.fagerholm@gmail.com> wrote:

> On Sun, May 18, 2025 at 7:19=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com>
> wrote:
> >
> > Edvard Fagerholm <edvard.fagerholm@gmail.com> writes:
> > =20
> > > Hi,
> > >
> > > I'm working on an in-house router and I'm looking for some advice on
> > > whether to try to implement some functionality directly in an XDP
> > > program or instead use AF_XDP sockets with the additional flexibility
> > > provided by userspace.
> > >
> > > We basically have a flow table, which contains entries of the form:
> > >
> > >   (source ip, source port) -> (action, timestamp)
> > >
> > > Every time we see a packet belonging to a flow, the timestamp is
> > > updated and if the flow has been inactive for e.g. 10 seconds, the
> > > flow is considered inactive and should be deleted. Actions are of the
> > > form:
> > >
> > >   "forward packet to a.b.c.d port X using source port Y"
> > >
> > > The challenge that I have is how to clean up expired flows. Built-in
> > > options would be BPF_MAP_TYPE_LRU_PERCPU_HASH. However, dropping an
> > > active flow would be unacceptable.
> > >
> > > I'm looking at at most 10k new flow entries being added per second per
> > > router with a maximum number of concurrent flows at around 256k. Each
> > > flow sends a packet at least every 5 seconds, but most every 50ms.
> > > Does this allow me to tune the table size in such a way that no active
> > > flows can be evicted? If not, are there any other reasonable
> > > approaches for cleaning up the flows? =20
> >
> > Well, hard to tell with only the number of additions. I mean, 256.000 +
> > 10.000 * 10 seconds means you'd need on the order of 356k entries in the
> > map, assuming flows expire at the same rate as they are added. Do you
> > assume any such guarantee? =20
>=20
> We have average session lengths over 30 seconds and a maximum of 256k
> concurrents the way the servers are set up. The first number is a
> conservative lower
> bound and the latter a conservative upper bound, so from there you get 10k
> per second as a conservative upper bound too. We see spikes sometimes dur=
ing
> updates with polling clients, but they stay below this too.
>=20
> I read the description of the LRU implementation in the Cilium docs. For =
an
> element to be expired, it would need to be put at the head of the active =
list
> and propagate all the way down towards the tail until being moved over to
> the head of the inactive list. Then propagate down the inactive list
> and be cleaned
> up.
>=20
> If one could prove that being propagated in the lists to being cleaned
> up takes longer
> than the maximum interval every flow sees packets, then that's good enoug=
h.
> Alternatively, if the table is always larger than the maximum number of
> flows by some constant factor and one can prove some invariant that the
> kernel always recycles enough "real" inactive flows before accidentally
> recycling an active flow,
> then that would also be enough.
>=20
> However, I don't think I'm quite comfortable with such an approach,
> since it relies
> on implementation details of the data structure that are not part of
> the promised API.
>=20
> On the other hand, given the number of routers and load balancers using X=
DP,
> I was kinda hoping there was some well-known robust solution that is also
> performant.

You can see https://lore.kernel.org/bpf/20241010224708.67f18726@nuclight.la=
n/T/
and https://lore.kernel.org/xdp-newbies/871q07ggv0.fsf@toke.dk/T/#e98aa7356=
d5e94ce91a4cb4454fc4710163e1c50a
mail threads, and the other which link I've forgotten, but the essential
quote is:

 Alexei Starovoitov May 26, 2021, 4:58 p.m. UTC | #25

It's an explicit non-goal for timer api to be used as GC for conntrack.
You'll be able to use it as such, but when it fails to scale
(as it's going to happen with any timer implementation) don't blame
infrastructure for that.

> The box in question is basically doing DDoS protection, so it needs to

Yes, this is quite typical, I've had same problem. Basically, all these
routers/balancers/DDoS-protectors/etc just give up when something is undoab=
le
in eBPF (one product I've worked on passed some packets to AF_XDP).

XDP/eBPF is still not mature technology for such tasks.

> be able to
> handle traffic at line rate. I'm also trying to avoid doing any
> expensive processing
> that takes a long time, which could cause NIC buffers to fill up and
> cause packet
> loss. Our current header based solution spends a constant amount of time =
per
> packet and is stateless.
>=20
> > Alternatively, you could have your XDP program start a BPF timer and
> > perform the periodic cleanup from that. There will be some overhead from
> > walking the map, and a potential for racy behaviour if the same flow is
> > expired and re-added frequently, but otherwise this should be quite
> > doable. =20
>=20
> I would need to look into timers. Never had to deal with these before in =
XDP.

You will need to put a timer into each record, spending about 128 bytes for
each... Alternative solutions like an "index" map which could could be
iterated by a single timer - miss needed methods (e.g. map_for_each in LPM)=
 in
stock kernel.

> > In any case, you'd need to size your map so that it doesn't fill up
> > before flows expire. So whether to use an LRU map is a case of whether
> > overflowing the map will result in overwriting existing entries, or
> > blocking the addition of new ones. =20
>=20
> We basically need both:
>=20
> 1. Table should be large enough to never block connections.
> 2. The error of the approximate LRU algorithm needs to be precise
> enough to never recycle active flows.


--=20
WBR, @nuclight

