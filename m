Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C859419DA46
	for <lists+xdp-newbies@lfdr.de>; Fri,  3 Apr 2020 17:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404212AbgDCPfV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 3 Apr 2020 11:35:21 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:41310 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404171AbgDCPfV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 3 Apr 2020 11:35:21 -0400
Received: by mail-ua1-f43.google.com with SMTP id f9so2867834uaq.8
        for <xdp-newbies@vger.kernel.org>; Fri, 03 Apr 2020 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUN3+D9f8HgzBE+rLWYQdsOTMZmsY7MAkIBKpZsSoLk=;
        b=MQ69IU8K7m2hBu+gbldPJi7UoRiKmtGMPt46sUoIGfnaEu7+7qYyEe0ELxWrWzB0+O
         ETM8A800KHFSSpqCCfcIMOZATiWm/f8jH5hLHlq2OxNAUsUKwq7z8/RE9CrzS8AJA+ee
         0FWZrjF3LdQbIhS4OASKxlP+a8A8V9/YWW8vk6ySKCvBRukMo0wh2r+x9C22dFp8Yiz0
         YlNvWkE6w4ymyhGj1XQlD8y4FXV0Ox2Z3S73+ynqYwRdm10PjwuwXJfy1k9BOCGRU3R+
         UiuO2PL7qtrOFEuN0hQ058X/5aig7ruPrjDn8Rrk8Y/KqeA3J8rAPHVOyZt5AWPpBXrV
         8SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUN3+D9f8HgzBE+rLWYQdsOTMZmsY7MAkIBKpZsSoLk=;
        b=C7F9dTJ5yOpoRFiFmhPSUx//Ad2kBl5BLEG9oc/OV16snnyAlJ9mBh1w2juAu60E2W
         18lbc73Z+3wZUMz3aopWW25Dkm0MuLJ82JtmVevLoQXZPaw/a+XDAE7okpkVbbyosaDB
         6odjCpBcKXmXWtzDu+M+y8mhG9xNwwnMkn/IDu/a71S3KywmkViX8Be081I8V0YddZJ6
         TrJ1pJVA5k70zbsz/U81crl/OYjKlRREjrSXbSa+KpwFF+UZz+zcC0qmsNu897C6GCBB
         esWcVX6aHeJ+3DelbB6oXZZMKwQy9aQbynq0DnGfCjxGVqUkkzkDtawFEYg1GTV/0Q3Z
         b+zw==
X-Gm-Message-State: AGi0PubV9bZ1hocFE4CqSxeZTvFCjT+5wpkKG2aAdFRf9kOQVh2qxsV0
        wWD7BoWFywTlSUP0pfRfENGVH8YiXNjaJMrgTXc1Zs7C
X-Google-Smtp-Source: APiQypL7Y/1jj2wCOm84VXLx0gnF9jbZSk2U+0smcE2xRZQ0/CaLKCniMbqNehuf25PnrTtuYby27tLX5Hr01GHiL1s=
X-Received: by 2002:ab0:e5:: with SMTP id 92mr6996751uaj.83.1585928119689;
 Fri, 03 Apr 2020 08:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <7c11add0-e837-4ce4-9158-249c800d0d2d@www.fastmail.com>
 <CAJ8uoz1FeupoucsiF_Nrxv6S+XVXjpeB_pqcNJ3n12B1XsEyAQ@mail.gmail.com> <20200403153138.GA28761@apathy>
