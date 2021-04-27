Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1764436C013
	for <lists+xdp-newbies@lfdr.de>; Tue, 27 Apr 2021 09:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbhD0H3G (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 27 Apr 2021 03:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhD0H3F (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 27 Apr 2021 03:29:05 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B493C061574
        for <xdp-newbies@vger.kernel.org>; Tue, 27 Apr 2021 00:28:23 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id h20so30380138plr.4
        for <xdp-newbies@vger.kernel.org>; Tue, 27 Apr 2021 00:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGdmk0dbsSkQOmyP7pF53H3FpH8GJMnTcJPCvrtAvP4=;
        b=dFQ6Y3T/+O2E0qc8Mwn48ZciW0LXQvYNXXSsHmd1JXxtBWcNc5oB/Ib1spgLrkxrUo
         1+T8I5X7bB4iw/+xA8n94lozieY2VAmeYNWISfES3DNt3Y0Eju3OuvOVlc2M4RmqG19x
         LyNury/JSbSWm3OnloXOZXFc5PMn5HEKf7gTQtgJ1UPBpsEF+KvgbJlokKLoHGO5bKHi
         NkpRDbvt3dH4baFjnIW4nTEgxGzQ6jy6X7ZlF8t86MBQrXk12sKcjy5CCxzIEdvDp8PF
         LtXusN8GTXPQz5qV1nweQN+yBoM+xW2zM1fzV9Mv87GDjVoyt3dq0aeo1zJvzA3Rfufl
         oqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGdmk0dbsSkQOmyP7pF53H3FpH8GJMnTcJPCvrtAvP4=;
        b=NniEy8GSXr+jmTe9SubGoteoOU7maXOlUl4getgFowyIGXeNve1B6oQa38K+FNXSav
         XfCixBu7t2uHxO4nbp+xYEZO57QSicsvhnm14IRwQIOmIhVWrTpSX4oBoqeJUZkupjTR
         4+FvYwzWDky0mbhZsqy0BSDZOl0nKtTWw9QBZN6yOT/uT3Z3Mdy8m1qjjhxGiPDLoC8s
         e7Vrj5p50fuLTYwlz8w9UOE5qarOKZqmvkWiYNydPo5ujk4IOowELdI4LAPenZPn09NL
         7fkzby2al/X3pqNFZKsr2eHFgJ8kk+nSIeJUJNbRUKTBLR7TE7dxXs/X2OrRohZXjCM1
         t8dA==
X-Gm-Message-State: AOAM531e/TMY3ETb0W4evE11RD0Ep+ciFxZxzc54DCeQ9YFlFB529ZMm
        0h6JI4+XUQ/LabsHGieqenU6/YTRhaww8nKUKoQ=
X-Google-Smtp-Source: ABdhPJx6ZJ+ogk3qqHolwVeLOWzVaS9es6wUHlkBbFMHM5SxhRtMc841gLbEVj9tzmC9U7zvbVpeus9LxZsX67rcZWM=
X-Received: by 2002:a17:90a:650c:: with SMTP id i12mr3493350pjj.204.1619508502721;
 Tue, 27 Apr 2021 00:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
In-Reply-To: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 27 Apr 2021 09:28:11 +0200
Message-ID: <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
Subject: Re: AF_XDP sendto kick returning EPERM
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> I'm using sendto() to kick tx in my AF_XDP program after I submit
> descriptors to the tx ring -
>
> ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
>
> However, I'm receiving EPERM as the return value every time. AFAIK
> this is not an expected return value. Since this is with i40e, I
> checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> running as root and I don't see any problems with creating the xsk,
> configuring umem etc.
>
> Also, no packets seem to go out either.
>
> # uname -a
> Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
>
> I don't see the problem on another machine with i40e but older kernel 5.4 series
>
> Any suggestions on what to look for or how to proceed?

Weird. Have not seen this before. What is your command line for
xdpsock? Is it unmodified?

Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
this stack there must be an EPERM. You can run the same command on
your system, but use ftrace to see what a sendto call hits. Then see
where the code terminates.

mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
@[kstack()] = count(); }'
Attaching 1 probe...
^C

@[
    xsk_sendmsg+1
    sock_sendmsg+94
    __sys_sendto+238
    __x64_sys_sendto+37
    do_syscall_64+51
    entry_SYSCALL_64_after_hwframe+68
]: 2244805


> Srivats
