Return-Path: <xdp-newbies+bounces-33-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449C8300A5
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jan 2024 08:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1B4B25009
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jan 2024 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3A6C133;
	Wed, 17 Jan 2024 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWa2l3L+"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3979C121
	for <xdp-newbies@vger.kernel.org>; Wed, 17 Jan 2024 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705477289; cv=none; b=eE3FTY/ZjShCzL9NZvizY2cJNY9IWGRWO4pAviQHIixyWaBZshqhd1nUga4qceNGY0evC6N14krXJoSqgvCixzHgCf+lX/60zsYLojJnXhuHldCCmSHC3Xytw3IV1sl04Osx6jjiCFnqwAwganL55He2wUxsbnlCxAiHWlRj+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705477289; c=relaxed/simple;
	bh=h24YhIKzw5SUpT6u1qu+Z3OqinWHOCUJKQtVQipUcog=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=by833P7Ne0CCRvP+FAOx/ahFAifw/M6a9gGSTFV4LdQBX40+hZeOvdRtoMIJnRb6flXDSjWq4Kn9yx68h22wtWSrw7W2JvL98iVt9o3nYtjGC4RLcLaH7OOZkklC2cMRucOUaxMg0GJEfQooHFloDynHJc16fSmKnlpdN8eicFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWa2l3L+; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68180b48d21so102506d6.1
        for <xdp-newbies@vger.kernel.org>; Tue, 16 Jan 2024 23:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705477285; x=1706082085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tabu0akzfW3E5GXnGW4yqZPsn/UxpMZICL5xJU2VDUs=;
        b=QWa2l3L+mn2dZQbpVPn8z29+zJczxboK2+1NtK+m1sUs6Z15eJSLJ/LuJBNeja8Se1
         ha+8cXJBLPTAKssUnB/5SFXCnr5NdXZhWe2R3z9fFpvWoCVFln4VDYR4mTWh0ARrPMHI
         XV7ZeWWwo5+HudjG2KuNIXFbBFqoaapxFzndxVGVfPSKCWoI1813098+ywFWFudoKKJS
         Xp2BWTR/n1dmXIFyKjcViNBkOFXbszVGiB2hHTKSCsPnepvCwkMsRsVQOhFFBlbxW66/
         UAMlxqxAZ5+txgS9Ciwr69YIwzH08+gh6L0cBa5ZF7nygThOXQRnJ0m1yZ8pmSUvi9Am
         tO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705477285; x=1706082085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tabu0akzfW3E5GXnGW4yqZPsn/UxpMZICL5xJU2VDUs=;
        b=uPt3nf2/kgE1RSjt2BCdj1ygnLtQ1u1ea3T2zr3Z1uW+0ovrrFqVrR4iQBClxrPoQ8
         aybcr9X9x98m049jtfUhUK1ysEEk0rC7/85KQ99OIAll4uMDeuyYzc5Eo6s9Dl6RMnAN
         sQQI5K34CQjQJphtfdJdZoH4ZTdqju+UPKXZsq30JqkrUZg6iOVJEbDLHmIHda2JKxls
         gawzrMSPhsIfqkLw+Qu6WIEWfbjjwNxUaH5Gg4CufrvX+aVJdy+0nlyEZK0j++AzXIPK
         mMokmEk9VJxWU17yjZ6YDZUrI9H6GQG6884TB6jeGs47YpREAm+oEl5n8FlPHK6U7AYK
         r8Ig==
X-Gm-Message-State: AOJu0YwA0zIB5EAEhrI//FGJ1RmzOzhui5n5IC1WfMxpFjriponqyYO0
	ic16wbqfLktapT8Ol9KmZZMXOcHxatPqo6hsJXrx/tdv
X-Google-Smtp-Source: AGHT+IEF5z8guXtcbGGrb/ylJH2mB9yFlXx6q2y2D/pS9UO1y0ef3jrW029sQ2a7d23fFsFBZmk230n88tD6pZ/gF7w=
X-Received: by 2002:a0c:ec09:0:b0:681:5533:213 with SMTP id
 y9-20020a0cec09000000b0068155330213mr11786224qvo.2.1705477285449; Tue, 16 Jan
 2024 23:41:25 -0800 (PST)
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
 <CAJ8uoz2JvwUp54mUAKdvHtP8FsxZ2Zw0e8FxwNFMPRwQ8P=oxQ@mail.gmail.com> <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com>
