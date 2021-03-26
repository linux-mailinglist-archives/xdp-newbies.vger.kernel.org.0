Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961DD34A292
	for <lists+xdp-newbies@lfdr.de>; Fri, 26 Mar 2021 08:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhCZHgv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 26 Mar 2021 03:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhCZHgV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 26 Mar 2021 03:36:21 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D409C0613AA
        for <xdp-newbies@vger.kernel.org>; Fri, 26 Mar 2021 00:36:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t18so2159648pjs.3
        for <xdp-newbies@vger.kernel.org>; Fri, 26 Mar 2021 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqgCMJ6mtBhF1OoGQ0AwBjxdbrv5CDMcGg8IR81gV0s=;
        b=qXEdj01xlLW9sl0Qn0/UcdEJoXCKguSfb2ntmlpMCQ30qet8hYKTXLu1qgoZPnbgQV
         ++GzxZYJhoyoIYXmnJclalxl6k5JhfDr9NDprvdhA7VTACwOzXgKi1+MlwcWZ9MCO9Q2
         PYHa891DF55V4HkADWe970xnW7FfcZyAKrCFhcJje/UI8+9ktlFS2YJg7SnsqLNdKuPa
         ySSwMP4+S7L1unk6TOnL8KpkoDc80dewiiA4ibVw45AnKsD8rd5uHlEbwmBr3DXk1zPT
         ObJxGuEvj3Q5brBQMPOKTz6a+ldsl5to1EEXKEtTeyKJ9jPT6pSzJIEULMagsE/fq/3x
         XdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqgCMJ6mtBhF1OoGQ0AwBjxdbrv5CDMcGg8IR81gV0s=;
        b=D4imrrgzrqWjgLQmAH6tlr2axkPoVg3JJ3CoYHXFKU7doU6q+pflvXuYjOBlEaEP4p
         G86sepYNGHiFe0lM6xX1gXX0RzwfGQhkaFRxZqiE5OP+uyrjaUGiqHFMVoIxC4B+pcZF
         SJMZIhltBRLEKSZj9XO7G3F3g+g6up2REXNoM911QLduHfhwQ9CvuDsidGqtg4pnlSRS
         7HTnRQEpkrWsHCM73ITNV+f8UCccxFRH7aseRC/OesHZi6HPgQIetM2XHUIzCY0BWK4n
         FXmwPXBsmkML93wfeaDL6E5msNAwgisAS82jram4nFfRf30fk0NwcmScekKJcuD1UTFT
         /wFw==
X-Gm-Message-State: AOAM532UkLjtwF87uLRdg4E0NefjR9fCiWyoieUQEAxWA5K1XhTVrBbJ
        GrQJocnOhjbR6UwHhBjR0IVQEMP7ZhbWDnrD8g4oiJNlivI//A==
X-Google-Smtp-Source: ABdhPJx79EQh2x/u9ot0A6tY4OwPUjPOSY2Zs3T3BDMCEtl0OanteBxPQ3mVNV+tWE6Q8nXLz4U2Ic2w5QxWjpGvm1g=
X-Received: by 2002:a17:90b:e01:: with SMTP id ge1mr12871201pjb.117.1616744180801;
 Fri, 26 Mar 2021 00:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
 <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com> <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
In-Reply-To: <CAHAzn3rE7Xhvi3tW7EQ6+RAmRwY-Ldx4HiJbjzs7dxXoW=RcoA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 26 Mar 2021 08:36:09 +0100
Message-ID: <CAJ8uoz3YPVhho3JuZWZQVJOJFS6ZrQ25GNntFuritybQ2yHbHA@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Konstantinos Kaffes <kkaffes@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Mar 25, 2021 at 7:51 PM Konstantinos Kaffes <kkaffes@gmail.com> wrote:
>
> Great, thanks for the info! I will look into implementing this.
>
> For the time being, I implemented a version of my design with N^2
> sockets. I observed that when all traffic is directed to a single NIC
> queue, the throughput is higher than when I use all N NIC queues. I am
> using spinlocks to guard concurrent access to UMEM and the
> fill/completion rings. When I use a single NIC queue, I achieve
> ~1Mpps; when I use multiple ~550Kpps. Are these numbers reasonable,
> and this bad scaling behavior expected?

1Mpps sounds reasonable with SKB mode. If you use something simple
like the spinlock scheme you describe, then it will not scale. Check
the sample xsk_fwd.c in samples/bpf in the Linux kernel repo. It has a
mempool implementation that should scale better than the one you
implemented. For anything remotely complicated, something that manages
the buffers in the umem plus the fill and completion queues is usually
required. This is called a mempool most of the time. User-space
network libraries such as DPDK and VPP provide fast and scalable
mempool implementations. It would be nice to add a simple one to
libbpf, or rather libxdp as the AF_XDP functionality is moving over
there. Several people have asked for it, but unfortunately I have not
had the time.

>
> On Thu, 25 Mar 2021 at 00:24, Magnus Karlsson <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gmail.com> wrote:
> > >
> > > Hello everyone,
> > >
> > > I want to write a multi-threaded AF_XDP server where all N threads can
> > > read from all N NIC queues. In my design, each thread creates N AF_XDP
> > > sockets, each associated with a different queue. I have the following
> > > questions:
> > >
> > > 1. Do sockets associated with the same queue need to share their UMEM
> > > area and fill and completion rings?
> >
> > Yes. In zero-copy mode this is natural since the NIC HW will DMA the
> > packet into a umem that was decided long before the packet was even
> > received. And this is of course before we even get to pick what socket
> > it should go to. This restriction is currently carried over to
> > copy-mode, however, in theory there is nothing preventing supporting
> > multiple umems on the same netdev and queue id in copy-mode. It is
> > just that nobody has implemented support for it.
> >
> > > 2. Will there be a single XSKMAP holding all N^2 sockets? If yes, what
> > > happens if my XDP program redirects a packet to a socket that is
> > > associated with a different NIC queue than the one in which the packet
> > > arrived?
> >
> > You can have multiple XSKMAPs but you would in any case have to have
> > N^2 sockets in total to be able to cover all cases. Sockets are tied
> > to a specific netdev and queue id. If you try to redirect to socket
> > with a queue id or netdev that the packet was not received on, it will
> > be dropped. Again, for copy-mode, it would from a theoretical
> > perspective be perfectly fine to redirect to another queue id and/or
> > netdev since the packet is copied anyway. Maybe you want to add
> > support for it :-).
> >
> > > I must mention that I am using the XDP skb mode with copies.
> > >
> > > Thank you in advance,
> > > Kostis
>
>
>
> --
> Kostis Kaffes
> PhD Student in Electrical Engineering
> Stanford University
