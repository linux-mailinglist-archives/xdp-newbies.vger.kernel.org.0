Return-Path: <xdp-newbies+bounces-18-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE69819142
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 21:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98946B24685
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 20:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9BB39AC5;
	Tue, 19 Dec 2023 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbjY1L31"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26E39AC1
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ba0dfc9001so1837528b6e.2
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 12:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703017115; x=1703621915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkatGKWrGcdaGN0bS3RyXwpWgq3WABnJ3SFZ2ymzw2I=;
        b=HbjY1L31XVsNZ82iraiYiajuq1jxvnhPXqonrz53GEhTF4c879k4Xks0vJ9fVGjn5x
         9p9loMtkYNmlw63Lkgl4nCLwGuPS8BSKgA+Ds1H+iVEjwJ8krzaLwIiWjeTYSnJnYJrb
         vk5tDstpVWHxlIEEJvX7ZzDSn2eIuJFd9tJiEtpEmkNKHeRUL7Kvw2+BiUloe1etwxpP
         /1O+zm/rfgGCT6wphXOzV5FLl9lGI4tut6ryu4C4B7vzyCuBxthtmOnd49/TqbL/DhIc
         HRS4DTQtC8rvc45yImf7Tjit5088591r1qEFSR2g5uXqpclVD1D5JSd0XzJxDHfslMr7
         va6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703017115; x=1703621915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkatGKWrGcdaGN0bS3RyXwpWgq3WABnJ3SFZ2ymzw2I=;
        b=mYJEvqTTJjH8OnP4OdCjtcqOQ6HbuG2C+TRlxMKssl+QMIU0BVk09DF3kykYzVe0HJ
         zQvA0WqDpNLFdA0XtHfGemkQ8X4X+j7U68QcRIlAQ54Gw9U8es7S2nxnNRWj0DtxT0Q6
         AZCKKiN6Co8sPeJajPzJNOE601Rb4d/UQe2VR/MjlgaIXVbRY1Zkpm6p3SLS9+7xeo59
         N5JDeDnsvL8aDGxw6UHtOV6bnOYwJbaOGkXb7G8ghz430QlXc6m+Z7LAjGp2tsp3rka4
         Y/ygkXc6uAS0zfRRdTP27QdqJOECsE0zQCXBcKeGjeSsspcJ53FBFy92O97C/QWI7HGc
         jPcQ==
X-Gm-Message-State: AOJu0YxIHpsglpzEqYNUG7DVO8ZlDbEdlX9nxG/7787YwKkK5+EFQhCh
	2sYIDfyglQ1Zjm5rIl8Sw1ybN1ZszmP9zo6yFouEmVE6+KI=
X-Google-Smtp-Source: AGHT+IFHw+7N9pcOcGrrxzwVhuSmTrEHXqsFZmxYXNN5pAb/nxxxQNumh+7ETVETs50AYuAPutekJgykDu5cp0Vcsns=
X-Received: by 2002:a05:6808:3206:b0:3ba:3f4b:d2c4 with SMTP id
 cb6-20020a056808320600b003ba3f4bd2c4mr4785594oib.116.1703017115405; Tue, 19
 Dec 2023 12:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
 <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
In-Reply-To: <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Wed, 20 Dec 2023 01:48:23 +0530
Message-ID: <CAAAYKZOrEUnD-5JOoB_kH8+dbrPJ84OPUiZn=As9ERQrR6y0tg@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your response. My comments inline.

On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gmail.com> wro=
te:
> >
> > Hi,
> >
> > I am new to XDP and exploring it's working with different interface
> > types supported in linux. One of my use cases is to be able to receive
> > packets from the bond interface.
> > I used xdpsock sample program specifying the bond interface as the
> > input interface. However the packets received on the bond interface
> > are not handed over to the socket by the kernel if the socket is bound
> > in native mode. The packets are neither being passed to the kernel.
> > Note that the socket creation does succeed.
> > In skb mode this works and I am able to receive packets in the
> > userspace. But in skb mode as expected the performance is not that
> > great.
> >
> > Is AF_XDP sockets on bond not supported in native mode? Or since the
> > packet has be to be handed over to the bond driver post reception on
> > the phy port, a skb allocation and copy to it is indeed a must?
>
> I have never tried a bonding interface with AF_XDP, so it might not
> work. Can you trace the packet to see where it is being dropped in
> native mode? There are no modifications needed to an XDP_REDIRECT
> enabled driver to support AF_XDP in XDP_DRV / copy mode. What NICs are
> you using?
>
I will trace the packet and get back.
The bond is over 2 physical ports part of the Intel NIC card. Those are-
b3:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
SFI/SFP+ Network Connection (rev 01)
b3:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
SFI/SFP+ Network Connection (rev 01)

