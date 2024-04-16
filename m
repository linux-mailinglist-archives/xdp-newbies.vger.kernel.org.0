Return-Path: <xdp-newbies+bounces-63-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4728A698C
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 Apr 2024 13:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAE951C20FE7
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 Apr 2024 11:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF03128396;
	Tue, 16 Apr 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODB3fJFD"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188C112883A
	for <xdp-newbies@vger.kernel.org>; Tue, 16 Apr 2024 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713266622; cv=none; b=UmtTq0qm4iVjwyrHjfwD45p+IA+1bJ81QLABHfW8YUHMcwvBI6hz7mDsMO2nOXGC2uNw9XUcslWi1o/TAvldiNfg9vP2/IYMan+bwxdAMRxuD1jJXIsIaKyjb1sCsMTbrRG5uycvbm8cFWvG0piqg1abMe66ugtqX+GSUif2ZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713266622; c=relaxed/simple;
	bh=m9Xm2jW01C34MhX58dEl20XRlfsnzetxl2Gb1elFe1o=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=mHHj4JkMg6wx2zl2dUCxzrKqA4JejMU9njI5//0VR83fJ9RLcoMDbDlTMb9/jmNjRZleJ8ShtN0s523+tcUwyXQHe+hwxgjY0Z8Sk/MSZLxIqpIhlalnAeXgYPIeiuXmvpuIThdOtYbPoQStmJ/zvT2gTfsNRjv2AYFNrhyaueU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODB3fJFD; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so23954955e9.0
        for <xdp-newbies@vger.kernel.org>; Tue, 16 Apr 2024 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713266619; x=1713871419; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoyxhd+VEJWGjVBlmhS6rkWnZPWCZYDIpEixQQbgbZk=;
        b=ODB3fJFD3653HybFfLDrh9ORfYdD667glrgqFyNcYJKBAVNiW01uuMM2Tzr10lqJcI
         hBJAGbpIcgsdxb4Q3MQeH0UBF0i9Na6G7eD7PYWRa05SfdP404QRom9HNwLUgKE1taPY
         5lzIIEAkISzX+wpSGhwavMPkDinpmlNAnC+Lx76aZ3tPMHbgzkAXK1hWE8T98btGMbkB
         s3hBB6YDEhw456r5X/TFtzCCs00dJagRG/oX7+TLFkIzr2DhktSYr6BQQ2AH94l4Yvat
         0hm2i8eEsehF7co9ECPoyHaLV410wYHwKrAUoCScbD/mzb+q5C+80gSUmswdYBhwVKYl
         /+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713266619; x=1713871419;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zoyxhd+VEJWGjVBlmhS6rkWnZPWCZYDIpEixQQbgbZk=;
        b=koqvKXie2uMQuKuTz8TlJCTQq8nnrIOXKkYA9TNDOMGHOkj2WLZImx+kzZuq9oKNHH
         4XFmVP/NtTyiw90aS8LJmvsgIyxbC6yAF050DR6992liF3aAJmgE1Kz3HrG91oUmMYeQ
         0olUZlnhJZzQyhGxeWiYc7qNoR7EtVhusAiVxosA26IJ71HYkBono93bkXWHrABSo7Hy
         uK3C4qkA1jjppvpg5xoTTPixcQjTBhBBtgx754DFEFODCfGu7N6EzZwrFr7VGvD83tId
         Fz9vkfhaWsrMxUlogh3l9B5AX1FBfAiz/wL6pZJA6mvVXUsAt4kPX0nZ3MhjF2+/mJKE
         IzHA==
X-Forwarded-Encrypted: i=1; AJvYcCXYtYHN7f70iJEBMyV8Rtt1Lvk8vF1zPrt0HjSdFuaP/WCb5OXE30XYmD8Vo6g53McH+k6ItzE2Ltwq/8nX8LKM6iuQnYvRNl0d9I4=
X-Gm-Message-State: AOJu0YzP/vs0sgizRCKS3kx/wTKKbnlEjP3TnJ6KuCo7qDZDzxARd9VU
	L3CzcLiWXzfOJaiH22T26IbCq39yxWMVKkw5l2u/Qz4cvcEte0QT4kq9jWT0
X-Google-Smtp-Source: AGHT+IGK52dBcnVQjQWZgjWMfTLjxEl99gwlgmJRX0hYMvMP5WxvSap+Xecrtuq6uALRnMC9zm7k2Q==
X-Received: by 2002:a7b:c3d6:0:b0:418:91ae:befc with SMTP id t22-20020a7bc3d6000000b0041891aebefcmr1544870wmj.0.1713266619172;
        Tue, 16 Apr 2024 04:23:39 -0700 (PDT)
Received: from localhost ([45.130.85.5])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b0041816c3049csm13978071wmq.11.2024.04.16.04.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 04:23:38 -0700 (PDT)
Message-ID: <1ab45503-e774-4227-92fb-5d30d9e7c156@gmail.com>
Date: Tue, 16 Apr 2024 13:23:27 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: jbrouer@redhat.com, xdp-newbies@vger.kernel.org
From: Leone Fernando <leone4fernando@gmail.com>
Subject: Benchmarking Routing in Real Life Workloads
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone!

We encountered slowdowns in routing, and implemented a simple cache 
to speed it up: 
https://lore.kernel.org/netdev/20240307171202.232684-1-leone4fernando@gmail.com/ 
Our patch shows considerable improvement in our use-case (hundreds 
of daddrs), and non-negligible improvement in other scenarios as well. 
We received some pushback from the kernel community claiming this 
improvement is modest in real-life scenarios.

We measured our changes using udp floods with different numbers of 
daddrs. The benchmarking setup is comprised of 3 machines: a sender,
a forwarder and a receiver. We measured the PPS received by the receiver 
as the forwarder was running either the mainline kernel or the patched 
kernel, comparing the results.

Does anyone have a good idea for more accurate benchmarking methods?

