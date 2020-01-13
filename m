Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7831394C7
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Jan 2020 16:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgAMP2C (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Jan 2020 10:28:02 -0500
Received: from mail-c.ads.isi.edu ([128.9.180.198]:14331 "EHLO
        mail-c.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMP2C (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Jan 2020 10:28:02 -0500
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="22208960"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-c.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2020 07:28:02 -0800
Date:   Mon, 13 Jan 2020 10:28:00 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200113152759.GD68570@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <20200113124134.3974cbed@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113124134.3974cbed@carbon>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 12:41:34PM +0100, Jesper Dangaard Brouer wrote:
> On Mon, 13 Jan 2020 00:18:36 +0000
> Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> 
> > The numbers that I have been able to achive with this code are the following. MTU
> > is 1500 in all cases.
> > 
> >     mlx5: pps ~ 2.4 Mpps, 29 Gbps (driver mode, zero-copy)
> >     i40e: pps ~ 700 Kpps, 8 Gbps (skb mode, copy)
> >     virtio: pps ~ 200 Kpps, 2.4 Gbps (skb mode, copy, all qemu/kvm VMs)
> > 
> > Are these numbers in the ballpark of what's expected?
> 
> I would say they are too slow / low.
> 
> Have you remembered to do bulking?
> 

I am using a batch size of 256.

-- 
~ ry
