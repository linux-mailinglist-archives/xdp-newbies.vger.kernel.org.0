Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B743B34E11D
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Mar 2021 08:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbhC3GVt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Mar 2021 02:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhC3GV3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Mar 2021 02:21:29 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E4FC061762
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:21:28 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v23so5612480ple.9
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 23:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oHWG7h2h4HeRlaURm22V972g3PCIDODt0mUdHGuAHJ8=;
        b=pQadyEGkPLqp/uW/KDXhUwKJBEK7WzlVRgaHmr4fPaxJ3wGX5NTn6vEGysseOVc1ps
         qFgR1ICqnpini1lJB5C28q1D+gCIjAyT8W3CJkt+ryIri9VJ8arSqlKYT94B1OOgmL9z
         PEsBYz8h4i8VxHyzvA+zhAkQXxvUuG3U4wBu5lPpNXI1guHFZgJGaJVKhmHg0HQU16y3
         mQCuFQNiB6z0foEzyET5Dzgp4CNVd759F4yLXyT2jcbmI1ci/NsWKZkbpRql0HvWC92B
         xznWpXfKBm72MnAGLRBLZp1RpI9KtiJD6qBdZeikkdD8WjFsxI3kd5mMcVQq35W9jy+s
         5P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oHWG7h2h4HeRlaURm22V972g3PCIDODt0mUdHGuAHJ8=;
        b=tVSE/7QbkrbGqZivEy0NLSQSqQSXYOmH0G+j2OD6+ovSNhjuR1WbgNdTAN6fIc0vxW
         AsWNQorVTBQmbipI7fDiXxxgg5ssNjnaBrDmZLxOpT7wJqoQRFfySU57dj2d+K+IdMSZ
         qbEeelmu5/d38V3i4pYlcKyRDNab4tWCebCWO2RFSKE9HMg8iCpQxU8ugv+9ta3Q3tFX
         OX+OepY21viAiRt+h6yntoXUqc4rMdb5+fkIhYNF5ESQuYFyxvht0K31ItHOpfU5R8rd
         CpVKz6cu2GFor1+l3sk2lZncJVtXAWm/gISC0Uhv0O47wYr+uk25a/U3ynqAJLUUHsaq
         aGIg==
X-Gm-Message-State: AOAM533eloEaUX4y756qZl1T++fGx+bWFshqr0H9s76FZJORllmOHymJ
        Q0xRHNo/S9Aq5klhkfMCJxHXPL+vMiY8SrkKaaVjZITzEsRfeA==
X-Google-Smtp-Source: ABdhPJzNDOtLire77iqa58u6EHpybKBm32ibUIga3zKGMbgYfLMaADUVOJjf5mbJvmnjAg8owIDe1M8r6HUZpJjwuls=
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr32561127pls.49.1617085288466; Mon, 29
 Mar 2021 23:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
 <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
 <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
 <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com> <CAJ8uoz0aiyCSgiNUnDBDKWNCivgaDjNqAhhEJxVCnZpXo8T1KA@mail.gmail.com>
In-Reply-To: <CAJ8uoz0aiyCSgiNUnDBDKWNCivgaDjNqAhhEJxVCnZpXo8T1KA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 30 Mar 2021 08:21:17 +0200
Message-ID: <CAJ8uoz0s8GxXRDSucTZuinHmVHc4jwX=cDHvNjKBcwLnxLL_PQ@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Konstantinos Kaffes <kkaffes@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Mar 30, 2021 at 8:17 AM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Tue, Mar 30, 2021 at 7:32 AM Konstantinos Kaffes <kkaffes@gmail.com> w=
rote:
> >
> > On Fri, 26 Mar 2021 at 00:36, Magnus Karlsson <magnus.karlsson@gmail.co=
m> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmail.co=
m> wrote:
> > > >
> > > > Great, thanks for the info! I will look into implementing this.
> > > >
> > > > For the time being, I implemented a version of my design with N^2
> > > > sockets. I observed that when all traffic is directed to a single N=
IC
> > > > queue, the throughput is higher than when I use all N NIC queues. I=
 am
