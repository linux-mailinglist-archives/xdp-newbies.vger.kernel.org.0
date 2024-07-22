Return-Path: <xdp-newbies+bounces-125-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40F938C93
	for <lists+xdp-newbies@lfdr.de>; Mon, 22 Jul 2024 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F22E1C216C7
	for <lists+xdp-newbies@lfdr.de>; Mon, 22 Jul 2024 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BFC16D4FE;
	Mon, 22 Jul 2024 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtNM9znl"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7B16D4F5
	for <xdp-newbies@vger.kernel.org>; Mon, 22 Jul 2024 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641543; cv=none; b=iqZQZX+ulVSKtwyWTwzujOGSplA5anXV6TvYihasnpJDJkVelZPzdrr9JqdFkqSfPsTPFQPYe9kffX62KKFhwa8vTCPbowcrAkfiJykrU1pIwT5eFkNIZSGqJgRDfsm0VCnzdyX9cGItkXpoy/EO6T5P1mVTZTtn33oDn6JuQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641543; c=relaxed/simple;
	bh=emZqQTa1ijddaAXDX8To5sTpB7IcDyNP9VbEZ2fhMcI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FUil50wv6naxxzCGMAD3H7xSEfmSKa1r7KCCR6sRWR7zCdAdfuAbdFoiCibbdT/igQwivGCCfDZc9I3Z53aW7NFmairhh6tVzUIiVVh/2jhBXBN8txOsqaPHW75F6XdKnKBLj+Fr27nH/pt0EYcCYxxp1I60vWOaARCK/3U1rGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtNM9znl; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d9c4887533so2146042b6e.2
        for <xdp-newbies@vger.kernel.org>; Mon, 22 Jul 2024 02:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641540; x=1722246340; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QkmsGVWcsFj74VlVPYP2XJXoOFQQha+evDgHD66lyrw=;
        b=ZtNM9znlNzt+z6khyWFWyRusuWC64JTJ5y7h9W/swvpiri3I45ghbDIt9Rsw3wSgRg
         DnVZzs8lhoJI1lGpaJzxuHmbm7din96204lNKscOTbhX0apgsR35yZmpDze2K0+EPnjm
         Mx/JAbOYtmQPi1/aIgiEJq0rnXh2otqrwPQzggnAzBnrxMTTTEc51oHaKo9IsbKDzqMc
         FLU95JtW06tFocgwHsNZTaPtQF/c1qIYqNnlD1HEx/w06oIcNYUVyqgbDoe/hpzzi+eB
         66K6uDzXsPLs4y9eZi9xofLb33PjesIvqXxyEhJQHUuORA3itswiN+Xg96obJLO1c1Hk
         Ya7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641540; x=1722246340;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkmsGVWcsFj74VlVPYP2XJXoOFQQha+evDgHD66lyrw=;
        b=q8p2//CXMa8EvW3tOCtvfPDNnd3MYgEJJ5viydUFV4B4nl1DJO+CNUc4W/zfV+XNGb
         aVp26IHP1zjQME+v2S9S+DZsTGKXVTa01v22olX91wl79ycrpFUt1Cg1yMD2HchNn9Xx
         aBxpmA0ae4VoJ6ueS38oHZ/yulSnQpukMF+ytEAszw/qFYaA2l7hc4crskpfEYz3T1mK
         N4s07wb7oweDvCTh0jOntnj1pFWm5a13ZYcNDvsOL2UyN+AsAtorIQ1MY5eDT/UCxDTW
         AhatzQPKkR7QVsxF4zi7REVRu8lwnFjIGF4vT2r2iFmeGYfYexfRZGlUNso6Y/ulbxaA
         hsxQ==
X-Gm-Message-State: AOJu0Yw7HTFLqdxFAmIdcwo/FY9P5Yr6e8lj62VDUNxFvnXe1Uvtp+ZO
	HsJiaGpjSemxdrA2KjptN7XDMXXo/HACD914CAohjBkTgxpLhJRZh3I2WGZ+oS+fG3K0Co2iiPL
	3agkFAL++GzIrSurcmy4Tx8b1oOtQoZvH0w==
X-Google-Smtp-Source: AGHT+IGxO5XoxZeZ+MSYaBU69t15lQum7dTK84z213pQofQ65Lmh7zHAzu7H1iaNkPJEiPRlrEKiQEpJZGsZAok63II=
X-Received: by 2002:a05:6808:1789:b0:3d9:3e48:8af7 with SMTP id
 5614622812f47-3dae6027661mr9801413b6e.40.1721641540576; Mon, 22 Jul 2024
 02:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: cass wang <wkgcass@gmail.com>
Date: Mon, 22 Jul 2024 17:45:29 +0800
Message-ID: <CAEXf7PBMa1z7DyLkbwQ5BwsLhZOVkHzKNEV_gZBnA9Zvyw9FxA@mail.gmail.com>
Subject: Questions about AF_XDP checksum offloading
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a few questions about the AF_XDP TX checksum offloading.
Please let me throw my questions first, and I'll provide more info:

1. Is it possible that `xsk_tx_metadata` is not aligned to 8?
2. If it is possible, then: is it ok when running on a non x86 platform?
3. Does checksum offload always work when using SKB mode (except for virtio)?

Here's what I think I've found:

I read the kernel doc `xsk-tx-metadata.html`, it says that the kernel will
> use `xdp_desc->addr - tx_metadata_len` to locate the `xsk_tx_metadata`.
And the v6.8 kernel code can confirm that.

However, since `desc->addr` is provided by a user program, a user may set the
addr to a non-8-bytes-aligned address, and this is likely to happen, when user
removes the vlan tag from the packet, or encaps the packet into vxlan, etc...

As a result, the `xsk_tx_metadata` may not be properly aligned.
                        ==> Question 1

However, some platforms don't support unaligned access, so I'm wondering
whether this could cause a problem or even a panic.
                             ==> Question 2

I can see that the bfp helper function `bpf_xdp_adjust_meta` checks alignment
after setting the meta pointer, but it seems to be missing on AF_XDP datapath?
(or maybe I didn't find the checking code)

When trying to read the code, I see that in `xsk.c` `xsk_build_skb()`, it sets
`CHECKSUM_PARTIAL` on the skb, so I'm wondering does the checksum gets
offloaded just like other "normal" `CHECKSUM_PARTIAL` packets generated by
the net stack?
                                                     ==> Question 3

