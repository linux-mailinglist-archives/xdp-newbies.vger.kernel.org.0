Return-Path: <xdp-newbies+bounces-32-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE39830001
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jan 2024 07:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ACD1287A71
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jan 2024 06:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6898BF6;
	Wed, 17 Jan 2024 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfz1qWQC"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817078BEB
	for <xdp-newbies@vger.kernel.org>; Wed, 17 Jan 2024 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705471666; cv=none; b=X4QHPAs49nx/Ah/LhOVbrHVlxGObGXSaJIAMKFHhCX5fngBgK86AQI6Ayl6DvWDoYrdTFbUZ+e3hb0Xpnl0ngb0tdW6oq5yvw/DVbf2pV89R1nYC0sYVx7jHO1O8Ih8r3QMovh+I7Al89kAE67A0RYr/A2YqqHFL/n0jqoyJT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705471666; c=relaxed/simple;
	bh=h06X12HhIrHqnlcjHgQkwzRwACBIyWZqwvhml78MkPY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=I6Xm7FdpYYoBh6ZO6ybq9SCpQZtTh7l7URfq4x+BveAT9kFOagHvm+eEngOXyj68/2IgGOPSyhsajOkbsUgGf4L9lSi86A53+EM64kL/5Tz8cAqAFyw8S3U1x00ZYyfq3sMBWTV3b3nIX8rD8Y7xvbiL6T2bzPW5AOjs7kT6pQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfz1qWQC; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7831386ee01so1115090185a.3
        for <xdp-newbies@vger.kernel.org>; Tue, 16 Jan 2024 22:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705471663; x=1706076463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czc2wIFy10XjaJVZ1hSQX3jwj/JUfyUJLZcoPJ4YD4g=;
        b=dfz1qWQCvoz2vEZiFWy1aEw278S48CTks/y/fAzaWE78Ei6iaf/vfdw/6n9g1kBpR9
         Kbe37BKfBAFzx3A+E3UH9vevwRccRye5sRHDmEluMDi06/vfmVJQZg2VxF7Qpvse9UNH
         EZqQtWGHdQlwfF/ID0tmqZSHinJJXLCSeet+ekZuxRfjrOVy9uy2FTbIx894icBkKOP6
         d6sfwBeKEE0FoJY89ey+daKvsm+FSkF4b5MKfWT24K30kJVvlONx6aTYvCWViiAa6vnu
         LJjQtk31APyPSHTGc66uBzPRzeTOACWhSsEYLUkuoVEy1hugoR/IA2OmoX9JQkwodXfZ
         vR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705471663; x=1706076463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czc2wIFy10XjaJVZ1hSQX3jwj/JUfyUJLZcoPJ4YD4g=;
        b=Mb8/Z2M4/yPaSHWFCm+Vnj23VCfmDpbH3KRLC04ISHt9X/6/SNReiPjqT24O5xnsmd
         GWuWT6FyipyleJdRio6sabtgUqxwM9jUbzBNou3PscURf1s2GXCWlhxDtcn3gCSoCBhL
         /6Qe59Rp8DxywtBCWIhHnhoqdRmGFcy3MG8ISOj9S5QeDS4SCOLH0KmU6kaZLgAPp2MR
         SShhJp5ShRzhqT741o/Rt/iXq3qVnsbIUDlM18Y8bDiZtVcJe4TJmrfCB3oOwW5fNLKk
         0yprUcD8H2jEWdgWqA6BMiSogrxbxKqExmWrp9YHTnFnslIFVuBythBA9xOs01F1CRkC
         3qYg==
X-Gm-Message-State: AOJu0YxRS4vtG3cGwb705qzdkEsBIUnXWoOtf5hju1MudhDIzpwxf+Jc
	Fe80UFNGy5bao/c3Bin5cQw2qwNf6bA6YxsGYe4=
X-Google-Smtp-Source: AGHT+IHmiTlpQbdDSHn022P4S4QjMmLzxniplrBNE3VBoBA2PQZEiUGI3fojx0EoLwXEAvQqITho111STlRMhPzAP9s=
X-Received: by 2002:a05:620a:672:b0:783:5069:e3fc with SMTP id
 a18-20020a05620a067200b007835069e3fcmr6542230qkh.54.1705471663166; Tue, 16
 Jan 2024 22:07:43 -0800 (PST)
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
 <CAAAYKZMh9_kifHgcVDZ9-2Ofg=aA_GR7B9bz=D+71qYEviviYQ@mail.gmail.com> <CAJ8uoz2JvwUp54mUAKdvHtP8FsxZ2Zw0e8FxwNFMPRwQ8P=oxQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz2JvwUp54mUAKdvHtP8FsxZ2Zw0e8FxwNFMPRwQ8P=oxQ@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Wed, 17 Jan 2024 11:37:31 +0530
