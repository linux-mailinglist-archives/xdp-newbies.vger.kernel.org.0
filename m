Return-Path: <xdp-newbies+bounces-46-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C859A854A5D
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 14:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BEC21C20E00
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981AF54672;
	Wed, 14 Feb 2024 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFrhmnQY"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408D53389
	for <xdp-newbies@vger.kernel.org>; Wed, 14 Feb 2024 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916925; cv=none; b=Qhvp81Ba0PCLf4Mr1Oe45kZS+GjwZWfmKXpCERqxHS3j62EF9pPkaqhcIPXsRe0FwLu6Ka9keXgkGBXGodWcKl3j7EDfXZlgkCXMI7vNQkU0znfDA2ByX9Zs2NMCjpfBZP6WxWZDdKgQBXW/k3cO/09+bQAn8GpCLcJsXtAvMp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916925; c=relaxed/simple;
	bh=XOUJC/BXIVu4D5FS5QDOAzI4bxYUSaY2JfDGHeKk8ZM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F97cSoH6HYjC9PVP2sg7/NCRO6MPWq5EnFjqWgc9hkds+2ZSadEY6/v0kbBydTposkVHybRJNE3D/Ldq+SlZ0GG6G5s+LphtO59Low4ANK4MoP1C0C5t6H3PwNGJs7pJ+zZ8IWEGQrSCL96MO0MOdRRicuY6hOjx5gpCVNttM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFrhmnQY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707916921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rReQrI5PmLBByAgC5r6Fn0ghiA0uwYK6bA2Ka5a7nvk=;
	b=eFrhmnQYaRXFtJuiC+ffEQKxcanULWcJDhwbFIQoEdz5xuWNuVnaV2FgLBNuZRR46qMpLu
	Dao2/8l0jmqKfOs2Y430heXFzw7H+nWhzVYz4AKDyx/VeeLCpD9pDqHevd1MzV/omF5W+9
	veQt9WSSeOzqe4+QRmVNGgeCeYQdiVc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-i0o_zOM0O6GZ-oLMNwWj7A-1; Wed, 14 Feb 2024 08:21:59 -0500
X-MC-Unique: i0o_zOM0O6GZ-oLMNwWj7A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a357c92f241so324906066b.0
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Feb 2024 05:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916919; x=1708521719;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rReQrI5PmLBByAgC5r6Fn0ghiA0uwYK6bA2Ka5a7nvk=;
        b=TgifJO7g2Cze9JwtIfSJoi84IjPvjNjKbe6TYoEknNEYULZRxdCqfBv8eDeWMsuijo
         hV0QniuwTY7oVnNmGhuhjLz8YyrlrxEcmlBDJ186rs8PsiTfGFkf7KOjDp8EixLsilcZ
         gl3yoDGtlGxYQjO7M/OgDMDdUZFt7IV5u2OWxDToth3YU/7eK+6oG4Putql+tXUq+n/r
         v2Ohtovd0+m/nUdKJoIFM28Nyycmb0zFIRaqLZh84yOwkIqZSfe84lrR+X58W+zfcLIV
         7SrnKSPFRPlsfhfIRekBQCj81GQbFY6uHtA7U6UcmSTghwovcZvD2GPJODvOuvCwXYF3
         gRdw==
X-Forwarded-Encrypted: i=1; AJvYcCVQm7mglHSQZ1U5689uuzy/73KUGjSpwuKrz3XlL7E0Vxw9Gvr3gc3k6q/wE2a8/FPI7y1fJN7zPS/8/h5m1dx5LafFfvSgNYYyFqw=
X-Gm-Message-State: AOJu0YyLB2N7zcNQnM1u89mDxssmDifKcd3hFIkq6LU5F8I2KHSmG1A1
	zZetFYZv+30lZ8/9acoedvBNje3q3RyfM4jMj4f8R8qPQrL7IGMUueG48MXV+Ti9HPus0G/3xdB
	Rau0kgzrI8TWj5ZYUza4Dw5NX2aXs0LNXiRb07W04UuYvnvXb9eBeoqcJdZsS
X-Received: by 2002:a17:906:6812:b0:a3d:967:eab6 with SMTP id k18-20020a170906681200b00a3d0967eab6mr1829425ejr.41.1707916918902;
        Wed, 14 Feb 2024 05:21:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF9MJF7638WB7XQeW92lf2FTuGuPhqBveiGWqBI6O4J1qV+Q4Otgr6CaiaWRrF1NaZ80/B7A==
X-Received: by 2002:a17:906:6812:b0:a3d:967:eab6 with SMTP id k18-20020a170906681200b00a3d0967eab6mr1829407ejr.41.1707916918490;
        Wed, 14 Feb 2024 05:21:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtxX2phpXb8uD0qvSsOXndbDNOYhLFrmzaOUVaOskjTOSxpEm7m/nlGcdHsUE5KwLquAWFrQExRQJPsW9h22TUyEscuc6wCRfB+2AkeVaJsWjokpMd9bWYEJ5AWMmrYD0=
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id cd6-20020a170906b34600b00a34c07816e3sm2314205ejb.73.2024.02.14.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:21:58 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id BE17910F57A2; Wed, 14 Feb 2024 14:21:57 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Alexandre Cassen <acassen@gmail.com>, team lnx <teamlnxi8@gmail.com>,
 xdp-newbies@vger.kernel.org
Subject: Re: XDP packet queueing and scheduling capabilities
In-Reply-To: <e4086e04-ca73-439c-8a77-529c2f3562af@gmail.com>
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk> <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
 <87il2sfivb.fsf@toke.dk> <e4086e04-ca73-439c-8a77-529c2f3562af@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 14 Feb 2024 14:21:57 +0100
Message-ID: <871q9ffafe.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexandre Cassen <acassen@gmail.com> writes:

>>> Watching at your LPC 2022 presentation, at the end, discussions where
>>> made around using existing Qdisc kernel framework and find a way to
>>> share the path between XDP and netstack. Is it a target for adding
>>> PIFO, or more generally getting queuing support for XDP ?
>> 
>> I don't personally consider it feasible to have forwarded XDP frames
>> share the qdisc path. The presence of an sk_buff is too simply too
>> fundamentally baked into the qdisc layer. I'm hoping that the addition
>> of an eBPF-based qdisc will instead make it feasible to share queueing
>> algorithm code between the two layers (and even build forwarding paths
>> that can handle both by having the different BPF implementations
>> cooperate). And of course co-existence between XDP and stack forwarding
>> is important to avoid starvation, but that is already an issue for XDP
>> forwarding today.
>
> Agreed too, eBPF backed Qdisc 'proxy' sounds great idea. latency 
> forecast impact ?

Of writing the qdisc in eBPF instead of as a regular kernel module?
Negligible; the overhead shown in the last posting of those patches[0]
is not nil, but it seems there's a path to getting rid of it (teaching
BPF how to put skbs directly into list/rbtree data structures instead of
having to allocate a container for it).

The latency impact of mixing XDP and qdisc traffic? Dunno, depends on
the traffic and the algorithms managing it. I don't think there's
anything inherent in the BPF side of things that would impact latency
(it's all just code in the end), as long as we make sure that the APIs
and primitives can express all the things we need to effectively
implement good algorithms. Which is why I'm asking for examples of use
cases :)

-Toke

[0] https://lore.kernel.org/r/cover.1705432850.git.amery.hung@bytedance.com