Bonding algo is 802.3ad

CPU is Intel Xeon Gold 3.40GHz

NIC Driver
# ethtool -i ens1f0
driver: ixgbe
version: 5.14.0-362.13.1.el9_3

Features
# xdp-loader features ens1f0
NETDEV_XDP_ACT_BASIC:           yes
NETDEV_XDP_ACT_REDIRECT:        yes
NETDEV_XDP_ACT_NDO_XMIT:        no
NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
NETDEV_XDP_ACT_HW_OFFLOAD:      no
NETDEV_XDP_ACT_RX_SG:           no
NETDEV_XDP_ACT_NDO_XMIT_SG:     no

CPU is

Interesting thing is that the bond0 does advertise both native and ZC
mode. That's because the features are copied from the slave device.
Which explains why there is no error while binding the socket in
native/zero-copy mode.
void bond_xdp_set_features(struct net_device *bond_dev)
{
..
    bond_for_each_slave(bond, slave, iter)
        val &=3D slave->dev->xdp_features;
    xdp_set_features_flag(bond_dev, val);
}

# ../xdp-loader/xdp-loader features bond0
NETDEV_XDP_ACT_BASIC:           yes
NETDEV_XDP_ACT_REDIRECT:        yes
NETDEV_XDP_ACT_NDO_XMIT:        no
NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
NETDEV_XDP_ACT_HW_OFFLOAD:      no
NETDEV_XDP_ACT_RX_SG:           no
NETDEV_XDP_ACT_NDO_XMIT_SG:     no

> > Another thing I notice is that other XDP programs attached to bond
> > interface with targets like DROP, REDIRECT to other interface works
> > and perform better than AF_XDP (skb) based. Does this mean that these
> > are not allocating skb?
>
> I am not surprised that AF_XDP in copy is slower than XDP_REDIRECT.
> The packet has to be copied out to user-space then copied into the
> kernel again, something that is not needed in the XDP_REDIRECT case.
> If you were using zero-copy, on the other hand, it would be faster
> with AF_XDP. But the bonding interface does not support zero-copy, so
> not an option.
>

Just to put forth the pps numbers with the above mentioned single port
in different modes and a comparison to the bond interface.
Test is using pktgen pumping 64 byte packets on a single flow.

Single AF_XDP sock on a single NIC queue-
  AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock   Command
 =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
  ZC                            14M      65%        35%
./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
  XDP_DRV/COPY     10M     100%       23%                ./xdpsock -r
-i ens1f0 -q 5 -p -n 1 -N -c
  SKB_MODE            2.2M     100%       62%                ./xdpsock
-r -i ens1f0 -q 5 -p -n 1 -S
* CPU receiving the packet
In the above tests when using ZC and XDP_DRV/COPY, is this SI usage as
expected? Especially in ZC mode. Is it majorly because of the BPF
program running in non-HW offloaded mode? Don't have a NIC which can
run BPF in offloaded mode so I cannot compare it.

The XDP_DROP target using xdp-bench tool (from xdp-tools) on the same NIC p=
ort-
  xdp-bench                PPS       CPU-SI*   Command
 =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
  drop, no-touch         14M           41%      ./xdp-bench drop -p
no-touch ens1f0 -e
  drop, read-data        14M           55%      ./xdp-bench drop -p
read-data ens1f0 -e
  drop, parse-ip          14M           58%      ./xdp-bench drop -p
parse-ip ens1f0 -e
* CPU receiving the packet

The similar tests on bond interface (above mentioned 2 ports bonded)-
 AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Command
 =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
  ZC                           X         X              X
      ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
  XDP_DRV/COPY    X         X              X
./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
  SKB_MODE            2M      100%        55%              ./xdpsock
-r -i bond0 -q 0 -p -n 1 -S
* CPU receiving the packet

  xdp-bench            PPS     CPU-SI*   Command
 =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
  drop, no-touch     10.9M    33%         ./xdp-bench drop -p no-touch
bond0 -e
  drop, read-data    10.9M    44%         ./xdp-bench drop -p
read-data bond0 -e
  drop, parse-ip       10.9M   47%         ./xdp-bench drop -p
parse-ip bond0 -e
* CPU receiving the packet


> > Kindly share your thoughts and advice.
> >
> > Thanks,
> > Prashant
> >

