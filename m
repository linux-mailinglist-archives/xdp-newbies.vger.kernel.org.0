Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEF1377775
	for <lists+xdp-newbies@lfdr.de>; Sun,  9 May 2021 17:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhEIPzD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 9 May 2021 11:55:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:40342 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229645AbhEIPzC (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 9 May 2021 11:55:02 -0400
IronPort-SDR: cyQc5OzPyYuY4ZgcmOrySxPnXxcrFaXGkzlQ92wiWYmepDxFO6XTxpz2uNQNIce6YCROyUpz55
 1doQm5EiZcpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="199092377"
X-IronPort-AV: E=Sophos;i="5.82,286,1613462400"; 
   d="scan'208";a="199092377"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2021 08:53:58 -0700
IronPort-SDR: gobyDLyulXBRFKQ3OBbyf/RWHB7fcLEYB1KGs3u22xTDL7fo83Llw0obbsZOghnHtaEpRLspcf
 B+CKxBsraRRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,286,1613462400"; 
   d="scan'208";a="470508801"
Received: from ranger.igk.intel.com ([10.102.21.164])
  by orsmga001.jf.intel.com with ESMTP; 09 May 2021 08:53:56 -0700
Date:   Sun, 9 May 2021 17:41:36 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Srivats P <pstavirs@gmail.com>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: AF_XDP sendto kick returning EPERM
Message-ID: <20210509154136.GA36905@ranger.igk.intel.com>
References: <CANzUK58=fjW-iqBqm6drSfC679T0C+68bRj8BzxqrTYWAzDHJg@mail.gmail.com>
 <CAJ8uoz1pwuJ0A+C6wBnSG76Q4j4-BrvDKvKc3gHVCJA=71oJgw@mail.gmail.com>
 <CANzUK5-SnTLZdOXvF3xf+x=qfuCvFFqKKUr51z3=s_kAi4oAbw@mail.gmail.com>
 <CAJ8uoz00gxM6j4tFgd64qA12Y-JxOGFq66qfbXMsxZAD+SUYRw@mail.gmail.com>
 <CANzUK5_K5fv6eYr+xd7ThQ_FywD2KCZ55KB+0YJr8oZ49sVKrg@mail.gmail.com>
 <CANzUK58GBOELxcKfYL5-gjrZ0WHU4LmurLgk1MwT7+05sgUrDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANzUK58GBOELxcKfYL5-gjrZ0WHU4LmurLgk1MwT7+05sgUrDA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, May 07, 2021 at 08:39:04PM +0530, Srivats P wrote:
> Here's an update -
> 
> On Fri, May 7, 2021 at 8:17 PM Srivats P <pstavirs@gmail.com> wrote:
> >
> > On Mon, May 3, 2021 at 1:54 PM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Thu, Apr 29, 2021 at 5:47 PM Srivats P <pstavirs@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 27, 2021 at 12:58 PM Magnus Karlsson
> > > > <magnus.karlsson@gmail.com> wrote:
> > > > >
> > > > > On Fri, Apr 23, 2021 at 5:44 PM Srivats P <pstavirs@gmail.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I'm using sendto() to kick tx in my AF_XDP program after I submit
> > > > > > descriptors to the tx ring -
> > > > > >
> > > > > > ret = sendto(xsk_socket__fd(xsk_), NULL, 0, MSG_DONTWAIT, NULL, 0);
> > > > > >
> > > > > > However, I'm receiving EPERM as the return value every time. AFAIK
> > > > > > this is not an expected return value. Since this is with i40e, I
> > > > > > checked i40e_xsk_wakeup() - but that also doesn't return EPERM. I am
> > > > > > running as root and I don't see any problems with creating the xsk,
> > > > > > configuring umem etc.
> > > > > >
> > > > > > Also, no packets seem to go out either.
> > > > > >
> > > > > > # uname -a
> > > > > > Linux Ostinato-1 5.11.15-1-default #1 SMP Fri Apr 16 16:47:34 UTC 2021
> > > > > > (64fb5bf) x86_64 x86_64 x86_64 GNU/Linux
> > > > > >
> > > > > > I don't see the problem on another machine with i40e but older kernel 5.4 series
> > > > > >
> > > > > > Any suggestions on what to look for or how to proceed?
> > > > >
> > > > > Weird. Have not seen this before. What is your command line for
> > > > > xdpsock? Is it unmodified?
> > > >
> > > > This is not xdpsock, but my own AF_XDP program.
> > > >
> > > > >
> > > > > Using bpftrace, we can get the call stack of xsk_sendmsg. Somewhere in
> > > > > this stack there must be an EPERM. You can run the same command on
> > > > > your system, but use ftrace to see what a sendto call hits. Then see
> > > > > where the code terminates.
> > > > >
> > > > > mkarlsso@kurt:~/src/dna-linux$ sudo bpftrace -e 'kprobe:xsk_sendmsg {
> > > > > @[kstack()] = count(); }'
> > > > > Attaching 1 probe...
> > > > > ^C
> > > > >
> > > > > @[
> > > > >     xsk_sendmsg+1
> > > > >     sock_sendmsg+94
> > > > >     __sys_sendto+238
> > > > >     __x64_sys_sendto+37
> > > > >     do_syscall_64+51
> > > > >     entry_SYSCALL_64_after_hwframe+68
> > > > > ]: 2244805
> > > >
> > > > Ostinato-1:~ # bpftrace -e 'kprobe:xsk_sendmsg {
> > > > @[kstack()] = count(); }'
> > > > Attaching 1 probe...^C@[
> > > >     xsk_sendmsg+1
> > > >     sock_sendmsg+94
> > > >     __sys_sendto+238
> > > >     __x64_sys_sendto+37
> > > >     do_syscall_64+51
> > > >     entry_SYSCALL_64_after_hwframe+68
> > > > ]: 1253307
> > > >
> > > > Which doesn't seem to suggest any error - I've looked at the source
> > > > code for all these functions, but don't see any reference to EPERM.
> > >
> > > It must be in there somewhere :-). Could you plesae use ftrace
> > > (through perf for example) and trace all functions that a sendto hits
> > > in your case? Then we might see what it hits.
> > >
> > > Are you running in SKB mode or in zero-copy mode? Guess it is
> > > zero-copy from your mail, but just want to verify. Does Rx work as
> > > expected?
> > >
> > > Could you share your AF_XDP program?

