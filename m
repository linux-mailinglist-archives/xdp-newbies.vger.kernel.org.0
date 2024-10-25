Return-Path: <xdp-newbies+bounces-157-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8579B00E2
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Oct 2024 13:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18461C20AEB
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Oct 2024 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D509A1D2B02;
	Fri, 25 Oct 2024 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIoEt23/"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F422B66D
	for <xdp-newbies@vger.kernel.org>; Fri, 25 Oct 2024 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854425; cv=none; b=hmPudS6+pkUoMKRXeGaJ9IQ2IMWCi5G/QuOJXkaRGzprBwMXuwDDrcMyAPwg8+t3GlHo3rdzP+PCyGVQod6AKkmyuZKvc0LsNjp0QAyEeqYb4IbXGLeXM3hxYQ1oUVOHKgKC69egLhiiypO6JCierafiXJtHqzE7vv3imfjekbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854425; c=relaxed/simple;
	bh=iOTbyat07QI800P4N0Zs0r84eXGvkE4xs1LCXkxwnyI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MthaULd4xDxNO+fpYhyhE3LBuhUE8zpDATHa8J3j5DaUr3uqb2iICUuAO+oEz4uppzEQh7yLW1uQHWlsQEDeZGSuqE0MgXybrk1WhZmfD4UrrkXflDgwbu7j42rWban3yjWuJmTS4pvUW9BDk/JL44/15fsiiIGjndxMQK/woa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIoEt23/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729854422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkEe6GiwGTyMIM1fhmBZjjjvA9NvF3/SJ7D8Usyc/JA=;
	b=OIoEt23/dGesJANsbOmoZbp+P9LSsutDgcRT8lJCVXJvhfGo8J4k0s6uyHXKjG3yq1UMC7
	nUVmeGoB8+pz2alVMR0UIPTcPluz+hZxUq5Ih7Jrrl/6r/oFIYd2R8Ow/KljtfUeq0/RwR
	jTTjRI/2sug9dymw9EMjDrFA2TGWsrI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-a5b9RF7UP3WfkVcgSsVSTw-1; Fri, 25 Oct 2024 07:07:01 -0400
X-MC-Unique: a5b9RF7UP3WfkVcgSsVSTw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99f43c4c7bso125925366b.0
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Oct 2024 04:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854419; x=1730459219;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkEe6GiwGTyMIM1fhmBZjjjvA9NvF3/SJ7D8Usyc/JA=;
        b=cPjtZ+X2Dmqnd/n4i2yHyoP8cU3AIl+nVWmlfeSSe6aLBfCwJXxflOgnBdOhNJ3x3R
         I+KQL99cdmOc5Fd7Vlo5X0ekg4VJ0x+j5vsVwIv6t4NGBSCALS/DESgQwPsPO6YtrBLa
         QvAV/TlvDMlZzYLXXjN6R2gyuvbg4EcvbmnmFykO6oH2BHFKOZ4AlsFi6gmMeSbvgl6E
         j5+NKXoLLfYjbmpeuzyCDWMdRApR43s1s8ct6IF1ih5CHXSuhCKyPYVPwSFStT3JMyNH
         6Q+9LOgf0ootJUdckDdJz0aq2F48xlnNsjyMv23UyZHbb5ueqKs5WcnNc2yNOfZZRb8l
         RehA==
X-Forwarded-Encrypted: i=1; AJvYcCVyzF/gqahtbekkMGj2u2ApEsbnQ8iHEdJ4Kb1hXomqQctWML/U0t3ASlS8jMVCDas+RSfr3b7N9qqVzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaagza9gUKKeeJ1iLjvh9llYGpvTO+ogfUaWsZXf9Vcsbr3ePo
	KbNkPmdwBvzAVvKTykL2Nw3+dgNrI4aYn61Rn7My/Lh/B5bVELn2FonZYxtTKfA+nzh1I8HvxAu
	pz+CYGc3TvRZ/nWs1f4L/dvrq58N8Im+4hNGONwM9Cg08t2eEe5qRvR+ubGwzFGAY0g01
