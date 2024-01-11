Return-Path: <xdp-newbies+bounces-27-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1282AC46
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jan 2024 11:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F004F1C2349A
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jan 2024 10:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEE215AC8;
	Thu, 11 Jan 2024 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZFc0TiL"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817F156F4
	for <xdp-newbies@vger.kernel.org>; Thu, 11 Jan 2024 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbd1e9c5f7so4267898b6e.3
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jan 2024 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969719; x=1705574519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbEcSYl7L4NqbspcmaHRWZm9j7A2R1xRQAv/LjluZrk=;
        b=hZFc0TiLUqNy5kpwbeDVN5ZLTFd24KNe19I7+TT5+9xOohn6hAXBjJZV9ZdumDpqoH
         ZC62TsZN+RUmpnrS4L25h3eAJrpkPE04hlQA73BfEubtNO6DpLCy5HeGZ90IK4LffAzZ
         V8/OQe/a0vwrB7VMGId53WBdWU7f4FQMu1RVozIGwqaQnXVnPNHIJ80x56enjxnLN0BU
         ANfRHtYvgr4xh1HcrpvVtmAnaInbsq600vpS7UjTngSJkiHgLi3Uvz3lN2ZFHjK6AmhN
         huk7ZNKwfxuGmq2rDhtNZJ67T+/zvL2a/5l7drrAdVxdlX4I4UfWY2cA8HNnuPsUA0aM
         xRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969719; x=1705574519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbEcSYl7L4NqbspcmaHRWZm9j7A2R1xRQAv/LjluZrk=;
        b=UYYK0Ys5fiZaVOawqeHmhqA+4Aetorr6Vxj+lDSQielrllaGYcShNkDmb5qhbE99eK
         JMomPn9ZUMeT8pWVz9Gpf5wN5vzlw98oUOZkkWCyCmgKzpvTJOdgWooFKVldKrDtbNUk
         5ws9aedfwmb+gQkQ2IfFypxYzVTLlr68fDq8fclYf8wut/JB7JX9DwcsvqlFXgE28vEm
         pCf6iF/EKdpMmBiCWLUq9w1r0sJc86q7hX+QKSVnNGfGj2O/J4XUnQ0+fYPvA19UiqB7
         GNk0ilWxOvEuagQhQkfqs+BgsKUYk3SM0FM1m/v/HGViimc0sAc/wsxvRmR4DG+dINh5
         OTZQ==
X-Gm-Message-State: AOJu0YylkwaRngh+miCKSOWiUZTdEZYmS+s7sF1nKrmFntFHLYzVt2dP
	cP0yMwwnHGdD33fq46wce8iiam2zGzb3Xuzr+ZY=
X-Google-Smtp-Source: AGHT+IHs+7saE61scg5ioYxOSTgBxh5LmZzJQw1qeMZRj5fqbLUZ+PT8x5KzUP6/LziOich0csnXJK7WzL6AJg5ec4s=
X-Received: by 2002:a05:6808:1709:b0:3bd:4122:3947 with SMTP id
 bc9-20020a056808170900b003bd41223947mr1029585oib.73.1704969718965; Thu, 11
 Jan 2024 02:41:58 -0800 (PST)
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
 <CAAAYKZOwckVv+xHmXTg8QpfbRGy=ysy0NTJZb77ij-6ZPCVQMw@mail.gmail.com> <CAJ8uoz065BceDsz+DEGVZvKWs2AeAPaB0dKgaX8SsQ36rVN2wg@mail.gmail.com>