Message-ID: <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 6:29=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Tue, 16 Jan 2024 at 13:48, Prashant Batra <prbatra.mail@gmail.com> wro=
te:
> >
> > On Mon, Jan 15, 2024 at 2:52=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, 11 Jan 2024 at 11:41, Prashant Batra <prbatra.mail@gmail.com>=
 wrote:
> > > >
> > > > On Tue, Jan 2, 2024 at 3:27=E2=80=AFPM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Fri, 22 Dec 2023 at 12:23, Prashant Batra <prbatra.mail@gmail.=
com> wrote:
> > > > > >
> > > > > > Yes, I found the place where the packet is getting dropped. The=
 check
> > > > > > for device match b/w xs and xdp->rxq is failing in xsk_rcv_chec=
k() .
> > > > > > The device in xs is the bond device whereas the one in xdp->rxq=
 is the
> > > > > > slave device on which the packet is received and the xdp progra=
m is
> > > > > > being invoked from.
> > > > > >
> > > > > > static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *=
xdp)
> > > > > > {
> > > > > > --
> > > > > >     if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->rx=
q->queue_index)
> > > > > >         return -EINVAL;
> > > > > > --
> > > > > > }
> > > > >
> > > > > I am now back from the holidays.
> > > > >
> > > > > Perfect! Thank you for finding the root cause. I will rope in Mac=
iej
> > > > > and we will get back to you with a solution proposal.
> > > > >
> > > > Thanks, will wait for your solution.
> > >
> > > FYI, I do not have a good solution for this yet. The one I have is to=
o
> > > complicated for my taste. I might have to take this to the list to ge=
t
> > > some new ideas on how to tackle it. So this will take longer than
> > > anticipated.
> > >
> > Just to add that the AF_XDP TX in native mode is also not performing
> > well. I am getting around 2Mpps in native mode.
>
> That is expected though. There are only two modes for Tx: SKB mode and
> zero-copy mode, and since there is no zero-copy support for the
> bonding driver, it will revert to skb mode. I would expect around 3
> Mpps for Tx in skb mode, so 2 Mpps seems reasonable as the bonding
> driver adds overhead.
>
> For Rx there are 3 modes: skb, XDP_DRV (which is the one you are
> getting with the -N switch) and zero-copy (that is not supported by
> the bonding driver).
>
Thanks for quick info. So, when you provide the fix for the bond
driver, can we expect the bond-driver to be able to support ZC in the
Tx mode (and Rx mode) or will the Tx remain in SKB mode? At 2M pps,
it's a big gap in Rx and Tx and practically leaves xdp not much useful
with bond devices.

I also see a gap in Rx vs Tx for veth drivers-
In this below topology, I see AF_XDP TX to a veth device (veth1) is
not going beyond 1.2Mpps, The xdp program on veth2 redirects packet to
phy device ens1f0. I would assume based on your explanation above,
that this too is working in SKB mode, and hence the lower performance.
veth1 (AF_XDP Tx) -> veth2 (xdp) -> ens1f0

However in the reverse direction shown below, I can receive close to
5M pps on AF_XDP socket.
ens1f0 (xdp) ->veth2 -> veth1 (AF_XDP Rx)

Looking at the results here-
https://patchwork.ozlabs.org/project/netdev/cover/1533283098-2397-1-git-sen=
d-email-makita.toshiaki@lab.ntt.co.jp/
, I don't seem to find the benchmark which would validate my AF_XDP Rx
and Tx results with veth devices. The xdp DROP test results do match
with my tests though.

