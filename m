Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72414193F38
	for <lists+xdp-newbies@lfdr.de>; Thu, 26 Mar 2020 13:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgCZMsc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 26 Mar 2020 08:48:32 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:41793 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgCZMsc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 26 Mar 2020 08:48:32 -0400
Received: by mail-ua1-f50.google.com with SMTP id f9so2046622uaq.8
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Mar 2020 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+rT/7r9/tZ4cH4rM4s/uXRaonu1Wc1MLBa3UYc2ULE4=;
        b=MWdLD+hi73jdaAfdaNzgvxsXXnttAYTuZM4j2NO8afvmvidUwRnqPc6sTcSkDYlxRX
         CfSa470cjRodz9IOTbzeX60uAom0QQZlbRAqav8Aavqf85X9fl5RffnZ6BXQrJ60Nc9j
         kN3kHl351gVo4MB0NZ+K4NyRE6rZzYTxLwVIu88VNdr++PP1rs9kjwpzepi91lbaiwBo
         QzJxcnpmGFuRYy7R5h6J11bXdvvIRUMKH5jBDhxRBQjj3Om52UAMljWb6uFV9zZI02kT
         pn9JX7zfAiSlwBK1y4UoRCPuigQknw3wJ4s0zBzMzlTWaeKXsnX4WXsamhfaswDp49xs
         goWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+rT/7r9/tZ4cH4rM4s/uXRaonu1Wc1MLBa3UYc2ULE4=;
        b=r5+xqp0Cvocs74+8Tzkm7oyX6r1v+e/1mrkkle5UU9s13VBp6uogaYJa+WkdWpyFy7
         Gesp+Tdv1aNY/A/oHzEslci09DApzxUjBw5pWH8ydTkBMly0NJsk7Rj2Lrpy0OhaqHZe
         bEED4NpIM9sM2ZncrUY4Dr86/ejtIihMM4HYJo6DzAtcplWO3ygRsaS6o+YfBRDM0tTy
         2i3OZN5a4d+cUsdSNVk+G5mZL915Bfh9sZ0ZS34ONpdMTDfaTFRcLQ4snsPfw0WOP7I5
         FnZ4TvjOer14uBuhonxGlc2nUNRTPegTyNn8s+IWObB5BPxWbMTVe0IX+HgZ3O4PaQJh
         vHZA==
X-Gm-Message-State: ANhLgQ1FpG2dZbwP3aesfy3Pfeguufx/dUuccLatok4TK10mD7iCdHxA
        4/3HqbPFzXzjNxXVFLNYhJQ7WWOigd4RDu+f51g=
X-Google-Smtp-Source: ADFU+vvI6OfPl9uORW/g/VE21VSA8DoAwLNlt5d/oBD04dDGDOGzH7UNArz97U0Tyk5A+m8Jv+xeZfStXH2XVMYrs+A=
X-Received: by 2002:ab0:e5:: with SMTP id 92mr5949069uaj.83.1585226910704;
 Thu, 26 Mar 2020 05:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <018e8071725b48399141cc46b63641e1@hm.edu> <CAJ8uoz1Vh+zj6msumTNWgtZY6jdOeYgoyDBoizfna1dzhC465A@mail.gmail.com>
 <9616cd5986c74058b51ffd1eb3311b85@hm.edu> <CAJ8uoz1-Nub4RKembg5maQ4Cj1J+O90eR_PcP41yNHuq7pShaQ@mail.gmail.com>
 <35eed7a7481a44bc93e8e5f7e59d9e5a@hm.edu> <CAJ8uoz3D=nw_aD0+Kj9Mh_DivRBvse0+G0Mtfw+eR8UJdDT0jw@mail.gmail.com>
 <883111619d9e429fb5f1fb239afdb478@hm.edu> <CAJ8uoz2OZOrERz3D+L9fe-WhYAHOZOd_ZOzYjUTKwyZ1ic7AaA@mail.gmail.com>
 <b4e8bdfd96d8484d904b6b91ece81324@hm.edu>
