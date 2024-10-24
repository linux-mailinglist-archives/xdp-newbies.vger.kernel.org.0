Return-Path: <xdp-newbies+bounces-156-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E429AF496
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 23:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CE1F1F22394
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46E11A76AC;
	Thu, 24 Oct 2024 21:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+uieRFd"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDEE1A0BEE
	for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804708; cv=none; b=AcZsPabWt3JW7FcrSDKSboKYo35QZATKkJbvvmpamUd6fHPzuIYy3uNI58v0gCWz/4Mr8N7R2SJlX4JUOHzsFsfL5/nWApu/jEWFTp/BsW1Jl2MmntEa3HRAPow3SNPBzOMxEZXVa026mLNayvmjv8Pw8uh0+IS6ixOIFJB8Sq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804708; c=relaxed/simple;
	bh=J6GobCfxMbj8BFOGRxQcT3V1hKMNnHkwTWVqFxRtYes=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtpnCJIVOGt9lIHV8/ik3pH6EXHEqt6GeBjPs+fHWvyeuHPVE4LNSsAs2Sj7tbV8woYN7cx2B82hOYYTbWE1Ed6ciNO8sRuK0NstLQa/4LJl+nWKbF+4HbpdRhh4iZ1kov1NlmRGHvjOL0Yr5GJmBq3TRV3PNhpoM9EZ2N5wpuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+uieRFd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb599aac99so14715231fa.1
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729804704; x=1730409504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irYp64iahMlp5QVJViy2oG3Y1/P4dzx2WtljmVCcARU=;
        b=Z+uieRFdpynpEuWPo8YFRpUOtdXtPGRy9cByQVBibvHCfL0OwqWZyEgVL78YBmxyC4
         lf8ZEsX9TQBsADzupP2fVpKmFRZf/Y1KR+rkNRfgpsqeC5qeGMItwcxSpbfiux79AcxB
         EIb/+x5PuBMJimhoJV1V+WFxOrr9jm2eQd3kEEpzd8cBKbk9J33m6rFeUYCdeFpSwPU2
         6LM98SaDW83MQFqquMNButcXajXfd/lmIfKgCj6dTMYk5+clta064TL89rTYwL1vQY7J
         XVyS4nSSpY9eaJ8G+Yoo20vE9CX8C0oC6l7JOXA4xj0F3brTSYTEkyZAQoyEnoek2U9r
         34Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729804704; x=1730409504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irYp64iahMlp5QVJViy2oG3Y1/P4dzx2WtljmVCcARU=;
        b=KT4tmnQT0v1l51IcwWLJPkh2tZhqsfj16D3AnZCuwNi5KBkoIKONVtKE8MrB1Da6pF
         J820fHKrnULbllXqeQU89hXCmOHmbd8LYvmON1WcqL5Ss2Ml8PINRty1dkFhJXpUgxg+
         o9IrpmAK7CEHmIsizzrX5wnHFW2DIYUxGyQFs+JbeE9vnttgrOyjIcWRgw89QEpNgTDf
         foMEViOU+CaGJYVIRtsDv2AuJ7mwfS71Wh4VZbLGU3SO4BUQ4/jqTHRRx4bkFHqeohZU
         X3pAi1MSBexkP7JqznHXr6ifNdxsuXdneixWBWLeynm4TcPYolBC1O0vRZKZTGKkCxTL
         Zztw==
X-Forwarded-Encrypted: i=1; AJvYcCWD33/idJLxFigE6bKYbTRo57Hx9VKgG8tFM1f1KGjQ536vzgGbidSZD/rsRe2aRYonN3ZdN4x3wwvJBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4zdnmrpH7BjZbCzqWzUd6+jfFDmYQUCyzBR4RSCmkfg0ejHI
	t7232MlY4o2H1Jh/Ct3NLx3d60rLf5fvY88QEHTB58ASC1ZY0NtTwjWgTQ==
X-Google-Smtp-Source: AGHT+IHmhEDX9KDCdoy8OjvNIZLPcaL5yZSznIUmdmykS1sJH91lcUteJqmP/GHpy4bfgQr/IRHgNg==
X-Received: by 2002:a2e:9dc6:0:b0:2fb:5bf1:ca5e with SMTP id 38308e7fff4ca-2fc9d5d5286mr35772481fa.42.1729804703590;
        Thu, 24 Oct 2024 14:18:23 -0700 (PDT)