In-Reply-To: <CAAAYKZP808XtUNOwRs4x0K8jfSMUfEoASoSzeSzbfAV_sHeQLQ@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 17 Jan 2024 08:41:14 +0100
Message-ID: <CAJ8uoz2S5qkbD6odkV=Y8EHijsn5jyU01-6a8pv19eFE3=o1uA@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Prashant Batra <prbatra.mail@gmail.com>
Cc: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jan 2024 at 07:07, Prashant Batra <prbatra.mail@gmail.com> wrote=
:
>
> On Tue, Jan 16, 2024 at 6:29=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Tue, 16 Jan 2024 at 13:48, Prashant Batra <prbatra.mail@gmail.com> w=
rote:
> > >
> > > On Mon, Jan 15, 2024 at 2:52=E2=80=AFPM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Thu, 11 Jan 2024 at 11:41, Prashant Batra <prbatra.mail@gmail.co=
m> wrote:
> > > > >
> > > > > On Tue, Jan 2, 2024 at 3:27=E2=80=AFPM Magnus Karlsson
> > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, 22 Dec 2023 at 12:23, Prashant Batra <prbatra.mail@gmai=
l.com> wrote:
> > > > > > >
> > > > > > > Yes, I found the place where the packet is getting dropped. T=
he check
> > > > > > > for device match b/w xs and xdp->rxq is failing in xsk_rcv_ch=
eck() .
> > > > > > > The device in xs is the bond device whereas the one in xdp->r=
xq is the
> > > > > > > slave device on which the packet is received and the xdp prog=
ram is
> > > > > > > being invoked from.
> > > > > > >
> > > > > > > static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff=
 *xdp)
> > > > > > > {
> > > > > > > --
> > > > > > >     if (xs->dev !=3D xdp->rxq->dev || xs->queue_id !=3D xdp->=
rxq->queue_index)
> > > > > > >         return -EINVAL;
> > > > > > > --
> > > > > > > }
> > > > > >
> > > > > > I am now back from the holidays.
> > > > > >
> > > > > > Perfect! Thank you for finding the root cause. I will rope in M=
aciej
> > > > > > and we will get back to you with a solution proposal.
> > > > > >
> > > > > Thanks, will wait for your solution.
> > > >
> > > > FYI, I do not have a good solution for this yet. The one I have is =
too
> > > > complicated for my taste. I might have to take this to the list to =
get
> > > > some new ideas on how to tackle it. So this will take longer than
> > > > anticipated.
> > > >
> > > Just to add that the AF_XDP TX in native mode is also not performing
> > > well. I am getting around 2Mpps in native mode.
> >
> > That is expected though. There are only two modes for Tx: SKB mode and
> > zero-copy mode, and since there is no zero-copy support for the
> > bonding driver, it will revert to skb mode. I would expect around 3
> > Mpps for Tx in skb mode, so 2 Mpps seems reasonable as the bonding
> > driver adds overhead.
> >
> > For Rx there are 3 modes: skb, XDP_DRV (which is the one you are
> > getting with the -N switch) and zero-copy (that is not supported by
> > the bonding driver).
> >
> Thanks for quick info. So, when you provide the fix for the bond
> driver, can we expect the bond-driver to be able to support ZC in the
> Tx mode (and Rx mode) or will the Tx remain in SKB mode? At 2M pps,
> it's a big gap in Rx and Tx and practically leaves xdp not much useful
> with bond devices.

Personally, I do not have the time right now to implement ZC for the
bonding driver. Once I have posted the fix (coding it up right now),
send a mail to the netdev mailing list with the bonding maintainers on
the to-line and state that you are interested in this functionality
and ask if there are any other people interested in it. Or maybe you
would like to implement it :-)?

> I also see a gap in Rx vs Tx for veth drivers-
> In this below topology, I see AF_XDP TX to a veth device (veth1) is
> not going beyond 1.2Mpps, The xdp program on veth2 redirects packet to
> phy device ens1f0. I would assume based on your explanation above,
> that this too is working in SKB mode, and hence the lower performance.
> veth1 (AF_XDP Tx) -> veth2 (xdp) -> ens1f0

Correct. There is no zero-copy for veth either.

> However in the reverse direction shown below, I can receive close to
> 5M pps on AF_XDP socket.
> ens1f0 (xdp) ->veth2 -> veth1 (AF_XDP Rx)