In-Reply-To: <b4e8bdfd96d8484d904b6b91ece81324@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 26 Mar 2020 13:48:19 +0100
Message-ID: <CAJ8uoz2bPr6=2-amO209kuRU7o=JuzfXspn2WtCQ6NmRUYKh8w@mail.gmail.com>
Subject: Re: Shared Umem and reducing ksoftirqd-Load
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Mar 26, 2020 at 1:30 PM Gaul, Maximilian <maximilian.gaul@hm.edu> w=
rote:
>
> On Wed, Mar 25, 2020 at 14:36 AM Karlsson, Magnus
> magnus.karlsson@gmail.com> wrote:
>
> > On Wed, Mar 25, 2020 at 1:40 PM Gaul, Maximilian <maximilian.gaul@hm.ed=
u> wrote:
> > >
> > > On Wed, Mar 25, 2020 at 12:04 AM Karlsson, Magnus
> > > magnus.karlsson@gmail.com> wrote:
> > >
> > > > On Wed, Mar 25, 2020 at 11:45 AM Gaul, Maximilian
> > > > <maximilian.gaul@hm.edu> wrote:
> > > > >
> > > > > On Wed, Mar 25, 2020 at 11:24 AM Karlsson, Magnus
> > > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > > On Wed, Mar 25, 2020 at 11:02 AM Gaul, Maximilian
> > > > > > <maximilian.gaul@hm.edu> wrote:
> > > > > > >
> > > > > > > On Wed, Mar 25, 2020 at 10:41 AM Karlsson, Magnus
> > > > > > > <magnus.karlsson@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Wed, Mar 25, 2020 at 10:04 AM Gaul, Maximilian
> > > > > > > > <maximilian.gaul@hm.edu> wrote:
> > > > > > > > >
> > > > > > > > > I am running a Multi-AF-XDP-Socket approach per RX-Queue =
(using Shared Umem).
> > > > > > > > >
> > > > > > > > > Unfortunately I am noticing, that at around 650k pps, the=
 *ksoftirqd*-thread of that RX-Queue ramps up to 100% thus leading to packe=
t loss.
> > > > > > > > > I tried setting *XDP_USE_NEED_WAKEUP* on *xsk_socket_cfg.=
bind_flags* but those bind_flags are only taken into account if *umem->refc=
ount > 1* (libbpf/xsk.c - xsk_socket__create()).
> > > > > > > > > As far as I understand this correctly, only the first soc=
ket is able to set *XDP_USE_NEED_WAKEUP* because for all sockets after, *um=
em->refcount* is going to be at least 2.
> > > > > > > >
> > > > > > > > Yes, the other sockets just inherit the settings of the fir=
st one.
> > > > > > > >
> > > > > > > > Are you using the SKB mode? What is your packet size? Sound=
s like a
> > > > > > > > low number unless you have large packets and are using the =
SKB mode.
> > > > > > > >
> > > > > > >
> > > > > > > These are the flags I set right before calling `xsk_socket__c=
reate`:
> > > > > > >
> > > > > > >         xsk_socket_cfg.xdp_flags =3D cfg->xdp_flags | XDP_FLA=
GS_DRV_MODE | XDP_ZEROCOPY;
> > > > > > >         xsk_socket_cfg.bind_flags =3D cfg->xsk_bind_flags | X=
DP_USE_NEED_WAKEUP;
> > > > > >
> > > > > > XDP_ZEROCOPY is a bind flag not an XDP flag, so please move it =
there.
> > > > > > If you get an error when you have it set, it means that your se=
tup
> > > > > > does not support zero-copy for some reason. Check what kernel v=
ersion
> > > > > > you are using and the the driver you are using supports zero-co=
py. I
> > > > > > believe you need to use a queue id>=3D32 in the Mellanox driver=
 for it
