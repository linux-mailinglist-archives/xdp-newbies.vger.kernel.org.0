Return-Path: <xdp-newbies+bounces-21-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96D81B8EE
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Dec 2023 14:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BDE1F2112B
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Dec 2023 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169C58234;
	Thu, 21 Dec 2023 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvzGUkJE"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FA455E79
	for <xdp-newbies@vger.kernel.org>; Thu, 21 Dec 2023 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4257902247cso762121cf.0
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Dec 2023 05:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703166370; x=1703771170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMncBVH0xaecVY5wLAjhq1CIXkoh/G0hX2IKkQ5vTL8=;
        b=PvzGUkJEHf5g92rNzHq7hoCb9SAhHnJo6u3inqEDv/HF05Qi6JT5J54VFEoR4N9aw0
         2HoohoZrFF18jLIoqJMQwUVkL1I2+kQn9nHklhEWmA+2bCuJVFcg9Jcm8PDJfjtwIrr9
         4zjgepyytVQATbAxhUDnoneWauzdV8VpIJSdvwnm2Ftnf36fYWauOpGwmZaCvTBt5S48
         cI/qTPcwJu8v8G1uz82y74YDDHM/ocqdSvBY/1dSAkYiF8hUqbIqayEeE7bGdMUdQqKU
         n5l6Q1MU7xljYKs3Qz1li4LO+5lBeJoDyLXl7rdIm0jBtuDVG5oRtko8e8+rt6xlXXWN
         R0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166370; x=1703771170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMncBVH0xaecVY5wLAjhq1CIXkoh/G0hX2IKkQ5vTL8=;
        b=WqIXPebjVnGBVmST+gaJFuD6+LDj4gTKNte9tGMBq61fJZzWzwPwVBgnE9WuaMWnQ4
         8qVVryC08f/xx8ecv0mNvEzqHfL490P+7wvt8/u+lyQM20EQUsRrwf+J+jCsRG9Kph5O
         Cbbl4RLVy+tNHMs6D27fCnFtgHX4zWkEq+TPNWqnjUoeY0sn2z0qlwglpegDreEmnKcu
         ibVQTh57DRVHi77yArZYbD9xs1xbDrGvf7ddav6Z2yuRdtFI5ejjIOugVKS7cQt4snoC
         9bJp9nGbw4y+Nf4r5VfwlF34nwojHj1pGad+0ISm+CwOkvs2AjiSRZH8MNzx47xz1Vfz
         XXhQ==
X-Gm-Message-State: AOJu0YyfBGG82SjYYW11GeFbwWwvfzymdCK7piv0cU5m8oOcXRtMHHxO
	Q80tbKQ59iHfOeDr4gNPY7mViGSV/AiKmq3h6pALLZVJV00=
X-Google-Smtp-Source: AGHT+IHNF1o+zqAO/FGPoKh6X7xtATg95fh9mgWpWLCMzBz56V4AV0zpc29DF721vw4tVtxAVgQTf+2HWJCjDomn2+E=
X-Received: by 2002:a05:6214:b6c:b0:67f:b1d:e6eb with SMTP id
 ey12-20020a0562140b6c00b0067f0b1de6ebmr24741747qvb.3.1703166370171; Thu, 21
 Dec 2023 05:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
 <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
 <CAJ8uoz30xYV7dG1r30wNx+M-5uoDytNtVCOU+avTaVWBJ-57yw@mail.gmail.com> <CAAAYKZM35fLYfibDmq9WB5W5ht2N05prd_N2-ABY07+tWbKMcA@mail.gmail.com>
