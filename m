Return-Path: <xdp-newbies+bounces-103-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4792794C
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8D921F22835
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B251AEFF6;
	Thu,  4 Jul 2024 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZ/dHeyO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143E27452
	for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2024 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104677; cv=none; b=uHE24pjg7IuOxao5W4qwPjbVn1kOmrDhKio5QpQ/ep+s30nID07hFDzgOI2g1atxEoHtwPOTqU6HzEQ5CnNKxiHFDNulh6WbO7AwtzqbMDHeuHIEgc+KVw0JrPgrKawTMnXowze/0O1eh9YrCX/GhDFeitQwniu2YhjskVqI5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104677; c=relaxed/simple;
	bh=oBrMkFMs5/BIBMcIabKQzOc4+BD+NJJI5lbLbX5Myi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bidP65dF9dwbCLozfnNqyh0mOF6Vp7BRDHfFHupipWJwGzH9tbrwyTDthZNQVD458VTXi2OsbKyrRU8mpPIg9Xtrt6C1k7donMQ90F7/f5/J1XywEXMYbI9ZqktghCqsGyYE3oOlP42vEXWSxFZOHFAfMLzgDmDSfi1FVLsFhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZ/dHeyO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720104674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnF7NOTtf/TDs8uTtQ9gUWLu7+5cMDHpoKrcehlBU+Q=;
	b=aZ/dHeyOSvF3xiAM22Y40yZIq+b8sB/ItR2WB5DK17bLjOa4PEXxTZTnIz6i0EvY2D/q2X
	Fm2kEBgfWRyDkyQ7tPzkM5JQzjxRJYWeOpLeRmiVU0IBim5Q2rwyzX0X88MfjfgJ5bVIfn
	p+wTU3tJAqSEzw3VZ7PMCxEcwnD5fhM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-YsYim_zoOJaO8x1AYHwusQ-1; Thu, 04 Jul 2024 10:51:13 -0400
X-MC-Unique: YsYim_zoOJaO8x1AYHwusQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4258675a4f9so5302215e9.2
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2024 07:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104672; x=1720709472;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnF7NOTtf/TDs8uTtQ9gUWLu7+5cMDHpoKrcehlBU+Q=;
        b=Pl2N7pKVdqsjUkiy/aiTdXhIVmZ7R12BZOSFRHe1jXd35qdHGThlTgCmza3F+cUsNM
         or6Ylj/q6Grzt+Xsxu1g8Yxyh9we7rpd/dw9qOkcpqRf8Gn6rQIsYqG40hJH/GNu454j
         DEyB9O+cby7Xi1O6i4kFVQs/v4HKAFgauQ7UDMjWnkpmeKi3kguB2kVokFnFnlblUY5t
         Nv803AMzRdWSmsyJKKqKe/qqecmp1QNVyX/Vw12EjocCnEPfuVlFJozmuwHS7XLGcgUk
         mKH0dmKVPj16Q7H0jrHYkSsYuEFGwczsBOQTmMkp6bkucZZxo3nsyZa1PpC3R0RU5yt/
         Gxxw==
X-Forwarded-Encrypted: i=1; AJvYcCV0rCQwS1qgHL+TLP6SwCvFCz6tFJj72z1n47urFiUe5rYIbIa90x3F7OldEOwDdTW5gDh4WFYOyD5PxGMbCdL7sTrsUEXmWoXNsFY=
X-Gm-Message-State: AOJu0YygMrl3VH5KkQ8XjAPHJWA1sUonc4O106EUs2IthrjpTy3h5oN9
	mdOHwusCNVtWxLOMcXHeUg7HPNnkiC43d3z6bT0n1/ihqYYJp0/yoWX475fkVg5VkYEpbtvii5B
	SIUfEsq+ebUiTTwCPLbFBMZg6q/C8F+87kWxOYKt3rjnP2pavYbGZwatc5DO1
X-Received: by 2002:a5d:498f:0:b0:367:8a25:18d1 with SMTP id ffacd0b85a97d-3679dd71f4emr1130825f8f.69.1720104672417;
        Thu, 04 Jul 2024 07:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3D3Rt+rz5lTZNSuOLDcTKqH9sUkHLv+KxG9UphUKCjK6hq3ksb5R+SEeI+CHXQuwPjYi1wg==
X-Received: by 2002:a5d:498f:0:b0:367:8a25:18d1 with SMTP id ffacd0b85a97d-3679dd71f4emr1130810f8f.69.1720104672055;
        Thu, 04 Jul 2024 07:51:12 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e12fcsm18626243f8f.48.2024.07.04.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:51:11 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5A96813FDBCA; Thu, 04 Jul 2024 16:51:10 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-newbies@vger.kernel.org
Cc: Ferenc Fejes <ferenc.fejes@ericsson.com>
Subject: Re: Different packet handling after bpf_redirect_map with
 BPF_F_BROADCAST
In-Reply-To: <76f0edb8-b510-49b6-a541-5f9ccf703b0c@linutronix.de>
References: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
 <87msmx1k0j.fsf@toke.dk>
 <81d6605e-f28f-4457-81f8-5f8b4b33e8ff@linutronix.de>
 <87ed891gs5.fsf@toke.dk>
 <76f0edb8-b510-49b6-a541-5f9ccf703b0c@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 04 Jul 2024 16:51:10 +0200
Message-ID: <87tth59pnl.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Florian Kauer <florian.kauer@linutronix.de> writes:

>>>>> 3. Extend the kernel with a way to let the xdp/devmap prog know from
>>>>> which DEVMAP entry its execution originates (like an additional entry
>>>>> in the bpf_devmap_val that is then set in the xdp_md).
>>>>
>>>> This could be useful in any case, so I would personally be fine with
>>>> adding something like this (for both devmap and cpumap) :)
>>>
>>> Would you prefer a simple u32 (or similar) that could then be used as
>>> index for an array or a more complex data structure/void* to fill
>>> with arbitrary data?
>> 
>> Well, the API for map indexing specifies a u64 map index, so just
>> reusing that would be the simplest :)
>
> u64? Now I am confused:
> "The key type is an unsigned 32-bit integer (4 bytes)"
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/bpf/map_array.rst?h=next-20240703

That's the documentation for array maps. Devmap is documented here:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/bpf/map_devmap.rst?h=next-20240703

The text doesn't say anything explicitly about the key type, but the
function signature for the redirect function has not been updated, it
seems. The key type was changed to u64 in commit:

32637e33003f ("bpf: Expand map key argument of bpf_redirect_map to u64")

-Toke


