Return-Path: <xdp-newbies+bounces-19-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C06819A5F
	for <lists+xdp-newbies@lfdr.de>; Wed, 20 Dec 2023 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D131F22D3F
	for <lists+xdp-newbies@lfdr.de>; Wed, 20 Dec 2023 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977321CA8E;
	Wed, 20 Dec 2023 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4qpfFRo"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC21BDD6
	for <xdp-newbies@vger.kernel.org>; Wed, 20 Dec 2023 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4258ca2ee9dso13646621cf.1
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Dec 2023 00:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703060683; x=1703665483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E33GfMEPMA01OCJpwtCixT5DqMkahnFKTP66U32wD6c=;
        b=d4qpfFRo0d6HoHt+twqn9oFUEbOXKWx9OXNYwITPxJSuFY9M2FrlHThZlJ3Hh7ZJtP
         BzAfNIFUezRVOYxVE2m5vq+WTU0/T5Xyh6xRakVAAxbNWVQ5TR9v0XMn0yNEmRGWqH/2
         ICzbNZRvoaLZadttQOIH6nwD12KUT/PzIISoUNuYQI4WcBQURumUQuf65dQSriY0uKuj
         Cb2hOxWJbDHGJYnoSALlovVxBcbwMIDEpu1FtEfaZDTnU02ovVpRpWHI92pfVwy7MrML
         jOdmw6EmS0Y+hIbNOsPn68un0GcLbN37l8uY/5yAlwmNsL+iyWAJZ85MBR1svhhzUZ69
         Rv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703060683; x=1703665483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E33GfMEPMA01OCJpwtCixT5DqMkahnFKTP66U32wD6c=;
        b=N4I6FunEM2YlbDfrpYs6HVPCKs0vbzpo9rtvTL4vVFy1wV4fx+59kXmeQKealRJ41j
         pq+TbFG9E94hQB5TG90Ln6l6mZFMQze6p0egTnH/bumZJNiXf/33MZKKwjIT5m0NgpMR
         Ht4OXx8lKVx079ERdWmqz83k4t9gdrxbM7jPTuuPw8FK2lIdzzlYFdYR+8zDzadNl2xZ
         p2TOrgWRrrRGGXV3gS1udK8BCDH70Bm7PC4ZUxs1w/IdZSQ1NH0gyNPWMRzvYdcuXybx
         OdNtuGpIQMmbcDTpBa7fvDbw4uWmGYtuZAW7H8Lci6uoUdRZam00B6qKVQegq47bo/vG
         ymMg==
X-Gm-Message-State: AOJu0YzitDpeK6qtHOPw/v8M2232wCUvuk0VsYDhYgTbOCGyG1qvBdEm
	ONxNUdLLvFPgGT4+k9CiqkloM8bdMG0jctBEo4eHg6Nf2oJExQ==
X-Google-Smtp-Source: AGHT+IHauFUQNYGN2DPXyqO/ekFm01E2stmHUfwc3slasNP5szeF/i7iVyALA/BJH8fBQs1+4HjNKifZbrRU6pt1MtQ=
X-Received: by 2002:a05:6214:b6c:b0:67f:b1d:e6eb with SMTP id
 ey12-20020a0562140b6c00b0067f0b1de6ebmr20619049qvb.3.1703060683467; Wed, 20
 Dec 2023 00:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com> <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
In-Reply-To: <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 20 Dec 2023 09:24:31 +0100
Message-ID: <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Prashant Batra <prbatra.mail@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.mail@gmail.com> wrote=
:
>
> Thanks for your response. My comments inline.
>
> On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gmail.com> w=
rote:
> > >
> > > Hi,
> > >
> > > I am new to XDP and exploring it's working with different interface
> > > types supported in linux. One of my use cases is to be able to receiv=
e
> > > packets from the bond interface.
> > > I used xdpsock sample program specifying the bond interface as the
> > > input interface. However the packets received on the bond interface
> > > are not handed over to the socket by the kernel if the socket is boun=
d
> > > in native mode. The packets are neither being passed to the kernel.
> > > Note that the socket creation does succeed.
> > > In skb mode this works and I am able to receive packets in the
> > > userspace. But in skb mode as expected the performance is not that
> > > great.
> > >
> > > Is AF_XDP sockets on bond not supported in native mode? Or since the
> > > packet has be to be handed over to the bond driver post reception on
> > > the phy port, a skb allocation and copy to it is indeed a must?
> >
> > I have never tried a bonding interface with AF_XDP, so it might not
> > work. Can you trace the packet to see where it is being dropped in
> > native mode? There are no modifications needed to an XDP_REDIRECT
> > enabled driver to support AF_XDP in XDP_DRV / copy mode. What NICs are
> > you using?
> >
> I will trace the packet and get back.
> The bond is over 2 physical ports part of the Intel NIC card. Those are-
> b3:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> SFI/SFP+ Network Connection (rev 01)
> b3:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> SFI/SFP+ Network Connection (rev 01)
>
> Bonding algo is 802.3ad
>
> CPU is Intel Xeon Gold 3.40GHz
>
> NIC Driver
> # ethtool -i ens1f0
> driver: ixgbe
> version: 5.14.0-362.13.1.el9_3

Could you please try with the latest kernel 6.7? 5.14 is quite old and
a lot of things have happened since then.

