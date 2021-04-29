Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BF336ED9A
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Apr 2021 17:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbhD2PsP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Apr 2021 11:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbhD2PsO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Apr 2021 11:48:14 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A19C06138B
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Apr 2021 08:47:27 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id md17so7428321pjb.0
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Apr 2021 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OnkYhkwRgYs/3nG4PJyQNiHNOfQ9XtFgDcwk8DjT0N4=;
        b=l/nunsM9t4gG/oBKw/DtDkBxlh7/B6XtzcEpZKwjfDhN+uDx67QG9tmvpQMJ3s5Y7p
         logYHQOl86PppmVsxg/7VpYTDIRbh3zcWma1MP44j5C7PTCveSP9kCyB0vKCs5XomNqS
         UN+wwkghm5OIaQ/eMXmzDexvT/eyG7gNa3yATDrvNQezhi4tUdhzPWZ7/6dqYwr+jm6C
         C2LCjy3f/XiPHRRnGqWrZM/MwSINACyNFWyzN/YpOp85Dt4tzJa9s8eq2pYcX7+iXUa+
         GmZHAO5ZlRvn2cs0NHJKElqopJo+299L4RJ9FfUdh9oc2HzCQzAlLIy5seNzQjDYILdL
         vidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OnkYhkwRgYs/3nG4PJyQNiHNOfQ9XtFgDcwk8DjT0N4=;
        b=sQoYJcd2+bJnfBRyo3jwp/ra0oJGglRJD0hYCJEVXdmvWkf1lWcOOcVRU/WNxyRB7B
         NEKPj0vyWqdIETKPAxlvWQd3/hITRLpNt2NXkkPdeo9tojeZl3KlJatY8AQ19Q9mJri0
         2QSMyP447uYKp007aHDXA63uyiddUJhgqjNZ5tsKrOrnrEiYntPGK+Ky/aHiRpvAv+XN
         WjkAKYaeYJX6UUIOkhFo9vZDC8Sq09sfvDuNhz1Ta6oAkaacbdFeP8VZAi6ez4RDS/Ps
         uO+Jwyv7r1a6TO0ENpB/sCRw76oTSIHGgpXc5Zb2wYuvzSc4/wkw5Dyd0BH7Vu2iMtjt
         3/aA==
X-Gm-Message-State: AOAM5301kNJhV9HbFNzJa6pbq+YtdJ70VxPJeqcQQssJdo+KeDq23SrA
        MRlRO+g7zJ4pONCPL8PhEGkrilPnuFn9Tzav0X8=
X-Google-Smtp-Source: ABdhPJw6B8f0E/9lQ27TQLHOB37lR7yfjvKUutwtf4MrgKpPCkWGmoIOvKR72q+QY0SrmzJe7+h7fPJ3t8smH5DLzVc=
X-Received: by 2002:a17:902:ff09:b029:ed:3b29:ff43 with SMTP id
 f9-20020a170902ff09b02900ed3b29ff43mr301674plj.14.1619711246453; Thu, 29 Apr
 2021 08:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
 <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
In-Reply-To: <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 29 Apr 2021 21:17:15 +0530
Message-ID: <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com>
Subject: Re: AF_XDP sendto kick returning EPERM
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Apr 27, 2021 at 12:58 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
> >
> > Hi,
> >
> > I'm using sendto() to kick tx in my AF_XDP program after I submit
> > descriptors to the tx ring -
> >
> > ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
> >
> > However, I'm receiving EPERM as the return value every time. AFAIK
> > this is not an expected return value. Since this is with i40e, I
> > checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> > running as root and I don't see any problems with creating the xsk,
> > configuring umem etc.
> >
> > Also, no packets seem to go out either.
> >
> > # uname -a
> > Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> > (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
> >
> > I don't see the problem on another machine with i40e but older kernel 5.4 series
> >
> > Any suggestions on what to look for or how to proceed?
>
> Weird. Have not seen this before. What is your command line for
> xdpsock? Is it unmodified?

This is not xdpsock, but my own AF_XDP program.

>
> Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
> this stack there must be an EPERM. You can run the same command on
> your system, but use ftrace to see what a sendto call hits. Then see
> where the code terminates.
>
> mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
> @[kstack()] = count(); }'
> Attaching 1 probe...
> ^C
>
> @[
>     xsk_sendmsg+1
>     sock_sendmsg+94
>     __sys_sendto+238
>     __x64_sys_sendto+37
>     do_syscall_64+51
>     entry_SYSCALL_64_after_hwframe+68
> ]: 2244805

Ostinato-1:~ # bpftrace -e 'kprobe:xsk_sendmsg {
@[kstack()] = count(); }'
Attaching 1 probe...^C@[
    xsk_sendmsg+1
    sock_sendmsg+94
    __sys_sendto+238
    __x64_sys_sendto+37
    do_syscall_64+51
    entry_SYSCALL_64_after_hwframe+68
]: 1253307

Which doesn't seem to suggest any error - I've looked at the source
code for all these functions, but don't see any reference to EPERM.

Srivats
