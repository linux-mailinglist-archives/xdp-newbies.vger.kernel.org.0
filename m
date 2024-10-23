Return-Path: <xdp-newbies+bounces-151-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD019AC97E
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 13:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7E52828C9
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4671AAE37;
	Wed, 23 Oct 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUt5e0Io"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448B49652
	for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729684472; cv=none; b=ObCXLe6dBiEXJzzdxyh1V71MMTfPQVu1BUrzUkXhG9k8fvG4N2PQMdhxocJMPsJSzhs2coGhtrsrbnnJNDsSUETSYoertTvXkftvzzUOEM+pONt8R6rsgrjTLFu7KE+AclqFB4JWiHqMIzd+sNeJ7ZyWax2LCyhAlc3HqMeKg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729684472; c=relaxed/simple;
	bh=ZMA9cbSnnimG5yWL/mDDqK61nYcPmXT48OZcGkY91nc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=qvS41VFzdJ1/ntlgtyiyA4R4oREpm1HQOu4pOk585X+jFFJcaok5Q3UBdbILDPHLrEKny4hlnEK1+4gOM/2Nabv8SNxZYG47M4ViQdzYeL5CX95fchQ1SofdvhYlQAUA1sAPsa6kXnMTnRW9o4QwiL5FsZJymp2yGQxwXbFGBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUt5e0Io; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so72137761fa.3
        for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684469; x=1730289269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gcqqxc2cGEFqy3mPEGgaWUKfH5ABPrQaRJFwXXjGifw=;
        b=UUt5e0IoIpdjLqJaU05/bbK4CmYYbgNbg0eosBH4mW0kDP2T3XOK7n2vE7pCGn/War
         DTqfXqth4AknL04n/BzUz+r74fh+T9KTyFa0gfYiOoXM0CRh3Dkriee5k7GYMyU4XdUw
         e0Niz7PpfcIAqlIjuWvbqRfnOfk3nyBENI5sAAsFlDxUyv2qAWjAiujixL8rpxLJwC/X
         ZkrCKI7W/d6LcKBCVTUP/EtnEYjAePps8PfeHLKyzl4q1kDlOIM8rekhhEUPry5MbGel
         xksm48sc3jCzeirmNdYBSKknDECyfe2V+fEGBA++xK6+pE8hCSDo/yi7x5UfyX2w4TM4
         V+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684469; x=1730289269;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gcqqxc2cGEFqy3mPEGgaWUKfH5ABPrQaRJFwXXjGifw=;
        b=vA30JJqNyVSHEynpYhq0z6bwMpLhqY9yKWDMnNm/bY4gBlwZnqBd0g9m2sEbLh2FxY
         flGuCCEvd8Ct80zbD4c5C2CF0mwqjpDVscAD0TWNkxeMWiJD+XQTQCJaoYov9+T5QG5E
         cxgKCWeicpzmQtcPQZ8R5LAbPF5VwMorAW+VeuuQ6Id7lGxnz2wXxZAHhHXllrV/626R
         9PjyUVLHEGau5GG9Ct3NATwH/30AT8/zexikM75tVSlWmfNqNbdKJBMocrM+TVinZ4fg
         RQrtCsbMZb+wBC28tybUZGJLvvTbWDxcHEH9efx0nFHHtR0wxyI1lAxvLpFnIWpkEUvz
         dosg==
X-Gm-Message-State: AOJu0YwRxDeMwu3I/YosdmmULKvLksAs2QrTrljAY1tQLgeDqi9OyOXN
	UWjwmdmkytotXAP0piKL/Kfp3yLedxAbxyHpv6d4L0hcnFP37oUPzg9Acg==
X-Google-Smtp-Source: AGHT+IHt20QjnkJCuFF7EvTH8UFkuq2fytShbz1D+iU2UUiz0sQe+Wu1STZpmlQJ7CnTimWeBA0/RA==
X-Received: by 2002:a2e:bc1d:0:b0:2fa:d723:efba with SMTP id 38308e7fff4ca-2fc9d2e4e00mr12741061fa.8.1729684468749;
        Wed, 23 Oct 2024 04:54:28 -0700 (PDT)
Received: from nuclight.lan ([37.204.254.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9adf8295sm10700501fa.79.2024.10.23.04.54.28
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:54:28 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:54:26 +0300
From: Vadim Goncharov <vadimnuclight@gmail.com>
To: xdp-newbies@vger.kernel.org
Subject: XDP/eBPF map thread safety in kernel (e.g. lookup/delete)
Message-ID: <20241023145426.210fce4d@nuclight.lan>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; amd64-portbld-freebsd12.4)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Where to find exact documentation about what happens in kernel BPF
helpers calls with respect to locking? For example, I have
`bpf_map_lookup_elem()` in one thread, then work on pointer, and at this
time, another thread does `bpf_map_delete_elem()` for exactly same key.
What happens to memory the first thread still continue to work on? Is
it now dangling pointer to nowhere?

In my particular case it's a bpf_timer callback who does
`bpf_map_delete_elem()`. I'd prefer for it to not delete entry if
another thread did `lookup` and works already, is it possible to do so
(in a performant way)?

-- 
WBR, @nuclight

