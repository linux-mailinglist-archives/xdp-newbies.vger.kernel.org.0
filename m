Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA7292D80
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 Oct 2020 20:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgJSS0d (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 19 Oct 2020 14:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44256 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729369AbgJSS0d (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 19 Oct 2020 14:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603131991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KDjON8xeC3cMqbV/FYZl/aXuP8dfl/3Zur05UT4Qbh8=;
        b=MOaViohfKSLBajqEttmapEstwWyWU52/ANstQbsxkPCycUFnCCSRY3rydAbKpYk4jZWuW1
        bNbx143u1AB21LledsCDpwI0yfgoXWB1cCZJShDk3foiGWPFAiZyfZEGZoDTDqw6kwLQps
        GeuvThpSIj6COQfKIli+Jlw9+v49o98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-7upNLQXcPhy1Kkl_QAFezQ-1; Mon, 19 Oct 2020 14:26:27 -0400
X-MC-Unique: 7upNLQXcPhy1Kkl_QAFezQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F471020900;
        Mon, 19 Oct 2020 18:26:26 +0000 (UTC)
Received: from carbon (unknown [10.36.110.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 048C260DA0;
        Mon, 19 Oct 2020 18:26:22 +0000 (UTC)
Date:   Mon, 19 Oct 2020 20:26:21 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Multi-core scalability problems
Message-ID: <20201019202621.690aaacd@carbon>
In-Reply-To: <VI1PR04MB31049251BB588E95D5C5E3009E1E0@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <87r1q29ita.fsf@toke.dk>
        <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014111529.6e464b4b@carbon>
        <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014162636.39c2ba14@carbon>
        <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201015152252.4360cf9a@carbon>
        <VI1PR04MB31049251BB588E95D5C5E3009E1E0@VI1PR04MB3104.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 19 Oct 2020 17:23:18 +0200
Federico Parola <fede.parola@hotmail.it> wrote:

> On 15/10/20 15:22, Jesper Dangaard Brouer wrote:
> > On Thu, 15 Oct 2020 14:04:51 +0200
> > Federico Parola <fede.parola@hotmail.it> wrote:
> >   
> >> On 14/10/20 16:26, Jesper Dangaard Brouer wrote:  
> >>> On Wed, 14 Oct 2020 14:17:46 +0200
> >>> Federico Parola <fede.parola@hotmail.it> wrote:
> >>>      
> >>>> On 14/10/20 11:15, Jesper Dangaard Brouer wrote:  
> >>>>> On Wed, 14 Oct 2020 08:56:43 +0200
> >>>>> Federico Parola <fede.parola@hotmail.it> wrote:
> >>>>>
> >>>>> [...]  
> >>>>>>> Can you try to use this[2] tool:
> >>>>>>>      ethtool_stats.pl --dev enp101s0f0
> >>>>>>>
> >>>>>>> And notice if there are any strange counters.
> >>>>>>>
> >>>>>>>
> >>>>>>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl  
> > [...]
> >   
> >>>> The only solution I've found so far is to reduce the size of the rx ring
> >>>> as I mentioned in my former post. However I still see a decrease in
> >>>> performance when exceeding 4 cores.  
> >>>
> >>> What is happening when you are reducing the size of the rx ring is two
> >>> things. (1) i40e driver have reuse/recycle-pages trick that get less
> >>> efficient, but because you are dropping packets early you are not
> >>> affected. (2) the total size of L3 memory you need to touch is also
> >>> decreased.
> >>>
> >>> I think you are hitting case (2).  The Intel CPU have a cool feature
> >>> called DDIO (Data-Direct IO) or DCA (Direct Cache Access), which can
> >>> deliver packet data into L3 cache memory (if NIC is directly PCIe
> >>> connected to CPU).  The CPU is in charge when this feature is enabled,
> >>> and it will try to avoid L3 trashing and disable it in certain cases.
> >>> When you reduce the size of the rx rings, then you are also needing
> >>> less L3 cache memory, to the CPU will allow this DDIO feature.
> >>>
> >>> You can use the 'perf stat' tool to check if this is happening, by
> >>> monitoring L3 (and L2) cache usage.  
> >>
> >> What events should I monitor? LLC-load-misses/LLC-loads?  
> > 
> > Looking at my own results from xdp-paper[1], it looks like that it
> > results in real 'cache-misses' (perf stat -e cache-misses).
> > 
> > E.g I ran:
> >   sudo ~/perf stat -C3 -e cycles -e  instructions -e cache-references -e cache-misses -r 3 sleep 1
> > 
> > Notice how the 'insn per cycle' gets less efficient when we experience
> > these cache-misses.
> > 
> > Also how RX-size of queues affect XDP-redirect in [2].
> > 
> > 
> > [1] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench01_baseline.org
> > [2] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench05_xdp_redirect.org
> >  
> Hi Jesper, sorry for the late reply, this are the cache refs/misses for 
> 4 flows and different rx ring sizes:
> 
> RX 512 (9.4 Mpps dropped):
> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
>    23771011  cache-references                                (+-  0.04% )
>     8865698  cache-misses      # 37.296 % of all cache refs  (+-  0.04% )
> 
> RX 128 (39.4 Mpps dropped):
> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
>    68177470  cache-references                               ( +-  0.01% )
>       23898  cache-misses      # 0.035 % of all cache refs  ( +-  3.23% )
> 
> Reducing the size of the rx ring brings to a huge decrease in cache 
> misses, is this the effect of DDIO turning on?

Yes, exactly.

It is very high that 37.296 % of all cache refs is being cache-misses.
The number of cache-misses 8,865,698 is close to your reported 9.4
Mpps. Thus, seems to correlate with the idea that this is DDIO-missing
as you have a miss per packet.

I can see that you have selected a subset of the CPUs (0,1,2,13), it
important that this is the active CPUs.  I usually only select a
single/individual CPU to make sure I can reason about the numbers.
I've seen before that some CPUs get DDIO effect and others not, so
watch out for this.

If you add HW-counter -e instructions -e cycles to your perf stat
command, you will also see the instructions per cycle calculation.  You
should notice that the cache-miss also cause this number to be reduced,
as the CPUs stalls it cannot keep the CPU pipeline full/busy.

What kind of CPU are you using?
Specifically cache-sizes (use dmidecode look for "Cache Information")

The performance drop is a little too large 39.4 Mpps -> 9.4 Mpps.  

If I were you, I would measure the speed of the memory, via using the
tool lmbench-3.0 command 'lat_mem_rd'.

 /usr/lib/lmbench/bin/x86_64-linux-gnu/lat_mem_rd 2000 128

The output is the nanosec latency of accessing increasing sizes of	
memory.  The jumps/increases in latency should be fairly clear and
shows the latency of the different cache levels.  For my CPU E5-1650 v4
@ 3.60GHz with 15MB L2 cache, I see L1=1.055ns, L2=5.521ns, L3=17.569ns.
(I could not find a tool that tells me the cost of accessing main-memory,
but maybe it is the 17.569ns, as the tool measurement jump from 12MB
(5.933ns) to 16MB (12.334ns) and I know L3 is 15MB, so I don't get an
accurate L3 measurement.)

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

