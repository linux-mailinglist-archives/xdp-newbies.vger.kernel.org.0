Return-Path: <xdp-newbies+bounces-180-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D5ABBAAF
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 May 2025 12:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C417E3B8C82
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 May 2025 10:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC52459D9;
	Mon, 19 May 2025 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhZi5eDA"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E2D515
	for <xdp-newbies@vger.kernel.org>; Mon, 19 May 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649411; cv=none; b=O5bjd3xIlDYBMSj3f6DMtLP47eGLAnFscaANwqVNCbfs240W914mqJt1dONbuRwyH9j9pPfjftf1K5vtX+EZ5PGFwytUpQzb1/JkIUs0ywL32TWY8HcQaXHwztycSk6Qbs8n+yMARO19FsK2QIrx7RlDIt12n96CyKh8utW6gSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649411; c=relaxed/simple;
	bh=H4Ihv8ClmZpbzLMo7y2lVYrXCXP2XJlFeZwi/0xHnjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eiPwHtQpmWsCQ3adn/RikSNyquVJ5fl5P3tCw7UuOTGnOPVD/cLYcUkfFtcakyN7og7JSxO97C3ij+D6/FsaHgeRglPRdm3rmltcK1QbsfxuxI1LNI98uGWk+U8CWLQ/8NQXF1GzFhLWYvpSRf+81dUmiCXdrg80GhlpVR30Y68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhZi5eDA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747649408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t79ecQDyASbW1WhYSh6GzBuMk4JtRT8NzlQ/eEfNZLw=;
	b=BhZi5eDA8lBUJyaB5SomL2ORb7ndD3J2MgEqyrW8dfQrGT/cziVnpJ4nhTgl7IYO94ga+d
	HQDFmxoxk5k5SsVGtBTmLvWNu9OdZPIS2I3Q8FUFPuTL/f5eZfX3IVg4OVUnnrTF7aK2wH
	FaT4NIvagb495XsK2pPf/JNiG0qN96w=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-FcKQOiFyMpyrMjXkeHiJ5Q-1; Mon, 19 May 2025 06:10:07 -0400
X-MC-Unique: FcKQOiFyMpyrMjXkeHiJ5Q-1
X-Mimecast-MFC-AGG-ID: FcKQOiFyMpyrMjXkeHiJ5Q_1747649406
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-54e8141b4adso3042829e87.1
        for <xdp-newbies@vger.kernel.org>; Mon, 19 May 2025 03:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649406; x=1748254206;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t79ecQDyASbW1WhYSh6GzBuMk4JtRT8NzlQ/eEfNZLw=;
        b=T1pkEpREumYWJUnC5J46q6ypwIp8juyjNNAMfx/az1BRf1+TRfyCapZIsM/9PEDq2V
         Su/65V1E+F59qkv5dK/orCtRMMT8WC3WAzxwjUaCwQiu8C50I6W+5ZlCyKeddvXOz/XX
         e+fgJELwi0Md5V77bh1xJre6iBXka22X5U4vhD+a6Q1hoFzatAGpLVTnyg/FmrTTXt3M
         X7Qb0/82DMiLgvWOHBO9Xor3Fay3mn1FJk7t/Iu1812FLkFhfBC2y2VlEHgIQawYkOcI
         2V0HMhgYZ/2ZIxTIl3g5xO+ye2kTgYC6Ab9RbJBciBMaTCHSiu7jxANHMLUfRCgCNWQO
         GODA==
X-Gm-Message-State: AOJu0YwxcpAU/qVk7QbR+257z6hyo62M4AVTMxaQcPAIm/7AZaNk/Cpu
	94d99j049Px+utf7aTiyhExbkrhp732oO7Zufva/ZjfG5HTKpgw1CRpsN0FYf5rB+pBKNfscXRy
	59+ISpdsDMyOuBKg0uqkb2RiIFMjU8Tb6UqXHeoThpHoomt/7oTzv8cRDNErZMjsH
X-Gm-Gg: ASbGncsCIpI+yFZdmwgpQLTvNV543kiOCSyDd9mQj6UzkU+Fturc8RfykuFbf42r6Du
	7xDOCHIXF1CNrtAOoiJM8o3NIz1MRicqUbWj6M7IQ9J7ujLu9koTAVtF+OWmzwmd+uCuk/1Khbw
	RerI+hQeLyLIFYtHKmN6Bnk3YBldgMaSTqNLeDCVGqgDDx9fojPXOpgh3+WRHXWwQ5rWvcK/rVN
	nTRu7rbHYT8kS55WLoxrQz9x2RlIcbliWRURr+YPztPOcR3bjiCJXnEdNbLILc6gxVH//zwrKZQ
	am4JdOg1QQW6ct7nm8kkrf6Rz5H7feEMUeGE
X-Received: by 2002:a05:6512:39c9:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-550e71950d6mr3658231e87.2.1747649405896;
        Mon, 19 May 2025 03:10:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+8IPtF16vR9Rfr0jueITEmJFHAV7pH9aNlXciGBTuNCR21ijgddd6FZDBkkahzmclghTJ2w==
