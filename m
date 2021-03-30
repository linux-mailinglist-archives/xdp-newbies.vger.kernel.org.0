Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FDE34E140
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Mar 2021 08:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhC3GaD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Mar 2021 02:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhC3G3z (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Mar 2021 02:29:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2958C061762
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:29:54 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id jy13so23095755ejc.2
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l0LlexQJOtU1q/TVuVi8DkLmbOQdLk3scQ0xijN6dNo=;
        b=uilPluK7VeJMYtxWv6e0fY7nnCvT7/LgVwCHF7ukHEOs3MOCDJzyevZUQF4xYoqmIX
         gNPNr/cpxiwyJxtysBGDViamjVSeMQhtCGiR3o3fe38m8O1MIBF6GodD0BHHaPG7oxhl
         2p1iyYSsPKcB3BIao2M7EsDuPij+yiG6gIXouNFclpemD0WXpII5y2LEdXyGWD4Yd2xT
         3fdRYqbCOYPLMGXcWY3JmSrNmAZSo3I+kuo4H/2k6qPBaxMsRPa4Ao3kvp3kgvwIv6Ii
         8gHxASDqRCSgzo6591+hCRpmeDlh1ztyPPrJKKeQLBdKe7mcfjxkZsOB2EPqnJxg40+f
         z0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l0LlexQJOtU1q/TVuVi8DkLmbOQdLk3scQ0xijN6dNo=;
        b=aL/PnuH3G7MUrZDzyQo6mSLdUPclu+xUyHYKeUJnKZKDa1S276aujX3l9KBb3d5DxP
         flgVRK1z/xBs3Haa1fxw0qL8B9220Y8oqdhzDmq9ZP68HfJgHMQI2TP4cRu0au1N23B/
         l1kjOkXueJXPi8UAntwH2kAUOhKRjkXZoablvlA7QfKOdtBS4JHZ4/Rrb5hkdemPi7g0
         hwlgY7SUYIv5Y89onFJZyQiLL1TURXIqlRFPzmqxY8YcoH+QTDQDntOtsro5K35bUD5B
         4phsRPNDl+xxugZeUNvoaL9YHfe6RWC95sxdSuCudGK+KHGKOsaY2dOFJEYksTi2iznb
         +suQ==
X-Gm-Message-State: AOAM530kyHJB0wkAmu5dmhzL6Mj6UhoBgp/1UHA6bB82m+l12t9Qrvhw
        2d7xwjAlJeF3xfafdb67iCS3eORVBDDmCGzGMF0=
X-Google-Smtp-Source: ABdhPJxM0YReM/V8DZHLCrxmCT348bcbZBk/iPax+8M/Tar0Spxo67qSnQn8OrpF5+56YXuHyQliTkBjHhkjVS39zQw=
X-Received: by 2002:a17:906:a20c:: with SMTP id r12mr30956361ejy.554.1617085793346;
 Mon, 29 Mar 2021 23:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
 <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
 <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
 <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com>
 <CAJ8uoz0aiyCSgiNUnDBDKWNCivgaDjNqAhhEJxVCnZpXo8T1KA@mail.gmail.com> <CAJ8uoz0s8GxXRDSucTZuinHmVHc4jwX=cDHvNjKBcwLnxLL_PQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz0s8GxXRDSucTZuinHmVHc4jwX=cDHvNjKBcwLnxLL_PQ@mail.gmail.com>
From:   Konstantinos Kaffes <kkaffes@gmail.com>
Date:   Mon, 29 Mar 2021 23:29:42 -0700
Message-ID: <CAHAzn3oevXqL1=h3tzS0HEqaPKNo6woWVbVvCPEY+RBbWP6+SA@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 29 Mar 2021 at 23:21, Magnus Karlsson <magnus.karlsson@gmail.com> w=
rote:
>
> On Tue, Mar 30, 2021 at 8:17 AM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Tue, Mar 30, 2021 at 7:32 AM Konstantinos Kaffes <kkaffes@gmail.com>=
 wrote:
> > >
> > > On Fri, 26 Mar 2021 at 00:36, Magnus Karlsson <magnus.karlsson@gmail.=
com> wrote:
> > > >
> > > > On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmail.=
com> wrote:
> > > > >
> > > > > Great, thanks for the info! I will look into implementing this.
> > > > >
> > > > > For the time being, I implemented a version of my design with N^2
> > > > > sockets. I observed that when all traffic is directed to a single=
 NIC
> > > > > queue, the throughput is higher than when I use all N NIC queues.=
 I am
> > > > > using spinlocks to guard concurrent access to UMEM and the
> > > > > fill/completion rings. When I use a single NIC queue, I achieve
> > > > > ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasonabl=
e,
> > > > > and this bad scaling behavior expected?
> > > >
> > > > 1Mpps sounds reasonable with SKB mode. If you use something simple
> > > > like the spinlock scheme you describe, then it will not scale. Chec=
k
> > > > the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It ha=
s a
> > > > mempool implementation that should scale better than the one you
> > > > implemented. For anything remotely complicated, something that mana=
ges
> > > > the buffers in the umem plus the fill and completion queues is usua=
lly
> > > > required. This is called a mempool most of the time. User-space
> > > > network libraries such as DPDK and VPP provide fast and scalable
> > > > mempool implementations. It would be nice to add a simple one to
> > > > libbpf, or rather libxdp as the AF_XDP functionality is moving over
> > > > there. Several people have asked for it, but unfortunately I have n=
ot
> > > > had the time.
> > > >
> > >
> > > Thanks for the tip! I have also started trying zero-copy DRV mode and
> > > came across a weird behavior. When I am using multiple sockets, one
> > > for each NIC queue, I observe very low throughput and a lot of time
> > > spent on the following loop:
> > >
> > > uint32_t idx_cq;
> > > while (ret < buf_count) {
> > >   ret +=3D xsk_ring_cons__peek(&xsk->umem->cq, buf_count, &idx_cq);
> > > }
> >
> > This is very likely a na=C3=AFve and unscalable implementation from my
> > side, or maybe from you or someone else since I do not know where it
> > comes from :-). Here you are waiting for the completing ring to have a
> > certain amount of entries (buf_count) to move on. Work with what you
> > get instead of trying to get a certain amount.
>
> Another good tactic is to just go and do something else if you do not
> get buf_count, then come back later and try again. Do not waste your
> cycles doing nothing.
>

