Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDF5145E40
	for <lists+xdp-newbies@lfdr.de>; Wed, 22 Jan 2020 22:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgAVVoB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 22 Jan 2020 16:44:01 -0500
Received: from mail-d.ads.isi.edu ([128.9.180.199]:27013 "EHLO
        mail-d.ads.isi.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgAVVoB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 22 Jan 2020 16:44:01 -0500
X-IronPort-AV: E=Sophos;i="5.70,351,1574150400"; 
   d="scan'208";a="20874919"
Received: from 1-163-46-234.dynamic-ip.hinet.net (HELO smtp.ads.isi.edu) ([1.163.46.234])
  by mail-d.ads.isi.edu with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2020 13:43:59 -0800
Date:   Thu, 23 Jan 2020 05:43:55 +0800
From:   Ryan Goodfellow <rgoodfel@isi.edu>
To:     Maxim Mikityanskiy <maximmi@mellanox.com>
Cc:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
Subject: Re: zero-copy between interfaces
Message-ID: <20200122214352.GA13201@smtp.ads.isi.edu>
References: <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu>
 <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu>
 <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
 <20200116020414.GA46831@smtp.ads.isi.edu>
 <CAJ8uoz0yqYTq+OOK8p0XRcWyMkfnJ1ZT7hUew9w3FuHr=4K-QQ@mail.gmail.com>
 <4c03813d-5edf-7e9e-8905-31902b5acb71@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c03813d-5edf-7e9e-8905-31902b5acb71@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jan 21, 2020 at 01:40:50PM +0000, Maxim Mikityanskiy wrote:
> >> I've posted output from the program in debugging mode here
> >>
> >> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930375
> >>
> >> Yes, you are correct in that forwarding works for a brief period and then stops.
> >> I've noticed that the number of packets that are forwarded is equal to the size
> >> of the producer/consumer descriptor rings. I've posted two ping traces from a
> >> client ping that shows this.
> >>
> >> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930376
> >> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930377
> 
> These snippets are not available.

Apologies, I had the wrong permissions set. They should be available now.

> 
> >>
> >> I've also noticed that when the forwarding stops, the CPU usage for the proc
> >> running the program is pegged, which is not the norm for this program as it uses
> >> a poll call with a timeout on the xsk fd.
> 
> This information led me to a guess what may be happening. On the RX 
> side, mlx5e allocates pages in bulks for performance reasons and to 
> leverage hardware features targeted to performance. In AF_XDP mode, 
> bulking of frames is also used (on x86, the bulk size is 64 with 
> striding RQ enabled, and 8 otherwise, however, it's implementation 
> details that might change later). If you don't put enough frames to XSK 
> Fill Ring, the driver will be demanding more frames and return from 
> poll() immediately. Basically, in the application, you should put as 
> many frames to the Fill Ring as you can. Please check if that could be 
> the root cause of your issue.

The code in this application makes an effort to relenish the fill ring as fast
as possible. The basic loop of the application is to first check if there are
any descriptors to be consumed from the completion queue or any descriptors that
can be added to the fill queue, and only then to move on to moving packets
through the rx and tx rings.

https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-moa/samples/bpf/xdpsock_multidev.c#L452-474

> 
> I tracked this issue in our internal bug tracker in case we need to 
> perform actual debugging of mlx5e. I'm looking forward to your feedback 
> on my assumption above.
> 
> >> The hardware I am using is a Mellanox ConnectX4 2x100G card (MCX416A-CCAT)
> >> running the mlx5 driver.
> 
> This one should run without striding RQ, please verify it with ethtool 
> --show-priv-flags (the flag name is rx_striding_rq).

I do not remember changing this option, so whatever the default is, is what it
was running with. I am traveling this week and do not have access to these
systems, but will ensure that this flag is set properly when I get back.

-- 
~ ry
