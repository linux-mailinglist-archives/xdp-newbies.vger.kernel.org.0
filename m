Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9394C3767B5
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 May 2021 17:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhEGPKQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 May 2021 11:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhEGPKQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 May 2021 11:10:16 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5314DC061574
        for <xdp-newbies@vger.kernel.org>; Fri,  7 May 2021 08:09:16 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id v13so5275882ple.9
        for <xdp-newbies@vger.kernel.org>; Fri, 07 May 2021 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kBl2XB6RJYHConC7fINfnIcO4Rsehvtigy4R9OXXxzg=;
        b=oI0iNUd49qmCi/goBmeqYy26tB1uYlDa3RezCLME/iyLI53x2pEtOFDqJjoY2Diw/2
         QkJas7i9dIyEY88NdWzGl3SdE7HpVpvurSMaTdwCrXaPCIsN3gQTptRjDzBuN778T7Vh
         D2hCs7AZd9EKCVV806w1jLulIPjvKV7YEd58vt7bS4CVYVhs2nKBtwHQOIYovFmNcxpf
         jc5UbbXPGYC3oaOWiWsHchFOuhyMNqHUB/L8EhmGldKpP1wTLu6YMn10v0JVsO5aHrY5
         +EMcz28lYvZf5rGSNMb04JaFcoHVGVNfXElLjoXLGVJGC/UqgNmjUk2XsuFnEV1AUApi
         6/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kBl2XB6RJYHConC7fINfnIcO4Rsehvtigy4R9OXXxzg=;
        b=F+BuxviU0KgHnpgljcZ3z5FkNwM0NTYCvKp80jm0SeCLVUGo4Gha2jzQMB10vlo+G7
         wDx7JaLoEIQ7DJGI4bCtATdxBRwj9xEZu57uJje1a0mJTxsySqjUCekbhq/sNI8/nsUH
         M9h+K6R/m0fgEa9BalVprjRu1l97fOrthWrG1Jjqp7ws/koskeQHjDPVauE/f8XQY6o3
         WZKb1OH/9Pt8pXvVocJatfSsluEQakX/A7Il5hG5dbUj1ws9k/Db14ropO3GIX8T1Emd
         13ubGXdmyuCTUqzBF8B5NSKI84Oa0lS2s8dXAGFIwk1mhqkxzyd69IyfXqHTliRO1W2D
         +BFQ==
X-Gm-Message-State: AOAM533c8Z6cV8YsMelfwuSdAtMMOLqgsXrFUplqL+aE+jNQtPYPmKl9
        RsL4c82c00qtieZCJ/Xg8kTxqyVzOCbw/2eiisE=
X-Google-Smtp-Source: ABdhPJxtY4L1OIbae6z6sf4IccCSM4GmEZe6b1Gt4+LjrWncTdyfxtIDKAakzoeaNQ3h6DFlV3x+xbsiffh/EBbzISg=
X-Received: by 2002:a17:90a:690d:: with SMTP id r13mr24986460pjj.19.1620400155811;
 Fri, 07 May 2021 08:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
 <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
 <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com>
 <CAJ8uoz00gxM6j4tFgd64qA12Y-JxOGFq66qfbXMsxZAD+SUYRw@mail.gmail.com> <CANzUK5_K5fv6eYr+xd7ThQ_FywD2KCZ55KB+0YJr8oZ49sVKrg@mail.gmail.com>
In-Reply-To: <CANzUK5_K5fv6eYr+xd7ThQ_FywD2KCZ55KB+0YJr8oZ49sVKrg@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 7 May 2021 20:39:04 +0530
Message-ID: <CANzUK58GBOELxcKfYL5-gjrZ0WHU4LmurLgk1MwT7+05sgUrDA@mail.gmail.com>
Subject: Re: AF_XDP sendto kick returning EPERM
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Here's an update -

