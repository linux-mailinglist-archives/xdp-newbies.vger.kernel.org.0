Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF57514C702
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jan 2020 08:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgA2Hp3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jan 2020 02:45:29 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43401 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2Hp2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jan 2020 02:45:28 -0500
Received: by mail-oi1-f195.google.com with SMTP id p125so13071077oif.10
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Jan 2020 23:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/3lPxTGTUBy0qfJCbFiBE/iKh2ZhwQgP408+Wj9e+TA=;
        b=uGw8UdA6IPFjsiWcn/QSmMONfEXaxgqHia4bjMv6MP6VKVrK0IdhXlLTtW2OtOjrcY
         Udhji3C59M8E65i8pFuYdcNshq2s7DQOEO8eOS3UNNDX2/Nm/3a1mWIMmgDge8AHAcra
         5zEDYq8u/cv85icS++quq+N1ATOqHuDQ1tgyW19uttIZxyKf8OByMJsPOxM6KG4afFlR
         oAf3KCJt/+xQtxEhCNcn45zNN0+dQZ/Yz8VikVDfwOsWtGAqBF7MlHPCaXn/CGyjQJLi
         FeUtRT71i13iDmHbCMKelqRXLoa6kAsQPiXiAIUOnvQXy0UcYHtjaFZOcNnfSy5VpfJW
         BxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/3lPxTGTUBy0qfJCbFiBE/iKh2ZhwQgP408+Wj9e+TA=;
        b=DMGm29zJVHJ7lt4sdxm2WSM2c5IYjqBofS3aVcG1rVLYXs3OaivQPsHAwxVp2dcxBr
         VwYVrz9YhSFaLKrkZq4PrvJylJlt7tbNc7NLw1b2m+NQI6et1B+Yc+uobCGEUefyN7Mx
         8hTNwXjF6mAm35nQ8yG/Fm6AsAMPvtwQaPh84+CbvDPqvTP4Kt7I3MdXsl3jg6ofU4Uh
         zD5P55U+PHd2CHJGGsTmatj9DNmG5ph3NnGkeHMxCvkpL/mpXBKcx/2Loai9jO5v/jPe
         0hekDJsJyXfZHEEIddVyLj/pc8Q2UP81obh19XNDe2C1Vo4lbKdYyZjte2UBDE8j1fka
         yinw==
X-Gm-Message-State: APjAAAXy8ArQKt8xtk42T3Q+OajFaSexfyPWgXU41SIQKV5Ee8Lub4bw
        tB/RJo62YkvssNMSa1LHFCN2/zhVePnCvKvu8PK4LiOdCaM=
X-Google-Smtp-Source: APXvYqyRsHGMbJGceYz7i0HI2wWKTV9dZLIr8JO+i7qbIjX1OmeE2wIIZ5WsPUeHRoFPAbQCNBx3/PnqFk5bQ/1Ws7A=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr5631556oid.98.1580283927774;
 Tue, 28 Jan 2020 23:45:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bWnDuwDx_i=NjoAS1cDd5Fuy6T05ukSQZpjQv2Ji36jGg@mail.gmail.com>
 <CAJ8uoz1=Se+-hYWO6E11_LM9kS2Z1Eqeq17pB=oQC1tDR75WiA@mail.gmail.com> <CAMyc9bVgcH1gRAAku-BE=0eJR5cE-6YHcjAqNDpgvzj75y1XBg@mail.gmail.com>
In-Reply-To: <CAMyc9bVgcH1gRAAku-BE=0eJR5cE-6YHcjAqNDpgvzj75y1XBg@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 29 Jan 2020 08:45:16 +0100
Message-ID: <CAJ8uoz2oTS5sO8himLNDS=UyamT3X0RU-VTgEGa=GW4yqwft2Q@mail.gmail.com>
Subject: Re: Maximum xdpsock txpush rate with AF_XDP ??
To:     Cameron Elliott <cameron@cameronelliott.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 29, 2020 at 3:40 AM Cameron Elliott
<cameron@cameronelliott.com> wrote:
>
> Hi all,
>
> I am still stuck at 'xdpsock -t -i enp1s0f0 -N -z'
> Failing: samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno: 95/"Operation not supported"

Do you get any error messages in dmesg? Also please check if you get
any error messages from the driver when it starts up.

> But if I remove the -z, it works, at 2mpps

This is the SKB mode.

> I believe I am running just i40e without the virtual function driver.
> (installed i40e from source with modprobe)

Same sources as the kernel you are running? Just checking. Do you have
ndo_bpf and ndo_xsk_async_xmit as the latter one was called in 5.3 in
your driver? The error message you get is usually because your driver
does not support zero-copy mode.

> I am running a 5.3 kernel, IS THIS TOO NEW?  (details below)

No, the newer the better. Maybe you can try the latest bpf-next?

> I am running the i40 2.10.19.30 driver, with firmware 7.10 (details below)
>
> Do all those version numbers sound okay?

Yes.

> Should I try a different kernel or i40 driver, or firmware/NVM revision?
>
> Thanks, Cameron
>
>
>
> --- details on kernel and i40 driver and firmware version ---
>
> ~> uname -aLinux lumen 5.3.0-26-generic #28~18.04.1-Ubuntu SMP Wed Dec 18 16:40:14 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
>
> ~> ethtool -i enp1s0f0
> driver: i40e
> version: 2.10.19.30
> firmware-version: 7.10 0x80006456 1.2527.0
> expansion-rom-version:
> bus-info: 0000:01:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
>