In-Reply-To: <CAJ8uoz065BceDsz+DEGVZvKWs2AeAPaB0dKgaX8SsQ36rVN2wg@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Thu, 11 Jan 2024 16:11:47 +0530
Message-ID: <CAAAYKZPbvTwEzTH0_gPg_jsgUKz8EhDK_whd1AvA0nBRyAgGcg@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 3:27=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Fri, 22 Dec 2023 at 12:23, Prashant Batra <prbatra.mail@gmail.com> wro=
te:
> >
> > Yes, I found the place where the packet is getting dropped. The check
> > for device match b/w xs and xdp->rxq is failing in xsk_rcv_check() .
> > The device in xs is the bond device whereas the one in xdp->rxq is the
> > slave device on which the packet is received and the xdp program is
> > being invoked from.
> >
> > static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp)
> > {
> > --
> >     if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->rxq->queue=
_index)
> >         return -EINVAL;
> > --
> > }
>
> I am now back from the holidays.
>
> Perfect! Thank you for finding the root cause. I will rope in Maciej
> and we will get back to you with a solution proposal.
>
Thanks, will wait for your solution.
> > Here is the perf backtrace for the xdp_redirect_err event.
> > ksoftirqd/0    14 [000] 10956.235960: xdp:xdp_redirect_err: prog_id=3D6=
9
> > action=3DREDIRECT ifindex=3D5 to_ifindex=3D0 err=3D-22 map_id=3D19 map_=
index=3D5
> >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffffc05d0f0f ixgbe_run_xdp+0x10f
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethernet/int=
el/ixgbe/ixgbe.ko)
> >         ffffffffc05d297a ixgbe_clean_rx_irq+0x51a
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethernet/int=
el/ixgbe/ixgbe.ko)
> >         ffffffffc05d2da0 ixgbe_poll+0xf0
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/ethernet/int=
el/ixgbe/ixgbe.ko)
> >         ffffffff873afad7 __napi_poll+0x27
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff873affd3 net_rx_action+0x233
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff8762ae27 __do_softirq+0xc7
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff86b04cfe run_ksoftirqd+0x1e
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff86b33d83 smpboot_thread_fn+0xd3
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff86b2956d kthread+0xdd
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >         ffffffff86a02289 ret_from_fork+0x29
> > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> >
> > I am curious why the xdp program is invoked from the ixgbe driver
> > (running for slave device) when the xdp program is actually attached
> > to the bond device? Is this by design?
> > # xdp-loader status bond0
> > CURRENT XDP PROGRAM STATUS:
> > Interface        Prio  Program name      Mode     ID   Tag
> >   Chain actions
> > -----------------------------------------------------------------------=
---------------
> > bond0                  xdp_dispatcher    native   64   90f686eb86991928
> >  =3D>              20     xsk_def_prog              73
> > 8f9c40757cb0a6a2  XDP_PASS
> >
> > # xdp-loader status ens1f0
> > CURRENT XDP PROGRAM STATUS:
> > Interface        Prio  Program name      Mode     ID   Tag
> >   Chain actions
> > -----------------------------------------------------------------------=
---------------
> > ens1f0                 <No XDP program loaded!>
> >
> > # xdp-loader status ens1f1
> > CURRENT XDP PROGRAM STATUS:
> > Interface        Prio  Program name      Mode     ID   Tag
> >   Chain actions
> > -----------------------------------------------------------------------=
---------------
> > ens1f1                 <No XDP program loaded!>
> >
> > Now, if I skip the device check in xsk_rcv_check(), I can see the
> > packets being received in the AF_XDP socket in the driver mode.
> >  # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N
> >  sock0@bond0:5 rxdrop xdp-drv poll()
> >                    pps            pkts           1.00
> > rx                10,126,924     1,984,092,501
> > tx                 0              0
> >
> > I am sure we would not want to skip the device check generally
> > especially for non-bonded devices, etc. Please guide on how to take
> > this further and get the issue fixed in the mainline.
> >
> > The ZC mode doesn't work. Mostly because of the problem you had
> > pointed out before.
> > # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N -z
> > xdpsock.c:xsk_configure_socket:1068: errno: 22/"Invalid argument"
> >
> >
> > On Thu, Dec 21, 2023 at 7:16=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, 21 Dec 2023 at 13:39, Prashant Batra <prbatra.mail@gmail.com>=
 wrote:
> > > >
> > > > On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.mail@gmail.=
com> wrote:
> > > > > >
> > > > > > Thanks for your response. My comments inline.
> > > > > >
> > > > > > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
> > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > >
> > > > > > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gm=
ail.com> wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I am new to XDP and exploring it's working with different i=
nterface
> > > > > > > > types supported in linux. One of my use cases is to be able=
 to receive
