Return-Path: <xdp-newbies+bounces-34-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D398329A2
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Jan 2024 13:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDCE2285943
	for <lists+xdp-newbies@lfdr.de>; Fri, 19 Jan 2024 12:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788F551C33;
	Fri, 19 Jan 2024 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l47C4feW"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD7551C2A
	for <xdp-newbies@vger.kernel.org>; Fri, 19 Jan 2024 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705668207; cv=none; b=L45NyJ12sbDVRXBIGTN8yyyZiHi7yXkxTnUpxAMej4P+uhiKCC2UN4pO4v9xrYwTxFyiz25W06CfPOfbsdStJJAnhWe36m00+KayqrQGWiVWzzQc3SOkvAd1jkw495nM0rricwBh14nFzzCcXVR6+uQLMsnRP7jvAo1fbnvv+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705668207; c=relaxed/simple;
	bh=eK0dGqKzUUU4fgI/vCXG0CQtWhQLWXiX9Wuq6PT0ANA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbrbZ/FRxrinCkrpg2m+5SXyqVEFDRWYJDq+iXhAMVZSiq9pbXyU8VLXCsvIAX5TCXQXDoY+9BwUt7e4W+ze6WgWzFQ8xp3LHYCdiRBGqzg2VNz4VrAnczggwD9Buom4jC7AXASKUoZnfRplBcQIRtp6PHVgokw5XFG2vK73YzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l47C4feW; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-429985e952bso4223501cf.3
        for <xdp-newbies@vger.kernel.org>; Fri, 19 Jan 2024 04:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705668204; x=1706273004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmwB7SMfd63rDGrYGO2Wt1q246ASuvAhcDhLROeFG48=;
        b=l47C4feW0N4Xw0oXMm2qEblucIFSaKKEhO7sSMeNuT6d22sFlNdvw6VUIRCPBGc74T
         VEx4XwYKGZpJzdgn9kB+Kj20twid3VpwsAH9fjPMw/YE9EDkiT3ZsfX0PPvEfuAgXQNo
         P7kYswjxGfwk5v8Jh1OHfLAo9KxOrDLcMdJ5w5Z60PbInWGAbAoL14eiL59YDPqF8/AS
         EYhTHckCquZ55AsVsxPsjDEN1EDvRN+hr7xbHVokXV4DyRTA8NOj8NilEq1AMZuqoEIb
         iDv5KZrGD+HT8WWiyTbdUpdI93lpsyYNZlOVybD21cUCLiyUeMWgc8q097r51Wr6Tc4P
         L9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705668204; x=1706273004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmwB7SMfd63rDGrYGO2Wt1q246ASuvAhcDhLROeFG48=;
        b=qqJFgSCVwKis5Gp8JIbYB3VPNufdLChJiQtiV4LP6JiMADwftytfegcPP0DGg/AXMx
         b6Gmi8rEzQKlVymuiv6cvMiAI1bOovO+5Tpr/dnN94qPXs/vV5Ag95mGiJ9m1fjXqgTi
         VNe48lve9aG65l5FypBD1M0awKr4wcd9q6MOnS05mdjMvIGnHUEsKyss2slVnf6HEVaz
         8DChBTPXt3Qe+dUygOUGjNSyErfmsbjtSu4hanb0pZ6oU4jdS4zm7jBFbt2N9WcuBZbi
         mQXlAn40CWUh76GdJdvd9M3jqfnizHk4dAkTVhw35P5lzL6Z7bQJLxz6ME3BKoP1OK2k
         w2Ug==
X-Gm-Message-State: AOJu0YxqlNUT2L00obs3mUTCjgLQ5b5lYzL0Ut8mZaOryUDSRnXH7EJZ
	MTC+4880Q4rzkbNXAIPnUXUrc+d49NxfRb9lhp2X9eFEUzyqZwa0znCZsoqkqdNFfFBf/JQU/Nu
	xoYtIOlh4h//rqpVxwkGh4mlj6wz3/PKVcEk=
