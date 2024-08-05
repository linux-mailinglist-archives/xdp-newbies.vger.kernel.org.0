Return-Path: <xdp-newbies+bounces-129-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE497947649
	for <lists+xdp-newbies@lfdr.de>; Mon,  5 Aug 2024 09:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CE12282266
	for <lists+xdp-newbies@lfdr.de>; Mon,  5 Aug 2024 07:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD3F757F3;
	Mon,  5 Aug 2024 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDr/yffj"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233B33CA
	for <xdp-newbies@vger.kernel.org>; Mon,  5 Aug 2024 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843610; cv=none; b=qFLQlMUXQ2PtHKMiDaVetsT2DB1mboow319342XjB6W7+IfvN+L9mvqL801akWISYfjvHRjfNIQYVqLolWkJKK1KRFvxFZtCZkaXLGsMYCuLx2N9UhvIJ2eutevzc9aMdJz8QEPXotswGlcdfEnwT5Lp9lc4UXwKoLEv4HmTJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843610; c=relaxed/simple;
	bh=u8AiLj5MQpsP0v5piaEtI+2OI/onuIrbq7gFmQdU0Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HY5ud2CDM5NGQ392E2muwVYRn7yJX6AxHVCR85tZO1D8OELH1DVjAcCcUJWwfgcW4+//9RdrwMwld7Ebd/8Ysu/0oHkw7PMVjhQj+nLdhWbK2v3bkua6bv33IAKK83RdVqOqIjCVahJdXo9FJ7rTnwS3Uk1eXoq3ZU57uxt2Wgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDr/yffj; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b79bb7705aso16810736d6.1
        for <xdp-newbies@vger.kernel.org>; Mon, 05 Aug 2024 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722843607; x=1723448407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u8AiLj5MQpsP0v5piaEtI+2OI/onuIrbq7gFmQdU0Bk=;
        b=WDr/yffjRffkB6CPDyq568AtzjK31H0xy2S4Ss9UpN0N2Khnt/WTVofpqbB3Rq03fV
         Gps51JCe9SsK92jrfzxP3HI0PJsbRZrugoCUNxtXnpH4QeLXDtb1ttPk/KkRGxGHMpEg
         9PbAsb1pW1maftccW534aIiEyJyaM+r5F7HFSdRDuAYwf/60rZO40E2PdaCbV6d7/nfM
         Vqcb1c6rTOIxsFNbIsmOxjnqyXEw8gguUDhFrprWWMr0Qle8uhos0EsmzjUphFjpXt3P
         60L5035aBURNInCYGo0CHgHT9/XqPfgqZQasBzLD84a67abxDTo2HZiloKn/h+D8S6iG
         2Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843607; x=1723448407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8AiLj5MQpsP0v5piaEtI+2OI/onuIrbq7gFmQdU0Bk=;
        b=ofy6rYiOa8VBOdXEeHIsQZB+XibX13VyG+VsTYN1qMlLsGs+yo8EZ207Y/QwqE3J7z
         yZLaLTYQnBu1j2inKgs720fBQsROSBu/+Ff5vgmpdYVXcKCD6ZXB1XZOMStEW40nDwSg
         fc4kkQj/y+mT3UXFDRxwM9WmF8EE8XM2MmAWPZF6NnXYJnLEm/FsaTCFoQLvBGBRQv0I
         X9EgkQOoK/vGrxSmAbXFIyi2ogQkeIlT+FU4UIlV9Dc+h5fxdVdO+IJYEmLfJXoJ6KaH
         B2dqgnYrQ3RO0dj5dweRWc4yBXUXxZ4h6xjZcadBjZ85yLOXMaPq+FRD7t4N8jl7Cca6
         z/FQ==
X-Gm-Message-State: AOJu0YyRZ5dDs86qRPj6c0VPVUxPfaWmGPnl68PZ0+N4qsId9z/VHmdV
	WHjG6rXJ3C+u4tZGgm98Wluy3a5Hab+YtPEjfAsNshG9cs5Nqli/6R/tCXKpROau1zqKiUBTYya
	5V1rmqmaIw0vGn0a/xG7hRAcAvkt6tw==
X-Google-Smtp-Source: AGHT+IFP4kEpAtMNNWeCil5/UzaJ6DY3L5VINco3WLHKtPkMfxAIqcxUrGr0wbXiAbeIfhxzt7G+ACSn4tGHUPrBnZk=
X-Received: by 2002:a05:6214:27ed:b0:6b7:586c:6d9 with SMTP id
 6a1803df08f44-6bb983e6411mr82576046d6.7.1722843607291; Mon, 05 Aug 2024
 00:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB6C9b_vR171Jwx=CT_-PVLy9Gt-tuy6P3_UZK1Pm_487uwJeQ@mail.gmail.com>
In-Reply-To: <CAB6C9b_vR171Jwx=CT_-PVLy9Gt-tuy6P3_UZK1Pm_487uwJeQ@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 5 Aug 2024 09:39:56 +0200
Message-ID: <CAJ8uoz0qmYQ1EDoycG-rqM7yvkAgFDNvb-P8juv8ZYPPLaJeCQ@mail.gmail.com>
Subject: Re: recvmsg on AF_XDP
To: Ben LaGreca <benlagreca02@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jul 2024 at 01:37, Ben LaGreca <benlagreca02@gmail.com> wrote:
>
> Is it possible to use recvmsg/read on an AF_XDP socket? I've been able
> to set up a socket, write an XDP program, and properly receive frames
> in UMEM with the RX and Fill rings, but am more interested in using
> standard linux C functions. Some libxdp documentation mentions the use
> of poll and sendto/recvmsg, and I have successfully polled the socket
> (as one would a normal AF_INET socket), but can't find documentation
> on clearing the revents status after a poll. Any help or redirection
> to documentation would be appreciated.

sendto() and recvmsg() are only used to "wake up" the driver when you
are using an AF_XDP socket. poll() can be used for this too and also
to wait for an Rx or Tx event. But most of the standard Linux C
functions cannot be used with an AF_XDP socket. You have to use the
rings and the umem. Less convenient, but faster.

> -- Ben LaGreca
>

