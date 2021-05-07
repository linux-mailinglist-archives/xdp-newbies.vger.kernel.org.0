Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4D7376731
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 May 2021 16:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236302AbhEGOsi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 May 2021 10:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbhEGOsi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 May 2021 10:48:38 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21064C061574
        for <xdp-newbies@vger.kernel.org>; Fri,  7 May 2021 07:47:33 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id i14so7315395pgk.5
        for <xdp-newbies@vger.kernel.org>; Fri, 07 May 2021 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NiWc5Iix6iLx09gF6DI44k0ckLodq/xbb01Sv9BzTHM=;
        b=bT9acKMkA2nOcxb44he2VCBXp+SI/6K9hPSWaZZ8xmGxKV3nDNho7Zi8Rr9dVNCHSJ
         IWYVOSjQWFJebiNNk+vC/AmwR5tlFapPVqiT7cSquBzh0IUwhdp3c9ff4R4XPadwQg6p
         92U6NFBBS3blBWCCJnFwpMbMRs5l3i1cFGL1/877eERKWwHPS8Qli31FNPwy0hnLxrC1
         xp3oF/Kd39iAHEFliJQG4jsBafVROfEwI1vUHj0I12JIcw3zQ+FGNVadZgauiTCteM00
         bh1+9RqixGAPXUXK1RK+qR0da25cGyeXlhy0LBFHw+5ebSLxZWBeIW4nfw+ysMJM0BgT
         2QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NiWc5Iix6iLx09gF6DI44k0ckLodq/xbb01Sv9BzTHM=;
        b=AI7u5aw/1XM/i62YTQPAUUktNqU73Nzy/8K+/n1WWiFENoViqQFPhnflwAQ34QVgZh
         R/mgCbC/MLLN1yoJu45zcfiYBHRzYVT29B8eBCX8uspq43fPIzX06vIufbcbCSZ4l4YD
         9PMTpo/zj8cigOfdk1ZjDhF+WpNVe8bqg8qlqeXsAqnCcPBNmQBwfZQgnCZeCzVFFmGp
         1Ae1vb1q1gTPxh6TBIalQfDAN4cYwiFsSrgFZJdHMfWvgZ4B3jm17bnbJ+JoSLFJUxb1
         wBVGfzgYf9PHyiB7xRBDYXOrwiCkv0pKYtQsH6lHFEonJhBXspX89iso1+lIdp/3N6cE
         TrFQ==
X-Gm-Message-State: AOAM533vLYX/yakiWOpXJ+LtpXYscz8rnvuemh8Jn/adNfouNoB4LMX6
        zi/NzNKKKWhD0DEhi3QHGbK7wyWfeEPic7TTgrtdyW8sp8w=
X-Google-Smtp-Source: ABdhPJyRDVvjHJEaBRFroY0eEoJ8C9bjNBhqNWECqZ/TwG8Cn2lb+iabNms41NUtH6ECAnJOdNGC1s018Zi7p1LgZGI=
X-Received: by 2002:a65:640c:: with SMTP id a12mr10100497pgv.229.1620398852446;
 Fri, 07 May 2021 07:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
 <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
 <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com> <CAJ8uoz00gxM6j4tFgd64qA12Y-JxOGFq66qfbXMsxZAD+SUYRw@mail.gmail.com>
In-Reply-To: <CAJ8uoz00gxM6j4tFgd64qA12Y-JxOGFq66qfbXMsxZAD+SUYRw@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 7 May 2021 20:17:21 +0530
Message-ID: <CANzUK5_K5fv6eYr+xd7ThQ_FywD2KCZ55KB+0YJr8oZ49sVKrg@mail.gmail.com>
Subject: Re: AF_XDP sendto kick returning EPERM
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, May 3, 2021 at 1:54 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, Apr 29, 2021 at 5:47 PM Srivats P <pstavirs@gmail.com> wrote:
> >
> > On Tue, Apr 27, 2021 at 12:58 PM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I'm using sendto() to kick tx in my AF_XDP program after I submit
> > > > descriptors to the tx ring -
> > > >
> > > > ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
> > > >
> > > > However, I'm receiving EPERM as the return value every time. AFAIK
> > > > this is not an expected return value. Since this is with i40e, I
> > > > checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> > > > running as root and I don't see any problems with creating the xsk,
> > > > configuring umem etc.
> > > >
> > > > Also, no packets seem to go out either.
> > > >
> > > > # uname -a
> > > > Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> > > > (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
> > > >
> > > > I don't see the problem on another machine with i40e but older kernel 5.4 series
> > > >
> > > > Any suggestions on what to look for or how to proceed?
> > >
> > > Weird. Have not seen this before. What is your command line for
> > > xdpsock? Is it unmodified?
> >
> > This is not xdpsock, but my own AF_XDP program.
> >
> > >
> > > Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
> > > this stack there must be an EPERM. You can run the same command on
> > > your system, but use ftrace to see what a sendto call hits. Then see
> > > where the code terminates.
> > >
> > > mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
> > > @[kstack()] = count(); }'
> > > Attaching 1 probe...
> > > ^C
> > >
> > > @[
> > >     xsk_sendmsg+1
> > >     sock_sendmsg+94
> > >     __sys_sendto+238
> > >     __x64_sys_sendto+37
> > >     do_syscall_64+51
> > >     entry_SYSCALL_64_after_hwframe+68
> > > ]: 2244805
> >
> > Ostinato-1:~ # bpftrace -e 'kprobe:xsk_sendmsg {
> > @[kstack()] = count(); }'
> > Attaching 1 probe...^C@[
> >     xsk_sendmsg+1
> >     sock_sendmsg+94
> >     __sys_sendto+238
> >     __x64_sys_sendto+37
> >     do_syscall_64+51
> >     entry_SYSCALL_64_after_hwframe+68
> > ]: 1253307
> >
> > Which doesn't seem to suggest any error - I've looked at the source
> > code for all these functions, but don't see any reference to EPERM.
>
> It must be in there somewhere :-). Could you plesae use ftrace
> (through perf for example) and trace all functions that a sendto hits
> in your case? Then we might see what it hits.
>
> Are you running in SKB mode or in zero-copy mode? Guess it is
> zero-copy from your mail, but just want to verify. Does Rx work as
> expected?
>
> Could you share your AF_XDP program?

After some experimentation and a lot of head-scratching, I found part
of the problem last night. The sendto() was not returning EPERM (-1),
but ENXIO (-6) - I was mistakenly printing the return value of the
sento() call (which always returns -1 in case of failure), instead of
errno (duh!).

Looking at the code, I see ENXIO is returned if the xsk is unbound.
I'm still investigating this and will post an update soon. The problem
is happening at a customer end and there's some delay and follow up
required to get the logs.

Srivats
