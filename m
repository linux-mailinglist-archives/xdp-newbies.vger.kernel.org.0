Return-Path: <xdp-newbies+bounces-121-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E8934C35
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 13:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7011281D63
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 11:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DFB823C8;
	Thu, 18 Jul 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0Jyqiq3"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7709639
	for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721300874; cv=none; b=e6/NuL7bu27FxFKKxw/1bwfNQOZT9TriFDBYz7JwReXqnu0Wh0Yvws0uWc9Lo4lh9bFV9NNJyu6nJPY4o/vtlI13HhYtxO1unSIcl2Eom/yhnjelXcTG0WZfnk5kTULD/3m0ZGnpPI1j5jVorwEIF4jfsjavHTHVxj+0rIVbpRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721300874; c=relaxed/simple;
	bh=qeFJFGXyLPTS8PDPwXIFP6ysz5EVPwD1mzjTcwHokTo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=py3mwKVB0nEs43ZSUd0zN3xY3qOTLbE70dDMl5AahMz2oQxK5ZT5SYsBLUfOq49lcgBYZB4dsDYnB3EWFswPAMbY+HC3MkmjCzEZQg0nJkTi0f8haVDWAkYRuhM9tuGdR1HotRwbktS2Ceozwbzy50IRmnhGjsSRqI5TJ2MYJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0Jyqiq3; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-664ccd158b0so6473507b3.1
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721300871; x=1721905671; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qeFJFGXyLPTS8PDPwXIFP6ysz5EVPwD1mzjTcwHokTo=;
        b=Q0Jyqiq34DCLbe+1JxM196NTVTLCG+ktkT3aC+Pen/EmHY1SbwlwCWNp3CCzYIBWl4
         uC6ll51izYS4864vf/0f9CA74PeXpA/dmZy9yh+JnPuFgsKClCzxjQpX543YSFdZI66O
         3dLijntNeLOeaHjjvZ6fntLIrjTiUf+HU26lBbIYmbMu8reyVoHwKeSKqByc5w4JJ9Vu
         tY2Rr6rQ7CsKO1kHymNc0TgdmQkJCh/n57j/IpA841KAC42p/ejtiDludi1FmdUpLg2q
         VjWAAXNy/sO07wknA8Yfu2Z9/VbW4WD2h2gSoh+sPij6s+CDfbyXIGr7koBbDcOfksg1
         85Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721300871; x=1721905671;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qeFJFGXyLPTS8PDPwXIFP6ysz5EVPwD1mzjTcwHokTo=;
        b=pGKae+LUysYe7v5hJqTP4mYOYih5AOb0uE/0GpWYcDWsXO2sencr+41r8idL9NAvpM
         N3w+ARkFziAD3Du/4N8r1LOFkSo7lMQ4etycLMC0z6PRPXTA1hM0waxEPNsIiYfJ6FDL
         b16NRLPe8EPQD4bf5W9A8rhf4GjwzF/oJXksIXbvCzi0RyLtGFkJqeIyrwoldj8DMbag
         Jm/GFIBAaCCLqvU1rD7DWLLpusvyn5Zh6F0jVRMmZ7ua6s6pYiyJiYDhO4ZCSULGsD+O
         SWCYhuWts79zCXlZuNPiaYxRkmbkrQIVxWJGBedSqAoPfcmAvZe/3yYOoFrfBwSD6JMK
         W3gw==
X-Gm-Message-State: AOJu0YzBI8gdtDZTiLtY9tvxRjElCb+8XCfgT1GMMPWVc9cgDTegWVPZ
	PAEB/gM5yByvb6E+zkAeteEXk7+9ORxmFBxClHDTDIsmpn0+b6X5eapyPiFy0VuvzcCkSM3fLlm
	8Gd6lKv9oihiXfZ4Vn5jm5SZSq3Q4fBpJggI=
X-Google-Smtp-Source: AGHT+IEk8iCifbvX5pAAv7I7CBMRC7F10QbVRgHJIgGiDKceVIBnG5WCnlfrAn4NyGml6ysvQah8rLaEyNpapvsSvkw=
X-Received: by 2002:a81:9210:0:b0:643:aef1:fb9d with SMTP id
 00721157ae682-664fe35ca93mr53692707b3.4.1721300871469; Thu, 18 Jul 2024
 04:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Thu, 18 Jul 2024 16:37:16 +0530
Message-ID: <CANzUK5-QifcmKg+dZSdKsJXvKCb92DHEeb=BArpfn1o7MCXcEQ@mail.gmail.com>
Subject: BTF without DWARF
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm updating my AF_XDP app from using a very old libbpf v0.1.1 to
libxdp v1.2.0 (the last libxdp version that supported clang/llvm 10
included in Ubuntu 20.04).

I've changed my XDP program .c code to use BTF maps as required.
However, it looks like to generate them I need to add '-g' to clang
which includes generic DWARF debug info as well.

Is there a way to generate just the BTF info without dwarf while
compiling the XDP ebpf program .c code?

Thanks in advance,
Srivats

