Return-Path: <xdp-newbies+bounces-193-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF2C73CEA
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 Nov 2025 12:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 30CBB3073B
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 Nov 2025 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06AB326921;
	Thu, 20 Nov 2025 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioVz8R0b"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5791A2D7DEB;
	Thu, 20 Nov 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639194; cv=none; b=rEqEgYwIGDd1Dqz/Xjpkmt+/oGXfFE+xGf7MaFr5MbujRlZtXu1YiNvb/M7uxCOpZvPF9hs/TLW5jFUh4Mcq2nPzpQW+/bcsoYSFWRcqijAgcCCENbkVxk8VkLdpogXp/5b+rZZ0jU5y7CEqVetGqaMboV7C3cbVHX5TeRLjH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639194; c=relaxed/simple;
	bh=Hjvk/TbZrxYtx11cm6+WsGhzGqGOEZoJxdE6pKvyKFg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=h+/zyJuQpPQIpocmI+wJfOc8WgwYdKW5t8co7HPsFcpFZRuFOBHBrVMyI4Gijd02y7xCEllIz7kBS3xHAJJyeY7sFsqwoY/Tpm9CxJif8BWYszTghPFUBPYvrPe0baTplFk1H8OBr+0LtNjkpMF/wg+46I/DsVYzfeYYKjbTP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioVz8R0b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36546C4CEF1;
	Thu, 20 Nov 2025 11:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763639192;
	bh=Hjvk/TbZrxYtx11cm6+WsGhzGqGOEZoJxdE6pKvyKFg=;
	h=Date:Subject:From:To:References:Cc:In-Reply-To:From;
	b=ioVz8R0bNOGlOaaifyAzGByIOEDvrh7xeaL2AO0SbdtNukNeoql72uzFyDW3yYqCX
	 Vh6AwXNLHmzaAIVrfxDdEajEqFPQbxQ80jhLtdnWi2GQPJd2IE+7XR1dgtThA72fmI
	 MgMiHZlA2vH9QeQIdOR2C168kFqaG+6nR6QrQc3CqQh5l3CCPYj2Wz4dU9Y2GAOISz
	 /I7XSuhu+x8Mxa3UHJvyWCEZqvvZo5UwWR6uHc9mMPrulYrVe5uF9VHbid1q7A9KNs
	 IphK/s0t0ADpbMrlkwGUnCOVg4hKisECVZF63MH4yEjMkK4T7uExu7GlT+j6jEDaoh
	 T2Y1pWFwCot/w==
Message-ID: <74a4f889-33fa-4218-8eee-1980c6981dd6@kernel.org>
Date: Thu, 20 Nov 2025 11:46:30 +0000
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FOSDEM 2026 eBPF Devroom Call for Participation
From: Quentin Monnet <qmo@kernel.org>
To: bpf <bpf@vger.kernel.org>, xdp-newbies <xdp-newbies@vger.kernel.org>,
 netdev@vger.kernel.org
References: <571ea41f-a6e9-4574-b5c5-737f0a0a9965@kernel.org>
Content-Language: en-GB
Cc: bpf@ietf.org
In-Reply-To: <571ea41f-a6e9-4574-b5c5-737f0a0a9965@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

The call for participation for the BPF devroom at FOSDEM'26 is currently
open, until December 1st (details below).

If you have things to say on the topic, please consider sending a
proposal. If you know people who might be interested in attending or
presenting, please let them know.

Thanks,
Quentin


2025-10-30 12:41 UTC+0100 ~ Quentin Monnet <qmo@kernel.org>
> We are delighted to announce the Call for Participation for the second
> eBPF Devroom at FOSDEM!
> 
> Mark the Dates
> --------------
> 
> * December 1st, 2025: Submission deadline
> * December 15th, 2025: Announcement of accepted talks and schedule
> * January 31st, 2026: eBPF Devroom at FOSDEM
> 
> eBPF at FOSDEM
> --------------
> 
> FOSDEM is a free, community-organized event focusing on open source, and
> aiming at gathering open source software developers and communities to
> meet, learn, and share. It takes place annually in Brussels, Belgium.
> After hosting a number of eBPF-related talks in various devrooms over
> the years, FOSDEM 2026 welcomes a devroom dedicated to eBPF for the
> second time! This devroom aims at gathering talks about various aspects
> of eBPF, ideally on multiple platforms.
> 
> Topics of Interest
> ------------------
> 
> If you have something to present about eBPF, we would love for you to
> consider submitting a proposal to the Devroom.
> 
> The projects or technologies discussed in the talks MUST be open-source.
> 
> Topics of interest for the Devroom include (but are not limited to):
> 
> * eBPF development: recent or proposed features (on Linux, on other
>   platforms, or even cross-platform), such as:
>     * eBPF program signing and supply chain security
>     * Profiling eBPF with eBPF
>     * eBPF-based process schedulers
>     * eBPF in storage devices
>     * eBPF verifier improvements or alternative implementations
>     * eBPF for profiling AI workloads
> * Deep-dives on existing eBPF features
> * Working with eBPF: best practices, common mistakes, debugging, etc.
> * eBPF toolchain, for compiling, managing, debugging, packaging, and
>   deploying eBPF programs and related objects
> * eBPF libraries, in C/C++, Go, Rust, or other languages
> * eBPF in the real world, production use cases and their impact
> * eBPF community efforts (documentation, standardization, cross-platform
>   initiatives)
> 
> The list is not exhaustive, don’t hesitate to submit your proposal!
> 
> Format
> ------
> 
> FOSDEM 2026 will be an in-person event in Brussels, Belgium.
> We do not accept remote presentations.
> 
> We’re looking for 20- to 30-minute presentations. The duration should
> include time for questions: allow at least 5 to 10 minutes to answer
> questions from the public.
> 
> Note that due to time constraints, we may end up offering a slot
> duration different than the one requested when submitting. If you have
> specific duration requirements, we encourage you to mention them in your
> proposal.
> 
> You can look at last year's schedule for inspiration, at
> https://archive.fosdem.org/2025/schedule/track/ebpf/
> 
> How to Submit
> -------------
> 
> Please submit your proposals on Pretalx, FOSDEM’s submissions tool, at
> https://pretalx.fosdem.org/fosdem-2026/cfp
> 
> Make sure to select “eBPF” as the track.
> 
> Code of Conduct
> ---------------
> 
> All participants at FOSDEM are expected to abide by the FOSDEM’s Code of
> Conduct. If your proposal is accepted, you will be required to confirm
> that you accept this Code of Conduct. You can find this code at
> https://fosdem.org/2026/practical/conduct/
> 
> Devroom Organisers
> ------------------
> 
> * Alexei Starovoitov
> * Andrii Nakryiko
> * Bill Mulligan
> * Daniel Borkmann
> * Dimitar Kanaliev
> * Quentin Monnet
> * Yusheng Zheng
> 
> If you have questions about any aspects of this Call for Participation,
> please email us at ebpf-devroom-manager@fosdem.org, and we will do our
> best to assist you.
> 
> We keep an up-to-date version of this Call for Participation at
> https://ebpf.io/fosdem-2026.html


