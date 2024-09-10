Return-Path: <xdp-newbies+bounces-141-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C53973C7E
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 17:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452CA1C25640
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 15:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494C019ABBB;
	Tue, 10 Sep 2024 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTfkxZZh"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E5193097
	for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982932; cv=none; b=UpTzXoY1E/WLjdCMZelpfCbnsJLL/lxQ+qc5sgGPPrEUad27YhiofYTZ483nhA0NzStpHQ+g3TfOGKBEOI/wIwJw/EtaX89WngVrb+oGpVaWyXPKDmyX3ex/xINmJ/5pxBfMAWmlZcmt+b8CubGBf49NSIdHhzHLiIvDFzxZegU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982932; c=relaxed/simple;
	bh=oyDrNTEWcO1D550MIYBxyVYaXNNn6EC5auwuFGW1f30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fveci8kJc20OZUdO6Hg0h02GzTJZXGO8OsmWJMq09qhTl0K85MxMdgYBb3fBAkbfDrmBmSeEB2sut+aYp8l9oOeor9F9AKUZxuoQdKoQ2pxarpD+7hAQvWlQ4vNvxuD+co1xyy/Qpx6wo3oCjLYg/WUkLwsKQAjGCTPgoEbl5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTfkxZZh; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c34dd6c1b4so35087136d6.1
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725982928; x=1726587728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oyDrNTEWcO1D550MIYBxyVYaXNNn6EC5auwuFGW1f30=;
        b=CTfkxZZhcUzYVQcPhoaZsIR8pr8imjANaC9VtJFj871aRd6uDpKSK7e4nAfIpj9AUQ
         nAYxMGcjkbatmTnrYgk82Mmf8RxyPpdmz2EE4IMkPUaC57GQCSoBek3LLogazmoDk3c1
         BS0aMds33qBlrKkSr71WlWFtfSWM5x5uFLMkWcoyaksixRZF0vqnYiR9Sw5OuYHIJ6Ro
         NOwdBQM03UDxfL7lRAS3Lb+MoqC2RPDIvWmSWwVkMTWpGK6c4CQlFD+Xb+Sw9UPIQ1Sc
         RNuaTm1Sm2OkrQlVHqURwQPmuvrIykheYq6u/olr7g+Ki76znMHZxQYaaJGIecqbr4Im
         rt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725982928; x=1726587728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyDrNTEWcO1D550MIYBxyVYaXNNn6EC5auwuFGW1f30=;
        b=h9F0Cd/+Qyv9hGyTcruG44N0p61cI4gyRG3sraAuojNoFuaRhW3Ld5IKhtXnTGr9aX
         8FMyP+jQUeznq7CUzr2OaF7PvV/vmYCIU1pUOOQbtChTzcCiRFVUmBN2XIi1WjC92Txx
         D+mGeIKOxgUp/ED+0mTAb8urVTLhF4AO+Vv+fqrSzpk35wSvzrNhdQDVf1kslEGlATIz
         e0+5Upm/QVFQE2Py7GmvNENeKKQTkslth+uT0gQW6+WH7aWUywgYWGM8ptB59njVBMbW
         9nYfcOnZvJfGCw6xTXoN4V4jlSUWHYVCK9wrqPOetnVpSgWwEJYCF9+TiE80q3hHo9Es
         Wb7Q==
X-Gm-Message-State: AOJu0YzcAbqQMCOxYDY3cs8fIGGI9F1BxvYfqM0hF29C2htmg6HpQAfw
	T4/mYPlw7fTRwQ7X8qQx2GOQpEGWMmCvHns52sctqFh3bc9t+xkdIIq0kD/e3g4UCUeoQsUXmwj
	7vmIiv/rnekltiOEOp9yHbE5oBlo=
X-Google-Smtp-Source: AGHT+IEGOYoF/m9arPZqA90vz4ivCFBqFg6B+39SHgMcUqd03Z4RidubqddZZP7D/Xvo8m6OjcuWmKUXXV3NCyslp2k=
X-Received: by 2002:a05:6214:4389:b0:6c3:659b:bef6 with SMTP id
 6a1803df08f44-6c532ad77b2mr164183986d6.18.1725982928425; Tue, 10 Sep 2024
 08:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_hTi0gWX_9xK3ycbqNpwbovJdhFaDoojn-NEUJ8ivn4Q@mail.gmail.com>
 <CANzUK5-03uO95UFwh-oGO8=_L=GryOVPsCVT_myUfqNWW3KraA@mail.gmail.com>
In-Reply-To: <CANzUK5-03uO95UFwh-oGO8=_L=GryOVPsCVT_myUfqNWW3KraA@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 10 Sep 2024 17:41:57 +0200
Message-ID: <CAJ8uoz06f26q8YvgN8X9yHen1OeOuWKqBc4=fxEgRvFT_p6-5w@mail.gmail.com>
Subject: Re: IRQ-CPU affinity for AF_XDP TX?
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sept 2024 at 16:20, Srivats P <pstavirs@gmail.com> wrote:
>
> > For AF_XDP (in ZC or copy mode), the IRQ-CPU affinity plays a role in
> > the RX direction to bind a CPU core to a particular NIC queue (mapping
> > the CPU core to the NIC queue's IRQ).
> >
> > My question is does the IRQ or IRQ-CPU affinity play any role in the
> > TX direction?
> >
> > An xsk is specific to a NIC queue and assuming there is only one core
> > doing TX on that xsk, is there some IRQ/CPU configuration recommended
> > for better performance?
> >
> > Does the recommendation change if busy-polling mode is used or not
> > used? ZC or non-ZC?
>
> Any advice or recommendation about IRQ-CPU affinity or usage for AF_XDP TX path?

For copy-mode, the majority of work is done in process context and
just a minority of the work is performed in the interrupt routine.
This is also true for zero-copy mode with busy-poll. In zero-copy mode
without busy-poll however, it is the opposite. So irq affinity mainly
matters in zero-copy mode without busy-poll.

> Srivats
>

