Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEB2DC3EF
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Oct 2019 13:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390794AbfJRLXk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Oct 2019 07:23:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34439 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbfJRLXk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Oct 2019 07:23:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so4673086otp.1
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Oct 2019 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Engyg7Q4aY+2wJGbqtWKPwi7LecDchwq/4IjND0lLjU=;
        b=vV2ZhwGQ+bAb+LMymtj6bnQCJmSzn1/vqiaLu+tSb78Gsec37NEWgdqlrXsa5eymWH
         0vn4DDRfCsS/dUduIsZZmchfoSlZyinoUmyMskkac1/bHOLjDd+2RhFRP5mh1xG0rn/1
         lCoLfz6Nj+wzZ+JaNgWr/guzZJlKNQlbqOVijb+aERxM5iMBLT+81ZBy/nsu6afGhh/A
         ZVFDNUH9nUwnBhmDeb4pxdFTvLCAFOnnjgoM0VliZJ/zFaMvVJm+RuPLgQhcERgnK1y2
         GrkFQU+q/0kAoqSpdQfByDv8C8oHmHdTS7vbsKvaBEwbDnp5dJ47suvGMQtS60dIX6JZ
         Zaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Engyg7Q4aY+2wJGbqtWKPwi7LecDchwq/4IjND0lLjU=;
        b=D1kWBjmDjL4Rsn42bvqrlnZpYMMh8P6vStYsAHEzBUCetcILzA+H6p9uDgIJYt435/
         oiHMH+tRvsy5M5u4pV+cQkKeiJSqrr8DNAEoOb/AFPeYxnULkYIkbC0gEWmajmxbbCv5
         f2cTkHyECy4y7wWGpihnhQVc3Su9sgUG/74xZmTFZbZfl19o89WIlxiQXbBNO4cFzEHp
         Sn2vBbWpF3nvZVvEA2rnTdzMiKgDEnblkYep4woOswHk/e5Qg26DXYkViR4WjtetSzC+
         YWbHiMj2D0GfREXtgwmoLG6F0WxIapVJLeXmygFpHSBiRlsqWuZZWLmH+yGoWYbyZxBD
         uWmg==
X-Gm-Message-State: APjAAAXP35vhlNyhtWJKz5KcwXe02pVwAkF7jiYi+Ojk5V2bayRsK2CY
        gzaS4xgUV7LUWu5wJKqjkfHVFxFduFP69I6Yh10=
X-Google-Smtp-Source: APXvYqy3zbua6C233bPxd54z8pZtB29Sq1FZQ3V2FT61SAp63VJst+TzEi2rWN1t6MGItUmzXbbsHC2X9EySMc66nPc=
X-Received: by 2002:a9d:6247:: with SMTP id i7mr7240796otk.139.1571397819170;
 Fri, 18 Oct 2019 04:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
 <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com>
In-Reply-To: <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 18 Oct 2019 13:23:28 +0200
Message-ID: <CAJ8uoz2HYH3rWLX2zEOgZRyLioO7+JmXpH8wW6DFfi=VjTvCoA@mail.gmail.com>
Subject: Re: i40e: Kernel freezes with XDP_ZEROCOPY
To:     Kal Cutter Conley <kal.conley@dectris.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks Kal. Will take a look at it and get back.

/Magnus

On Fri, Oct 18, 2019 at 12:18 PM Kal Cutter Conley
<kal.conley@dectris.com> wrote:
>
> Hello,
> I have managed to extract a reproducer that crashes the kernel. We
> observe the crash with all drivers that support XDP zerocopy (i40e,
> ixgbe, mlx5_core). The program source is attached (C++). Compile with
> a newer clang++ or g++ using flag -std=c++17. It must also be linked
> with libbpf. Use libbpf v0.0.5 and make sure to revert
> 5771dacd3dc2fdd041c51242819a9f212e04af55.
>
> The crash is a kernel NULL pointer dereference in xsk_umem_consume_tx.
>
> Hopefully this is useful,
> Kal
>
> On Wed, Aug 7, 2019 at 10:48 PM Kal Cutter Conley
> <kal.conley@dectris.com> wrote:
> >
> > Hello,
> > I am trying to get AF_XDP working with the i40e driver (Ethernet
> > Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
> > kernel (machine) freezes hard. I have reproduced this on varying
> > kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
> > also, but at a later stage. I tried replacing my XDP program with a
> > trivial one that simply returns XDP_PASS but it didn't help. On the
> > same system, the xdpsock sample does appear to work with the -z flag,
> > however. Are there any current known issues that could be causing
> > this? I will try to extract a minimal example that exercises the
> > freeze.
> >
> > Thanks,
> > Kal