> > > > > > > > packets from the bond interface.
> > > > > > > > I used xdpsock sample program specifying the bond interface=
 as the
> > > > > > > > input interface. However the packets received on the bond i=
nterface
> > > > > > > > are not handed over to the socket by the kernel if the sock=
et is bound
> > > > > > > > in native mode. The packets are neither being passed to the=
 kernel.
> > > > > > > > Note that the socket creation does succeed.
> > > > > > > > In skb mode this works and I am able to receive packets in =
the
> > > > > > > > userspace. But in skb mode as expected the performance is n=
ot that
> > > > > > > > great.
> > > > > > > >
> > > > > > > > Is AF_XDP sockets on bond not supported in native mode? Or =
since the
> > > > > > > > packet has be to be handed over to the bond driver post rec=
eption on
> > > > > > > > the phy port, a skb allocation and copy to it is indeed a m=
ust?
> > > > > > >
> > > > > > > I have never tried a bonding interface with AF_XDP, so it mig=
ht not
> > > > > > > work. Can you trace the packet to see where it is being dropp=
ed in
> > > > > > > native mode? There are no modifications needed to an XDP_REDI=
RECT
> > > > > > > enabled driver to support AF_XDP in XDP_DRV / copy mode. What=
 NICs are
> > > > > > > you using?
> > > > > > >
> > > > > > I will trace the packet and get back.
> > > > > > The bond is over 2 physical ports part of the Intel NIC card. T=
hose are-
> > > > > > b3:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigab=
it
> > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > b3:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigab=
it
> > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > >
> > > > > > Bonding algo is 802.3ad
> > > > > >
> > > > > > CPU is Intel Xeon Gold 3.40GHz
> > > > > >
> > > > > > NIC Driver
> > > > > > # ethtool -i ens1f0
> > > > > > driver: ixgbe
> > > > > > version: 5.14.0-362.13.1.el9_3
> > > > >
> > > > > Could you please try with the latest kernel 6.7? 5.14 is quite ol=
d and
> > > > > a lot of things have happened since then.
> > > > >
> > > > I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still see the same=
 issue.
> > >
> > > OK, good to know. Have you managed to trace where the packet is lost?
> > >
> > > > > > Features
> > > > > > # xdp-loader features ens1f0
> > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > >
> > > > > > CPU is
> > > > > >
> > > > > > Interesting thing is that the bond0 does advertise both native =
and ZC
> > > > > > mode. That's because the features are copied from the slave dev=
ice.
> > > > > > Which explains why there is no error while binding the socket i=
n
> > > > > > native/zero-copy mode.
> > > > >
> > > > > It is probably the intention that if both the bonded devices supp=
ort a
> > > > > feature, then the bonding device will too. I just saw that the bo=
nding
> > > > > device did not implement xsk_wakeup which is used by zero-copy, s=
o
> > > > > zero-copy is not really supported so that support should not be
> > > > > advertised. The code in AF_XDP tests for zero-copy support this w=
ay:
> > > > >
> > > > > if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NETDEV_XDP_AC=
T_ZC) {
> > > > >     err =3D -EOPNOTSUPP;
> > > > >     goto err_unreg_pool;
> > > > > }
> > > > >
> > > > > So there are some things needed in the bonding driver to make
> > > > > zero-copy work. Might not be much though. But your problem is wit=
h
> > > > > XDP_DRV and copy mode, so let us start there.
> > > > >
> > > > > > void bond_xdp_set_features(struct net_device *bond_dev)
> > > > > > {
> > > > > > ..
> > > > > >     bond_for_each_slave(bond, slave, iter)
> > > > > >         val &=3D slave->dev->xdp_features;
> > > > > >     xdp_set_features_flag(bond_dev, val);
> > > > > > }
> > > > > >
> > > > > > # ../xdp-loader/xdp-loader features bond0
> > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > >
> > > > > > > > Another thing I notice is that other XDP programs attached =
to bond
> > > > > > > > interface with targets like DROP, REDIRECT to other interfa=
ce works
> > > > > > > > and perform better than AF_XDP (skb) based. Does this mean =
that these
> > > > > > > > are not allocating skb?
> > > > > > >
> > > > > > > I am not surprised that AF_XDP in copy is slower than XDP_RED=
IRECT.
> > > > > > > The packet has to be copied out to user-space then copied int=
o the
> > > > > > > kernel again, something that is not needed in the XDP_REDIREC=
T case.
> > > > > > > If you were using zero-copy, on the other hand, it would be f=
aster
> > > > > > > with AF_XDP. But the bonding interface does not support zero-=
copy, so
> > > > > > > not an option.
> > > > > > >
> > > > > >
> > > > > > Just to put forth the pps numbers with the above mentioned sing=
le port
> > > > > > in different modes and a comparison to the bond interface.
> > > > > > Test is using pktgen pumping 64 byte packets on a single flow.
> > > > > >
> > > > > > Single AF_XDP sock on a single NIC queue-
> > > > > >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   Command
> > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90
> > > > > >   ZC                            14M      65%        35%
> > > > > > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> > > > > >   XDP_DRV/COPY     10M     100%       23%                ./xdps=
ock -r
> > > > > > -i ens1f0 -q 5 -p -n 1 -N -c
> > > > > >   SKB_MODE            2.2M     100%       62%                ./=
xdpsock
> > > > > > -r -i ens1f0 -q 5 -p -n 1 -S
> > > > > > * CPU receiving the packet
> > > > > > In the above tests when using ZC and XDP_DRV/COPY, is this SI u=
sage as
> > > > > > expected? Especially in ZC mode. Is it majorly because of the B=
PF
> > > > > > program running in non-HW offloaded mode? Don't have a NIC whic=
h can
> > > > > > run BPF in offloaded mode so I cannot compare it.
> > > > >
> > > > > I get about 25 - 30 Mpps at 100% CPU load on my system, but I hav=
e a
> > > > > 100G card and you are maxing out your 10G card at 65% and 14M. So=
 yes,
