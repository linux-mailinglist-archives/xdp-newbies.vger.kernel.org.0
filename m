Return-Path: <xdp-newbies+bounces-52-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DF86D9BE
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 03:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2E21C2268E
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 02:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9311E3B298;
	Fri,  1 Mar 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8djSJl9"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CA3A8FC
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Mar 2024 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709260221; cv=none; b=ikYWNh3FfgNEDXLGFbkeHxBkiKqCsjEiFhjZJD1vCrbxAZq1xh0XRrKGcXoAa4/LHVtrUHpFzmhg4bWSL8FU0YIYPbBnMub1N/nIwOf44SWzAuOqt3UyPrN0+1R8M8GYbGOGUeZcq8ilWuJA0fozJBwn8waU8fIXEEVSizLVCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709260221; c=relaxed/simple;
	bh=AIc60/XlrsZ15zt/pJ3nTB88YPqRYr2eWiCY1dUoVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6XqSfv0MaJuvAw4XT3YB5rk5VLuT7VkbK6IxFfbVRIlaFsuqIa6op19jy/aCFDq8KEQg1De0IWPsENo31+AnGcC8p+zCdDUi3bUOsxUznq8JoVTGuZFdc28SVz2sjNtJjKmYtUx0APobTvfx1G8SP2z2xfZW6Q7JRDbFfYN2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8djSJl9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a293f2280c7so317681266b.1
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Feb 2024 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709260218; x=1709865018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ADpK8Y85+/sk5GOY2j0XDlmVrJU742/ZqUgA6BjyC4=;
        b=L8djSJl9wpX1UTr9HxTlgboLD4JIGk8uSEHYod/QpdepXiicOwtgWjLbZzxNWpZbGK
         Tb1ZU9b7PWYrhjJrSFAaKCLftEVx6qA8T3be6dQ/65NYL3NhGEToApIFu8IQf3IlhNBF
         vyeTXP257bc138+LzcFGl+/jGwXr0u8aT2B15OgJ8Fn7w5hzronUR05375EwVVK3Xt5J
         J+7EYPy3KkuUht8tAe8Evn5uM7hudNg2uodrCQU2Zr5isTGJru4/sMqL11aL1uXYwEp8
         a/RmbfpKRE58abiO7c4Gs/k3HlqsltQG5REKHwNvLMDwpdFOSLQWzd6cWsfOy8zkaep9
         ZROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709260218; x=1709865018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ADpK8Y85+/sk5GOY2j0XDlmVrJU742/ZqUgA6BjyC4=;
        b=K/rtax8EuojrAOCIzt4VUE2ZJUWmy2pbouxiRkw7VDfRktVoRpDP2SGZSArTNPW3xa
         +nMUyJ4jOJRjqJlPPuy1MAb8VFFTRGoj9WYwNs8aJFLoWgBGQWizMRjma4/hL9FDFQ6K
         7NuMiGy9N8CaZO2riuIMXe2gaUtgjF6jhGnMmPWh32gS5LALnJkh9mXf73B1TWXwZVUG
         ffpLXKntfcoP4/QTxb/zyZzrOAegVyMmz7VPptnRtzCJPqfbKthh9yY+15L3s+egUNAd
         dkjLm4+feqg+8yqRR3LnyIRT9PFv7IZQbPaYKcp+X77P+8HSYyOeYHfPMzIA8Z0hdNrd
         Hlcw==
X-Gm-Message-State: AOJu0YxYPEVDE1PcL42RnbySGRzbQY5bq5G7TOba7FMfofk+SIKYsfFc
	JDZq5yEB/OofV+w4Jw4WnYa+bueS7Ri0/SXxjFNGWJEnNoAdi3G92JmyLHCULvUDUyO5J0PjUqi
	CKm/CMwrMzPuAC5ygVCP3Z/aqqk0=
X-Google-Smtp-Source: AGHT+IHiQeKjiuAdJTvsywcM8Ix6nNuYo0BG6oMVYW85OdOBLLh9FDKVQhBYOEVpwgVR5C1RKdpyIUXFgdzW+84UgCI=
X-Received: by 2002:a17:907:76f2:b0:a3e:7ef1:8c91 with SMTP id
 kg18-20020a17090776f200b00a3e7ef18c91mr205975ejc.77.1709260217803; Thu, 29
 Feb 2024 18:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFR4CiudyKWsSe3xdaDTFn-zGS12w47tF8kKb8fd+s=cMsRA5A@mail.gmail.com>
 <24438.1709259030@famine>
In-Reply-To: <24438.1709259030@famine>
Reply-To: mr.bo.jangles3@gmail.com
From: Logan B <mrbojangles3@gmail.com>
Date: Thu, 29 Feb 2024 21:30:06 -0500
Message-ID: <CAFR4Citj2uBtzz9ffdOpFcLwq5H88fuwgn6yCg-vQahHxJNSRw@mail.gmail.com>
Subject: Re: sizeof pointer vs sizeof struct
To: Jay Vosburgh <jay.vosburgh@canonical.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 9:10=E2=80=AFPM Jay Vosburgh <jay.vosburgh@canonica=
l.com> wrote:
>
> Logan B <mrbojangles3@gmail.com> wrote:
>
> >Hello,
> >I was recently working through the xdp tutorial and in the
> >packet01-parsing lesson the sizeof a pointer to the ethernet header
> >struct is used, not the sizeof the struct itself[0]. I peeked and the
> >solution for this section also still uses the sizeof a pointer and not
> >the struct so this isn't part of the tutorial and I was wondering what
> >is going on? I don't think the verifier is re-writing these addresses,
> >only those for the memory access into the packet data.
>
>         The referenced code at [0] is:
>
>         struct ethhdr *eth =3D nh->pos;
>         int hdrsize =3D sizeof(*eth);
>
>         "*eth" means "what eth points to," so this is indeed taking the
> sizeof struct ethhdr.
>
>         I suspect you missed the "*" in your reading of the code; in
> this context, "*" is the indirection operator, per K&R 2, (The C
> Programming Language, 2nd Edition), Appendix A 7.4.3.
>
>         -J
>
I did miss that. Thank you
Logan
> >
> >#include <stdio.h>
> >#include <linux/if_ether.h>
> >
> >int main(void)
> >
> >       {
> >
> >                           struct ethhdr normal =3D {0};
> >    struct ethhdr *eth_hdr_ptr;
> >
> >     printf("Size of struct %lu\n",sizeof(normal)); // prints 14
> >    printf("Size of struct pointer %lu\n",sizeof(eth_hdr_ptr)); //
> >prints 8
> >    return 0;
> >}
> >
> >
> >[0]https://github.com/xdp-project/xdp-tutorial/blob/master/packet01-pars=
ing/xdp_prog_kern.c#L34
> >--
> >Logan
> >
>
> ---
>         -Jay Vosburgh, jay.vosburgh@canonical.com



--=20
Logan

