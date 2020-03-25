Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B3C192A10
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Mar 2020 14:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgCYNg2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Mar 2020 09:36:28 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:38456 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgCYNg1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:27 -0400
Received: by mail-vs1-f47.google.com with SMTP id x206so1483201vsx.5
        for <xdp-newbies@vger.kernel.org>; Wed, 25 Mar 2020 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dSQ41cOEv8hE6RtrO/qfNgxRYLaCgfAUy2GP6KXEsQ=;
        b=JCHuJsCZ8Dq7sahzunv1Py1eAZRL/6T8uel8kRyuBv4B4375tv/XrXfrN7HGB5DeTG
         9KZOZNTfFODGva1jAR1/ulRxSIqznnF+c5V91EiYVdcTDZzOS7hACZwfqu4YOlQtG5xi
         JfsAu76hD8zPTw7nOXenUhFkvacIY+FhBLZKKpV91mYEhYB/kircCcppkilXvYkHb64z
         JbC4CVhd+d/I+2QxMuXd/rRfTOmf0R/EBQ8rtqmC15jeXOrmH7ISfjfaZh5q5p1JcRsz
         Juz/bj7kmoJKKPOzS3fAySvLW1+sABiYvx++NsnJ6JypPdywjUqRsuMY4UWcS9rmFUIk
         eM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dSQ41cOEv8hE6RtrO/qfNgxRYLaCgfAUy2GP6KXEsQ=;
        b=qHn/+4OYF+evgWS9irJGQk2F94dyZxh1Cj3Vdhw+PCCZFs8J5MM/CugmduUU8w5NIJ
         tQd+R/bPYBC5Wzpkacw/7ZuLfidAzMOExxfZ0bzTxIRZiVDAJ8Ux9/m28hzMxXhL58I6
         pVJPruydXOVMggeH//U0OYCFzvKiPdTKd1t1483qksuuAAHcIXjR79FoZN+YBQpxkWfM
         TjLT8ZtwOmYlpOl3vfDazDoZDM/kkTrxxD8Pt9Lhl6UPpuyK24s3T+tQH03WFAzLavOj
         OqSehQ15jHjy8kpcWTFHZk2EdRhOESF8kEudRm/cqBE0Ym5prbo7a0aBl910cqXed7e0
         smTw==
X-Gm-Message-State: ANhLgQ15Xp1jamvwXKOjeROIODvG2zdB4s0mnocGJRfxyBzq2OxSr1nJ
        UDwjureZIJEBBPKBWqNj7SqATAj1wBHhLiMPwWk=
X-Google-Smtp-Source: ADFU+vuoD5ExKBKeede7Y8O5zexgqJsIudObDjdnVUYLTYJub/674Lw0ISmikHyj8/koadWdEp2mBjEtdFTD3YkBefo=
X-Received: by 2002:a67:24c1:: with SMTP id k184mr2364441vsk.177.1585143386311;
 Wed, 25 Mar 2020 06:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <018e8071725b48399141cc46b63641e1@hm.edu> <CAJ8uoz1Vh+zj6msumTNWgtZY6jdOeYgoyDBoizfna1dzhC465A@mail.gmail.com>
 <9616cd5986c74058b51ffd1eb3311b85@hm.edu> <CAJ8uoz1-Nub4RKembg5maQ4Cj1J+O90eR_PcP41yNHuq7pShaQ@mail.gmail.com>
 <35eed7a7481a44bc93e8e5f7e59d9e5a@hm.edu> <CAJ8uoz3D=nw_aD0+Kj9Mh_DivRBvse0+G0Mtfw+eR8UJdDT0jw@mail.gmail.com>
 <883111619d9e429fb5f1fb239afdb478@hm.edu>