In-Reply-To: <20200403153138.GA28761@apathy>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 3 Apr 2020 17:35:05 +0200
Message-ID: <CAJ8uoz189EFoHgLQpsvDfDW=wVzhxrbT7+oNx=5t3ys-61k35Q@mail.gmail.com>
Subject: Re: Running XSK on a tun device
To:     Gilberto Bertin <me@jibi.io>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 3, 2020 at 5:31 PM Gilberto Bertin <me@jibi.io> wrote:
>
> On Fri, Apr 03, 2020 at 04:10:39PM +0200, Magnus Karlsson wrote:
> > On Fri, Apr 3, 2020 at 3:07 AM Gilberto Bertin <me@jibi.io> wrote:
> > >
> > > I am trying to bind an XSK socket to a tun device, so that I can run some
> > > automated tests on an XSK based server I'm working on. A tun device would in
> > > fact allow me to have fine control over what packets I'm sending to and
> > > receiving from the server (as opposed for example to an approach where the
> > > server listens on a regular interface and tests interact with it over sockets).
> > >
> > > The XSK logic of the server is largely based on the one presented in the
> > > xdpsock_user sample in samples/bpf in the Linux kernel (the server is using the
> > > XDP_USE_NEED_WAKEUP bind flag).
> > >
> > > When I manually interact with it using a pair of veth devices and netcat,
> > > everything works as expected: the server receives and then sends back packets
> > > properly.
> > >
> > > The troubles start when I try to bind it to a tun device as I am not able to move
> > > any packet between the device and the server.
> > >
> > > I tried then to reproduce the issue with a simplified setup based on the
> > > xdpsock_user sample, and I got the same results (I tested different combination
> > > of options such as driver mode vs skb mode, poll vs non poll mode, need-wakeup
> > > vs no-need-wakeup, all with the same outcome).
> > >
> > > By inspecting more closely the behavior of the sample program I found that:
> > >
> > > - packets are actually being received in the rx ring, as poll returns 1 each time
> > >   something is written on the fd of the tun device
> > > - the program gets stuck in rx_drop() [1], more precisely in:
> > >
> > >         ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
> > >         while (ret != rcvd) {
> > >                 if (ret < 0)
> > >                         exit_with_error(-ret);
> > >                 if (xsk_ring_prod__needs_wakeup(&xsk->umem->fq))
> > >                         ret = poll(fds, num_socks, opt_timeout);
> > >                 ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
> > >         }
> > >
> > >   where xsk_ring_prod__reserve keeps returning 0.
> >
> > Which kernel version are you running? If my memory serves me right, in
> > versions prior to 5.6, the update of the global state that signifies
> > that there is space available in the fill ring was updated in a lazy
> > manner. If you are not using the latest kernel, could you please try
> > it? Maybe it could give us some hints on what is going on.
>
> I was using a 5.6.0 kernel. I just tested the latest 5.6.2 and I keep
> experiencing the same behaviour.
>
> > Also have to say that the sample program is quite simplistic. If you
> > cannot reserve some entries in the fill ring at some point, you should
> > just go ahead and do something else (receive for example) and come
> > back later and try to do the same thing. It is not critical to always
> > be able to fill it again, even though it is good practice in a high
> > performance situation to keep it as full as possible to minimize the
> > risk of packet loss.
>
> Makes sense, thanks! I'll have a look at updating that logic.
>
> I just tried another XSK example program (the one in the xdp-tutorial repo)
> which does something slightly different then the xdpsock_user one: it uses
> xsk_prod_nb_free() to (as I understand it) determine if it's possible to reserve
> and then submit descriptors in the fq ring [1]. With this logic I'm able to
> receive packets succesfully from the tun interface.

Good.

> > Note that there is not zero-copy support for TUN, but there is XDP
> > support so copy mode and XDP_DRV should work.
>
> Ack
>
> > Also note that I have
> > never tried TUN with AF_XDP, so you can have stumbled upon something
> > new.
>
> Makes sense, not sure at this point if this should be considered a bug of the
> tun driver or if other drivers may exibit the same behaviour. In the latter case
> I'd be happy to help updating the sample if you think it's worth it
> (once I understand a bit more how the whole thing works :P).

That is a good idea. Please do, so that the example gets better and
more relevant.

/Magnus

> Next I'll check if the TX path works correctly with tun, and eventually follow
> up with my findings.
>
> Thanks,
> Gilberto
>
> [1] https://github.com/xdp-project/xdp-tutorial/blob/cc0f4fbaabff9c149e5981beb71f7b52f02a6391/advanced03-AF_XDP/af_xdp_user.c#L345-L368
