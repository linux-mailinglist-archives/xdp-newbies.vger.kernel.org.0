Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2855B34E115
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Mar 2021 08:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhC3GSJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Mar 2021 02:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhC3GSI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Mar 2021 02:18:08 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B8EC061762
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:18:08 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t140so3626206pgb.13
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VX+mY44UX11l8X2xng3pg4z9Rm2BuwNzqC9Vr6NKdLc=;
        b=SkWL+0xvu7dyhNJGt1QITBGuAl4xfei/P0VB/qq+CMtqm8snFB9ANeT7SwAPPRXzNQ
         JI3rqmHztaAUZztwiS6jAIqe8vBp3M3NDTE5KgWiwe0XBH4n2XpwrMTVZh5nvMO0747O
         C5bSb5mMC1LzQxs+ZZn6/G7lpgAXFWVRO/urq5BdgYP7us/++KJfayrMVBXaydopDbGV
         dnX5ShTWDCxqdqXkKCD3RpSF7rQufOyc8pj96sGI/X1ckbcoSPne4QOFbahbOEtojzYS
         2ZLphIvxKxY6ZaHA1FmEUkXs9rAnHgBSt/gdiNiJuP1AWaZb3Pj+4q4Ka46Vj/0zA7Nr
         oYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VX+mY44UX11l8X2xng3pg4z9Rm2BuwNzqC9Vr6NKdLc=;
        b=JZiczk8pmzA2BWW1LtgnM3Y3ZRrkY2k6LOl1oYJl+0nwM/UVPmakOe/6WddlCgSTtG
         GR0Wtm4opymm1WEJ2Wihxnt/VnrB1DCb3VlTtppgsPSCZ+rz8ZGzqlMobHq+o1w3OD7T
         BhUre/PtRJxEdI8JFNQzNNZVe0XTUinRFZm6ELlNhZ5yEOLheuENJ2M22cIW4rx7ZxIu
         bKCjlf31cCgJVwH/9681fiWZOlqrura92NHqG/YuQGVp03/UkeyQR2YylHgGK3sIZv0h
         mz2ei4cbeODEoPep8qJBbL0k28kgFpQxTkGXI5P2vqp4qSYVZn/nSqKNj26KBMuKJcmV
         ymIw==
X-Gm-Message-State: AOAM5334XzRCPiuPlaX3WNrLIWnliAgA9dE1JVocYr9DfABAF72SFsGz
        HzgCq91DSdlGEKKJ0dRvHDgkyU/WO1MTwmSlBxVYm/xZOsCuTA==
X-Google-Smtp-Source: ABdhPJytnTAQyyHzBa1JnOipqEjWJZGQhExDhLMRQQ3wrx8TxEh7KKYdC2J5uQx6MjMGhRd0FAOVTSLvQppsTKnsl/A=
X-Received: by 2002:a65:6483:: with SMTP id e3mr16992628pgv.208.1617085087512;
 Mon, 29 Mar 2021 23:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
 <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
 <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com> <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com>
In-Reply-To: <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 30 Mar 2021 08:17:55 +0200
Message-ID: <CAJ8uoz0aiyCSgiNUnDBDKWNCivgaDjNqAhhEJxVCnZpXo8T1KA@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Konstantinos Kaffes <kkaffes@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Mar 30, 2021 at 7:32 AM Konstantinos Kaffes <kkaffes@gmail.com> wro=
te:
>
> On Fri, 26 Mar 2021 at 00:36, Magnus Karlsson <magnus.karlsson@gmail.com>=
 wrote:
> >
> > On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmail.com>=
 wrote:
