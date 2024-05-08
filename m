Return-Path: <xdp-newbies+bounces-66-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010A8BFBC7
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 May 2024 13:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02652283F3F
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 May 2024 11:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F27F8288A;
	Wed,  8 May 2024 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfcyKod6"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C682D68
	for <xdp-newbies@vger.kernel.org>; Wed,  8 May 2024 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167164; cv=none; b=DkkNh78+urpR0QAEuk54vSU/vY2OZb/9dPJ56Sr5Lp/7rgDRUbkirazCkmzCZ5Nbiu2rmNlqLQRQ6yzn2bfh2665SjYlL5KRtzSvdOy/RCBnJsKM9CBVN1cAJkgLqL50gf/ohI5lrHQYVaUP0orNdM6yOacvIczsxiC/wBAP3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167164; c=relaxed/simple;
	bh=rhgUILoARxsTyTFzxp1nOGE6ueVR6iXedeaH+0br82Q=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=URsIjhCE2t6nuqf96e4/HdLnKg3EBSKFeRlu8bzFyOwAcH0la8AqcWiLj5aUk2whAqpywJUOLhqKGDO+1q2BNkx1nl0yegmaawsNekJ71bjm1O2UeV3ixoQW5s9DkErMCHX0F2uDNMwj/gwqKiVdTB57WyAa8KOZXzxnwimur/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfcyKod6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso29511375e9.0
        for <xdp-newbies@vger.kernel.org>; Wed, 08 May 2024 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715167156; x=1715771956; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kldLeVe24XK9gyk6ywEnXcrhRyXzNALMI3C38AuYMEg=;
        b=PfcyKod6ufvUbCibBk4QQUc0iU4dRxXv6BZ9wZ605OaN+XxoXGikY5/gyFfzEyTmBb
         l9eS3VYyXJdLJxLCR7F0oJDO0BKMbDZhZu7bLba2q5W3LWI6qaoLQbaq6z28UCKAcVAg
         Oke++9emyBxw4ZFN8EpBdTXlIrfCUg0PoN2nXU1J02n6mtS1Su/zowUdp3zxKsMLn5+5
         YFagoM2oUYDszk7LP4R5T+5PDq+7U3I9sSTEDjQBrzO4/Q7ZimuNbMQEDvV/s3Md7e2V
         sDum0b4ruxXiIPl829EgQOGq4K7+EwNpDHMWBd7I0yJjAnh9zpDw/86CmhUgzkbxIVwE
         bqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167156; x=1715771956;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kldLeVe24XK9gyk6ywEnXcrhRyXzNALMI3C38AuYMEg=;
        b=dReC04z4HARODXVwD3PMN6ei5vgl7IQETs+7T1SUfJ7SeevqyUrsw8g9EsfFgKUScT
         NpkPBhCMD1uoYVA28wXNMrV94FUQ0oq/VPAcDaEX3lr0B98aauLmPo6ka85GZIPZLTxH
         yTLVXzubIM2tKLKOu08MX+JxlcFWyuykR3gr1uw3kKG/DHgZVpV7E0Bm0xY+kWd1dZKj
         yQoWfcPs0DSrSWBwVOk8hyP8hfEfAwqf/liu9KTMtrmdmRZ3Qbz5EHO1SyyBivwSrb8d
         OvzeI2ht1nYsnco8CxPfoL+ycmAjXpLM7qWyZTO2Upp0xydI6CXzt8uIGrYN8p2fTvl7
         G3HA==
X-Gm-Message-State: AOJu0YwHNxkCn/ifzkixyKZBCQZ6lxTLW0kD7fpoHzKUSEMuHghiixRM
	Mzno6QX3hJ7pKgRh/cQ7K9cZi7p133aaEjjT+UPq7bz9LVee0TfV7d6Trw==
X-Google-Smtp-Source: AGHT+IGx4/MNgdSUKpzK8yJBvyfrfWpAuVKQGqunfmAQOcobFQYi8blGdI2pDZw3t5Q5MGt6u482zA==
X-Received: by 2002:a05:600c:3ac7:b0:41b:a58c:4f48 with SMTP id 5b1f17b1804b1-41f71309f81mr21242235e9.15.1715167155674;
        Wed, 08 May 2024 04:19:15 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:2558:5b42:a137:4c8a])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b0041906397ab7sm1982474wms.3.2024.05.08.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:19:15 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Chase Hiltz <chase@path.net>
Cc: xdp-newbies@vger.kernel.org
Subject: Re: bpf_map_update_elem returns -ENOMEM
In-Reply-To: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
	(Chase Hiltz's message of "Mon, 6 May 2024 11:19:29 -0400")
Date: Wed, 08 May 2024 12:19:11 +0100
Message-ID: <m2wmo4d00g.fsf@gmail.com>
References: <CAOAiysedBwajcFQwuPrtn5bbdk_5zrNq=oY91j5mWyKdc+06uw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chase Hiltz <chase@path.net> writes:

> Hi,
>
> I'm writing regarding a rather bizarre scenario that I'm hoping
> someone could provide insight on. I have a map defined as follows:
> ```
> struct {
>     __uint(type, BPF_MAP_TYPE_LRU_HASH);
>     __uint(max_entries, 1000000);
>     __type(key, struct my_map_key);
>     __type(value, struct my_map_val);
>     __uint(map_flags, BPF_F_NO_COMMON_LRU);
>     __uint(pinning, LIBBPF_PIN_BY_NAME);
> } my_map SEC(".maps");
> ```
> I have several fentry/fexit programs that need to perform updates in
> this map. After a certain number of map entries has been reached,
> calls to bpf_map_update_elem start returning `-ENOMEM`. As one
> example, I'm observing a program deployment where we have 816032
> entries on a 64 CPU machine, and a certain portion of updates are
> failing. I'm puzzled as to why this is occurring given that:
> - The 1M entries should be preallocated upon map creation (since I'm
> not using `BPF_F_NO_PREALLOC`)
> - The host machine has over 120G of unused memory available at any
> given time

I hoped that I might be able to help here, given that I wrote the
documentation for BPF_MAP_TYPE_LRU_HASH. Unfortunately the details of
LRU eviction are complex, especially when using BPF_F_NO_COMMON_LRU for
per-cpu LRU lists.

The LRU documentation was updated by Joe Stringer, including a flowchart
which you might find helpful:

https://docs.kernel.org/bpf/map_hash.html

Joe also gave a talk about LRU maps LPC a couple of years ago which
might give some insight:

https://lpc.events/event/16/contributions/1368/

> I've previously reduced max_entries by 25% under the assumption that
> this would prevent the problem from occurring, but this only caused
> map updates to start failing at a lower threshold. I believe that this
> is a problem with maps using the `BPF_F_NO_COMMON_LRU` flag, my
> reasoning being that when map updates fail, it occurs consistently for
> specific CPUs.
> At this time, all machines experiencing the problem are running kernel
> version 5.15, however I'm not currently able to try out any newer
> kernels to confirm whether or not the same problem occurs there. Any
> ideas on what could be responsible for this would be greatly
> appreciated!

There have been several updates to the LRU map code since 5.15 so it is
definitely possible that it will behave differently on a 6.x kernel.

> Thanks,
> Chase Hiltz

