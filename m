Return-Path: <xdp-newbies+bounces-40-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9500853126
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 14:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD74D1C265E2
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3850246444;
	Tue, 13 Feb 2024 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="VMfjLY5V"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6418F51C5D
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.95.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829244; cv=none; b=Y8UVJigxf+LxM9KujcJBeqYuaoLiepOJMUkbZqq0Rz2guZpRdgzAKeDeqX7JCjMGiOIjaxoBj+hLSMiWMYUupwnOUeOZ5aPwpJHSIp6bpn0AB8pZd9q37aDvX8t6rYQNFsE/iUhR+xqhM1kjvy9kUfQNP/tQQAEC5N9T4yckMbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829244; c=relaxed/simple;
	bh=xGjzUWmaPugYVvzCnAqJWC3hffYdRCVUX+8tjtOYStc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d4S1EJeRlp3P+N7M/yQNs03F4CL/la2flVryEBIie4U4sUMmH1d3GjwitlB/5XzdcI7QUQIJ+Ji9tUDdzNKyJoynDtb1e37S5NVMS6u7yk70tf/eOaP2omQx7HnfLUak3AFHkAUJBZGi8MBoukMOkNZnIqzlArjvV9s+rO/BFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk; spf=pass smtp.mailfrom=toke.dk; dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b=VMfjLY5V; arc=none smtp.client-ip=45.145.95.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1707829231; bh=xGjzUWmaPugYVvzCnAqJWC3hffYdRCVUX+8tjtOYStc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=VMfjLY5VffIACgusBpfSIjz9mNTZJ/9KFVIqACFjj+9OfXeZM+wbbqg2CFvqu4K0Z
	 +DsVLkcNR+ooJuvUVwqLH6E8K+7KzIJXcCB5G4UYtiFyCvKQrgp6vhKPB0rUniOe4G
	 lsLLynEkSAykp7W8Kuc9OkkZz5QXcFjFnYMKZL3s8CN+OF0LVOddVdxE1U4/uPy0uG
	 YGiDEywsOOVMFA305QfdgcgFSV7rkq5ybvaJEQgTbIKxC7ZHN/ur6zg+ZU3cXjeKpq
	 5rpTvMaw/tNoTjcCnJMasqbSrIAMuzDIn2hoA5Vp7Ose9CkMZp/4MbLYBLkfkWhRiq
	 61Iblct/Z/ZTw==
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-hints@xdp-project.net,
 xdp-newbies@vger.kernel.org
Subject: Re: [xdp-hints] XDP Redirect and TX Metadata
In-Reply-To: <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
 <87v86tg5qp.fsf@toke.dk>
 <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
Date: Tue, 13 Feb 2024 14:00:31 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87o7ckfrio.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Florian Kauer <florian.kauer@linutronix.de> writes:

> On 12.02.24 14:41, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>> Hi,
>>> I am currently implementing an eBPF for redirecting from one physical i=
nterface to another. So basically loading the following at enp8s0:
>>>
>>> SEC("prog")
>>> int xdp_redirect(struct xdp_md *ctx) {
>>> 	/* ... */
>>> 	return bpf_redirect(3 /* enp5s0 */, 0);
>>> }
>>>
>>> I made three observations that I would like to discuss with you:
>>>
>>> 1. The redirection only works when I ALSO load some eBPF at the egress =
interface (enp5s0). It can be just
>>>
>>> SEC("prog")
>>> int xdp_pass(struct xdp_md *ctx) {
>>> 	return XDP_PASS;
>>> }
>>>
>>> but there has to be at least something. Otherwise, only xdp_redirect is=
 called, but xdp_devmap_xmit is not.
>>> It seems somewhat reasonable that the interface where the traffic is re=
directed to also needs to have the
>>> XDP functionality initialized somehow, but it was unexpected at first. =
It tested it with an i225-IT (igc driver)
>>> and a 82576 (igb driver). So, is this a bug or a feature?
>>=20
>> I personally consider it a bug, but all the Intel drivers work this way,
>> unfortunately. The was some discussion around making the XDP feature
>> bits read-write, making it possible to enable XDP via ethtool instead of
>> having to load a dummy XDP program. But no patches have materialised yet.
>
> I see, thanks! So at least it is expected behavior for now.
> How do other non-Intel drivers handle this?

I believe Mellanox drivers have some kind of global switch that can
completely disable XDP, but if it's enabled (which it is by default)
everything works including redirect. Other drivers just have XDP
features always enabled.

>>> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
>>> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
>>> TX it is "AF_XDP TX Metadata"
>>> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
>>> That seems to imply that TX metadata only works for AF_XDP, but not
>>> for direct redirection. Is there a reason for that?
>>=20
>> Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
>> around to extending this to the regular XDP forwarding path yet.
>
> Ok, that is fine. I had the fear that there is some fundamental problem
> that prevents to implement this.
>
>
>>> 3. At least for the igc, the egress queue is currently selected by
>>> using the smp_processor_id.
>>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/net/ethernet/intel/igc/igc_main.c?h=3Dv6.8-rc4#n2453)
>>> For our application, I would like to define the queue on a per-packet
>>> basis via the eBPF. This would allow to steer the traffic to the
>>> correct queue when using TAPRIO full hardware offload. Do you see any
>>> problem with introducing a new metadata field to define the egress
>>> queue?
>>=20
>> Well, a couple :)
>>=20
>> 1. We'd have to find agreement across drivers for a numbering scheme to
>> refer to queues.
>
> Good point! At least we already refer to queues in the MQPRIO qdisc
> ( queues count1@offset1 count2@offset2 ... ).
> There might be different alternatives (like using the traffic class)
> for this IF we want to implement this ...

Oh, plenty of options; the tricky bit is agreeing on one, and figuring
out what the right kernel abstraction is. For instance, in the regular
networking stack, the concept of a queue is exposed from the driver into
the core stack, but for XDP it isn't.

>> 2. Selecting queues based on CPU index the way its done now means we
>> guarantee that the same queue will only be served from one CPU. Which
>> means we don't have to do any locking, which helps tremendously with
>> performance. Drivers handle the case where there are more CPUs than
>> queues a bit differently, but the ones that do generally have a lock
>> (with associated performance overhead).
>
> ... but this will likely completely prevent to implement this in the
> straight forward way. You are right, we do not want the CPUs to constantly
> fight for access to the same queues for every packet.
>
>> As a workaround, you can use a cpumap to steer packets to specific CPUs
>> and perform the egress redirect inside the cpumap instead of directly on
>> RX. Requires a bit of knowledge of the hardware configuration, but it
>> may be enough for what you're trying to do.
>
> So I really like this approach on first glance since it prevents the issue
> you describe above.
>
> However, as you write, it is very hardware dependent and also depends on
> how exactly the driver handles the CPU -> Queue mapping internally.
> I have the feeling that the mapping CPU % Queue Number -> Queue as it is
> implemented in the moment might neither be stable over time nor over
> different drivers, even if it is the most likely one.

No, the application would have to figure that out. FWIW I looked at this
for other reasons at some point and didn't find any drivers that did
something different than using the CPU number (with or without the
modulus operation). So in practice I think using the CPU ID as a proxy
for queue number will work just fine on most hardware...

> What do you think maybe about exporting an interface (e.g. via
> ethtool) to define the mapping of CPU -> Queue?

Well, this would require ethtool to know about those queues, which means
defining a driver<->stack concept of queues for XDP. There was some
attempt at doing this some years ago, but it never went anywhere,
unfortunately. I personally think doing something like this would be
worthwhile, but it's a decidedly non-trivial undertaking :)

-Toke

