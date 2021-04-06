Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DA93556A8
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Apr 2021 16:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345154AbhDFOap (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Apr 2021 10:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244717AbhDFOao (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Apr 2021 10:30:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E29FC06174A
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Apr 2021 07:30:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i18so11020270wrm.5
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Apr 2021 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qyX8UE48ACAyhhFsQtTHYoTn7pXKJKx7U9NflZocN0s=;
        b=Li8EIPvqPOnTcGuSVx0gV6VzJ69PKjfXO6NYotS06xQnr5VEynECme7RbpCO9aiU8q
         7UvDEKf9sGLY4mNIUX7Q0Wkqj5kyVMrMe6PdwZheUWwUJb++JUz0zSr0N2cxBHnkFP/r
         5lerFKyMkoyC5Um7Q5iK6g9hNOhkxR3SydQVzLkR7jWb/2gx9C06TFCP/Rl4Bv+tVxeP
         MHZMWzy/jbWEQw4dr+8IaiaCYVO2wU09VnqpoZp+8sSfS0ut3cxj2JkUT9N/BfGEZ9f4
         IwRgKFeUocETFUZdGjqf48KXZDSDS6rDCAV9ojgBvZFQ/166UM2Hd7ZlHvWyY1Q2L+e5
         3XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qyX8UE48ACAyhhFsQtTHYoTn7pXKJKx7U9NflZocN0s=;
        b=HntK4UpKNglc85T5MDflWcb7HbV9GpC4rzNst1bljT4LhK9zsxTxs3dHk4JFMhS2s+
         Z/waCOvb3ngxDRpogt2GbBfoFHtcpSMGI054XugiNUi57DeeYYl75K2k1FBD1BIDKgiK
         wW1qgxliTG99ze87Vv1kWC2DqBkImbbc8bUSgvY3o35z6YGV2gCrau+1DQBBjL4a+lZb
         mYItZfY+fo/e9MFnSzp8ZN0Y+RdK8VRYGL8Xwmom6R4+0gq1B8KWklC6Cj6heog1FbRn
         Yz8ZVD8XQ3zo69BOjL8JytqEYKOC1LGifbdLneb9+4IqzhXvR01ICtNhyFZYx5j9cIUu
         ZKqw==
X-Gm-Message-State: AOAM533YzOz6QkT38UOIWg5XiMoEVcl/G41RasiPddo5U/hHZUw/UoSS
        ANdB446iGZLOwsZCsgDaOZDprzsnJKU1Y4Kuk+P8tD88
X-Google-Smtp-Source: ABdhPJwJvIU2j3co7n81/Gr+yUKcnKnJzr+CPXimIMuXJYPRM9/92okOq3yMUW876m6osTdm96J032le+BylfhnLkyg=
X-Received: by 2002:adf:8292:: with SMTP id 18mr23442024wrc.160.1617719434931;
 Tue, 06 Apr 2021 07:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <2eefacdbbee1bac291abbdfffb40b09d58c21831.camel@coverfire.com>
 <CAJ+HfNj1GFP=jbu7G7JiYtnYdM9a+kzCsBtUno2ik2aToN5s4A@mail.gmail.com> <6ca5da2100bb91e5cea0312826937fb893eeeedc.camel@coverfire.com>
In-Reply-To: <6ca5da2100bb91e5cea0312826937fb893eeeedc.camel@coverfire.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Tue, 6 Apr 2021 16:30:23 +0200
Message-ID: <CAJ+HfNicZwQXthw7kO2L3JoXMtg8g7v+bC-zQJbQzYTfdTWuCg@mail.gmail.com>
Subject: Re: AF_XDP new prefer busy poll
To:     Dan Siemon <dan@coverfire.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 6 Apr 2021 at 02:50, Dan Siemon <dan@coverfire.com> wrote:
>
> On Mon, 2021-04-05 at 10:26 +0200, Bj=C3=B6rn T=C3=B6pel wrote:
> >
> > > 3) The patch linked below mentions adding recvmsg and sendmsg
> > > support
> > > for busy polling. The xdpsock example uses recvfrom(). What is the
> > > set
> > > of syscalls that can drive the busy polling? Is there a
> > > recommendation
> > > for which one(s) should be used?
> > >
> >
> > recvmsg/sendmsg and poll (which means read/recvfrom/recvmsg, and
> > corresponding on the write side). Use readfrom for rx queues, and
> > sendto for tx queues.  Poll works as well, but the overhead for poll
> > is larger than send/recv.
>
> To clarify, does this mean:
> * When a descriptor is added to fill ring or tx ring, call sendmsg.
> * When looking for descriptors in completion ring or rx ring, first
> call recvmsg()
>
> ?

Not quite; Tx (completetion/Tx ring) sendmsg, Rx (fill/Rx ring) recvmsg.

>
> Or are the fq and cq different vs. tx and rx?
>
> It might be useful to outline an idealized xsk loop. The loop I have
> looks something like:
>
> for each socket:
> 1) Process completion queue (read from cq)
> 2) Try to receive descriptors (read from rx queue)
> 3) Send any pending packets (write to tx queue)
> 4) Add descriptors to fq [based on a deficit counter condition] (write
> to fq)
>
> [My use case is packet forwarding between sockets]
>
> Ideally there wouldn't a syscall in each of those four steps.
>
> It it acceptable to call recvmsg once at the top of the loop and only
> call sendmsg() if one of steps 3 or 4 wrote to a queue (fq, tx)?
>

Yes, and moreover on the Tx side, you can write multiple packets and
then call one sendmsg() (but then the latency will be worse).

> In my use case, packet forwarding with dedicated cores, if one syscall
> at the top of the loop did 'send' and 'receive' that might be more
> efficient as the next iteration can process the descriptors written in
> the previous iteration.
>
> >
> > > 5)
> > >
> > > "If the application stops performing busy-polling via a system
> > > call,
> > > the watchdog timer defined by gro_flush_timeout will timeout, and
> > > regular softirq handling will resume."
> > >
> > > Does this imply that if the application fails to poll within the
> > > watchdog time that it needs to take action to get back into prefer
> > > busy
> > > polling mode?
> > >
> >
> > Yes. If the application fails to poll within the specified timeout,
> > the kernel will do driver polling at a pace of the timeout, and if
> > there are no packets after "defer count" times, interrupts will be
> > enabled. This to ensure that the driver is not starved by userland.
> > Have a look at Eric's commit above for details on the defer/timeout
> > logic.
>
> I need to dig a bit to understand this more. How does the application
> determine that interrupts have been re-enabled so it can disable them
> again?
>

The application doesn't need to care about that. It really just an
implementation detail; The only thing the application needs to do is
set the timeout/defer count, and make sure to do syscalls. Depending
on the kind of flows, the timeout/defer count can be tweaked for
better latency. The fact that interrupts get reenabled is just to make
sure that the driver isn't starved *if* the application is bad
behaved.

Does that make sense?


Cheers,
Bj=C3=B6rn

> Thanks for your help.
>