Yes, since it is using XDP_DRV mode without zero-copy.

> Looking at the results here-
> https://patchwork.ozlabs.org/project/netdev/cover/1533283098-2397-1-git-s=
end-email-makita.toshiaki@lab.ntt.co.jp/
> , I don't seem to find the benchmark which would validate my AF_XDP Rx
> and Tx results with veth devices. The xdp DROP test results do match
> with my tests though.

Your numbers look reasonable. Just note that veth is not fast. If you
want to have a faster veth, you might want to take a look at the new
netkit device.

> > >  # ./xdpsock -t -i bond0 -N -G 0c:c4:7a:bd:13:b2 -H 0c:c4:7a:b7:5f:6c
> > >  sock0@bond0:0 txonly xdp-drv
> > >
> > >                    pps            pkts           1.00
> > > rx                 0              0
> > > tx                 2,520,587      2,521,152
> > >
> > >  sock0@bond0:0 txonly xdp-drv
> > >                    pps            pkts           1.00
> > > rx                 0              0
> > > tx                 2,362,740      4,884,352
> > >
> > >  sock0@bond0:0 txonly xdp-drv
> > >                    pps            pkts           1.00
> > > rx                 0              0
> > > tx                 1,814,437      6,698,944
> > >
> > >  sock0@bond0:0 txonly xdp-drv
> > >                    pps            pkts           1.00
> > > rx                 0              0
> > > tx                 1,817,913      8,517,120
> > >
> > > # xdp-loader status bond0
> > > CURRENT XDP PROGRAM STATUS:
> > >
> > > Interface        Prio  Program name      Mode     ID   Tag
> > >   Chain actions
> > > ---------------------------------------------------------------------=
-----------------
> > > bond0                  xdp_dispatcher    native   671  90f686eb869919=
28
> > >  =3D>              20     xsk_def_prog              680
> > > 8f9c40757cb0a6a2  XDP_PASS
> > >
> > > > > > > Here is the perf backtrace for the xdp_redirect_err event.
> > > > > > > ksoftirqd/0    14 [000] 10956.235960: xdp:xdp_redirect_err: p=
rog_id=3D69
> > > > > > > action=3DREDIRECT ifindex=3D5 to_ifindex=3D0 err=3D-22 map_id=
=3D19 map_index=3D5
> > > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff873dcbf4 xdp_do_redirect+0x3b4
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffffc05d0f0f ixgbe_run_xdp+0x10f
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/et=
hernet/intel/ixgbe/ixgbe.ko)
> > > > > > >         ffffffffc05d297a ixgbe_clean_rx_irq+0x51a
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/et=
hernet/intel/ixgbe/ixgbe.ko)
> > > > > > >         ffffffffc05d2da0 ixgbe_poll+0xf0
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/kernel/drivers/net/et=
hernet/intel/ixgbe/ixgbe.ko)
> > > > > > >         ffffffff873afad7 __napi_poll+0x27
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff873affd3 net_rx_action+0x233
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff8762ae27 __do_softirq+0xc7
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff86b04cfe run_ksoftirqd+0x1e
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff86b33d83 smpboot_thread_fn+0xd3
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff86b2956d kthread+0xdd
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >         ffffffff86a02289 ret_from_fork+0x29
> > > > > > > (/lib/modules/5.14.0-362.13.1.el9_3_asn/build/vmlinux)
> > > > > > >
> > > > > > > I am curious why the xdp program is invoked from the ixgbe dr=
iver
> > > > > > > (running for slave device) when the xdp program is actually a=
ttached
> > > > > > > to the bond device? Is this by design?
> > > > > > > # xdp-loader status bond0
> > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > >   Chain actions
> > > > > > > -------------------------------------------------------------=
-------------------------
> > > > > > > bond0                  xdp_dispatcher    native   64   90f686=
eb86991928
> > > > > > >  =3D>              20     xsk_def_prog              73
> > > > > > > 8f9c40757cb0a6a2  XDP_PASS
> > > > > > >
> > > > > > > # xdp-loader status ens1f0
> > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > >   Chain actions
> > > > > > > -------------------------------------------------------------=
-------------------------
> > > > > > > ens1f0                 <No XDP program loaded!>
> > > > > > >
> > > > > > > # xdp-loader status ens1f1
> > > > > > > CURRENT XDP PROGRAM STATUS:
> > > > > > > Interface        Prio  Program name      Mode     ID   Tag
> > > > > > >   Chain actions
> > > > > > > -------------------------------------------------------------=
-------------------------
> > > > > > > ens1f1                 <No XDP program loaded!>
> > > > > > >
> > > > > > > Now, if I skip the device check in xsk_rcv_check(), I can see=
 the