X-Received: by 2002:a05:6512:39c9:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-550e71950d6mr3658220e87.2.1747649405416;
        Mon, 19 May 2025 03:10:05 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1624esm1787050e87.17.2025.05.19.03.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:10:04 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 08F041A73D62; Mon, 19 May 2025 12:10:04 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Edvard Fagerholm <edvard.fagerholm@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Subject: Re: Expiring flows in an XDP based router
In-Reply-To: <CAMF0iZ5uBPTJDzYp=ErtFrGgZY13kUAFibaaNYkgJssD=RFPcQ@mail.gmail.com>
References: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
 <87ecwlki1z.fsf@toke.dk>
 <CAMF0iZ5uBPTJDzYp=ErtFrGgZY13kUAFibaaNYkgJssD=RFPcQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 19 May 2025 12:10:04 +0200
Message-ID: <875xhwewsj.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Edvard Fagerholm <edvard.fagerholm@gmail.com> writes:

> On Sun, May 18, 2025 at 7:19=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com> wrote:
>>
>> Edvard Fagerholm <edvard.fagerholm@gmail.com> writes:
>>
>> > Hi,
>> >
>> > I'm working on an in-house router and I'm looking for some advice on
>> > whether to try to implement some functionality directly in an XDP
>> > program or instead use AF_XDP sockets with the additional flexibility
>> > provided by userspace.
>> >
>> > We basically have a flow table, which contains entries of the form:
>> >
>> >   (source ip, source port) -> (action, timestamp)
>> >
>> > Every time we see a packet belonging to a flow, the timestamp is
>> > updated and if the flow has been inactive for e.g. 10 seconds, the
>> > flow is considered inactive and should be deleted. Actions are of the
>> > form:
>> >
>> >   "forward packet to a.b.c.d port X using source port Y"
>> >
>> > The challenge that I have is how to clean up expired flows. Built-in
>> > options would be BPF_MAP_TYPE_LRU_PERCPU_HASH. However, dropping an
>> > active flow would be unacceptable.
>> >
>> > I'm looking at at most 10k new flow entries being added per second per
>> > router with a maximum number of concurrent flows at around 256k. Each
>> > flow sends a packet at least every 5 seconds, but most every 50ms.
>> > Does this allow me to tune the table size in such a way that no active
>> > flows can be evicted? If not, are there any other reasonable
>> > approaches for cleaning up the flows?
>>
>> Well, hard to tell with only the number of additions. I mean, 256.000 +
>> 10.000 * 10 seconds means you'd need on the order of 356k entries in the
>> map, assuming flows expire at the same rate as they are added. Do you
>> assume any such guarantee?
>
> We have average session lengths over 30 seconds and a maximum of 256k
> concurrents the way the servers are set up. The first number is a
> conservative lower
> bound and the latter a conservative upper bound, so from there you get 10=
k per
> second as a conservative upper bound too. We see spikes sometimes during
> updates with polling clients, but they stay below this too.
>
> I read the description of the LRU implementation in the Cilium docs. For =
an
> element to be expired, it would need to be put at the head of the active =
list
> and propagate all the way down towards the tail until being moved over to
> the head of the inactive list. Then propagate down the inactive list
> and be cleaned
> up.
>
> If one could prove that being propagated in the lists to being cleaned
> up takes longer
> than the maximum interval every flow sees packets, then that's good enoug=
h.
> Alternatively, if the table is always larger than the maximum number of f=
lows by
> some constant factor and one can prove some invariant that the kernel alw=
ays
> recycles enough "real" inactive flows before accidentally recycling an
> active flow,
> then that would also be enough.
>
> However, I don't think I'm quite comfortable with such an approach,
> since it relies
> on implementation details of the data structure that are not part of
> the promised API.
>
> On the other hand, given the number of routers and load balancers using X=
DP,
> I was kinda hoping there was some well-known robust solution that is also
> performant.
>
> The box in question is basically doing DDoS protection, so it needs to
> be able to
> handle traffic at line rate. I'm also trying to avoid doing any
> expensive processing
> that takes a long time, which could cause NIC buffers to fill up and
> cause packet
> loss. Our current header based solution spends a constant amount of time =
per
> packet and is stateless.
>
>> Alternatively, you could have your XDP program start a BPF timer and
>> perform the periodic cleanup from that. There will be some overhead from
>> walking the map, and a potential for racy behaviour if the same flow is
>> expired and re-added frequently, but otherwise this should be quite
>> doable.
>
> I would need to look into timers. Never had to deal with these before in =
XDP.
>
>> In any case, you'd need to size your map so that it doesn't fill up
>> before flows expire. So whether to use an LRU map is a case of whether
>> overflowing the map will result in overwriting existing entries, or
>> blocking the addition of new ones.
>
> We basically need both:
>
> 1. Table should be large enough to never block connections.
> 2. The error of the approximate LRU algorithm needs to be precise
> enough to never recycle active flows.

Right, I am not sure if such guarantees can be made given the current
implementation. Analysing the kernel source code would be the only way
to be sure of this (for the LRU side). If you do end up making such an
analysis, please share your results.

I also seem to recall that at some point there was some discussion about
making the LRU eviction policy configurable (by delegating it to a BPF
program, basically). Patches never materialised, but if this is a
compelling use case for you, actually implementing this could be a way
forward as well.

-Toke


