Return-Path: <xdp-newbies+bounces-105-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DCF927A43
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 17:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB2D1F2600F
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 15:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96751B012A;
	Thu,  4 Jul 2024 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNp4HOYz"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3201AEFF4
	for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107403; cv=none; b=hGzOmuqezqxTEDIjNV+u5fyzjxuFovcHYBPHd2/Oa8RSvGyysYbki0/cSIH14dUMQ7cm7fEdcAB+pgqEOUxES1t1j12UtBnytPZA9mewc7tcKQYektz9mHa66HxCZRTVEAsp3+E+KLt/+/bNlWUukXsC4ZiqZlmYUKbcROr+jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107403; c=relaxed/simple;
	bh=6qrmF6Kwid5rrg8/3LTGy8HL2VnnVHjsTaMK6xQp1xI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dk1ZNC90NkHg3lKepzBIHKiOZhaN1f8DIIrDmeNDNbyLxQnUgFnHcOVYl/J42OPmzShUFMwQA3xivAZqF2DuCKdzrbO+PJjsjex2AmwZi8V2hMzHLIzlpnRHzG75A0ttIAJgSXgDVfed2NnPdsrvVX9Bmr/tIixVWLeQktyECUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNp4HOYz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720107400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6qrmF6Kwid5rrg8/3LTGy8HL2VnnVHjsTaMK6xQp1xI=;
	b=fNp4HOYzQkQT45KJBE9dugX+pyzGpIYL3X9/O5o8tHf3b+7psz4PGcjADfW+4IOoDOB1do
	dz2pgBOrngMlR+cf0H+EbvoRoOH02rNef2X/tI0bBEb1QiikAeCTqcP2YvISFpxs3cVAZl
	R/5s0RNgxDcxn3fv03qAR631gyFfze8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Sd3Q8dAhMPibB1T1pqeUMA-1; Thu, 04 Jul 2024 11:36:39 -0400
X-MC-Unique: Sd3Q8dAhMPibB1T1pqeUMA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4256718144dso7598985e9.1
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2024 08:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720107398; x=1720712198;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qrmF6Kwid5rrg8/3LTGy8HL2VnnVHjsTaMK6xQp1xI=;
        b=pE/X+hJx5Eb+T3uTwsYbJglQXmTtPL6tug+vdsggbSdwi6bylPRws3YTvWvr8VzoJF
         Sb3TR47vP+tv8VOWhdoN6G1CnlLl4xC2o/KoE6gooAeGCRzrS1YSIK8vI7zHkzdKz58D
         BG2nvozDgq9LH1F21thtCAsIMlo74hZu3BoXrDJdzEyzvBfFjwUJSVt3cSRmAKxABw1p
         LVH7HZcJVYOFSXCUt5w4f7rsON+R40N4TBCPWZ4PCZGOtBaikVE2mAsFKcxxtIEb4/xb
         etoWKMwwBKpew2HEFX+N4nJ7bpcQl4MB5uZr/TiqJz975hPfnF5DUX/1+5kbMv8Y66sI
         2VtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVrkimxblhaRgjsvPgT6cTpiLMlhDLXdWVbAJ/85zVVNiMv+/lWJyHWIV2pGbUnkn8tYNEB86m9bsVE/eCoZErCdpCYM6bqi5wglc=
X-Gm-Message-State: AOJu0YyRZPTpp2GlXAgERTsH7k3uBnZ1G5gFWktnR3XBoadLYGBRRlQ6
	5pW+rTt6EeV1ErWYdpPUUkGn/ojWkPW8EW54qhjSuAd1b/S/afzi6xOAVkn/Dok/PSSSRxbJJFq
	oiKUUY9XzgO7fAB7hLYeS3noR3j0Ii1kkSJ/lmlcS/5H+qIlWyPQTVNBbsvRL
X-Received: by 2002:a05:600c:2e4b:b0:425:6a52:eaa5 with SMTP id 5b1f17b1804b1-4264a44d0e9mr17545635e9.41.1720107398432;
        Thu, 04 Jul 2024 08:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFryZIdV3zkF7P9Y4mFV2+XFbndkXgXTgpTgCy8ocQHZt3ViaIu4sQp5EDZSusjIhq0DPLhcA==
X-Received: by 2002:a05:600c:2e4b:b0:425:6a52:eaa5 with SMTP id 5b1f17b1804b1-4264a44d0e9mr17545515e9.41.1720107398064;
        Thu, 04 Jul 2024 08:36:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a25198dsm28812465e9.32.2024.07.04.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:36:37 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 1CA8B13FDBF5; Thu, 04 Jul 2024 17:36:37 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-newbies@vger.kernel.org
Cc: Ferenc Fejes <ferenc.fejes@ericsson.com>
Subject: Re: Different packet handling after bpf_redirect_map with
 BPF_F_BROADCAST
In-Reply-To: <96e2f767-1dfc-4036-b7f8-3132e372048d@linutronix.de>
References: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
 <87msmx1k0j.fsf@toke.dk>
 <81d6605e-f28f-4457-81f8-5f8b4b33e8ff@linutronix.de>
 <87ed891gs5.fsf@toke.dk>
 <76f0edb8-b510-49b6-a541-5f9ccf703b0c@linutronix.de>
 <87tth59pnl.fsf@toke.dk>
 <96e2f767-1dfc-4036-b7f8-3132e372048d@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 04 Jul 2024 17:36:37 +0200
Message-ID: <87cynt9nju.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Florian Kauer <florian.kauer@linutronix.de> writes:

> On 7/4/24 16:51, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>>>>>> 3. Extend the kernel with a way to let the xdp/devmap prog know from
>>>>>>> which DEVMAP entry its execution originates (like an additional ent=
ry
>>>>>>> in the bpf_devmap_val that is then set in the xdp_md).
>>>>>>
>>>>>> This could be useful in any case, so I would personally be fine with
>>>>>> adding something like this (for both devmap and cpumap) :)
>>>>>
>>>>> Would you prefer a simple u32 (or similar) that could then be used as
>>>>> index for an array or a more complex data structure/void* to fill
>>>>> with arbitrary data?
>>>>
>>>> Well, the API for map indexing specifies a u64 map index, so just
>>>> reusing that would be the simplest :)
>>>
>>> u64? Now I am confused:
>>> "The key type is an unsigned 32-bit integer (4 bytes)"
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/bpf/map_array.rst?h=3Dnext-20240703
>>=20
>> That's the documentation for array maps. Devmap is documented here:
>
> Well, an array map would be where I would search for the needed informati=
on
> (like the VLAN tag) after the redirect.
>
> But I guess you meant not just "reusing" the TYPE of the devmap map index
> for another field in bpf_devmap_val, but actually reusing the devmap index
> itself and write it into the xdp_md, right? Then, of course, it would be
> a u64 (and needs to be truncated when indexing the array with the VLAN
> tags).

Yes, exactly. The "you are currently running in this devmap slot"
metadata is something the kernel should provide to the running program
as part of the execution context.

> Makes sense to me. I will try to assemble a patch and send it out for
> discussion.

Cool :)

-Toke


