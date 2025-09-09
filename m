Return-Path: <xdp-newbies+bounces-190-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDEB502CC
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Sep 2025 18:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49179364E9C
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Sep 2025 16:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B413314D5;
	Tue,  9 Sep 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJjB+gSR"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3323E34C;
	Tue,  9 Sep 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757435848; cv=none; b=QC6Uke0hEJCRZgQQoEWXyws4yQgvcgky/CYu58yIRT9iOKG0kNYlJiTZNAiZK9ss04NLYj/oA1oBodTpTOdfr7fyrjohQtI6yswJ2y2S5zQumyQSm2ta8kpoOpcVH25pu5wm65b4Gi/imCtQ7Jee7BRPTIXnbrs//CSyQvrePE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757435848; c=relaxed/simple;
	bh=YnkXCsLcczNTFU7hE49SrGykNFGCbsufvXkEOENu0EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWTZXG8W8hGuJd9x0odVxLdU+UsmT6t7QCx/EiDtDaZjpPhR1ZOgC7PbtEApj45ib1722y4D8Q0BRmnQnidWRjYkJOIMRYq1s1fYntvcq4W1X3L/HnXrgyr+g+0VM7Dm2HAcmTs614bDrwLpHvin6c5ExGWhhFLluzWbhEZAEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJjB+gSR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso10080855e9.1;
        Tue, 09 Sep 2025 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757435845; x=1758040645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlzWJI9z3BZGRXDFF9YrcS74SSvEUleUaQgoUykTV4s=;
        b=GJjB+gSRQz4+C56Gn3CIgiuhtlv3LIOioY+ypB24DAXTbQ7OJESjYiRS4JzYnQY356
         W/O+QXs2Z4/d01CgDMfQjhSQFcvNpa4oNvYLOLH7aKpr5uFkkV9HRQSOMVcEyG9+6r82
         JAJwLRrQ1npOYw1G/3NV85xYdSHEgBQkfbP1x81EMRvROREHNdC2rXoMUIaHtmMgreHf
         U0Gv39vB5arrY2NZcP/8cofFU2QgZRV0zSOTstr6e7tPxCWyz5wVWRwzWQw/DG9ophLT
         MCjKoSXm1dcEuyHp8Crbrnj3l3IAOD+VG/lcPq5OSMsvUjeRLrZ+rCc49yJZgrrpWxtI
         Lilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757435845; x=1758040645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlzWJI9z3BZGRXDFF9YrcS74SSvEUleUaQgoUykTV4s=;
        b=jfOD8gQBZQn/yYg1BXjNAOnF7001I6oK6mRTFzZ4QjMTRqK0Krb2QSvVckbVC53Q4B
         wlddKT4m8l1OnpLfQkhYPE07LKXRZE9snzyLEzXpPOHQhfjiNRgHVdaVMR5qftPLTIFQ
         yzn/iYtS6Azt8Tdx/DoD3EfduXB/4PuSziQUj6aaCZWh9C6iIZlvHnyPBCz67ZtcsiZH
         lFOVPg1rPWtXfKJtwI5IUrGt4mOudmAUAau+zKtWSXp1XWu6XdjVM5dzwiXtjh5I7Fky
         gUGh4LFZeR0LYN0JPZE7fjQ+R90JqQ8uw1f2oiMkOD4u7QHR+horX9lZ0nHojJs6qNyZ
         7Mog==
X-Forwarded-Encrypted: i=1; AJvYcCXTjXVjiVsTyL78CcMdzVDR8IWxRX/9prNKBeSA61dzBD6vtT4l4MkLwZEb+rD8rE2HoHnmVUd34xVowA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymeAMQq66JkSQHi59AvemANsh3SvCFJpiONNpME4IUNb1Ln7UM
	q/sdFXm52DjLDXwEiYSuDkWebTVgCMQv8pJ1Mj/lV2u1VQWf0Vq3Gy/7b3qWV3/yMExsCdsCUVv
	wXGj5/993nSyNqytDreAw0PR5XHhPOl527Q==
X-Gm-Gg: ASbGncs7CNb9W23514loyT7jV0sgEfjZrhmCjKqpikqt/ttxZiLpydrrAieoMZTfYVr
	wJqPkOF4ZFmQrxlrDvqT7SxKivZb3Q4wrIKjBe4nO8xJBd7BRwzneMsaYdPlI16n+Xi7Au4odXE
	5OaoBez6oIewr+5e7BMO9mDkgKPp14JaJtpxw5CaOm7breLWe6aB4MtALIDfCrvg3lKR0YCxg59
	0M1tLb8lQJP04Tm/VKxsiM=
X-Google-Smtp-Source: AGHT+IEgjMKuPkRrJOaeKE6FyLMSmZqgiMsJgyq+AQKlQslV7AwAk+bhBUdhjOVoAJG8vw5x6p/Gz630qyrh5GUgb7k=
X-Received: by 2002:a05:600c:1ca0:b0:45d:d9ca:9f8a with SMTP id
 5b1f17b1804b1-45dddeef8bbmr103174135e9.27.1757435844886; Tue, 09 Sep 2025
 09:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a37ee461-1df8-4cdb-afea-ac104d81eb4a@iogearbox.net>
In-Reply-To: <a37ee461-1df8-4cdb-afea-ac104d81eb4a@iogearbox.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 9 Sep 2025 09:37:11 -0700
X-Gm-Features: AS18NWAeAhO2v7dZCFcsixhAX2frZQs6i2DZ7E1hGS-aRTP-ifb1cy2fSx5Kzow
Message-ID: <CAADnVQJuK-Pe0Pt18O+iy-3XawRX_N7AULbo-t85tvk58zeEcA@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] LPC 2025 BPF Track CFP
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: "open list:BPF [RINGBUF]" <bpf@vger.kernel.org>, Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 10:59=E2=80=AFAM Daniel Borkmann <daniel@iogearbox.=
net> wrote:
>
> We are pleased to announce the Call for Proposals (CFP) for the BPF track=
 at
> the 2025 edition of the Linux Plumbers Conference (LPC), which is taking =
place
> in Tokyo, Japan, from December 11th to 13th, 2025.
>
> Note that the conference is planned to be primarily in person. CFP submit=
ters
> should be able to give their presentation in person to minimize technical=
 issues,
> although presenting remotely will be possible as a last resort.
>
> We are seeking proposals of 30 minutes in length (including Q&A discussio=
n).
>
> Please submit your proposals through the official LPC website at:
>
>       https://lpc.events/event/19/abstracts/
>
> Make sure to select "eBPF Track" in the track pull-down menu.
>
> Proposals must be submitted by September 29th, and submitters will be not=
ified of
> acceptance by October 6th. Final slides (as PDF) are due on the first day=
 of the
> conference.

A reminder that deadline is approaching fast.
Please don't wait till the last day to submit a talk proposal.