In-Reply-To: <CAAAYKZM35fLYfibDmq9WB5W5ht2N05prd_N2-ABY07+tWbKMcA@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Thu, 21 Dec 2023 14:45:58 +0100
Message-ID: <CAJ8uoz3aLQR65GhuO5JSVr=BAB7eJ3R06Cx5mO-bU1upyDt+Cw@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Prashant Batra <prbatra.mail@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Dec 2023 at 13:39, Prashant Batra <prbatra.mail@gmail.com> wrote=
:
>
> On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.mail@gmail.com> w=
rote:
> > >
> > > Thanks for your response. My comments inline.
> > >
> > > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gmail.co=
m> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I am new to XDP and exploring it's working with different interfa=
ce
> > > > > types supported in linux. One of my use cases is to be able to re=
ceive
> > > > > packets from the bond interface.
> > > > > I used xdpsock sample program specifying the bond interface as th=
e
> > > > > input interface. However the packets received on the bond interfa=
ce
> > > > > are not handed over to the socket by the kernel if the socket is =
bound
> > > > > in native mode. The packets are neither being passed to the kerne=
l.
> > > > > Note that the socket creation does succeed.
> > > > > In skb mode this works and I am able to receive packets in the
> > > > > userspace. But in skb mode as expected the performance is not tha=
t
> > > > > great.
> > > > >
> > > > > Is AF_XDP sockets on bond not supported in native mode? Or since =
the
> > > > > packet has be to be handed over to the bond driver post reception=
 on
> > > > > the phy port, a skb allocation and copy to it is indeed a must?
> > > >
> > > > I have never tried a bonding interface with AF_XDP, so it might not
> > > > work. Can you trace the packet to see where it is being dropped in
> > > > native mode? There are no modifications needed to an XDP_REDIRECT
> > > > enabled driver to support AF_XDP in XDP_DRV / copy mode. What NICs =
are
> > > > you using?
> > > >
> > > I will trace the packet and get back.
> > > The bond is over 2 physical ports part of the Intel NIC card. Those a=
re-
> > > b3:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> > > SFI/SFP+ Network Connection (rev 01)
> > > b3:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
> > > SFI/SFP+ Network Connection (rev 01)
> > >
> > > Bonding algo is 802.3ad
> > >
> > > CPU is Intel Xeon Gold 3.40GHz
> > >
> > > NIC Driver
> > > # ethtool -i ens1f0
> > > driver: ixgbe
> > > version: 5.14.0-362.13.1.el9_3
> >
> > Could you please try with the latest kernel 6.7? 5.14 is quite old and
> > a lot of things have happened since then.
> >
> I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still see the same issue=
.

OK, good to know. Have you managed to trace where the packet is lost?

