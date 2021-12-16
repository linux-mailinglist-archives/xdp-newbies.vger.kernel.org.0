Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917074775E6
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Dec 2021 16:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbhLPP2y (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Dec 2021 10:28:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35568 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhLPP2y (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Dec 2021 10:28:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C4BF61E3D
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Dec 2021 15:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6606CC36AE0;
        Thu, 16 Dec 2021 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639668533;
        bh=dlEd7e4eiO241E74kImuqcGfTnL6Zx5D9OAyOci1Ltc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u4t3qdn3jkBRR33Xtch/hloeEnzSbZwC7CbhotI7lTC8jgnwpt+Z5LleRTAiVIS8q
         VQvJbYiCRsKO/SVd8yBocq7aLcx3KMq7cU6XQspIcBgLCkVRJdByigX/AoiNhevhWU
         ZDGrGgYkDaeyKpinaDCNFpL7FKUcZCqrnBHt+MOBYltmTZnwEyZU8PqpqeQIkF6+u1
         sy3oRfEnkFMibMGRI5zN8tNtHW1FNg8mM0I2Yo/hPqHInR518vQO27PJhU4mdELgex
         Udrp1lj2gihoFhSfG9oChFSOwOk/zvBg7IJA2ivN1TlVDhbtEAU3iEyXIV3rFwF63I
         Y4xOwAEABkWQg==
Date:   Thu, 16 Dec 2021 07:28:52 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Karlsson, Magnus" <magnus.karlsson@intel.com>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?UTF-8?B?QmrDtnJuIFQ=?= =?UTF-8?B?w7ZwZWw=?= <bjorn@kernel.org>,
        "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Subject: Re: AF_XDP not transmitting frames immediately
Message-ID: <20211216072852.680ef9e0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <MW3PR11MB4602206699A28A59038D21E5F7779@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
        <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
        <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
        <MW3PR11MB460208C3A86CF7D4B9B2E1C3F7769@MW3PR11MB4602.namprd11.prod.outlook.com>
        <2eeb6d48-09b6-993b-d324-d2fc14cbb12b@redhat.com>
        <MW3PR11MB4602206699A28A59038D21E5F7779@MW3PR11MB4602.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 16 Dec 2021 08:34:23 +0000 Karlsson, Magnus wrote:
> > "Time" will tell if it is good enough (pun intended).
> > Meaning I will implement and measure it.
> > The busy-poll mode does sound like a way forward.
> > 
> > Looking at kernel code, I can see that drivers TX NAPI usually does DMA-TX
> > completion *before* transmitting new frames.  This usually makes sense,
> > but for our use-case of hitting a narrow time-slot, I worry about the jitter this
> > introduces.  I would like to see a mode/flag that would allow transmitting
> > new frames (and afterwards invoking/scheduling TX-completion, e.g. via
> > raising the softirq/NAPI).
> > Well this is future work, first I will measure current implementation.  
> 
> Maciej has been experimenting with the ice driver to do sending
> first. Completions are only done lazily when needed to make sure that
> there are always a number of descriptors available for sending. This
> yields much better throughput and is the style that DPDK uses for its
> drivers. Hopefully, this will also improve latency, though we have
> not measured that. Could be adopted for the igc driver too if that is
> the case.

I think this came up before, there was a concern that some applications
may forgo retransmiting data until they see a completions (like
skb_still_in_host_queue()).  Make sure you call out that it's a change
in behavior in the commit message and/or docs.
