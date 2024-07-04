Return-Path: <xdp-newbies+bounces-102-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A69276DC
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 15:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AAF52829C1
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180D21AED33;
	Thu,  4 Jul 2024 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kcKNwie0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MDI3QiVI"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E81AE86C
	for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2024 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098497; cv=none; b=Aq1VIe2hTdTUKViw+m0ObUDx8ooWPyXbbRPCyAdC7q7MMx7EBAMTZLBzQTGxRd8wHQqmQx7QIrRdxLRd8Bj2Y9cZtX8i4ALqRS0zASlLopwA92FKzho102SkOjFMQWhH50Jh63hl25w6Z1ou8uSSEV/Etbp8LpYttCz3M9m3DK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098497; c=relaxed/simple;
	bh=yKE+f8FuVa6boKthxPP7MdQugk49oo7tX6DPUpHcqk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a25LYzqimxJldYbuH/Cm4ctl+tEUUUC3NdUCrtF2M74yS5PzQeWalEV4XN8h2EEIRtfuZicm1+HmqASAihOL+NJ+vodv+2n53YY8GZwajRgShhnIDKX+b5DhQDCvV/LMGtBikviNEUZTjTM4m81Wus1t/Nkkt+4mbQxscN+yhLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kcKNwie0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MDI3QiVI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <76f0edb8-b510-49b6-a541-5f9ccf703b0c@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720098494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q2WekE93+t+nbSF/1CfRAmJYviEtzS+lp/16H7Gcf7Q=;
	b=kcKNwie0x6aPSmWGdb8bgDrIbCEtVgkvxmkoMz6yp7/VBcrMpwTL0r2uRnBzFr2xnm1sQX
	1gGbkIIynxpsVqSreFh4Mv9YpxVIrT/V8ES6+hab4UkniKE2jh7uE31WKUmE+i3k5TqRq1
	ewfeEh9eHDClGBmzWYZ8ZMpZsdwxlXV8D0h+/9Y59BHGAh5UkENuKFO4rsMdK6zLAM1Sxl
	9x5M3xW28z7z1rpsVwmaL1/ZoK0hCtiWBbC8ZGvHfW+ujI5yRAeoy1PbxbogAKMC3W5jOd
	t1Pbu/uglVmYkumgWH2xKIBNK+6UK03FRvcA9WOLoAmoovNZep+2r+LGVVfDIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720098494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q2WekE93+t+nbSF/1CfRAmJYviEtzS+lp/16H7Gcf7Q=;
	b=MDI3QiVIXP6Mx1GcKfjRRbVbnCGR0v8k5Fp6A4gv639jXa+TYwGcY8GmVTrS4nCOKCddQE
	ubDJ1dCWgaSeWjAw==
Date: Thu, 4 Jul 2024 15:08:13 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Different packet handling after bpf_redirect_map with
 BPF_F_BROADCAST
Content-Language: en-US
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 xdp-newbies@vger.kernel.org
Cc: Ferenc Fejes <ferenc.fejes@ericsson.com>
References: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
 <87msmx1k0j.fsf@toke.dk> <81d6605e-f28f-4457-81f8-5f8b4b33e8ff@linutronix.de>
 <87ed891gs5.fsf@toke.dk>
From: Florian Kauer <florian.kauer@linutronix.de>
Autocrypt: addr=florian.kauer@linutronix.de; keydata=
 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
 ugsSqUGtSA==
In-Reply-To: <87ed891gs5.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/24 14:30, Toke Høiland-Jørgensen wrote:
> Florian Kauer <florian.kauer@linutronix.de> writes:
> 
>> Hi Toke,
>> thanks a lot for the prompt response!
>>
>> On 7/4/24 13:20, Toke Høiland-Jørgensen wrote:
>>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>>
>>>> Hi,
>>>> we are currently using bpf_redirect_map with BPF_F_BROADCAST to replicate frames for sending traffic over redundant paths.
>>>>
>>>> See for example https://www.rfc-editor.org/rfc/rfc8655.html#section-3.2.2.2 for background
>>>> and https://github.com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325f0e77df3020526ad992aff/src/xdpfrer.bpf.c#L393 for the current implementation.
>>>>
>>>> However, we want to modify the frame after the replication. In the easiest case this means to change the VLAN tag to route the traffic over different VLANs. This is currently done by taking a different egress_ifindex into account after the replication and that works well so far ( https://github.com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325f0e77df3020526ad992aff/src/xdpfrer.bpf.c#L399 ).
>>>>
>>>> BUT there are cases where the egress_interface for both replicated packets shall be the same and the different path of the replicated frames is only taken on a subsequent switch based on a different VLAN tag. So how could the XDP program differentiate between the different replicated frames if the egress_interface is the same?
>>>>
>>>> So my basic idea would be to add two (or more) DEVMAP entries with the same ifindex into the same map. And then either
>>>>
>>>> 1. Add several xdp/devmap progs to the same loaded bpf and reference them in the DEVMAP entry, like
>>>>
>>>> SEC("xdp/devmap")
>>>> int replicate_postprocessing_first(struct xdp_md *pkt)
>>>> {
>>>>     int ret = change_vlan(pkt, 0, true);
>>>>     ...
>>>> }
>>>>
>>>> SEC("xdp/devmap")
>>>> int replicate_postprocessing_second(struct xdp_md *pkt)
>>>> {
>>>>     int ret = change_vlan(pkt, 1, true);
>>>>     ...
>>>> }
>>>>
>>>> This, however, would be quite unflexible.
>>>
>>> Having multiple entries in the devmap entry corresponds roughly to how
>>> the stack handles VLANs. I.e., when configuring a VLAN, you create a new
>>> netdevice (which you would then put into the devmap). Unfortunately, XDP
>>> doesn't really know how to deal with stacked devices like VLANs, so you
>>> can't actually add a VLAN device into a devmap. But creating an
>>> interface for this would be one way of dealing with a situation like
>>> this, without having to hardcode things into a BPF program.
>>
>> I see. That would be very nice in general, but for our specific application
>> likely still to unflexible to refer to a different VLAN interface
>> (e.g. in addition to changing the VLAN tag we also might want to
>> add/remove/modify MPLS labels and other headers).
> 
> Yeah, part of the reason this stacked device support never materialised
> is that the way the kernel handles it requires a lot of indirection
> (MPLS+VLAN would be two stacked devices on top of each other, say), and
> for XDP you probably want to short-circuit this anyway. So that means
> rolling your own abstraction here; but you can do that with the custom
> devmap approach :)

