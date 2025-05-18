Return-Path: <xdp-newbies+bounces-179-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CFABB108
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 19:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C50818969D1
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 17:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425D821CC45;
	Sun, 18 May 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtAcubaw"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4555C2AE7C
	for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747588288; cv=none; b=Cs4YTkkt9XPk5LEVHbX0taa/+T4dlQy8ZYOUFWKg2dDUmkP96Ti63ZsaeUokSsExCBGsXZzimtI3KEess02BTCxgnRFKnzX61x/r3Yl3t1sEVGzmdctGgixUMuxEBHHdwRCEKeXnnLpIXnLDAgGQOgYyiGtlrVKsRY/fKnKr3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747588288; c=relaxed/simple;
	bh=v9K85fwAPkqBliiMjbY40dvKNN5//h2MyHInOlXRGGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFtXNiYMVonSWYRE2zWO8a/uk+L8JFVtblwcfPFajK52ZzPBcss8XViCIemZESUzd7dToe8KBWqXy8jKngLd25PBc9Ia0sEYT/AgoO3b4+xSNRaVuaOqTzY1gJERDlBzW2gXH6YsoLpg4Ai+Pt0OmfNB3ybtLEy0OlpruSNGvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtAcubaw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441ab63a415so40534345e9.3
        for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 10:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747588284; x=1748193084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wYtTdhBNIWrUSgQ0GpVRGne3oAEW7rZVzk6n6AnoEE=;
        b=QtAcubawIiskYJRo0dvZvJTn6O68UILoKzXRdnK4rPnIkM+vkTL7RMgvy07XgzB/kE
         lSxrIaktzpKNNvlYrpW3tGujBy8N23suKAzO7aDVCeWYEmak/i69dJo/RsSJZjp35yqK
         UOcoYK9bWjUDvE8XaF3geiDStg0ULvOnaMpHyyddSWj36dB2f00VziC5ylwTlbvHlBpL
         h5lxgfiWvSw8/O0OhXjXaatZVLf7ykGJk//WPvOtWxg+P+tSHD4UgrwZ0FBZKqp0O0vv
         sKZy6AgjEtV7F5TVicKL5c5GhLfcDPUJKAKkRm0h4o22MbifOjqqZyhSMVvJXxjR0skB
         L5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747588284; x=1748193084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wYtTdhBNIWrUSgQ0GpVRGne3oAEW7rZVzk6n6AnoEE=;
        b=rsNaSvj0OF3bs8+gMdqTl+SroFi61zwUASIrVGRVhBTzoDsqwySp/yMwNsh+i6s8FH
         iTqSuV7NqgL3NnXl+lNLee8NoO8qdARkUl12/AOg/lGl6g7xAnfBA+Qvn0TRljdP3HBB
         5v6Y9lewAumTeUmYA66wQ+qbT12eSqUNVrB10nB1VTDuhKKqCTvtfSDej3SjAYefiNqV
         vA6g6rcF8Ep6Wp9N26Lykk8P4hrowFWUsaJdI3h6whgimmE8gjn1kpAn49BBhsGKosMq
         QIjRP49QdRMQhkA87UxnjmCy6XwOGom/8IDtcLWJKgoTFHmbYa9homNQ6lCLfExQdeJX
         vC1w==
X-Gm-Message-State: AOJu0YwPx10fF+Llssb53sYMzYrojrteJfqukgUxsvkps4C4cwNA3mkN
	hxRGdLcF9uBuUoeQ1ZGKECSjw2R6SrKzY4USsL8bDHszE/otvkPPYErKesSSeDWu12yNJwW4WPD
	S+iwGAOo/hPqziN9AKdsr9ZTKGPMAdQ8=
X-Gm-Gg: ASbGncv49Ehdxv5AMr6pjMZ8xKiQFW65wjbU/aDejP0svkNRsaEBv+SC6tIS86O3/9s
	mXtoxr2Z3Rwon0/8l73Au/rCSWI56foBzAGzR2PAwRfxS2btfwLbRRRCTlqeGfNe4a8HSDg3yPD
	pANWu13SLkbU3tebjpuL0xghGI0XfUZgvBUg==
X-Google-Smtp-Source: AGHT+IGUR2MKYtA9krxSnW2ZlgvJOYmvkLIhQKMHVts3eYVW3l7OxNimr9jqt9lGOq88qZWfGr6WiFnd+h1DL+EUhkA=
X-Received: by 2002:a05:600c:83c3:b0:441:a715:664a with SMTP id
 5b1f17b1804b1-442fd6607c9mr72988995e9.20.1747588284195; Sun, 18 May 2025
 10:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
 <87ecwlki1z.fsf@toke.dk>
