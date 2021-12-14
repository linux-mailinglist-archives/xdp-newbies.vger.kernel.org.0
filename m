Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB2847416F
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 12:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbhLNLZg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 06:25:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:6899 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229723AbhLNLZg (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 06:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639481135; x=1671017135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Sgkrqtf3BktH3fz14KfQj5Sr+W1OYIWwNZtw2jCgFug=;
  b=ag1VoWvNKi62S/IoQpOvT9GU182tbhtFrl7RGJOTNGZSWRxPF1MuieCp
   VjdGKMQXJ+eLc3peF60f6RiY7Q/WFdjfrzdMPTM5e0/J9iII+vW+Lg6H0
   QRs2JKjEzFZ2AIAdCuk9pD8hzaIL0xe2nrN+cComdSWc1BuSxbULamIaF
   82KUJhliKbE41oAzqRCZdeoVUGl8ATTcIqulkJmEkilmNupq8NsA9yKOj
   QPU//O8ZzArCT24JVVzxqPFnIVTXUNFizLI6zkc8fmNmnXtrApbl/2653
   rSc4ef8V3M/Ya+VQQvfKTWdWkQczj6UM9kzmggrA2X2Bxk/NhvITRcGK3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219642207"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="219642207"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 03:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="614232754"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2021 03:25:33 -0800
Date:   Tue, 14 Dec 2021 12:25:32 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     "Karlsson, Magnus" <magnus.karlsson@intel.com>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>,
        "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: Re: AF_XDP not transmitting frames immediately
Message-ID: <Ybh/LIiS8ZHSXRDw@boxer>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 14, 2021 at 10:40:05AM +0000, Karlsson, Magnus wrote:
> Adding Ederson and Maciej.
> 
> > On 14/12/2021 09.07, Karlsson, Magnus wrote:
> > >
> > >
> > >> -----Original Message----- From: Jesper Dangaard Brouer
> > >> <jbrouer@redhat.com> Sent: Monday, December 13, 2021 10:04 PM To:
> > >> Karlsson, Magnus <magnus.karlsson@intel.com>; Björn Töpel
> > >> <bjorn@kernel.org> Cc: Brouer, Jesper <brouer@redhat.com>; Xdp
> > >> <xdp- newbies@vger.kernel.org>; Ong, Boon Leong
> > >> <boon.leong.ong@intel.com>; Joao Pedro Barros Silva
> > >> <jopbs@vestas.com>; Diogo Alexandre Da Silva Lima <dioli@vestas.com>
> > >> Subject: AF_XDP not transmitting frames immediately
> > >>
> > >> Hi Magnus and Bjørn,
> > >>
> > >> I'm coding on an AF_XDP program[1] that need to send (a bulk of
> > >> packets) in a short time-window (related to Time-Triggered Ethernet).
> > >>
> > >> My observations are that AF_XDP doesn't send the frames immediately.
> > >> And yes, I do call sendto() to trigger a TX kick. In zero-copy mode
> > >> this is particular bad.  My program want to send 4 packets in a
> > >> burst, but I'm observing 8 packets grouped together on the receiving
> > >> host.
> > >>
> > >> Is the a known property of AF_XDP?
> > >
> > > Nope! It is supposed to be able to send one packet at a time, though I
> > > have several times seen bugs in the drivers where the batching
> > > behavior shines through like this, and once a bug in the core code.
> > > There is even a test these days for just sending a single packet,
> >
> > Where is that test in the kernel tree?
> 
> In tools/testing/selftests/bpf/xdpxceiver.c. It is the RUN_TO_COMPLETION_SINGLE_PKT test. But the framework only operates on veth currently.

I'd say it's driver's fault. Magnus fixed something similar for i40e:
https://lore.kernel.org/netdev/20210401172107.1191618-3-anthony.l.nguyen@intel.com/

We don't have currently igc HW on our side to dig this :<

> 
> > > since we have had issues with this in the past. That test does pass in
> > > bpf-next, but it is only run with the veth driver that does not
> > > support zero-copy so could still be an issue. What driver are you
> > > using in zero-copy mode and what kernel version are you on?
> >
> > Driver: igc with Intel chip i225
> 
> Have never tried this one personally. Do not know if I have one in the lab but let me check.
> 
> Ederson, do you have any experience with this card and if so, have you seen something similar?
> 
> > Kernel version: 5.15.0-net-next+ #618 SMP PREEMPT
> >   - Devel branch at commit 6d3b1b069946 (v5.15-12802-g6d3b1b069946)
> >
> > >> How can I get AF_XDP to "flush" TX packets when calling sendto()?
> > >> Should we add another flag than the current MSG_DONTWAIT?
> > >
> > > In zero-copy mode with softirq driver processing (not busy poll), a
> > > sendto will just trigger the xsk_wakeup ndo that schedules napi unless
> > > it is already executing. It is up to the driver to then get packets
> > > from the Tx ring and put them on the HW and make sure they are sent.
> > > Barring any HW quirks, sending one packets should be perfectly fine.
> >
> > I will investigate driver level issues.
> >
> > I have other (100G) NICs in my testlab, but I'm using these 1G NICs because
> > they support hardware timestamping, which allows me to investigate these
> > timing issues.
> > I'll find a way to see of other drivers behave differently.
> 
> Would be great if you could check if the problem also exists on e.g. ice.
> 
> > >> Hint, I'm using tcpdump hardware timestamping on receiving hist via
> > >> cmdline:
> > >>
> > >> tcpdump -vv -s0 -ni eth1 -j adapter_unsynced
> > >> --time-stamp-precision=nano -w af_xdp_tx_cyclic.dump42
> > >>
> > >> Notice[1] on specific branch: [1]
> > >> https://github.com/xdp-project/bpf-
> > examples/tree/vestas03_AF_XDP_exam
> > >> ple/AF_XDP-interaction
> > >
> >
> > Thanks for your feedback,
> > --Jesper
> 