Sounds good :-)

> 
>>>> 2. Load the same bpf several times without attaching it to an
>>>> interface and set e.g. a const to a different value after loading.
>>>
>>> This would work, I think. Something like:
>>>
>>> static volatile const vlan_id = 1;
>>>
>>> SEC("xdp/devmap")
>>> int replicate_postprocessing_second(struct xdp_md *pkt)
>>> {
>>>     int ret = change_vlan(pkt, vlan_id, true);
>>>     ...
>>> }
>>>
>>> and then the loader would replace the value of vlan_id before loading;
>>> using skeletons this would look something like:
>>>
>>> skel = xdp_program_skeleton__open();
>>> skel->rodata->vlan_id = 2;
>>> xdp_program_skeleton__load();
>>>
>>> /* attach to devmap */
>>
>> Yes, that is exactly what I was imagining, thanks!
>>
>>>
>>>> But can I even reference a xdp/devmap prog from a different loaded
>>>> bpf, especially when it is not attached?
>>>
>>> Why do you need to reference it from a different BPF program? The
>>> userspace program just attaches it to the right devmap entry?
>>
>> What I wanted to imply with this is that the lifetime of the different BPF
>> programs is unclear to me. So AFAIK (but I might be totally wrong) an
>> XDP program has the lifetime of the process that loaded the program
>> (i.e. called xdp_program_skeleton__load()) so it is destroyed/unloaded
>> as soon as the process ends, UNLESS it is explicitly attached to an interface
>> by which it inherits the lifetime of the interface it was attached to
>> (i.e. might outlive the loading process).
>>
>> If I do what you sketched above, where we do not attach the program explicitly
>> to an interface but only directly to the devmap, does it then inherit the
>> lifetime of the interface of the BPF program the devmap belongs to or is
>> it destroyed as soon as the loading process end?
> 
> Ah, right. Devmap attachment works similar to netlink attachment to an
> interface: you pass in an fd as part of the bpf_map_update() from
> userspace, and the devmap takes a reference on the BPF program when
> inserting it into the map. So the BPF program inserted this way stays
> alive as long as the map does, unless it is explicitly removed by
> another bpf_map_update().
> 
> Normally, the map itself will be referenced by the XDP program running
> on ingress, so as long as that stays attached, the map will stay alive.
> And when the (ingress) XDP program is removed, it will release its
> reference on the map, which in turn will cause the map to release all
> references to other BPF programs inserted into it.
> 
> So in other words, there is no direct reference between the two XDP
> programs, but things should mostly keep working the way you expect them
> to...

Ok, that makes a lot of sense, thanks!

> 
>>>> 3. Extend the kernel with a way to let the xdp/devmap prog know from
>>>> which DEVMAP entry its execution originates (like an additional entry
>>>> in the bpf_devmap_val that is then set in the xdp_md).
>>>
>>> This could be useful in any case, so I would personally be fine with
>>> adding something like this (for both devmap and cpumap) :)
>>
>> Would you prefer a simple u32 (or similar) that could then be used as
>> index for an array or a more complex data structure/void* to fill
>> with arbitrary data?
> 
> Well, the API for map indexing specifies a u64 map index, so just
> reusing that would be the simplest :)

u64? Now I am confused:
"The key type is an unsigned 32-bit integer (4 bytes)"
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/bpf/map_array.rst?h=next-20240703

> 
> -Toke
> 

Thanks,
Florian