> > >
> > > Great, thanks for the info! I will look into implementing this.
> > >
> > > For the time being, I implemented a version of my design with N^2
> > > sockets. I observed that when all traffic is directed to a single NIC
> > > queue, the throughput is higher than when I use all N NIC queues. I a=
m
> > > using spinlocks to guard concurrent access to UMEM and the
> > > fill/completion rings. When I use a single NIC queue, I achieve
> > > ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasonable,
> > > and this bad scaling behavior expected?
> >
> > 1Mpps sounds reasonable with SKB mode. If you use something simple
> > like the spinlock scheme you describe, then it will not scale. Check
> > the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It has a
> > mempool implementation that should scale better than the one you
> > implemented. For anything remotely complicated, something that manages
> > the buffers in the umem plus the fill and completion queues is usually
> > required. This is called a mempool most of the time. User-space
> > network libraries such as DPDK and VPP provide fast and scalable
> > mempool implementations. It would be nice to add a simple one to
> > libbpf, or rather libxdp as the AF_XDP functionality is moving over
> > there. Several people have asked for it, but unfortunately I have not
> > had the time.
> >
>
> Thanks for the tip! I have also started trying zero-copy DRV mode and
> came across a weird behavior. When I am using multiple sockets, one
> for each NIC queue, I observe very low throughput and a lot of time
> spent on the following loop:
>
> uint32_t idx_cq;
> while (ret < buf_count) {
>   ret +=3D xsk_ring_cons__peek(&xsk->umem->cq, buf_count, &idx_cq);
> }

This is very likely a na=C3=AFve and unscalable implementation from my
side, or maybe from you or someone else since I do not know where it
comes from :-). Here you are waiting for the completing ring to have a
certain amount of entries (buf_count) to move on. Work with what you
get instead of trying to get a certain amount. Also check where your
driver code for each queue id is running. Are they evenly spread out
or on the same core? htop is an easy way to find out. It seems that
your completion rate is bounded and does not scale with number of
queue ids. Might be the case that Tx driver processing is occurring on
one core. At least worth examining. I would do that first before
changing the logic above.

/Magnus

> This does not happen when I have only one XDP socket bound to a single qu=
eue.
>
> Any idea on why this might be happening?
>
> > >
> > > On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@gmail.=
com> wrote:
> > > >
> > > > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gmail.=
com> wrote:
> > > > >
> > > > > Hello everyone,
> > > > >
> > > > > I want to write a multi-threaded AF_XDP server where all N thread=
s can
> > > > > read from all N NIC queues. In my design, each thread creates N A=
F_XDP
> > > > > sockets, each associated with a different queue. I have the follo=
wing
> > > > > questions:
> > > > >
> > > > > 1. Do sockets associated with the same queue need to share their =
UMEM
> > > > > area and fill and completion rings?
> > > >
> > > > Yes. In zero-copy mode this is natural since the NIC HW will DMA th=
e
> > > > packet into a umem that was decided long before the packet was even
> > > > received. And this is of course before we even get to pick what soc=
ket
> > > > it should go to. This restriction is currently carried over to
> > > > copy-mode, however, in theory there is nothing preventing supportin=
g
> > > > multiple umems on the same netdev and queue id in copy-mode. It is
> > > > just that nobody has implemented support for it.
> > > >
> > > > > 2. Will there be a single XSKMAP holding all N^2 sockets? If yes,=
 what
> > > > > happens if my XDP program redirects a packet to a socket that is
> > > > > associated with a different NIC queue than the one in which the p=
acket
> > > > > arrived?
> > > >
> > > > You can have multiple XSKMAPs but you would in any case have to hav=
e
> > > > N^2 sockets in total to be able to cover all cases. Sockets are tie=
d
> > > > to a specific netdev and queue id. If you try to redirect to socket
> > > > with a queue id or netdev that the packet was not received on, it w=
ill
> > > > be dropped. Again, for copy-mode, it would from a theoretical
> > > > perspective be perfectly fine to redirect to another queue id and/o=
r
> > > > netdev since the packet is copied anyway. Maybe you want to add
> > > > support for it :-).
> > > >
> > > > > I must mention that I am using the XDP skb mode with copies.
> > > > >
> > > > > Thank you in advance,
> > > > > Kostis
> > >
> > >
> > >
> > > --
> > > Kostis Kaffes
> > > PhD Student in Electrical Engineering
> > > Stanford University
>
>
>
> --
> Kostis Kaffes
> PhD Student in Electrical Engineering
> Stanford University