In-Reply-To: <87ecwlki1z.fsf@toke.dk>
From: Edvard Fagerholm <edvard.fagerholm@gmail.com>
Date: Sun, 18 May 2025 20:11:13 +0300
X-Gm-Features: AX0GCFsXuxRu65KUZsV-5a8RRmbCO_j742QbOcZpwbuR1d3i7sQ6StRTzPcT7sA
Message-ID: <CAMF0iZ5uBPTJDzYp=ErtFrGgZY13kUAFibaaNYkgJssD=RFPcQ@mail.gmail.com>
Subject: Re: Expiring flows in an XDP based router
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 7:19=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Edvard Fagerholm <edvard.fagerholm@gmail.com> writes:
>
> > Hi,
> >
> > I'm working on an in-house router and I'm looking for some advice on
> > whether to try to implement some functionality directly in an XDP
> > program or instead use AF_XDP sockets with the additional flexibility
> > provided by userspace.
> >
> > We basically have a flow table, which contains entries of the form:
> >
> >   (source ip, source port) -> (action, timestamp)
> >
> > Every time we see a packet belonging to a flow, the timestamp is
> > updated and if the flow has been inactive for e.g. 10 seconds, the
> > flow is considered inactive and should be deleted. Actions are of the
> > form:
> >
> >   "forward packet to a.b.c.d port X using source port Y"
> >
> > The challenge that I have is how to clean up expired flows. Built-in
> > options would be BPF_MAP_TYPE_LRU_PERCPU_HASH. However, dropping an
> > active flow would be unacceptable.
> >
> > I'm looking at at most 10k new flow entries being added per second per
> > router with a maximum number of concurrent flows at around 256k. Each
> > flow sends a packet at least every 5 seconds, but most every 50ms.
> > Does this allow me to tune the table size in such a way that no active
> > flows can be evicted? If not, are there any other reasonable
> > approaches for cleaning up the flows?
>
> Well, hard to tell with only the number of additions. I mean, 256.000 +
> 10.000 * 10 seconds means you'd need on the order of 356k entries in the
> map, assuming flows expire at the same rate as they are added. Do you
> assume any such guarantee?

We have average session lengths over 30 seconds and a maximum of 256k
concurrents the way the servers are set up. The first number is a
conservative lower
bound and the latter a conservative upper bound, so from there you get 10k =
per
second as a conservative upper bound too. We see spikes sometimes during
updates with polling clients, but they stay below this too.

I read the description of the LRU implementation in the Cilium docs. For an
element to be expired, it would need to be put at the head of the active li=
st
and propagate all the way down towards the tail until being moved over to
the head of the inactive list. Then propagate down the inactive list
and be cleaned
up.

If one could prove that being propagated in the lists to being cleaned
up takes longer
than the maximum interval every flow sees packets, then that's good enough.
Alternatively, if the table is always larger than the maximum number of flo=
ws by
some constant factor and one can prove some invariant that the kernel alway=
s
recycles enough "real" inactive flows before accidentally recycling an
active flow,
then that would also be enough.

However, I don't think I'm quite comfortable with such an approach,
since it relies
on implementation details of the data structure that are not part of
the promised API.

On the other hand, given the number of routers and load balancers using XDP=
,
I was kinda hoping there was some well-known robust solution that is also
performant.

The box in question is basically doing DDoS protection, so it needs to
be able to
handle traffic at line rate. I'm also trying to avoid doing any
expensive processing
that takes a long time, which could cause NIC buffers to fill up and
cause packet
loss. Our current header based solution spends a constant amount of time pe=
r
packet and is stateless.

> Alternatively, you could have your XDP program start a BPF timer and
> perform the periodic cleanup from that. There will be some overhead from
> walking the map, and a potential for racy behaviour if the same flow is
> expired and re-added frequently, but otherwise this should be quite
> doable.

I would need to look into timers. Never had to deal with these before in XD=
P.

> In any case, you'd need to size your map so that it doesn't fill up
> before flows expire. So whether to use an LRU map is a case of whether
> overflowing the map will result in overwriting existing entries, or
> blocking the addition of new ones.

We basically need both:

1. Table should be large enough to never block connections.
2. The error of the approximate LRU algorithm needs to be precise
enough to never recycle active flows.

Best,
Edvard

