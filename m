Return-Path: <xdp-newbies+bounces-150-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6C9AC10B
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 10:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977141F21ACD
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E44156C76;
	Wed, 23 Oct 2024 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxNP8rEd"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D7156F27
	for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670953; cv=none; b=Id+mt2HrOAsO5ck8+O+84Ajkl0gSi8EBxLi9+lCnfgyZghM6T+Xa+CxIJfY5E+8q7MnrJ6GHPo35LLGqeOxK/JUm2RXaenPkCA/DhVtMsbjUqsNe82mhaiOVkZaxnXIeS3AtNIuGmb1uJGf7BnzXGpuwRek36BaR22KvkQ/3Khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670953; c=relaxed/simple;
	bh=VzBoSNCZA9lwLrf3yoVLShomBk1Pxrm18+pSz8ZanVQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UlSt0tuudgyEyQGIPOggHeMaQSan6AuSIa2zVsB86sMS7sJF/W9sKzjW1aIW51ZmNKSteDMFgQvwvzh+L9zdu35W5KKxzyNJO1EGOxrrNpcUeAsDSjbYwPx3bYUADcHJ1LwGKJ+/lLHRIelQoeHlH9Jti3L5cyyWwUabshBpaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxNP8rEd; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2974743675so6077306276.1
        for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729670950; x=1730275750; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u7bRCEVQ71iYGkiFZ+XJOGFIGShCGvGQCavX5BAg9vY=;
        b=gxNP8rEdvNZ82IDF9qzYRPM6F/4UtTH+bd0CslpWpIAT9AHlK2/5E5zQrV7gbyYQQH
         f8vFpdtt0k+mVFl+Stlh+D9np02ce1AvPais63VJLezRX2//5oGskQDW9Gi2YWQV9oxh
         6/nkXumAG2RXZ1XLOi61jIiti/vrdvb0i29x9Sq2+Mnh7e7ryAYVnxspTNmONdHMf+HP
         WcpwVF7hVm1LC8BwkJHmhq8NQFD7yUH8L0IV5tpZm77OGA3v1ojrGpX0aN87d+1riP8q
         mDd6/XVNHaIE6d5MmJ8PnQT5sHi1OwKseBAoI7UWdFaFn0LXMINBzXHw5oIWKfv659TQ
         v1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729670950; x=1730275750;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7bRCEVQ71iYGkiFZ+XJOGFIGShCGvGQCavX5BAg9vY=;
        b=cOdYe/PWGvIaso40kSHgV2AlrUDH7e6UY5Rf8c14o9102taIbGX8UD15js43q5zAuq
         ooHVD/Cyur+vujSiwxSqN1qqAmzDgoB0i8Oj9kfzuP9qLqQPx+MFZMxq2AP4WuGvjwtj
         wOVD2yaaRN92NYQu02kz9BZUgdUdTW9bPY6oWfAYyf2kdESTX1Y9aJkoo7KSFxlXKJzK
         bMOOED83bP5ZxKTUupzApy+QEak8Zo9Uj0PH3jokQNU9KhGCg2CRcjedauCCllu/a9OL
         trMZJ4ha1IKw5H8L5LXrux7dnPkIqNvCXjXUsFLH1NZW4Zp5HOyyi2suuAI/ytazJSUS
         jdyA==
X-Gm-Message-State: AOJu0YyM/WE0W3oLLdEj3f9jxU5+Xhc5etsZ6vLD070iDc78s3oE9Y73
	EdwvHPVWxDPsdpzRNWIqrfNtRijeQ/duCNzqJs908SMnjs69ZQhadE6L8IemQNNtpVf7pxm1/rD
	EcI/2ttNnjm6PujGzN04/hqbuRP01o3Kf
X-Google-Smtp-Source: AGHT+IGmldFDoqPUymNJ3tEAZ2G29/dXgtQklgoTSxbNXz1MXtkm+m1ggvtOeBGmL4Q6dnEfjjdrGfzJavjiC/5aaUI=
X-Received: by 2002:a05:6902:11c4:b0:e28:e576:f712 with SMTP id
 3f1490d57ef6-e2e3a601dddmr1736318276.1.1729670950534; Wed, 23 Oct 2024
 01:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Wed, 23 Oct 2024 13:38:34 +0530
Message-ID: <CANzUK59AWbXTXBd9uYNapFS9SdphPP2vAQUuiQx+QQJ9CTq3eQ@mail.gmail.com>
Subject: i40e: low tx rates for larger packet sizes
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Trying AF_XDP xdpsock txonly on an i40e (XL710), I'm seeing some
behaviour across packet size that I need help to understand.

All tests with zero-copy mode (similar results with busy poll mode
also). The i40e driver version is the native kernel version 6.8.0-47
included in Ubuntu 24.04. Flow control tx/rx is off.

PktSize  Max-pps  Actual-pps
                                                                    64
   59.5M      ~18.9M
                                                                512
 9.4M      ~7.5M
                                                             1024
4.8M      ~4.6M
                                                            1518
3.3M      ~3.0M

Output logs below

Since 64 byte packets can do around ~18.9M, I was expecting larger
packets (see 512 and 1518 above) to do line rate i.e. do close to
max-pps but they do less than that.

Is this expected?

What factors could be playing a role in a lower rate for larger packet size?

To determine how many cores/queues I need if I need to transmit X Gbps
- what factors do I need to use?

Srivats

$ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s64

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 1,88,28,546    1,88,39,104

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 1,88,25,658    3,76,73,792

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 1,92,29,105    5,69,07,520

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 1,96,44,299    7,65,55,904

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 1,96,46,711    9,62,06,336

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           0.00
rx                 0              0
tx                 0              9,62,06,720


$ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s512

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 75,09,247      75,11,104

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 74,89,511      1,50,01,856

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 74,98,753      2,25,01,568

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 74,86,126      2,99,88,672

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 74,86,807      3,74,76,416

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           0.00
rx                 0              0
tx                 0              3,74,76,416


$ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1024

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 46,01,574      46,02,496

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 45,95,655      91,98,912

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 45,95,058      1,37,94,432

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 45,97,400      1,83,92,256

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 45,84,541      2,29,77,152

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           0.00
rx                 0              0
tx                 0              2,29,77,216

$ sudo ./xdpsock -t -i enp1s0f0np0 -z -d5 -s1518

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 30,00,232      30,00,960

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 29,94,793      59,96,224

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 29,95,064      89,91,616

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 29,96,147      1,19,88,160

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 29,94,991      1,49,83,552

 sock0@enp1s0f0np0:0 txonly xdp-drv
                   pps            pkts           0.00
rx                 0              0
tx                 0              1,49,83,552

