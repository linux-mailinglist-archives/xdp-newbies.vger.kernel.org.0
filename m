Return-Path: <xdp-newbies+bounces-20-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6C81B610
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Dec 2023 13:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F46A288356
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Dec 2023 12:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8868C6EB52;
	Thu, 21 Dec 2023 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aph2zKPe"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B166EB4D
	for <xdp-newbies@vger.kernel.org>; Thu, 21 Dec 2023 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dbab240a9fso393908a34.1
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Dec 2023 04:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703162396; x=1703767196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJiiTfvhT1irGRNngTjfODJbHaZy5F8ntrFZIPLl+LI=;
        b=Aph2zKPeeWDFzT9CD5Lf3TEtTNPm6aLKHIv5jQ9leEcdEmPprX1Fy0cf1PYwb2wZ0h
         xK/TUg8PRwGa0JSJrQIJjClAOfwrxYYjMpjbC1mf+TK9v0CHqdzmITvpiPlBxp94vnMD
         e5uK3YZc0RBoCReEaHGd5NfWw2t+XMyt+GFcNRG5oqjBcnm6bVrd+tBT+b9zpVdQj7L0
         Y8OaiZZKEGRhP8zuxbDWjSeCUd6kwy0MVDRpbRvEK4BPPCaC8ULb7mThwCKqOw1gj/aQ
         eedYUZJtmWyVnkpxvs90yitgQbaEi3jk5kLelB23IX8MJvEMngYa71/qOt6AGYQsm8+F
         ZXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703162396; x=1703767196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJiiTfvhT1irGRNngTjfODJbHaZy5F8ntrFZIPLl+LI=;
        b=sBFno10qG8QRBrPrPhN1kznN1hJgXeSJLYN3t41uuzycFLBMdt6GDMpfAA6tNJj4hP
         4sd04AWuE1C12ZAq8jbhhvvssCriUkE+Knh7Z4I/y6wo/p+cjDcyDL3wiaXnmqPghhTm
         4zp9Ccf7I5OMKVcyO4YWKoPWrmoUoquSAM0U0nNedZFOrZZNPMvCu1gXE0wj+DGudW61
         tJi/F8vOoDGXolkDfoKPV70zG0NIHSumafFTYRNH/JCsnSO49BAPuWKWD9UP/0Jv7BIB
         9gKu3/1mo8YPCsWe2jPVWj5KAmFVmVDETMu6GAX/Zz7S1FVEdDwxCeP5Q9QKWdBMSwHT
         I7nw==
X-Gm-Message-State: AOJu0YynRPWGoeESysx25vaOK3L4l3LZc2icU9FYr/Z6JCQPa2neQrSO
	PcDqxbT1ul78FFjuCSBbuBr6vRi9r/0JBRDgY8d7G+vBl0w=
X-Google-Smtp-Source: AGHT+IEMVM3XrrqTP+WnBqPRQ913p4O0RWsnitV5PBsE2WqsETA71ayJ7keJAwaLeinlD7KbfEIPdFO0og6Hla9UlM0=
X-Received: by 2002:a9d:6c82:0:b0:6db:a148:2230 with SMTP id
 c2-20020a9d6c82000000b006dba1482230mr3551662otr.49.1703162395618; Thu, 21 Dec
 2023 04:39:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
 <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com> <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com>
In-Reply-To: <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Thu, 21 Dec 2023 18:09:44 +0530
Message-ID: <CAAAYKZM35fLYfibDmq9WB5W5ht2N05prd_N2-ABY07+tWbKMcA@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.mail@gmail.com> wro=
te:
> >
> > Thanks for your response. My comments inline.
> >
> > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gmail.com>=
 wrote:
