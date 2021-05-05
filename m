Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE7D3748FE
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 May 2021 22:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbhEEUC3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 5 May 2021 16:02:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:5115 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233723AbhEEUC2 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 5 May 2021 16:02:28 -0400
IronPort-SDR: sljF7/OVeqcnI1nSHScTMhvuwcVFhOYqLIMGbWTjCJmvziHiL5Zj2D4DyNOY4y6Z+cJbdo2NTy
 w6GjixAh7Ezg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="283725891"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="283725891"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 13:01:30 -0700
IronPort-SDR: xbCfYdEVpO4OJeUnN/pS7fJ8VhjbM0/CTZUVG2wwujs+ojA7Ymgn3aZISAqJay7yc3BcKhI/IT
 QXiYdSbFWw6w==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="458871725"
Received: from jbrandeb-mobl4.amr.corp.intel.com (HELO localhost) ([10.209.11.242])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 13:01:29 -0700
Date:   Wed, 5 May 2021 13:01:28 -0700
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     T K Sourabh <sourabhtk37@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
Message-ID: <20210505130128.00006720@intel.com>
In-Reply-To: <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
        <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
        <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
        <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
        <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com>
        <CAC1LvL1Kd-TCuPk0BEQyGvEiLzgUqkZHOKQNOUnxXSY6NjFMmw@mail.gmail.com>
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.28; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Zvi Effron wrote:

> On Tue, May 4, 2021 at 4:07 PM Zvi Effron <zeffron@riotgames.com> wrote:
> > I'm suspecting it's something with how XDP_REDIRECT is implemented in
> > the i40e driver, but I don't know if this is a) cross driver behavior,
> > b) expected behavior, or c) a bug.
> I think I've found the issue, and it appears to be specific to i40e
> (and maybe other drivers, too, but not XDP itself).
> 
> When performing the XDP xmit, i40e uses the smp_processor_id() to
> select the tx queue (see
> https://elixir.bootlin.com/linux/v5.12.1/source/drivers/net/ethernet/intel/i40e/i40e_txrx.c#L3846).
> I'm not 100% clear on how the CPU is selected (since we don't use
> cores 0 and 1), we end up on a core whose id is higher than any
> available queue.
> 
> I'm going to try to modify our IRQ mappings to test this.
> 
> If I'm correct, this feels like a bug to me, since it requires a user
> to understand low level driver details to do IRQ remapping, which is a
> bit higher level. But if it's intended, we'll just have to figure out
> how to work around this. (Unfortunately, using split tx and rx queues
> is not possible with i40e, so that easy solution is unavailable.)
> 
> --Zvi


It seems like for Intel drivers, igc, ixgbe, i40e, ice all have
this problem.

Notably, igb, fixes it like I would expect.

Let's talk about it over on intel-wired-lan and cc netdev.

Jesse
