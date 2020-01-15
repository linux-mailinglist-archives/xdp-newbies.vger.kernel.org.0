Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7601013B716
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 02:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgAOBll (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jan 2020 20:41:41 -0500
Received: from mail-d.ads.isi.edu ([128.9.180.199]:60945 "EHLO
        mail-d.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgAOBll (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jan 2020 20:41:41 -0500
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; 
   d="scan'208";a="20798308"
Received: from pool-108-14-86-129.nycmny.ftas.verizon.net (HELO smtp.ads.isi.edu) ([108.14.86.129])
  by mail-d.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2020 17:41:41 -0800
Date:   Tue, 14 Jan 2020 20:41:37 -0500
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: zero-copy between interfaces
Message-ID: <20200115014137.GA105434@smtp.ads.isi.edu>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu>
 <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114205250.GA85903@smtp.ads.isi.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jan 14, 2020 at 03:52:50PM -0500, Ryan Goodfellow wrote:
> On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> > 
> > Just sent out a patch on the mailing list. Would be great if you could
> > try it out.
> 
> Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> tree and manually applied to the 5.5.0-rc3 branch I've been working with up to 
> this point. It does allow for allocating more memory, however packet 
> forwarding no longer works. I did not see any complaints from dmesg, but here 
> is an example iperf3 session from a client that worked before.
> 
> ry@xd2:~$ iperf3 -c 10.1.0.2
> Connecting to host 10.1.0.2, port 5201
> [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> iperf3: interrupt - the client has terminated
> 
> I'll continue to investigate and report back with anything that I find.

Interestingly I found this behavior to exist in the bpf-next tree independent
of the patch being present.

I also gave the 5.5.0-rc6 branch a try (without the patch) and packets forward
OK.

-- 
~ ry
