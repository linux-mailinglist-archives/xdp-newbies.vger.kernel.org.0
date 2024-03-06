Return-Path: <xdp-newbies+bounces-55-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5E873237
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 Mar 2024 10:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6EF52891ED
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 Mar 2024 09:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493115DF02;
	Wed,  6 Mar 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=aibor.de header.i=@aibor.de header.b="m7u4xU2Q"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA329406
	for <xdp-newbies@vger.kernel.org>; Wed,  6 Mar 2024 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709716159; cv=none; b=fgJwiiy6auMrKEMdhrhDL3wWiu65zbqxSewild+Jj72/WTcT/JUPnyzH5aK93IH/24f3nICZqsuyjjYk6+0VqMkB5wrYV+Fea/5MJKOCkft5uSRy0EBsE9EfcvpRV9j5iuPWxUFRQVxBpX5c02885y5dgm3LCL2whgEpToJqIP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709716159; c=relaxed/simple;
	bh=JFpAl+qleB4lVVbLskkyTdsT5ZX7QmLzPyqn+PJtaao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDNh3MdDM5YWDZf0VO/wjFsbsnzjd4ACVYBFaIXH/muOvR/xjAg0h01u7s+5hyV7gbFh01+PB3zPZZBn579UreiUwZupSd569PRDl49UaJN6VdOWPFzTFsFSyuiSRzvjGZXZjQdwsdlkaYTjk0uPSQOSLGnigfdrtjntiK5rECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aibor.de; spf=pass smtp.mailfrom=aibor.de; dkim=fail (0-bit key) header.d=aibor.de header.i=@aibor.de header.b=m7u4xU2Q reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aibor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aibor.de
Received: (qmail 11701 invoked by uid 990); 6 Mar 2024 09:09:08 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by boethin.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 06 Mar 2024 10:09:07 +0100
Date: Wed, 6 Mar 2024 10:09:06 +0100
From: Tobias =?utf-8?B?QsO2aG0=?= <tobias@aibor.de>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: xdp-newbies@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: cpumap infinite loop
Message-ID: <72h5h7dwvgim5hephweenq63wsqbdaseeu2rimdog2yzlyouqx@e5z5di3v6k7l>
References: <xgct6vpbwh6c5zjljdc6ypa5hbmcw4bapebdh4eetxwjama3so@iq3xdtavnq4g>
 <871q8od2tl.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871q8od2tl.fsf@toke.dk>
X-Rspamd-Bar: +
X-Rspamd-Report: R_MIXED_CHARSET(0.714285) BAYES_HAM(-0.004748) MID_RHS_NOT_FQDN(0.5) MIME_GOOD(-0.1)
X-Rspamd-Score: 1.109537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=aibor.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=JFpAl+qleB4lVVbLskkyTdsT5ZX7QmLzPyqn+PJtaao=;
	b=m7u4xU2QgdaEcYPZk4iTQKQ+BQYjzwrDkYU2yqM5piVLsJoYkB0Ene1YtMsvz6jPQ92fCw5gG9
	zIAoRJB2YVAfvx/qz3fUZYAwiaYYgSdC5lBnW68+PKWp+8oa3TyZDsJyoDpRUmEC3ZN4NZZMySDs
	niRI/Zr/Rq53/NK6TPbzrM3FJYUXIS053p/PfA7RsuMN9SROkcKGnR2DKifxErtxjpIoFYhlhTLI
	srbP1BbdFWF9a6EgDVuagndvGNGUkMIuRV422f71cZ9ItjcpYTofmjUBoG1Zc4nW7TccybFytHoW
	T77gKl3dvsTurHy/uKRStRyw90DRG8Q4K3LNIt1Zm9zZIyk5+kIsivtRB6uCGxth9Ygn4YTF7nGY
	XL/euAZqz8NbP+ybPcb1lf/YRt+57xn0zIjKlgfipMXAmsZTVAabwwh3ZjtILRktQw0gQDbVZArj
	a5BA7+NH1ze7SySbM1b5vPdzUUC9D/H8b0VMUNLNSrcetmrNQWbe7O23nPo6iL6z6g3AO3gKRl/8
	AV37eIiSTRWRylBA6ZGWIhWePCgXLcgfk6C+GJSg/gkkJgdnpyCLCjwFRJoRqmTOPQJfEY7x7TVu
	fBxuo3qdEpaB/dBAAjziyhwHDbGhk41JSVeX+mNI2LnweiomjMPuE/4d9ORLYJQ0a92f4pbv/E1Q
	o=

On Tue, 05 Mar 2024 at 06:08 PM, Toke Høiland-Jørgensen wrote:
> Tobias Böhm <tobias@aibor.de> writes:
> 
> > Hello,
> >
> > I was playing around a bit with cpumaps and wondered what happens when
> > the attached program just does another CPU redirect to itself.
> >
> > I ended up having an infinite loop. The working example can be found
> > here: https://github.com/aibor/cpumap-loop
> >
> > Now, I wonder if there is a way to detect and break this loop. I took a
> > look at the xdp_md->rx_queue_index values. When executed by a NIC event,
> > the value is the NIC ID, so a fairly low number. After CPU redirection
> > the values I saw were far above the range of NIC queue IDs. I couldn't
> > figure out if it is just a random memory value or if this value still 
> > has a (maybe different) meaning after CPU redirection. Maybe somehow
> > related to the CPU queue?
> 
> It's random. The rxq data structure is not initialised on the stack, so
> it's basically whatever was in that memory. Interestingly, there's a
> TODO comment in there to fix this:
> 
> https://elixir.bootlin.com/linux/latest/source/kernel/bpf/cpumap.c#L195
> 
> Not sure what the intention was here. +Lorenzo, who wrote that code.
> Returning the contents of a random uninitialised stack variable is
> probably not a good idea, though, we should zero out the data structure.
> I'll send a patch for that.

Thank you for the explanation and the patch. :)

> > If the field is set to a meaningful value I can make assumptions about
> > it and would be able to detect previous CPU redirection, I guess.
> >
> > I'd appreciate any pointers and tips how I could detect such a loop. Or
> > maybe there is a way to prevent it in the first place other than "just
> > being careful"?
> 
> Well, you kinda have to go out of your way to construct a loop like
> this. How are you envisioning this would happen accidentally? :)

I totally agree that it is pretty unlikely to create such a loop by accident.
Especially since the map programs usually are rather simple.
My example was driven by pure curiosity, exploring the possibilities of
redirect map programs. And since I saw infinite recursion is possible I
was looking for options for reliable termination conditions. This made me
wonder if I can detect if the program was invoked by the device or by map
redirection.

