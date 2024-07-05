Return-Path: <xdp-newbies+bounces-109-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 659CE92896E
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF2F1C239C7
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jul 2024 13:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6410214AD2B;
	Fri,  5 Jul 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PMZ0wTLA"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F691E52A
	for <xdp-newbies@vger.kernel.org>; Fri,  5 Jul 2024 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720185521; cv=none; b=ssabFUECdjqDCO4r4v/Z3EHtAAy55G34gvM8D8XQ0gI3gKjz7uEwOnDohgBGcK3CYv7NWwQEQ0QxfBMO0f7aj8dg/lD5NHQAasGe5za+9nJBD8mNup/v0/T3WARlBjmBZSKciDtgk3q4SHsstsvinZRVEouI4jICSSfd3S6FrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720185521; c=relaxed/simple;
	bh=XabRrceFxcF0KBIJc9MbE+XTnegGGAzIgYPWZjAd71I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ekFDSv+hKSz1ACWOxvvy+VjlqNDkczIUZU6VN1teBR7/RG1fpcdbALP7MBkon2xHm/EQBr9wHFbamrhpF6vntmMZJGojl2rYr24HBNqEeG36lvFx1t3U+5QvBBkBd60XK0Dv8TLUuzNZFlcUXyjcSNPaOD7oiJgWGXEnZGjS0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PMZ0wTLA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720185518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62aYuvlj0aJrfftHw3OdTbReRjrfxK3xjdMTv0VrPgI=;
	b=PMZ0wTLA0Q73V85WsF4WzwrjNZVUjiMuTRWHAuW0YieBThSjmv/lXC9aEcJmP5BWBRFfSp
	ZCSzs8fa6Ot25uONkwgCzTQ+ztQmlQsY8HdU4MPQLzxpt+NJwEzVa4oWwW+6Udr9J4WetR
	kaPQjyWrdpeuK1wNcXZJsuFs9ahqV5c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-FQ2fpGiROTC5m_c7XpWzSQ-1; Fri, 05 Jul 2024 09:18:37 -0400
X-MC-Unique: FQ2fpGiROTC5m_c7XpWzSQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a72af18f571so171935466b.2
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jul 2024 06:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720185516; x=1720790316;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62aYuvlj0aJrfftHw3OdTbReRjrfxK3xjdMTv0VrPgI=;
        b=NtlxI2fhG20ASiP43SOyXSw4ZHR6ETV3txfUXJOB9eIN4lxKx0SvHDwxc8A4gUcv6m
         rE13tWkr8jpMSPeSMFlBiHsfwkx3ok46xWH7pWYiZQ2OMMhxK2vxbK4jhaxNp3A3XQmO
         OX3qkvv3lHpafxd3UmGy5pesc1dfIIL85rEaXZbcCrh1+2wClVplcX4w+crySdHsU8aY
         ApaaTbLWSucWMmsoeWFuhYcnq/AslWncY7W2Jckb/K/7bvEy2vp96PuUTs7d84Jsp5MZ
         Vdl39iohtT+/GLrbdtE7wYP2Etrn7xH6FdweIakN0INmuaKD18ZfGAEEoliOyEozBPpk
         JzGw==
X-Forwarded-Encrypted: i=1; AJvYcCWiYOcGtGe29lT4nQC3t5DI6ckP6tOC6TW1N4NgXEhPeUrWceOb3VjkE+G0aobkEgYk0Fd+JPDjGpjbFnrhTUEywPF6q3O1PdqmtHQ=
X-Gm-Message-State: AOJu0YwAK9VVgQsUr88KetPwPegt6oPdAegpghm3yFXQlKSJGhTbbMcx
	cK5rNcnP6IeICiVAkDB++9fF/7yPFX57OfC+jLW5N7QuflrKlUEbr7z9jXRfyKWR6mzxe/nG3oq
	316A7yyHPyA8rhXG/K6yxOa3oJke9xInZagXK5WE4dLudy15L1ovnGi4KaVVp
X-Received: by 2002:a17:906:c9c6:b0:a6f:4a42:1976 with SMTP id a640c23a62f3a-a77ba70e46bmr325708666b.37.1720185516236;
        Fri, 05 Jul 2024 06:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb9mUZwv0LhDRrdW6Gq2ToasHLSkXTvO7pDP+kDNwoiP/yJeMD+4Nmr3QADNVIspVclQSnJQ==
