Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E738D359B5E
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbhDIKJx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhDIKIN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 06:08:13 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671DFC061764
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 03:07:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a12so3907313pfc.7
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+6VDaXiCdMessxnKLM7kvCmfVwLGiyQruGm4eg3NGA=;
        b=q3GPoK+vOaI0fNTZsnCi+xhulCkes4CmQW2cBtf5NHmZWjASTDRJfJwv70HYFfegA4
         S89MnHlWCG0YxpWW+ppenfh8fF26qyOUbwtFcCTfNYTI/W76TvK00fNkOtY5tALaN/VC
         qWTnKhUmg0A4IGUkvJ5B21/PTTKralzG4HB//92QQYKm4SOmF5j2mImXRmJej30y8fU6
         9rOXTMF9ZYHHEafg9TeFOFa9tp3fhPnBnjqx0nFt6/NtRMQwOViwmlDTTYmXTy3cUFtK
         ifCqro78i72pYZEwkJwjdVKV8a7pgQ82VMj2P3nodkAzjyHssv3mCcAS55pvNAMBcZQ2
         pKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+6VDaXiCdMessxnKLM7kvCmfVwLGiyQruGm4eg3NGA=;
        b=amtC+pILvI1N69CRdyFxkGQ3WumQXjGJHo/DZaUKA7cg/7195XQ73hRX4LUOcxzlCU
         BIVB3JGdUvt9C8auSnr1Fgst0sHRvDuFnn3SPKqot1Ia7VpjZ5YDQMqq19QFIoYSt8/e
         uCA0M0R+g43EfYYuFAd3UaA7Kz56qdJXlUW6WAlQiXl+M4/NXlhuvwvgDwos8y7OwIIi
         z4ccn9/c1qHeefHV2hyxL/eWeQLMe3AJCKFNYNuFPKgmWcGj7+iDEATXBb9pAqC1embr
         58kcPOYkwUCItD/3VTDmWXFK1NBvd7QFcOHGSXuBVH3XvBVDdnQD2Q06IJig/BE3pU8N
         8RRQ==
X-Gm-Message-State: AOAM530WybweiaDjoR8Nq0qhv/cG8aSygvbKNEqQZUZgQKA7S57X+SuQ
        NLtk+93dHQZJA4p4EdLMmAtbbaR/wSadkqk25c4=
X-Google-Smtp-Source: ABdhPJzpok594TcaHpEoE924TBx8JXv8HyUsd5M4tr3rv8KUgBZaIRz/Fgi5OKEEA8+o0LWR3tWZq1n4YLX/+LWP28g=
X-Received: by 2002:a05:6a00:b54:b029:207:2a04:7b05 with SMTP id
 p20-20020a056a000b54b02902072a047b05mr11758732pfo.12.1617962850006; Fri, 09
 Apr 2021 03:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com> <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
In-Reply-To: <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 12:07:19 +0200
Message-ID: <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 12:01 PM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 3:13 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> > The short answer is that you do not have to worry about that at all in
> > user space.
> i am interested in kernel space, where i have to configure these
> memory address (physical) in HW
>
> >>>DMA is taken care of by the kernel.
> Agreed. For AF_XDP in driver mode (for zero copy mode), I need to
> configure the DMA address.

Only if you are writing your own kernel driver for a NIC. Are you doing that?

> > /Magnus
