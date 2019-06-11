Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2133C94B
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 12:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbfFKKq1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+xdp-newbies@lfdr.de>); Tue, 11 Jun 2019 06:46:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43348 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfFKKq1 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 06:46:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B187FC04FFF6;
        Tue, 11 Jun 2019 10:46:26 +0000 (UTC)
Received: from carbon (ovpn-200-32.brq.redhat.com [10.40.200.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 92ADA5C541;
        Tue, 11 Jun 2019 10:46:22 +0000 (UTC)
Date:   Tue, 11 Jun 2019 12:42:28 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     =?UTF-8?B?xLBicmFoaW0=?= Ercan <ibrahim.metu@gmail.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>,
        brouer@redhat.com
Subject: Re: ethtool isn't showing xdp statistics
Message-ID: <20190611124119.49a0e440@carbon>
In-Reply-To: <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
        <20190610121540.36391dc3@carbon>
        <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 11 Jun 2019 10:46:26 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 11 Jun 2019 12:18:44 +0300
İbrahim Ercan <ibrahim.metu@gmail.com> wrote:

> Thanks for the clarification.
> I used ethtool_stats.pl script and realized total dropped packets are
> sum of fdir_miss and rx_missed_errors.
> Here I observed sometimes fdir_miss increase to 1-2m and
> rx_missed_errors drop about same amount but their total not change.
> 
> Show adapter(s) (enp7s0f0) statistics (ONLY that changed!)
> Ethtool(enp7s0f0) stat:     153818 (      153,818) <= fdir_miss /sec
> Ethtool(enp7s0f0) stat:    9060176 (    9,060,176) <= rx_bytes /sec
> Ethtool(enp7s0f0) stat:  946625059 (  946,625,059) <= rx_bytes_nic /sec
> Ethtool(enp7s0f0) stat:   14694930 (   14,694,930) <= rx_missed_errors /sec
> 
> As you can see, In my tests I dropped about 15m packets successfully.

Sorry, but your output with 14,694,930 rx_missed_errors /sec, shows
something is *very* wrong with your setup.  The rx_missed_errors (for
ixgbe) is not your XDP_DROP number.  The rx_missed_errors is a hardware
Missed Packet Counter (MPC register).  So, the packets are being
dropped by HW.


> After that I did some latency tests and get some bad results.
> I loaded a xdp code that drops only udp packets. I connected 2 packet
> sender through a switch. One of them I sent flood udp ddos. From other
> one I just send ping and observed latency.
> Here is results.

[cut]
We first need to figure out what is wrong with your setup, since the
NIC hardware is dropping packets.

Here is output from my testlab, so you have a baseline of what numbers
to expect.

XDP dropping packets via:

sudo ./xdp_rxq_info --dev ixgbe2 --action XDP_DROP

 Running XDP on dev:ixgbe2 (ifindex:9) action:XDP_DROP options:no_touch
 XDP stats       CPU     pps         issue-pps  
 XDP-RX CPU      4       14,705,913  0          
 XDP-RX CPU      total   14,705,913 

 RXQ stats       RXQ:CPU pps         issue-pps  
 rx_queue_index    1:4   14,705,882  0          
 rx_queue_index    1:sum 14,705,882 


My ethtool_stats.pl output:

Show adapter(s) (ixgbe2) statistics (ONLY that changed!)
Ethtool(ixgbe2  ) stat:   15364178 (   15,364,178) <= fdir_miss /sec
Ethtool(ixgbe2  ) stat:  881716018 (  881,716,018) <= rx_bytes /sec
Ethtool(ixgbe2  ) stat:  952151488 (  952,151,488) <= rx_bytes_nic /sec
Ethtool(ixgbe2  ) stat:     182070 (      182,070) <= rx_missed_errors /sec
Ethtool(ixgbe2  ) stat:   14695267 (   14,695,267) <= rx_packets /sec
Ethtool(ixgbe2  ) stat:   14695291 (   14,695,291) <= rx_pkts_nic /sec
Ethtool(ixgbe2  ) stat:  881714129 (  881,714,129) <= rx_queue_1_bytes /sec
Ethtool(ixgbe2  ) stat:   14695235 (   14,695,235) <= rx_queue_1_packets /sec
Ethtool(ixgbe2  ) stat:        596 (          596) <= tx_flow_control_xoff /sec

(It even shows that I forgot to disable Ethernet flow control, via
tx_flow_control_xoff).

--Jesper

 
> On Mon, Jun 10, 2019 at 1:15 PM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> >
> > On Mon, 10 Jun 2019 12:55:07 +0300
> > İbrahim Ercan <ibrahim.metu@gmail.com> wrote:
> >  
> > > Hi.
> > > I'm trying to do a xdp performance test on redhat based environment.
> > > To do so, I compiled kernel 5.0.13 and iproute 4.6.0
> > > Then I loaded compiled code to interface with below command.
> > > #ip -force link set dev enp7s0f0 xdp object xdptest.o
> > >
> > > After that packets dropped as expected but I can not see statistics
> > > with ethtool command like below.
> > > #ethtool -S enp7s0f0 | grep xdp
> > >
> > > ethtool version is 4.8
> > > I did my test with that NIC
> > > Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01)
> > >
> > > I wonder why I can't see statistics. Did I miss something while
> > > compiling kernel or iproute? Should I also compile ethtool too?  
> >
> > You did nothing wrong. Consistency for statistics with XDP is a known
> > issue, see [1].  The behavior varies per driver, which obviously is bad
> > from a user perspective.  You NIC is based on ixgbe driver, which don't
> > have ethtool stats counters for XDP, instead it actually updates
> > ifconfig counters correctly. While for mlx5 it's opposite (p.s. I use
> > this[2] ethtool stats tool).
> >
> > We want to bring consistency in this area, but there are performance
> > concerns.  As any stat counter will bring overhead, and XDP is all
> > about maximum performance.  Thus, we want this counter overhead to be
> > opt-in (that is not on as default).
> >
> > Currently you have to add the stats your want to the XDP/BPF program
> > itself.  That is the current opt-in mechanism.  To help you coded this,
> > we have an example here[3].
> >
> >
> > [1] https://github.com/xdp-project/xdp-project/blob/master/xdp-project.org#consistency-for-statistics-with-xdp
> > [2] https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
> > [3] https://github.com/xdp-project/xdp-tutorial/blob/master/common/xdp_stats_kern.h
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Principal Kernel Engineer at Red Hat
> >   LinkedIn: http://www.linkedin.com/in/brouer
> >  



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
