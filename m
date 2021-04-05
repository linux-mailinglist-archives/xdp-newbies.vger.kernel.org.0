Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA41B353C62
	for <lists+xdp-newbies@lfdr.de>; Mon,  5 Apr 2021 10:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhDEI0n (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 5 Apr 2021 04:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhDEI0n (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 5 Apr 2021 04:26:43 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1882C061756
        for <xdp-newbies@vger.kernel.org>; Mon,  5 Apr 2021 01:26:35 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so7240142wml.2
        for <xdp-newbies@vger.kernel.org>; Mon, 05 Apr 2021 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X2WfD3S5RLCnX9L7pRRjZG7FNTQbWVk5I8arQBfOP8M=;
        b=gHuSQc6ECTH9lA9rhk6XiAuA1AAlUaDxqDGIJh9TYQ6GHmRPL7Kp5rKXhqgjjPfo6h
         ZPUEk1r+fz0tkAOd+muKipXhJU/yrGp9vGl7zYqgRObBL5oQt409M/NCfbR6sHTps2Aq
         wlvzGxRMr2E3NCeMJJ+Igph5/XS3FRsGcZrr16FCPtgrEDPoBrb2x+LdlE5MG+oFH3Hs
         6q0lVThuJBHmHtAr6SUIRSyMvwWKeY5Vc0Txw5Stt36XZ10aNqJ242mksZO8QHWNKCMo
         Sg59NbLlzCW66YXP2llJhNVcVQdDbxb8wGb3QcEWjldezeeUT8ApXngKq/MQqgWgxhBx
         ITVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X2WfD3S5RLCnX9L7pRRjZG7FNTQbWVk5I8arQBfOP8M=;
        b=ARvOqsfNUj4zROllT+31V62Zw5rbGkDSaJArqVFdB1yGh1Q5Rjx7CeBzI72UUwWMRc
         eDG3pJvqqx8hueJ+cWc47uUKDLrM2W+kqZ+6+ZIfVREaNwHI4AzaeNVyHoLi3l6TvYB/
         JZGYPonhOuo9faBQEQSztHJqbzvfiSNaLAXQnr5PfFCbjXNcuFUoi6WPoWJfumkr1abL
         vSGRmwFO0zHVgQjWo3CaQ2LnTG5ZBopOUFPk6AFMefX2S/YjzcwO2U8RYoDhQEXx5uB9
         HJUJS7b0xvQ/bA5F4NlwnHylAmP4h30NYEoms2GxERVK+zTDX0sV9nkWxOBVS0D3BzRa
         +tcw==
X-Gm-Message-State: AOAM531Z2SM9Ki17XsqLYw5vbz3wq0qd4eJYAuC76o4wTOPaASuSa25w
        5O9DJ2+MtyWyiyWVPl4/zVR/r5Zw0cg0l0cTI2A=
X-Google-Smtp-Source: ABdhPJxRQDAxd9jHm6Wzr+4o4HA4uWPo9onB2pKTTMNRAlsKS3OgSJd1d4ddT/xWIcxHLX/5WIYzVBpaNMoI/jLRdE4=
X-Received: by 2002:a1c:7714:: with SMTP id t20mr23759782wmi.107.1617611194610;
 Mon, 05 Apr 2021 01:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <2eefacdbbee1bac291abbdfffb40b09d58c21831.camel@coverfire.com>
In-Reply-To: <2eefacdbbee1bac291abbdfffb40b09d58c21831.camel@coverfire.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Mon, 5 Apr 2021 10:26:22 +0200
Message-ID: <CAJ+HfNj1GFP=jbu7G7JiYtnYdM9a+kzCsBtUno2ik2aToN5s4A@mail.gmail.com>
Subject: Re: AF_XDP new prefer busy poll
To:     Dan Siemon <dan@coverfire.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Dan, sorry for the late reply. I'm in easter mode. :-)

On Thu, 1 Apr 2021 at 22:09, Dan Siemon <dan@coverfire.com> wrote:
>
> I've started working on adding SO_PREFER_BUSY_POLL [1] to afxdp-rs [2].
> I have a few questions that I haven't been able to answer definitively
> from docs or commits.
>
> 1) To confirm, configuration like the below is required?
>
> echo 2 | sudo tee /sys/class/net/ens785f1/napi_defer_hard_irqs
> echo 200000 | sudo tee /sys/class/net/ens785f1/gro_flush_timeout
>

Yes, but the defer count and timeout is really up to you. The "prefer
busy-polling" is built on top of commit 6f8b12d661d0 ("net: napi: add
hard irqs deferral feature").

> 2) It's not clear to me what polling operations are required. It looks
> like the xdpdock example was modified to call recvfrom() and sendto()
> in every situation where previously the condition was that the
> need_wakeup flag was set on one of the queues. It looks like this
> structure may do extra syscalls?
>

Yes. More below.

> It it sufficient to 'poll' (I don't mean the syscall here) the socket
> once with one syscall operation or do we need the equivalent of a send
> and recv operation (like the example) in each loop iteration?
>

The idea with busy-polling from a kernel perspective is that the
driver code is entered via the syscall (read or write). For the
receive side: syscall() -> enter the napi poll implementation of the
netdev, and pass the packets (if any) to the XDP socket ring.
With busy-polling enabled there are no interrupts or softirq
mechanisms that execute the driver code. IOW, it's up to userland to
call the driver via a syscall. Busy-polling will typically require
more syscalls than a need_wakeup mode (as you noted above).

Again, when you are executing in busy-polling mode, the userland
application has to do a syscall to run the driver code. Does that mean
that userland can starve the driver? No, and this is where the time
out/defer count comes in. I'll expand on this in 5 (below)

> 3) The patch linked below mentions adding recvmsg and sendmsg support
> for busy polling. The xdpsock example uses recvfrom(). What is the set
> of syscalls that can drive the busy polling? Is there a recommendation
> for which one(s) should be used?
>

recvmsg/sendmsg and poll (which means read/recvfrom/recvmsg, and
corresponding on the write side). Use readfrom for rx queues, and
sendto for tx queues.  Poll works as well, but the overhead for poll
is larger than send/recv.

> 4) In situations where there are multiple sockets, will it work to do
> one poll syscall with multiple fds to reduce the number of syscalls? Is
> that a good idea?
>

The current implementation is really a one socket/syscall thing.
Magnus and I had some ideas on extending busy-polling for a set of
sockets, but haven't had a use-case for it yet.

> 5)
>
> "If the application stops performing busy-polling via a system call,
> the watchdog timer defined by gro_flush_timeout will timeout, and
> regular softirq handling will resume."
>
> Does this imply that if the application fails to poll within the
> watchdog time that it needs to take action to get back into prefer busy
> polling mode?
>

Yes. If the application fails to poll within the specified timeout,
the kernel will do driver polling at a pace of the timeout, and if
there are no packets after "defer count" times, interrupts will be
enabled. This to ensure that the driver is not starved by userland.
Have a look at Eric's commit above for details on the defer/timeout
logic.

> On the plus side, the initial performance numbers look good but there
> are a lot of drops as traffic ramps up that I haven't figured out the
> cause of yet. There are no drops once it's running in a steady state.
>

Interesting! Please let me know your results, and if you run into weirdness=
!


Also, please let me know if you need more input!

Cheers!
Bj=C3=B6rn


> Thanks for any help or insight.
>
> [1] - https://lwn.net/Articles/837010/
> [2] - https://github.com/aterlo/afxdp-rs
>
