Return-Path: <xdp-newbies+bounces-155-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5429AE419
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 13:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41345B241CA
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 11:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEE51B21AB;
	Thu, 24 Oct 2024 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh6G0LvF"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AE147C79
	for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729770379; cv=none; b=pdhn1UdFXi5sH/Wml2IfDtfnskelQkmGzK7zgolBUxV1rW+qM9gh0Jjx2qJdVvDTjLbI3Meer+nRKdBSPmYD7a0PPYcY1dOlyli8dooHIRGXojXmdymMw6KYqGtjN6/Khm7gHkKodGNv0UsMbjHlDqSvHYD6hS9h9gdVTx7//MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729770379; c=relaxed/simple;
	bh=A4ui9gxbPlT5NqmMwZK7cOK/SkTl2IUYuc8BnnbxbLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dv4AxC0crP1HdR1kxRwmespyWNA2x1bmjO7XXcf3c1fMeXdRO5887yrt9kaguP+w5i4E3vi28ci5QZzXeBl/B+kU9kK5c+IFtlwft3t6TGVq4b5/dUtpUSL1nqSHsWnNSvHj+5rxQKVq1695C33+409C8wuIHNqqd4w9j4Qw8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh6G0LvF; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e290200a560so905713276.1
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729770376; x=1730375176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7NfzJap8UTcE8ScW79oMhbPc0EtLe4SXN3P7KocYqA=;
        b=lh6G0LvFQkPZlKxgmhxdGXYfFOLc2uYdiG8muf00rBeSFVpKA/CBOGCvjodD4k3gLo
         +Yjro++qMEM8Bb7V9AvqnKwREebkeB3Gpbe/vZRGU30ExGfRoCkYr6hYNwn72Dusaavl
         D+cYW1FQU1DrzcjIMrDDg5xqtDpJ/+IBSXugd2O6HbeSrHtcQzHNlOUrCzMbsvkHY37X
         m7QOkWQREdSHgo41nS2UK5Lg5N23G1TWi2Wu8m+l7PCZbgHBW8V9YM0zPA1soVFiAoEa
         oLH2kcoAFKZ4qlB3FYLBA47V5d06oeaqoiAplD7Ife7P822fR0aLkgSfDcabm8BI9zo+
         nREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729770376; x=1730375176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7NfzJap8UTcE8ScW79oMhbPc0EtLe4SXN3P7KocYqA=;
        b=rH4ZQmLT7Am1LsvYuw+hO+J6IVeS8d/kzDkdw/esqSMN/6PqZNnsoeZosF3AHgkoOZ
         M+NoemX2GXz6O46CAg5J6nfxwYHfdn9zZw8tipPGwwKhjJsczFNdhbODlxTWdIxSJSSN
         /DC/nuiWczTthPkAGmutjz1sc/8XbLeU1nnrqOuwiudOE+FR9DlrSjWqWhj0H9zsZCgY
         Rb9mez7j9rCvHvZL1DNjUUHBuAnXDMKwZgKGBbR5TGYUmail6tm009oLwdDB0+SL1di5
         +RwHBD+lnE/8/C2c1YMxNTFOlp6FwBXqCxE9o4Fd5/KHVHncMqXM280rRe/JUMkrjffF
         i20Q==
X-Gm-Message-State: AOJu0Yys2CIaf99yXBCVaVuLobmEp9OJn8WcfWCR01BKopvlhtrwmoTq
	D0HiIL0i4OWruJeTDHsX2Uv82o/mcXKBX2TZUWoCbgur2KotISHWctvx1IZ+jKkidFFElwoQULu
	aPlqTJyReFvGpSO0gh4TOoqy8RqPFUA==
