Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C10D24A195
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Aug 2020 16:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgHSOUt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Aug 2020 10:20:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:34086 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbgHSOUs (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Aug 2020 10:20:48 -0400
IronPort-SDR: 3kr53L8aFqM4GgBwazI6xKR8lZfg476isE04tXh6EWzqLr4dczSgfmeAwaDnvtQIQlMHiJzwmI
 WkhzHad5uxrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="156179086"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="156179086"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 07:20:48 -0700
IronPort-SDR: Pd/ZosjTTLmqJYWKujC/9ZTXpmHcI+4apcF9D0x9YSbZEXFJckOUy6/3IhE2WRtqlU5IIkpCwG
 7u9y/Ti4D2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="320494274"
Received: from kpll.igk.intel.com ([10.102.21.194])
  by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2020 07:20:47 -0700
Date:   Wed, 19 Aug 2020 12:16:15 -0400
From:   Piotr Raczynski <piotr.raczynski@intel.com>
To:     Rafael Vargas <vargas@khomp.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Kernel Panic when loading XDP on i40e driver
Message-ID: <20200819161615.GA13798@kpll.igk.intel.com>
References: <CAEaYoca34NU43BK9VQdpM5W-j4uHSix4VW=G9Ja8iNRVZ5Zsjg@mail.gmail.com>
 <CAEaYocZ6Px5Jyt96TDrqyJNXbYps-GTrrSeGFm9nZeUPO-9U2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEaYocZ6Px5Jyt96TDrqyJNXbYps-GTrrSeGFm9nZeUPO-9U2Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Aug 19, 2020 at 11:08:31AM -0300, Rafael Vargas wrote:
> Em sex., 7 de ago. de 2020 às 12:51, Rafael Vargas <vargas@khomp.com> escreveu:
> > [...]
> > Using kernel 5.8 (mainline from kernel.org) and a Lenovo Intel X722
> > controller (using the i40e driver). Loading any XDP program to this
> > driver will immediately crash with a Kernel Panic.
> >[...]
>

Hi Rafael,

> I've tested with the net-next kernel and there is no Kernel Panic
> there, but looks like native XDP support is not working on i40e, as
> iproute2 reports it as xdpgeneric. Is this correct or am I missing
> something in the way I load my programs (libbpf's
> bpf_set_link_xdp_fd)?
>

We're aware of the issue with X722 and have the fix cooking,
in general native mode works on i40e, but you'll see issues
with X722. We'll submit a patch ASAP.

If it's reported as xdpgeneric, are you sure you set
XDP_FLAGS_DRV_MODE flag when calling bpf_set_link_xdp_fd?

> Also the driver that is currently supplied by Intel and the one
> supplied in the kernel sources seems to have diverged...

Out of tree driver does not have AF_XDP in place as of now,
however XDP is supposed to work fine, again, not with X722.
