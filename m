Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6149AA3D
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 10:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732398AbfHWIWf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Fri, 23 Aug 2019 04:22:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59766 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390278AbfHWIWf (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 04:22:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 12E7C30832DA;
        Fri, 23 Aug 2019 08:22:34 +0000 (UTC)
Received: from carbon (ovpn-200-29.brq.redhat.com [10.40.200.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 557BE6092D;
        Fri, 23 Aug 2019 08:22:25 +0000 (UTC)
Date:   Fri, 23 Aug 2019 10:22:24 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     brouer@redhat.com,
        =?UTF-8?B?SsO6bGl1cw==?= Milan <Julius.Milan@pantheon.tech>,
        Marek =?UTF-8?B?WsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>,
        William Tu <u9012063@gmail.com>
Subject: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Message-ID: <20190823102224.16141c87@carbon>
In-Reply-To: <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
        <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 23 Aug 2019 08:22:34 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Bringing these questions to the xdp-newbies list, where they belong.
Answers inlined below.

On Tue, 20 Aug 2019 21:17:57 +0200 Július Milan <Julius.Milan@pantheon.tech>
> 
> I am writing AF_XDP driver for FDio VPP. I have 2 questions.
>

That sounds excellent.  I was hoping someone would do this for FDio VPP.
Do notice that DPDK now also got AF_XDP support.  IHMO it makes a lot
of sense to implement AF_XDP for FDio, and avoid the DPDK dependency.
(AFAIK FDio already got other back-ends than DPDK).
 

> 1 - I created a simple driver according to sample in kernel. I load my XDP
> program and pin the maps.
> 
>   Then in user application I create a socket, mmap the memory and
> push it to xskmap in program. All fine yet.
> 
>   Then I start another instance of user application and do the
> same, create socket, mmap the memory and trying to
> 
>   push it somewhere else into the map. But I got  errno: 16
> "Device or resource busy" when trying to bind.
> 
>   I guess the memory can’t be mmaped 2 times, but should be
> shared, is that correct?

I'm cc'ing the AF_XDP experts, as I'm not sure myself.  I mostly deal
with the in-kernel XDP path.  (AF_XDP is essentially kernel bypass :-O)

 
>   If so, I am wondering how to solve this nicely.
> 
>   Can I store the value of first socket (that created the mmaped
> memory) in some special map in my XDP program to avoid complicated
> inter-process communication?
> 
>   And what happens if this first socket is closed while any other
> sockets are still alive (using its shared mmaped memory)?
> 
>   What would you recommend? Maybe you have some sample.

We just added a sample (by Eelco Cc'ed) into XDP-tutorial:
 https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_XDP  

At-least read the README.org file... to get over the common gotchas.

AFAIK the sample doesn't cover your use-case.  I guess, we/someone
should extend the sample, to illustrate how how multiple interfaces can
share the same UMEM.

The official documentation is:
 https://www.kernel.org/doc/html/latest/networking/af_xdp.html


>   Can I do also atomic operations? (I want it just for such rare
> cases as initialization of next socket, to check if there already is
> one, that mmaped the memory)
> 
> 
> 
> 2 – We want to do also some decap/encap on XDP layer, before
> redirecting it to the socket.
> 

Decap on XDP layer is an excellent use-case, that demonstrate
cooperation between XDP and AF_XDP kernel-bypass facility.


>   On RX way it is easy, I do what I want and redirect it to the
> socket, but can I achieve the same also on TX?
> 

(Yes, RX case is easy)

We don't have an XDP TX hook yet... but so many people have requested
this, that we should add this.

>   Can I catch the packet while TX in XDP and do something with it
> (encapsulate it) before sending it out?

Usually, we recommend people use the TC egress BPF hook to do the encap
in TX.  For the AF_XDP use-case, the TC hook isn't there... so that is
not an option.  Again an argument for an XDP-TX hook.  You, could
of-cause add the encap header in your AF_XDP userspace program, but I
do understand it would make architectural sense that in-kernel XDP
would act as a decap/encap layer.

 
>   If so what about performance?
> 

For AF_XDP RX-side is really really fast, even in copy-mode.

For AF_XDP TX-side in copy-mode, it is rather slow, as it allocates
SKBs etc.  We could optimize this further but we have not.  When
enabling AF_XDP zero-copy mode, the TX-side is also super fast.

Another hint, for AF_XDP TX-side, remember to "produce" several packets
before doing the sendmsg system call.  Thus, effectively doing bulking
on the TX-ring.


>
> By the way, great job with XDP ;)

Thanks! 

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
