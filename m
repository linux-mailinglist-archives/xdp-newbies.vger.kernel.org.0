Return-Path: <xdp-newbies+bounces-184-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2867B3D6CA
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 04:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B0E1897FC7
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Sep 2025 02:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5E1DEFE0;
	Mon,  1 Sep 2025 02:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMdx5eRl"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460981A0BE0;
	Mon,  1 Sep 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756694865; cv=none; b=vDaSgVzlDbrf+7RAtE3dz1Y++0o+/dnbmv67fnzN+thznlzLjTH/8kTzsEsV/rXgFtqIwXfTKLYtwAemG4uXOsb4vxmDTWS1/VzY1IG+6GjaVtD3PLH5iXGuNDRXMpqJ2b65VpHvocTN/3d1nU4M4+aUDd2hRwpvznQPr1fK3yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756694865; c=relaxed/simple;
	bh=rxZr/LcE7mUoqfWVuzgUn17kyp83T4elClPnRt0j/t0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=msjh/xxeawDDUchIpmjZtS/hpJ6hkOZc05quQ9PUFBNO0mYb7DThekMXkdELvqx5oXG6HcnS+CO7OH1Twx4ce3qy67ksLiKGCKHMC72tWeHaUCkOi2XiHCEAkDyD6976IxivvYVVLdpqINn/0W43VXXV/Lr7QrytPjuBFn2f53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMdx5eRl; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b320c1353dso19828851cf.1;
        Sun, 31 Aug 2025 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756694863; x=1757299663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oZYiCjncPBOCZL5vVyQngckkkRakO4ayJSf8550Lyuw=;
        b=bMdx5eRl0SgU750dvM5B1N+P8CwEVTPjnmbXjuzWMI+AAU2xLdyRmqRgzklC1Xvm2H
         hhBlrWbZOY4sGHY8DWxzHb/gP/0bocSpAyCW6NlYAWopQo++QeQPr4XZBwIGLEn8B2An
         6hreuWdU6d1015S+nc8oZLWTalbI4H+k66gyxeiOo/VoMyK01JjYfraOcbgdvEttHQFd
         qiUhc8VYWwLIm+CaSLFQInWb6Q/UG6JBazQFxbVDI6V1LMJmHzvgbEScrL4Geb+/78pQ
         z8acQra/scB3t2NLU7lqOZy2Neyn7ilAiKs1ADXZ057NkSFQ9ZVX5aYF6OghTuBNOPcK
         IPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756694863; x=1757299663;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZYiCjncPBOCZL5vVyQngckkkRakO4ayJSf8550Lyuw=;
        b=USIqQoBuIBB5zhz0GslmRQsAe5YgQCJAUS8a/NW9vlYmJ7ztfoWmAqngk2RFwsBReP
         0GJe06gTlrte++d1pQr0L9pm2STy6nHIAauCYyDkLTmP2L3wJOE/dQHgoAJ+sIDhQ/ge
         C8z1ja2/mCiM+6HSLVCyuHetB2wLPNiey6p6vkroujpruR0XN2cDouC5rrKpoZeVBkm0
         fYqn51cUm21JZ3F1TRgvpHdwnQD1i4jRMtQkpG6U8ucDHwE/7z+ewsgaj8GqfeuHSLDy
         5pS939aVuso8b3iIhkWXeUy7hHR4ecy3hQvugEWhRWouX1b+lZKi9oRNyVXXcbSp46iR
         HUrw==
X-Forwarded-Encrypted: i=1; AJvYcCVzEPM1L3KlE7RfWEsFkDYf1VHYYvKVHWplrsHEorzDTrulXSfPK7HYx3pU8WRjILtyjMk3fD78J/kvhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0Di9Gc5BWEOuaOsWx89nFE/7567zHVKNumYaCMATdKlzgy10
	mls7FmZ7RUa6N0jCjItezydT7jtVCwUcokILHBWFZ+hdmJBdF+Aq5Mu7FPfmgumPpwLw0XV45nQ
	9byYOjQIjY11ZUn2059caly02veuCWvO6PB3f
X-Gm-Gg: ASbGnctRs5sOwYxQcnIzOTYr/UDVT11aok8YNC+Ancp8r8uIN0GWyimDR8dARp8a6Co
	n2x3it5Kp2ahy3oHfThNRbpaf5ueDoZu87SuEMS8+lHIj/WQJ+xTJ/VtLP+nzJHxx2QXAqA8oKd
	GTAcQyIdRU9D50nJgfhNU/9CtDeaKoAoOZ72h2LMWAqfiBi1GtmksW+g6l/73wm9NSwpvaZQ3If
	ARsXGPaFtT2NOoUrQ==
X-Google-Smtp-Source: AGHT+IHXzXAlKqknR7kubGUYqfXblADyqMfalPcwqRqHW29E6ncagvwr7bLO51jOlizKaUogiwo9dSOgT9qhm/58z2o=
X-Received: by 2002:ac8:7d51:0:b0:4b1:dd3:e3a0 with SMTP id
 d75a77b69052e-4b31dd23cf1mr74235981cf.63.1756694862825; Sun, 31 Aug 2025
 19:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 31 Aug 2025 19:47:30 -0700
X-Gm-Features: Ac12FXxAkBGzgJL6wXci8JirS0KlZnqs7A_RgrHcMn8mLb0FUKeEL18G77Af9kY
Message-ID: <CAK3+h2wLLoVW_daqow_ygbut=KnDkPbvG_C8rOoyaiyFMnrPLg@mail.gmail.com>
Subject: [BUG?] driver stmmac reports page_pool_release_retry() stalled pool
 shutdown every minute
To: netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, 
	loongarch@lists.linux.dev
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I noticed once I attached a XDP program to a dwmac-loongson-pci
network device on a loongarch PC, the kernel logs stalled pool message
below every minute, it seems  not to affect network traffic though. it
does not seem to be architecture dependent, so I decided to report
this to netdev and XDP mailing list in case there is a bug in stmmac
related network device with XDP.

xdp-filter load green0

Aug 31 19:19:06 loongfire kernel: [200871.855044] dwmac-loongson-pci
0000:00:03.0 green0: Register MEM_TYPE_PAGE_POOL RxQ-0
Aug 31 19:19:07 loongfire kernel: [200872.810587]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200399 sec
Aug 31 19:20:07 loongfire kernel: [200933.226488]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200460 sec
Aug 31 19:21:08 loongfire kernel: [200993.642391]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200520 sec
Aug 31 19:22:08 loongfire kernel: [201054.058292]
page_pool_release_retry() stalled pool shutdown: id 9, 1 inflight
200581 sec

Thanks!

Vincent

