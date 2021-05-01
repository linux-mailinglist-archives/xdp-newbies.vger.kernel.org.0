Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369B9370850
	for <lists+xdp-newbies@lfdr.de>; Sat,  1 May 2021 19:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhEAR5s (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 1 May 2021 13:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhEAR5r (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 1 May 2021 13:57:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D97C06174A
        for <xdp-newbies@vger.kernel.org>; Sat,  1 May 2021 10:56:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id q6so1727187edr.3
        for <xdp-newbies@vger.kernel.org>; Sat, 01 May 2021 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KcRmHVYZ9hhfHNn+JFCCfZwmxHIMk7r1KDhmMyj9Xr8=;
        b=ZpTGWGq6mi2RcqFXNokLgNhwo75rvHHNDzVCP/ABqmXQI7u9P0MrWK5qk37I/OXZSI
         TK1w3aCylI1ojWvqWOFnloAnWlViFwwzKui0h3t9PRKNLr1HdVw7AZVaIXpdhgmfa4cb
         +xS035pKdEgBgl/ccXxA6BP8n9lz0dKkYMb+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KcRmHVYZ9hhfHNn+JFCCfZwmxHIMk7r1KDhmMyj9Xr8=;
        b=ASXkYD22OSdE2m8ejW12gsQVyQE08nb9FxeZY02ezCOv2YYMPhQjPEGggjyS0Faax2
         iUXNyDonw5dvUVCVm2vPSlS+TExu5GOTHomz62qfIXZg0D333GJ6yOjs6IPWL33lhZFm
         uZidJiS/P7m1gmcURqX8hc3vLsDmhWItd/LQUW9Scp+9BnXqTg1EgxpeA81/t/9myfuX
         ZQIL86Xj0huZmpAV9vUwNgXIQlcbaatEEtiANmf521iX5RwR2KbkzVYnafhrNPWhPeMZ
         1BzppqZuKJ4Pl+zCOeBgObfbLGW6YiAMDan2to5ltft3UfvW4h4tU5/QsbcNMEEWBvl8
         pWXQ==
X-Gm-Message-State: AOAM5310EMib3Ck6HsxBWYA3ZISlsc4GEZgAmkQu7WLUoDkjSwPvakA/
        nNx0IeL3NZ7xlnZ/ebizFA+x3igIlIVJSAwetY/B529fFu9JYl4B
X-Google-Smtp-Source: ABdhPJz1gfW5gTCzGFB+45o37/WdYeNvzwNgYAmGEFch058lavklcGHsN4h+3A+gLZMmQn1cbEveVOGB4MTO2ANT+2A=
X-Received: by 2002:a05:6402:518c:: with SMTP id q12mr12380104edd.11.1619891815858;
 Sat, 01 May 2021 10:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
In-Reply-To: <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Sat, 1 May 2021 10:56:43 -0700
Message-ID: <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     T K Sourabh <sourabhtk37@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, May 1, 2021 at 8:23 AM T K Sourabh <sourabhtk37@gmail.com> wrote:
>
> When we turned off irqbalance service, we would not see the issue as they were messing up the affinities.
>
> Another thing to ensure:  equal number of queues on both interfaces.
>
Thanks for the info, it does give me some areas to investigate.

We already have irqbalance turned off (uninstalled, actually), and
we're using the same number of queues on each device (we get the
number of queues by taking the number of cores divided by number of
interfaces).

I am wondering if not having the matching queues for the ingress
interface and egress interface on the same cores might be a
contributing factor?

--Zvi
