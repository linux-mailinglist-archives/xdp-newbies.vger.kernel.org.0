Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD43C7A5C1
	for <lists+xdp-newbies@lfdr.de>; Tue, 30 Jul 2019 12:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfG3KN5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 30 Jul 2019 06:13:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35072 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfG3KN5 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 30 Jul 2019 06:13:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 726E7308404F;
        Tue, 30 Jul 2019 10:13:57 +0000 (UTC)
Received: from carbon (ovpn-200-29.brq.redhat.com [10.40.200.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB2960BE5;
        Tue, 30 Jul 2019 10:13:51 +0000 (UTC)
Date:   Tue, 30 Jul 2019 12:13:49 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, brouer@redhat.com,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        anirudh.venkataramanan@intel.com,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: Intel 800 series 100Gbe NIC with XDP
Message-ID: <20190730121349.538b5299@carbon>
In-Reply-To: <CAC1LvL3xoHQo_oNJEVa4DeZ3G9R6Z61ukScRuMq5UrnRCHWo1g@mail.gmail.com>
References: <CAC1LvL3xoHQo_oNJEVa4DeZ3G9R6Z61ukScRuMq5UrnRCHWo1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 30 Jul 2019 10:13:57 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 29 Jul 2019 16:27:01 -0700
Zvi Effron <zeffron@riotgames.com> wrote:

> Hello all,
> 
> I was wondering if anyone knew if the upcoming 800 series Intel NICs
> with 100gbe support XDP? I don't yet see a new driver for them, but
> they may be reusing the i40e driver, or I may have missed it? If they
> do support it, do they maybe also support hardware mode (as opposed to
> driver mode)?

Good to see that Intel customers are requesting XDP support, for new HW
and associated drivers.

AFAIK Linux kernel driver is called ICE for Intel 800 series NIC[1]
(which supports 100/50/25/10 Gbit/s Ethernet).  (p.s. I don't have this
hardware in my testlab).

It is located in the kernel tree[2]: drivers/net/ethernet/intel/ice/.
Reading and grepping the code for 'xdp', reveals that this driver
doesn't support XDP.  So, I guess you need to buy your 100G hardware
from another vendor, or convince Intel to add XDP support.


Code details: Strangely it looks like this driver always does a memcpy
of the headers into linear part of a 256 bytes SKB, and attach the
payload as a SKB "fragment". (I wonder why this was chosen?)
  It should still be easy to add a XDP step before doing this (in
ice_clean_rx_irq() just after call to ice_get_rx_buf())


[1] https://www.intel.com/content/www/us/en/architecture-and-technology/ethernet/introducing-800-series.html
[2] https://github.com/torvalds/linux/tree/master/drivers/net/ethernet/intel/ice
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
