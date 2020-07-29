Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD0723248B
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jul 2020 20:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2SWW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jul 2020 14:22:22 -0400
Received: from mga07.intel.com ([134.134.136.100]:34453 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgG2SWW (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jul 2020 14:22:22 -0400
IronPort-SDR: fLDb1mpvHM7UvTXCoLmPlZ2UNBTH2HUa8/cgwMmHY6FA6jzQlkkUzk5N+nqwxJQLvWsATBQqxW
 gsQ7c4Cswmjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="215966853"
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; 
   d="scan'208";a="215966853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 11:22:21 -0700
IronPort-SDR: N+huKa7hk4utp7PXTd4fXSQuerD//g8qaFaMy17L+ozL9agbNaN2m+FaTBYQuv8kjk4TCAggRg
 M69aabpHAaxQ==
X-IronPort-AV: E=Sophos;i="5.75,411,1589266800"; 
   d="scan'208";a="313121391"
Received: from jbrandeb-mobl3.amr.corp.intel.com (HELO localhost) ([10.212.93.203])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 11:22:21 -0700
Date:   Wed, 29 Jul 2020 11:22:20 -0700
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
To:     Sandip Patil <techiek7@gmail.com>
Cc:     <xdp-newbies@vger.kernel.org>
Subject: Re: igb native xdp support
Message-ID: <20200729112220.000041da@intel.com>
In-Reply-To: <9ffcedaa-5b57-0188-0ab7-9a38ecbb9f69@gmail.com>
References: <9ffcedaa-5b57-0188-0ab7-9a38ecbb9f69@gmail.com>
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.28; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 29 Jul 2020 14:14:51 +0530
Sandip Patil <techiek7@gmail.com> wrote:

> Hello team,
> 
> Is there a plan to add support for native XDP in Intel igb driver?

I think someone has just recently posted patches for part of this on
intel-wired-lan mailing list.

you can download the patch or see it's status here:
https://lore.kernel.org/netdev/20200713090549.b7dive4cmtm4o7dq@SvensMacbookPro.hq.voleatech.com/

Have a look and give us feedback on the list by replying (if you're not
subscribed you can bounce the message to yourself via the below)
https://lore.kernel.org/netdev/20200713090549.b7dive4cmtm4o7dq@SvensMacbookPro.hq.voleatech.com/
