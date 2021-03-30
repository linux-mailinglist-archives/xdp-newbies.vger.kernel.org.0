Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F0934E16D
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Mar 2021 08:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhC3GpF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Mar 2021 02:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhC3Gol (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Mar 2021 02:44:41 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9412DC061762
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:44:41 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m7so10999878pgj.8
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+MpAXOBc2AIoxYjaoGLMksdsDselV1PoCzm1VcmuKjg=;
        b=e779m0b7aUbbo+JldeXlA/D8FddoQl+3khqxXRkPDidVJMu93OlDWG3gT+tIqWnsT+
         f4fTu/S24NeiZClZSOIkd+2zvcXM2wmTUbBRllNFN6FTkmZcmw4fPOyXh9IrpaqgoIXN
         GlSJFVid5pNFXqaKQ+Th4eRhFX2JpSMxXAVi0IWx0gCZkv11DApFR/6Ol5SKJMDbmgSq
         9cGAJQT4rjiESns5yHjS/LbFOUHgfYdbzK4cFueMZq8L1BDSvNAT2K6D49vzNI6joWrt
         radQ+wgXQOLGvqLTaw65LnqZxQW7h6uVWwmQZ4IIQosqFn7ZTTPamcIs0g10yIAnERDm
         1UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+MpAXOBc2AIoxYjaoGLMksdsDselV1PoCzm1VcmuKjg=;
        b=S7+mqDkUQCfHhAwcYlpiC4yayHc+tQmrvZ6rrXUt0OYV539FNOLl4uYydNskLj3H2Y
         HEpYU2vODKnwZ9G1EcbnhSlQPzhfaQK4t2ef6y3ucPLEO1FoW0JV0/K32CGoxI+djPWd
         s7xMsSMsFk02qarQlUQgz7hxXMUt+OvaNGOk8McUR0uuRSAk91iZ6PCx1SAyqILwBr0N
         zyIdA+FqRmhC1v5oUYns0iy+IYfg1eYEE6XRayKFG6lUIYwZHT7v8QTj7LKcPN0EnCbu
         50PRECHSiE0U50Ij4gksOuF6EoxOuFZ8a1UPUORFzmkZYIlxKMbJC5JYZ/SKDkXIwE1U
         pJaw==
X-Gm-Message-State: AOAM533pOH4uxmn4g3fPTsjhdAo9j/yQD9/zSM6Ed1UXX00OJD/l1M6z
        +puUcBNAwevMgrP6SV7Yf0kUFoLvxxzUwbZrRIE=
X-Google-Smtp-Source: ABdhPJzzzpQrDOAxmNW9yE3QiFyksJ/iYhJS7KRJCPJFQPli5o1JNU/DQe6Fp7LF56xLZRbfTpYTKzHm50ulUUIc5cY=
X-Received: by 2002:a63:c646:: with SMTP id x6mr28288275pgg.126.1617086681084;
 Mon, 29 Mar 2021 23:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
 <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
 <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
 <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com>
 <CAJ8uoz0aiyCSgiNUnDBDKWNCivgaDjNqAhhEJxVCnZpXo8T1KA@mail.gmail.com>
 <CAJ8uoz0s8GxXRDSucTZuinHmVHc4jwX=cDHvNjKBcwLnxLL_PQ@mail.gmail.com> <CAHAzn3oevXqL1=h3tzS0HEqaPKNo6woWVbVvCPEY+RBbWP6+SA@mail.gmail.com>
In-Reply-To: <CAHAzn3oevXqL1=h3tzS0HEqaPKNo6woWVbVvCPEY+RBbWP6+SA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 30 Mar 2021 08:44:30 +0200
Message-ID: <CAJ8uoz0UeV+j_h8abi2wb3=PTMZwpdVGU3cKa0KmRJUvfOhKXQ@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Konstantinos Kaffes <kkaffes@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Mar 30, 2021 at 8:29 AM Konstantinos Kaffes <kkaffes@gmail.com> wro=
te:
>
> On Mon, 29 Mar 2021 at 23:21, Magnus Karlsson <magnus.karlsson@gmail.com>=
 wrote:
> >
> > On Tue, Mar 30, 2021 at 8:17 AM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Tue, Mar 30, 2021 at 7:32 AM Konstantinos Kaffes <kkaffes@gmail.co=
m> wrote:
> > > >
> > > > On Fri, 26 Mar 2021 at 00:36, Magnus Karlsson <magnus.karlsson@gmai=
l.com> wrote:
> > > > >
> > > > > On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmai=
l.com> wrote:
> > > > > >
> > > > > > Great, thanks for the info! I will look into implementing this.
> > > > > >
> > > > > > For the time being, I implemented a version of my design with N=
^2
> > > > > > sockets. I observed that when all traffic is directed to a sing=
le NIC
> > > > > > queue, the throughput is higher than when I use all N NIC queue=
s. I am
> > > > > > using spinlocks to guard concurrent access to UMEM and the
> > > > > > fill/completion rings. When I use a single NIC queue, I achieve
> > > > > > ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasona=
ble,
> > > > > > and this bad scaling behavior expected?
> > > > >
> > > > > 1Mpps sounds reasonable with SKB mode. If you use something simpl=
e
> > > > > like the spinlock scheme you describe, then it will not scale. Ch=
eck
> > > > > the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It =
has a
> > > > > mempool implementation that should scale better than the one you
> > > > > implemented. For anything remotely complicated, something that ma=
nages
> > > > > the buffers in the umem plus the fill and completion queues is us=
ually
> > > > > required. This is called a mempool most of the time. User-space
> > > > > network libraries such as DPDK and VPP provide fast and scalable
> > > > > mempool implementations. It would be nice to add a simple one to
> > > > > libbpf, or rather libxdp as the AF_XDP functionality is moving ov=
er
> > > > > there. Several people have asked for it, but unfortunately I have=
 not
> > > > > had the time.
> > > > >
> > > >
> > > > Thanks for the tip! I have also started trying zero-copy DRV mode a=
nd
> > > > came across a weird behavior. When I am using multiple sockets, one
> > > > for each NIC queue, I observe very low throughput and a lot of time
> > > > spent on the following loop:
> > > >
> > > > uint32_t idx_cq;
> > > > while (ret < buf_count) {
> > > >   ret +=3D xsk_ring_cons__peek(&xsk->umem->cq, buf_count, &idx_cq);
> > > > }
> > >
> > > This is very likely a na=C3=AFve and unscalable implementation from m=
y
> > > side, or maybe from you or someone else since I do not know where it
> > > comes from :-). Here you are waiting for the completing ring to have =
a
> > > certain amount of entries (buf_count) to move on. Work with what you
> > > get instead of trying to get a certain amount.
> >
> > Another good tactic is to just go and do something else if you do not
> > get buf_count, then come back later and try again. Do not waste your
> > cycles doing nothing.
> >
>
> The way my application is designed - which is obviously not optimal -
> I need to confirm that the packets are sent and the buffers are
> released before doing other stuff. The problem is not so much that the
> performance does not scale. It is more like that with 2 sockets/queues
> the performance is 300x worse than in the single-socket/queue case.

