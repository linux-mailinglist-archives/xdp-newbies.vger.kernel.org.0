Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D75192577
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Mar 2020 11:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgCYKYx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Mar 2020 06:24:53 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:41337 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgCYKYx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Mar 2020 06:24:53 -0400
Received: by mail-vk1-f178.google.com with SMTP id q8so505062vka.8
        for <xdp-newbies@vger.kernel.org>; Wed, 25 Mar 2020 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkjIFp6XpuHXUrq+pEXNzxHHKOYRdAfDKMHh+mVfnTc=;
        b=ik8OnKRORWw+gt28UX3uQbaGQyu8MXWkVXonrB1xmFwtBjnXRCV+2qApuD05JKMhRI
         sj4MkQSz8iaErZEKuIwc9T7O7nyQ7rOSXK1Xdup9GSmHK8tw3wc3UtYiZulEGnSXWJy4
         LwH/gxFmILPOLOkoFALqvmTp/6i/LRCSWs5kd/2uMCPDrdvzJqu8FrW4u93fvF8s7gHm
         6YfVpUjVQ1n6EU0MnGG3o6ot/9IpFd+FuzcCzVMNyl07xJJAggpIeIauNQ1k6voFd8u9
         e0AY+6dQBpwR9JfbxEvE25EPLGubrs/qDOI54tzohaK5TU/L8QgIQRybmEo4EEJoNusJ
         Va9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkjIFp6XpuHXUrq+pEXNzxHHKOYRdAfDKMHh+mVfnTc=;
        b=Lrs+OOobFAmf4pHipsRHWA7y1OvIdDvgQ7zpODzy9hL7DmXBU1SCNmXDVeluvnNmMr
         bmmi/Z8gmM8E6D70TgxJd8xbM9PNRcbG4foQM5fkV0ovnFqyjzgF5Wtsw40BDi5i0GVd
         81rbUTvrVlaYgujdp0d4Qn/3lk/wKWY0ISvIleA8kmnrQIOYYQoNwdeTrafO6GBWNUL9
         eFeyIX8UEpd8+6UzFYUtip5GlxGE1CXPH2Ju3F6vajrbwxVr27VX7zd4CjDZ/gap2gCe
         Hwxmp6gHep1Qhahv8v1twHGDB0k3BxAN3np/JTEw0npTpa+CgCFG9i76WKN9Hy47duo1
         GGnw==
X-Gm-Message-State: ANhLgQ3qpgxGOOzDXBZumrxIvLI06XbWtV4Ca6TVlH/OGSE2DF9lrQep
        5OmUN1Jg8qjoc3fIGtwLKSeTvLtC5R4GG4SaIqk=
X-Google-Smtp-Source: ADFU+vu+F6Loai2dgjRo6bVywyKErbhmKYQLnwbY/hOxdOvHb7045oUkoRNHOo+fx0wa2u4zGSS4RLudGw3uomUd66s=
X-Received: by 2002:a1f:2155:: with SMTP id h82mr1595767vkh.46.1585131891547;
 Wed, 25 Mar 2020 03:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <018e8071725b48399141cc46b63641e1@hm.edu> <CAJ8uoz1Vh+zj6msumTNWgtZY6jdOeYgoyDBoizfna1dzhC465A@mail.gmail.com>
 <9616cd5986c74058b51ffd1eb3311b85@hm.edu>
In-Reply-To: <9616cd5986c74058b51ffd1eb3311b85@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 25 Mar 2020 11:24:40 +0100
Message-ID: <CAJ8uoz1-Nub4RKembg5maQ4Cj1J+O90eR_PcP41yNHuq7pShaQ@mail.gmail.com>
Subject: Re: Shared Umem and reducing ksoftirqd-Load
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Mar 25, 2020 at 11:02 AM Gaul, Maximilian
<maximilian.gaul@hm.edu> wrote:
>
> On Wed, Mar 25, 2020 at 10:41 AM Karlsson, Magnus
> <magnus.karlsson@gmail.com> wrote:
>
> > On Wed, Mar 25, 2020 at 10:04 AM Gaul, Maximilian
> > <maximilian.gaul@hm.edu> wrote:
> > >
> > > I am running a Multi-AF-XDP-Socket approach per RX-Queue (using Shared Umem).
> > >
> > > Unfortunately I am noticing, that at around 650k pps, the *ksoftirqd*-thread of that RX-Queue ramps up to 100% thus leading to packet loss.
> > > I tried setting *XDP_USE_NEED_WAKEUP* on *xsk_socket_cfg.bind_flags* but those bind_flags are only taken into account if *umem->refcount > 1* (libbpf/xsk.c - xsk_socket__create()).
> > > As far as I understand this correctly, only the first socket is able to set *XDP_USE_NEED_WAKEUP* because for all sockets after, *umem->refcount* is going to be at least 2.
> >
> > Yes, the other sockets just inherit the settings of the first one.
> >
> > Are you using the SKB mode? What is your packet size? Sounds like a
> > low number unless you have large packets and are using the SKB mode.
> >
>
> These are the flags I set right before calling `xsk_socket__create`:
>
>         xsk_socket_cfg.xdp_flags = cfg->xdp_flags | XDP_FLAGS_DRV_MODE | XDP_ZEROCOPY;
>         xsk_socket_cfg.bind_flags = cfg->xsk_bind_flags | XDP_USE_NEED_WAKEUP;

XDP_ZEROCOPY is a bind flag not an XDP flag, so please move it there.
If you get an error when you have it set, it means that your setup
does not support zero-copy for some reason. Check what kernel version
you are using and the the driver you are using supports zero-copy. I
believe you need to use a queue id>=32 in the Mellanox driver for it
to work in zero-copy mode. Below 32, you will get copy mode.

> Packet size is around 1492 bytes.

Seems that you are using SKB mode then, not zero-copy.

/Magnus

> Just to make sure: Those 650k packets are arriving on the same RX-Queue (even though this NIC has multiple RX-Queues I want to test maximum bandwith for a single RX-Queue).
>
> > > I didn't observe a dramatic change as I've hoped to. Are there some other ways to reduce interrupt load (user-space application and ksoftirq are already running on different CPUs)?
> >
> > The need_wakeup flag has a big impact when you run the softirq and the
> > application thread on the same core. When using two cores for this, it
> > has less of an impact.
> >
> > /Magnus
> >
> > > NIC: Mellanox Technologies MT27800
> > >
> > > Best regards
> > >
> > > Max
> > >
>
