Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7240481C57
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Dec 2021 14:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239477AbhL3NE7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Dec 2021 08:04:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:23867 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhL3NE7 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Dec 2021 08:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640869499; x=1672405499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ydckcNDpjyvHsxk65wsnmV1bv/mtYiWpereRHiyVBBY=;
  b=k97oAZzvJBE2sXOWR5PoI4vy25/egbISLxlvGCU7hnYydIEO9XRy2eAO
   ajknEXG7zP+GG6GmasrTYrI6fknafi+QhCyh5I/Kkh0LmFTX2xWaYjDkX
   5IG41aD1hSvBMQioe2c/XwcBG+qo6TOqKuZaRDXdjtBGmwttowZyNtKN3
   dGp9UIKZ+r6MoB81QKye9O6AmMjDXrGOkGG8FwiffMJLJ/VM0teiN1ok/
   8IzBzOqmTbaKAlP2JNLoIboxjC6Nw5Q5zXBQcyrg7G/PdARXzX8gGF/JY
   I7uIWtBAGJ6SPasRCkYVxhpzj6hkiRAUsCJOsYip3u014JwPR1jacGcZS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="228492201"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="228492201"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2021 05:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="486881680"
Received: from boxer.igk.intel.com (HELO boxer) ([10.102.20.173])
  by orsmga002.jf.intel.com with ESMTP; 30 Dec 2021 05:04:58 -0800
Date:   Thu, 30 Dec 2021 14:04:57 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Daniel Salzman <daniel.salzman@nic.cz>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: NIC rx/tx ring size vs XSK rx/tx ring size
Message-ID: <Yc2ueb/Lomb2yrGF@boxer>
References: <e33c8463-ed31-a2b7-f8d6-5275da05b777@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e33c8463-ed31-a2b7-f8d6-5275da05b777@nic.cz>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Dec 30, 2021 at 01:21:24PM +0100, Daniel Salzman wrote:
> Hello,
> 
> Please what is the relation between NIC ring sizes and XDP socket ring sizes?
> If my app sets XDP_RX_RING and XDP_TX_RING, what are the optimal values for ethtool -G rx/tx?

I'm working on 1k Tx/Rx HW rings and standard size (2k) of AF_XDP rings.

> 
> Also I don't understand why changing TX ring size changes some XDP ring size for the ice driver (Kernel 5.13):
> [  424.542118] ice 0000:41:00.0 enp65s0f0: Changing Tx descriptor count from 256 to 2048
> [  424.542176] ice 0000:41:00.0 enp65s0f0: Changing XDP descriptor count from 256 to 2048   <- What is that?

I think you're mixing AF_XDP rings with HW rings. Above log comes from the
changing the HW descriptor count - drivers in order to support XDP_TX and
XDP_REDIRECT actions create a set of HW Tx queues that serve XDP and they
are usually referred to as XDP rings.

XDP_{R,T}X_RING are AF_XDP rings and with ethtool -G you're not changing
their size.

> 
> In the case of the i40e driver, there is no XDP ring logged:
> [847243.925269] i40e 0000:81:00.0 enp129s0f0: Changing Tx descriptor count from 256 to 2048.

Behavior is the same for both i40e and ice, it's just that i40e doesn't
log the desc count change when XDP resources are up.

> 
> Thank you,
> Daniel
> 