+1, that would help us probably :)

> >
> > After some experimentation and a lot of head-scratching, I found part
> > of the problem last night. The sendto() was not returning EPERM (-1),
> > but ENXIO (-6) - I was mistakenly printing the return value of the
> > sento() call (which always returns -1 in case of failure), instead of
> > errno (duh!).
> >
> > Looking at the code, I see ENXIO is returned if the xsk is unbound.
> > I'm still investigating this and will post an update soon. The problem
> > is happening at a customer end and there's some delay and follow up
> > required to get the logs.
> 
> sendto() was returning ENXIO because the interface MTU was set to 9000
> which I know is not supported with AF_XDP. But shouldn't
> xsk_socket__create() fail in this case? Note the actual packet being
> transmitted was 64 bytes.

It depends. You said that you have your own AF_XDP app, so if you're
setting the XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD flag then libbpf wouldn't
be loading the built-in AF_XDP eBPF prog on interface and that's where the
failure should happen.

> 
> Not sure if it has a role in the above sendto() failure, but before
> xsk socket create, my call to bpf_set_link_xdp_fd() was failing
> because of the MTU problem (the newly added error message for this
> case was very helpful!). Once MTU was reduced to 1500 both the RX eBPF
> program link to the interface failure and the TX sendto() returning
> ENXIO always went away. Kernel version 5.12
> 
> Can someone tell me what is expected to happen for a Tx AF_XDP socket
> in case of MTU > 4K?

See the last paragraph.

> 
> I also found a second case of sendto() returning ENXIO. In this
> scenario, I was removing my RX eBPF program by calling
> 
>     bpf_set_link_xdp_fd(ifIndex, -1, 0)
> 
> while AF_XDP transmit (and associated sento() wakeup) was still going
> on. In this case, sendto starts failing with ENETDOWN for some time
> followed by ENXIO subsequently. This case was on Kernel version 5.4.0

I think that we addressed the ENETDOWN Tx issue with the following set:
https://lore.kernel.org/netdev/20200205045834.56795-1-maciej.fijalkowski@intel.com/

I see that it has been merged in 5.6. But it was related to being unable
to spawn multiple AF_XDP Tx-only instances. With what you're saying it
feels to me that you have multiple instances of your AF_XDP progs and you
terminate one of them? Previously, every instance would die due to the
fact that the underlying XDP prog would be unloaded from interface, but
right now we have bpf_link support for AF_XDP which would handle that
properly. Note that it was developed for the built-in prog.

> 
> Does removing a XDP program cause the interface to go down (ENETDOWN)
> leading to XDP socket unbind (ENXIO)? Should removing (or replacing)
> an RX eBPF program, affect AF_XDP TX?

Removing XDP prog causes the interface to undergo the reset or some other
mechanism as it needs to remove the XDP Tx resources and change the Rx
memory model. For Intel drivers, the AF_XDP Tx resources are configured
during the load of Rx eBPF prog. We would have to develop some mechanism
that detaches the creation of XDP Tx resources from loading Rx eBPF prog.
There have been discussions around feature detection but I think it was
about the opposite - don't configure Tx rings if your prog will not be
doing XDP_TX action.

> 
> Srivats