> > > >
> > > > Hi,
> > > >
> > > > I am new to XDP and exploring it's working with different interface
> > > > types supported in linux. One of my use cases is to be able to rece=
ive
> > > > packets from the bond interface.
> > > > I used xdpsock sample program specifying the bond interface as the
> > > > input interface. However the packets received on the bond interface
> > > > are not handed over to the socket by the kernel if the socket is bo=
und
> > > > in native mode. The packets are neither being passed to the kernel.
> > > > Note that the socket creation does succeed.
> > > > In skb mode this works and I am able to receive packets in the
> > > > userspace. But in skb mode as expected the performance is not that
> > > > great.
> > > >
> > > > Is AF_XDP sockets on bond not supported in native mode? Or since th=
e
> > > > packet has be to be handed over to the bond driver post reception o=
n
> > > > the phy port, a skb allocation and copy to it is indeed a must?
> > >
> > > I have never tried a bonding interface with AF_XDP, so it might not
> > > work. Can you trace the packet to see where it is being dropped in
> > > native mode? There are no modifications needed to an XDP_REDIRECT
> > > enabled driver to support AF_XDP in XDP_DRV / copy mode. What NICs ar=
e
> > > you using?
> > >
> > I will trace the packet and get back.
> > The bond is over 2 physical ports part of the Intel NIC card. Those are=
-
> > b3:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> > SFI/SFP+ Network Connection (rev 01)
> > b3:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> > SFI/SFP+ Network Connection (rev 01)
> >
> > Bonding algo is 802.3ad
> >
> > CPU is Intel Xeon Gold 3.40GHz
> >
> > NIC Driver
> > # ethtool -i ens1f0
> > driver: ixgbe
> > version: 5.14.0-362.13.1.el9_3
>
> Could you please try with the latest kernel 6.7? 5.14 is quite old and
> a lot of things have happened since then.
>
I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still see the same issue.
> > Features
> > # xdp-loader features ens1f0
> > NETDEV_XDP_ACT_BASIC:           yes
> > NETDEV_XDP_ACT_REDIRECT:        yes
> > NETDEV_XDP_ACT_NDO_XMIT:        no
> > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > NETDEV_XDP_ACT_RX_SG:           no
> > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> >
> > CPU is
> >
> > Interesting thing is that the bond0 does advertise both native and ZC
> > mode. That's because the features are copied from the slave device.
> > Which explains why there is no error while binding the socket in
> > native/zero-copy mode.
>
> It is probably the intention that if both the bonded devices support a
> feature, then the bonding device will too. I just saw that the bonding
> device did not implement xsk_wakeup which is used by zero-copy, so
> zero-copy is not really supported so that support should not be
> advertised. The code in AF_XDP tests for zero-copy support this way:
>
> if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NETDEV_XDP_ACT_ZC) {
>     err =3D -EOPNOTSUPP;
>     goto err_unreg_pool;
> }
>
> So there are some things needed in the bonding driver to make
> zero-copy work. Might not be much though. But your problem is with
> XDP_DRV and copy mode, so let us start there.
>
> > void bond_xdp_set_features(struct net_device *bond_dev)
> > {
> > ..
> >     bond_for_each_slave(bond, slave, iter)
> >         val &=3D slave->dev->xdp_features;
> >     xdp_set_features_flag(bond_dev, val);
> > }
> >
> > # ../xdp-loader/xdp-loader features bond0
> > NETDEV_XDP_ACT_BASIC:           yes
> > NETDEV_XDP_ACT_REDIRECT:        yes
> > NETDEV_XDP_ACT_NDO_XMIT:        no
> > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > NETDEV_XDP_ACT_RX_SG:           no
> > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> >
> > > > Another thing I notice is that other XDP programs attached to bond
> > > > interface with targets like DROP, REDIRECT to other interface works
> > > > and perform better than AF_XDP (skb) based. Does this mean that the=
se
> > > > are not allocating skb?
> > >
> > > I am not surprised that AF_XDP in copy is slower than XDP_REDIRECT.
> > > The packet has to be copied out to user-space then copied into the
> > > kernel again, something that is not needed in the XDP_REDIRECT case.
> > > If you were using zero-copy, on the other hand, it would be faster
> > > with AF_XDP. But the bonding interface does not support zero-copy, so
> > > not an option.
> > >
> >
> > Just to put forth the pps numbers with the above mentioned single port
> > in different modes and a comparison to the bond interface.
> > Test is using pktgen pumping 64 byte packets on a single flow.
> >
> > Single AF_XDP sock on a single NIC queue-
> >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   Command
> >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90
> >   ZC                            14M      65%        35%
> > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> >   XDP_DRV/COPY     10M     100%       23%                ./xdpsock -r
> > -i ens1f0 -q 5 -p -n 1 -N -c
> >   SKB_MODE            2.2M     100%       62%                ./xdpsock
> > -r -i ens1f0 -q 5 -p -n 1 -S
> > * CPU receiving the packet
> > In the above tests when using ZC and XDP_DRV/COPY, is this SI usage as
> > expected? Especially in ZC mode. Is it majorly because of the BPF
> > program running in non-HW offloaded mode? Don't have a NIC which can
> > run BPF in offloaded mode so I cannot compare it.
>
> I get about 25 - 30 Mpps at 100% CPU load on my system, but I have a
> 100G card and you are maxing out your 10G card at 65% and 14M. So yes,
> sounds reasonable. HW offload cannot be used with AF_XDP. You need to
> do the redirect in the CPU for it to work. If you want to know where
> time is spent use "perf top". The biggest chunk of time is spent in
> the XDP_REDIRECT operation, but there are many other time thiefs too.
>
> > The XDP_DROP target using xdp-bench tool (from xdp-tools) on the same N=
IC port-
> >   xdp-bench                PPS       CPU-SI*   Command
> >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> >   drop, no-touch         14M           41%      ./xdp-bench drop -p
> > no-touch ens1f0 -e
> >   drop, read-data        14M           55%      ./xdp-bench drop -p
> > read-data ens1f0 -e
> >   drop, parse-ip          14M           58%      ./xdp-bench drop -p
> > parse-ip ens1f0 -e
> > * CPU receiving the packet
> >
> > The similar tests on bond interface (above mentioned 2 ports bonded)-
> >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Command
> >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90
> >   ZC                           X         X              X
> >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> >   XDP_DRV/COPY    X         X              X
> > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> >   SKB_MODE            2M      100%        55%              ./xdpsock
> > -r -i bond0 -q 0 -p -n 1 -S
> > * CPU receiving the packet
> >
> >   xdp-bench            PPS     CPU-SI*   Command
> >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> >   drop, no-touch     10.9M    33%         ./xdp-bench drop -p no-touch
> > bond0 -e
> >   drop, read-data    10.9M    44%         ./xdp-bench drop -p
> > read-data bond0 -e
> >   drop, parse-ip       10.9M   47%         ./xdp-bench drop -p
> > parse-ip bond0 -e
> > * CPU receiving the packet
> >
> >
> > > > Kindly share your thoughts and advice.
> > > >
> > > > Thanks,
> > > > Prashant
> > > >