In-Reply-To: <883111619d9e429fb5f1fb239afdb478@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 25 Mar 2020 14:36:14 +0100
Message-ID: <CAJ8uoz2OZOrERz3D+L9fe-WhYAHOZOd_ZOzYjUTKwyZ1ic7AaA@mail.gmail.com>
Subject: Re: Shared Umem and reducing ksoftirqd-Load
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Mar 25, 2020 at 1:40 PM Gaul, Maximilian <maximilian.gaul@hm.edu> wrote:
>
> On Wed, Mar 25, 2020 at 12:04 AM Karlsson, Magnus
> magnus.karlsson@gmail.com> wrote:
>
> > On Wed, Mar 25, 2020 at 11:45 AM Gaul, Maximilian
> > <maximilian.gaul@hm.edu> wrote:
> > >
> > > On Wed, Mar 25, 2020 at 11:24 AM Karlsson, Magnus
> > > <magnus.karlsson@gmail.com> wrote:
> > >
> > > > On Wed, Mar 25, 2020 at 11:02 AM Gaul, Maximilian
> > > > <maximilian.gaul@hm.edu> wrote:
> > > > >
> > > > > On Wed, Mar 25, 2020 at 10:41 AM Karlsson, Magnus
> > > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > > On Wed, Mar 25, 2020 at 10:04 AM Gaul, Maximilian
> > > > > > <maximilian.gaul@hm.edu> wrote:
> > > > > > >
> > > > > > > I am running a Multi-AF-XDP-Socket approach per RX-Queue (using Shared Umem).
> > > > > > >
> > > > > > > Unfortunately I am noticing, that at around 650k pps, the *ksoftirqd*-thread of that RX-Queue ramps up to 100% thus leading to packet loss.
> > > > > > > I tried setting *XDP_USE_NEED_WAKEUP* on *xsk_socket_cfg.bind_flags* but those bind_flags are only taken into account if *umem->refcount > 1* (libbpf/xsk.c - xsk_socket__create()).
> > > > > > > As far as I understand this correctly, only the first socket is able to set *XDP_USE_NEED_WAKEUP* because for all sockets after, *umem->refcount* is going to be at least 2.
> > > > > >
> > > > > > Yes, the other sockets just inherit the settings of the first one.
> > > > > >
> > > > > > Are you using the SKB mode? What is your packet size? Sounds like a
> > > > > > low number unless you have large packets and are using the SKB mode.
> > > > > >
> > > > >
> > > > > These are the flags I set right before calling `xsk_socket__create`:
> > > > >
> > > > >         xsk_socket_cfg.xdp_flags = cfg->xdp_flags | XDP_FLAGS_DRV_MODE | XDP_ZEROCOPY;
> > > > >         xsk_socket_cfg.bind_flags = cfg->xsk_bind_flags | XDP_USE_NEED_WAKEUP;
> > > >
> > > > XDP_ZEROCOPY is a bind flag not an XDP flag, so please move it there.
> > > > If you get an error when you have it set, it means that your setup
> > > > does not support zero-copy for some reason. Check what kernel version
> > > > you are using and the the driver you are using supports zero-copy. I
> > > > believe you need to use a queue id>=32 in the Mellanox driver for it
> > > > to work in zero-copy mode. Below 32, you will get copy mode.
> > > >
> > > > > Packet size is around 1492 bytes.
> > > >
> > > > Seems that you are using SKB mode then, not zero-copy.
> > > >
> > > > /Magnus
> > > >
> > >
> > > Thank you for the hint. As you correctly said, I get an error if I use *XDP_ZEROCOPY*. But as far as I understand, packet rates should be higher in Driver-Mode even without zero-copy?
> >
> > Yes, I would expect that too.
> >
> > > I just updated to the latest driver- and firmware version:
> > >
> > >         $ sudo ethtool -i <if>
> > >         driver: mlx5_core
> > >         version: 5.0-0
> > >         firmware-version: 16.27.1016 (MT_0000000012)
> >
> > What kernel version are you using? And you should use the driver from
> > that same kernel.
> >
>
> I am using
>
>         $ uname -a
>         Linux 5.4.0-4-amd64 #1 SMP Debian 5.4.19-1 (2020-02-13) x86_64 GNU/Linux
>
> At the moment, Mellanox only supports Debian until version 10.0 (https://www.mellanox.com/products/infiniband-drivers/linux/mlnx_ofed) which is Kernel 4.19.
> But because in Kernel 4.19, not all AF-XDP features are available, I had to upgrade. I was not sure which Kernel-Version would be the minimum in order to be able to use AF-XDP completely so I went with 5.4.
> Installation was successfull  (with *--skip-distro-check*) so I thought this should work?

You better contact somebody from Mellanox for this info. I do not
know. But Mellanox has zero-copy support in kernel 5.4.

> > > I actually have to correct myself: Incomming packets are 1442 bytes.
> > > Can you give me the link between packet size and whether the NIC is running in SKB or DRV mode?
> >
> > Sorry, do not understand this. Could you please elaborate?
> >
>
> You answered to my reply that packets are 1492 bytes "Seems that you are using SKB mode then, not zero-copy." so because of this I thought there is a relation between packet size and SKB mode?

There is no relationship between SKB mode and packet size. They are
orthogonal. Though there is a relationship between packet size and
performance and of course SKB mode vs zero-copy mode and performance.

> > > Mr. Brouer held a talk about (https://people.netfilter.org/hawk/presentations/driving-IT2017/driving-IT-2017_XDP_eBPF_technology_Jesper_Brouer.pdf)  about XDP, mentioning in slide 11/27 that *mlx5 (v4.9)* has native XDP support.
> >
> > Yes, but only if you use queue id>= 32. What queue id are you binding to?
> >
>
> Usually it is queue 0 but I also tried queue 32 and queue 36 - but that didn't change anything on the behavior.

It should make a difference, if I remember correctly, but somebody
from Mellanox certainly knows better. Try sending a mail to Maxim who
wrote the Mellanox driver support. Maxim Mikityanskiy
<maximmi@mellanox.com>.

/Magnus

> > /Magnus
> >
> > >
> > > > > Just to make sure: Those 650k packets are arriving on the same RX-Queue (even though this NIC has multiple RX-Queues I want to test maximum bandwith for a single RX-Queue).
> > > > >
> > > > > > > I didn't observe a dramatic change as I've hoped to. Are there some other ways to reduce interrupt load (user-space application and ksoftirq are already running on different CPUs)?
> > > > > >
> > > > > > The need_wakeup flag has a big impact when you run the softirq and the
> > > > > > application thread on the same core. When using two cores for this, it
> > > > > > has less of an impact.
> > > > > >
> > > > > > /Magnus
> > > > > >
> > > > > > > NIC: Mellanox Technologies MT27800
> > > > > > >
> > > > > > > Best regards
> > > > > > >
> > > > > > > Max
> > > > > > >
> > > > >
> > >
