Return-Path: <xdp-newbies+bounces-108-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D197928787
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 13:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64651B21602
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 11:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCD8148FE3;
	Fri,  5 Jul 2024 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oS6KzsAC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FhPwnIdc"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8413665A;
	Fri,  5 Jul 2024 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720177929; cv=none; b=iA4gLQC2U4SrH205uCf8mMur96PioAw/Kg6budFJP3i1BLCV4i09WWl0PbXv9lwc0y2KLb87kFC+dp6i+OA8wLI6vJrWYzSOEwvTxqhcqkN5oSMYJA0e8zPjqFRL1uJUI1Kmsnp3ZKqhkCNqxgxUQ3JJw5yQ9bb4uZCFqrzEoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720177929; c=relaxed/simple;
	bh=mZZQG+yNGXQodt/31xkO8LvjHA+VMXQ1/CUp/oZgocY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aogpAANiSR4/GeH+RblcesN4LtgWbbMGzBSkIj5qFIWy+ApYseMqfN2EaoqgH7xp73011ymTg/oS16vIrOS9Cqz54/dZqTcYdrYZNdeoJkBonhi1mGU1FMx5ar/0UfV1VkEhI4KkLv96URYvPsx6BR4FtrJMwpgHMIKFsXA+DBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oS6KzsAC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FhPwnIdc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <987c3ca8-156b-47ed-b0b6-ed6d7d54d168@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720177925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TLNLRYHIdXNL25FtelSwVd460wymPAdZFv03ehcvdXo=;
	b=oS6KzsACixL/5HLtcbPFsAACsSNgtAxwGk14CbM5RLvq7YODP4sNLfqwmysX+7o90MLsgM
	yGAbaM5N1am2TJh8Vg8p+bgHhvug4Q94mFQEiGBwrAbbDLdiil8YhY/Ob9KI5XAnQcrF1J
	Qg+CuIqtQv70DelmUQ4vYyn+kVdrL0SlfyZ5auFYGWNWVdaarPO+3++0PrvZNVwVv+0LB3
	QE4AzrTZxbIN0YZm5eEavg5APOhksSBo4oLX5xZAicauWUravPMSDrbS8lwMa0PUZumRq/
	zKhSmoXDamz8age5mnjfyd3xvZagmM2XU39isRBauBSwqtq+0Zqp51JN5gMNrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720177925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TLNLRYHIdXNL25FtelSwVd460wymPAdZFv03ehcvdXo=;
	b=FhPwnIdct1F+lz1JQ7Q7hppZCa7312aIO6ii6fcBSEKgMmKir4KXpgaYPxlRrqHVu0zJPk
	m+r1jSC13zhLY/DA==
Date: Fri, 5 Jul 2024 13:12:04 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] bpf: provide map key to BPF program after redirect
Content-Language: en-US
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com
Cc: davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 xdp-newbies@vger.kernel.org
References: <20240705103853.21235-1-florian.kauer@linutronix.de>
 <87zfqw85mp.fsf@toke.dk>
From: Florian Kauer <florian.kauer@linutronix.de>
Autocrypt: addr=florian.kauer@linutronix.de; keydata=
 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
 ugsSqUGtSA==
In-Reply-To: <87zfqw85mp.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/5/24 13:01, Toke Høiland-Jørgensen wrote:
> Florian Kauer <florian.kauer@linutronix.de> writes:
> 
>> Both DEVMAP as well as CPUMAP provide the possibility
>> to attach BPF programs to their entries that will be
>> executed after a redirect was performed.
>>
>> With BPF_F_BROADCAST it is in also possible to execute
>> BPF programs for multiple clones of the same XDP frame
>> which is, for example, useful for establishing redundant
>> traffic paths by setting, for example, different VLAN tags
>> for the replicated XDP frames.
>>
>> Currently, this program itself has no information about
>> the map entry that led to its execution. While egress_ifindex
>> can be used to get this information indirectly and can
>> be used for path dependent processing of the replicated frames,
>> it does not work if multiple entries share the same egress_ifindex.
>>
>> Therefore, extend the xdp_md struct with a map_key
>> that contains the key of the associated map entry
>> after performing a redirect.
>>
>> See
>> https://lore.kernel.org/xdp-newbies/5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de/T/#u
>> for the discussion that led to this patch.
>>
>> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
>> ---
>>  include/net/xdp.h        |  3 +++
>>  include/uapi/linux/bpf.h |  2 ++
>>  kernel/bpf/devmap.c      |  6 +++++-
>>  net/core/filter.c        | 18 ++++++++++++++++++
>>  4 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/net/xdp.h b/include/net/xdp.h
>> index e6770dd40c91..e70f4dfea1a2 100644
>> --- a/include/net/xdp.h
>> +++ b/include/net/xdp.h
>> @@ -86,6 +86,7 @@ struct xdp_buff {
>>  	struct xdp_txq_info *txq;
>>  	u32 frame_sz; /* frame size to deduce data_hard_end/reserved tailroom*/
>>  	u32 flags; /* supported values defined in xdp_buff_flags */
>> +	u64 map_key; /* set during redirect via a map */
>>  };
>>  
>>  static __always_inline bool xdp_buff_has_frags(struct xdp_buff *xdp)
>> @@ -175,6 +176,7 @@ struct xdp_frame {
>>  	struct net_device *dev_rx; /* used by cpumap */
>>  	u32 frame_sz;
>>  	u32 flags; /* supported values defined in xdp_buff_flags */
>> +	u64 map_key; /* set during redirect via a map */
>>  };
> 
> struct xdp_frame is size constrained, so we shouldn't be using precious
> space on this. Besides, it's not information that should be carried
> along with the packet after transmission. So let's put it into struct
> xdp_txq_info and read it from there the same way we do for egress_ifindex :)

Very reasonable, but do you really mean struct xdp_frame or xdp_buff?
Only the latter has the xdp_txq_info?

> 
>>  static __always_inline bool xdp_frame_has_frags(struct xdp_frame *frame)
>> @@ -257,6 +259,7 @@ void xdp_convert_frame_to_buff(struct xdp_frame *frame, struct xdp_buff *xdp)
>>  	xdp->data_meta = frame->data - frame->metasize;
>>  	xdp->frame_sz = frame->frame_sz;
>>  	xdp->flags = frame->flags;
>> +	xdp->map_key = frame->map_key;
>>  }
>>  
>>  static inline
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 35bcf52dbc65..7dbb0f2a236c 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -6455,6 +6455,8 @@ struct xdp_md {
>>  	__u32 rx_queue_index;  /* rxq->queue_index  */
>>  
>>  	__u32 egress_ifindex;  /* txq->dev->ifindex */
>> +
>> +	__u64 map_key; /* set during redirect via a map in xdp_buff */
>>  };
> 
> Maybe make the comment a bit easier to understand? Something like "key
> of devmap/cpumap entry that is executing"?

Agreed, thanks!

> 
> -Toke
> 