> >  # ./xdpsock -t -i bond0 -N -G 0c:c4:7a:bd:13:b2 -H 0c:c4:7a:b7:5f:6c
> >  sock0@bond0:0 txonly xdp-drv
> >
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 2,520,587      2,521,152
> >
> >  sock0@bond0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 2,362,740      4,884,352
> >
> >  sock0@bond0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,814,437      6,698,944
> >
> >  sock0@bond0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,817,913      8,517,120
> >
> > # xdp-loader status bond0
> > CURRENT XDP PROGRAM STATUS:
> >
> > Interface        Prio  Program name      Mode     ID   Tag
> >   Chain actions
> > -----------------------------------------------------------------------=
---------------
> > bond0                  xdp_dispatcher    native   671  90f686eb86991928
> >  =3D>              20     xsk_def_prog              680
> > 8f9c40757cb0a6a2  XDP_PASS
> >
> > > > > > Here is the perf backtrace for the xdp_redirect_err event.
> > > > > > ksoftirqd/0    14 [000] 10956.235960: xdp:xdp_redirect_err: pro=
g_id=3D69
> > > > > > action=3DREDIRECT ifindex=3D5 to_ifindex=3D0 err=3D-22 map_id=
=3D19 map_index=3D5
> > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffffc05d0f0f ixgbe_run_xdp+0x10f
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethe=
rnet/intel/ixgbe/ixgbe.ko)
> > > > > >         ffffffffc05d297a ixgbe_clean_rx_irq+0x51a
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethe=
rnet/intel/ixgbe/ixgbe.ko)
> > > > > >         ffffffffc05d2da0 ixgbe_poll+0xf0
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethe=
rnet/intel/ixgbe/ixgbe.ko)
> > > > > >         ffffffff873afad7 __napi_poll+0x27
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff873affd3 net_rx_action+0x233
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff8762ae27 __do_softirq+0xc7
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff86b04cfe run_ksoftirqd+0x1e
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff86b33d83 smpboot_thread_fn+0xd3
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff86b2956d kthread+0xdd
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >         ffffffff86a02289 ret_from_fork+0x29
> > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > >
> > > > > > I am curious why the xdp program is invoked from the ixgbe driv=
er
> > > > > > (running for slave device) when the xdp program is actually att=
ached
> > > > > > to the bond device? Is this by design?
> > > > > > # xdp-loader status bond0
> > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > >   Chain actions
> > > > > > ---------------------------------------------------------------=
-----------------------
> > > > > > bond0                  xdp_dispatcher    native   64   90f686eb=
86991928
> > > > > >  =3D>              20     xsk_def_prog              73
> > > > > > 8f9c40757cb0a6a2  XDP_PASS
> > > > > >
> > > > > > # xdp-loader status ens1f0
> > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > >   Chain actions
> > > > > > ---------------------------------------------------------------=
-----------------------
> > > > > > ens1f0                 <No XDP program loaded!>
> > > > > >
> > > > > > # xdp-loader status ens1f1
> > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > >   Chain actions
> > > > > > ---------------------------------------------------------------=
-----------------------
> > > > > > ens1f1                 <No XDP program loaded!>
> > > > > >
> > > > > > Now, if I skip the device check in xsk_rcv_check(), I can see t=
he
> > > > > > packets being received in the AF_XDP socket in the driver mode.
> > > > > >  # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N
> > > > > >  sock0@bond0:5 rxdrop xdp-drv poll()
> > > > > >                    pps            pkts           1.00
> > > > > > rx                10,126,924     1,984,092,501
> > > > > > tx                 0              0
> > > > > >
> > > > > > I am sure we would not want to skip the device check generally
> > > > > > especially for non-bonded devices, etc. Please guide on how to =
take
> > > > > > this further and get the issue fixed in the mainline.
> > > > > >
> > > > > > The ZC mode doesn't work. Mostly because of the problem you had
> > > > > > pointed out before.
> > > > > > # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N -z
> > > > > > xdpsock.c:xsk_configure_socket:1068: errno: 22/"Invalid argumen=
t"
> > > > > >
> > > > > >
> > > > > > On Thu, Dec 21, 2023 at 7:16=E2=80=AFPM Magnus Karlsson
> > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, 21 Dec 2023 at 13:39, Prashant Batra <prbatra.mail@gm=
ail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
> > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.mai=
l@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Thanks for your response. My comments inline.
> > > > > > > > > >
> > > > > > > > > > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
> > > > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra=
.mail@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >
> > > > > > > > > > > > I am new to XDP and exploring it's working with dif=
ferent interface
> > > > > > > > > > > > types supported in linux. One of my use cases is to=
 be able to receive