The way my application is designed - which is obviously not optimal -
I need to confirm that the packets are sent and the buffers are
released before doing other stuff. The problem is not so much that the
performance does not scale. It is more like that with 2 sockets/queues
the performance is 300x worse than in the single-socket/queue case.

> > Also check where your
> > driver code for each queue id is running. Are they evenly spread out
> > or on the same core? htop is an easy way to find out. It seems that
> > your completion rate is bounded and does not scale with number of
> > queue ids. Might be the case that Tx driver processing is occurring on
> > one core. At least worth examining. I would do that first before
> > changing the logic above.
> >

I have checked that the TX driver for each queue is running on a
different core. In any case, is it possible to adjust where the TX
driver runs?


> > /Magnus
> >
> > > This does not happen when I have only one XDP socket bound to a singl=
e queue.
> > >
> > > Any idea on why this might be happening?
> > >
> > > > >
> > > > > On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@gm=
ail.com> wrote:
> > > > > >
> > > > > > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gm=
ail.com> wrote:
> > > > > > >
> > > > > > > Hello everyone,
> > > > > > >
> > > > > > > I want to write a multi-threaded AF_XDP server where all N th=
reads can
> > > > > > > read from all N NIC queues. In my design, each thread creates=
 N AF_XDP
> > > > > > > sockets, each associated with a different queue. I have the f=
ollowing
> > > > > > > questions:
> > > > > > >
> > > > > > > 1. Do sockets associated with the same queue need to share th=
eir UMEM
> > > > > > > area and fill and completion rings?
> > > > > >
> > > > > > Yes. In zero-copy mode this is natural since the NIC HW will DM=
A the
> > > > > > packet into a umem that was decided long before the packet was =
even
> > > > > > received. And this is of course before we even get to pick what=
 socket
> > > > > > it should go to. This restriction is currently carried over to
> > > > > > copy-mode, however, in theory there is nothing preventing suppo=
rting
> > > > > > multiple umems on the same netdev and queue id in copy-mode. It=
 is
> > > > > > just that nobody has implemented support for it.
> > > > > >
> > > > > > > 2. Will there be a single XSKMAP holding all N^2 sockets? If =
yes, what
> > > > > > > happens if my XDP program redirects a packet to a socket that=
 is
> > > > > > > associated with a different NIC queue than the one in which t=
he packet
> > > > > > > arrived?
> > > > > >
> > > > > > You can have multiple XSKMAPs but you would in any case have to=
 have
> > > > > > N^2 sockets in total to be able to cover all cases. Sockets are=
 tied
> > > > > > to a specific netdev and queue id. If you try to redirect to so=
cket
> > > > > > with a queue id or netdev that the packet was not received on, =
it will
> > > > > > be dropped. Again, for copy-mode, it would from a theoretical
> > > > > > perspective be perfectly fine to redirect to another queue id a=
nd/or
> > > > > > netdev since the packet is copied anyway. Maybe you want to add
> > > > > > support for it :-).
> > > > > >
> > > > > > > I must mention that I am using the XDP skb mode with copies.
> > > > > > >
> > > > > > > Thank you in advance,
> > > > > > > Kostis
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Kostis Kaffes
> > > > > PhD Student in Electrical Engineering
> > > > > Stanford University
> > >
> > >
> > >
> > > --
> > > Kostis Kaffes
> > > PhD Student in Electrical Engineering
> > > Stanford University



--
Kostis Kaffes
PhD Student in Electrical Engineering
Stanford University
