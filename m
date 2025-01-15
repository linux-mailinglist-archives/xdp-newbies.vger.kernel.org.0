Return-Path: <xdp-newbies+bounces-172-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D97A12CFE
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 21:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78881657DB
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 20:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5B01DA309;
	Wed, 15 Jan 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b="IW54zhrU"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A81D8DEE
	for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2025 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736974325; cv=none; b=ZP+d6VBhjVhl26Hx6oZ+gszXAFjIdoqEiU03tjQomnZ5q4/68O2HyL+Q9S3mBeVumkSzvZgUbY1XHn0dWEe/7d5JhabOiZEXlvLU4nB1I2QEDjaSqXzqjM/JkslIfcnFwxwt20PNZctHOTookbRAKhPso7eZkD+B29+nPxW+A08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736974325; c=relaxed/simple;
	bh=x0WSW78mTQxVmSBtV3rIpSa8p3QhaLO1ZqXd6gz070Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HUMbddcQJoIkm6QH8tI3uoVSgsw7cleoffPD8vFPTaT5uDnQnOuXYx121e2aAe8FraLFqre07WeBqTqvbedFHkmQ9IBPdBMJ6Jkp7ktlvC0qrrmI7n7GPp9K3uE7vJQKk8IsMk3pSdyhXx4TyVAR2/0VZYXfICmPSY/RZIi5oOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com; spf=pass smtp.mailfrom=riotgames.com; dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b=IW54zhrU; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riotgames.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso97205241.0
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2025 12:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames; t=1736974322; x=1737579122; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L1Rtvhw2198Uqs95STUbmB4J9+aMMklmbglagz2uVgs=;
        b=IW54zhrUBDTiQfuhDXt0U4RXmeseBMRHmKBa/ttyGD4VoqK2hnSDTMqlY00gJfuqKO
         xVldJz5l0CD6UR0mhl+3/fRpzwRGTU0U7LUr+Ylxh7Oj+eyToiLFGNXYqtXvIUsldT8+
         kwQI9pqRe6qr9Tu22MJChRqRLCN6Omrl3V+U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974322; x=1737579122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1Rtvhw2198Uqs95STUbmB4J9+aMMklmbglagz2uVgs=;
        b=aciht/Eo2v1gN2LO1JAAgO/KpeiEyYd//iKd9pD0ZNdtF7AWIKRDFr3o3RMVLSnKng
         AkhxYcFhgiMDlYexZCHeVBWeS1qjBt+/ygK6tp9ewZGmcp0SH/B2kZqkrl+ZjzYDlY+N
         3FNKz+NEiaYDK7nMlOO0Bql/5E24AQH5wnhSPoTdW9kMAfJ7ONR4qbPjtS2jXFiHdC40
         Mn1Dh65jXrX9PHdxz72J8mJgZJ8hWeEPcq3/VCrXQJeaOM6RCqEUrv7T7z3DH/LBfMuj
         M9ZebPLS6k4J6iv2t2guIxo0RHBEqIyPoIOfVaHj7tHdea2o/Cp/CT3UwMt8Gduodl+O
         31fw==
X-Gm-Message-State: AOJu0YxYJSu8E0ekAGFKdWm1hAblbYh7zRnmYVGsynXc8v32d5i75ekY
	6mNqv4l9jt4rZHfz3HTdIbeOIxbEzP26husnv4oZIQvRbzlMR+pqyRxafifoovPyVy840u6/v9t
	0Mdj1+2VQdedKc4gYdFquyJ2MFvdB3Q7w6Q5sHrYjtmDFoJ0/1Zc=
X-Gm-Gg: ASbGncv5WVPYjgW2o+S1iQqnmMac4pEve1DgDlYnuLz8WbwqgM/uAmVgm1Vh2ffKayP
	dBAJodzegvVx7oPowiQbn3YSHy6taZ3crCCuWA/xr
X-Google-Smtp-Source: AGHT+IFcQRpTsk8wD5G0FazeuMvLBLmB7oOs/0xv3TUoahrtyhCb+P8V1maZ8u9CXNUwJMn3X0yeA6wA/mKvQIdR9eQ=
X-Received: by 2002:a05:6102:50a8:b0:4b6:37c5:c3fe with SMTP id
 ada2fe7eead31-4b637c5c61cmr15405747137.17.1736974322534; Wed, 15 Jan 2025
 12:52:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Cody Haas <chaas@riotgames.com>
Date: Wed, 15 Jan 2025 12:51:51 -0800
X-Gm-Features: AbW1kvaf103JRWyw0d0g9PvBfIEjA7Qc5_bRec53KNWciBL09ZYlNnBtxRQdC4Y
Message-ID: <CAH7f-ULFTwKdoH_t2SFc5rWCVYLEg-14d1fBYWH2eekudsnTRg@mail.gmail.com>
Subject: Race Condition between BPF_MAP_UPDATE_ELEM and BPF_MAP_LOOKUP_ELEM
 for BPF_MAP_TYPE_HASH_OF_MAPS?
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey everyone,

I've got a question. I've got an eBPF map that's a
BPF_MAP_TYPE_HASH_OF_MAPS where user space updates elements in the
map, user space will create a new inner map to do map-in-map swapping
in order to update the outer map's values.  My XDP program will then
read the inner maps by using BPF_MAP_LOOKUP_ELEM on the outer map.
Does this create a potential race condition between
BPF_MAP_LOOKUP_ELEM and BPF_MAP_UPDATE_ELEM when one thread is trying
to lookup an existing element while another thread is trying to update
the same existing element? I'm expecting to see either the old value
or the new value, however I'm occasionally seeing the element does not
exist when looking up the element from the eBPF program. Is this
expected?

Thanks,

Cody Haas

