Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4FD37126D
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 May 2021 10:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhECIZi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 May 2021 04:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhECIZi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 May 2021 04:25:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625ECC06174A
        for <xdp-newbies@vger.kernel.org>; Mon,  3 May 2021 01:24:44 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id d10so3098940pgf.12
        for <xdp-newbies@vger.kernel.org>; Mon, 03 May 2021 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSAwFERcASSm4IZav3TSxZ53AmYSiz1vha/II3NCxdE=;
        b=huQQd2PacDV4Qb4h3+ciGfgpKuJYg2CNQY79WZlKrXoRhIJc1SulHIRf/tUE5ctZCM
         FwbvbMDaSg4bk+6Auh9JGiaaLBBjHGRsh6PGTuQS/+0ap+VAG8FBxJbvmDwKlNnjUdQ4
         5ce7jhdGxNnug1SjU2JjK2doZ3kEeoOshHEt/PuOEHTZly8ExA5d44d8zKRggDX04yVM
         qhxiPM6RrefO0kU4sPM7hX1KLPG7j/lkHjYfIfHeuuSPTwEcjICqrsRHgb4Ez7hsLvNl
         lwNhltMyygsGPX5yJlHwvFVXEDWg6YUCqMG2tY6218srGli5sRx1w90cK+msbkmu6dvf
         sl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSAwFERcASSm4IZav3TSxZ53AmYSiz1vha/II3NCxdE=;
        b=V+DHJW6wkF/MrY/RA04l9XL26uXTxXPX2/MTg+KzI/1HOLh3GDphcZPIMYwimc06AN
         YdJbwWdbxtN8XlfU8u/mOs+SU6+l7VbD1rrnFq79lf3SFsQsrg4dzLv3yH9XHdQpf0KD
         EzuJQT32S3l+YvTP1talov66YMnJgdYudvxOMejBpOQ1iD+4gvhrRBzfXDiwtpuVBV7M
         WhQAxSXw0mQ/4FllPdEJisxnyfIrcCEZ99lmnkvMfdUDHsfZbCfA1w+ir6itVFt8e99W
         ZELyGgzQJivscUopVRIz1Xfr1yAXH8n6QbvpkAFCOUEDkiGn/fNvkhm65AKERjY+/zOf
         GW9A==
X-Gm-Message-State: AOAM532yBuol97F50bJMD7AwYyvLvh1SvcfiQtm8N3rnEDZBJBjgauLp
        Mobhs7cA3yerBtiZA0EkatPVDRDL6Rsjw5h7oN4=
X-Google-Smtp-Source: ABdhPJypXgNQtxKZ8ZrL2JILVrl0eF8gwAfEGZ0DAuvDCKCDMoF3hxoArUp5/K+FubfI92K4Hd7m02NEpb9mXi+Q27k=
X-Received: by 2002:a62:6544:0:b029:261:14cc:b11d with SMTP id
 z65-20020a6265440000b029026114ccb11dmr17940068pfb.12.1620030283948; Mon, 03
 May 2021 01:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
 <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com> <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com>
In-Reply-To: <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 3 May 2021 10:24:33 +0200
Message-ID: <CAJ8uoz00gxM6j4tFgd64qA12Y-JxOGFq66qfbXMsxZAD+SUYRw@mail.gmail.com>
Subject: Re: AF_XDP sendto kick returning EPERM
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Apr 29, 2021 at 5:47 PM Srivats P <pstavirs@gmail.com> wrote:
>
> On Tue, Apr 27, 2021 at 12:58 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I'm using sendto() to kick tx in my AF_XDP program after I submit
> > > descriptors to the tx ring -
> > >
> > > ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
> > >
> > > However, I'm receiving EPERM as the return value every time. AFAIK
> > > this is not an expected return value. Since this is with i40e, I
> > > checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> > > running as root and I don't see any problems with creating the xsk,
> > > configuring umem etc.
> > >
> > > Also, no packets seem to go out either.
> > >
> > > # uname -a
> > > Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> > > (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
> > >
> > > I don't see the problem on another machine with i40e but older kernel 5.4 series
> > >
> > > Any suggestions on what to look for or how to proceed?
> >
> > Weird. Have not seen this before. What is your command line for
> > xdpsock? Is it unmodified?
>
> This is not xdpsock, but my own AF_XDP program.
>
> >
> > Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
> > this stack there must be an EPERM. You can run the same command on
> > your system, but use ftrace to see what a sendto call hits. Then see
> > where the code terminates.
> >
> > mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
> > @[kstack()] = count(); }'
> > Attaching 1 probe...
> > ^C
> >
> > @[
> >     xsk_sendmsg+1
> >     sock_sendmsg+94
> >     __sys_sendto+238
> >     __x64_sys_sendto+37
> >     do_syscall_64+51
> >     entry_SYSCALL_64_after_hwframe+68
> > ]: 2244805
>
> Ostinato-1:~ # bpftrace -e 'kprobe:xsk_sendmsg {
> @[kstack()] = count(); }'
> Attaching 1 probe...^C@[
>     xsk_sendmsg+1
>     sock_sendmsg+94
>     __sys_sendto+238
>     __x64_sys_sendto+37
>     do_syscall_64+51
>     entry_SYSCALL_64_after_hwframe+68
> ]: 1253307
>
> Which doesn't seem to suggest any error - I've looked at the source
> code for all these functions, but don't see any reference to EPERM.

It must be in there somewhere :-). Could you plesae use ftrace
(through perf for example) and trace all functions that a sendto hits
in your case? Then we might see what it hits.

Are you running in SKB mode or in zero-copy mode? Guess it is
zero-copy from your mail, but just want to verify. Does Rx work as
expected?

Could you share your AF_XDP program?

/Magnus

> Srivats
