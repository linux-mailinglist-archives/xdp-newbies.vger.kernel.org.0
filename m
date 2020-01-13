Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B377013946F
	for <lists+xdp-newbies@lfdr.de>; Mon, 13 Jan 2020 16:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgAMPMC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 13 Jan 2020 10:12:02 -0500
Received: from mail-d.ads.isi.edu ([128.9.180.199]:1576 "EHLO
        mail-d.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMPMC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 13 Jan 2020 10:12:02 -0500
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="20779449"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-d.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2020 07:12:01 -0800
Date:   Mon, 13 Jan 2020 10:11:59 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200113151159.GB68570@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 10:16:47AM +0100, Magnus Karlsson wrote:
> Thanks for taking XDP and AF_XDP for a sping. I will start by fixing
> this out-of-memory issue. With your umem size, we are hitting the size
> limit of kmalloc. I will fix this by using kvmalloc that tries to
> allocate with vmalloc if kmalloc fails. Should hopefully make it
> possible for you to allocate larger umems.
> 

Thanks!

-- 
~ ry