X-Google-Smtp-Source: AGHT+IEeIxG+tSUgFiRkTfOQy4mhoaDCSW7cDF9wv6E72xVVm62SVP106sYGnGXhWUIZo3k2TWiDCKgE5Xrifu+4o5A=
X-Received: by 2002:a05:622a:100f:b0:429:f254:e920 with SMTP id
 d15-20020a05622a100f00b00429f254e920mr2560660qte.84.1705668203671; Fri, 19
 Jan 2024 04:43:23 -0800 (PST)
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
 <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com> <CAJ8uoz2S5qkbD6odkV=Y8EHijsn5jyU01-6a8pv19eFE3=o1uA@mail.gmail.com>
In-Reply-To: <CAJ8uoz2S5qkbD6odkV=Y8EHijsn5jyU01-6a8pv19eFE3=o1uA@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Fri, 19 Jan 2024 18:13:12 +0530
Message-ID: <CAAAYKZPeCFbyTadsVJEUUv=HTHN8pnMOwF_i3NfCv-py1FtYDg@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 1:11=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, 17 Jan 2024 at 07:07, Prashant Batra <prbatra.mail@gmail.com> wro=
te:
> >
> > On Tue, Jan 16, 2024 at 6:29=E2=80=AFPM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Tue, 16 Jan 2024 at 13:48, Prashant Batra <prbatra.mail@gmail.com>=
 wrote:
> > > >
> > > > On Mon, Jan 15, 2024 at 2:52=E2=80=AFPM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Thu, 11 Jan 2024 at 11:41, Prashant Batra <prbatra.mail@gmail.=
com> wrote:
> > > > > >
> > > > > > On Tue, Jan 2, 2024 at 3:27=E2=80=AFPM Magnus Karlsson
> > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, 22 Dec 2023 at 12:23, Prashant Batra <prbatra.mail@gm=
ail.com> wrote:
> > > > > > > >
> > > > > > > > Yes, I found the place where the packet is getting dropped.=
 The check
> > > > > > > > for device match b/w xs and xdp->rxq is failing in xsk_rcv_=
check() .
> > > > > > > > The device in xs is the bond device whereas the one in xdp-=
>rxq is the
> > > > > > > > slave device on which the packet is received and the xdp pr=
ogram is
> > > > > > > > being invoked from.
> > > > > > > >
> > > > > > > > static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_bu=
ff *xdp)
> > > > > > > > {
> > > > > > > > --
> > > > > > > >     if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp=
->rxq->queue_index)
> > > > > > > >         return -EINVAL;
> > > > > > > > --
> > > > > > > > }
> > > > > > >
> > > > > > > I am now back from the holidays.
> > > > > > >
> > > > > > > Perfect! Thank you for finding the root cause. I will rope in=
 Maciej
