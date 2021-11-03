Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2042444021
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Nov 2021 11:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhKCKtX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Nov 2021 06:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhKCKtW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 3 Nov 2021 06:49:22 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDD8C061714
        for <xdp-newbies@vger.kernel.org>; Wed,  3 Nov 2021 03:46:45 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 1so3058699ljv.2
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Nov 2021 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxiKzmyF7b4nLU8UbcwtvSZ+xbPvi9Ao7HD3s7V9yVg=;
        b=MDMhXXUsbEAoLktRnDH3QInum16A+bzvmx01Fon5klg32SpIp7v8idfc/d4jivoR4B
         yItH0l/VCsL0KQSmFmfTWCLraVCZstr0fxln2Wfdb7ZvHT8KvOv+FkEozeo9dn0FdL61
         a/LVpzMjC4jwtIz9IGrZ3J+GzAhFJ4xhcbxcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lxiKzmyF7b4nLU8UbcwtvSZ+xbPvi9Ao7HD3s7V9yVg=;
        b=Ep0etQ+g9DBAKM4UgcFSMGijiHF2ylhLjjn6WQaJw36SPm4uxgc4diXconDgvKVwpY
         Tm3H27TnRM3ta+vcPSvSDyHZT21u0hVqEwpP1PcwQ+uNMSDC/vwQB45PfTNmOTlGZF1i
         ZLJZlfYl3umViy3ut53fKmLGzaqukCes2OGkzCfAWvQJC7ZVmlrrQuAsUCdaxFb1Ex6J
         2xsGTYnDTQHrqv20UYMwMdaBXthFieTHd+YfB7TOISKvfH4gH5eKOOhGbGi++cJ/y7Vg
         MU8XJmjqphxQzyPUSBZXe3jKmmCFfR0mhKLvGA6L34SApVIHyDKK9HoZqXLLeHeVqyWA
         oodA==
X-Gm-Message-State: AOAM531W2Egyn84sjOXDhA6YC1lw2Fsuqx70aepJI2bGWNl+m2K4Clp8
        tCRnOTjQmoU4vwoYhVQ9PEgd0iI27qi9TEFMlZeP7whTLgZNQQ==
X-Google-Smtp-Source: ABdhPJwz85MYLXljVJrCd7TA7/BMMJLiEfE31psfBqQ5zKm3vZnnG/90QK+N8MliosDXVKiUkWxm7QLfO7oW6jJZP9c=
X-Received: by 2002:a2e:8554:: with SMTP id u20mr46661640ljj.412.1635936403840;
 Wed, 03 Nov 2021 03:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <CANDGNvaJZxXJaDYQKOF0pRZD5GWQYYZytnPyOUcZtejYE39jLg@mail.gmail.com>
 <c238d2db-c962-6e6b-cf2e-2eefb8d27c66@iogearbox.net> <CANDGNva6f6vU05yu2ZDha2Y43X556ckV2R13e17k-w0Qe2btOQ@mail.gmail.com>
 <2014aa37-a491-459e-329a-3e0502aa5bb9@iogearbox.net> <CANDGNva-tvC_D1qnJFaUSaqU_u4iRwEs1AYTGHg+-C3jKkkdGw@mail.gmail.com>
In-Reply-To: <CANDGNva-tvC_D1qnJFaUSaqU_u4iRwEs1AYTGHg+-C3jKkkdGw@mail.gmail.com>
From:   Lorenz Bauer <lmb@cloudflare.com>
Date:   Wed, 3 Nov 2021 10:46:32 +0000
Message-ID: <CACAyw9-Q308RxHvmn0oy0iZTJNiRcHZh+uBYRaGrokJwbLbkSg@mail.gmail.com>
Subject: Re: TC bpf_csum_diff problems post-5.6 kernel
To:     thomasptacek@gmail.com
Cc:     Daniel Borkmann <daniel@iogearbox.net>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 2 Nov 2021 at 22:33, Thomas Ptacek <thomasptacek@gmail.com> wrote:
>
> Thanks for the context!
>
> I write back to the packet directly (I chain all the checksum updates
> through a series of bpf_csum_diff() calls and then write back the
> ultimate value).
>
> Since we have a mixed fleet right now, I'm guessing I'm going to need
> multiple versions of the TC BPF .o binary, since it looks like
> bpf_skb_net_shrink() EINVAL's on 5.6 with that
> BPF_F_ADJ_ROOM_NO_CSUM_RESET flag.

Funny, I saw your tweet and went "uh oh" :D

Daniel will know better, but the way I understood it
BPF_F_ADJ_ROOM_NO_CSUM_RESET just tells the kernel to not verify the
checksum of the packet again as it goes through the network stack. If
setting that flag fixes your problem it makes me suspect that
something in your checksum code is wonky.

Lorenz

-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com
