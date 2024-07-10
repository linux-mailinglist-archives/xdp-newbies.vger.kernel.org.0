Return-Path: <xdp-newbies+bounces-114-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6A92CEDC
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jul 2024 12:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE1C284CAB
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jul 2024 10:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C66D18FA32;
	Wed, 10 Jul 2024 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia3hMBXm"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4D8288F
	for <xdp-newbies@vger.kernel.org>; Wed, 10 Jul 2024 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720606062; cv=none; b=Y/bfNEm4kin/+Ly3zlzlKDwulZS99+XrF7a4Fx/tzd/xLH7wbe/L33GdfsbKFIXKGpl9d1Uqeg5jPWFqi4tkW0Y+3sUayNtQrpYLMCODTMlOnV6WvXDaBMzxauD+ORIsxZIhCIi8OfJIk4JfTJfr9JWJ8PB3+7X9IK/qv04zsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720606062; c=relaxed/simple;
	bh=mQ67yulTWaIuco6/RvGtOtDx5PSwx0wqpx3bGL0L2IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtMnPaM28cYCSJezuZbQUKP8wdxrw6A7QvdoWh5o8nK2J/SpfmhjmmenDH+CkY8Y0zE5Bzxw/8QTP7DgZIjTfNwoaWPTEc0OXnKXhQpt2wm3QEfrqV58Hiu4Tw5Tclvj01RrjDFJmaffR3W5lE+DzFPqLsliuz2I2Fl098SIZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia3hMBXm; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e03a8955ae3so6027236276.1
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jul 2024 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720606060; x=1721210860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ67yulTWaIuco6/RvGtOtDx5PSwx0wqpx3bGL0L2IQ=;
        b=ia3hMBXmDD9+ZWKbb25f3CNB7qnWodwHmRuYx/SS8juaiQkHNGFGuu6zYSsluOVAx/
         JVUqillDdXzVICVCYCBxK9tCFhIzprfmwuRXobc9gARXUfsrjxvlRgoAwcKrDyNhMpRk
         B+E4NT53cW8Wx0NfvVA05tX+xvUdR2m51c/VAxIvyb8zX5grdMhL1cgb3U/KswMaynOm
         vWiRG9Jw5m6PUd1SL+fR7nK7poN8siEWrN0PkdtLKWOpHV8nKDI1QReFa+/+JvSzH4TH
         9ob1kNW1XPMNQIrH98hM/lBFy+i6vxkYtLFts5pJwXMi/29OE9CFbPn8PnPhCFzTLrwC
         RWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720606060; x=1721210860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQ67yulTWaIuco6/RvGtOtDx5PSwx0wqpx3bGL0L2IQ=;
        b=kNX15QkqdMrb0S1Jdl9O7KlcSeoQ0XX8NV3qwf1a/bRffeN0wYMw75qT0hT11EH0E5
         20Ugx1l3CAXn8yMsCuNsmsxGglBZfIHxgZBohzQm11ptystdgJ6dOWHrnGszpaOwRYns
         dw2yiAayM0Lb0TPPy+f8zF67q10UojZs9Wd7xiLtY7IomQC9K2sa2ORQ8l97vvXHyx+L
         0WcJDR+Yk/1ElY+EUpspTbTbVTI4QczP+S1J2+BD4y9kBjqo1gI/CJBKjU+d6a5olciV
         G5FPsYLYlykQNS6JiNS3z3c3NGsadyChXvdrdzZ9MdAyFqkfb05XBX/1HVL620RNOEFv
         90cg==
X-Gm-Message-State: AOJu0YxknUMPjHXR+FkviT0MF8uQeUHB9UeqpyyffANAP9A5AbGf+SJ2
	JyL/7AQp944v913KY4EPkJvYzL0vnNv3ungCKwiarmchZ7w561Vojgu5Uud7YWjhwnMmxZTn2d1
	nalZE85NgG5clh+eVj19L4Ty88jc=
X-Google-Smtp-Source: AGHT+IFoqXQf3HZUCnaQg8Acp58P0kK4NWf10o7x5xFrLl0o06BiPS+cDg1dzaol0lhHkHrN1+hZri4FfPiFQnHB180=
X-Received: by 2002:a25:ada2:0:b0:e02:b60c:3d2 with SMTP id
 3f1490d57ef6-e041b1e3b0cmr5693861276.50.1720606059857; Wed, 10 Jul 2024
 03:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
 <CAJ8uoz2huw4QRtBO++=+htSQM3fZHHfR1Twh41hs0r1r-WGYmQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz2huw4QRtBO++=+htSQM3fZHHfR1Twh41hs0r1r-WGYmQ@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Wed, 10 Jul 2024 15:37:03 +0530
Message-ID: <CANzUK59AQycWhFH4wtg6hff5AF2LEPEGstr2nLWh2CX_kcv3Yg@mail.gmail.com>
Subject: Re: ixgbe zero-copy performance
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > What is the expected performance for AF_XDP txpnly in zero-copy and copy modes?
> >
> > With Kernel 6.5.0 and the same ixgbe driver, this is what we see -
> >
> > ZC mode: 4.3Mpps
> > Copy mode: 3.3Mpps
> >
> > This doesn't seem right. Shouldn't the zero copy performance be MUCH higher?
>
> Zero-copy performance should be line rate for the ixgbe card, so
> somewhere around 15Mpps. SKB mode seems in the correct ballpark. Try
> pinning the app to a core the driver does not run on, or use busy-poll
> mode "-B". If you are running on a NUMA system, make sure you are
> running both driver and app on the NUMA node you have plugged your NIC
> into.

I had forced zero-copy mode (-z) and copy mode (-c) to get the above
results. So the xsk creation would have failed if it were not zero
copy mode. This is not a NUMA system - just one CPU with 8 cores, HT
disabled. Nothing else taking up CPU on the system, so I don't think
the app and the softirq would have been sharing a core.

Unfortunately, this is at a customer - so I have asked them to try
taskset or use -B. Will update when I hear back from them.

Thanks Magnus!

Srivats

