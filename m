Return-Path: <xdp-newbies+bounces-126-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A4D93A9D0
	for <lists+xdp-newbies@lfdr.de>; Wed, 24 Jul 2024 01:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719701F231DB
	for <lists+xdp-newbies@lfdr.de>; Tue, 23 Jul 2024 23:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C3A14900B;
	Tue, 23 Jul 2024 23:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1QqeAJG"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810428E8
	for <xdp-newbies@vger.kernel.org>; Tue, 23 Jul 2024 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721777307; cv=none; b=MtVoH4inKwFiNm/8ybimfjtxOyJecpCdWnbE64iFvwE45f3LpCTh8lYocSx32mjFz1VjpFDrPuh96U6s+ZvmZtOL39Gg+vraeEJn4lkUgc7pdwXBRiJHN/F2INfTguDaIoJVvrZEAIQiytC7Jw/3clwWzrESU1jZ9NbqxAvHJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721777307; c=relaxed/simple;
	bh=RQE4s4ftuwfkrCQcy3vVsPXqctaI4vntHXZwQD8a7IQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m4jBhzdqyu/wP5lICuF0weNn4No8DKAwObfYK6IMxNfgJbTTZhvgoITWVM/OhRxbrGxydBWFthmr+4cOyHO31AOrRbiZTPZMm/qtlO+MbRgWa3NN01laWOZ+iBr/2CvuKO9gVGIFvYr6NVXe9aiL8EE/3F9gPqUc9re98PP/NvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1QqeAJG; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so6303900a12.3
        for <xdp-newbies@vger.kernel.org>; Tue, 23 Jul 2024 16:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721777304; x=1722382104; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RQE4s4ftuwfkrCQcy3vVsPXqctaI4vntHXZwQD8a7IQ=;
        b=M1QqeAJG7etlGfYwWFgib0vq1Zlkw4GKwppY5lAgs18gWPhgnI+9/6+VV1cLMbR24M
         7O+IrNJxq50SydYnJY/Atg89txXG7o//ApDkwaigwyeVf6x9qm8uO9u9eAmepODMZ105
         mgsS4opdJ9mXXgdtQVh61JQQk8t+FDK1PCPvIWnr6tJIic6wOwm4P3dI5wMjSPryLGhO
         U7vESkyfDBlXtfYOz+RUuqqhpH0itT+KCjpKSuBBryjTt2ewS5hdTRQ07SCaM0V1/qof
         Iq3IP51al+3c+oe0JHcqYAnYH+8ngIlTswe+j+QH5pOF71G9xQaFnVs0L1uUM4lmg7tx
         6onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721777304; x=1722382104;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQE4s4ftuwfkrCQcy3vVsPXqctaI4vntHXZwQD8a7IQ=;
        b=tEMpjMtiGYrUHLM96r5aJJiYRdD/IzLGoknmnumYbuQT352/hG+RDFYRD0fMKfx05F
         WM9YqYmCFmodTGo/RrXv4YixzyZ9T6Pj3GrwSGhDMwyPnK5fEBk0fifioYQ8lQ7JSQQG
         Vg7Hk8Lc9dBsZMKu1jkyjOInUpacaqQxvjgW+dFDyRz+UYXy2sdna/om0E75BoO7AKmK
         Qly74rQFXTo5i3TRkhC95NF3ZuMPlJJCll2k3JOcCjGO6+/zFsGDunuYf2Qwr8dfeY8F
         AGLEX23v2aTtAwbCnHxiihjWbInjmmD1u+owuPZr6im4Q8gD3+rfHmws8i6v08KBOMke
         yp0Q==
X-Gm-Message-State: AOJu0Yy7ngQZ6+yuGynudUauUFE/F/yx+dMqLyS2BXFdAiLTQwdYA3v6
	lNhLTzLw7n1q27XAcPusuKAyGuHyiRn4tHQPlstDntbWd2qcXfM+KAoYhEnDOnFmSAD3+mSAsfe
	g2sywv66C+v+l4XhUbZGc+Lhw+vOSE4zJ
X-Google-Smtp-Source: AGHT+IGYJ9VvtlTvreV2F+Z9L6eJaByS3IUBFJwY9o0Ut3auQgIW4/C7DGGKu81OO0RBO9FsQ+VSqbmwhPpHGC/RV78=
X-Received: by 2002:a05:6402:430b:b0:5a2:3453:aaf2 with SMTP id
 4fb4d7f45d1cf-5aaec85d8bbmr378005a12.10.1721777303586; Tue, 23 Jul 2024
 16:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ben LaGreca <benlagreca02@gmail.com>
Date: Tue, 23 Jul 2024 19:28:12 -0400
Message-ID: <CAB6C9b_vR171Jwx=CT_-PVLy9Gt-tuy6P3_UZK1Pm_487uwJeQ@mail.gmail.com>
Subject: recvmsg on AF_XDP
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Is it possible to use recvmsg/read on an AF_XDP socket? I've been able
to set up a socket, write an XDP program, and properly receive frames
in UMEM with the RX and Fill rings, but am more interested in using
standard linux C functions. Some libxdp documentation mentions the use
of poll and sendto/recvmsg, and I have successfully polled the socket
(as one would a normal AF_INET socket), but can't find documentation
on clearing the revents status after a poll. Any help or redirection
to documentation would be appreciated.

-- Ben LaGreca

