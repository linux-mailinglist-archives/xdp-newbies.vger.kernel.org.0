Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9929881E
	for <lists+xdp-newbies@lfdr.de>; Mon, 26 Oct 2020 09:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1422267AbgJZIPA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 26 Oct 2020 04:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29446 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1421974AbgJZIPA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 26 Oct 2020 04:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603700098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=daQcal4/uXaUnmXQDlL9/XKxSo7q3aHQh0nHOMjD0hw=;
        b=Z9twi6xQDUXauOQRpjyXTEyswBNlCQDVzKGmBQRLZvDAfL2Zr/RTaUbC4bGhxOaXA1ojq7
        Y7UKhr5rKH8QaIfHz7QLX5I0bQddle368eSyAnMfDAJ9SlVXtaPjg854DgWjRQ9t7bLN9W
        LVaPEPyvY87Ju4AThjY2xaojNQ/R58E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-r-_M-4MFO4e4tr2SRsa1kA-1; Mon, 26 Oct 2020 04:14:54 -0400
X-MC-Unique: r-_M-4MFO4e4tr2SRsa1kA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF71807321;
        Mon, 26 Oct 2020 08:14:53 +0000 (UTC)
Received: from carbon (unknown [10.36.110.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 752FF10013C0;
        Mon, 26 Oct 2020 08:14:49 +0000 (UTC)
Date:   Mon, 26 Oct 2020 09:14:48 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: Multi-core scalability problems
Message-ID: <20201026091448.1a407c86@carbon>
In-Reply-To: <VI1PR04MB31048EB4062CAE0C9245B87F9E1B0@VI1PR04MB3104.eurprd04.prod.outlook.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <87r1q29ita.fsf@toke.dk>
        <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014111529.6e464b4b@carbon>
        <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201014162636.39c2ba14@carbon>
        <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201015152252.4360cf9a@carbon>
        <VI1PR04MB31049251BB588E95D5C5E3009E1E0@VI1PR04MB3104.eurprd04.prod.outlook.com>
        <20201019202621.690aaacd@carbon>
        <VI1PR04MB31048EB4062CAE0C9245B87F9E1B0@VI1PR04MB3104.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, 24 Oct 2020 15:57:50 +0200
Federico Parola <fede.parola@hotmail.it> wrote:

> On 19/10/20 20:26, Jesper Dangaard Brouer wrote:
> > On Mon, 19 Oct 2020 17:23:18 +0200
> > Federico Parola <fede.parola@hotmail.it> wrote:  
>  >>
>  >> [...]
>  >>
> >> Hi Jesper, sorry for the late reply, this are the cache refs/misses for
> >> 4 flows and different rx ring sizes:
> >>
> >> RX 512 (9.4 Mpps dropped):
> >> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
> >>     23771011  cache-references                                (+-  0.04% )
> >>      8865698  cache-misses      # 37.296 % of all cache refs  (+-  0.04% )
> >>
> >> RX 128 (39.4 Mpps dropped):
> >> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
> >>     68177470  cache-references                               ( +-  0.01% )
> >>        23898  cache-misses      # 0.035 % of all cache refs  ( +-  3.23% )
> >>
> >> Reducing the size of the rx ring brings to a huge decrease in cache
> >> misses, is this the effect of DDIO turning on?  
> > 
> > Yes, exactly.
> > 
> > It is very high that 37.296 % of all cache refs is being cache-misses.
> > The number of cache-misses 8,865,698 is close to your reported 9.4
> > Mpps. Thus, seems to correlate with the idea that this is DDIO-missing
> > as you have a miss per packet.
> > 
> > I can see that you have selected a subset of the CPUs (0,1,2,13), it
> > important that this is the active CPUs.  I usually only select a
> > single/individual CPU to make sure I can reason about the numbers.
> > I've seen before that some CPUs get DDIO effect and others not, so
> > watch out for this.
> > 
> > If you add HW-counter -e instructions -e cycles to your perf stat
> > command, you will also see the instructions per cycle calculation.  You
> > should notice that the cache-miss also cause this number to be reduced,
> > as the CPUs stalls it cannot keep the CPU pipeline full/busy.
> > 
> > What kind of CPU are you using?
> > Specifically cache-sizes (use dmidecode look for "Cache Information")
> >   
> I'm using an Intel Xeon Gold 5120, L1: 896 KiB, L2: 14 MiB, L3: 19.25 MiB.

Is this a NUMA system?

The numbers you report is for all cores together.  Looking at [1] and
[2], I can see this is a 14-cores CPU. According to [3] the cache is:

Level 1 cache size:
	14 x 32 KB 8-way set associative instruction caches
	14 x 32 KB 8-way set associative data caches

Level 2 cache size:
 	14 x 1 MB 16-way set associative caches

Level 3 cache size
	19.25 MB 11-way set associative non-inclusive shared cache

One thing that catch my eye is the "non-inclusive" cache.  And that [4]
states "rearchitected cache hierarchy designed for server workloads".



[1] https://en.wikichip.org/wiki/intel/xeon_gold/5120
[2] https://ark.intel.com/content/www/us/en/ark/products/120474/intel-xeon-gold-5120-processor-19-25m-cache-2-20-ghz.html
[3] https://www.cpu-world.com/CPUs/Xeon/Intel-Xeon%205120.html
[4] https://en.wikichip.org/wiki/intel/xeon_gold

> > The performance drop is a little too large 39.4 Mpps -> 9.4 Mpps.
> > 
> > If I were you, I would measure the speed of the memory, via using the
> > tool lmbench-3.0 command 'lat_mem_rd'.
> > 
> >   /usr/lib/lmbench/bin/x86_64-linux-gnu/lat_mem_rd 2000 128
> > 
> > The output is the nanosec latency of accessing increasing sizes of	
> > memory.  The jumps/increases in latency should be fairly clear and
> > shows the latency of the different cache levels.  For my CPU E5-1650 v4
> > @ 3.60GHz with 15MB L2 cache, I see L1=1.055ns, L2=5.521ns, L3=17.569ns.
> > (I could not find a tool that tells me the cost of accessing main-memory,
> > but maybe it is the 17.569ns, as the tool measurement jump from 12MB
> > (5.933ns) to 16MB (12.334ns) and I know L3 is 15MB, so I don't get an
> > accurate L3 measurement.)
> >   
> I run the benchmark, I can see to well distinct jumps (L1 and L2 cache I 
> guess) of 1.543ns and 5.400ns, but then the latency grows gradually:

Guess you left out some numbers below for the 1.543ns measurement you
mention in the text.  There is a plateau at 5.508ns, and another at
plateau 8.629ns, which could be L3?

> 0.25000 5.400
> 0.37500 5.508
> 0.50000 5.508
> 0.75000 6.603
> 1.00000 8.247
> 1.50000 8.616
> 2.00000 8.747
> 3.00000 8.629
> 4.00000 8.629
> 6.00000 8.676
> 8.00000 8.800
> 12.00000 9.119
> 16.00000 10.840
> 24.00000 16.650
> 32.00000 19.888
> 48.00000 21.582
> 64.00000 22.519
> 96.00000 23.473
> 128.00000 24.125
> 192.00000 24.777
> 256.00000 25.124
> 384.00000 25.445
> 512.00000 25.642
> 768.00000 25.775
> 1024.00000 25.869
> 1536.00000 25.942
> I can't really tell where L3 cache and main memory start.

I guess the plateau around 25.445ns is the main memory speed. 

The latency different is very large, but the performance drop is still
too large 39.4 Mpps -> 9.4 Mpps.  Back-of-envelope calc, 8.629ns to
25.445ns is approx a factor 3 (25.445/8.629=2.948).  9.4 Mpps x factor
is 27.7Mpps, 39.4 Mpps div factor is 13.36Mpps.  Meaning it doesn't
add-up to explain this difference.


> One thing I forgot to mention is that I experience the same performance 
> drop even without specifying the --readmem flag of the bpf sample 
> (no_touch mode), if I'm not wrong without the flag the ebpf program 
> should not access to the packet buffer and therefore the DDIO should 
> have no effect.

I was going to ask you to swap between --readmem flag and no_touch
mode, and then measure if perf-stat cache-misses stay the same.  It
sounds like you already did this?

The DDIO/DCA is something the CPU chooses to do, based on proprietary
design by Intel.  Thus, it is hard to say why DDIO is acting like this.
E.g. still causing a cache-miss even when using no_touch mode.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

