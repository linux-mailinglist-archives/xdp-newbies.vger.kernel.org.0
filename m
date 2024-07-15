Return-Path: <xdp-newbies+bounces-119-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C91699312A4
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Jul 2024 12:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650DDB20D5B
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Jul 2024 10:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCB0188CCF;
	Mon, 15 Jul 2024 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoqgmNZO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF611662F7
	for <xdp-newbies@vger.kernel.org>; Mon, 15 Jul 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040905; cv=none; b=fPifPSZCzLLJ7s4XVtns3mrOsjJs+zNfyKD+Uv1KJ4uE76S2wXpSvaFUe4AASreXCDy/ZeLy0Q/YaMNqpayt8oxqiRF8qazCxKeLO/NGnqpgPpJUwVPjFBum3Gubec3i3g7oIcFTtLX4n1pPuzNbkSwa/UNijjPdr5/DRB4itYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040905; c=relaxed/simple;
	bh=bgUIZUvSY2FS1bpy25VDQ+O0+zvWAtevWV8AUVX1JrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFGqngf+TuYzxcWzzz3/gm9z/gMGCPNi1TxTfzZdZBrzKXcHlgGIRV0CfjNEqJcg6I+WFgL5WkWOSGEcxF/F0tQPXuM2tcggVZc9iiAF4kRuLkNMuGyZeg4sXjdP2DLkIpySfGloqbz0QYrS5Mfi0A+mIJqUOB3jMrCHIz5OMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoqgmNZO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-662dc911cf2so1231477b3.1
        for <xdp-newbies@vger.kernel.org>; Mon, 15 Jul 2024 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721040902; x=1721645702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgUIZUvSY2FS1bpy25VDQ+O0+zvWAtevWV8AUVX1JrY=;
        b=eoqgmNZOfTO6HpavRgy8Y402LWMyFzJIAJoAXV3gUB2aHyKw5ynMMtCoA12PxPQk0N
         Sfhw0Sq4VdapWEuEcXayaZSVPkwrxuiwpgynuppGEf6PG1kuPZC2Cl7u1iHyDk9S/wA2
         15f1NbSRLHHvs8RGLLj/39jMTHWpg+A/d0DXQfbklvCX8fYDwHg/ANRUIxAatz8a8But
         /Az5yKfHiExOMb1UG3U2bm5JxOVdNY5yDXebA1QDejawIak6hgR+aYkX2LSLd/TMsGBv
         qu9KetrXpLM8FWZ4HcIMSdkWTZI0YidORReLcS5sdY6udVjim2gMFTjWDnCDNwgRq24F
         MYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721040902; x=1721645702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgUIZUvSY2FS1bpy25VDQ+O0+zvWAtevWV8AUVX1JrY=;
        b=QVx2VcU51IpzC6vV7rP8S0AbFs9u/VAqbWPD1tDHqmDluwqkDGZnJoAsOWU+/2beWC
         bDdZjdS2twgxcdmFCugu46bVfN0W8P9rShbrCsY4I1IKq1Ikpr4ryOr4/tl+2SJuKkNf
         kWQ/1LIeb8VD/Y6g0yDso+gRyjyKpaWy6p7Z/SctoxmiULqHY8VWAws1pjSP9tg7EaDN
         MjeZv4JBuj6cDGVlQYtO7oMiGe0BH1BL5dYr8YwyipxxDrT0cIAzPjq4nTZxFcwyv6+Y
         a/gzgycKnwJVmsFysa1av99ktM9QFl4R0DwPz+nsZ4QVSX+P7MsRZIenR/oHyuZIWN7M
         dHNg==
X-Gm-Message-State: AOJu0YwarwRTChw3y1wt7uJW4mnFQ65BB14UpHl0gjSNVN8hXEeQbcap
	eM+J82K3P/vppG/0m65yNl07ZEZOQD6ZVgFxHexHCWiNtJLxGA6j3uWm5wAR6eQnzHatRcgmup6
	QRB6cJeuubGO1TyNfKOEqd+BxyUqZ6o6V
X-Google-Smtp-Source: AGHT+IHhdO2gUjYrUZr1i03TOpySAtmAcFNwyEF3h5chRTe/q/vLC8bFawQLwBNskiN5Jl0ZxEu/YrKiEOFsITEzDKc=
X-Received: by 2002:a05:690c:4d82:b0:627:ddc5:eb5c with SMTP id
 00721157ae682-658f02f4be0mr258663517b3.34.1721040902398; Mon, 15 Jul 2024
 03:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
 <20240713090438.37e19696@kernel.org>
In-Reply-To: <20240713090438.37e19696@kernel.org>
From: Srivats P <pstavirs@gmail.com>
Date: Mon, 15 Jul 2024 16:24:26 +0530
Message-ID: <CANzUK59Oobf5q3YE+Ym1LuQQGqF8BSfHoQ=RTKvvgSyJFha=Pg@mail.gmail.com>
Subject: Re: mlx5 AF_XDP zero-copy queues
To: Jakub Kicinski <kuba@kernel.org>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 9:34=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 13 Jul 2024 12:23:31 +0530 Srivats P wrote:
> > I'm seeing a behaviour difference between kernel 5.4 and 5.15 wrt the
> > AF_XDP queues used for zero copy. This is specific to the mlx5.
> >
> > Assume you have 'n' queues configured on the interface.
> >
> > In 5.4, you had to use n to 2*n -1 queue numbers for AF_XDP zc. Using
> > 0 to n-1 queues would use copy mode.
> >
> > In 5.15, you have to use 0 to n-1 for zero copy also. Socket creation
> > fails if you use queue >=3Dn.
> >
> > Also, with 5.4 netdev stats would not be incremented for AF_XDP
> > packets whereas with 5.15 they do get incremented?
> >
> > Can someone confirm this behaviour change or point me to relevant
> > mailing list discussions or some other information on the same? My
> > google-fu is failing me.
> >
> > When did this change go into the kernel? I can't find anything in the
> > kernelnewbies.org changelog between 5.4 and 5.15.
>
> Hm, can't find the relevant commit quickly either now. But it's
> intentional. The new behavior is how all other drivers work.
> Hopefully this change isn't a deal breaker for anyone because
> long term the lack of uniformity among drivers is a PITA.

Matching how other drivers behave is a good thing. As an application
developer however I need to support both kernel versions. So I'm
trying to find out when this change happened so that I can add a
kernel version check in the code to modify the behaviour for mellanox
drivers.

As a developer/user visible change in behaviour, things like these
need more visibility. Information about XDP and AF_XDP is
unfortunately spread around too much. It would be really useful for
application developers if we could consolidate the information at one
place like DPDK does.

Srivats

