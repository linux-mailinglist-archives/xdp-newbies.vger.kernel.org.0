Return-Path: <xdp-newbies+bounces-44-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7028535A9
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 17:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC3BD289241
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 16:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AC35F57E;
	Tue, 13 Feb 2024 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfBODyLt"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF95EE87
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707840467; cv=none; b=Sk7GEaRi26+bpbhuKCQZVpUM38hHhj3JeCOwECldp8xxlB25HXnOsn/d3RDURKIH62zUaVUOnZHp63Eun9n54ISS2hokq0RC0uJ0NDBIQrnh7/4OYTfW0P+pv9BkNF8IavjJ+YD65R3OzBvm97dE3nD0uOPfPgpuxvwl3e1LPMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707840467; c=relaxed/simple;
	bh=9nBSGfGb9GxtbQnyyNio8EYFS1MZ2cUBwQmqutMq4SI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tGFAD/qJLFtn11Z48Cf43DRMlReySt4CKGUMyJeQ8CYZDrsrNIekr256C1XKmlm/WtR97la90841pIJjLaFQKIqAs09bR5sFXZPO8VkdGgWAK8XUlpj3Je05VkFM/xaUop8vkjcEaET5KZ2zAUpe/Vu9IJ1nMfO0LvPS2mmFuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfBODyLt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707840461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nBSGfGb9GxtbQnyyNio8EYFS1MZ2cUBwQmqutMq4SI=;
	b=BfBODyLtwJcw/0TtVJXnGAbr7MHUdH1gKqEJTcKMSN6Bxo9QiZssfyg4c5mlqQJtX4b/cg
	+BG+Y5mUpU8M9dMgcIb10Kl1rDZ+77RS+ZrlQDX6Bkh6TBz4Ra3yNlGi2ltZp2E2ACGWWe
	wrqxc7HgUX7ky/2+XpLWO6vrtolx6zk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-FUKEjrlkPuCv1M67xOTvBg-1; Tue, 13 Feb 2024 11:07:39 -0500
X-MC-Unique: FUKEjrlkPuCv1M67xOTvBg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2b6c2a5fddso301506666b.1
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 08:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707840458; x=1708445258;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nBSGfGb9GxtbQnyyNio8EYFS1MZ2cUBwQmqutMq4SI=;
        b=WrsYpBkUCMCTvrUQWj5qh4DgTjDd4+HqOllet4hmlNdbc2X9m6Zf5tKqfeCH9Pk0Ej
         /RY3lsRMOrTuuq7SVpvk8pnuZenULd8Xebv9y0pNx9iX/vXMG4aU1TplgMz9SFm7uBiy
         ebPrAaxidsht/E42/YQJi3R9hMIIb0flkqBWRsjFALvtxLEVYLloy9efX3nlBZT757GA
         gJ0qZi0OGRIS4qCu53xJoFJ7DUFg1Zso5SDR+ppEXZ/grO+kP5vpFbw4jaNZbORVkmVT
         47eroBUbi9W6WB9j+WlMXdXQgaAfR9I6DmNTXvIO3k19CrqHZsisKVv3h3vOSUg489hs
         fpUg==
X-Gm-Message-State: AOJu0YxPLn8SN8TDhuTKG1c9xwx0bdml2dpPNyAutABXIIvi7BYdd1oB
	tMzB+ZYADn6YTTU+K51xZQ0PPAFtiN/JuySbvyYgxxOu/ExLZuI/q1/Ff7VpQ9duyXyQNH+xr3f
	OJY90o5wi7lhVpvzbxb9jCxWH+e7H8Pz9ZhRfoU2XfWJVEITeEl95WWBladm28Pm208wr
X-Received: by 2002:a17:906:8c1:b0:a3c:b430:7f54 with SMTP id o1-20020a17090608c100b00a3cb4307f54mr4012413eje.3.1707840458139;
        Tue, 13 Feb 2024 08:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi9I6Q1de/Ya20C/fc/4e+564TLSfP0MSSuLIneHvpx9d5wLmEmGVS9rOzL2vc22KbJXq3Rw==
X-Received: by 2002:a17:906:8c1:b0:a3c:b430:7f54 with SMTP id o1-20020a17090608c100b00a3cb4307f54mr4011823eje.3.1707840441327;
        Tue, 13 Feb 2024 08:07:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXy32eDB8CKafZX60bQLXFXfL1kZXRx+TAJyDWo7YkwLmLnaxJPiCkSpCaARX0b86KhgOleR6MAYtJg7F6aA07tACaPNmwNFYGHAsLf8+q8A65owbfo0Z3QzQGwtYxwp4w=
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3d28aa375bsm104095ejc.151.2024.02.13.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 08:07:21 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 45B1D10F569F; Tue, 13 Feb 2024 17:07:20 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Alexandre Cassen <acassen@gmail.com>, team lnx <teamlnxi8@gmail.com>,
 xdp-newbies@vger.kernel.org
Subject: Re: XDP packet queueing and scheduling capabilities
In-Reply-To: <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk> <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 13 Feb 2024 17:07:20 +0100
Message-ID: <87il2sfivb.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexandre Cassen <acassen@gmail.com> writes:

> Hi Toke,
>
> here is a target with lot of interest for it : www.gtp-guard.org

Ah, seems like a cool project; thanks for the pointer!

> When dealing with mobile network data-plane, at some point you have
> ordering issues and shaping needs, so queuing is truly needed.
> Alternatively ones can implement PIFO or others built on AF_XDP but if
> dedicated bpf map covers the use-case, would be nice.

Right, I'm kinda thinking about the map type that is part of the XDP
queueing series as a general-purpose packet buffer that will enable all
kinds of features, not just queueing for forwarding. Whether it'll end
up being the PIFO map type, or a simpler one, I'm less certain about.
The PIFO abstraction may end up being too special-purpose. Opinions
welcome!

> Watching at your LPC 2022 presentation, at the end, discussions where
> made around using existing Qdisc kernel framework and find a way to
> share the path between XDP and netstack. Is it a target for adding
> PIFO, or more generally getting queuing support for XDP ?

I don't personally consider it feasible to have forwarded XDP frames
share the qdisc path. The presence of an sk_buff is too simply too
fundamentally baked into the qdisc layer. I'm hoping that the addition
of an eBPF-based qdisc will instead make it feasible to share queueing
algorithm code between the two layers (and even build forwarding paths
that can handle both by having the different BPF implementations
cooperate). And of course co-existence between XDP and stack forwarding
is important to avoid starvation, but that is already an issue for XDP
forwarding today.

-Toke