On Fri, May 7, 2021 at 8:17 PM Srivats P <pstavirs@gmail.com> wrote:
>
> On Mon, May 3, 2021 at 1:54 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, Apr 29, 2021 at 5:47 PM Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > On Tue, Apr 27, 2021 at 12:58 PM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I'm using sendto() to kick tx in my AF_XDP program after I submit
> > > > > descriptors to the tx ring -
> > > > >
> > > > > ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
> > > > >
> > > > > However, I'm receiving EPERM as the return value every time. AFAIK
> > > > > this is not an expected return value. Since this is with i40e, I
> > > > > checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> > > > > running as root and I don't see any problems with creating the xsk,
> > > > > configuring umem etc.
> > > > >
> > > > > Also, no packets seem to go out either.
> > > > >
> > > > > # uname -a
> > > > > Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> > > > > (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
> > > > >
> > > > > I don't see the problem on another machine with i40e but older kernel 5.4 series
> > > > >
> > > > > Any suggestions on what to look for or how to proceed?
> > > >
> > > > Weird. Have not seen this before. What is your command line for
> > > > xdpsock? Is it unmodified?
> > >
> > > This is not xdpsock, but my own AF_XDP program.
> > >
> > > >
> > > > Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
> > > > this stack there must be an EPERM. You can run the same command on
> > > > your system, but use ftrace to see what a sendto call hits. Then see
> > > > where the code terminates.
> > > >
> > > > mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
> > > > @[kstack()] = count(); }'
> > > > Attaching 1 probe...
> > > > ^C
> > > >
> > > > @[
> > > >     xsk_sendmsg+1
> > > >     sock_sendmsg+94
> > > >     __sys_sendto+238
> > > >     __x64_sys_sendto+37
> > > >     do_syscall_64+51
> > > >     entry_SYSCALL_64_after_hwframe+68
> > > > ]: 2244805
> > >
> > > Ostinato-1:~ # bpftrace -e 'kprobe:xsk_sendmsg {
> > > @[kstack()] = count(); }'
> > > Attaching 1 probe...^C@[
> > >     xsk_sendmsg+1
> > >     sock_sendmsg+94
> > >     __sys_sendto+238
> > >     __x64_sys_sendto+37
> > >     do_syscall_64+51
> > >     entry_SYSCALL_64_after_hwframe+68
> > > ]: 1253307
> > >
> > > Which doesn't seem to suggest any error - I've looked at the source
> > > code for all these functions, but don't see any reference to EPERM.
> >
> > It must be in there somewhere :-). Could you plesae use ftrace
> > (through perf for example) and trace all functions that a sendto hits
> > in your case? Then we might see what it hits.
> >
> > Are you running in SKB mode or in zero-copy mode? Guess it is
> > zero-copy from your mail, but just want to verify. Does Rx work as
> > expected?
> >
> > Could you share your AF_XDP program?
>
> After some experimentation and a lot of head-scratching, I found part
> of the problem last night. The sendto() was not returning EPERM (-1),
> but ENXIO (-6) - I was mistakenly printing the return value of the
> sento() call (which always returns -1 in case of failure), instead of
> errno (duh!).
>
> Looking at the code, I see ENXIO is returned if the xsk is unbound.
> I'm still investigating this and will post an update soon. The problem
> is happening at a customer end and there's some delay and follow up
> required to get the logs.

sendto() was returning ENXIO because the interface MTU was set to 9000
which I know is not supported with AF_XDP. But shouldn't
xsk_socket__create() fail in this case? Note the actual packet being
transmitted was 64 bytes.

Not sure if it has a role in the above sendto() failure, but before
xsk socket create, my call to bpf_set_link_xdp_fd() was failing
because of the MTU problem (the newly added error message for this
case was very helpful!). Once MTU was reduced to 1500 both the RX eBPF
program link to the interface failure and the TX sendto() returning
ENXIO always went away. Kernel version 5.12

Can someone tell me what is expected to happen for a Tx AF_XDP socket
in case of MTU > 4K?

I also found a second case of sendto() returning ENXIO. In this
scenario, I was removing my RX eBPF program by calling

    bpf_set_link_xdp_fd(ifIndex, -1, 0)

while AF_XDP transmit (and associated sento() wakeup) was still going
on. In this case, sendto starts failing with ENETDOWN for some time
followed by ENXIO subsequently. This case was on Kernel version 5.4.0

Does removing a XDP program cause the interface to go down (ENETDOWN)
leading to XDP socket unbind (ENXIO)? Should removing (or replacing)
an RX eBPF program, affect AF_XDP TX?

Srivats