X-Google-Smtp-Source: AGHT+IE4cWhZCCWHlwBW/9EuVTCf5sczy491p+WuiRkTtBqnfDu5qRvSqbi01qSsFjMi2y9CbwnaWw6ghNwnE1GxONk=
X-Received: by 2002:a05:6902:1543:b0:e29:683f:7e93 with SMTP id
 3f1490d57ef6-e2e3a6e5cfcmr6072765276.52.1729770376015; Thu, 24 Oct 2024
 04:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK59AWbXTXBd9uYNapFS9SdphPP2vAQUuiQx+QQJ9CTq3eQ@mail.gmail.com>
 <CAJ8uoz25x0xJPCc6LuxG3mneMDQACnzRUsLOzFJ-E6vAzbLfFg@mail.gmail.com>
In-Reply-To: <CAJ8uoz25x0xJPCc6LuxG3mneMDQACnzRUsLOzFJ-E6vAzbLfFg@mail.gmail.com>
From: Srivats P <pstavirs@gmail.com>
Date: Thu, 24 Oct 2024 17:15:40 +0530
Message-ID: <CANzUK5-YrLdOZFZ7wKtHgm-Y6jUcKQO9NJyB9g8Hsmxh9ebEKg@mail.gmail.com>
Subject: Re: i40e: low tx rates for larger packet sizes
To: Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > Hi,
> >
> > Trying AF_XDP xdpsock txonly on an i40e (XL710), I'm seeing some
> > behaviour across packet size that I need help to understand.
> >
> > All tests with zero-copy mode (similar results with busy poll mode
> > also). The i40e driver version is the native kernel version 6.8.0-47
> > included in Ubuntu 24.04. Flow control tx/rx is off.
> >
> > PktSize  Max-pps  Actual-pps
> >                                                                     64
> >    59.5M      ~18.9M
> >                                                                 512
> >  9.4M      ~7.5M
> >                                                              1024
> > 4.8M      ~4.6M
> >                                                             1518
> > 3.3M      ~3.0M
> >
> > Output logs below
> >
> > Since 64 byte packets can do around ~18.9M, I was expecting larger
> > packets (see 512 and 1518 above) to do line rate i.e. do close to
> > max-pps but they do less than that.
> >
> > Is this expected?
>
> I think it is hard to hit exactly line rate. Note that each queue on
> i40e can deliver max ~21 Mpps. How about trying with multiple queues
> and see what you get?

With multiple queues it works.

The question is if I need to send X fps at Y packet size, how to
determine the number of queues required for the same. My assumption
that the driver code is purely (primarily?) pps dependent and agnostic
of packet size is not correct, it seems.

Looks like the only way to know is to try various rates at various
packet sizes on the specific NIC and pre-build a sort of database or
have some sort of Tx rate monitoring and dynamically adjust the number
of queues during Tx if the initial number of queues seem insufficient.

> > What factors could be playing a role in a lower rate for larger packet size?
> >
> > To determine how many cores/queues I need if I need to transmit X Gbps
> > - what factors do I need to use?
> >
> > Srivats
> >
> > $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s64
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,88,28,546    1,88,39,104
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,88,25,658    3,76,73,792
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,92,29,105    5,69,07,520
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,96,44,299    7,65,55,904
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 1,96,46,711    9,62,06,336
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           0.00
> > rx                 0              0
> > tx                 0              9,62,06,720
> >
> >
> > $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s512
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 75,09,247      75,11,104
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 74,89,511      1,50,01,856
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 74,98,753      2,25,01,568
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 74,86,126      2,99,88,672
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 74,86,807      3,74,76,416
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           0.00
> > rx                 0              0
> > tx                 0              3,74,76,416
> >
> >
> > $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1024
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 46,01,574      46,02,496
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 45,95,655      91,98,912
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 45,95,058      1,37,94,432
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 45,97,400      1,83,92,256
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 45,84,541      2,29,77,152
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           0.00
> > rx                 0              0
> > tx                 0              2,29,77,216
> >
> > $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1518
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 30,00,232      30,00,960
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 29,94,793      59,96,224
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 29,95,064      89,91,616
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 29,96,147      1,19,88,160
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           1.00
> > rx                 0              0
> > tx                 29,94,991      1,49,83,552
> >
> >  sock0@enp1s0f0np0:0 txonly xdp-drv
> >                    pps            pkts           0.00
> > rx                 0              0
> > tx                 0              1,49,83,552
> >