> > > > > > > > > > > > packets from the bond interface.
> > > > > > > > > > > > I used xdpsock sample program specifying the bond i=
nterface as the
> > > > > > > > > > > > input interface. However the packets received on th=
e bond interface
> > > > > > > > > > > > are not handed over to the socket by the kernel if =
the socket is bound
> > > > > > > > > > > > in native mode. The packets are neither being passe=
d to the kernel.
> > > > > > > > > > > > Note that the socket creation does succeed.
> > > > > > > > > > > > In skb mode this works and I am able to receive pac=
kets in the
> > > > > > > > > > > > userspace. But in skb mode as expected the performa=
nce is not that
> > > > > > > > > > > > great.
> > > > > > > > > > > >
> > > > > > > > > > > > Is AF_XDP sockets on bond not supported in native m=
ode? Or since the
> > > > > > > > > > > > packet has be to be handed over to the bond driver =
post reception on
> > > > > > > > > > > > the phy port, a skb allocation and copy to it is in=
deed a must?
> > > > > > > > > > >
> > > > > > > > > > > I have never tried a bonding interface with AF_XDP, s=
o it might not
> > > > > > > > > > > work. Can you trace the packet to see where it is bei=
ng dropped in
> > > > > > > > > > > native mode? There are no modifications needed to an =
XDP_REDIRECT
> > > > > > > > > > > enabled driver to support AF_XDP in XDP_DRV / copy mo=
de. What NICs are
> > > > > > > > > > > you using?
> > > > > > > > > > >
> > > > > > > > > > I will trace the packet and get back.
> > > > > > > > > > The bond is over 2 physical ports part of the Intel NIC=
 card. Those are-
> > > > > > > > > > b3:00.0 Ethernet controller: Intel Corporation 82599ES =
10-Gigabit
> > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > > b3:00.1 Ethernet controller: Intel Corporation 82599ES =
10-Gigabit
> > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > >
> > > > > > > > > > Bonding algo is 802.3ad
> > > > > > > > > >
> > > > > > > > > > CPU is Intel Xeon Gold 3.40GHz
> > > > > > > > > >
> > > > > > > > > > NIC Driver
> > > > > > > > > > # ethtool -i ens1f0
> > > > > > > > > > driver: ixgbe
> > > > > > > > > > version: 5.14.0-362.13.1.el9_3
> > > > > > > > >
> > > > > > > > > Could you please try with the latest kernel 6.7? 5.14 is =
quite old and
> > > > > > > > > a lot of things have happened since then.
> > > > > > > > >
> > > > > > > > I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still see =
the same issue.
> > > > > > >
> > > > > > > OK, good to know. Have you managed to trace where the packet =
is lost?
> > > > > > >
> > > > > > > > > > Features
> > > > > > > > > > # xdp-loader features ens1f0
> > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > >
> > > > > > > > > > CPU is
> > > > > > > > > >
> > > > > > > > > > Interesting thing is that the bond0 does advertise both=
 native and ZC
