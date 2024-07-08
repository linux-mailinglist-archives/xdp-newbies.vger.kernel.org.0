Return-Path: <xdp-newbies+bounces-111-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8C92A7C1
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2024 19:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4BB20B46
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Jul 2024 17:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC16914386F;
	Mon,  8 Jul 2024 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdbZQ7NO"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CC143734
	for <xdp-newbies@vger.kernel.org>; Mon,  8 Jul 2024 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458107; cv=none; b=Y51YLp12JkA04+bnWetpVKo1kq3PA5UbLU7Ckp6K1/2yHeoIio4tQzOrdbNX+a+LKUWXS64HBqAmgnljR/TJ8omfv5SwBQ+AIadO6XuhJTvYWETdE/EAKQR7LzqWsh731zhzEYrmRrbCIGSOFhZrFYgAClbPojMUowrYruCtL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458107; c=relaxed/simple;
	bh=ofiLyNNEZ9elmNQDwOMn/bdCPUGdi8lRy+c8sqd4vgk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=KNJYVqXxGGVMHijdi38NDlA5BZQYTkDPFPuhmxvuSkp9xAJb3Rym/KA2QydPL8L0EP9/gQ6XTlppny+v0uWCJqItq6FmFu/eMNHJ8xECK20bgkm1FHvJmMutSFecS+WhCWn/jAmxPMhZ6E7rRlYTe/Ve0KJmKAR7mOEnnLtoZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdbZQ7NO; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b3655297aso40413887b3.1
        for <xdp-newbies@vger.kernel.org>; Mon, 08 Jul 2024 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458105; x=1721062905; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g9Hw2xWBUv/mrgOheOExzidnbY0ZftuWvC7reOWudL8=;
        b=WdbZQ7NOs03+bsYgZTgsG4wO37EEb6jD6mc9ur8mX6OuAXbnJJUmTHkLCnwey5bgSB
         y0bx50BpmA2uJtZa+J5zYae2UUF56rRRMrKYXjza0kOW60oTjUfVxkmpnLPuu08FMPos
         LQLbxTppg1BliuA34iiWupUYK4NdW5Q/jRp3ms5tQ+wHGXLKyPQpeIdgxEQp92Pcs/uB
         cnGQUFX20wZ5Wi4VUduk9kKPshKxKjBjfTPW0+4XOdbSCY/xsoiqTkoSDxBUsicgh9GQ
         ZHQpWtGGoOK7b5rpwDJUhlnzmeDiH/RMUNqN+U9AAih0+KYHhCaMNaxDVdETGQfTl/Mx
         d2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458105; x=1721062905;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9Hw2xWBUv/mrgOheOExzidnbY0ZftuWvC7reOWudL8=;
        b=F8P7bfFXrYiJkr6gVYmkUyqPpoJXGnVNNYhpuSlDVDRBr23V3uhQ5bftJBOTW+QAPH
         bCkGBj+E+lGFZoI+U8Hh5LW5Cqt1Yfr0MV/HeZUBpKGWHQQ+Z25hQXk6nEF3lz5pcTVW
         ZRJXnIK+UPYV5TekLvNuotN9Kg6/aEWRxmuoaMFXmk9ztsZxjInITb8YXXo881W4DIa1
         EelpMLY3xKrFkgiaJ1zwFIlIKRsWohmaz2WX8HuhWLSGvwYelUry4zE8wh3Wg/fpYZ5j
         x9NPXoW1zy/n4aTzlmr6I/6i5xiTW6MzFC8GIE/zMDRbNk6KCY3MD5I46kStzHZmpAXx
         5GnQ==
X-Gm-Message-State: AOJu0YxtCIJQ/gfGHpMscLoW8UC5x02nMS4Q+RMQRPPyE8HyLt1/DdRq
	sOtT5/0roLE7QsCzmuxYAlvBu1uFORmN6LO0S3a7jY3yMwNn12Pobm2u/Xr3GBCkp6VMGyisuTD
	wiG16wYY4qmaey39udjNqQ51p6iFACF0Z
X-Google-Smtp-Source: AGHT+IH/eC+0dI3rcUPNBQPwDjtPo+k3xuZlhhW2u6NUtkR9tVTRXrncWBVl9iao0mSyDT4SEKzkinJeG6DWobWH14s=
X-Received: by 2002:a05:690c:3385:b0:62f:2553:d3b3 with SMTP id
 00721157ae682-658ef3414eemr4287687b3.29.1720458104841; Mon, 08 Jul 2024
 10:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Srivats P <pstavirs@gmail.com>
Date: Mon, 8 Jul 2024 22:31:08 +0530
Message-ID: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
Subject: ixgbe zero-copy performance
To: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

What is the expected performance for AF_XDP txpnly in zero-copy and copy modes?

With Kernel 6.5.0 and the same ixgbe driver, this is what we see -

ZC mode: 4.3Mpps
Copy mode: 3.3Mpps

This doesn't seem right. Shouldn't the zero copy performance be MUCH higher?

host:~$ sudo ./ubuntu22.04-xdpsock -t -i enp2s0f0 -z

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 2,969,121      2,969,536

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 4,315,534      7,285,632

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 4,315,335      11,601,344

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 4,316,276      15,918,080

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 4,315,285      20,233,920

host:~$ sudo ./ubuntu22.04-xdpsock -t -i enp2s0f0 -c

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 3,326,724      3,327,744

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 3,314,220      6,642,688

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 3,317,285      9,960,448

 sock0@enp2s0f0:0 txonly xdp-drv
                   pps            pkts           1.00
rx                 0              0
tx                 3,323,394      13,284,352

Any thoughts or pointers or things to check for are appreciated!

Srivats