> > > > > > > packets being received in the AF_XDP socket in the driver mod=
e.
> > > > > > >  # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N
> > > > > > >  sock0@bond0:5 rxdrop xdp-drv poll()
> > > > > > >                    pps            pkts           1.00
> > > > > > > rx                10,126,924     1,984,092,501
> > > > > > > tx                 0              0
> > > > > > >
> > > > > > > I am sure we would not want to skip the device check generall=
y
> > > > > > > especially for non-bonded devices, etc. Please guide on how t=
o take
> > > > > > > this further and get the issue fixed in the mainline.
> > > > > > >
> > > > > > > The ZC mode doesn't work. Mostly because of the problem you h=
ad
> > > > > > > pointed out before.
> > > > > > > # ./xdpsock -r -i bond0 -q 5 -p -n 1 -N -z
> > > > > > > xdpsock.c:xsk_configure_socket:1068: errno: 22/"Invalid argum=
ent"
> > > > > > >
> > > > > > >
> > > > > > > On Thu, Dec 21, 2023 at 7:16=E2=80=AFPM Magnus Karlsson
> > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, 21 Dec 2023 at 13:39, Prashant Batra <prbatra.mail@=
gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Dec 20, 2023 at 1:54=E2=80=AFPM Magnus Karlsson
> > > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, 19 Dec 2023 at 21:18, Prashant Batra <prbatra.m=
ail@gmail.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Thanks for your response. My comments inline.
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Dec 19, 2023 at 7:17=E2=80=AFPM Magnus Karlss=
on
> > > > > > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbat=
ra.mail@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > >
> > > > > > > > > > > > > I am new to XDP and exploring it's working with d=
ifferent interface
> > > > > > > > > > > > > types supported in linux. One of my use cases is =
to be able to receive
> > > > > > > > > > > > > packets from the bond interface.
> > > > > > > > > > > > > I used xdpsock sample program specifying the bond=
 interface as the
> > > > > > > > > > > > > input interface. However the packets received on =
the bond interface
> > > > > > > > > > > > > are not handed over to the socket by the kernel i=
f the socket is bound
> > > > > > > > > > > > > in native mode. The packets are neither being pas=
sed to the kernel.
> > > > > > > > > > > > > Note that the socket creation does succeed.
> > > > > > > > > > > > > In skb mode this works and I am able to receive p=
ackets in the
> > > > > > > > > > > > > userspace. But in skb mode as expected the perfor=
mance is not that
> > > > > > > > > > > > > great.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Is AF_XDP sockets on bond not supported in native=
 mode? Or since the
> > > > > > > > > > > > > packet has be to be handed over to the bond drive=
r post reception on
> > > > > > > > > > > > > the phy port, a skb allocation and copy to it is =
indeed a must?
> > > > > > > > > > > >
> > > > > > > > > > > > I have never tried a bonding interface with AF_XDP,=
 so it might not
> > > > > > > > > > > > work. Can you trace the packet to see where it is b=
eing dropped in
> > > > > > > > > > > > native mode? There are no modifications needed to a=
n XDP_REDIRECT
> > > > > > > > > > > > enabled driver to support AF_XDP in XDP_DRV / copy =
mode. What NICs are
> > > > > > > > > > > > you using?
> > > > > > > > > > > >
> > > > > > > > > > > I will trace the packet and get back.
> > > > > > > > > > > The bond is over 2 physical ports part of the Intel N=
IC card. Those are-
> > > > > > > > > > > b3:00.0 Ethernet controller: Intel Corporation 82599E=
S 10-Gigabit
> > > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > > > b3:00.1 Ethernet controller: Intel Corporation 82599E=
S 10-Gigabit
> > > > > > > > > > > SFI/SFP+ Network Connection (rev 01)
> > > > > > > > > > >
> > > > > > > > > > > Bonding algo is 802.3ad
> > > > > > > > > > >
> > > > > > > > > > > CPU is Intel Xeon Gold 3.40GHz
> > > > > > > > > > >
> > > > > > > > > > > NIC Driver
> > > > > > > > > > > # ethtool -i ens1f0
> > > > > > > > > > > driver: ixgbe
> > > > > > > > > > > version: 5.14.0-362.13.1.el9_3
> > > > > > > > > >
> > > > > > > > > > Could you please try with the latest kernel 6.7? 5.14 i=
s quite old and
> > > > > > > > > > a lot of things have happened since then.
> > > > > > > > > >
> > > > > > > > > I tried with kernel 6.6.8-1.el9.elrepo.x86_64. I still se=
e the same issue.
> > > > > > > >
> > > > > > > > OK, good to know. Have you managed to trace where the packe=
t is lost?
> > > > > > > >
> > > > > > > > > > > Features
> > > > > > > > > > > # xdp-loader features ens1f0
> > > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > > >
> > > > > > > > > > > CPU is
> > > > > > > > > > >
> > > > > > > > > > > Interesting thing is that the bond0 does advertise bo=
th native and ZC
> > > > > > > > > > > mode. That's because the features are copied from the=
 slave device.
