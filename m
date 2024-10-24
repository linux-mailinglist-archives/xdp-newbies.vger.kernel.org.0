Return-Path: <xdp-newbies+bounces-154-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6879ADF78
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 10:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B88031F215F7
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2024 08:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F901AE001;
	Thu, 24 Oct 2024 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNWLNkKQ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725C189F4B
	for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759731; cv=none; b=f/Qog8Kgt10076w6GUFaDzZ1driL561nDuHvGPBNeRupwuLVIvIMQZFLwWCvO6amuZKXrBidnv/js3G/FmPt26vDAa6pMda/I5ng/vWGHCyKggIp5U0NDiEgh1qURMc/x0FE9PJg7m0A/M+7AMVxa+eJhpMVljHPX7smyCA5lFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759731; c=relaxed/simple;
	bh=8Qm0Sr8aKuQmv8a06k4gp3uTzACoRzdq80NoP+Ck1Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icFba87jSh+SRzNW/tceSrh/4DJmmdRTrYjiXO37OrLDkv2Gwg4m7BNQRdU7EjG2P0qhgu330hIHOvtBxcMp4YzWwTMq477ivDfVSUI39wldtySaUs0OBk5UTHGlhl5RmN2mCzAQbwMUBp9M5Z9qFr35qrtI2EsUd+cZSTwuC/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNWLNkKQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b152a23e9aso46177485a.0
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2024 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729759728; x=1730364528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xespiMXdmKFQiF3EM/zdYMkNTMpigExIbiCJ1ZaIxJA=;
        b=KNWLNkKQcJKBeviH6Ka0naWwCWMUArxpUOzVY2a94nZOoaGq73yopWYEgPGVp2/KsS
         I6XH/I6pjjJPf6613Il8bYJ/C57n2vAZe8OqWyDoMZ9uf24hbYvTyHV+kkX2FU9fYNvo
         /fuINy1BMgvKj0HpV+Pu/e3KiouLdeNh7sHKs591dYWNUDPKnfbfgmcGvKo26U+bNged
         wHa0CxSN3+D+GKHOlxn64LBENhpYX9XUQZRNPBg7rD6oP91DScwlNyizetaithSnciII
         nc/920BdqSM2xSpys4MSZDBaUnclXsYIPXfbbUJTZ86Lec2Pi8/MRdUhk96eb0+3xRFO
         OiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759728; x=1730364528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xespiMXdmKFQiF3EM/zdYMkNTMpigExIbiCJ1ZaIxJA=;
        b=rs892XUT7jLQujDFky0Bg/TFa8W44n4AsqP9jmsnlT+Q9cDeMGNdyRTYviHoFurRUM
         +JhA+ulIAo3Qp6NnCD8PSgSktXju8clRgEXUDITtlKMw32koLG8BVcDApi+E4grTw6hT
         IbkDMqz6k6z/Yyya5oPoStGjt/ReeY8eIFqiujqwMqXcTOMiX03tNeaC8QA2Aex3FKY4
         ag2D5bN0db87I9dIaPaSoohM87mruytlZSyA6KMKJWI1vzsXPxNrDzi8I1NyB5EWLvsg
         y7hV06yNV+1f6Z+h+rE28euBLJNd0EBDQdlAKpKi9Syi048VYDHz1s0KRCkVTYE/40QT
         4n5g==
X-Gm-Message-State: AOJu0YwzfBmvuC/Le05wyxkdbU2OYcJ9Jj2ME5RKQlxWZaPQ7GvhwGR2
	C2SyEo2tqawYdT1oVyOr9PWBpaweREyMUDxjou3R+o6ZGwtEwQGozm7SKHoJXk5+kb9mNFE3S8E
	E4OWyo5rDdTdz6DHe3wefeNZVlMHVWF9wpSJl3w==
X-Google-Smtp-Source: AGHT+IGyY0Ag5qMfjh6EdbiE+OIMGCaM2rQQVhMoVhGsqFfRiofYh8J/nZXjArMuOmaI9QHPidP00KRTkxu4vRN85cM=
X-Received: by 2002:a05:6214:5693:b0:6cb:fe7f:27c4 with SMTP id
 6a1803df08f44-6d08d3ff204mr12649506d6.9.1729759728265; Thu, 24 Oct 2024
 01:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK59AWbXTXBd9uYNapFS9SdphPP2vAQUuiQx+QQJ9CTq3eQ@mail.gmail.com>
In-Reply-To: <CANzUK59AWbXTXBd9uYNapFS9SdphPP2vAQUuiQx+QQJ9CTq3eQ@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Thu, 24 Oct 2024 10:48:37 +0200
Message-ID: <CAJ8uoz25x0xJPCc6LuxG3mneMDQACnzRUsLOzFJ-E6vAzbLfFg@mail.gmail.com>
Subject: Re: i40e: low tx rates for larger packet sizes
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 10:11, Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> Trying AF_XDP xdpsock txonly on an i40e (XL710), I'm seeing some
> behaviour across packet size that I need help to understand.
>
> All tests with zero-copy mode (similar results with busy poll mode
> also). The i40e driver version is the native kernel version 6.8.0-47
> included in Ubuntu 24.04. Flow control tx/rx is off.
>
> PktSize  Max-pps  Actual-pps
>                                                                     64
>    59.5M      ~18.9M
>                                                                 512
>  9.4M      ~7.5M
>                                                              1024
> 4.8M      ~4.6M
>                                                             1518
> 3.3M      ~3.0M
>
> Output logs below
>
> Since 64 byte packets can do around ~18.9M, I was expecting larger
> packets (see 512 and 1518 above) to do line rate i.e. do close to
> max-pps but they do less than that.
>
> Is this expected?

I think it is hard to hit exactly line rate. Note that each queue on
i40e can deliver max ~21 Mpps. How about trying with multiple queues
and see what you get?

> What factors could be playing a role in a lower rate for larger packet size?
>
> To determine how many cores/queues I need if I need to transmit X Gbps
> - what factors do I need to use?
>
> Srivats
>
> $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s64
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 1,88,28,546    1,88,39,104
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 1,88,25,658    3,76,73,792
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 1,92,29,105    5,69,07,520
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 1,96,44,299    7,65,55,904
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 1,96,46,711    9,62,06,336
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           0.00
> rx                 0              0
> tx                 0              9,62,06,720
>
>
> $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s512
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 75,09,247      75,11,104
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 74,89,511      1,50,01,856
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 74,98,753      2,25,01,568
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 74,86,126      2,99,88,672
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 74,86,807      3,74,76,416
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           0.00
> rx                 0              0
> tx                 0              3,74,76,416
>
>
> $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1024
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 46,01,574      46,02,496
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 45,95,655      91,98,912
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 45,95,058      1,37,94,432
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 45,97,400      1,83,92,256
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 45,84,541      2,29,77,152
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           0.00
> rx                 0              0
> tx                 0              2,29,77,216
>
> $ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1518
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 30,00,232      30,00,960
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 29,94,793      59,96,224
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 29,95,064      89,91,616
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 29,96,147      1,19,88,160
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 29,94,991      1,49,83,552
>
>  sock0@enp1s0f0np0:0 txonly xdp-drv
>                    pps            pkts           0.00
> rx                 0              0
> tx                 0              1,49,83,552
>

