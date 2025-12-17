Return-Path: <xdp-newbies+bounces-194-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F6CC9D38
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Dec 2025 00:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F23F33038CE5
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Dec 2025 23:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A2A25333F;
	Wed, 17 Dec 2025 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b="QBGbFUeN"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A55026B777
	for <xdp-newbies@vger.kernel.org>; Wed, 17 Dec 2025 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766015766; cv=none; b=HfmccVxzvfhqZDKe8DfCx5M+opTutA+PJrj8oDOJhj2ZaRYd/p05H1Si/sOjOtOuEqswJXOgUe1nssqKodfUX6I7bMNGS/EATX9Z6YgmuLz/+MBwJGDp0XDwnmkcaASgNxoa0n/1WeoClK2zVF8vm+gFycWc7Hr2QnwE+7SYDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766015766; c=relaxed/simple;
	bh=Iw3BT2KPuFoieBxCzQP0XeNldgaH1gy1274aBL+2Sks=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kA14BkfmYXHOaKkPw03X3Uy7yAdt1IcWCgXIuyYMu5kITbRD8nB+wZGsk/1RPcbbj6haiYP4Uv0W2Gw5OTre/v/W+JQzkqmy7J44mHi7vZR+s6FwMWMn7r/vxePw+AeXJ2ErmseAoZH5mRcUwAzBqrur2zu52DciUSSYgf03ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com; spf=pass smtp.mailfrom=riotgames.com; dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b=QBGbFUeN; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riotgames.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-644715aad1aso74361d50.0
        for <xdp-newbies@vger.kernel.org>; Wed, 17 Dec 2025 15:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames; t=1766015763; x=1766620563; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iw3BT2KPuFoieBxCzQP0XeNldgaH1gy1274aBL+2Sks=;
        b=QBGbFUeNlmSQRJKoCzBuGQYkFRVLRTyAF5W3zn1iZPoZkprV1e+XKEl7Fp/EfKTb0F
         Ybm6WwYXQVz5LkSxU2n5UYQqxFWRsDpXcZhGsJP2urEvPJV7XySOw4cjHbik562ECL31
         xqpFt40Stl8YmIlG2YoJosB4OVoggOZ/SXr/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766015763; x=1766620563;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw3BT2KPuFoieBxCzQP0XeNldgaH1gy1274aBL+2Sks=;
        b=KpxHAtS0m25wMiRPXfSNr/t6YIUuoPGtmrpkuchRfBh4lwp5wVPd0NUukLzSH9q685
         YlM0VmYbuMo2wWkegGJ61znAJ4A+3hmFZzt9oSzXdTxecT2A2m2mcQDbVqAxb1E9iKD+
         Yp6T/jrnEANelQG4Rup2Q9nw+x5GdvxDI4QZ85OT8Yq5//1R/dYMB1iOTd4BgyhWj2gA
         fwVdsjYWuelVJNSok2N4fQed/om3fXwfxZOHkv5wSV/d/4uwYQvDFy3o0LEq/YkWsFJO
         UzD1mzZZDV20Ro018eiAsvRjiu3UPetS5oQC/ZRW3DsFgYffQfIpYDDK9bR6znHR9zPW
         Rb4w==
X-Gm-Message-State: AOJu0YxupztO/KHYB4nKjHrgjct3RwwY7S3YyquW7RJXbTc+txcJ05Yf
	wlJuXxFo+ndTg+14VtcQ8cddihvxhKp1kwU/SJJVhsZ7BU4J+3Hi5bx8PvUQy1mm176KTJ5J5Vs
	ndyqA9hnltuh4KUjzSDgI81ppwOwNMsUwSOxwDWRQ3dKdujQ1ofA2YnA=
X-Gm-Gg: AY/fxX6/gixSYyQbJ8lLgRvv5zkeOXkswVmQ0QoF4nSNcgECI8gUGXu4jyKqD33Mhz+
	OOn5JAcnfDpF/Zdc5E/Sue/8Uv150r3LeFvDBh8ppCgwBYaOTAb6hGcurL9quM9SPAS9gTBangJ
	oM5d7MvLyW3lqrJ+vTAdEAPv+UOzOgoBKCk6/w+Ce3dB1uGKuoEWb1iz/973gpB0pAlsNwOnFYr
	ZvLFZS6Vcydu2lgX45Lw5tRq/kFMRkFtDmNibH7dbu1lUcd0mGnkMTS7wJNgnAatye9CWgRVA==
X-Google-Smtp-Source: AGHT+IFwvbPJg2iZLt5uBTeUV5oXssS7sR2Gt0ri1d5D5dLZQIP9IUDmXrpcva+V+YS+SRd0FfFuksIrNDOGI1Qj89I=
X-Received: by 2002:a05:690e:2519:10b0:641:f5bc:6930 with SMTP id
 956f58d0204a3-646632e007bmr807770d50.41.1766015763114; Wed, 17 Dec 2025
 15:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Cody Haas <chaas@riotgames.com>
Date: Wed, 17 Dec 2025 15:55:52 -0800
X-Gm-Features: AQt7F2rlX3phzneD_MTTA_EKi6ITXsl_ikvNJHzdUMQEPLDohNVxxwP8aOYhI-4
Message-ID: <CAH7f-U+6xApKEYe5t2W=P49Jftc0C+p8d2qrXnOxxgfWZN7p3w@mail.gmail.com>
Subject: Is it possible to load an freplace program using bpftool?
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey everyone,

Does anyone if it is possible to load a ebpf program that's an freplace type
using bpftool?

For context, we have several developers who are learning eBPF on our team. One
of them sent me a code snippet that results in an error from our loader. Our
loader uses cilium/ebpf. The error message does not appear to be a verifier
error, so I wanted to see if bpftool has issues loading the program, however,
I'm struggling to get bpftool to load the it.

Thanks,

Cody

