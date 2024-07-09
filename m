Return-Path: <xdp-newbies+bounces-112-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ADE92B2AF
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Jul 2024 10:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61C481F2239D
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Jul 2024 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666DB1534E7;
	Tue,  9 Jul 2024 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlVg+zn4"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A4154457
	for <xdp-newbies@vger.kernel.org>; Tue,  9 Jul 2024 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515317; cv=none; b=ZTU6UhmWJQiZYjlc8HfHMuPGBwNgxrlrXi6L61piOtqaYh1vu73PDqDXU/kd286IeKP6y2D9gkl3bWejjZQzNOBlXGESkxwWCX+gKrhXWf5GQNrO5XGsVfNTzg7Hecv1KEz+7P5Iv7YRbTAEPgmSxZTUjtzzDGNVIoRP1dydwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515317; c=relaxed/simple;
	bh=LzuWUU1Mxi7GWKvJAjEaRLDGDv541FGDlpa/aCoiKcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPj1kZgfLPGANgknMV1YrKdpHSfyCAiPsemBrxWWsqhLDAANIzBVZhl8v1Otp6YerzRwdU4Y/Qk00JA0LoGRSPxrh7NTFZoLEi6I36s5EH7GJ/UXjFAmuq5LuMhxHdYAOM/O6vUqu+L1vl4nF5LHucfhFAZ32lWmq5AXhUPOcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlVg+zn4; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b5de481b20so4619536d6.2
        for <xdp-newbies@vger.kernel.org>; Tue, 09 Jul 2024 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720515315; x=1721120115; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRimYCkz+K8wFyBnwKCZt8k6jwtp4B2WM53/2muGAps=;
        b=HlVg+zn41IVSq/VqPFOggWV+H9tf/GZ4znTb0MrXz8t4E8xqP2Y/86rUL8/BeE1u9O
         hScyMchmNK4IJlMFbWi4jEIAI5+uV5+5xUslzpnLbpLa5+jdlHzxZsKYUth8MDJsTv/i
         U0fJgnafhWFf3BMa4sLzTAp3n7k/DfOnZpnW9CJE1t1UXerxiIuDq08eA2Q6QXyalKAp
         2qZlljWSI67XA+N3JcsBVu8HBFeZbkdOQRoA6HZD6efwexqM19VWYMGW/gx4IxPSOMmQ
         H0FIQ3Qrhwhe4jIPaNtd+c6RIJBNlRQj7hUSjUbTFJMTA80UydPGm2k9bQ9gzS4jit4O
         h4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515315; x=1721120115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRimYCkz+K8wFyBnwKCZt8k6jwtp4B2WM53/2muGAps=;
        b=FI+XjE9AiF8c6J8QBZ9/yvB11aeclFFhSkboWPxGgdKmOWRv9G1rrU0/Z8NsaYhhOI
         XqO/TNAzP2C+QIr7ES9mQ38o5Wq5CvJpkitxRk+JljC4BWnaRoEYpuTxTmBV/vhmcjY+
         QfRnBfP3O4q864qGgVq9GqDEzX8Gn5WBuS4DlfLTEJBqV//Tay1wLq+MhJmHA6PKZZtx
         wYSOG9cwW52AKYyAw3m2Tporwb5oxqrjD84wztAzshjWFM8fBnDUb4XMXzxYEnv8+zYX
         xLiMs1hcQVtTBOjo0Fr5CIZfBl5b/slOWxKA8NTwb0PCIaph5zp2mN3ioA32ROH0hLT0
         8xWw==
X-Gm-Message-State: AOJu0YymcJ/qndMVfPCTsVc7wrtyvR+Rcr5cJfF/9XWdM27cWsJwyPiW
	zguFwCU/lHLbkaY2h6QIf/CfrM5/x0F04f5Az104E/rKm6nJTBRv5g4fKJ11hsiOy6yvxENY2wz
	7RdQED0UC0AunLVhTaPakxUxYs3Y=
X-Google-Smtp-Source: AGHT+IHt1sD6sbQ9s/EhmPdnYptsBj2mKq+A8U8tNhczKQrEC5Y1frTpOgfS1TiqAi5igbdad9yxePVcGlPePrNXG4w=
X-Received: by 2002:a05:6214:224d:b0:6b5:337b:da47 with SMTP id
 6a1803df08f44-6b61bc8354dmr21068296d6.1.1720515314754; Tue, 09 Jul 2024
 01:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
In-Reply-To: <CANzUK5_bnjMKzUYWbh7aDu_GjCijCCUFt20TD7reTru53bqrow@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 9 Jul 2024 10:55:03 +0200
Message-ID: <CAJ8uoz2huw4QRtBO++=+htSQM3fZHHfR1Twh41hs0r1r-WGYmQ@mail.gmail.com>
Subject: Re: ixgbe zero-copy performance
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 19:01, Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> What is the expected performance for AF_XDP txpnly in zero-copy and copy modes?
>
> With Kernel 6.5.0 and the same ixgbe driver, this is what we see -
>
> ZC mode: 4.3Mpps
> Copy mode: 3.3Mpps
>
> This doesn't seem right. Shouldn't the zero copy performance be MUCH higher?

Zero-copy performance should be line rate for the ixgbe card, so
somewhere around 15Mpps. SKB mode seems in the correct ballpark. Try
pinning the app to a core the driver does not run on, or use busy-poll
mode "-B". If you are running on a NUMA system, make sure you are
running both driver and app on the NUMA node you have plugged your NIC
into.

> host:~$ sudo ./ubuntu22.04-xdpsock -t -i enp2s0f0 -z
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 2,969,121      2,969,536
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 4,315,534      7,285,632
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 4,315,335      11,601,344
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 4,316,276      15,918,080
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 4,315,285      20,233,920
>
> host:~$ sudo ./ubuntu22.04-xdpsock -t -i enp2s0f0 -c
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 3,326,724      3,327,744
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 3,314,220      6,642,688
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 3,317,285      9,960,448
>
>  sock0@enp2s0f0:0 txonly xdp-drv
>                    pps            pkts           1.00
> rx                 0              0
> tx                 3,323,394      13,284,352
>
> Any thoughts or pointers or things to check for are appreciated!
>
> Srivats
>

