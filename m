Return-Path: <xdp-newbies+bounces-36-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82D850D26
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 05:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2661F23AA8
	for <lists+xdp-newbies@lfdr.de>; Mon, 12 Feb 2024 04:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03364747D;
	Mon, 12 Feb 2024 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmy6GC2J"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF47462
	for <xdp-newbies@vger.kernel.org>; Mon, 12 Feb 2024 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707712060; cv=none; b=Zx7UfeQzN3GYovT+t2lvo9qjY3mRhiOnEQvVkm0ZhjaD/4j4XP4ohiKFahsiEJ1FVGxfXRsYuBxpCmSgxGJaPJ/7RQftguMnho67RpLt5JPgOtTa1REMZgSjlifirda2iUc1O19MXZX3zAHN4BC7vOPHHoJNEmfL7a1L0i8md1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707712060; c=relaxed/simple;
	bh=yojAxwnnx7mAwdFE9dPnhIRlWtxdHvLm33Nz3e/lLU8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=opMTWw9mkhxxk7jUoHt5Ou2eV0RsN2ksn499EzHyy8/7+ZprIrwZomnSQ0lXSBTIosCZFx3UksPu4oaaCWFvDKrw5e513nd1ewmbcs3gtRw7z64XqrAzZIz4EhfammQg0pxon3iTEVkcE4BIQV1Ih+UoLW1Hnbbx/cHdxWkCzZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmy6GC2J; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d0fd07ba8bso2334181fa.1
        for <xdp-newbies@vger.kernel.org>; Sun, 11 Feb 2024 20:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707712057; x=1708316857; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yojAxwnnx7mAwdFE9dPnhIRlWtxdHvLm33Nz3e/lLU8=;
        b=dmy6GC2Jxz7SWr0h/IjQJzH+r2ivuPZa7gjHg4ihodCDtGnUOqJszo3wKyOUB8r/fM
         1a6ySN7GDvmI262tfAByel6R+kaGcVyRBRVp+1m2humAS5XB9aZb5ks57quFP/nQbWtY
         iznhs2g8aFNdftCCJ/oSxnKLGY87szMe0vFkO9valZ5L+R5mIhNOX2OPn+p07KV5Vl4r
         G5QNKLR7LSso1BvgnNrOT/A/CwAaEtHbKtdF0LqUcvNNyWZ5neAaBWzBp8NGvRHlNIL1
         9WE4I7UOy+ohDcW1h/HxrWbYneU6PaEfo4s70XE/2sENCy95KbsnBRriiQ+Kt0VptilS
         6Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707712057; x=1708316857;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yojAxwnnx7mAwdFE9dPnhIRlWtxdHvLm33Nz3e/lLU8=;
        b=ODHuOUbOryBx2mgBF0NLmwBEh08VNONFUZ25Cyb7ZURaDtTjJqnImE4kq7dWoJ2mRM
         gCwOpdWmzYp7zKeNTBbYfbXLfaLSEc5r1iy6GU12DbGvzWd4zkl8GdIasbXhKt/CGtY3
         suQBXhG9dUBg2OZKG5kUniGy4E+bBRvqOKjOaB6vkbEcyrTj0lOpiSpNAQeimOHvcaTd
         LU/RQvEAxQ9omlNFaCygqOaSAhWGJ+bSsKdNdY+2IF0f22YIHeMHaeDY9VrSQ0uIzdel
         U9TBBLGWY7zUAFJwZN2mfp847DicyxfCxY8KrcfQ5cTtYF5LCgVta/cBvdW/48sd/LOZ
         +EDw==
X-Gm-Message-State: AOJu0YwliX2191zPjt7UxgIDTUoF2U2uv/W+A8LAHlwwBrA5pKi5v8st
	hyw5jv0hPhopXG681wwvFSFLSS96aQvmKXVNvTgfykhvdNUE26V0DTnJlrk1GSEgyy4g66QGkNw
	Xszk2YUiuOvZWsQ3LXnt6yt0thRvuALBS9u4=
X-Google-Smtp-Source: AGHT+IFegxIuhM3aHa2UIgqtf6mw/nv9hIAJ9JIf7nkQ+C7OarnZrVhfLoEs9A5wk0s+aVViup2c3xNThco+pOjOP+w=
X-Received: by 2002:a2e:9ac4:0:b0:2d0:8f08:6a5f with SMTP id
 p4-20020a2e9ac4000000b002d08f086a5fmr3536156ljj.32.1707712056880; Sun, 11 Feb
 2024 20:27:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: team lnx <teamlnxi8@gmail.com>
Date: Sun, 11 Feb 2024 20:27:25 -0800
Message-ID: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
Subject: XDP packet queueing and scheduling capabilities
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

https://lwn.net/Articles/901046/
would this be resumed any time soon this year ?

Regards,
teamlnx

