Return-Path: <xdp-newbies+bounces-120-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B4933ACC
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jul 2024 12:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44304281A57
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jul 2024 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865AA3D3BF;
	Wed, 17 Jul 2024 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faaMzYaA"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490345009
	for <xdp-newbies@vger.kernel.org>; Wed, 17 Jul 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210741; cv=none; b=PDYXKAYKepiQy3djc33xbu6V32eXma3b1RZt+38ueadbJZAG5FU2nHYI+rAC+1/XzUZhzO5M7h+9HjtRDpFo5Z5LDgoZFo/muSr/DBzSOMjQzNI/1uHApg556EEyllwSccdMRmVncjWFy54Dh0Y5aH7Ddq03h5Ynp2QD8sKHto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210741; c=relaxed/simple;
	bh=5GoIVP3K2mrNlFvEk3uMtC53dhgYNaXdaVDb2IHmJ78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgPgLg6R0CvZRMdmZIxots2xe/H/zMhx4yTCE3IXPWWtg/FyNMp6PerJqe0tDh7C0DVoj2tCbg1GqIDXNIQfGCchhQSi3cW1x4a1NMGuZm0KeqvS2Hn32LgXw3pxMoRTT7EcQFzZJLaXmjpMF0ANBAVGIKotjHTXmrquoz5HzOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faaMzYaA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6512866fa87so63392907b3.2
        for <xdp-newbies@vger.kernel.org>; Wed, 17 Jul 2024 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721210739; x=1721815539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GoIVP3K2mrNlFvEk3uMtC53dhgYNaXdaVDb2IHmJ78=;
        b=faaMzYaABHJXYpz93Not5177HsySLjs18zHXO3zIBu9U5TegO8XnDIYCZzMTOngevm
         d9taZZT9g9wrPOFl59pYPWpSZDgypuv9Vnvk7aQtx95tA+In4LUJTg9OLLuVJgXJnUje
         OV63CP9ZYq5E0hGJ3Bav0ULloOK0rieIYc/bnoKquL+BqEyQWRbvQUmpzzcMabcna4s7
         n2FjlPPTbDcTCdzBH3L+3xrl1OGrizZn6GfXMVuZgcDr4/678n2j39P6Rt9w6X1+lGio
         WCotBMGbIS3JRwkGwwwI43ICNlHsJRaRtMrh1sofmB00bHyBXCvsjSztPemV3SyQ4h6L
         VuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210739; x=1721815539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GoIVP3K2mrNlFvEk3uMtC53dhgYNaXdaVDb2IHmJ78=;
        b=LsQIhkO1icuXLt659aNxA2EZiUE8PUkDNS7mbs0qtwxLXRG0VltcwR4xtUwzgwRpJ6
         jSQBadgrxju11Tba6mBnAcX6R0GjLu7KzAfr01TVCSUDEq64KVA4Oaq8vynZaxDPh+8D
         8iEofAr1g/69yAxDnQoVg7JDqanpDtieQEnRaeJUDdvcfcJxN3Z2OaeuQzZEc+ZhQCBP
         tOsJoNqUdMR7MT++WLPe9QIBQjeZQBx6qaCvym7t+mWFuh5qNzOF+c86cqy/OxJEgAcA
         wcuU47NG2cX9uqb/BT3KgI+MIdVo507PBC8k7ohxYsXRePmoUknB9L4jmVwCpW45hlXa
         piJg==
X-Gm-Message-State: AOJu0YxMeNF2gOSzNfAydKlIdJREuPKqAWqAWHvTO9E1tbnZrSvsOXbp
	EbBnDKjpmmKqpXKKGtgg6zYuxlH5DnpBBlRjP8B8r0NRFCEZVym/HsrCkqOsKbiGBFLy35uhhX1
	j7tWldATIji5MzbakI9x5J9m/s6DT2nBo
X-Google-Smtp-Source: AGHT+IFwlkkLeRpj5OEvTBBlzjMkKIDpY3jGVLCRb6NbcFyAZ2TjiGvlXasJ6FDVcoVnu6cWjFEM/21M3Njf16NHYYk=
X-Received: by 2002:a05:6902:1146:b0:e05:e2d5:666c with SMTP id
 3f1490d57ef6-e05ed6fffdfmr1270792276.24.1721210738843; Wed, 17 Jul 2024
 03:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
 <20240713090438.37e19696@kernel.org> <CANzUK59Oobf5q3YE+Ym1LuQQGqF8BSfHoQ=RTKvvgSyJFha=Pg@mail.gmail.com>
In-Reply-To: <CANzUK59Oobf5q3YE+Ym1LuQQGqF8BSfHoQ=RTKvvgSyJFha=Pg@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Wed, 17 Jul 2024 15:35:02 +0530
Message-ID: <CANzUK5-JYO-fCv3zzzY0YUHN9EHuEgOTpYoYa_nDZ+2EaBaisg@mail.gmail.com>
Subject: Re: mlx5 AF_XDP zero-copy queues
To: Jakub Kicinski <kuba@kernel.org>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 4:24=E2=80=AFPM Srivats P <pstavirs@gmail.com> wrot=
e:
>
> On Sat, Jul 13, 2024 at 9:34=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Sat, 13 Jul 2024 12:23:31 +0530 Srivats P wrote:
> > > I'm seeing a behaviour difference between kernel 5.4 and 5.15 wrt the
> > > AF_XDP queues used for zero copy. This is specific to the mlx5.
> > >
> > > Assume you have 'n' queues configured on the interface.
> > >
> > > In 5.4, you had to use n to 2*n -1 queue numbers for AF_XDP zc. Using
> > > 0 to n-1 queues would use copy mode.
> > >
> > > In 5.15, you have to use 0 to n-1 for zero copy also. Socket creation
> > > fails if you use queue >=3Dn.
> > >
> > > Also, with 5.4 netdev stats would not be incremented for AF_XDP
> > > packets whereas with 5.15 they do get incremented?
> > >
> > > Can someone confirm this behaviour change or point me to relevant
> > > mailing list discussions or some other information on the same? My
> > > google-fu is failing me.
> > >
> > > When did this change go into the kernel? I can't find anything in the
> > > kernelnewbies.org changelog between 5.4 and 5.15.

Bump! Can anyone point to the commit or let me know the kernel version
where this behaviour change went in?

> >
> > Hm, can't find the relevant commit quickly either now. But it's
> > intentional. The new behavior is how all other drivers work.
> > Hopefully this change isn't a deal breaker for anyone because
> > long term the lack of uniformity among drivers is a PITA.
>
> Matching how other drivers behave is a good thing. As an application
> developer however I need to support both kernel versions. So I'm
> trying to find out when this change happened so that I can add a
> kernel version check in the code to modify the behaviour for mellanox
> drivers.
>
> As a developer/user visible change in behaviour, things like these
> need more visibility. Information about XDP and AF_XDP is
> unfortunately spread around too much. It would be really useful for
> application developers if we could consolidate the information at one
> place like DPDK does.
>
> Srivats

Srivats

