Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EA7141043
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 18:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAQRyM (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 12:54:12 -0500
Received: from mail-c.ads.isi.edu ([128.9.180.198]:29252 "EHLO
        mail-c.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRyM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 12:54:12 -0500
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="22258874"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-c.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 17 Jan 2020 09:54:12 -0800
Date:   Fri, 17 Jan 2020 12:54:09 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200117175409.GC69024@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <20200113124134.3974cbed@carbon>
 <20200113152759.GD68570@smtp.ads.isi.edu>
 <20200113180411.24d8bd40@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113180411.24d8bd40@carbon>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 06:04:11PM +0100, Jesper Dangaard Brouer wrote:
> On Mon, 13 Jan 2020 10:28:00 -0500
> Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> 
> > On Mon, Jan 13, 2020 at 12:41:34PM +0100, Jesper Dangaard Brouer wrote:
> > > On Mon, 13 Jan 2020 00:18:36 +0000
> > > Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> > >   
> > > > The numbers that I have been able to achive with this code are the following. MTU
> > > > is 1500 in all cases.
> > > > 
> > > >     mlx5: pps ~ 2.4 Mpps, 29 Gbps (driver mode, zero-copy)
> > > >     i40e: pps ~ 700 Kpps, 8 Gbps (skb mode, copy)
> > > >     virtio: pps ~ 200 Kpps, 2.4 Gbps (skb mode, copy, all qemu/kvm VMs)
> > > > 
> > > > Are these numbers in the ballpark of what's expected?  
> > > 
> > > I would say they are too slow / low.
> > > 
> > > Have you remembered to do bulking?
> > >   
> > 
> > I am using a batch size of 256.
> 
> Hmm...
> 
> Maybe you can test with xdp_redirect_map program in samples/bpf/ and
> compare the performance on this hardware?

Hi Jesper,

I tried to use this program, however it does not seem to work for bidirectional
traffic across the two interfaces?

Now that I have an i40e card that is working here is an update to the numbers.

At 1500 MTU the i40e runs at 9.7 GBPS (using the X710-DA4 10G interface), with
approx 800 Kpps. Dropping the MSS size down to 700 in iperf3 yields similar
near-line rate performance at 1.6 Mpps. This appears to be the limit as dropping
the MSS further results in degraded performance at similar packet rates (could
be an iperf3 artifact).

-- 
~ ry
