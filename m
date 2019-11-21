Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21FE105D10
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 00:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfKUXJi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 18:09:38 -0500
Received: from mga01.intel.com ([192.55.52.88]:37017 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfKUXJi (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 18:09:38 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2019 15:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,227,1571727600"; 
   d="scan'208";a="407379159"
Received: from dev.igk.intel.com ([10.102.102.244])
  by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2019 15:09:37 -0800
Date:   Fri, 22 Nov 2019 00:16:36 +0100
From:   Piotr Raczynski <piotr.raczynski@intel.com>
To:     Christoph Kuhr <christoph.kuhr@web.de>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Access Hardware Timestamp in eBPF Program
Message-ID: <20191121231636.GA5888@DEV.igk.intel.com>
References: <ce15150c-01e4-5621-0d13-ebe0f7cd2333@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce15150c-01e4-5621-0d13-ebe0f7cd2333@web.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Nov 21, 2019 at 09:24:13PM +0000, Christoph Kuhr wrote:
> Hi *,
> 
> in my program I use CMSGs to access hardware arrival timestamps of an
> Intel I210 rx queue.

Hi Christoph,

First of all I210 does not support native XDP. It still means that 
you can use XDP but in so called generic mode which works for all net
devices. However it's not as quick as native implementation in the
driver, because it operates after skb is allocated.

Actually it's way slower, but it can still be much faster in many
cases than regular *sbk* path.
 
> Is there a way to access such timestamps in a XDP eBPF program?

Unfortunately, as of now there is no universal way for XDP programs,
even in native mode, to access information taken from hardware,
e.g. from Rx descriptor. Technically it would be possible, but there
are no interfaces now that would allow common scheme for different
drivers. Right now it is possible to convey additional information
to xdp buff via data_meta field, but now it's strictly driver
specific and XDP programs has no direct information into what is
in the data_meta section.

Given that I210 would only work in generic mode, this would be
even more difficult since as I checked, with current implementation
when skb is *converted* back to xdp_buff it does not support passing
data_meta from skb to XDP.

> 
> Best regards,
> Christoph Kuhr
