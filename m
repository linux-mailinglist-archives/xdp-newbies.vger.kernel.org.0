Return-Path: <xdp-newbies+bounces-41-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B79853137
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 14:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AA0AB24EB6
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 13:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621DB5025A;
	Tue, 13 Feb 2024 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwutTrQe"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DDE5024D
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829404; cv=none; b=hOy719f0UuOGcafKYZp9ntu96exLgiurBeV27PjSvCcQorG3uuvFR5E/ldIzueDo01z8UaEiFd+rWxA5o72KVxgnqRjiZPeU9LGIo+3NTJ9tKroPnQGrzQng2e2SYzNkRIjx7eZ8t45BL/aO7IDe/mVVQMNJ/TNBGBN+c/6dhw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829404; c=relaxed/simple;
	bh=lyqzIUFd7lVfjePiYSE9mxr9hrSuycdaye8zVVuF5Y0=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hN5WYRSiMFkb8qKUFMB3Xx43sXw8giUGUV6PBJHeeZnsSqLV5NJChQgq1MCKyAVe5dee0gMiIs/MYpPcONwf3zTKR2kgn80gf91FW9Njq0Wa0RPZDVen/bGKZSzfN7QhAkcxJBlFE9UMFbsKOtDXnXy5W/M7ePIwOFFB/MU0DR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwutTrQe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707829401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lyqzIUFd7lVfjePiYSE9mxr9hrSuycdaye8zVVuF5Y0=;
	b=IwutTrQeWLI13ixtJE+1PBRaC2FzmWcx1FiK+t7ZOE29obKgWq9ErvTUPHCuiHknXX/FGm
	pgleOY9fAwpPYRMJAUC1bJgQBbF9lch9zfdYHBXdfQ4wY2q+hqJubJ9j42CbSrzbfO8Aml
	Vd6zXYxxlDXmvqOlKXFXJ+uolYZe2hI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-75id8yRsOjGkDdBr-W5aqg-1; Tue, 13 Feb 2024 08:03:19 -0500
X-MC-Unique: 75id8yRsOjGkDdBr-W5aqg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3c2fc67d19so103940166b.3
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 05:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829398; x=1708434198;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyqzIUFd7lVfjePiYSE9mxr9hrSuycdaye8zVVuF5Y0=;
        b=HWkSYKCkz+1CbOzf/PWoQGveC2rBGpbxB57ymUQ0aEff5Gdo7xAY4nmNdGldtpGzU6
         5z+QRXtseI1rtxn47hA5HfVZGXkpaskP78BX/xntALz4VaSR+CYgoFrXWN6EbWlvQyKc
         Qewf7l/6I3Qro/zOw8QcQEhbg2oguPDoP+OS/8PmuHGI9RKA8+33NQZbmh25sQHLo0kF
         lmHm8Cd4232S6yKESsB4B1m1rACZnCXECa+NT3Qurj8LVJavS/t/VajoLOz0ueGtphMJ
         xqLH5kNbew5sY3Weh4EaM0LLSDQrqYQt9bWrvZ+qsaRgxUI3E+tIAUGwfceumSkqzO3d
         AOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX15fiQliiT6hmQ07ywDWH6PqggY9jdZ76m7JxDpgvT0u0a1UISVokJ0NBLoysFNqi5vRO09lGw+7uP069BUKSDELUzUoiTutdl4nM=
X-Gm-Message-State: AOJu0YxYDPj+IuN612FMqsGCFSU8+pjaW8Mm8GPQejSrX8aQTnjMtwx9
	Bix/33i6ZEuQfNTLTsRy9MHzEr1rhdfYRQq49JCghpYF/bWFPInWwENTnBwWcIULXNMVbdWeLd/
	KmPGPTIKg7L4GU/PzKe+flIByU07kyCi/SABIWWijInt145fmnf+wCAMZJFlkHDmrkFel
X-Received: by 2002:a17:906:eb17:b0:a3c:8585:22d1 with SMTP id mb23-20020a170906eb1700b00a3c858522d1mr4491429ejb.54.1707829397978;
        Tue, 13 Feb 2024 05:03:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP2DCTS4cKul3lbjMOLwQVa9Yg3arHb0/EUyPIIWIXsdgQX/CwjgFtiLpdgtHjkFta+EjRpQ==
X-Received: by 2002:a17:906:eb17:b0:a3c:8585:22d1 with SMTP id mb23-20020a170906eb1700b00a3c858522d1mr4491409ejb.54.1707829397632;
        Tue, 13 Feb 2024 05:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQXH4l46l94akSZujQBvkAk1deL1O0wXap3B3ET4IYAC7/xWtfCYQGZ1GAs0cc2KUwC/a2LBlHOCXQlB09P7jdICPxwr9ffh50YYY=
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a38a476fc08sm1272257eja.87.2024.02.13.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:03:17 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id A685010F5677; Tue, 13 Feb 2024 14:03:16 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP packet queueing and scheduling capabilities
In-Reply-To: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 13 Feb 2024 14:03:16 +0100
Message-ID: <87le7ofre3.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

team lnx <teamlnxi8@gmail.com> writes:

> Hello everyone,
>
> https://lwn.net/Articles/901046/
> would this be resumed any time soon this year ?

The latest version of those patches are here:
https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/log/?h=xdp-queueing-08

They are a bit rough around the edges, and there are some missing pieces
still; I'm working on getting a userspace/BPF implementation to the
point where those can be filled in. After that, and some thorough
testing, it should be possible to post another revision.

What's your interest in this? I.e., what do you want to use them for?
Would be useful to know so I can make sure this is covered :)

-Toke