> > > Features
> > > # xdp-loader features ens1f0
> > > NETDEV_XDP_ACT_BASIC:           yes
> > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > NETDEV_XDP_ACT_RX_SG:           no
> > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > >
> > > CPU is
> > >
> > > Interesting thing is that the bond0 does advertise both native and ZC
> > > mode. That's because the features are copied from the slave device.
> > > Which explains why there is no error while binding the socket in
> > > native/zero-copy mode.
> >
> > It is probably the intention that if both the bonded devices support a
> > feature, then the bonding device will too. I just saw that the bonding
> > device did not implement xsk_wakeup which is used by zero-copy, so
> > zero-copy is not really supported so that support should not be
> > advertised. The code in AF_XDP tests for zero-copy support this way:
> >
> > if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NETDEV_XDP_ACT_ZC) =
{
> >     err =3D -EOPNOTSUPP;
> >     goto err_unreg_pool;
> > }
> >
> > So there are some things needed in the bonding driver to make
> > zero-copy work. Might not be much though. But your problem is with
> > XDP_DRV and copy mode, so let us start there.
> >
> > > void bond_xdp_set_features(struct net_device *bond_dev)
> > > {
> > > ..
> > >     bond_for_each_slave(bond, slave, iter)
> > >         val &=3D slave->dev->xdp_features;
> > >     xdp_set_features_flag(bond_dev, val);
> > > }
> > >
> > > # ../xdp-loader/xdp-loader features bond0
> > > NETDEV_XDP_ACT_BASIC:           yes
> > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > NETDEV_XDP_ACT_RX_SG:           no
> > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > >
> > > > > Another thing I notice is that other XDP programs attached to bon=
d
> > > > > interface with targets like DROP, REDIRECT to other interface wor=
ks
> > > > > and perform better than AF_XDP (skb) based. Does this mean that t=
hese
> > > > > are not allocating skb?
> > > >
> > > > I am not surprised that AF_XDP in copy is slower than XDP_REDIRECT.
> > > > The packet has to be copied out to user-space then copied into the
> > > > kernel again, something that is not needed in the XDP_REDIRECT case=
.
> > > > If you were using zero-copy, on the other hand, it would be faster
> > > > with AF_XDP. But the bonding interface does not support zero-copy, =
so
> > > > not an option.
> > > >
> > >
> > > Just to put forth the pps numbers with the above mentioned single por=
t
> > > in different modes and a comparison to the bond interface.
> > > Test is using pktgen pumping 64 byte packets on a single flow.
> > >
> > > Single AF_XDP sock on a single NIC queue-
> > >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   Command
> > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90
> > >   ZC                            14M      65%        35%
> > > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> > >   XDP_DRV/COPY     10M     100%       23%                ./xdpsock -r
> > > -i ens1f0 -q 5 -p -n 1 -N -c
> > >   SKB_MODE            2.2M     100%       62%                ./xdpsoc=
k
> > > -r -i ens1f0 -q 5 -p -n 1 -S
> > > * CPU receiving the packet
> > > In the above tests when using ZC and XDP_DRV/COPY, is this SI usage a=
s
> > > expected? Especially in ZC mode. Is it majorly because of the BPF
> > > program running in non-HW offloaded mode? Don't have a NIC which can
> > > run BPF in offloaded mode so I cannot compare it.
> >
> > I get about 25 - 30 Mpps at 100% CPU load on my system, but I have a
> > 100G card and you are maxing out your 10G card at 65% and 14M. So yes,
> > sounds reasonable. HW offload cannot be used with AF_XDP. You need to
> > do the redirect in the CPU for it to work. If you want to know where
> > time is spent use "perf top". The biggest chunk of time is spent in
> > the XDP_REDIRECT operation, but there are many other time thiefs too.
> >
> > > The XDP_DROP target using xdp-bench tool (from xdp-tools) on the same=
 NIC port-
> > >   xdp-bench                PPS       CPU-SI*   Command
> > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > >   drop, no-touch         14M           41%      ./xdp-bench drop -p
> > > no-touch ens1f0 -e
> > >   drop, read-data        14M           55%      ./xdp-bench drop -p
> > > read-data ens1f0 -e
> > >   drop, parse-ip          14M           58%      ./xdp-bench drop -p
> > > parse-ip ens1f0 -e
> > > * CPU receiving the packet
> > >
> > > The similar tests on bond interface (above mentioned 2 ports bonded)-
> > >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Command
> > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90
> > >   ZC                           X         X              X
> > >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> > >   XDP_DRV/COPY    X         X              X
> > > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> > >   SKB_MODE            2M      100%        55%              ./xdpsock
> > > -r -i bond0 -q 0 -p -n 1 -S
> > > * CPU receiving the packet
> > >
> > >   xdp-bench            PPS     CPU-SI*   Command
> > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > >   drop, no-touch     10.9M    33%         ./xdp-bench drop -p no-touc=
h
> > > bond0 -e
> > >   drop, read-data    10.9M    44%         ./xdp-bench drop -p
> > > read-data bond0 -e
> > >   drop, parse-ip       10.9M   47%         ./xdp-bench drop -p
> > > parse-ip bond0 -e
> > > * CPU receiving the packet
> > >
> > >
> > > > > Kindly share your thoughts and advice.
> > > > >
> > > > > Thanks,
> > > > > Prashant
> > > > >

