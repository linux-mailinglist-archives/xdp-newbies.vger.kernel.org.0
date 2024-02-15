Return-Path: <xdp-newbies+bounces-49-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B11856D62
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Feb 2024 20:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7D628550D
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Feb 2024 19:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF390133993;
	Thu, 15 Feb 2024 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWTjb7aX"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916B3D6D
	for <xdp-newbies@vger.kernel.org>; Thu, 15 Feb 2024 19:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708024231; cv=none; b=a6w6iSSOpkk1D9QJsv7YV8ZSuh/V/6gEzcXBYH61o700NRNEjJoHRQ9tnSR+ZB3wTBM9U0sd7fhZdvg0lkScxUr2SJ2ph0lHrDoIYFNfZYwsp73HukQksU+R0IySOmtz9FvYIgyYZJe/MdExRlA8unl8h+ouNFiqfuE3sjGhnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708024231; c=relaxed/simple;
	bh=tik5z+LHzv6mdJXCDLK12N5SZrNdACUz6Dp/KZO2H2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBX/k86TD/FoU0ZZDxBtpzrG4eLjD9RS8VMeqNXDwMZED6aSkRXooXHtvZLl+gWLa/KE+w5Wu7z6zo5M0/LxCF3HS29yz5D9pn4972zsBkmVTEFLlxUw8Y6kkhmng+n62MppUFYAkT5WebVqbAGlamYk7wtsSBA8OWKN0GwDHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWTjb7aX; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d0f1ec376bso14767351fa.1
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Feb 2024 11:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708024228; x=1708629028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tik5z+LHzv6mdJXCDLK12N5SZrNdACUz6Dp/KZO2H2Y=;
        b=kWTjb7aXML1+Vrb3q4dMN6mLo4yrucIPFteZdHOsH6jBW54gZQgNZvlikKW7uIN+v5
         MJ05tK4fDtLzLJK2GNrOUuvV+AmUKChJ/JVK4BH1HlwPiFDImHnxw3KJ3LazqzgOHOid
         Glw2JWhe5iUVnKraQHraCfAwnfF4GD6t9jb3goxnxR0aEul5ZE0n5S2vq5zof87k2Z7a
         sjQ2QUMjPbt7TwAGTxOXSRl6KiZk5Y0s2XzjJbJhQuW0+IjAiQSC7OJZsltsXPySPpG2
         L80U3FMpR4i7sW3uxKv01N3rilCghglKeqHTQHrlVKQ7yvOMuckhso1fB61Si5KO7WDU
         /TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708024228; x=1708629028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tik5z+LHzv6mdJXCDLK12N5SZrNdACUz6Dp/KZO2H2Y=;
        b=H7Z59M44UVbDW/Z+RrmeJNMneNJtmbbuKhbGyD3xi9LkPftOG5FD/2WQlmSFzm2hwC
         Uj3V97AOk7ou3RVhXOB9rjmLTeqZKUfq2MTVV8Dmww2+B8VFDNYy3FcpQoUfgzIdlUIb
         qpnDbPFn6S5s6pcw7phPbfBn9pyNJb1DFanQ6wjklTLfsO9Udb4JL8cF4DDBXVfLISx2
         KlSqmVpbQ2NuJQq75I5rIdjRbPogazvRBxbNCnphml9aIJnwYV32VeofJWcQy1B49HQq
         qm4og3oCH81UY2PUXLVzpXde4FT2hUdGQT5juzCGLdWEpxIGvUYGyqMe8+buSPE3sUKz
         y51w==
X-Gm-Message-State: AOJu0Yy/rTnmjzy4yXPbOphLgr2jdBiOtR1C0WbelRq7ziHDWW7hUqzI
	2s4YjSiXopo0Mo2GrVgj4QYHsRvV3uYC8zuIuwzA1n56fAhmI1g8CTrbafVCBZPuuDcbsqbjTo+
	SlnOaTf+q5nTIhvPCKSPYpvafcad1wlQdCRs=
X-Google-Smtp-Source: AGHT+IEGf0opHU6umgH/7/E0zlzk/JJw263yVwhg4oXEKkIij3oW/bJwOh5fy0bz/6h9Ilt2xX8IZRf0cqHK5xOrKmE=
X-Received: by 2002:a2e:a415:0:b0:2d2:9da:71cc with SMTP id
 p21-20020a2ea415000000b002d209da71ccmr1981826ljn.37.1708024227650; Thu, 15
 Feb 2024 11:10:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk>
In-Reply-To: <87le7ofre3.fsf@toke.dk>
From: team lnx <teamlnxi8@gmail.com>
Date: Thu, 15 Feb 2024 11:10:16 -0800
Message-ID: <CAOLRUnB-5TGbL7z0m52hSFDCWnULs7CxbExu5p6pLHWbrb0TFQ@mail.gmail.com>
Subject: Re: XDP packet queueing and scheduling capabilities
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see a lot of discussion happening already, one use case I am looking
at is shaping of traffic which is discussed already also to control
traffic
flow (to avoid packet drops) if an Rx interface slows down on Tx path.


On Tue, Feb 13, 2024 at 5:03=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> team lnx <teamlnxi8@gmail.com> writes:
>
> > Hello everyone,
> >
> > https://lwn.net/Articles/901046/
> > would this be resumed any time soon this year ?
>
> The latest version of those patches are here:
> https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/log/?h=3Dx=
dp-queueing-08
>
> They are a bit rough around the edges, and there are some missing pieces
> still; I'm working on getting a userspace/BPF implementation to the
> point where those can be filled in. After that, and some thorough
> testing, it should be possible to post another revision.
>
> What's your interest in this? I.e., what do you want to use them for?
> Would be useful to know so I can make sure this is covered :)
>
> -Toke
>

