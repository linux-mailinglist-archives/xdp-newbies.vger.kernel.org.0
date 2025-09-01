Return-Path: <xdp-newbies+bounces-185-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0CB3DE6C
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 11:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1E744185E
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 09:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022B130BF7A;
	Mon,  1 Sep 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0qS7HuO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF5321FF44;
	Mon,  1 Sep 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718589; cv=none; b=nEYkOBMoVYr1v3a3cbw11XsbtLkbmjkgh1sGX28a7gBmIQZB4ETztGSNF+SGZkpNdYTpCFwNtfWGUCHsKLwH4/yHiHO5k9xTbkPEKTkAUec7LxTBmZqA/1dQf1alqfN4QvWB2YZi4sPFfLTDNuA6eeg7Bngj+yc14mZoA1aCPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718589; c=relaxed/simple;
	bh=mGEYnqeC6PLMYnxSuWbgbyaiJ40DleF+U0xPKXGQyLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MotJUnRRzwMMaaxiyROkGbG4MbOC/ZTVpQv7ZZXFzTfGRpciZs+AGEn1uWAqcFMW+vmTf7Mn67/fKuLnGHPwXUxDx8n4ptut/OOVWQbOtcOAbSg05tdWvVd5zBII9C8b3duGv+OQNTCcoO5DUNKLWppsomMDzLZ0JosgdIlvWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0qS7HuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C326C4CEF0;
	Mon,  1 Sep 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756718589;
	bh=mGEYnqeC6PLMYnxSuWbgbyaiJ40DleF+U0xPKXGQyLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r0qS7HuOXGa3nEKsYdNFWX+nFlbI4YbVKQvmT7VL/q2JNLEZ4CxW90BfTLeJc3zqI
	 Ull6OwvaT/KK+FFncjEcOQRAdPV1+UdgC06+ougecoqgRhwT4CLrI4yhwNdh4yMM3I
	 NHkiPEHUxVKUAEe2pMMTq9XxGyumsUZKp9I9pID2mRu2Zz6vva8QajN5e7ELH6O+D1
	 YJ8qdOSHftDUmkGcDhBZAFwQpT6Zv5IPIq2a4ZRaz22MG1U/9hVcRKGxf7MUv6yGkk
	 2i4FQsOLniJI+1DxGaDAILDJvwlWBUhE2/W7pNkWtdA69b0/PScN9IAw6ce/iNV4Ky
	 J9EsdkEPLNFJw==
Message-ID: <0b697d49-adbb-48d5-bbfa-f90c79fb3a4d@kernel.org>
Date: Mon, 1 Sep 2025 11:23:03 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] driver stmmac reports page_pool_release_retry() stalled
 pool shutdown every minute
To: Vincent Li <vincent.mc.li@gmail.com>, netdev@vger.kernel.org,
 xdp-newbies@vger.kernel.org, loongarch@lists.linux.dev,
 Dragos Tatulea <dtatulea@nvidia.com>, Furong Xu <0x1207@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Philipp Stanner <phasta@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Qunqin Zhao <zhaoqunqin@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vincent,

Thanks for reporting.
Please see my instruction inlined below.
Will appreciate if you reply inline below to my questions.


On 01/09/2025 04.47, Vincent Li wrote:
> Hi,
> 
> I noticed once I attached a XDP program to a dwmac-loongson-pci
> network device on a loongarch PC, the kernel logs stalled pool message
> below every minute, it seems  not to affect network traffic though. it
> does not seem to be architecture dependent, so I decided to report
> this to netdev and XDP mailing list in case there is a bug in stmmac
> related network device with XDP.
> 

Dragos (Cc'ed) gave a very detailed talk[1] about debugging page_pool
leaks, that I highly recommend:
  [1] 
https://netdevconf.info/0x19/sessions/tutorial/diagnosing-page-pool-leaks.html

Before doing kernel debugging with drgn, I have some easier steps, I
want you to perform on your hardware (I cannot reproduce given I don't
have this hardware).

First step is to check is a socket have unprocessed packets stalled in
it receive-queue (Recv-Q).  Use command 'netstat -tapenu' and look at
column "Recv-Q".  If any socket/application have not emptied it's Recv-Q
try to restart this service and see if the "stalled pool shutdown" goes
away.

Second step is compiling kernel with CONFIG_DEBUG_VM enabled. This will
warn us if the driver leaked the a page_pool controlled page, without
first "releasing" is correctly.  See commit dba1b8a7ab68 ("mm/page_pool:
catch page_pool memory leaks") for how the warning will look like.
  (p.s. this CONFIG_DEBUG_VM have surprisingly low-overhead, as long as
you don't select any sub-options, so we choose to run with this in
production).

Third step is doing kernel debugging like Dragos did in [1].

What kernel version are you using?

In kernel v6.8 we (Kuba) silenced some of the cases.  See commit
be0096676e23 ("net: page_pool: mute the periodic warning for visible
page pools").
To Jakub/kuba can you remind us how to use the netlink tools that can
help us inspect the page_pools active on the system?


> xdp-filter load green0
> 

Most drivers change memory model and reset the RX rings, when attaching
XDP.  So, it makes sense that the existing page_pool instances (per RXq)
are freed and new allocated.  Revealing any leaked or unprocessed
page_pool pages.


> Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci 0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
> Aug 31 19:19:07 loongfire kernel: [200872.810587] page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 200399 sec

It is very weird that a stall time of 200399 sec is reported. This
indicate that this have been happening *before* the xdp-filter was
attached. The uptime "200871.855044" indicate leak happened 472 sec
after booting this system.

Have you seen these dmesg logs before attaching XDP?

This will help us know if this page_pool became "invisible" according to
Kuba's change, if you run kernel >= v6.8.


> Aug 31 19:20:07 loongfire kernel: [200933.226488] page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight 200460 sec
> Aug 31 19:21:08 loongfire kernel: [200993.642391]
> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> 200520 sec
> Aug 31 19:22:08 loongfire kernel: [201054.058292]
> page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
> 200581 sec
> 

Cc'ed some people that might have access to this hardware, can any of
you reproduce?

--Jesper

