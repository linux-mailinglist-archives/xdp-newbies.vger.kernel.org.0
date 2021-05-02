Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEC8370EFC
	for <lists+xdp-newbies@lfdr.de>; Sun,  2 May 2021 22:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhEBURO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 2 May 2021 16:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbhEBURO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 2 May 2021 16:17:14 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7979BC06174A
        for <xdp-newbies@vger.kernel.org>; Sun,  2 May 2021 13:16:22 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b21so1753138plz.0
        for <xdp-newbies@vger.kernel.org>; Sun, 02 May 2021 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loHJ1AWBwS/3MyLBqJhmwL0TKEdWvHgQsva+ybfJ0Kg=;
        b=Vg8NgZWgtrXVbSauM0ITFaIuYf/VjNlFQFnH2MZ14pSm/xmkgoSwPK5lipP6mF8oIB
         IZZN9/halwkoknFxO0lNrx2iUvbbxp6yUrDr9eye5WEwvKYCEy5eZX+ruCOn8VN4uYQs
         h/L0PT4Nku/JUH4uhHUXLlFdvG1I0myAhwCEYxT/kG6oPtzz+YXN9UOcmnAKPuBgyPwZ
         qASVHHiw22eCEZbhHCjsGDP+Gi9Lm8sPeafRQ3tMxvbsnP+vbcFxesVv/bFFhJHzTeEA
         Qjjmik8lltJWCdHrJuvX1xF02GSyf3nm0PF685JGSBY8mpjLLo7RPdyckLw3oDWWevSt
         9ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loHJ1AWBwS/3MyLBqJhmwL0TKEdWvHgQsva+ybfJ0Kg=;
        b=rV5W5xq2Zg1QzrJKPIycV+/HqhMV4O5jHTY9sDvHybC3Fc5J146TPwOnpwItzxq2Q+
         yoiiZXcafAacAqyYGaqFD6axd0PcpCr0aRiVlatzOh44hTdRsSvsRZj5HDLlEGEadRc4
         YDLaXHk+6/OOGCB4NKefgy8PnD+VFCTOz/9WgabEKe85u2GXyKZiFQ2NDeDA5RQWtoBm
         B1G6wH6/D4ro0lzZIWLCb+/cb5swW/B0cfy+gyc+2875PQI/J2miVlU81/RjAjQUJLvT
         vukoGP467kHJ4zgJd0QAt43KmsK4DDeZg12xRLBpvBFjwpHFnVZ4IPi9ohMYNOuvXGIk
         2d6Q==
X-Gm-Message-State: AOAM5310nAiNDePnNR/77aG3SpFe8b8oASJJmasy4ofoweyMjNseTWTV
        YXNx4pIrdOE49fpE8Jn/AbqBn+43LCG+je++5eEodttb0FpwSw==
X-Google-Smtp-Source: ABdhPJxNqd0OmJxzzLpMeGq+sxwjUJrw0YbsnsNoiv+2sg4IsYLupR6q44Z5zG1XmNc7kA4SUaEt4YsiZ67GcJvTmHo=
X-Received: by 2002:a17:90a:510d:: with SMTP id t13mr16742586pjh.97.1619986581686;
 Sun, 02 May 2021 13:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com> <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
In-Reply-To: <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com>
From:   T K Sourabh <sourabhtk37@gmail.com>
Date:   Mon, 3 May 2021 01:46:25 +0530
Message-ID: <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, May 1, 2021 at 11:26 PM Zvi Effron <zeffron@riotgames.com> wrote:
>
> On Sat, May 1, 2021 at 8:23 AM T K Sourabh <sourabhtk37@gmail.com> wrote:
> >
> > When we turned off irqbalance service, we would not see the issue as they were messing up the affinities.
> >
> > Another thing to ensure:  equal number of queues on both interfaces.
> >
> Thanks for the info, it does give me some areas to investigate.
>
> We already have irqbalance turned off (uninstalled, actually), and
> we're using the same number of queues on each device (we get the
> number of queues by taking the number of cores divided by number of
> interfaces).
>
> I am wondering if not having the matching queues for the ingress
> interface and egress interface on the same cores might be a
> contributing factor?
I haven't tested but you could give it a try to see if packet drop happens.
>
>
> --Zvi
