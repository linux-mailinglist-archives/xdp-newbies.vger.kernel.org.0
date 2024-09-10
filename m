Return-Path: <xdp-newbies+bounces-140-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515A9739BE
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 16:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A37091F26551
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 14:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FE4188CB1;
	Tue, 10 Sep 2024 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZyDF379"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203818FDBD
	for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725978051; cv=none; b=dc3s0cgZHuo2WW7jbd5Tfk2byeh8Ke3W51ir4eWh1iMdtOwt5Ye9B7ZLN3JmIR4AwVfN3WDG3lUIxRNM98qoLY64dZMbJIqKJ8uP9VPBsJK/QU0vZ3bsSokmNUn/qiOn+25ipsKegZ8pm3OPZbbsfGT6LsvUxY0DtFMRTWqnqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725978051; c=relaxed/simple;
	bh=46QBNLK52CAtZosveCYN1csGZbxbd/wGj5OY5VIbLpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dILdeMQbbkyvNEmLS7Da2FInkNPtaMxD8/W3sAR3pEge6QZUJ9JRcKG80ndSTt5nKnEhPuV7rQVdq9jH5nSkTTApaLLq7d1+8NxxeirFRt4r5eaTq3BeF2fv0VByVGExDHH+9nznclNzhZn4K1aD6gJ8x234BqL1a/FL36yyHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZyDF379; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a7d43a226so6157930276.3
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725978049; x=1726582849; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46QBNLK52CAtZosveCYN1csGZbxbd/wGj5OY5VIbLpI=;
        b=IZyDF379mMN3j0qJ/7e1kHkJVePAGZhcL6aDWFkPgRDN51/3A5bzS0WUYKPN604dzl
         6+mBN3Q38xxlfH0w8C9vQZuVtggLa68Fb2A55TVrd4SFE5OQ85eRqVa/y8WmumISMI4X
         e9yXQjGD0qlqqytLV5qsliCMwmakl8Y7eM2rN32XQaGP3uHmkKTA7b44737ENJn1LW2e
         5AtLkj0eqbDfNujC4LSXOMzlth4RNuBBFoPyhxHiTcTFwoYNKHEC+HdrIKGiyxfsZhMz
         qKH0siYSM2grc7/mtn8MOTUyBSiWu/zt8oaV/S86OOfx4YKteUT2LP9vz9JQaKUtx5QM
         T7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978049; x=1726582849;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46QBNLK52CAtZosveCYN1csGZbxbd/wGj5OY5VIbLpI=;
        b=tRBxVulRmXIv0zNWqs+jDzdDfFWZYCXtc1m3ti7CKL34v2EKD+9Stv67JYim/iM7gY
         peJhWvofjkgWVUPEzerTCH6WmJ0r5rMEwHtTr2AdcL+RGLNddNOsg+vvPzuSLS6F4ds+
         5knPvH+u/X01xKXAY93tDpx7S0DPsokycXET5n/gYjmGmKFW9K+YHZn4CPajxRENV9Y2
         Kr7HAcxsuDLg7kK6ygbEhX0XCBzB9i6zUA58ZjclnWCHwkCVa1nCwVP2vm5VLNqEABGC
         3YnTs0ZStbpvmovm0PNgNC1tMhVeQITOLxtNOE9yB/Ah4KjmihWY/y95HWubLCnxKDsO
         PwoA==
X-Gm-Message-State: AOJu0YxDUo2OYnv8hNz+Ijj4NnXQDt8t4K7I+UQ6v9qvRPRi3lUIhsMd
	K8fi85CK4egFF6zK6MH+Fnj9oHAn9UnO+YcSwe7IU38lrW5Tsiri04S/AL74p5K1CFE+FFOSEaP
	+wAFRhpqh873UIDSLR0TTLM16SLXXBw==
X-Google-Smtp-Source: AGHT+IEEELW0qaqqlqFVfOS5CYWBUdokWKuGUEFzWi0kLSoUmSi9Ym9DYtJ924XbyC9jfSrc59U7ter87H1TIEy2cp0=
X-Received: by 2002:a05:6902:1549:b0:e12:aacb:e534 with SMTP id
 3f1490d57ef6-e1d349e007fmr16635704276.45.1725978048768; Tue, 10 Sep 2024
 07:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_hTi0gWX_9xK3ycbqNpwbovJdhFaDoojn-NEUJ8ivn4Q@mail.gmail.com>
In-Reply-To: <CANzUK5_hTi0gWX_9xK3ycbqNpwbovJdhFaDoojn-NEUJ8ivn4Q@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Tue, 10 Sep 2024 19:50:12 +0530
Message-ID: <CANzUK5-03uO95UFwh-oGO8=_L=GryOVPsCVT_myUfqNWW3KraA@mail.gmail.com>
Subject: Re: IRQ-CPU affinity for AF_XDP TX?
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> For AF_XDP (in ZC or copy mode), the IRQ-CPU affinity plays a role in
> the RX direction to bind a CPU core to a particular NIC queue (mapping
> the CPU core to the NIC queue's IRQ).
>
> My question is does the IRQ or IRQ-CPU affinity play any role in the
> TX direction?
>
> An xsk is specific to a NIC queue and assuming there is only one core
> doing TX on that xsk, is there some IRQ/CPU configuration recommended
> for better performance?
>
> Does the recommendation change if busy-polling mode is used or not
> used? ZC or non-ZC?

Any advice or recommendation about IRQ-CPU affinity or usage for AF_XDP TX path?

Srivats

