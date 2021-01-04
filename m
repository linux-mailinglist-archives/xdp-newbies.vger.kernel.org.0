Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351DF2E9835
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Jan 2021 16:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbhADPO6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 4 Jan 2021 10:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbhADPO5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 4 Jan 2021 10:14:57 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BED4C061793
        for <xdp-newbies@vger.kernel.org>; Mon,  4 Jan 2021 07:14:17 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id p18so19207264pgm.11
        for <xdp-newbies@vger.kernel.org>; Mon, 04 Jan 2021 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPShOO8QDTzYeDH4N4LcYl5Ar5RwK6BIR0slE1LbqUw=;
        b=dHOS/k1Hl6EgVcLTpuSgiLY8uQtgidmdcu8DKiwEs1gu3B1ZOQZ91AIStuwIV69cQG
         dzNFuptJQLsmbpyqzp+AOiFeKM7KQ3cINcoj3n+eE1Lh0RJo6teo20w4Xh6yMyz/stPl
         cI/C1vsroSjcaGGSAWF/2PStOIGVGU0fP1U+fjRnHh9Mt4GjN2YWZwFjlC1S8/ccg0bj
         WlFxojEf7gDzJNzLHP2+Ufd9q+iHRnhjr5YynLMRUyWNfYvfPEQpD+w6cyGfnRmvknF6
         912w2nRt9QjjM8btB4p/fFwAOdJVX/j9/PkFfTNeo/LjMAP3qQRcXH4IlY3Z3nINQikm
         04hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPShOO8QDTzYeDH4N4LcYl5Ar5RwK6BIR0slE1LbqUw=;
        b=GCdVEqCrc5oBbSf+8kj4Nv7/1JUCS8lhoMxX0rIRrUgDNHQMRhfdEcPW6qPwhqVr4b
         7LRGWyH+bCdqF1MnnUJgLYhIFwwdaii7w/clBPMf+Qs1pw4GnZ6F911COsyMgdz6XNW+
         dq/y9VKuf9coDH4VnBrsyC4Vv0f0CUXGipbcS4jpqldYr1MFV7iEhFrmmOimfDZUpH1d
         hs/uh12P4Gddd/m8fO6CUaAGBY73dsjas7vL2EWvXaMqC+OnMT+Aidp4eP5ZkdF3KzFq
         Z3/hYCghqxRrLwB351pS4Z7QVHn3mjurh5uUkaXrCD4IMgWiK+DWBl+Pb5xjZAFrKSjV
         jScw==
X-Gm-Message-State: AOAM533FbffSJapXfVUoqo3BvxOPQ0JkJJRyRB8QaxJhO/NTo4Qjd4Ml
        v17w0xulx4NfpOh9FPrA9Z7ZGo/RCFy4Da5XnTpMlyCLsHk=
X-Google-Smtp-Source: ABdhPJzUlotPfcR5vvH7yICADY/Qbqh+DvKyKv4G0lNuf7sd1AOjujQt/6ywBEYbHRDRwEBMLNnciTHHAY4AJn0Dgfo=
X-Received: by 2002:a63:c205:: with SMTP id b5mr48897993pgd.281.1609773255873;
 Mon, 04 Jan 2021 07:14:15 -0800 (PST)
MIME-Version: 1.0
References: <CANzUK58rZQXy8kMtHXNCx=mx9oZLVAmxru3LZ63k45GN+ACksA@mail.gmail.com>
 <f83550e3-aed4-0e02-bd4a-871985c6e9d2@polito.it>