> > > > > sounds reasonable. HW offload cannot be used with AF_XDP. You nee=
d to
> > > > > do the redirect in the CPU for it to work. If you want to know wh=
ere
> > > > > time is spent use "perf top". The biggest chunk of time is spent =
in
> > > > > the XDP_REDIRECT operation, but there are many other time thiefs =
too.
> > > > >
> > > > > > The XDP_DROP target using xdp-bench tool (from xdp-tools) on th=
e same NIC port-
> > > > > >   xdp-bench                PPS       CPU-SI*   Command
> > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > >   drop, no-touch         14M           41%      ./xdp-bench dro=
p -p
> > > > > > no-touch ens1f0 -e
> > > > > >   drop, read-data        14M           55%      ./xdp-bench dro=
p -p
> > > > > > read-data ens1f0 -e
> > > > > >   drop, parse-ip          14M           58%      ./xdp-bench dr=
op -p
> > > > > > parse-ip ens1f0 -e
> > > > > > * CPU receiving the packet
> > > > > >
> > > > > > The similar tests on bond interface (above mentioned 2 ports bo=
nded)-
> > > > > >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Command
> > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90
> > > > > >   ZC                           X         X              X
> > > > > >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> > > > > >   XDP_DRV/COPY    X         X              X
> > > > > > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> > > > > >   SKB_MODE            2M      100%        55%              ./xd=
psock
> > > > > > -r -i bond0 -q 0 -p -n 1 -S
> > > > > > * CPU receiving the packet
> > > > > >
> > > > > >   xdp-bench            PPS     CPU-SI*   Command
> > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > >   drop, no-touch     10.9M    33%         ./xdp-bench drop -p n=
o-touch
> > > > > > bond0 -e
> > > > > >   drop, read-data    10.9M    44%         ./xdp-bench drop -p
> > > > > > read-data bond0 -e
> > > > > >   drop, parse-ip       10.9M   47%         ./xdp-bench drop -p
> > > > > > parse-ip bond0 -e
> > > > > > * CPU receiving the packet
> > > > > >
> > > > > >
> > > > > > > > Kindly share your thoughts and advice.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Prashant
> > > > > > > >

