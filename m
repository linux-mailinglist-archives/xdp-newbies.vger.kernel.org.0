Return-Path: <xdp-newbies+bounces-148-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A199E98D5ED
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2024 15:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38C31C22192
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2024 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3FE1D0786;
	Wed,  2 Oct 2024 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/R99/fl"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F411D0788
	for <xdp-newbies@vger.kernel.org>; Wed,  2 Oct 2024 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876079; cv=none; b=f0CedQuaULbrm8P5iKvxIwr1NimCnjd2d1a4Iovxd9ftY6n/vrGChfUT/yE4n2INX35AoxYGNl9AFBmyY4Tyoa0A2jCYROrIn18g+5vh+O4HCCN26kmvvweP3aximYdJD7+MKVMCP6+6KUq/RrEnbOV7PdO0K620CrUFe49e2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876079; c=relaxed/simple;
	bh=GHpqtEffCy5vnU+v4ORRjol5u+JUSnLeZh5TQV2vQ1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvhcyyXmdvK32s/FMM5OMXF5Lq5J2PQB2Fft7Eb8G2m9no1/nHO5YHxHh96ox+ei99erd/XG5O+A7netjrgGzUrTatSxlTqDzHOcg2LyNt48kb7GMT2U9Q+KEThuwSWsgwjlf93uYTFij4sy+N8G3vEzviBjfhjbb+zAgcrdrLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/R99/fl; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db4b602e38so53822067b3.1
        for <xdp-newbies@vger.kernel.org>; Wed, 02 Oct 2024 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727876077; x=1728480877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHpqtEffCy5vnU+v4ORRjol5u+JUSnLeZh5TQV2vQ1Y=;
        b=S/R99/flwzIQn55ax0FKleXaTk7CsDRq6yLzpLFltqLzHWxCmYFpKWXm3Ou0csv8C9
         q8feEAcfl9xesU+68Ob1CJAFWiRb/YHh5TekLDsvUHb9K3Z2HSFijuKXsH6TtxUKd06q
         YkWn70fVg25z4oq8x+sGbR1u90eXrXm5PuOkFONqXIG0TJyFN4EylMyTt2u6lSyoIbm/
         o9w+rT93VOvYsHVTRVb6gtRCp8rmehSQIgZICDTACzFjCKES8LJ3Yeo2Lz86CpL9GraF
         mAgnqpRZlwemWwSPF+aYkxQ6dHQgfyBUqyOuC+SeV9RWQaQsUuuwZWIwd/xfb1ekyphP
         jNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876077; x=1728480877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHpqtEffCy5vnU+v4ORRjol5u+JUSnLeZh5TQV2vQ1Y=;
        b=kZEqtem2qUVCQ9mTSVw109YEXsheeH/WFte8JHwzkutWCcRhsRTZthRKOAPxw1P2Fl
         LmmIPq8SDxXvMcWdoVen8dl4VO1W2Bcdd6cxC2Hlb0xp4MzFF+7kNe6/38Q/z/vYoMh2
         O+TPXIIIHBIT8MwFrc6vmtvcNUEBEGC7Wf59tU05ytk8yVZ5fxdrKanKFeKLmPsH63ic
         3Xvud2lsfXE8wtJOcBbcmZ8tPP8W+YS9LPydTbeF6sdTtYbOOlm24a2LMwU6wyBB/TvL
         OImIt5OsY7aNyj7Vzx61OXHPOj/BQzKP79TtX2QqD21Yd45hp5eNeHRA5nDJ5B8peLma
         HTTA==
X-Gm-Message-State: AOJu0Yxsy6igREXAiRwTNzZMxxf7V9b6fBzgFiKtGewRcaZahHpc4hw/
	SgIRbKycv/WgosYDZVDfyi9M00C/637zF0dL7KFDIlVxSvLzDT6+x8TUXfgxKzJ7HA2Vu2tXCrQ
	W9ANRxSjDZD1lDnBeyujfUhmk5W1X+w==
X-Google-Smtp-Source: AGHT+IGSSU3/1k3xbWVf86Jk1VU3RfT9/9f1VdejlUe3/jYji66JCAV6AJtcWyUV/f8z2fqiPg4EREd35G5vy34IqLM=
X-Received: by 2002:a05:690c:7241:b0:6d3:e798:a1e1 with SMTP id
 00721157ae682-6e2a3084068mr29828927b3.40.1727876076709; Wed, 02 Oct 2024
 06:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_hTi0gWX_9xK3ycbqNpwbovJdhFaDoojn-NEUJ8ivn4Q@mail.gmail.com>
 <CANzUK5-03uO95UFwh-oGO8=_L=GryOVPsCVT_myUfqNWW3KraA@mail.gmail.com> <CAJ8uoz06f26q8YvgN8X9yHen1OeOuWKqBc4=fxEgRvFT_p6-5w@mail.gmail.com>
In-Reply-To: <CAJ8uoz06f26q8YvgN8X9yHen1OeOuWKqBc4=fxEgRvFT_p6-5w@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Wed, 2 Oct 2024 19:04:00 +0530
Message-ID: <CANzUK59yeyxOSsCk-FYocPooiqoJJUsKbfp3Vxex6U+yyYGBqw@mail.gmail.com>
Subject: Re: IRQ-CPU affinity for AF_XDP TX?
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 9:12=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Tue, 10 Sept 2024 at 16:20, Srivats P <pstavirs@gmail.com> wrote:
> >
> > > For AF_XDP (in ZC or copy mode), the IRQ-CPU affinity plays a role in
> > > the RX direction to bind a CPU core to a particular NIC queue (mappin=
g
> > > the CPU core to the NIC queue's IRQ).
> > >
> > > My question is does the IRQ or IRQ-CPU affinity play any role in the
> > > TX direction?
> > >
> > > An xsk is specific to a NIC queue and assuming there is only one core
> > > doing TX on that xsk, is there some IRQ/CPU configuration recommended
> > > for better performance?
> > >
> > > Does the recommendation change if busy-polling mode is used or not
> > > used? ZC or non-ZC?
> >
> > Any advice or recommendation about IRQ-CPU affinity or usage for AF_XDP=
 TX path?
>
> For copy-mode, the majority of work is done in process context and
> just a minority of the work is performed in the interrupt routine.
> This is also true for zero-copy mode with busy-poll. In zero-copy mode
> without busy-poll however, it is the opposite. So irq affinity mainly
> matters in zero-copy mode without busy-poll.

Thank you Magnus - this is very useful information to know to tune the
application and system for high performance.

One follow up question - the busy-poll mode is an infra thing or is
there some driver specific work required to get the benefit of a
single core being used?

On an i40e I do see "xdpsock -t -B" using a single core, but on a mlx5
I still see "xdpcore -t -B" using 2 cores - one for the app userspace
and another for SoftIRQ.

Srivats


Srivats