In-Reply-To: <f83550e3-aed4-0e02-bd4a-871985c6e9d2@polito.it>
From:   Srivats P <pstavirs@gmail.com>
Date:   Mon, 4 Jan 2021 20:44:04 +0530
Message-ID: <CANzUK5_Snkh=V6KwEmq4t6Yxv+HVNzYJ3-mu17Lu7KVVLJ337A@mail.gmail.com>
Subject: Re: i40e rx_dropped increasing at 10Mpps
To:     Federico Parola <federico.parola@polito.it>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Dec 28, 2020 at 10:02 PM Federico Parola
<federico.parola@polito.it> wrote:
>
> On 23/12/20 14:18, Srivats P wrote:
> > Hi,
> >
> > I'm running into i40e rx_dropped constantly increasing (but not
> > port.rx_dropped) with my XDP program which is returning XDP_DROP after
> > some basic parsing and accounting. The incoming rate is 10Mpps - a
> > rate that XDP should easily be able to handle.
> >
> > I asked for pointers to debug this issue on the Cillium & eBPF Slack
> > and Jesper suggested I check the CPU idle states.
> >
> > Moving that conversation to this list (which I learnt about from
> > Jesper via that slack thread) as I want to post a bunch of logs and
> > also move the discussion to a public forum that will be publicly
> > searchable for anyone else who may be facing a similar problem.
> >
> > Jesper had pointed me to these two threads -
> >
> > https://lists.bufferbloat.net/pipermail/bloat/2020-November/016019.html
> > https://lore.kernel.org/xdp-newbies/VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com/
> >
> > After going through those and educating myself on CPU C-states and
> > reading up on XL710 performance tuning and general system tuning, here
> > are my experiments and observations. I'm still not able to reach a
> > state of rx_dropped of 0.
> >
> > Any pointers or suggestions on how to reduce rx_dropped to 0 are welcome!
> >
> > (my apologies for the long email with all the logs)
> >
> > Setup
> > =====
> > * Dual port XL710 (i40e) connected back to back
> > * Each port is configured with 2 queues (ethtool -L <> combined 2)
> > * Application uses Queue 0 only for Tx and Queue 1 only for Rx
> > (ethtool -X <> weight 0 1)
> > * irqbalance has been stopped and each of the 4 queues has been
> > manually pinned to a CPU core using /proc/irq/X/smp_affinity
> > * ens6f0 transmits 10Mpps (64 bytes) on Q0 which is received on ens6f1
> > Q1 based on the above configurations
> > * ens6f1 (the rx port) is configured in promisc mode
> >
> > Baseline Test
> > =============
> > $ tuned-adm active
> > Current active profile: balanced
> >
> > $ scripts/myethstats
> > Wed Dec 23 12:44:47 IST 2020
> > ens6f1: portrx: 10030972 rx:  7010503 pps     drop:  3020434 pps
> >
> > Wed Dec 23 12:44:52 IST 2020
> > ens6f1: portrx: 10035210 rx:  6982223 pps     drop:  3052996 pps
> >
> > Note: ethtool -S stats
> > portrx => port.rx_size_64
> > rx => rx_packets
> > drop => rx_dropped
> > Although port.rx_dropped is not shown above, it is always 0 in all my tests
> >
> > $ mpstat -P3
> > Linux 5.4.0-52-generic (dumbledore) Wednesday 23 December 2020 _x86_64_ (8 CPU)
> >
> > 12:45:23  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 12:45:28  IST    3    0.00    0.00    0.20    0.00    0.00   51.29
> > 0.00    0.00    0.00   48.51
> >
> > 12:45:28  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 12:45:33  IST    3    0.00    0.00    0.20    0.00    0.00   50.90
> > 0.00    0.00    0.00   48.90
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> >
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 962 51.72 1860 2100 11850 0 32 54 188 9780 0 0.00 0.08 0.14 48.27
> > 0.00 28.48 19.80 0.00 42
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 964 51.78 1862 2100 11892 0 47 56 169 9932 0 0.00 0.06 0.14 48.23
> > 0.00 28.53 19.69 0.00 43
> >
> > Test Summary
> > ------------
> > With the default 'balanced' power profile, 3Mpps out of the total
> > 10Mpps incoming on the port is rx_dropped. The corresponding CPU core
> > is only 51% busy - all the time spent in softirq processing - I guess
> > the XDP program is executed in net_rx_action context? The core spends
> > significant time in C1, C3 states as it doesn't have enough work to
> > do.
> >
> > Test 1 - throughput-performance profile
> > =======================================
> >
> > $ sudo tuned-adm profile thoroughput-performance
> >
> > $ scripts/myethstats
> > Wed Dec 23 12:47:56 IST 2020
> > ens6f1: portrx: 10018188 rx:  9817459 pps     drop:   200747 pps
> >
> > Wed Dec 23 12:48:01 IST 2020
> > ens6f1: portrx: 10025587 rx:  9812874 pps     drop:   212738 pps
> >
> > $ mpstat -P 3 5
> > Linux 5.4.0-52-generic (dumbledore) Wednesday 23 December 2020 _x86_64_ (8 CPU)
> >
> > 12:48:25  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 12:48:30  IST    3    0.40    0.00    0.80    0.00    0.00   48.89
> > 0.00    0.00    0.00   49.90
> >
> > 12:48:30  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 12:48:35  IST    3    0.99    0.00    0.79    0.00    0.00   49.50
> > 0.00    0.00    0.00   48.71
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1403 50.22 2793 2100 11937 0 54 51 211 10657 0 0.00 0.12 0.17
> > 49.43 0.00 28.83 20.95 0.00 44
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1417 50.66 2797 2100 11849 0 66 70 206 10656 0 0.00 0.14 0.15
> > 49.02 0.00 28.54 20.80 0.00 43
> >
> > $ perfsudo perf stat -C3
> > ^C
> >   Performance counter stats for 'CPU(s) 3':
> >
> >            6,193.92 msec cpu-clock                 #    1.000 CPUs
> > utilized
> >              13,107      context-switches          #    0.002 M/sec
> >                   4      cpu-migrations            #    0.001 K/sec
> >                   0      page-faults               #    0.000 K/sec
> >      8,90,40,71,271      cycles                    #    1.438 GHz
> >     19,76,25,77,895      instructions              #    2.22  insn per
> > cycle
> >      3,64,81,07,563      branches                  #  588.982 M/sec
> >         6,82,90,187      branch-misses             #    1.87% of all
> > branches
> >
> >         6.193830786 seconds time elapsed
> >
> > $ sudo perf stat -Cperf top -C3 -E 10 --stdio
> >
> >     PerfTop:       0 irqs/sec  kernel: 0.0%  exact:  0.0% lost: 0/0
> > drop: 0/0 [4000Hz cycles],  (all, CPU: 3)
> > ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> >
> >
> >     PerfTop:    2730 irqs/sec  kernel:100.0%  exact: 100.0% lost: 0/0
> > drop: 0/0 [4000Hz cycles],  (all, CPU: 3)
> > ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> >
> >      45.26%  [kernel]                            [k] i40e_clean_rx_irq
> >      30.79%  bpf_prog_265dfd693e49d7ec_xdp_prog  [k]
> > bpf_prog_265dfd693e49d7ec_xdp_prog
> >       6.16%  [kernel]                            [k] i40e_alloc_rx_buffers
> >       4.02%  [kernel]                            [k] percpu_array_map_lookup_elem
> >       2.83%  [kernel]                            [k]
> > dma_direct_sync_single_for_device
> >       2.58%  [kernel]                            [k]
> > dma_direct_sync_single_for_cpu
> >       2.20%  [kernel]                            [k] i40e_napi_poll
> >       1.40%  [kernel]                            [k] net_rx_action
> >       1.06%  [kernel]                            [k]
> > i40e_clean_programming_status
> >       0.90%  [kernel]                            [k] __x86_indirect_thunk_rax
> >
> > Test Summary
> > ------------
> > Switching to the throughput-performance power profile reduces
> > rx_dropped from ~3Mpps to ~200Kpps. CPU usage is still at ~50% with
> > similar time spent in C1, C3 as the baseline. Definite improvement,
> > but not close to where it should be. I've included output for 'perf
> > stat' and 'perf top' in case that provides any pointers to the eyes of
> > the experts on this list.
> >
> >
> > Test 2 - Interrupt Rates
> > ========================
> > These are the default settings before I started experimenting with them -
> >
> > $ ethtool -c ens6f1
> > Coalesce parameters for ens6f1:
> > Adaptive RX: on  TX: on
> > stats-block-usecs: 0
> > sample-interval: 0
> > pkt-rate-low: 0
> > pkt-rate-high: 0
> >
> > rx-usecs: 50
> > rx-frames: 0
> > rx-usecs-irq: 0
> > rx-frames-irq: 256
> >
> > tx-usecs: 50
> > tx-frames: 0
> > tx-usecs-irq: 0
> > tx-frames-irq: 256
> >
> > rx-usecs-low: 0
> > rx-frame-low: 0
> > tx-usecs-low: 0
> > tx-frame-low: 0
> >
> > rx-usecs-high: 0
> > rx-frame-high: 0
> > tx-usecs-high: 0
> > tx-frame-high: 0
> >
> > $ sudo ethtool -C ens6f1 rx-adaptive off tx-adaptive off
> >
> > $ myethscripts/myethstats
> > Wed Dec 23 12:52:01 IST 2020
> > ens6f1: portrx: 10018143 rx:  9856910 pps     drop:   161228 pps
> >
> > Wed Dec 23 12:52:06 IST 2020
> > ens6f1: portrx: 10020724 rx:  9797166 pps     drop:   223558 pps
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1437 51.30 2802 2100 11631 0 67 54 179 10406 0 0.00 0.10 0.14
> > 48.40 0.00 28.08 20.62 0.00 44
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1407 50.32 2796 2100 11930 0 75 80 185 10803 0 0.00 0.15 0.19
> > 49.32 0.00 28.74 20.93 0.00 44
> >
> > ----
> >
> > $ sudo ethtool -C ens6f1 rx-usecs 0 tx-usecs 0
> >
> > $ scripts/myethstats
> > Wed Dec 23 12:54:33 IST 2020
> > ens6f1: portrx: 10019482 rx:  9651955 pps     drop:   367483 pps
> >
> > Wed Dec 23 12:54:38 IST 2020
> > ens6f1: portrx: 10020248 rx:  9723667 pps     drop:   296625 pps
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1417 50.64 2798 2100 11798 0 78 60 203 10582 0 0.00 0.15 0.17
> > 49.02 0.00 28.50 20.87 0.00 45
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1412 50.48 2797 2100 11715 0 70 73 184 10496 0 0.00 0.14 0.15
> > 49.20 0.00 28.15 21.37 0.00 44
> >
> > ---
> >
> > $ sudo ethtool -C ens6f1 rx-usecs 0 tx-usecs  10 tx-usecs 10
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1423 50.83 2799 2100 11879 0 81 69 200 10478 0 0.00 0.25 0.20
> > 48.68 0.00 28.35 20.82 0.00 44
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1410 50.44 2796 2100 11843 0 75 88 208 10668 0 0.00 0.17 0.16
> > 49.21 0.00 28.60 20.96 0.00 44
> >
> > $ ethtool -C ens6f1 rx-usecs 300 tx-usecs 300
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1397 50.09 2789 2100 11595 0 65 70 203 10488 0 0.00 0.15 0.14
> > 49.59 0.00 28.95 20.96 0.00 44
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1398 50.08 2791 2100 11548 0 86 59 205 10474 0 0.00 0.20 0.15
> > 49.52 0.00 28.92 21.00 0.00 44
> >
> > Test Summary
> > ------------
> > Changing interrupt coaelescing params doesn't seem to make any impact.
> > The IRQ rate shown by turbostat remains similar. Time spent in C1/C3
> > is also similar. Am I doing something wrong here or missing something?
> >
> > Before going on to next tests, I restored the interrupt coalescing
> > params to the default.
> >
> > Test 3 - Ring size changes
> > ==========================
> > $ sudo ethtool -G ens6f1 rx 4096 tx 4096
> >
> > $ scripts/myethstats
> > Wed Dec 23 13:15:56 IST 2020
> > ens6f1: portrx: 10019865 rx: 10017373 pps     drop:     2466 pps
> >
> > Wed Dec 23 13:16:01 IST 2020
> > ens6f1: portrx: 10020013 rx: 10018517 pps     drop:     1502 pps
> >
> > Wed Dec 23 13:16:06 IST 2020
> > ens6f1: portrx: 10021465 rx: 10021209 pps     drop:        0 pps
> >
> > Wed Dec 23 13:16:11 IST 2020
> > ens6f1: portrx: 10020225 rx: 10018721 pps     drop:     1759 pps
> >
> > $ mpstat -P 3
> > GLinux 5.4.0-52-generic (dumbledore) Wednesday 23 December 2020 _x86_64_ (8 CPU)
> >
> > 01:16:33  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 01:16:38  IST    3    0.00    0.00    0.00    0.00    0.00   52.31
> > 0.00    0.00    0.00   47.69
> >
> > 01:16:38  IST  CPU    %usr   %nice    %sys %iowait    %irq   %soft
> > %steal  %guest  %gnice   %idle
> > 01:16:43  IST    3    0.00    0.00    0.21    0.00    0.00   50.31
> > 0.00    0.00    0.00   49.48
> >
> > $ sudo turbostat -c3 --quiet | grep -v "-"
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1427 52.99 2693 2100 12501 0 14 45 226 10782 0 0.00 0.02 0.22
> > 46.70 0.00 29.45 17.56 0.00 45
> > Core CPU Avg_MHz Busy% Bzy_MHz TSC_MHz IRQ SMI POLL C1 C1E C3 C6 POLL%
> > C1% C1E% C3% C6% CPU%c1 CPU%c3 CPU%c6 CoreTmp PkgTmp Pkg%pc2 Pkg%pc3
> > Pkg%pc6 PkgWatt RAMWatt PKG_% RAM_%
> > 3 3 1424 52.86 2693 2100 12134 0 15 53 199 10445 0 0.00 0.05 0.24
> > 46.76 0.00 29.14 18.00 0.00 45
> >
> > $ sudo perfstat -C
> > ^C
> >   Performance counter stats for 'CPU(s) 3':
> >
> >            6,126.12 msec cpu-clock                 #    1.000 CPUs
> > utilized
> >              13,779      context-switches          #    0.002 M/sec
> >                   0      cpu-migrations            #    0.000 K/sec
> >                 156      page-faults               #    0.025 K/sec
> >      8,85,23,19,647      cycles                    #    1.445 GHz
> >     19,90,91,37,819      instructions              #    2.25  insn per
> > cycle
> >      3,67,47,65,127      branches                  #  599.852 M/sec
> >         6,89,37,131      branch-misses             #    1.88% of all
> > branches
> >
> >         6.125995233 seconds time elapsed
> >
> >
> > $ sudo perf top -C 3 -E 10 --stdio
> >
> >     PerfTop:       0 irqs/sec  kernel: 0.0%  exact:  0.0% lost: 0/0
> > drop: 0/0 [4000Hz cycles],  (all, CPU: 3)
> > ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> >
> >
> >     PerfTop:    2731 irqs/sec  kernel:100.0%  exact: 100.0% lost: 0/0
> > drop: 0/0 [4000Hz cycles],  (all, CPU: 3)
> > ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> >
> >      43.68%  [kernel]                            [k] i40e_clean_rx_irq
> >      31.53%  bpf_prog_265dfd693e49d7ec_xdp_prog  [k]
> > bpf_prog_265dfd693e49d7ec_xdp_prog
> >       5.58%  [kernel]                            [k] i40e_alloc_rx_buffers
> >       3.48%  [kernel]                            [k] percpu_array_map_lookup_elem
> >       3.29%  [kernel]                            [k]
> > dma_direct_sync_single_for_cpu
> >       2.83%  [kernel]                            [k]
> > dma_direct_sync_single_for_device
> >       2.00%  [kernel]                            [k] i40e_napi_poll
> >       1.35%  [kernel]                            [k] net_rx_action
> >       1.25%  [kernel]                            [k]
> > i40e_clean_programming_status
> >       1.14%  [kernel]                            [k] __x86_indirect_thunk_rax
> >
> > $ sudo ethtool -G ens6f1 rx 256 tx 256
> >
> > $ scripts/myethstats
> > Wed Dec 23 13:21:31 IST 2020
> > ens6f1: portrx: 10018030 rx:  9575847 pps     drop:   442182 pps
> >
> > Wed Dec 23 13:21:36 IST 2020
> > ens6f1: portrx: 10025894 rx:  9579994 pps     drop:   445900 pps
> >
> > $ tuned-adm active
> > Current active profile: throughput-performance
> >
> > Test Summary
> > ------------
> > Increasing Rx ring size from 512 to 4096 alongwith changing the
> > profile to throughput-performance has the most impact in reducing
> > rx_dropped. But still it is not 0 which is where I need it to be.
> > Reducing rx ring size to 256 (to check DDIO impact) increases
> > rx_dropped, so that's a no go.
> >
> >
> > Driver/Firmware versions
> > ========================
> > $ ethtool -i ens6f1
> > driver: i40e
> > version: 2.8.20-k
> > firmware-version: 6.01 0x800035d8 1.1747.0
> > expansion-rom-version:
> > bus-info: 0000:4b:00.1
> > supports-statistics: yes
> > supports-test: yes
> > supports-eeprom-access: yes
> > supports-register-dump: yes
> > supports-priv-flags: yes
> >
> > Distro/Kernel Version
> > =====================
> > Ubuntu 18.04 LTS running Linux 5.4.0-52-generic
> >
> > Srivats
> >
>
> Hi Srivats,
> this is also a follow up to the thread you mentioned at the beginning of
> the message.
> I found this very interesting paper [1] talking about Intel DDIO. To
> summarize, it should be possible to tune the number of ways of the cache
> that can be used by DDIO, writing to the "IIO LLC WAYS" register
> (address 0xc8b) of the processor (section 4.4 of the paper).
> Unfortunately there's almost no documentation on this register, however
> I tried to write to it and it seems to work on my processor (Xeon Gold
> 5120).
> The register contains a bitmask of cache ways that can be used by DDIO,
> by default two ways should be enabled (but this of course depends on
> your processor) correspondig to mask 0x600, and on my machine I can
> enable up to all 11 ways with mask 0x7ff.
> If you want to give it a try download the Intel MSR Tools [2] to operate
> on the register, build them and then use rdmsr and wrmsr commands to
> read/write the register (you need to issue "sudo modprobe msr" before).
> For example:
>
> sudo wrmsr 0xc8b 0x7ff
>
> to enable all ways.
> On my machine enabling all the ways and setting the rx ring size to 4096
> I'm able to achieve no dropped packets using the xdp_rxq_info sample of
> the kernel (at 10 Mpps).
> What processor are you using?
>
> Best regards,
> Federico
>
>
> [1] https://www.usenix.org/system/files/atc20-farshin.pdf
> [2] https://github.com/intel/msr-tools

Thanks Federico! I will look at this in detail, do some experiments
and get back. It may take a few days as I've just returned from the
holidays and have been greeted with a ton of higher priority work.

btw I'm using Xeon E5-2620v4

Srivats