> > > > > > > > > > > Which explains why there is no error while binding th=
e socket in
> > > > > > > > > > > native/zero-copy mode.
> > > > > > > > > >
> > > > > > > > > > It is probably the intention that if both the bonded de=
vices support a
> > > > > > > > > > feature, then the bonding device will too. I just saw t=
hat the bonding
> > > > > > > > > > device did not implement xsk_wakeup which is used by ze=
ro-copy, so
> > > > > > > > > > zero-copy is not really supported so that support shoul=
d not be
> > > > > > > > > > advertised. The code in AF_XDP tests for zero-copy supp=
ort this way:
> > > > > > > > > >
> > > > > > > > > > if ((netdev->xdp_features & NETDEV_XDP_ACT_ZC) !=3D NET=
DEV_XDP_ACT_ZC) {
> > > > > > > > > >     err =3D -EOPNOTSUPP;
> > > > > > > > > >     goto err_unreg_pool;
> > > > > > > > > > }
> > > > > > > > > >
> > > > > > > > > > So there are some things needed in the bonding driver t=
o make
> > > > > > > > > > zero-copy work. Might not be much though. But your prob=
lem is with
> > > > > > > > > > XDP_DRV and copy mode, so let us start there.
> > > > > > > > > >
> > > > > > > > > > > void bond_xdp_set_features(struct net_device *bond_de=
v)
> > > > > > > > > > > {
> > > > > > > > > > > ..
> > > > > > > > > > >     bond_for_each_slave(bond, slave, iter)
> > > > > > > > > > >         val &=3D slave->dev->xdp_features;
> > > > > > > > > > >     xdp_set_features_flag(bond_dev, val);
> > > > > > > > > > > }
> > > > > > > > > > >
> > > > > > > > > > > # ../xdp-loader/xdp-loader features bond0
> > > > > > > > > > > NETDEV_XDP_ACT_BASIC:           yes
> > > > > > > > > > > NETDEV_XDP_ACT_REDIRECT:        yes
> > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT:        no
> > > > > > > > > > > NETDEV_XDP_ACT_XSK_ZEROCOPY:    yes
> > > > > > > > > > > NETDEV_XDP_ACT_HW_OFFLOAD:      no
> > > > > > > > > > > NETDEV_XDP_ACT_RX_SG:           no
> > > > > > > > > > > NETDEV_XDP_ACT_NDO_XMIT_SG:     no
> > > > > > > > > > >
> > > > > > > > > > > > > Another thing I notice is that other XDP programs=
 attached to bond
> > > > > > > > > > > > > interface with targets like DROP, REDIRECT to oth=
er interface works
> > > > > > > > > > > > > and perform better than AF_XDP (skb) based. Does =
this mean that these
> > > > > > > > > > > > > are not allocating skb?
> > > > > > > > > > > >
> > > > > > > > > > > > I am not surprised that AF_XDP in copy is slower th=
an XDP_REDIRECT.
> > > > > > > > > > > > The packet has to be copied out to user-space then =
copied into the
> > > > > > > > > > > > kernel again, something that is not needed in the X=
DP_REDIRECT case.
> > > > > > > > > > > > If you were using zero-copy, on the other hand, it =
would be faster
> > > > > > > > > > > > with AF_XDP. But the bonding interface does not sup=
port zero-copy, so
> > > > > > > > > > > > not an option.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Just to put forth the pps numbers with the above ment=
ioned single port
> > > > > > > > > > > in different modes and a comparison to the bond inter=
face.
> > > > > > > > > > > Test is using pktgen pumping 64 byte packets on a sin=
gle flow.
> > > > > > > > > > >
> > > > > > > > > > > Single AF_XDP sock on a single NIC queue-
> > > > > > > > > > >   AF_XDP rxdrop        PPS    CPU-SI*   CPU-xdpsock  =
 Command
> > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90
> > > > > > > > > > >   ZC                            14M      65%        3=
5%
> > > > > > > > > > > ./xdpsock -r -i ens1f0 -q 5 -p -n 1 -N -z
> > > > > > > > > > >   XDP_DRV/COPY     10M     100%       23%            =
    ./xdpsock -r
> > > > > > > > > > > -i ens1f0 -q 5 -p -n 1 -N -c
> > > > > > > > > > >   SKB_MODE            2.2M     100%       62%        =
        ./xdpsock
> > > > > > > > > > > -r -i ens1f0 -q 5 -p -n 1 -S
> > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > > In the above tests when using ZC and XDP_DRV/COPY, is=
 this SI usage as
> > > > > > > > > > > expected? Especially in ZC mode. Is it majorly becaus=
e of the BPF
> > > > > > > > > > > program running in non-HW offloaded mode? Don't have =
a NIC which can
> > > > > > > > > > > run BPF in offloaded mode so I cannot compare it.
> > > > > > > > > >
> > > > > > > > > > I get about 25 - 30 Mpps at 100% CPU load on my system,=
 but I have a
> > > > > > > > > > 100G card and you are maxing out your 10G card at 65% a=
nd 14M. So yes,
> > > > > > > > > > sounds reasonable. HW offload cannot be used with AF_XD=
P. You need to
> > > > > > > > > > do the redirect in the CPU for it to work. If you want =
to know where
> > > > > > > > > > time is spent use "perf top". The biggest chunk of time=
 is spent in
> > > > > > > > > > the XDP_REDIRECT operation, but there are many other ti=
me thiefs too.
> > > > > > > > > >
> > > > > > > > > > > The XDP_DROP target using xdp-bench tool (from xdp-to=
ols) on the same NIC port-
> > > > > > > > > > >   xdp-bench                PPS       CPU-SI*   Comman=
d
> > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > > >   drop, no-touch         14M           41%      ./xdp=
-bench drop -p
> > > > > > > > > > > no-touch ens1f0 -e
> > > > > > > > > > >   drop, read-data        14M           55%      ./xdp=
-bench drop -p
> > > > > > > > > > > read-data ens1f0 -e
> > > > > > > > > > >   drop, parse-ip          14M           58%      ./xd=
p-bench drop -p
> > > > > > > > > > > parse-ip ens1f0 -e
> > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > >
> > > > > > > > > > > The similar tests on bond interface (above mentioned =
2 ports bonded)-
> > > > > > > > > > >  AF_XDP rxdrop       PPS   CPU-SI*   CPU-xdpsock   Co=
mmand
> > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90
> > > > > > > > > > >   ZC                           X         X           =
   X
> > > > > > > > > > >       ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -z
> > > > > > > > > > >   XDP_DRV/COPY    X         X              X
> > > > > > > > > > > ./xdpsock -r -i bond0 -q 0 -p -n 1 -N -c
> > > > > > > > > > >   SKB_MODE            2M      100%        55%        =
      ./xdpsock
> > > > > > > > > > > -r -i bond0 -q 0 -p -n 1 -S
> > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > >
> > > > > > > > > > >   xdp-bench            PPS     CPU-SI*   Command
> > > > > > > > > > >  =E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90
> > > > > > > > > > >   drop, no-touch     10.9M    33%         ./xdp-bench=
 drop -p no-touch
> > > > > > > > > > > bond0 -e
> > > > > > > > > > >   drop, read-data    10.9M    44%         ./xdp-bench=
 drop -p
> > > > > > > > > > > read-data bond0 -e
> > > > > > > > > > >   drop, parse-ip       10.9M   47%         ./xdp-benc=
h drop -p
> > > > > > > > > > > parse-ip bond0 -e
> > > > > > > > > > > * CPU receiving the packet
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > Kindly share your thoughts and advice.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > Prashant
> > > > > > > > > > > > >

