Return-Path: <xdp-newbies+bounces-153-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A709ACA0D
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 14:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16376B2252C
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 12:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFCF1A76CC;
	Wed, 23 Oct 2024 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUlExcX5"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69536155C87
	for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729686679; cv=none; b=Pfzq4g2t2hx2hM2KMz+/heKFs6lbnG27UBJDicCiKhZHAmq1vz7IpzntHtFsNVS0SR5VDtdlaMGVqRpbZnhMszWiFTal7PF51Kq8MQr8qfuM386tqpuu1h5Z+PJSfXd610+M5LcfJR7sP9lJhyMyQXvx6Xz/1pXbdaiXobO5pZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729686679; c=relaxed/simple;
	bh=8i9iyEOCtXRRzCnZiKPN7yDpx/NAShkAcHF0JfsZWgg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+Q/xqIvv7NOZY0lG4XJw1K1GVRfe8CyJkkQyn80rHqar2kbyZWRgL+N2zRKFyEbbOQImVuNIr+HEI2Y3b64fpHRa9BNIXfaJD963blSRfUQ5OnWecDK6lnh0EokpqlbZb9K5bf2LkBX+Vz3JGK0DcVb9Rbcl2gmgrAuzT39c70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUlExcX5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f53973fdso762911e87.1
        for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729686674; x=1730291474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z337n/g2XYWujxEzK5VR/4OjqD6ARCS4QldFg2roH6Q=;
        b=kUlExcX5hGo6RMOwwmLeby83fa9fP/fG4aqrcZB5/tY/NZfB+JYqQy5HPO8MM8sGBO
         +Uea5DnAFitYT0hEbzSA+c/5FT2dN32OdN+UfuoxcKJoE6Q8dczF/ztvN4Prq43FgvoO
         +B44+Hi4waB/FD6EOEbuFz0hhjgD0oZnH0MlLrXuuQVIKD4ehixTjleJxEP/gaXxVbvh
         oMugQFnDIPYFTn5cup4MpPFizGebmmHHnabKW3NhCgqYTczq4uYyFLbim5d761hJMQe2
         BpuF6fLea0UXoPmw4GiIrBSgUhFTo3bL3m3qxAXhCOyih2hIi3QNT0kd86UfKmQULEuv
         vo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686674; x=1730291474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z337n/g2XYWujxEzK5VR/4OjqD6ARCS4QldFg2roH6Q=;
        b=EomUDr+FYUGxuvV+wJN3IEikbSYSF8AQJ9WSl8Dl0IkH+SQpfArF595T7sQoDbZMa7
         lquRH8N9o7e++ZCeAp3g6UvRlPhzezcCZXdBa6wEC7SLaxC6lHtVBOfibBaS7eP5dD2k
         jEh0yY5X0aDs5BrrASN5VxPOCrntWraaLHTDOTZBFO3/EdnYXXCMMILA1qMoA6C2zap+
         5osU03BXzBeKcZ2Jikq5dRtGt9J6MAOZCRlQjm3FScIh7n52Gj1HsMFr7b2jv8g6ztVA
         egD2LloHS7Z3J4QsDLOe+7T5gTy82QWX3j8sVGEkZ3uR9bsEqci0CjLx4tk1lruO2qAe
         yqNw==
X-Gm-Message-State: AOJu0Yy+/u+oOaMHFIhhhrdubshBgQ8+fhZmHogQl/rtvZiID5fyD8/P
	6VsiqClBGI7sPDyw17OhgBSeeVgAxr/sI7QA14x82BRyFujbJdWEw1mA+Q==
X-Google-Smtp-Source: AGHT+IEqrRrn49On6ZbiGYa+2nno//TtC6VBragSY+5BPr1hjH6BFphdvUwXQ4zBwsJugIaf0khQZQ==
X-Received: by 2002:a05:6512:2810:b0:539:fbf8:5735 with SMTP id 2adb3069b0e04-53b19c66f8emr851776e87.8.1729686673978;
        Wed, 23 Oct 2024 05:31:13 -0700 (PDT)
Received: from nuclight.lan ([37.204.254.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e58aesm1047788e87.28.2024.10.23.05.31.13
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:31:13 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:31:11 +0300
From: Vadim Goncharov <vadimnuclight@gmail.com>
To: xdp-newbies@vger.kernel.org
Subject: Re: XDP/eBPF map thread safety in kernel (e.g. lookup/delete)
Message-ID: <20241023153111.2f18d350@nuclight.lan>
In-Reply-To: <871q07ggv0.fsf@toke.dk>
References: <20241023145426.210fce4d@nuclight.lan>
	<871q07ggv0.fsf@toke.dk>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; amd64-portbld-freebsd12.4)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Oct 2024 14:10:11 +0200
Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:

> Vadim Goncharov <vadimnuclight@gmail.com> writes:
>  =20
> > Hello,
> >
> > Where to find exact documentation about what happens in kernel BPF
> > helpers calls with respect to locking? For example, I have
> > `bpf_map_lookup_elem()` in one thread, then work on pointer, and at
> > this time, another thread does `bpf_map_delete_elem()` for exactly
> > same key. What happens to memory the first thread still continue to
> > work on? Is it now dangling pointer to nowhere?
> >
> > In my particular case it's a bpf_timer callback who does
> > `bpf_map_delete_elem()`. I'd prefer for it to not delete entry if
> > another thread did `lookup` and works already, is it possible to do
> > so (in a performant way)?   =20
>=20
> Map elements are RCU protected,  =20

I see this phrase everywhere, but always without details, whether it's
about just map structures itself (OK, this minimum is guaranteed) or
the user data, too.

> so you already get exactly the
> behaviour you're after: if another thread deletes a map element that
> you already looked up, the element is guaranteed to stick around in
> memory until the BPF program exits.
>=20
> It won't be valid anymore *after* that of course, so if you're doing
> concurrent updates it's you own responsibility to sync appropriately.
> But there is no risk of the pointer suddenly being invalid in the
> middle of the program execution (so no crashes) :) =20

OK, no crash is half of good, thanks. But how'd I lock it from
deletion? A "concurrent updates" are usually about memory area that
still persist as a whole, but in my particular case it's a
bpf_timer callback who does bpf_map_delete_elem(). This is a
conntrack-like map - an entry contains some information about
connection, a struct bpf_timer and expire field when this entry should
be deleted due to inactivity, based on information in a connection
(thus *_LRU map types are not suitable for me). So it's possible for a
race condition here:

1.  Thread 1 receives packet, does bpf_map_lookup_elem() and begins
    processing, at end of which bpf_timer_start() will be called to
    reschedule removal into future.

2.  At moment after lookup, timer callback fires and does
    bpf_map_delete_elem() while first thread is not yet finished.

So how do I prevent connection record loss in such scenario?

--=20
WBR, @nuclight

