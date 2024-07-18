Return-Path: <xdp-newbies+bounces-123-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC8934CDE
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 14:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5CD41F23B56
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 12:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F4F12FB34;
	Thu, 18 Jul 2024 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Adz2XyD3"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84432770FB
	for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304015; cv=none; b=nrOilpVStlj9OJVFe4xZNbz+11quj7tMLkcleO0PU0EOdDK2V8zI6a7qv0lfkNeerrYK9U9jupcp+a/YWmUZXhmT9QQyuA9NRCSs16lw53B2Reor3j0aRawrIr1/FDD+oeFO8mm/dLukbwURw1X5/R+bkgYD3dwh0LSS4Qukqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304015; c=relaxed/simple;
	bh=f8QAogp9XFbiORZWLGuegYxO33NwUKmn3Wqt9C386Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nhRzp21bKWfXz0WMvemq71HReZaRBKulxjVsqRXV/rEPqAVGC4Bu2MtPo/SBLJf38RFOOfXO/y4pvWpM1sCKMUCWtveUHAwKLpCI/o2T9rMN5uSlBaELUYr8MAAu6/QAoLtby4SyfziufEt6sKc6HQDwzR0VgMKCLFZ+s3nE69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Adz2XyD3; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e05d48cf642so706098276.2
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721304012; x=1721908812; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8QAogp9XFbiORZWLGuegYxO33NwUKmn3Wqt9C386Yg=;
        b=Adz2XyD306Xn1EkSV06Y4wl1ORAiG6O5F3Wohb9JhGGwuiQKTB6QTx5m7qTxlLXZL0
         XxHIb/d6nl/qFn31W2j8MEY87gm8NVg+LnwXmWouSSx0+CaAk3cXj0gn5Z1AONw+hv4f
         QZpP+4R6UAmigGv5F4BJ2Gy66soTcPweZG6HiCr5GbC5uHC8aAlcrnHL6HbXnmNGRxFt
         YE9nH/pl4KROpD4N6pjfZvLbmQI8eAw7RaaeBWE7dbnzMSQWJTGQmwPdN3p0kfQJyOvc
         l07sMPK9qQmArAumF27lqL4mFyxBmQBTJSVoYd21/1G0wRtu1zobmAwkIxayKdtJade5
         j/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721304012; x=1721908812;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8QAogp9XFbiORZWLGuegYxO33NwUKmn3Wqt9C386Yg=;
        b=QLNvczVrm/p941WjCMpCFotRF001FnzOIqBWtMm4BvcNRXWoHoz+KLCzPV7KeQKJlH
         WiIG5mmeZDAs22JQfOo5+OWybf8Z8dnmCnF2yS/wgHjcVGLPZ2F5cLQ4sHGhM90rqo/R
         Lic32f3Stf7CK7QI8etPWBHhninCbW5YwnbV87EnfpBOxA+xD8Z63SoxjzsstdIM/nrx
         HnjsLuYeor8KiBZrfpKBKBxVfJudPpbZy8uz6VjET3gS6AJz+Cp/kX8tI86jkxpQbo/L
         z+NoJH5nZXLxqK20rFBvMaQ+bfZqqTZSUxf6jFTDZz/OFMNcpQg0SKJDwvsWZaOMsbq4
         3nWw==
X-Forwarded-Encrypted: i=1; AJvYcCUDdqBMzNI/RHlUHjuxsFhsHnmp0z15vPyXzy9Sb/peEeb7lSMx1y/UjwDf25r3VPj4RRJHEBDs0TDhmbMfWehpoH3tHuHzpaZTuLc=
X-Gm-Message-State: AOJu0YxpG2jpltQJsQZufe1aqLB0sw6dqm5mcztJskMuLxh2xAVDGZqJ
	ebSuoOsVeMy/ehiUK5ZQndh7e8zSHIXpel6o6exI2xYY4Hgqiv70exTTifIuIxgxXQ0Ty0eueZS
	tnXmaYkN/Wd/+xsRRt5N9+uMAZ04=
X-Google-Smtp-Source: AGHT+IEMXx3f+auGAN3+g4RrQqBTvkHGecIBDOk2H/r6AsL1mF1QDoRvIw00wKGkhQg4EMlQH3S7lBbkTxbeDW7OKNs=
X-Received: by 2002:a05:6902:2206:b0:e02:3e43:f1c7 with SMTP id
 3f1490d57ef6-e05ed733255mr5669330276.13.1721304012296; Thu, 18 Jul 2024
 05:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
 <20240713090438.37e19696@kernel.org> <CANzUK59Oobf5q3YE+Ym1LuQQGqF8BSfHoQ=RTKvvgSyJFha=Pg@mail.gmail.com>
 <CANzUK5-JYO-fCv3zzzY0YUHN9EHuEgOTpYoYa_nDZ+2EaBaisg@mail.gmail.com> <LO4P265MB3758D7056BF45389781B8C4193AC2@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO4P265MB3758D7056BF45389781B8C4193AC2@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
From: Srivats P <pstavirs@gmail.com>
Date: Thu, 18 Jul 2024 17:29:36 +0530
Message-ID: <CANzUK58Unm+sRtnjXD5FVniNKH9QPQ1zajekQe8o5hg4+d2Zbw@mail.gmail.com>
Subject: Re: mlx5 AF_XDP zero-copy queues
To: Robin Cowley <Robin.Cowley@thg.com>, Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> We previously had a similar problem with kernel 5.4, which resulted in us switching to a different vendor.
> The commit we found in the linux github repo that changes the XSK queues to be indexed from 0 is: https://github.com/torvalds/linux/commit/3db4c85cde7a514a5277070b32e776dbefcaa838
> Hopefully you can trace this back to a specific kernel version change or find reference to it elsewhere.

Thanks Robin! Looks like that commit went into Kernel version 6.1, but
I see the behaviour change in 5.15 itself.

And the 5.15 code includes two sets of receive groups -
https://elixir.bootlin.com/linux/v5.15/source/drivers/net/ethernet/mellanox/mlx5/core/en.h#L167

My app uses AF_XDP for TX only and I'm wondering if there's a
different commit for the TX queues in mlx5?

Srivats

