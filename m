Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8039934E0B2
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Mar 2021 07:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhC3FdL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Mar 2021 01:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhC3FdH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Mar 2021 01:33:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA302C061762
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 22:33:06 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b14so21877815lfv.8
        for <xdp-newbies@vger.kernel.org>; Mon, 29 Mar 2021 22:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CwNs7kVa5Ybug0kLBFmGW1hSG3ERqg5K89MogkwqVg=;
        b=Pj0YVwsTHrAlONB+KgolINreL+/pmvHfNaFyW3HQnCGioRlpkd28UBzQZ4TOGXoSM0
         JwKr317U9Gj2PJeGMMS4PkhcxuCYyFsEd/yG6y3iap/fyvC48j/zbmbpmdWmScYjanVa
         XFnXzX0CnVd6G1E4rx4iX1OgUHvB0lU/QLEV7sKtSuHeJ/3JxWCwoedmlhXw4pBtW+JK
         sVzzTdZARq+FUQ5g75V7cVSuw0IT+f43bGrEwqhxtozTlXhkzwcf0PyccVOEsRJztnHA
         zcqVdye3VQ2FEDcRDa0fICudyCtDTbuxJ+tZ7MojWo+nuQmJTyOyvG8qsAi0O8Mzrdru
         fQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CwNs7kVa5Ybug0kLBFmGW1hSG3ERqg5K89MogkwqVg=;
        b=CuKsgbYbl2IFCfT3m+55NfvyFFArF5S7GV15GANcJShcHUwYbyEAxhCjVa/uhibz0x
         oeUj1l66mm/KRKjYd6/uuLA+BnM/i+37P/EBONj7iK+589+mOE/UXWT0qhqF6bbb5/c9
         nhcyAQX89TTqfSb2ggBN7wsO8Qdru/p1vZPibfz2WiJg63d9RXClnkNtF2v0f+qqtK6A
         K0dcMxAnwlm56J/sQShFOdCyAGjlihu6DVf6rO28DkdFhe3YQOXtC6sBqMIVWYVtsPRR
         w+kPtwDyY/wXlbcn0oMZ4YSVzpu9XHB+RuEqWWgoTJR1tfrsIf+FiMU7LVdZPGZ4X7LY
         joqg==
X-Gm-Message-State: AOAM532I7GKacJnu+qYGJXFLMHoFqA+atWR5GweQoggmdGwH+6EQ/mmj
        9l98IIDBsDdumXj1p5roTSvi48eqwHj4heFC5ayrV9zwzSVfag==
X-Google-Smtp-Source: ABdhPJyQJTIfVd7PiGBsfJ2vj+Mw36LXulF4E2vhTZAMluTPWvrPnLJdwX0kLl7jp1rcuVTMcx2bE0OneN3na7MfttA=
X-Received: by 2002:a17:907:d09:: with SMTP id gn9mr30689337ejc.538.1617082373880;
 Mon, 29 Mar 2021 22:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
 <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com> <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
In-Reply-To: <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
From:   Konstantinos Kaffes <kkaffes@gmail.com>
Date:   Mon, 29 Mar 2021 22:32:42 -0700
Message-ID: <CAHAzn3pgQQv82VYjqteCv9eYQw-iLVz27Qi7-XVpopT-g6j=yw@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 26 Mar 2021 at 00:36, Magnus Karlsson <magnus.karlsson@gmail.com> wrote:
>
> On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmail.com> wrote:
> >
> > Great, thanks for the info! I will look into implementing this.
> >
> > For the time being, I implemented a version of my design with N^2
> > sockets. I observed that when all traffic is directed to a single NIC
> > queue, the throughput is higher than when I use all N NIC queues. I am
> > using spinlocks to guard concurrent access to UMEM and the
> > fill/completion rings. When I use a single NIC queue, I achieve
> > ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasonable,
> > and this bad scaling behavior expected?
>
> 1Mpps sounds reasonable with SKB mode. If you use something simple
> like the spinlock scheme you describe, then it will not scale. Check
> the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It has a
> mempool implementation that should scale better than the one you
> implemented. For anything remotely complicated, something that manages
> the buffers in the umem plus the fill and completion queues is usually
> required. This is called a mempool most of the time. User-space
> network libraries such as DPDK and VPP provide fast and scalable
> mempool implementations. It would be nice to add a simple one to
> libbpf, or rather libxdp as the AF_XDP functionality is moving over
> there. Several people have asked for it, but unfortunately I have not
> had the time.
>

Thanks for the tip! I have also started trying zero-copy DRV mode and
came across a weird behavior. When I am using multiple sockets, one
for each NIC queue, I observe very low throughput and a lot of time
spent on the following loop:

uint32_t idx_cq;
while (ret < buf_count) {
  ret += xsk_ring_cons__peek(&xsk->umem->cq, buf_count, &idx_cq);
}

This does not happen when I have only one XDP socket bound to a single queue.

Any idea on why this might be happening?

> >
> > On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gmail.com> wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > I want to write a multi-threaded AF_XDP server where all N threads can
> > > > read from all N NIC queues. In my design, each thread creates N AF_XDP
> > > > sockets, each associated with a different queue. I have the following
> > > > questions:
> > > >
> > > > 1. Do sockets associated with the same queue need to share their UMEM
> > > > area and fill and completion rings?
> > >
> > > Yes. In zero-copy mode this is natural since the NIC HW will DMA the
> > > packet into a umem that was decided long before the packet was even
> > > received. And this is of course before we even get to pick what socket
> > > it should go to. This restriction is currently carried over to
> > > copy-mode, however, in theory there is nothing preventing supporting
> > > multiple umems on the same netdev and queue id in copy-mode. It is
> > > just that nobody has implemented support for it.
> > >
> > > > 2. Will there be a single XSKMAP holding all N^2 sockets? If yes, what
> > > > happens if my XDP program redirects a packet to a socket that is
> > > > associated with a different NIC queue than the one in which the packet
> > > > arrived?
> > >
> > > You can have multiple XSKMAPs but you would in any case have to have
> > > N^2 sockets in total to be able to cover all cases. Sockets are tied
> > > to a specific netdev and queue id. If you try to redirect to socket
> > > with a queue id or netdev that the packet was not received on, it will
> > > be dropped. Again, for copy-mode, it would from a theoretical
> > > perspective be perfectly fine to redirect to another queue id and/or
> > > netdev since the packet is copied anyway. Maybe you want to add
> > > support for it :-).
> > >
> > > > I must mention that I am using the XDP skb mode with copies.
> > > >
> > > > Thank you in advance,
> > > > Kostis
> >
> >
> >
> > --
> > Kostis Kaffes
> > PhD Student in Electrical Engineering
> > Stanford University



-- 
Kostis Kaffes
PhD Student in Electrical Engineering
Stanford University
