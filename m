Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95812182C9F
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Mar 2020 10:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgCLJk6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Mar 2020 05:40:58 -0400
Received: from mail-qv1-f51.google.com ([209.85.219.51]:33406 "EHLO
        mail-qv1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJk6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Mar 2020 05:40:58 -0400
Received: by mail-qv1-f51.google.com with SMTP id cz10so2263217qvb.0
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Mar 2020 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l9EG2aEFnNARk7nTp2bXDKJtkCUv5S01H8HmvdVJbio=;
        b=knFUaREiLMWL5qm7KblSIN9OnOJWq5G4JlPtFizA/1uct5cnjzYeS3g+XIydcTb7+Q
         t9HCk6zdaCzA820fHvcswkkyqXkZzLCabvygHgNmJyfndraETFT4ECfBgGieZuZTMjuq
         VFfSM5urgtt3m/Oyfy7POmbf15g3U+qhZdgfIJq4bUHtSX11C5kTWPzB1SAH+/Rd4qNA
         51uhwBNzVJbS8xa9Pfv+glj2FTM1NJvKXg952oK1+lwj9pn2JEBmKWL9yEBeQGQtr+tK
         2Kg2swE/Jsv6VUMqi/zadk4XkdwQkX9PjtxsmLT3IYJZlrrKTJSbYUTq3RyQeTWbNRp0
         xHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l9EG2aEFnNARk7nTp2bXDKJtkCUv5S01H8HmvdVJbio=;
        b=G/kMv/otyalpe8czZ0kREbYWQvimDKxCQcVVTBYzW0lIjcWrZbOmWb1tGcGCIGSD9t
         bxdnKvitoH8TAtI4Cg1ISPVPM7iy6bZ6nt3uRSpJVHLo65eUGj7HCugq/JOXP8My1mcr
         3ZmJOz2frqthsUVbPAR1vohJ54AYfT5DAy680tz+MMWrt4xiYcWvBNgkfB5ccisBJz0g
         S3CnXc0Og/FArWO0sw8SpavLFM8M6zsPKRSnwX9WoRAl2G1vWIUm/5wYFgxOfqSvii8T
         lKsj0G6VPDNuq7Mluj9OO69hdnEvdtfPbJxX1O4YE7Ph0keiaU6rwLTKjTnvFgg/gylo
         gTEg==
X-Gm-Message-State: ANhLgQ0YlJsEiJZTVcq0vdFJn4jfBAbLzDm0Ydhq05xiFq9yYWdMKLki
        TW65oFeF5lJThhEWGq7IJAQT5DOsRXodeGiFZU7Zo83a
X-Google-Smtp-Source: ADFU+vuLGK4X1bVSGgGfl4dbOYqrhYIOyabiWCvHYkaJD0ExVloWk/dAIYLjEjJR/fPCET2gTWJhEgbSGgq45PD2X6Q=
X-Received: by 2002:a05:6214:427:: with SMTP id a7mr531915qvy.10.1584006056994;
 Thu, 12 Mar 2020 02:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu> <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com>
 <a80ec2c07cb9493eafabb9decf479c60@hm.edu> <CAJ+HfNjiDCdaQm_PocHXC+gHABAO67b6H+f2pf+ZdHRu2uhMVA@mail.gmail.com>
 <69569dcbc4ce450eb5b2c1905bf11208@hm.edu> <CAJ+HfNi5sstcz20EGq2sak0RpYdBwVO5P+NLX8cALBuG_xsnHw@mail.gmail.com>
 <046ac5d67f6a447f98266eacaa2c25e5@hm.edu>
In-Reply-To: <046ac5d67f6a447f98266eacaa2c25e5@hm.edu>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Thu, 12 Mar 2020 10:40:45 +0100
Message-ID: <CAJ+HfNjNMhxzXTrwKjOZALO5=3UTgQz0ytyAMs5zoGB0HX29DA@mail.gmail.com>
Subject: Re: Shared Umem between processes
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 12 Mar 2020 at 10:17, Gaul, Maximilian <maximilian.gaul@hm.edu> wro=
te:
>
[...]
>
> Thank you so much Bj=C3=B6rn!
>
> just to wrap things up:
>
> - if I want to distribute packet processing from a single RX-Queue to mul=
tiple sockets I have to use shared umem because it is not possible to bind =
multiple af-xdp sockets onto the same RX-Queue

Correct! And you need a tailored XDP program that spreads over the
shared umem sockets!

> - furthermore, you would recommend to go with a single process / multiple=
 threads solution in case of shared umem
>

Yes, and while possible to do multi-process, the solution would be
complex with little gain (IMO).

And please reach out if you have any more questions!
