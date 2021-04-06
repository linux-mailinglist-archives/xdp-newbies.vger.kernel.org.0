Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4D43549CC
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Apr 2021 02:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242977AbhDFAuw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 5 Apr 2021 20:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237938AbhDFAuw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 5 Apr 2021 20:50:52 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12697C06174A
        for <xdp-newbies@vger.kernel.org>; Mon,  5 Apr 2021 17:50:45 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id j26so8590397iog.13
        for <xdp-newbies@vger.kernel.org>; Mon, 05 Apr 2021 17:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coverfire.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QMXqEujY0RPl+Ebpn1wAhzLh/Z+58nrQTbGl+EcI20E=;
        b=cjMaV2jTpjOY4phiW//0p3lFId7CNsbiplXDeB5gvH7vKAludK5eQNupDYDoEH719N
         JdUX2EypdvFpZ2yACa7SXTAaFrQXOiemtn+uuDdXBpdTad04fctHiy6601EEu4F86gbA
         FuJkFgjhhs8idrqoqbc3mclx3oYYeLObEnqaVGpn7skv68cClessObbO6vUD2LVOfc41
         BqEgNx2olkEbYmnKmJzWatkVRqbD8KgznrTFOdDkMpmVi02dIzKdpaGvNyLZF7ccIjwj
         O4K/c2IIz4TIrGK/IBms0Jc3atWsM+HGUgicdZbSDbPlJDrk9m2VVZXO9QNijZiedq4/
         7pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QMXqEujY0RPl+Ebpn1wAhzLh/Z+58nrQTbGl+EcI20E=;
        b=jYdJDTvRvjNt8t7N7aRscuDpTyoDs/Ee8Kb4u4jHdVd8kZ+GG6sFRNVy01NbHJ045O
         TPaYbU6HpIGyul1127mXv0XqVIsKlYx01S5oSJ6iOq4w0BhKxQznKBOtL7StZGUd7CAE
         FFKCVdUNgxTvC1bFd9A7n7o/HdqMz7itIrLJAW2I7dcGFulzhZ4jdJN7z97lksfTvIcf
         g9LUMC3W1hpsxqzDChrB6V6dIlq8za3QDr1F7K6S43vPbG/VwvAgdLnhdPHk8v/PWWJL
         OEsoQAiIl6jSLd0m4grj5qhkZfNaiBvDHMCudZIj50WJxdrxKj9Y7Yn+pfxDhbcRqeUk
         QOCw==
X-Gm-Message-State: AOAM530fRXK086ojLiM7Yz16tBv65c6fMIwIZqp2tVKP1erJHvKC/ZdQ
        ZlSvhBwiuPc3Nu+Mje1MHGywCQ==
X-Google-Smtp-Source: ABdhPJwPnLjc3xpSq4pYfLqlBT8+aHAb7PhyxR55D74WRcwlISoZvanMWcsy+NC2WAPBhPjd0Sbv1w==
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr21602753iom.40.1617670244513;
        Mon, 05 Apr 2021 17:50:44 -0700 (PDT)
Received: from ?IPv6:2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a? ([2607:f2c0:e56e:28c:e4de:d9eb:cc0b:f46a])
        by smtp.gmail.com with ESMTPSA id h8sm11328323ila.52.2021.04.05.17.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 17:50:44 -0700 (PDT)
Message-ID: <6ca5da2100bb91e5cea0312826937fb893eeeedc.camel@coverfire.com>
Subject: Re: AF_XDP new prefer busy poll
From:   Dan Siemon <dan@coverfire.com>
To:     =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Cc:     "Karlsson, Magnus" <magnus.karlsson@intel.com>
Date:   Mon, 05 Apr 2021 20:50:42 -0400
In-Reply-To: <CAJ+HfNj1GFP=jbu7G7JiYtnYdM9a+kzCsBtUno2ik2aToN5s4A@mail.gmail.com>
References: <2eefacdbbee1bac291abbdfffb40b09d58c21831.camel@coverfire.com>
         <CAJ+HfNj1GFP=jbu7G7JiYtnYdM9a+kzCsBtUno2ik2aToN5s4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 2021-04-05 at 10:26 +0200, Björn Töpel wrote:
> 
> > 3) The patch linked below mentions adding recvmsg and sendmsg
> > support
> > for busy polling. The xdpsock example uses recvfrom(). What is the
> > set
> > of syscalls that can drive the busy polling? Is there a
> > recommendation
> > for which one(s) should be used?
> > 
> 
> recvmsg/sendmsg and poll (which means read/recvfrom/recvmsg, and
> corresponding on the write side). Use readfrom for rx queues, and
> sendto for tx queues.  Poll works as well, but the overhead for poll
> is larger than send/recv.

To clarify, does this mean:
* When a descriptor is added to fill ring or tx ring, call sendmsg.
* When looking for descriptors in completion ring or rx ring, first
call recvmsg()

?

Or are the fq and cq different vs. tx and rx?

It might be useful to outline an idealized xsk loop. The loop I have
looks something like:

for each socket:
1) Process completion queue (read from cq)
2) Try to receive descriptors (read from rx queue)
3) Send any pending packets (write to tx queue)
4) Add descriptors to fq [based on a deficit counter condition] (write
to fq)

[My use case is packet forwarding between sockets]

Ideally there wouldn't a syscall in each of those four steps.

It it acceptable to call recvmsg once at the top of the loop and only
call sendmsg() if one of steps 3 or 4 wrote to a queue (fq, tx)?

In my use case, packet forwarding with dedicated cores, if one syscall
at the top of the loop did 'send' and 'receive' that might be more
efficient as the next iteration can process the descriptors written in
the previous iteration.

> 
> > 5)
> > 
> > "If the application stops performing busy-polling via a system
> > call,
> > the watchdog timer defined by gro_flush_timeout will timeout, and
> > regular softirq handling will resume."
> > 
> > Does this imply that if the application fails to poll within the
> > watchdog time that it needs to take action to get back into prefer
> > busy
> > polling mode?
> > 
> 
> Yes. If the application fails to poll within the specified timeout,
> the kernel will do driver polling at a pace of the timeout, and if
> there are no packets after "defer count" times, interrupts will be
> enabled. This to ensure that the driver is not starved by userland.
> Have a look at Eric's commit above for details on the defer/timeout
> logic.

I need to dig a bit to understand this more. How does the application
determine that interrupts have been re-enabled so it can disable them
again?

Thanks for your help.