> > > > > > to work in zero-copy mode. Below 32, you will get copy mode.
> > > > > >
> > > > > > > Packet size is around 1492 bytes.
> > > > > >
> > > > > > Seems that you are using SKB mode then, not zero-copy.
> > > > > >
> > > > > > /Magnus
> > > > > >
> > > > >
> > > > > Thank you for the hint. As you correctly said, I get an error if =
I use *XDP_ZEROCOPY*. But as far as I understand, packet rates should be hi=
gher in Driver-Mode even without zero-copy?
> > > >
> > > > Yes, I would expect that too.
> > > >
> > > > > I just updated to the latest driver- and firmware version:
> > > > >
> > > > >         $ sudo ethtool -i <if>
> > > > >         driver: mlx5_core
> > > > >         version: 5.0-0
> > > > >         firmware-version: 16.27.1016 (MT_0000000012)
> > > >
> > > > What kernel version are you using? And you should use the driver fr=
om
> > > > that same kernel.
> > > >
> > >
> > > I am using
> > >
> > >         $ uname -a
> > >         Linux 5.4.0-4-amd64 #1 SMP Debian 5.4.19-1 (2020-02-13) x86_6=
4 GNU/Linux
> > >
> > > At the moment, Mellanox only supports Debian until version 10.0 (http=
s://www.mellanox.com/products/infiniband-drivers/linux/mlnx_ofed) which is =
Kernel 4.19.
> > > But because in Kernel 4.19, not all AF-XDP features are available, I =
had to upgrade. I was not sure which Kernel-Version would be the minimum in=
 order to be able to use AF-XDP completely so I went with 5.4.
> > > Installation was successfull  (with *--skip-distro-check*) so I thoug=
ht this should work?
> >
> > You better contact somebody from Mellanox for this info. I do not
> > know. But Mellanox has zero-copy support in kernel 5.4.
> >
> > > > > I actually have to correct myself: Incomming packets are 1442 byt=
es.
> > > > > Can you give me the link between packet size and whether the NIC =
is running in SKB or DRV mode?
> > > >
> > > > Sorry, do not understand this. Could you please elaborate?
> > > >
> > >
> > > You answered to my reply that packets are 1492 bytes "Seems that you =
are using SKB mode then, not zero-copy." so because of this I thought there=
 is a relation between packet size and SKB mode?
> >
> > There is no relationship between SKB mode and packet size. They are
> > orthogonal. Though there is a relationship between packet size and
> > performance and of course SKB mode vs zero-copy mode and performance.
> >
> > > > > Mr. Brouer held a talk about (https://people.netfilter.org/hawk/p=
resentations/driving-IT2017/driving-IT-2017_XDP_eBPF_technology_Jesper_Brou=
er.pdf)   about XDP, mentioning in slide 11/27 that *mlx5 (v4.9)* has nativ=
e XDP support.
> > > >
> > > > Yes, but only if you use queue id>=3D 32. What queue id are you bin=
ding to?
> > > >
> > >
> > > Usually it is queue 0 but I also tried queue 32 and queue 36 - but th=
at didn't change anything on the behavior.
> >
> > It should make a difference, if I remember correctly, but somebody
> > from Mellanox certainly knows better. Try sending a mail to Maxim who
> > wrote the Mellanox driver support. Maxim Mikityanskiy
> > <maximmi@mellanox.com>.
> >
> > /Magnus
> >
>
> Thank you!
> Just one more question regarding *ksoftirqd*-load. This paper seems to ta=
lk about the mentioned issue: http://vger.kernel.org/lpc_net2018_talks/lpc1=
8_paper_af_xdp_perf-v2.pdf that *ksoftirqd* is producing high load. A state=
d solution to this problem would be *busy polling*. I am not sure if *busy =
polling* is something I have to assign via *setsockopt* in my userspace pro=
gram or if this already taken care of by libbpf?
> Nevertheless, I tried it like this:
>
>                 $ cat /boot/config-5.4.0-4-amd64 | grep "CONFIG_NET_RX_BU=
SY_POLL"
>                 CONFIG_NET_RX_BUSY_POLL=3Dy
>
>                 $ sysctl net.core.busy_poll=3D50
>
> and in my user-space program:
>
>                 int busy_poll_usec =3D 50;
>                 if(setsockopt(xsk_socket__fd(xsk_sockets[i]->xsk), SOL_SO=
CKET, SO_BUSY_POLL, (char *)&busy_poll_usec, sizeof(busy_poll_usec)) < 0) {
>                         fprintf(stderr, "Failed to set `SO_BUSY_POLL`: %s=
\n", strerror(errno));
>                         break;
>                 }
>
>                 /* some code inbetween */
>
>                 while(!global_exit) {
>                         const int ret =3D poll(fds, fd_count, 2);
>                         if (ret <=3D 0) {
>                                 continue;
>                         }
>
>                         for(int i =3D 0; i < fd_count; i++) {
>                                 struct xsk_socket_info *socket =3D xsk_so=
ckets[i];
>                                 if(atomic_exchange(&socket->stats_sync.lo=
ck, 1) =3D=3D 0) {
>                                         handle_receive_packets(socket);
>                                         atomic_fetch_xor(&socket->stats_s=
ync.lock, 1); /* release socket-lock */
>                                 }
>                         }
>                 }
>
> but this only has the effect that my userspace program is now at 50% load=
 (previously around 13%) with *ksoftirqd* still running at 100% (and even w=
orse pps).
> Is this the expected effect on what I did?

Busy-polling will improve your latency (throughput might go either
way) at the cost of higher CPU load. Note that busy-polling is NOT
supported with AF_XDP. I sent out an RFC for this a year ago but ended
up implementing something else (the need_wakeup flag) that solved the
problem I had in in a better way. But it would still be beneficial to
support busy-poll for AF_XDP, but I am not working on it or planning
on doing it.

/Magnus

> > > > /Magnus
> > > >
> > > > >
> > > > > > > Just to make sure: Those 650k packets are arriving on the sam=
e RX-Queue (even though this NIC has multiple RX-Queues I want to test maxi=
mum bandwith for a single RX-Queue).
> > > > > > >
> > > > > > > > > I didn't observe a dramatic change as I've hoped to. Are =
there some other ways to reduce interrupt load (user-space application and =
ksoftirq are already running on different CPUs)?
> > > > > > > >
> > > > > > > > The need_wakeup flag has a big impact when you run the soft=
irq and the
> > > > > > > > application thread on the same core. When using two cores f=
or this, it
> > > > > > > > has less of an impact.
> > > > > > > >
> > > > > > > > /Magnus
> > > > > > > >
> > > > > > > > > NIC: Mellanox Technologies MT27800
> > > > > > > > >
> > > > > > > > > Best regards
> > > > > > > > >
> > > > > > > > > Max
> > > > > > > > >
> > > > > > >
> > > > >