> Features
> # xdp-loader features ens1f0
> NETDEV_XDP_ACT_BASIC:           yes
> NETDEV_XDP_ACT_REDIRECT:        yes
> NETDEV_XDP_ACT_NDO_XMIT:        no
> NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> NETDEV_XDP_ACT_HW_OFFLOAD:      no
> NETDEV_XDP_ACT_RX_SG:           no
> NETDEV_XDP_ACT_NDO_XMIT_SG:     no
>
> CPU is
>
> Interesting thing is that the bond0 does advertise both native and ZC
> mode. That's because the features are copied from the slave device.
> Which explains why there is no error while binding the socket in
> native/zero-copy mode.

It is probably the intention that if both the bonded devices support a
feature, then the bonding device will too. I just saw that the bonding
device did not implement xsk_wakeup which is used by zero-copy, so
zero-copy is not really supported so that support should not be
advertised. The code in AF_XDP tests for zero-copy support this way:

if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NETDEV_XDP_ACT_ZC) {
    err =3D -EOPNOTSUPP;
    goto err_unreg_pool;
}

So there are some things needed in the bonding driver to make
zero-copy work. Might not be much though. But your problem is with
XDP_DRV and copy mode, so let us start there.

> void bond_xdp_set_features(struct net_device *bond_dev)
> {
> ..
>     bond_for_each_slave(bond, slave, iter)
>         val &=3D slave->dev->xdp_features;
>     xdp_set_features_flag(bond_dev, val);
> }
>
> # ../xdp-loader/xdp-loader features bond0
> NETDEV_XDP_ACT_BASIC:           yes
> NETDEV_XDP_ACT_REDIRECT:        yes
> NETDEV_XDP_ACT_NDO_XMIT:        no
> NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> NETDEV_XDP_ACT_HW_OFFLOAD:      no
> NETDEV_XDP_ACT_RX_SG:           no
> NETDEV_XDP_ACT_NDO_XMIT_SG:     no
>
> > > Another thing I notice is that other XDP programs attached to bond
> > > interface with targets like DROP, REDIRECT to other interface works
> > > and perform better than AF_XDP (skb) based. Does this mean that these
> > > are not allocating skb?
> >
> > I am not surprised that AF_XDP in copy is slower than XDP_REDIRECT.
> > The packet has to be copied out to user-space then copied into the
> > kernel again, something that is not needed in the XDP_REDIRECT case.
> > If you were using zero-copy, on the other hand, it would be faster
> > with AF_XDP. But the bonding interface does not support zero-copy, so
> > not an option.
> >
>
> Just to put forth the pps numbers with the above mentioned single port
> in different modes and a comparison to the bond interface.
> Test is using pktgen pumping 64 byte packets on a single flow.
>
> Single AF_XDP sock on a single NIC queue-
>   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   Command
>  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>   ZC                            14M      65%        35%
> ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
>   XDP_DRV/COPY     10M     100%       23%                ./xdpsock -r
> -i ens1f0 -q 5 -p -n 1 -N -c
>   SKB_MODE            2.2M     100%       62%                ./xdpsock
> -r -i ens1f0 -q 5 -p -n 1 -S
> * CPU receiving the packet
> In the above tests when using ZC and XDP_DRV/COPY, is this SI usage as
> expected? Especially in ZC mode. Is it majorly because of the BPF
> program running in non-HW offloaded mode? Don't have a NIC which can
> run BPF in offloaded mode so I cannot compare it.

I get about 25 - 30 Mpps at 100% CPU load on my system, but I have a
100G card and you are maxing out your 10G card at 65% and 14M. So yes,
sounds reasonable. HW offload cannot be used with AF_XDP. You need to
do the redirect in the CPU for it to work. If you want to know where
time is spent use "perf top". The biggest chunk of time is spent in
the XDP_REDIRECT operation, but there are many other time thiefs too.

> The XDP_DROP target using xdp-bench tool (from xdp-tools) on the same NIC=
 port-
>   xdp-bench                PPS       CPU-SI*   Command
>  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>   drop, no-touch         14M           41%      ./xdp-bench drop -p
> no-touch ens1f0 -e
>   drop, read-data        14M           55%      ./xdp-bench drop -p
> read-data ens1f0 -e
>   drop, parse-ip          14M           58%      ./xdp-bench drop -p
> parse-ip ens1f0 -e
> * CPU receiving the packet
>
> The similar tests on bond interface (above mentioned 2 ports bonded)-
>  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Command
>  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>   ZC                           X         X              X
>       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
>   XDP_DRV/COPY    X         X              X
> ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
>   SKB_MODE            2M      100%        55%              ./xdpsock
> -r -i bond0 -q 0 -p -n 1 -S
> * CPU receiving the packet
>
>   xdp-bench            PPS     CPU-SI*   Command
>  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
>   drop, no-touch     10.9M    33%         ./xdp-bench drop -p no-touch
> bond0 -e
>   drop, read-data    10.9M    44%         ./xdp-bench drop -p
> read-data bond0 -e
>   drop, parse-ip       10.9M   47%         ./xdp-bench drop -p
> parse-ip bond0 -e
> * CPU receiving the packet
>
>
> > > Kindly share your thoughts and advice.
> > >
> > > Thanks,
> > > Prashant
> > >

