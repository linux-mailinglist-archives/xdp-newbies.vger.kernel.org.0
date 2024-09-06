Return-Path: <xdp-newbies+bounces-137-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933B96F503
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Sep 2024 15:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461A11C20C85
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Sep 2024 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449411CDA39;
	Fri,  6 Sep 2024 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Txco1w8+"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80BF1CCB54
	for <xdp-newbies@vger.kernel.org>; Fri,  6 Sep 2024 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627932; cv=none; b=EN5Adsb+oI/MhqQkGcPpQf4Dsyf7oE7QW/0W/+IC98ZQS6IekqsCYAPiHwimBjCOp1C3fto5iMUP5S08AXGWmk3CeMW1P6OF37urtfcTKcD+0HgFI4uesagD3o5TIbi6iiq4oIYKzva3BODYvJUHR25FciTeazEtoB6fuI0kQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627932; c=relaxed/simple;
	bh=cjReCkFc776OpygHnBfn0HXq9KQYIn4/czONOMzcw1w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GGLp485vkW3356d69HEzm/DIumwSa31sjr3wuv9MHJ3dMcdReSBt1gojV1iFcOjemC5t8XwHKz/msx/edkyuL+y9yfoUxYfBKlDXZ9ik4Yf3VIVTIDSHok1Qfl3YNdA83/V5zKXyrLInviuYAjMWURe7eBdbRHM6960XmihgtaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Txco1w8+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d3f4218081so19880117b3.1
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Sep 2024 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725627929; x=1726232729; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cjReCkFc776OpygHnBfn0HXq9KQYIn4/czONOMzcw1w=;
        b=Txco1w8+8r83f66Uo7RiOKOMy4FqcxAc/CE+BED7tExJrK7V2SegSIY/boxkX8Thr3
         LqLQ1E/PpNwuEynaT0ig2J30Kz7FaUGCOFauNM1hKRvghJp4txU8XJxs95N7T9nV2Gof
         5qIAzm5Vo5yLg4qJOtNkYGY8l9J5rsm7WKEO3G2gv8aA/raExEJL4dSsx97sAdp0Xxd+
         P45OdKQo59P09mPHBNdWhqkA9UWkhuiqBQIA+r0dFgcgrnBAYPl/+XXVnlWwSDA3Sr5Z
         4mwzOciaVjiitiUeimxSVTAP/VDswo+CitqFi7MNwRHNSMban47RJERkL4dkiY9Tcbu2
         NLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725627929; x=1726232729;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjReCkFc776OpygHnBfn0HXq9KQYIn4/czONOMzcw1w=;
        b=OOe5HKLuckr11tc5Rn9DpYfgoj84FRllvKGNhfm5sZNlqtazwS8r/kAePVf+ppizWw
         MbmANfzrcXLIk7A1uDJfubxog2uXrMuqdwHF9e2s3JXk9rttZQ2PPGs7AueIcCEvISPM
         x+bvgl8AOWkIozFPx7nyUg8DtmFiY9VRk/B05ntZVqerqREWYej0pNGjLQ53li5VYqSP
         G8U1aqGVtNlwDwOp3JPcU7FYU54TUrv7Mu62oJGspRLKF571zDOpW7YMaZURKqbzGfRG
         a6rqiFNU83F0nY+60ZojOo8Xh0FpBeM1ZQWC+aPVdgvXL/YSvSO86BIHu9ziIUfXmUM9
         s70w==
X-Gm-Message-State: AOJu0Yz86OxDvtNqiEYASA/Toe/Bzk+2ZsSXCQ9lT98GdpCFVC1RZqXR
	p2wfdPtlFGmcRnfncNOaN6vHwzT2GFqKu5KJAqXmPK4y8qYwPA+JJTRc3S18mBVbO/zIz4lKS8h
	Q7kJmgzHlFvt8X+2NR+Ws0FpjjNBOJuHp
X-Google-Smtp-Source: AGHT+IHds6GjIk9b0WnO7yyzYLMfJMhiydqB+kfDItkrwbrymJdzusG8l2H1Pce7eRpTfNZscxw6ueWcSVpH4UJbbCU=
X-Received: by 2002:a05:690c:b9a:b0:698:b11:6a6b with SMTP id
 00721157ae682-6db44df2a81mr29262687b3.17.1725627929158; Fri, 06 Sep 2024
 06:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Fri, 6 Sep 2024 18:34:52 +0530
Message-ID: <CANzUK5_hTi0gWX_9xK3ycbqNpwbovJdhFaDoojn-NEUJ8ivn4Q@mail.gmail.com>
Subject: IRQ-CPU affinity for AF_XDP TX?
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

For AF_XDP (in ZC or copy mode), the IRQ-CPU affinity plays a role in
the RX direction to bind a CPU core to a particular NIC queue (mapping
the CPU core to the NIC queue's IRQ).

My question is does the IRQ or IRQ-CPU affinity play any role in the
TX direction?

An xsk is specific to a NIC queue and assuming there is only one core
doing TX on that xsk, is there some IRQ/CPU configuration recommended
for better performance?

Does the recommendation change if busy-polling mode is used or not
used? ZC or non-ZC?

Srivats