Ouch, that sounds awful. What driver are you running?

> > > Also check where your
> > > driver code for each queue id is running. Are they evenly spread out
> > > or on the same core? htop is an easy way to find out. It seems that
> > > your completion rate is bounded and does not scale with number of
> > > queue ids. Might be the case that Tx driver processing is occurring o=
n
> > > one core. At least worth examining. I would do that first before
> > > changing the logic above.
> > >
>
> I have checked that the TX driver for each queue is running on a
> different core. In any case, is it possible to adjust where the TX
> driver runs?

Usually, Rx and Tx processing for a specific queue is done on the same
core since they are bundled in the same napi context. You can set irq
affinity so that the interrupt associated with the queue id in
question is only allowed to fire on the core you want. This way it
will get pegged on one core. Another more scalable way would be to use
busy-poll [1]. In this mode, the Rx and Tx processing is done on the
same core as the application that uses the socket. The driver
processing is usually not triggered by interrupts, insted it is
triggered by the application doing recvmsg, sendto, and/or poll
syscalls. Check out the xdpsock_user.c sample in a kernel 5.11 or
later for an example.

[1] https://lwn.net/Articles/837010/

/Magnus

>
> > > /Magnus
> > >
> > > > This does not happen when I have only one XDP socket bound to a sin=
gle queue.
> > > >
> > > > Any idea on why this might be happening?
> > > >
> > > > > >
> > > > > > On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@=
gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@=
gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hello everyone,
> > > > > > > >
> > > > > > > > I want to write a multi-threaded AF_XDP server where all N =
threads can
> > > > > > > > read from all N NIC queues. In my design, each thread creat=
es N AF_XDP
> > > > > > > > sockets, each associated with a different queue. I have the=
 following
> > > > > > > > questions:
> > > > > > > >
> > > > > > > > 1. Do sockets associated with the same queue need to share =
their UMEM
> > > > > > > > area and fill and completion rings?
> > > > > > >
> > > > > > > Yes. In zero-copy mode this is natural since the NIC HW will =
DMA the
> > > > > > > packet into a umem that was decided long before the packet wa=
s even
> > > > > > > received. And this is of course before we even get to pick wh=
at socket
> > > > > > > it should go to. This restriction is currently carried over t=
o
> > > > > > > copy-mode, however, in theory there is nothing preventing sup=
porting
> > > > > > > multiple umems on the same netdev and queue id in copy-mode. =
It is
> > > > > > > just that nobody has implemented support for it.
> > > > > > >
> > > > > > > > 2. Will there be a single XSKMAP holding all N^2 sockets? I=
f yes, what
> > > > > > > > happens if my XDP program redirects a packet to a socket th=
at is
> > > > > > > > associated with a different NIC queue than the one in which=
 the packet
> > > > > > > > arrived?
> > > > > > >
> > > > > > > You can have multiple XSKMAPs but you would in any case have =
to have
> > > > > > > N^2 sockets in total to be able to cover all cases. Sockets a=
re tied
> > > > > > > to a specific netdev and queue id. If you try to redirect to =
socket
> > > > > > > with a queue id or netdev that the packet was not received on=
, it will
> > > > > > > be dropped. Again, for copy-mode, it would from a theoretical
> > > > > > > perspective be perfectly fine to redirect to another queue id=
 and/or
> > > > > > > netdev since the packet is copied anyway. Maybe you want to a=
dd
> > > > > > > support for it :-).
> > > > > > >
> > > > > > > > I must mention that I am using the XDP skb mode with copies=
.
> > > > > > > >
> > > > > > > > Thank you in advance,
> > > > > > > > Kostis
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Kostis Kaffes
> > > > > > PhD Student in Electrical Engineering
> > > > > > Stanford University
> > > >
> > > >
> > > >
> > > > --
> > > > Kostis Kaffes
> > > > PhD Student in Electrical Engineering
> > > > Stanford University
>
>
>
> --
> Kostis Kaffes
> PhD Student in Electrical Engineering
> Stanford University