> > > > > > > and we will get back to you with a solution proposal.
> > > > > > >
> > > > > > Thanks, will wait for your solution.
> > > > >
> > > > > FYI, I do not have a good solution for this yet. The one I have i=
s too
> > > > > complicated for my taste. I might have to take this to the list t=
o get
> > > > > some new ideas on how to tackle it. So this will take longer than
> > > > > anticipated.
> > > > >
> > > > Just to add that the AF_XDP TX in native mode is also not performin=
g
> > > > well. I am getting around 2Mpps in native mode.
> > >
> > > That is expected though. There are only two modes for Tx: SKB mode an=
d
> > > zero-copy mode, and since there is no zero-copy support for the
> > > bonding driver, it will revert to skb mode. I would expect around 3
> > > Mpps for Tx in skb mode, so 2 Mpps seems reasonable as the bonding
> > > driver adds overhead.
> > >
> > > For Rx there are 3 modes: skb, XDP_DRV (which is the one you are
> > > getting with the -N switch) and zero-copy (that is not supported by
> > > the bonding driver).
> > >
> > Thanks for quick info. So, when you provide the fix for the bond
> > driver, can we expect the bond-driver to be able to support ZC in the
> > Tx mode (and Rx mode) or will the Tx remain in SKB mode? At 2M pps,
> > it's a big gap in Rx and Tx and practically leaves xdp not much useful
> > with bond devices.
>
> Personally, I do not have the time right now to implement ZC for the
> bonding driver. Once I have posted the fix (coding it up right now),
> send a mail to the netdev mailing list with the bonding maintainers on
> the to-line and state that you are interested in this functionality
> and ask if there are any other people interested in it. Or maybe you
> would like to implement it :-)?
I will need to understand the current ZC design and its implications
on bonding driver, both of which I will be new to. So I will probably
follow your suggestion on going to the netdev first.
>
> > I also see a gap in Rx vs Tx for veth drivers-
> > In this below topology, I see AF_XDP TX to a veth device (veth1) is
> > not going beyond 1.2Mpps, The xdp program on veth2 redirects packet to
> > phy device ens1f0. I would assume based on your explanation above,
> > that this too is working in SKB mode, and hence the lower performance.
> > veth1 (AF_XDP Tx) -> veth2 (xdp) -> ens1f0
>
> Correct. There is no zero-copy for veth either.
>
> > However in the reverse direction shown below, I can receive close to
> > 5M pps on AF_XDP socket.
> > ens1f0 (xdp) ->veth2 -> veth1 (AF_XDP Rx)
>
> Yes, since it is using XDP_DRV mode without zero-copy.
>
> > Looking at the results here-
> > https://patchwork.ozlabs.org/project/netdev/cover/1533283098-2397-1-git=
-send-email-makita.toshiaki@lab.ntt.co.jp/
> > , I don't seem to find the benchmark which would validate my AF_XDP Rx
> > and Tx results with veth devices. The xdp DROP test results do match
> > with my tests though.
>
> Your numbers look reasonable. Just note that veth is not fast. If you
> want to have a faster veth, you might want to take a look at the new
> netkit device.
>
Just to get your expert opinion on this, I am sharing at a very high
level what my objectives are-
For Rx handling:
Demultiplex the packets received on the physical/bond interface based
on the packet's src + dst combination and direct it to the process
(Pn) handling that src + dst packets.
    a) One way of doing this is to pick all packets in userspace in a
central process (Pc) using AF_XDP socket (ZC with phy device and
XDP_DRV with bond) and then Pc passes it using shared memory to the
correct process (Pn) for further handling.
ens1f0/bond (AF_XDP) -> Pc -> Pn
    b) The other way is to run a xdp code attached to the phy/bond
device which based on the src + dst redirects the packets to the veth
pair (one per process Pn). The packet is then forwarded to the other
end of the veth-pair over which there is an AF_XDP socket opened.The
advantage here is that the packet demultiplex happens in the kernel
and there is no Pc process needed.
ens1f0/bond (XDP_REDIRECT_IF) ->vethext -> vethint ( AF_XDP) -> Pn

For Tx handling:
Similar to Rx, here the packets coming from each process Pn need to be
sent out of the phy/bond device.
    a) Again one way is to have a central process Pc which opens
AF_XDP sockets on the phy/bond device and multiplexes packets coming
from each Pn process (passed over shared memory).
Pn -> Pc -> ens1f0/bond (AF_XDP)
    b) Use a veth pair device over which the process Pn creates an
AF_XDP socket. The packets written to the veth device are then
redirected using a xdp program attached to the other end of the veth's
pair device to the phy/bond device.
Pn -> (AF_XDP) vethint -> vethext (XDP_REDIRECT_IF) -> ens1f0/bond.

Given the limitations of veth on the Tx path, another idea I am
exploring is to have two categories of process Pn(s). The first
category of process Pn that are to handle large pps, open AF_XDP
socket directly on the phy device's queue-N (again each such process
gets a dedicated queue and the corresponding 4 rings) to get ZC
benefit. The second category of process Pn with a lower pps
requirement to use the veth way (as we can't have so many queues to
dedicate to each process Pn).
1st category - Pn (AF_XDP) -> ens1f0
2nd category - As demonstrated above in Tx (b).