X-Received: by 2002:a17:906:c9c6:b0:a6f:4a42:1976 with SMTP id a640c23a62f3a-a77ba70e46bmr325706366b.37.1720185515818;
        Fri, 05 Jul 2024 06:18:35 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c2aee010sm103537566b.102.2024.07.05.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 06:18:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 0A1F313FDC48; Fri, 05 Jul 2024 15:18:35 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, ast@kernel.org,
 daniel@iogearbox.net, john.fastabend@gmail.com
Cc: davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 xdp-newbies@vger.kernel.org
Subject: Re: [PATCH] bpf: provide map key to BPF program after redirect
In-Reply-To: <987c3ca8-156b-47ed-b0b6-ed6d7d54d168@linutronix.de>
References: <20240705103853.21235-1-florian.kauer@linutronix.de>
 <87zfqw85mp.fsf@toke.dk>
 <987c3ca8-156b-47ed-b0b6-ed6d7d54d168@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 05 Jul 2024 15:18:35 +0200
Message-ID: <87wmm07z9w.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Florian Kauer <florian.kauer@linutronix.de> writes:

> On 7/5/24 13:01, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>> Both DEVMAP as well as CPUMAP provide the possibility
>>> to attach BPF programs to their entries that will be
>>> executed after a redirect was performed.
>>>
>>> With BPF_F_BROADCAST it is in also possible to execute
>>> BPF programs for multiple clones of the same XDP frame
>>> which is, for example, useful for establishing redundant
>>> traffic paths by setting, for example, different VLAN tags
>>> for the replicated XDP frames.
>>>
>>> Currently, this program itself has no information about
>>> the map entry that led to its execution. While egress_ifindex
>>> can be used to get this information indirectly and can
>>> be used for path dependent processing of the replicated frames,
>>> it does not work if multiple entries share the same egress_ifindex.
>>>
>>> Therefore, extend the xdp_md struct with a map_key
>>> that contains the key of the associated map entry
>>> after performing a redirect.
>>>
>>> See
>>> https://lore.kernel.org/xdp-newbies/5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d=
1@linutronix.de/T/#u
>>> for the discussion that led to this patch.
>>>
>>> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
>>> ---
>>>  include/net/xdp.h        |  3 +++
>>>  include/uapi/linux/bpf.h |  2 ++
>>>  kernel/bpf/devmap.c      |  6 +++++-
>>>  net/core/filter.c        | 18 ++++++++++++++++++
>>>  4 files changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/net/xdp.h b/include/net/xdp.h
>>> index e6770dd40c91..e70f4dfea1a2 100644
>>> --- a/include/net/xdp.h
>>> +++ b/include/net/xdp.h
>>> @@ -86,6 +86,7 @@ struct xdp_buff {
>>>  	struct xdp_txq_info *txq;
>>>  	u32 frame_sz; /* frame size to deduce data_hard_end/reserved tailroom=
*/
>>>  	u32 flags; /* supported values defined in xdp_buff_flags */
>>> +	u64 map_key; /* set during redirect via a map */
>>>  };
>>>=20=20
>>>  static __always_inline bool xdp_buff_has_frags(struct xdp_buff *xdp)
>>> @@ -175,6 +176,7 @@ struct xdp_frame {
>>>  	struct net_device *dev_rx; /* used by cpumap */
>>>  	u32 frame_sz;
>>>  	u32 flags; /* supported values defined in xdp_buff_flags */
>>> +	u64 map_key; /* set during redirect via a map */
>>>  };
>>=20
>> struct xdp_frame is size constrained, so we shouldn't be using precious
>> space on this. Besides, it's not information that should be carried
>> along with the packet after transmission. So let's put it into struct
>> xdp_txq_info and read it from there the same way we do for egress_ifinde=
x :)
>
> Very reasonable, but do you really mean struct xdp_frame or xdp_buff?
> Only the latter has the xdp_txq_info?

Well, we should have the field in neither, but xdp_frame is the one that
is size constrained. Whenever a cpumap/devmap program is run (in
xdp_bq_bpf_prog_run() and dev_map_bpf_prog_run_skb()), a struct
xdp_txq_info is prepared on the stack, so you'll just need to add
setting of the new value to that...

-Toke