X-Received: by 2002:a17:907:6e94:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9ad275d4ccmr465815266b.29.1729854419425;
        Fri, 25 Oct 2024 04:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyejiLvUzOnf4FhHaw0gYBmc9/3P7EByYJmX0O4DQlXNPyAwoOj4obvgbXx5Aid9zmElu5mw==
X-Received: by 2002:a17:907:6e94:b0:a9a:188f:efd9 with SMTP id a640c23a62f3a-a9ad275d4ccmr465813466b.29.1729854418959;
        Fri, 25 Oct 2024 04:06:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0881d4sm57249566b.216.2024.10.25.04.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:06:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 6ADF1160B567; Fri, 25 Oct 2024 13:06:57 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Vadim Goncharov <vadimnuclight@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP/eBPF map thread safety in kernel (e.g. lookup/delete)
In-Reply-To: <20241025001819.2475ec77@nuclight.lan>
References: <20241023145426.210fce4d@nuclight.lan> <871q07ggv0.fsf@toke.dk>
 <20241023152810.42936dc4@nuclight.lan> <875xphftdq.fsf@toke.dk>
 <20241025001819.2475ec77@nuclight.lan>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 25 Oct 2024 13:06:57 +0200
Message-ID: <87ttd0e90u.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vadim Goncharov <vadimnuclight@gmail.com> writes:

>> > OK, no crash is half of good, thanks. But how'd I lock it from
>> > deletion? A "concurrent updates" are usually about memory area that
>> > still persist as a whole, but in my particular case it's a
>> > bpf_timer callback who does bpf_map_delete_elem(). This is a
>> > conntrack-like map - an entry contains some information about
>> > connection, a struct bpf_timer and expire field when this entry
>> > should be deleted due to inactivity, based on information in a
>> > connection (thus *_LRU map types are not suitable for me). So it's
>> > possible for a race condition here:
>> >
>> > 1.  Thread 1 receives packet, does bpf_map_lookup_elem() and begins
>> >     processing, at end of which bpf_timer_start() will be called to
>> >     reschedule removal into future.
>> >
>> > 2.  At moment after lookup, timer callback fires and does
>> >     bpf_map_delete_elem() while first thread is not yet finished.
>> >
>> > So how do I prevent connection record loss in such scenario?  
>> 
>> Yeah, there is no protection against this; you will have to do your
>> own locking to prevent it. Something like putting a spinlock into
>> your data structure and using that to synchronise access, maybe?
>
> Well, if I'll put bpf_spin_lock into map element, then it looks like
> the following scenario is possible:
>
> 1. Thread 1 receives packet, does bpf_map_lookup_elem(map, key)
>
>      1a. Timer callback(map, same_key) does bpf_spin_lock on same_key
>
> 2. Thread 2 does bpf_spin_lock on same_key and waits.
>
>      2a. Timer callback sees lock successful, sets DELETED flag in entry
>          and bpf_map_delete_elem()'s it.
>
> 3. Thread 1 unlocked and either updates map entry directly by pointer,
>     or reinserts new entry reinitializing timer.

Yeah, something like this.

> Am I missing some race condition still present here? atomics or
> something

Unfortunately, I think the delete and update can still race. Deletion is
based on the key only, there is no cmpxchg() semantics. So I don't see
any reason why this sequence of events couldn't happen:

- T2 sets the DELETED flag
- T2 releases the lock, and then gets preempted
- T1 grabs the lock, sees the deleted flag, allocates a new item and
  inserts it with update()
- T2 wakes back up and does a bpf_map_delete() with the expired key,
  which then ends up deleting the new entry

The only way I can think of to avoid this, is if the timer callback uses
bpf_map_lookup_and_delete_item(), then rechecks the value and re-inserts
it if the DELETED flag disappeared between operations. But this still
leaves a window where the entry doesn't exist.

Maybe someone else has a good idea for how to avoid this being racy?

-Toke