Note that at the moment my requirement has nothing to do with
containers. veth-pairs are used purely to segregate packets belonging
to different process Pn without needing the central process Pc.

Regarding netkit, I don't see much documentation or samples available
except the selftest available in the kernel code. If you have or know
of some samples that might fit in the above requirements that will
surely help. Does it fit in the above requirement?

Also, it would be really helpful if you can point to any other better
way to achieve the above set of objectives.

Thanks,
Prashant
> > > >  # ./xdpsock -t -i bond0 -N -G 0c:c4:7a:bd:13:b2 -H 0c:c4:7a:b7:5f:=
6c
> > > >  sock0@bond0:0 txonly xdp-drv
> > > >
> > > >                    pps            pkts           1.00
> > > > rx                 0              0
> > > > tx                 2,520,587      2,521,152
> > > >
> > > >  sock0@bond0:0 txonly xdp-drv
> > > >                    pps            pkts           1.00
> > > > rx                 0              0
> > > > tx                 2,362,740      4,884,352
> > > >
> > > >  sock0@bond0:0 txonly xdp-drv
> > > >                    pps            pkts           1.00
> > > > rx                 0              0
> > > > tx                 1,814,437      6,698,944
> > > >
> > > >  sock0@bond0:0 txonly xdp-drv
> > > >                    pps            pkts           1.00
> > > > rx                 0              0
> > > > tx                 1,817,913      8,517,120
> > > >
> > > > # xdp-loader status bond0
> > > > CURRENT XDP PROGRAM STATUS:
> > > >
> > > > Interface        Prio  Program name      Mode     ID   Tag
> > > >   Chain actions
> > > > -------------------------------------------------------------------=
-------------------
> > > > bond0                  xdp_dispatcher    native   671  90f686eb8699=
1928
> > > >  =3D>              20     xsk_def_prog              680
> > > > 8f9c40757cb0a6a2  XDP_PASS
> > > >
> > > > > > > > Here is the perf backtrace for the xdp_redirect_err event.
> > > > > > > > ksoftirqd/0    14 [000] 10956.235960: xdp:xdp_redirect_err:=
 prog_id=3D69
> > > > > > > > action=3DREDIRECT ifindex=3D5 to_ifindex=3D0 err=3D-22 map_=
id=3D19 map_index=3D5
> > > > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffffc05d0f0f ixgbe_run_xdp+0x10f
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/=
ethernet/intel/ixgbe/ixgbe.ko)
> > > > > > > >         ffffffffc05d297a ixgbe_clean_rx_irq+0x51a
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/=
ethernet/intel/ixgbe/ixgbe.ko)
> > > > > > > >         ffffffffc05d2da0 ixgbe_poll+0xf0
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/=
ethernet/intel/ixgbe/ixgbe.ko)
> > > > > > > >         ffffffff873afad7 __napi_poll+0x27
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff873affd3 net_rx_action+0x233
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff8762ae27 __do_softirq+0xc7
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff86b04cfe run_ksoftirqd+0x1e
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff86b33d83 smpboot_thread_fn+0xd3
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff86b2956d kthread+0xdd
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >         ffffffff86a02289 ret_from_fork+0x29
> > > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > > >
> > > > > > > > I am curious why the xdp program is invoked from the ixgbe =
driver
> > > > > > > > (running for slave device) when the xdp program is actually=
 attached
