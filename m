Return-Path: <xdp-newbies+bounces-39-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F61851712
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 15:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBDFD28359E
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC7039FD0;
	Mon, 12 Feb 2024 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PI511N2S";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Jd02fmu"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335AFFC16
	for <xdp-newbies@vger.kernel.org>; Mon, 12 Feb 2024 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707748515; cv=none; b=WUItXd622cTOPUKeGp22Iy4lj3i3DX4tJhCWWtPuNqHJKNW2nek67CJdEBsswDujS+c0kJrr7OMhXf3ir+kbPES00LsTBXTzQvfFjNabMbdN17k30vmAatyXtstIlHkXNwCgPDEzRmGjfpA4G6esfkyI03ilTttqrz1K/OB2bnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707748515; c=relaxed/simple;
	bh=VYT3L0bnlxd/XBpN3sC9nxtPV3MroYmQQolroB2p6cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m+njOBleta05KK0eqNv1YbI8m4Ge5sCsA92XJdgrB6owjyhbu3RaAFfCluffB5hgN49z5De2eFLQSaBDlwRD7sbR02ue8zx/+xvwpyQZGbtPUN+qSPOqBekY1Fvk741oni0OpxM/AdaDQihiwdUg2vspnh0FMcYsd5vS3PY6BJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PI511N2S; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Jd02fmu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1707748511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MdO8x7j/WdEuQJl6jEeEeK3rT3ORbl0PeydM+djkE4I=;
	b=PI511N2S1KkjdmEG+9uv3YGwIH8MirI4iUOcz2/j1zy+HctThCnLQcaPo7OAmPOuuD9oYJ
	54MvsvQU4nUKrrRhyFuZ2efEQyhccZgwLT3d4rIi09c42CKureTl16SU2mEJtxp8TXa1RE
	SmMG7JzhSvRjRwybcGH8NhWHeA//xI/6/PfswiHSE+xBileJi77wuCjUCjdVBJqpMpVM01
	iJ4eXPs3Y1Ekj2VvkwHaMyZ/Uebk4hiqAkHnkObSLIbNwJiMKcR5+drDKOyT8+yzW5DXyb
	6ca1WGELZyua6tpEQlBznrfPJMRaLdL5NbVBEjRKP4m+qDi65npmUVI5HIZMyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1707748511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MdO8x7j/WdEuQJl6jEeEeK3rT3ORbl0PeydM+djkE4I=;
	b=2Jd02fmufh/5hQj4eT4CblHb4/FP7KRXuHvCaSncWRS5cVjqUxQDABTpgXxm/Jb83U5Dty
	/QxybSiRF6IfGOAw==
Date: Mon, 12 Feb 2024 15:35:10 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [xdp-hints] XDP Redirect and TX Metadata
Content-Language: en-US
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 xdp-hints@xdp-project.net, xdp-newbies@vger.kernel.org
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
 <87v86tg5qp.fsf@toke.dk>
From: Florian Kauer <florian.kauer@linutronix.de>
Autocrypt: addr=florian.kauer@linutronix.de; keydata=
 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
 ugsSqUGtSA==
In-Reply-To: <87v86tg5qp.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.24 14:41, Toke Høiland-Jørgensen wrote:
> Florian Kauer <florian.kauer@linutronix.de> writes:
> 
>> Hi,
>> I am currently implementing an eBPF for redirecting from one physical interface to another. So basically loading the following at enp8s0:
>>
>> SEC("prog")
>> int xdp_redirect(struct xdp_md *ctx) {
>> 	/* ... */
>> 	return bpf_redirect(3 /* enp5s0 */, 0);
>> }
>>
>> I made three observations that I would like to discuss with you:
>>
>> 1. The redirection only works when I ALSO load some eBPF at the egress interface (enp5s0). It can be just
>>
>> SEC("prog")
>> int xdp_pass(struct xdp_md *ctx) {
>> 	return XDP_PASS;
>> }
>>
>> but there has to be at least something. Otherwise, only xdp_redirect is called, but xdp_devmap_xmit is not.
>> It seems somewhat reasonable that the interface where the traffic is redirected to also needs to have the
>> XDP functionality initialized somehow, but it was unexpected at first. It tested it with an i225-IT (igc driver)
>> and a 82576 (igb driver). So, is this a bug or a feature?
> 
> I personally consider it a bug, but all the Intel drivers work this way,
> unfortunately. The was some discussion around making the XDP feature
> bits read-write, making it possible to enable XDP via ethtool instead of
> having to load a dummy XDP program. But no patches have materialised yet.

I see, thanks! So at least it is expected behavior for now.
How do other non-Intel drivers handle this?


>> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
>> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
>> TX it is "AF_XDP TX Metadata"
>> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
>> That seems to imply that TX metadata only works for AF_XDP, but not
>> for direct redirection. Is there a reason for that?
> 
> Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
> around to extending this to the regular XDP forwarding path yet.

Ok, that is fine. I had the fear that there is some fundamental problem
that prevents to implement this.


>> 3. At least for the igc, the egress queue is currently selected by
>> using the smp_processor_id.
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igc/igc_main.c?h=v6.8-rc4#n2453)
>> For our application, I would like to define the queue on a per-packet
>> basis via the eBPF. This would allow to steer the traffic to the
>> correct queue when using TAPRIO full hardware offload. Do you see any
>> problem with introducing a new metadata field to define the egress
>> queue?
> 
> Well, a couple :)
> 
> 1. We'd have to find agreement across drivers for a numbering scheme to
> refer to queues.

Good point! At least we already refer to queues in the MQPRIO qdisc
( queues count1@offset1 count2@offset2 ... ).
There might be different alternatives (like using the traffic class)
for this IF we want to implement this ...

> 2. Selecting queues based on CPU index the way its done now means we
> guarantee that the same queue will only be served from one CPU. Which
> means we don't have to do any locking, which helps tremendously with
> performance. Drivers handle the case where there are more CPUs than
> queues a bit differently, but the ones that do generally have a lock
> (with associated performance overhead).

... but this will likely completely prevent to implement this in the
straight forward way. You are right, we do not want the CPUs to constantly
fight for access to the same queues for every packet.

> As a workaround, you can use a cpumap to steer packets to specific CPUs
> and perform the egress redirect inside the cpumap instead of directly on
> RX. Requires a bit of knowledge of the hardware configuration, but it
> may be enough for what you're trying to do.

So I really like this approach on first glance since it prevents the issue
you describe above.

However, as you write, it is very hardware dependent and also depends on
how exactly the driver handles the CPU -> Queue mapping internally.
I have the feeling that the mapping CPU % Queue Number -> Queue as it is
implemented in the moment might neither be stable over time nor over
different drivers, even if it is the most likely one.

What do you think maybe about exporting an interface (e.g. via ethtool)
to define the mapping of CPU -> Queue?

Thanks,
Florian

