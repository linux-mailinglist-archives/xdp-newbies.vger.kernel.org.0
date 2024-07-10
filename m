Return-Path: <xdp-newbies+bounces-115-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F392D00C
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jul 2024 13:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A591EB21753
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jul 2024 10:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C4F16D4F9;
	Wed, 10 Jul 2024 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuhcfKYJ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F153C39
	for <xdp-newbies@vger.kernel.org>; Wed, 10 Jul 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609104; cv=none; b=UpjOP1GctMFiqEr+D5Gp0dpQ9ZqWLUzFn4NW8MhVEb7UoFhPuN1LhxS2O6jFYZsPhwYxzPwi7bKKPkPop7s13cCHDSMwQIjcxjAMdsMafhYMpxOefBu1oxmc6zmQDx3c3Mo27XWCNsQ+DIXBuIKuZ+Viyq33uqjpkSQMqBnOgBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609104; c=relaxed/simple;
	bh=Tl8Tr7EXa9iZe2qwKORjaHToMD1guSTjLV3fPRokJGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KW0NSFv24kT9USU7fXFSMGGQgRbOuTEbWOcnvzKjgVWS3O+/+POYecHvvH4r2I7RjcHH0B76tYruz3Ojy5BbDvb2UbEZq78ODbjuC5zWstHd3AmXmjVxsldiJdFfOekYgGiO+srZrNVZ7R/UqjQWK2ODAVDCVSu9uNZotAq6okE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuhcfKYJ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4467b4bcf80so2018251cf.0
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jul 2024 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720609102; x=1721213902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl8Tr7EXa9iZe2qwKORjaHToMD1guSTjLV3fPRokJGM=;
        b=UuhcfKYJECyvl+KXppZ/C3AZ1chmuu8R7afneUDSjO6WHZYMcNR6hxD/NuwU8LbTey
         NYSBRVHD8ddhvFKdd0CMd1DzvirU4tjosBzlJybsTQPXmXB6AE+cSGKCUUHAsd4+H6IW
         IUgHjndrequz1D6tDsEQVRwIJjKEt/VCX1Z7VeomoudVXzu9BkYOFTEy9EefBlq6NI5x
         bygBLETBimTs5Uc2MD9ajcPoYGTrGT5RGrKoZC2UWFFIQR1JyG5lX9YCuDFUdAtQgtfd
         bxScK2Y1kgmON+293qYOn1FNG/FidRiW6jdo46FDk8914VXpf/449898OHEfXUksa3f4
         JuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609102; x=1721213902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tl8Tr7EXa9iZe2qwKORjaHToMD1guSTjLV3fPRokJGM=;
        b=J9tnhk+nn1cjK/XOF/oghGRoyxC3a2iak+96hjV9Ait5mq2StoVwZq0QYQFidu9Z3i
         qg0MPjtiwhaf8IKiN3UW8qw7Z9DRS1QMSZPdEImrkFI63uvO9pnsFM44nwg6j4SKAZIw
         KRV4CIcT6srJY71pZm7VA3XptQ+nocF4mQz5VfJjw0GoloKPd7KDmveLNv8sFAOoWBOp
         WQawNYEESApE1uYr1yFkh1iuxlmwQ8FpMReao/3KucQTN0PXonCO6aFq8h5duUd+VHky
         m2kLpyMPhy3pmIMUZy7VmWLFf3OuIep2Uw74CL0AkRsFNBrsgTVuMapnLHUV46P0dd3e
         KV8w==
X-Gm-Message-State: AOJu0YwssNra2HTrFBR4TdtDs87rVYHCKN119QBuNCvms6JNbMigM7x2
	1jcPwyt0AR2IuSguxAOLMtge5AvaAQ0mEYhFR//Y7q36HLZd05us+NnwJ+SVH0TlRKsfumVyKnO
	OhxerlpEwKWI+nw90QwfRjHUqSmY=
X-Google-Smtp-Source: AGHT+IH5lwsXvUJoofsjlcjVZ1qVZ2lmuFrH7glO5oyLq3IuppkLU8LV9ars33PmsZwJ0Hjh+2MNXLWm7eouaIBAJYQ=
X-Received: by 2002:ad4:5ca7:0:b0:6b5:3c38:5238 with SMTP id
 6a1803df08f44-6b61c3b554dmr54068506d6.5.1720609101892; Wed, 10 Jul 2024
 03:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
 <CAJ8uoz2huw4QRtBO++=+htSQM3fZHHfR1Twh41hs0r1r-WGYmQ@mail.gmail.com> <CANzUK59AQycWhFH4wtg6hff5AF2LEPEGstr2nLWh2CX_kcv3Yg@mail.gmail.com>
In-Reply-To: <CANzUK59AQycWhFH4wtg6hff5AF2LEPEGstr2nLWh2CX_kcv3Yg@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 10 Jul 2024 12:58:10 +0200
Message-ID: <CAJ8uoz34TEU9SLwQfTinig_rUkyK7ZXzz0-MunvWtTv14f12CQ@mail.gmail.com>
Subject: Re: ixgbe zero-copy performance
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jul 2024 at 12:07, Srivats P <pstavirs@gmail.com> wrote:
>
> > > What is the expected performance for AF_XDP txpnly in zero-copy and copy modes?
> > >
> > > With Kernel 6.5.0 and the same ixgbe driver, this is what we see -
> > >
> > > ZC mode: 4.3Mpps
> > > Copy mode: 3.3Mpps
> > >
> > > This doesn't seem right. Shouldn't the zero copy performance be MUCH higher?
> >
> > Zero-copy performance should be line rate for the ixgbe card, so
> > somewhere around 15Mpps. SKB mode seems in the correct ballpark. Try
> > pinning the app to a core the driver does not run on, or use busy-poll
> > mode "-B". If you are running on a NUMA system, make sure you are
> > running both driver and app on the NUMA node you have plugged your NIC
> > into.
>
> I had forced zero-copy mode (-z) and copy mode (-c) to get the above
> results. So the xsk creation would have failed if it were not zero
> copy mode.

Just to avoid any confusion: copy mode = skb mode for Tx. The 3Mpps
seems about correct for that mode.

> This is not a NUMA system - just one CPU with 8 cores, HT
> disabled. Nothing else taking up CPU on the system, so I don't think
> the app and the softirq would have been sharing a core.

I would ask them so that this is not the case. It happens.

> Unfortunately, this is at a customer - so I have asked them to try
> taskset or use -B. Will update when I hear back from them.

Sounds good.

> Thanks Magnus!
>
> Srivats