> > > > > > > > to the bond device? Is this by design?
> > > > > > > > # xdp-loader status bond0
> > > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > > >   Chain actions
> > > > > > > > -----------------------------------------------------------=
---------------------------
> > > > > > > > bond0                  xdp_dispatcher    native   64   90f6=
86eb86991928
> > > > > > > >  =3D>              20     xsk_def_prog              73
> > > > > > > > 8f9c40757cb0a6a2  XDP_PASS
> > > > > > > >
> > > > > > > > # xdp-loader status ens1f0
> > > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > > >   Chain actions
> > > > > > > > -----------------------------------------------------------=
---------------------------
> > > > > > > > ens1f0                 <No XDP program loaded!>
> > > > > > > >
> > > > > > > > # xdp-loader status ens1f1
> > > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > > >   Chain actions
> > > > > > > > -----------------------------------------------------------=
---------------------------
> > > > > > > > ens1f1                 <No XDP program loaded!>
> > > > > > > >
> > > > > > > > Now, if I skip the device check in xsk_rcv_check(), I can s=
ee the
> > > > > > > > packets being received in the AF_XDP socket in the driver m=
ode.
> > > > > > > >  # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N
> > > > > > > >  sock0@bond0:5 rxdrop xdp-drv poll()
> > > > > > > >                    pps            pkts           1.00
> > > > > > > > rx                10,126,924     1,984,092,501
> > > > > > > > tx                 0              0
> > > > > > > >
> > > > > > > > I am sure we would not want to skip the device check genera=
lly
> > > > > > > > especially for non-bonded devices, etc. Please guide on how=
 to take
> > > > > > > > this further and get the issue fixed in the mainline.
> > > > > > > >
> > > > > > > > The ZC mode doesn't work. Mostly because of the problem you=
 had
> > > > > > > > pointed out before.
> > > > > > > > # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N -z
> > > > > > > > xdpsock.c:xsk_configure_socket:1068: errno: 22/"Invalid arg=
ument"
> > > > > > > >
> > > > > > > >
> > > > > > > > On Thu, Dec 21, 2023 at 7:16=E2=80=AFPM Magnus Karlsson
> > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, 21 Dec 2023 at 13:39, Prashant Batra <prbatra.mai=
l@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
> > > > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra=
.mail@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks for your response. My comments inline.
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karl=
sson
> > > > > > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prb=
atra.mail@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I am new to XDP and exploring it's working with=
 different interface
> > > > > > > > > > > > > > types supported in linux. One of my use cases i=
s to be able to receive
> > > > > > > > > > > > > > packets from the bond interface.
> > > > > > > > > > > > > > I used xdpsock sample program specifying the bo=
nd interface as the
> > > > > > > > > > > > > > input interface. However the packets received o=
n the bond interface
> > > > > > > > > > > > > > are not handed over to the socket by the kernel=
 if the socket is bound
> > > > > > > > > > > > > > in native mode. The packets are neither being p=
assed to the kernel.
> > > > > > > > > > > > > > Note that the socket creation does succeed.
> > > > > > > > > > > > > > In skb mode this works and I am able to receive=
 packets in the
> > > > > > > > > > > > > > userspace. But in skb mode as expected the perf=
ormance is not that
> > > > > > > > > > > > > > great.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Is AF_XDP sockets on bond not supported in nati=
ve mode? Or since the
> > > > > > > > > > > > > > packet has be to be handed over to the bond dri=
ver post reception on
> > > > > > > > > > > > > > the phy port, a skb allocation and copy to it i=
s indeed a must?
> > > > > > > > > > > > >
> > > > > > > > > > > > > I have never tried a bonding interface with AF_XD=
P, so it might not
> > > > > > > > > > > > > work. Can you trace the packet to see where it is=
 being dropped in
> > > > > > > > > > > > > native mode? There are no modifications needed to=
 an XDP_REDIRECT
> > > > > > > > > > > > > enabled driver to support AF_XDP in XDP_DRV / cop=
y mode. What NICs are
> > > > > > > > > > > > > you using?
> > > > > > > > > > > > >
> > > > > > > > > > > > I will trace the packet and get back.
> > > > > > > > > > > > The bond is over 2 physical ports part of the Intel=
 NIC card. Those are-
