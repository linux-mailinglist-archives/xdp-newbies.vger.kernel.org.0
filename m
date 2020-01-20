Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2990814317E
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jan 2020 19:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATSdN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jan 2020 13:33:13 -0500
Received: from mail-c.ads.isi.edu ([128.9.180.198]:50716 "EHLO
        mail-c.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATSdN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jan 2020 13:33:13 -0500
X-IronPort-AV: E=Sophos;i="5.70,343,1574150400"; 
   d="scan'208";a="22277228"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-c.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2020 10:33:12 -0800
Date:   Mon, 20 Jan 2020 13:33:09 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: Re: zero-copy between interfaces
Message-ID: <20200120183309.GA10990@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
 <20200117171637.GB69024@smtp.ads.isi.edu>
 <CAJ8uoz0i2NVxBty18Cq=kK5_Ysue=pt1psBBahLFiZqN168OiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8uoz0i2NVxBty18Cq=kK5_Ysue=pt1psBBahLFiZqN168OiQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 20, 2020 at 09:24:05AM +0100, Magnus Karlsson wrote:
> 
> I was wondering if you could run two small experiments since I cannot
> reproduce this?
> 
> 1: Run your program using the two ports on your X710 card. Does it
> work? This is my setup and works for me.

The X710 card works without issue.

> 2: On your Mellanox setup, insert a kick_tx() call for each of your
> two sockets before the poll() call in your forward() function. Just to
> see if it works when we explicitly wake up the driver.

This did not have an effect on the observed behavior. Exactly N packets go
through the interface where N is equal to the size of the FQ/CQ rings and then
forwarding halts.

--
~ ry
