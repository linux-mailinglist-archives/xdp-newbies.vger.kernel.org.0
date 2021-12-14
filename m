Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93829474720
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 17:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbhLNQHB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 11:07:01 -0500
Received: from mga02.intel.com ([134.134.136.20]:23548 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhLNQHB (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 11:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639498021; x=1671034021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/iMOPZEzcSCY4ZnO9/RwV+Zjt0Rc/4MCkd9NNblJxY=;
  b=duAVjdlsUAzQnwBKqVIWZlklhfo2hI4gMomm0I0TGjs+f3lYtSrJbFFe
   x04xqO2NQA6hLM6aA6F1A3rjzKX3cGH9ppwb19DorpUV2gF2gOdGcoE74
   r3nELYFSYqROVb6sMAKI9YiZtMgAm22aeH0ROu2RYtjoOxicDJNBZ1SRY
   +hP8A5BQDwzUpJ/H23/MYfYnUCgutrLt5Quy4MAbPu6s4ndsoN93CvhZk
   JSdbLzsEkoyhBwFk9+5UaUfdi3tm8PVGMxdGzu3Bln1s2gv6u9LZhBqAY
   C9ynk1Wmy5CT2KvIZd3rvHpVGu8UbmguO1FqNI273S9JkPeag0RgbMTk3
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226286479"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="226286479"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 08:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="505408768"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 08:05:44 -0800
Date:   Tue, 14 Dec 2021 17:05:44 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>, brouer@redhat.com,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: Re: AF_XDP not transmitting frames immediately
Message-ID: <YbjA2DggYcrytkTp@boxer>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <Ybh/LIiS8ZHSXRDw@boxer>
 <65b16496-1b4e-55d9-ea17-610cfd923792@redhat.com>
 <DM6PR11MB2780612AEAC3C18A3ED4F653CA759@DM6PR11MB2780.namprd11.prod.outlook.com>
 <7a888c6c-1f54-6e82-a4d0-794465cf17c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a888c6c-1f54-6e82-a4d0-794465cf17c3@redhat.com>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 14, 2021 at 04:42:18PM +0100, Jesper Dangaard Brouer wrote:
> 
> On 14/12/2021 15.57, Ong, Boon Leong wrote:
> > > I suspected Boon Leong (cc) would have this hardware.
> >
> > Unfortunately, my current setup in lab does not have I225 hooked-up
> > and I am working remotely due to control access to intel facility.
> > Perhaps, Ederson may have ready system to test?
> > 
> > For ZC mode, the igc driver (also true to stmmac) depends on the XSK wakeup
> > to trigger the NAPI poll (igc_poll) to first clean-up Tx ring and eventually call
> > igc_xdp_xmit_zc() to start submitting Tx frame into DMA engine. We have
> > used busy-poll to ensure in smaller Tx frame latency/jitter.
> > 
> > There was another issue in stmmac that was patched [1] recently to ensure
> > the driver does not perform MAC reset whenever XDP program is added
> > so that between XDP socket creation, the Tx transmit does not take extra
> > 2-3s due to link down/up. Jesper, are you seeing something similar in your
> > app?
> 
> Yes, and it is quite annoying.
> 
> In my setup, if I AF_XDP transmit packets too early they are simply lost...
> that confused me a bit.
> 
> I wanted to ask AF_XDP maintainers:
>  - What is the best way to know when AF_XDP is ready to Tx packets?
> 
> E.g. what API should I call, e.g. that blocks, until XSK socket is ready to
> transmit on?

Not a maintainer, but anyway.
From a driver POV xsk_tx_peek_desc() (or batching variant) is used to make
sure that user space produced entries in the XSK Tx ring so that driver
can consume it and place it onto HW descriptors.

From the top of my head I'm not aware of any blocking calls, maybe you
could spin on xsk_tx_peek_desc.

For igc maybe it would be worth returning some status from
igc_xdp_xmit_zc(). Like, imagine that you consumed all the budget but
there are still descriptors in the XSK Tx ring. You'd like to signal to
NAPI that there is still work to be done.

> 
> 
> > If yes, then it is likely because of the implementation of igc driver in mainline
> > that is doing igc_down(), a little bit too aggressive in reseting MAC completely.
> > 
> 
> It would be good to fix igc too, like[1].
> BUT afaik it will only make the window smaller when XSK is not ready for TX
> packets.
> 
> 
> > [1]https://patchwork.kernel.org/project/netdevbpf/patch/20211111143949.2806049-1-boon.leong.ong@intel.com/
> > 
> 
> Thanks for the link
> --Jesper
> 
