Return-Path: <xdp-newbies+bounces-116-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AF930422
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 08:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 705781C20E96
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 06:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F64F1CA8D;
	Sat, 13 Jul 2024 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1K2QqWs"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF6946F
	for <xdp-newbies@vger.kernel.org>; Sat, 13 Jul 2024 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720853423; cv=none; b=OyrJ/qRs7MDhX23yzbv1hGzyhOjnoJl/2a5dT0VILjC8Zqa+GDkGZbDf/J85HAFaKDUczd/GkXy6xs/m1W1vE31kZkdk5/pOiXLaeUBbBsq3gHdFE++MI0Msy5GFT8JjA7Oo4KMYDqY88gqWVETrxqo8aNSuWWmxBTPBK5MRzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720853423; c=relaxed/simple;
	bh=xZqVQQ3LSXmQlAluzVd7+wINEQal9KELx/oapnc2vxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oq1lseAU59sWA/Rdvsy5foTYifA51RMCFVJ6oIukhTXX0DD7lhLKEC1YWWjo1UHIU0DYgFynjDaGcRfhIY/mrfucAnS9M6YOp3zDc7i4E8XZ3bDccgFQXKUEnqS5TPDFLdlTR4f50RGzS5ciByyqyLDVf/BLKqTLIEXN0Rh4/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1K2QqWs; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-651da7c1531so25432987b3.0
        for <xdp-newbies@vger.kernel.org>; Fri, 12 Jul 2024 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720853421; x=1721458221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSAVjTbrLnT31dcUqA0v3H43XEjbhqwG5/lBeWlH3oI=;
        b=c1K2QqWsqZMh15R/64D0PgMLbGcBx54cIwK4aPrvuHK4TXqxd8wi1CF7TpSKBaypDS
         pYCyCRQL4IPRCLTFGEYTcmhm0YdDSQo/i/pd2eJKRJtAPZ4yLI+PNT74rZEdC6kkI8bO
         a/Q0kt6JynEiNKrptezEs+ujVioZh9bGCwcD1dd2FrRgS9W70bwXtbolGtN2K0K7fThI
         7+HJHOXkJUHNzHtzKCynMc4PgkQE5GnyKr/f6yYPN6ONtqAxwRfGqTQi+11P7eI7Pqxp
         qL80UPziSgMLET2DpPEpl7jVwe0uraaYHp1J10x5hgLbufb0lGe2ufxgvyhkkprS+tHx
         +JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720853421; x=1721458221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSAVjTbrLnT31dcUqA0v3H43XEjbhqwG5/lBeWlH3oI=;
        b=SsjIZTx+UCsvfBQUYcLyFqLQohQAEsJPqMD2DeIT2C0TMwlRaKDjJ1fjZRLoOv9iQA
         QwgWK3xKrA1Fg8YqpDrBFpjoZKcjIacZROscy8wo6jS5OLloT1PjFLkYruAxgtX5Y+FM
         bTwH22aehNIdlzE8JCRP6uoQiSrSH3idlym/iyhbgGbI6Y4hxzCjHXF5O0XyAAAHufwS
         8dxOT1N2k1nP+o9kZt5RoP71J5EuVrUfglptgfOkqK/ZhLkuSDykhZAZWzUwSMQXpsFG
         1vMyEBQMBig2iMI1FQlU+utnZ78+37O+1jxHVG+MHchblWp3roKSGGAKgBVyEGZ9dCaM
         TJgw==
X-Gm-Message-State: AOJu0YwLjlKkW8aEEHOfny6qeXBrhR24HA2VECUPJC5j497gPzMZQf4F
	RpnHPs+2kGQ0ozqsj7cM2JxAEFIB9SYq9IH02aVafpBxGnIwUdZENEOYqLuHuKU1jGgKG8yf16u
	EgYPQFrqiKLrnW8N8svqzLpwvZ9/1ilXC0Dc=
X-Google-Smtp-Source: AGHT+IFSNYvz8S84offvAbjCk0t6TQaThUmCyLssnZk02m44i74WGAvnpueoYaQd9ZwxO1cql/AxgwyWDyrkLkkFAf8=
X-Received: by 2002:a0d:c686:0:b0:61b:3304:b702 with SMTP id
 00721157ae682-658ee790e5bmr142836637b3.5.1720853420655; Fri, 12 Jul 2024
 23:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
 <CAJ8uoz2huw4QRtBO++=+htSQM3fZHHfR1Twh41hs0r1r-WGYmQ@mail.gmail.com>
 <CANzUK59AQycWhFH4wtg6hff5AF2LEPEGstr2nLWh2CX_kcv3Yg@mail.gmail.com> <CAJ8uoz34TEU9SLwQfTinig_rUkyK7ZXzz0-MunvWtTv14f12CQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz34TEU9SLwQfTinig_rUkyK7ZXzz0-MunvWtTv14f12CQ@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Sat, 13 Jul 2024 12:19:44 +0530
Message-ID: <CANzUK5_B_SaL=KOwenvy_EW5mMEh-Bdk7=fokzXeeb7q9GaxGw@mail.gmail.com>
Subject: Re: ixgbe zero-copy performance
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:28=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, 10 Jul 2024 at 12:07, Srivats P <pstavirs@gmail.com> wrote:
> >
> > > > What is the expected performance for AF_XDP txpnly in zero-copy and=
 copy modes?
> > > >
> > > > With Kernel 6.5.0 and the same ixgbe driver, this is what we see -
> > > >
> > > > ZC mode: 4.3Mpps
> > > > Copy mode: 3.3Mpps
> > > >
> > > > This doesn't seem right. Shouldn't the zero copy performance be MUC=
H higher?
> > >
> > > Zero-copy performance should be line rate for the ixgbe card, so
> > > somewhere around 15Mpps. SKB mode seems in the correct ballpark. Try
> > > pinning the app to a core the driver does not run on, or use busy-pol=
l
> > > mode "-B". If you are running on a NUMA system, make sure you are
> > > running both driver and app on the NUMA node you have plugged your NI=
C
> > > into.
> >
> > I had forced zero-copy mode (-z) and copy mode (-c) to get the above
> > results. So the xsk creation would have failed if it were not zero
> > copy mode.
>
> Just to avoid any confusion: copy mode =3D skb mode for Tx. The 3Mpps
> seems about correct for that mode.
>
> > This is not a NUMA system - just one CPU with 8 cores, HT
> > disabled. Nothing else taking up CPU on the system, so I don't think
> > the app and the softirq would have been sharing a core.
>
> I would ask them so that this is not the case. It happens.
>
> > Unfortunately, this is at a customer - so I have asked them to try
> > taskset or use -B. Will update when I hear back from them.
>
> Sounds good.
>

xdpsock txonly would top at 3.5Gbps irrespective of mode (zc, copy,
busy-poll) or packet size. It turns out it was a PCIe bandwidth issue
-

[    6.573856] ixgbe 0000:03:00.0: 4.000 Gb/s available PCIe
bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:1c.0 (capable
of 32.000 Gb/s with 5.0 GT/s PCIe x8 link)
[    6.749966] ixgbe 0000:03:00.1: 4.000 Gb/s available PCIe
bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:1c.0 (capable
of 32.000 Gb/s with 5.0 GT/s PCIe x8 link)

Moving the card to a different slot fixed the problem.

Thanks for your help, Magnus!

Srivats (Founder, Ostinato)
Now generate up to 100Gbps =F0=9F=9A=80 with the Ostinato Turbo add-on!

