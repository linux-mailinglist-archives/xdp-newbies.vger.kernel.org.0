Return-Path: <xdp-newbies+bounces-62-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3894892BF4
	for <lists+xdp-newbies@lfdr.de>; Sat, 30 Mar 2024 17:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E7162830E5
	for <lists+xdp-newbies@lfdr.de>; Sat, 30 Mar 2024 16:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58A3B1B2;
	Sat, 30 Mar 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM+KmLfW"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3355A3A1D8
	for <xdp-newbies@vger.kernel.org>; Sat, 30 Mar 2024 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711815078; cv=none; b=bydPlHocRylASjan3krVYS7BKkf2agLZwR/7w2V3Xxv1g4thP9lNZ1nizXECWTxKcv4gfgMzBJ32KS8cGu9yjqMgL1PU38l/EBvKl9sKFCW+pSz8qqVnDVENX453i1/4HUQud/F71a3wuDucg5Xryh35Q+IQdezekBbIA6cYDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711815078; c=relaxed/simple;
	bh=TQb0XuLpcFpQtGruXYPegTtvI7yyH9zvbkvMem2zdg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SwvLZYqlM3rbpGq4qfeD2ZuAVzGGiAsifwnKCTJfEAN048V8Jglo6hQpxcrC3tOusu6SWU3EtzRga/KHwIHdu4rPlhCBJWLZXP7kFUuNK89VwYLOJIytWLmdORWDsoU2g6C/wYGI4Tfx24UYNFqgkzfTZlY26nRpdDA0PUQVfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM+KmLfW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513e6777af4so4652181e87.2
        for <xdp-newbies@vger.kernel.org>; Sat, 30 Mar 2024 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711815075; x=1712419875; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdGwWdIEPipmH4+Py2b9GdMONLBE6JKt4kXBiVrOkAE=;
        b=fM+KmLfWPzjnwkNH5BNtGUW3MN2No5ah50+nnWA0DmdGrCHW6RcJl1Ku3grXzLazZ2
         wxk12p8UUrAxjzzKUKQI8cxzS1luoVs3ljsgVdSbUIq9wuEcphr3izXu1HyxPuBDfZte
         Q9tr+6pCnWCcHsgtem4spmF1XJu119GdiZ3f87ITLLSpxIiREPhBICvaLdHLmF7T1wU2
         TjbvGfbhkpJoxfMzAdeLTQQUN+JlnqJz7fxXAQNh5+tP26+74ZTtq6bz4Qtve6y0HbsG
         StbvxT6qZdx/Tghwt79SAQjD2me+IqR7LZaemLWCEiyTjVXrslF8tLmP/R5RRzTkVsZh
         +zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711815075; x=1712419875;
        h=to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdGwWdIEPipmH4+Py2b9GdMONLBE6JKt4kXBiVrOkAE=;
        b=q2PQY/x1yopt4vM4hf8eVlqiBXvwMMgWM11XF/abUuxjotLzpND7Q92+IlRNvfR9+W
         Rw1s5Z6lhyFR8JzrYpW7QhvSvdWdqBGTQqlizrRbXuIAdYqGaCP7oTqcwiMJ/XbpWn/+
         EQVuAU/xP6HT1yuhUJ9s3P/NginqF8vgvxe0Dni8ZP27oPKeEHsJgHQuSQCY+tFbJoCH
         yjh9Qmhp9PHRX9wookpf21j7o9q8WkBiRu7KiGpVgjy72mzziay+A4uLRanTyX/KfFoq
         VcDKaujAkBWnI1GHEZKzN3PzjRu+2cNcx9mHl8qs2XaTrIKtPXgdkJxweJb6TQ8DSJRp
         mx0A==
X-Gm-Message-State: AOJu0YwSYllO2SZM4n/jhLY2Gb+inzdrazW8Q7YPVKoHCdNSQCHc4N0D
	x7FD9lxUlUO/yLbsI3U5eO1M/IVUxWATgUwRORCjXmMmUHQKtN6vxXaDcsHPJw6kvOy4vwXMhu8
	aUKu3JSGIs7lhjMMj85SBA8DC6HHjSafRITI=
X-Google-Smtp-Source: AGHT+IGHcXfLSpXpFxqqywL7Vm9bmnLlvYiQ6J2Y/AUk8A4EZbL2wzg507gr1wE0pX64aBtR7Gv8ToaJABqlquliuyo=
X-Received: by 2002:a05:6512:3094:b0:516:a09f:f689 with SMTP id
 z20-20020a056512309400b00516a09ff689mr1246609lfd.44.1711815074745; Sat, 30
 Mar 2024 09:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAVAo4MxNCmEi3A=V+oqyK9_qZ2CBSQAC28g6tAH2t535cSZ4Q@mail.gmail.com>
In-Reply-To: <CAAVAo4MxNCmEi3A=V+oqyK9_qZ2CBSQAC28g6tAH2t535cSZ4Q@mail.gmail.com>
Reply-To: ctxspi@gmail.com
From: Marco <ctxspi@gmail.com>
Date: Sat, 30 Mar 2024 17:11:02 +0100
Message-ID: <CAAVAo4O6kSEv2LqQrQSBa6Qk188NewdGgazQiZUrj6bJGXXtcw@mail.gmail.com>
Subject: Re: Global static volatile
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I apologize because I was wrong.

I have identified how my program behaves and in the next few days I
will (with pleasure) remove the structure declared "volatile static"
by modifying the parts of code that make use of it...

Thanks anyway

Il giorno sab 30 mar 2024 alle ore 15:08 Marco <ctxspi@gmail.com> ha scritto:
>
> Helo
>
> I tried to use a secondary variable fib_params_test as a global
> variable at the beginning of my XDP program like this:
>
> static volatile struct bpf_fib_lookup fib_params_test;
> .
> .
> static __always_inline int function_process_packet(struct xdp_md *ctx,
> u32 flags)
> {
>     const __u32 ifingress = ctx->ingress_ifindex;
>     void *data_end = (void *)(long)ctx->data_end;
>     void *data = (void *)(long)ctx->data;
>     void *l3hdr = NULL;
>     struct bpf_fib_lookup fib_params;
>
>     bpf_printk("Ingress interface %d", fib_params_test.ifindex); /*
> the value displayed is always right */
> .
> .
> }
>
>
> Once "fib_params_test" was initialized with the first packet received,
> upon subsequent packets coming from different incoming vlan
> interfaces, "fib_params_test.ifindex" always returned the interface I
> expected.
> Obviously I have always done tests with little traffic so I have the
> doubt that in a real situation there may be unexpected values for the
> fib_params_test.ifindex variable. This is possible?
>
> Thank you.
>
> Marco

