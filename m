Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D4314106A
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 19:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAQSKQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 13:10:16 -0500
Received: from mail-d.ads.isi.edu ([128.9.180.199]:54470 "EHLO
        mail-d.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQSKQ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 13:10:16 -0500
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="20832595"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-d.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 17 Jan 2020 10:10:15 -0800
Date:   Fri, 17 Jan 2020 13:10:12 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: Re: zero-copy between interfaces
Message-ID: <20200117181012.GA74692@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
 <20200117171637.GB69024@smtp.ads.isi.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117171637.GB69024@smtp.ads.isi.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jan 17, 2020 at 12:16:37PM -0500, Ryan Goodfellow wrote:
> ry@ryzen:~$ uname -a
> Linux ryzen 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x86_64 GNU/Linux

correction, that was a terminal on the wrong machine

ry@turbine:~$ uname -a
Linux turbine 5.5.0-rc4-moa+ #16 SMP Fri Jan 17 10:52:42 EST 2020 x86_64 GNU/Linux


-- 
~ ry
