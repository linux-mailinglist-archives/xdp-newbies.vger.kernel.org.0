Return-Path: <xdp-newbies+bounces-124-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A087D934D4E
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 14:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E0E1C21741
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 12:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CC013BAD7;
	Thu, 18 Jul 2024 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihRBmeFT"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381A40875
	for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306263; cv=none; b=oEP+7qRr7/qIhM/HPOppnL/qsc7hE5Bn55JMqHfehIzVyUqKamaF1ebS/2PDW1nOk4ACiaj/21V9fqVpv+NEoI9ZA9TdS/tbCn27+V/tvWeUpWf3Iz0TjxlZj1py0bxVh1yXDmDyHZYydmb82XfRxJkT9SYZrzaK5M/KKaiHOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306263; c=relaxed/simple;
	bh=Wea6l8dNrsanomIvqRB3NPWUwt7KQUfRzJZrBRQuYpQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EcafzxLElW2SXi/8kzDqKU6hQydm2ymH1yk66Nc8yvyNQ4X/74Fb96Z/17MCyHn7EzxILRt1STfIEsfq4aFC4IAF9nTdOp6lRPk4TOy8SJOyZoobui595LPebR5qo9HKsTRoAZylbet2MyzOU+a49TCM4Fg32FGT2hoBVdUwnoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihRBmeFT; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-376012bcc33so2331165ab.2
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Jul 2024 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721306261; x=1721911061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G7beGaBADuBYJMlIt7u2rHCuC0/tB6h+w5FaqstutU=;
        b=ihRBmeFTqKfo/JC9jusnEnwyXNPwiXurw8HN8D4A0CsKTF/wnk7qn8JQbO2YyvCVNX
         y9mutj29xrxB61A7DCc/h1shF8QOtH2dUEDFCZ3S46JNNwzwxxZ/ihR0p+Amn5x7PIFF
         3FRvtMUNb30iOzx9y+rpYyY0sTL9IAvZ/v32Szae6KXvVfzxz1GxNwgIklJ5uK9wfX4b
         vt6wviru190o0+TDlMDPeWjR2FJDJqbnLDM+jA0L71UtluhIsl3bzDPM3U8nIoxFUwTw
         ogVhmBA5yAv0k5ZB76u9SNOPOg60B1Q0p2xYgvVhs4s4aStwFtCjbXr9Ty+XcI12Nmet
         AZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306261; x=1721911061;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9G7beGaBADuBYJMlIt7u2rHCuC0/tB6h+w5FaqstutU=;
        b=c3D77U79uZJ6I7pDTBHbRCWtKav9W64MxB2fln7D4Adpl6BWxAZBe9Rn/GvgTTDUxE
         BA46Md9Gc1B32+4pmQMiKVyBaOVrsZNue/Fr30xuySKSsovb9otusJBTfptmcduHj7CW
         xvV0WvBe0Jmfys6Z5fQEGM3QXwRFxXcONEiqnd+PyQQec+QVMSrGFl/Y3cJrBAvvhtxm
         JM2hJiiT4volq5HZVurmh4HGzWK/xeLbb7l+aIIe9kZ0Ul79CoLeEPVyWg4bpffRJmsx
         LPV+5zLpIKzTMW7c++dZkFj3K+GRlj1+Ry1IUV6qYPQgOs0HsaOeCZbo0LXfoerWjFPU
         gKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy1esSegIF0fTFOTRIc6dUYW1xCF2bJsr5sUf1TStlY+9nz68xBGx6LS63PQgpN8sAjDK84enVSQ70fqbr2zuqNSPnrqAjS8GUWsw=
X-Gm-Message-State: AOJu0YzP7QMgCCuXjgIF+kI7e+Zeh05mfGC5x34poefKPp1dVAS0fe04
	cBgY0dtbWOpPoCQ9TgNpFNCwSQY3q/5bpnNvGjK1jdGpOTSmceMo
X-Google-Smtp-Source: AGHT+IGLq7Y+hPBw45n1oGsjVpCkcu8TcunBJZpJUVKuuD06vAyQEUF2SLoQuDcEZjVJGmh6w5ilCQ==
X-Received: by 2002:a05:6e02:198b:b0:395:fa9a:3173 with SMTP id e9e14a558f8ab-395fa9a3438mr48246235ab.10.1721306260852;
        Thu, 18 Jul 2024 05:37:40 -0700 (PDT)
Received: from ?IPv6:::1? ([2804:7f0:9181:51fb:cfc5:2d5b:85ef:1b34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecd3011sm9849504b3a.213.2024.07.18.05.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:37:40 -0700 (PDT)
Date: Thu, 18 Jul 2024 09:37:37 -0300
From: Matheus Castanho <mscastanho@gmail.com>
To: Srivats P <pstavirs@gmail.com>, Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: BTF without DWARF
User-Agent: K-9 Mail for Android
In-Reply-To: <CANzUK5-QifcmKg+dZSdKsJXvKCb92DHEeb=BArpfn1o7MCXcEQ@mail.gmail.com>
References: <CANzUK5-QifcmKg+dZSdKsJXvKCb92DHEeb=BArpfn1o7MCXcEQ@mail.gmail.com>
Message-ID: <2E9164D3-9D3B-4E78-AE0B-CFF848355FC9@gmail.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Em 18 de julho de 2024 08:07:16 BRT, Srivats P <pstavirs@gmail=2Ecom> escr=
eveu:
>Hi,
>
>I'm updating my AF_XDP app from using a very old libbpf v0=2E1=2E1 to
>libxdp v1=2E2=2E0 (the last libxdp version that supported clang/llvm 10
>included in Ubuntu 20=2E04)=2E
>
>I've changed my XDP program =2Ec code to use BTF maps as required=2E
>However, it looks like to generate them I need to add '-g' to clang
>which includes generic DWARF debug info as well=2E
>
>Is there a way to generate just the BTF info without dwarf while
>compiling the XDP ebpf program =2Ec code?
>
>Thanks in advance,
>Srivats
>
>

After compiling your binary with 'clang -g' try=20
running the =2Eo through llvm-strip -g

  llvm-strip -g your-bpf-file=2Eo