Received: from nuclight.lan ([37.204.254.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad6337bsm14995861fa.43.2024.10.24.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 14:18:23 -0700 (PDT)
Date: Fri, 25 Oct 2024 00:18:19 +0300
From: Vadim Goncharov <vadimnuclight@gmail.com>
To: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
 xdp-newbies@vger.kernel.org
Subject: Re: XDP/eBPF map thread safety in kernel (e.g. lookup/delete)
Message-ID: <20241025001819.2475ec77@nuclight.lan>
In-Reply-To: <875xphftdq.fsf@toke.dk>
References: <20241023145426.210fce4d@nuclight.lan>
	<871q07ggv0.fsf@toke.dk>
	<20241023152810.42936dc4@nuclight.lan>
	<875xphftdq.fsf@toke.dk>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; amd64-portbld-freebsd12.4)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Oct 2024 16:49:37 +0200
Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:

> Vadim Goncharov <vadimnuclight@gmail.com> writes:
>=20
> > On Wed, 23 Oct 2024 14:10:11 +0200
> > Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:
> > =20
> >> Vadim Goncharov <vadimnuclight@gmail.com> writes:
> >>  =20
> >> > Hello,
> >> >
> >> > Where to find exact documentation about what happens in kernel
> >> > BPF helpers calls with respect to locking? For example, I have
> >> > `bpf_map_lookup_elem()` in one thread, then work on pointer, and
> >> > at this time, another thread does `bpf_map_delete_elem()` for
> >> > exactly same key. What happens to memory the first thread still
> >> > continue to work on? Is it now dangling pointer to nowhere?
> >> >
> >> > In my particular case it's a bpf_timer callback who does
> >> > `bpf_map_delete_elem()`. I'd prefer for it to not delete entry if
> >> > another thread did `lookup` and works already, is it possible to
> >> > do so (in a performant way)?   =20
> >>=20
> >> Map elements are RCU protected,  =20
> >
> > I see this phrase everywhere, but always without details, whether
> > it's about just map structures itself (OK, this minimum is
> > guaranteed) or the user data, too. =20
>=20
> The user data in a map item is allocated together with the
> kernel-internal bits, so this goes for everything.

OK, got it.

> >> so you already get exactly the
> >> behaviour you're after: if another thread deletes a map element
> >> that you already looked up, the element is guaranteed to stick
> >> around in memory until the BPF program exits.
> >>=20
> >> It won't be valid anymore *after* that of course, so if you're
> >> doing concurrent updates it's you own responsibility to sync
> >> appropriately. But there is no risk of the pointer suddenly being
> >> invalid in the middle of the program execution (so no crashes) :) =20
> >
> > OK, no crash is half of good, thanks. But how'd I lock it from
> > deletion? A "concurrent updates" are usually about memory area that
> > still persist as a whole, but in my particular case it's a
> > bpf_timer callback who does bpf_map_delete_elem(). This is a
> > conntrack-like map - an entry contains some information about
> > connection, a struct bpf_timer and expire field when this entry
> > should be deleted due to inactivity, based on information in a
> > connection (thus *_LRU map types are not suitable for me). So it's
> > possible for a race condition here:
> >
> > 1.  Thread 1 receives packet, does bpf_map_lookup_elem() and begins
> >     processing, at end of which bpf_timer_start() will be called to
> >     reschedule removal into future.
> >
> > 2.  At moment after lookup, timer callback fires and does
> >     bpf_map_delete_elem() while first thread is not yet finished.
> >
> > So how do I prevent connection record loss in such scenario? =20
>=20
> Yeah, there is no protection against this; you will have to do your
> own locking to prevent it. Something like putting a spinlock into
> your data structure and using that to synchronise access, maybe?

Well, if I'll put bpf_spin_lock into map element, then it looks like
the following scenario is possible:

1. Thread 1 receives packet, does bpf_map_lookup_elem(map, key)

     1a. Timer callback(map, same_key) does bpf_spin_lock on same_key

2. Thread 2 does bpf_spin_lock on same_key and waits.

     2a. Timer callback sees lock successful, sets DELETED flag in entry
         and bpf_map_delete_elem()'s it.

3. Thread 1 unlocked and either updates map entry directly by pointer,
    or reinserts new entry reinitializing timer.

Am I missing some race condition still present here? atomics or something

--=20
WBR, @nuclight