> > > > > > > > > > > > b3:00.0 Ethernet controller: Intel Corporation 8259=
9ES 10-Gigabit
> > > > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > > > > b3:00.1 Ethernet controller: Intel Corporation 8259=
9ES 10-Gigabit
> > > > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > > > >
> > > > > > > > > > > > Bonding algo is 802.3ad
> > > > > > > > > > > >
> > > > > > > > > > > > CPU is Intel Xeon Gold 3.40GHz
> > > > > > > > > > > >
> > > > > > > > > > > > NIC Driver
> > > > > > > > > > > > # ethtool -i ens1f0
> > > > > > > > > > > > driver: ixgbe
> > > > > > > > > > > > version: 5.14.0-362.13.1.el9_3
> > > > > > > > > > >
> > > > > > > > > > > Could you please try with the latest kernel 6.7? 5.14=
 is quite old and
> > > > > > > > > > > a lot of things have happened since then.
> > > > > > > > > > >
> > > > > > > > > > I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still =
see the same issue.
> > > > > > > > >
> > > > > > > > > OK, good to know. Have you managed to trace where the pac=
ket is lost?
> > > > > > > > >
> > > > > > > > > > > > Features
> > > > > > > > > > > > # xdp-loader features ens1f0
> > > > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > > > >
> > > > > > > > > > > > CPU is
> > > > > > > > > > > >
> > > > > > > > > > > > Interesting thing is that the bond0 does advertise =
both native and ZC
> > > > > > > > > > > > mode. That's because the features are copied from t=
he slave device.
> > > > > > > > > > > > Which explains why there is no error while binding =
the socket in
> > > > > > > > > > > > native/zero-copy mode.
> > > > > > > > > > >
> > > > > > > > > > > It is probably the intention that if both the bonded =
devices support a
> > > > > > > > > > > feature, then the bonding device will too. I just saw=
 that the bonding
> > > > > > > > > > > device did not implement xsk_wakeup which is used by =
zero-copy, so
> > > > > > > > > > > zero-copy is not really supported so that support sho=
uld not be
> > > > > > > > > > > advertised. The code in AF_XDP tests for zero-copy su=
pport this way:
> > > > > > > > > > >
> > > > > > > > > > > if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D N=
ETDEV_XDP_ACT_ZC) {
> > > > > > > > > > >     err =3D -EOPNOTSUPP;
> > > > > > > > > > >     goto err_unreg_pool;
> > > > > > > > > > > }
> > > > > > > > > > >
> > > > > > > > > > > So there are some things needed in the bonding driver=
 to make
> > > > > > > > > > > zero-copy work. Might not be much though. But your pr=
oblem is with
> > > > > > > > > > > XDP_DRV and copy mode, so let us start there.
> > > > > > > > > > >
> > > > > > > > > > > > void bond_xdp_set_features(struct net_device *bond_=
dev)
> > > > > > > > > > > > {
> > > > > > > > > > > > ..
> > > > > > > > > > > >     bond_for_each_slave(bond, slave, iter)
> > > > > > > > > > > >         val &=3D slave->dev->xdp_features;
> > > > > > > > > > > >     xdp_set_features_flag(bond_dev, val);
> > > > > > > > > > > > }
> > > > > > > > > > > >
> > > > > > > > > > > > # ../xdp-loader/xdp-loader features bond0
> > > > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > > > >
> > > > > > > > > > > > > > Another thing I notice is that other XDP progra=
ms attached to bond
> > > > > > > > > > > > > > interface with targets like DROP, REDIRECT to o=
ther interface works
> > > > > > > > > > > > > > and perform better than AF_XDP (skb) based. Doe=
s this mean that these
> > > > > > > > > > > > > > are not allocating skb?
> > > > > > > > > > > > >
> > > > > > > > > > > > > I am not surprised that AF_XDP in copy is slower =
than XDP_REDIRECT.
> > > > > > > > > > > > > The packet has to be copied out to user-space the=
n copied into the
> > > > > > > > > > > > > kernel again, something that is not needed in the=
 XDP_REDIRECT case.
