Return-Path: <xdp-newbies+bounces-167-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F99E58F4
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Dec 2024 15:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC626169EA8
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Dec 2024 14:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EC521A44A;
	Thu,  5 Dec 2024 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYGhxGTE"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E743217F50
	for <xdp-newbies@vger.kernel.org>; Thu,  5 Dec 2024 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410522; cv=none; b=IcxQA53iYjU02x+lTiVbe9u5kd8Cd0eABZNdXO1Qp079A0lDwLTnCRch/BLQpEZW3YnMXAUpcdXSv+K5+Ngpm/x7xrGnRWQi3U+mgAbLe+ttr1LHTQibJVY4lgwMtz4IbuF7UoMnysVJsMG2/jpN4tp3V92JJSsBJzPsRMbWAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410522; c=relaxed/simple;
	bh=RL2dF0HZR5ZzfAZ+lqV4hfSXVPfnB+ZBgFUyzvNb9JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHD1+AKB2lzJeFsizmTNZ1f6fENojTI4XIWZf/lUjOFWf33xJQV9wtLSCKbOEM1YvlPeymkwHCSfDl0ry26pgqsLXAhSonWeW3rR0UoWiV6eutwk2vSeGW1RGjGMf7F1tdceXA38T+2fjw95HbfLzmcl0ryJa5yvY0ksmnTX9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYGhxGTE; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e9f8dec3daso6070307b3.0
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Dec 2024 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733410518; x=1734015318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL2dF0HZR5ZzfAZ+lqV4hfSXVPfnB+ZBgFUyzvNb9JE=;
        b=WYGhxGTEKDWup5TVwGgaMO0pxNnyqA8HCgCUUuxoFTSKVufaY3w5ivxAmNdkHUnHIh
         AhBT0wpJqcNkmeThHcexNwPy78L/G0X2/zcOwv1iM51wlpEm9aRHMQqPBFyG9ZroPTgV
         jBKMnNqXs4hTfpWQbsA5sLpEUvKcidv6O6w7bYegRsl+tV1ZTHHeIXkbSWS8SdMgzGly
         Dsm1aEVWnDXK5w7l7QLfPstf2hPOfZb5sR3WdLKAZiW8zeRC6xQ8IVnK9b9vDRtmIXnX
         pVos3PbsZg6u+5hdHwOz0mN+Fl6XkRiNCpeetXrOKAj/At9GHl+bNecd7fuBdiWHsQMM
         YYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410518; x=1734015318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL2dF0HZR5ZzfAZ+lqV4hfSXVPfnB+ZBgFUyzvNb9JE=;
        b=B86y+m0OcJ8bLikxZHbHQEM8svxB7JF9o8yPqHYBuf+clUGfbEGY/c/y0YRErH/NLC
         wT8TGQS04RexNf3jqlGHrTQ4rold1MP7J4MIPQoCw4M0tyrU/I5NY3vQPDIZCmNON8y2
         F+/xgFF9c8I1jL16MC7/BQpJFZlkt1BfxNez3oihNC4YyfjtEZru9XHxJP829YiN8k8x
         LmTwj4JRvV+4qnOp631eEaXtSfyg/QFO4nKRJ/Tzr0N2ZwL21lWN6o8wdsxQBeie8QCh
         CeFavV3i+Gdj/2nX/ZJaAyXoiVm8aTqa0q+UBFPKpY4CPuintWC5Jkn6glMYKLhXPA+Y
         Lslw==
X-Gm-Message-State: AOJu0YySgqWTCmL6sROFnORbZ24C8utE99Jf5tMT9h36ougPAWedO8eD
	Ad7qJW20tZhg+SSytA39v1EuoA3ygXcvodjLoRRC+Ec8V2HFqCc+/1GKWzb4/rQj/LWvT57jnRp
	2x5Y9WFJ66/CWBs4QcD0g5BcAXdhoIe1i
X-Gm-Gg: ASbGncvZfJ1Nl2jRnlaGiqY3fyyxw32nKeGnMpyqLVH4KVIcf6GVsiU0aI2yfVGGYux
	4Nn9lTbjxox8FPx3On8cpwcQqzsOrEno=
X-Google-Smtp-Source: AGHT+IEmvBXH2jt7WQnPz2WBbk3Bfwy4DlE9LQQZ1hQVn8HtscVNT1lYmpVGEuuWSP1O9y4BYl5+53qVB0/2S7VeVmc=
X-Received: by 2002:a05:690c:690c:b0:6ef:7312:d05c with SMTP id
 00721157ae682-6eface06f0emr181597987b3.2.1733410518295; Thu, 05 Dec 2024
 06:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <B0A503CC-2BE2-420C-A032-EF3966FE0E88@wii.dev>
In-Reply-To: <B0A503CC-2BE2-420C-A032-EF3966FE0E88@wii.dev>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Thu, 5 Dec 2024 15:55:07 +0100
Message-ID: <CAJ8uoz2oviM7k1HLuT_Kzk4S0RKKds7gdB6t_poohNmXo8Frgg@mail.gmail.com>
Subject: Re: Sharing UMEM without XDP_SHARED_UMEM
To: ripatel@wii.dev
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Dec 2024 at 15:00, Richard Patel <ripatel@wii.dev> wrote:
>
> Hello,
>
> Is it safe to share the same virtual memory region as UMEM between two ze=
ro-copy XSKs without setting XDP_SHARED_UMEM?
> The XSKs do not share the same (dev, queue) pair. They are backed by sepa=
rate receive queues and have separate fill and completion rings.

It is safe to share a umem by just registering the same umem region
for each socket. This was the method before XDP_SHARED_UMEM. The
drawback is that it consumes more memory as the xsk code in the kernel
does not understand that it is indeed shared and structures could be
shared too.

> I have an application receiving and sending packets via two such XSKs on =
the same thread.
> I=E2=80=99d like to reuse buffers across both XSKs while ensuring each ch=
unk is only submitted to one of the fill or TX rings.
>
> In principle, this seems safe but undocumented.
> If queue IDs or devices between two XSKs differ, the only notable differe=
nce in behavior when setting XDP_SHARED_UMEM is that xp_assign_dev_shared i=
s called instead of xp_assign_dev. However, xdp_assign_dev_shared only copi=
es XSK flags and then tail calls to xp_assign_dev.
>
> Is there any special behaviour introduced by XDP_SHARED_UMEM in this case=
 that I=E2=80=99m missing?
> (Perhaps something to do with ref counting of memory pinning, or support =
for simultaneous DMAs from different devices into the same page?)
> And is it possible that future changes to the kernel AF_XDP code or kerne=
l drivers might break such operation without XDP_SHARED_UMEM?
>
> Thanks
> Richard