> > > > using spinlocks to guard concurrent access to UMEM and the
> > > > fill/completion rings. When I use a single NIC queue, I achieve
> > > > ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasonable,
> > > > and this bad scaling behavior expected?
> > >
> > > 1Mpps sounds reasonable with SKB mode. If you use something simple
> > > like the spinlock scheme you describe, then it will not scale. Check
> > > the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It has =
a
> > > mempool implementation that should scale better than the one you
> > > implemented. For anything remotely complicated, something that manage=
s
> > > the buffers in the umem plus the fill and completion queues is usuall=
y
> > > required. This is called a mempool most of the time. User-space
> > > network libraries such as DPDK and VPP provide fast and scalable
> > > mempool implementations. It would be nice to add a simple one to
> > > libbpf, or rather libxdp as the AF_XDP functionality is moving over
> > > there. Several people have asked for it, but unfortunately I have not
> > > had the time.
> > >
> >
> > Thanks for the tip! I have also started trying zero-copy DRV mode and
> > came across a weird behavior. When I am using multiple sockets, one
> > for each NIC queue, I observe very low throughput and a lot of time
> > spent on the following loop:
> >
> > uint32_t idx_cq;
> > while (ret < buf_count) {
> >   ret +=3D xsk_ring_cons__peek(&xsk->umem->cq, buf_count, &idx_cq);
> > }
>
> This is very likely a na=C3=AFve and unscalable implementation from my
> side, or maybe from you or someone else since I do not know where it
> comes from :-). Here you are waiting for the completing ring to have a
> certain amount of entries (buf_count) to move on. Work with what you
> get instead of trying to get a certain amount.

Another good tactic is to just go and do something else if you do not
get buf_count, then come back later and try again. Do not waste your
cycles doing nothing.

> Also check where your
> driver code for each queue id is running. Are they evenly spread out
> or on the same core? htop is an easy way to find out. It seems that
> your completion rate is bounded and does not scale with number of
> queue ids. Might be the case that Tx driver processing is occurring on
> one core. At least worth examining. I would do that first before
> changing the logic above.
>
> /Magnus
>
> > This does not happen when I have only one XDP socket bound to a single =
queue.
> >
> > Any idea on why this might be happening?
> >
> > > >
> > > > On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@gmai=
l.com> wrote:
> > > > >
> > > > > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gmai=
l.com> wrote:
> > > > > >
> > > > > > Hello everyone,
> > > > > >
> > > > > > I want to write a multi-threaded AF_XDP server where all N thre=
ads can
> > > > > > read from all N NIC queues. In my design, each thread creates N=
 AF_XDP
> > > > > > sockets, each associated with a different queue. I have the fol=
lowing
> > > > > > questions:
> > > > > >
> > > > > > 1. Do sockets associated with the same queue need to share thei=
r UMEM
> > > > > > area and fill and completion rings?
> > > > >
> > > > > Yes. In zero-copy mode this is natural since the NIC HW will DMA =
the
> > > > > packet into a umem that was decided long before the packet was ev=
en
> > > > > received. And this is of course before we even get to pick what s=
ocket
> > > > > it should go to. This restriction is currently carried over to
> > > > > copy-mode, however, in theory there is nothing preventing support=
ing
> > > > > multiple umems on the same netdev and queue id in copy-mode. It i=
s
> > > > > just that nobody has implemented support for it.
> > > > >
> > > > > > 2. Will there be a single XSKMAP holding all N^2 sockets? If ye=
s, what
> > > > > > happens if my XDP program redirects a packet to a socket that i=
s
> > > > > > associated with a different NIC queue than the one in which the=
 packet
> > > > > > arrived?
> > > > >
> > > > > You can have multiple XSKMAPs but you would in any case have to h=
ave
> > > > > N^2 sockets in total to be able to cover all cases. Sockets are t=
ied
> > > > > to a specific netdev and queue id. If you try to redirect to sock=
et
> > > > > with a queue id or netdev that the packet was not received on, it=
 will
> > > > > be dropped. Again, for copy-mode, it would from a theoretical
> > > > > perspective be perfectly fine to redirect to another queue id and=
/or
> > > > > netdev since the packet is copied anyway. Maybe you want to add
> > > > > support for it :-).
> > > > >
> > > > > > I must mention that I am using the XDP skb mode with copies.
> > > > > >
> > > > > > Thank you in advance,
> > > > > > Kostis
> > > >
> > > >
> > > >
> > > > --
> > > > Kostis Kaffes
> > > > PhD Student in Electrical Engineering
> > > > Stanford University
> >
> >
> >
> > --
> > Kostis Kaffes
> > PhD Student in Electrical Engineering
> > Stanford University