> > > > > > > > > > > > > If you were using zero-copy, on the other hand, i=
t would be faster
> > > > > > > > > > > > > with AF_XDP. But the bonding interface does not s=
upport zero-copy, so
> > > > > > > > > > > > > not an option.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Just to put forth the pps numbers with the above me=
ntioned single port
> > > > > > > > > > > > in different modes and a comparison to the bond int=
erface.
> > > > > > > > > > > > Test is using pktgen pumping 64 byte packets on a s=
ingle flow.
> > > > > > > > > > > >
> > > > > > > > > > > > Single AF_XDP sock on a single NIC queue-
> > > > > > > > > > > >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock=
   Command
> > > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90
> > > > > > > > > > > >   ZC                            14M      65%       =
 35%
> > > > > > > > > > > > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> > > > > > > > > > > >   XDP_DRV/COPY     10M     100%       23%          =
      ./xdpsock -r
> > > > > > > > > > > > -i ens1f0 -q 5 -p -n 1 -N -c
> > > > > > > > > > > >   SKB_MODE            2.2M     100%       62%      =
          ./xdpsock
> > > > > > > > > > > > -r -i ens1f0 -q 5 -p -n 1 -S
> > > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > > > In the above tests when using ZC and XDP_DRV/COPY, =
is this SI usage as
> > > > > > > > > > > > expected? Especially in ZC mode. Is it majorly beca=
use of the BPF
> > > > > > > > > > > > program running in non-HW offloaded mode? Don't hav=
e a NIC which can
> > > > > > > > > > > > run BPF in offloaded mode so I cannot compare it.
> > > > > > > > > > >
> > > > > > > > > > > I get about 25 - 30 Mpps at 100% CPU load on my syste=
m, but I have a
> > > > > > > > > > > 100G card and you are maxing out your 10G card at 65%=
 and 14M. So yes,
> > > > > > > > > > > sounds reasonable. HW offload cannot be used with AF_=
XDP. You need to
> > > > > > > > > > > do the redirect in the CPU for it to work. If you wan=
t to know where
> > > > > > > > > > > time is spent use "perf top". The biggest chunk of ti=
me is spent in
> > > > > > > > > > > the XDP_REDIRECT operation, but there are many other =
time thiefs too.
> > > > > > > > > > >
> > > > > > > > > > > > The XDP_DROP target using xdp-bench tool (from xdp-=
tools) on the same NIC port-
> > > > > > > > > > > >   xdp-bench                PPS       CPU-SI*   Comm=
and
> > > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > > > >   drop, no-touch         14M           41%      ./x=
dp-bench drop -p
> > > > > > > > > > > > no-touch ens1f0 -e
> > > > > > > > > > > >   drop, read-data        14M           55%      ./x=
dp-bench drop -p
> > > > > > > > > > > > read-data ens1f0 -e
> > > > > > > > > > > >   drop, parse-ip          14M           58%      ./=
xdp-bench drop -p
> > > > > > > > > > > > parse-ip ens1f0 -e
> > > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > > >
> > > > > > > > > > > > The similar tests on bond interface (above mentione=
d 2 ports bonded)-
> > > > > > > > > > > >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   =
Command
> > > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90
> > > > > > > > > > > >   ZC                           X         X         =
     X
> > > > > > > > > > > >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> > > > > > > > > > > >   XDP_DRV/COPY    X         X              X
> > > > > > > > > > > > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> > > > > > > > > > > >   SKB_MODE            2M      100%        55%      =
        ./xdpsock
> > > > > > > > > > > > -r -i bond0 -q 0 -p -n 1 -S
> > > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > > >
> > > > > > > > > > > >   xdp-bench            PPS     CPU-SI*   Command
> > > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > > > >   drop, no-touch     10.9M    33%         ./xdp-ben=
ch drop -p no-touch
> > > > > > > > > > > > bond0 -e
> > > > > > > > > > > >   drop, read-data    10.9M    44%         ./xdp-ben=
ch drop -p
> > > > > > > > > > > > read-data bond0 -e
> > > > > > > > > > > >   drop, parse-ip       10.9M   47%         ./xdp-be=
nch drop -p
> > > > > > > > > > > > parse-ip bond0 -e
> > > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > > Kindly share your thoughts and advice.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > Prashant
> > > > > > > > > > > > > >