> > > > > > > > > > mode. That's because the features are copied from the s=
lave device.
> > > > > > > > > > Which explains why there is no error while binding the =
socket in
> > > > > > > > > > native/zero-copy mode.
> > > > > > > > >
> > > > > > > > > It is probably the intention that if both the bonded devi=
ces support a
> > > > > > > > > feature, then the bonding device will too. I just saw tha=
t the bonding
> > > > > > > > > device did not implement xsk_wakeup which is used by zero=
-copy, so
> > > > > > > > > zero-copy is not really supported so that support should =
not be
> > > > > > > > > advertised. The code in AF_XDP tests for zero-copy suppor=
t this way:
> > > > > > > > >
> > > > > > > > > if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NETDE=
V_XDP_ACT_ZC) {
> > > > > > > > >     err =3D -EOPNOTSUPP;
> > > > > > > > >     goto err_unreg_pool;
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > So there are some things needed in the bonding driver to =
make
> > > > > > > > > zero-copy work. Might not be much though. But your proble=
m is with
> > > > > > > > > XDP_DRV and copy mode, so let us start there.
> > > > > > > > >
> > > > > > > > > > void bond_xdp_set_features(struct net_device *bond_dev)
> > > > > > > > > > {
> > > > > > > > > > ..
> > > > > > > > > >     bond_for_each_slave(bond, slave, iter)
> > > > > > > > > >         val &=3D slave->dev->xdp_features;
> > > > > > > > > >     xdp_set_features_flag(bond_dev, val);
> > > > > > > > > > }
> > > > > > > > > >
> > > > > > > > > > # ../xdp-loader/xdp-loader features bond0
> > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > >
> > > > > > > > > > > > Another thing I notice is that other XDP programs a=
ttached to bond
> > > > > > > > > > > > interface with targets like DROP, REDIRECT to other=
 interface works
> > > > > > > > > > > > and perform better than AF_XDP (skb) based. Does th=
is mean that these
> > > > > > > > > > > > are not allocating skb?
> > > > > > > > > > >
> > > > > > > > > > > I am not surprised that AF_XDP in copy is slower than=
 XDP_REDIRECT.
> > > > > > > > > > > The packet has to be copied out to user-space then co=
pied into the
> > > > > > > > > > > kernel again, something that is not needed in the XDP=
_REDIRECT case.
> > > > > > > > > > > If you were using zero-copy, on the other hand, it wo=
uld be faster
> > > > > > > > > > > with AF_XDP. But the bonding interface does not suppo=
rt zero-copy, so
> > > > > > > > > > > not an option.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Just to put forth the pps numbers with the above mentio=
ned single port
> > > > > > > > > > in different modes and a comparison to the bond interfa=
ce.
> > > > > > > > > > Test is using pktgen pumping 64 byte packets on a singl=
e flow.
> > > > > > > > > >
> > > > > > > > > > Single AF_XDP sock on a single NIC queue-
> > > > > > > > > >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   C=
ommand
> > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90
> > > > > > > > > >   ZC                            14M      65%        35%
> > > > > > > > > > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> > > > > > > > > >   XDP_DRV/COPY     10M     100%       23%              =
  ./xdpsock -r
> > > > > > > > > > -i ens1f0 -q 5 -p -n 1 -N -c
> > > > > > > > > >   SKB_MODE            2.2M     100%       62%          =
      ./xdpsock
> > > > > > > > > > -r -i ens1f0 -q 5 -p -n 1 -S
> > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > In the above tests when using ZC and XDP_DRV/COPY, is t=
his SI usage as
> > > > > > > > > > expected? Especially in ZC mode. Is it majorly because =
of the BPF
> > > > > > > > > > program running in non-HW offloaded mode? Don't have a =
NIC which can
> > > > > > > > > > run BPF in offloaded mode so I cannot compare it.
> > > > > > > > >
> > > > > > > > > I get about 25 - 30 Mpps at 100% CPU load on my system, b=
ut I have a
> > > > > > > > > 100G card and you are maxing out your 10G card at 65% and=
 14M. So yes,
> > > > > > > > > sounds reasonable. HW offload cannot be used with AF_XDP.=
 You need to
> > > > > > > > > do the redirect in the CPU for it to work. If you want to=
 know where
> > > > > > > > > time is spent use "perf top". The biggest chunk of time i=
s spent in
> > > > > > > > > the XDP_REDIRECT operation, but there are many other time=
 thiefs too.
> > > > > > > > >
> > > > > > > > > > The XDP_DROP target using xdp-bench tool (from xdp-tool=
s) on the same NIC port-
> > > > > > > > > >   xdp-bench                PPS       CPU-SI*   Command
> > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > >   drop, no-touch         14M           41%      ./xdp-b=
ench drop -p
> > > > > > > > > > no-touch ens1f0 -e
> > > > > > > > > >   drop, read-data        14M           55%      ./xdp-b=
ench drop -p
> > > > > > > > > > read-data ens1f0 -e
> > > > > > > > > >   drop, parse-ip          14M           58%      ./xdp-=
bench drop -p
> > > > > > > > > > parse-ip ens1f0 -e
> > > > > > > > > > * CPU receiving the packet
> > > > > > > > > >
> > > > > > > > > > The similar tests on bond interface (above mentioned 2 =
ports bonded)-
> > > > > > > > > >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Comm=
and
> > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90
> > > > > > > > > >   ZC                           X         X             =
 X
> > > > > > > > > >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> > > > > > > > > >   XDP_DRV/COPY    X         X              X
> > > > > > > > > > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> > > > > > > > > >   SKB_MODE            2M      100%        55%          =
    ./xdpsock
> > > > > > > > > > -r -i bond0 -q 0 -p -n 1 -S
> > > > > > > > > > * CPU receiving the packet
> > > > > > > > > >
> > > > > > > > > >   xdp-bench            PPS     CPU-SI*   Command
> > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > >   drop, no-touch     10.9M    33%         ./xdp-bench d=
rop -p no-touch
> > > > > > > > > > bond0 -e
> > > > > > > > > >   drop, read-data    10.9M    44%         ./xdp-bench d=
rop -p
> > > > > > > > > > read-data bond0 -e
> > > > > > > > > >   drop, parse-ip       10.9M   47%         ./xdp-bench =
drop -p
> > > > > > > > > > parse-ip bond0 -e
> > > > > > > > > > * CPU receiving the packet
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > > Kindly share your thoughts and advice.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > > Prashant
> > > > > > > > > > > >

