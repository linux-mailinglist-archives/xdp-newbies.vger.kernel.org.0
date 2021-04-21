Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C070C3674E1
	for <lists+xdp-newbies@lfdr.de>; Wed, 21 Apr 2021 23:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343501AbhDUVpa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 21 Apr 2021 17:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244028AbhDUVpa (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 21 Apr 2021 17:45:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F129C06174A
        for <xdp-newbies@vger.kernel.org>; Wed, 21 Apr 2021 14:44:55 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u17so65687379ejk.2
        for <xdp-newbies@vger.kernel.org>; Wed, 21 Apr 2021 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qpR1fSwWud+BpwXTQQ6Qb3SMnaG/Ao1TuiWseXh5Brc=;
        b=hQOMD3JOQQTFxbhjcL93Jt49SKQ0Vv0Kwj2EOnf7MVXI5ROmRrivmhoP3rweVrlG+i
         f1fhsbnojxUHYIs7n/LD+isTo/6d1Db/cDKZ8TKAPz4RM9OZ236vxRJCKYUTNrrEKksA
         xF/iTT7xa/zZYoIIk0Te1Ao/NVOu0qcSO75ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qpR1fSwWud+BpwXTQQ6Qb3SMnaG/Ao1TuiWseXh5Brc=;
        b=Khl8DjzzSKNMwg7VjN49yEoqU8Vqy6mPFAuRfetmTyRWfeEp3WCjBaA5m4O7Xw4Gy7
         RaULmZiaT1Olc+CmBzZ6JABCaRxuLuTOsQqAmCjV1AyYa/V9sL0T0+WNfnjo6HtNfzRO
         6XDXRN2VhPbVckbLb9Zm26cLePEk2EIqRf+Zjk14JOzWQqo+1OrQrQo1ghTRHz3+12Og
         kuMpcWay6YUHS8iUhc1QjLX2b5tV/mxbawZAvIpMmmW2hNoyjAPIDbkkn/Vkb7SDflkv
         VcUZZUjQqYSoVVNXjzm9vgmPRqoQifknyCuyCsIKpaYq6sv1EMR9xV1kcvNnxVG7J+ao
         R8fQ==
X-Gm-Message-State: AOAM531xliDH3dvn1HNvmc9Hv8ssP6W5LAn6P5Z9m5CDDqMTc8xKK+/2
        E1h486qdNJ4pO1aXp4mNrYiWcAJNV1XpZ76wg6PAAMG+iYh1mA==
X-Google-Smtp-Source: ABdhPJzMFvqrFdO4YlsbOsfV2+hMu9Acu/3z5vrF/bDYlnfbOa8R6b0cj1mxIsPqVxcpOkFFcxGXBXgWNHqcSKVrOmg=
X-Received: by 2002:a17:906:eb09:: with SMTP id mb9mr34176487ejb.452.1619041493758;
 Wed, 21 Apr 2021 14:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5-QPBHuGBVvrdcXvsjo2BVcQcfeQrWmZV5__WuhgnpiDQ@mail.gmail.com>
In-Reply-To: <CANzUK5-QPBHuGBVvrdcXvsjo2BVcQcfeQrWmZV5__WuhgnpiDQ@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Wed, 21 Apr 2021 14:44:42 -0700
Message-ID: <CAC1LvL3rFo8YaMyRim=MpYP00a9ZH2c8X=J-hxiM48=SBm+Xuw@mail.gmail.com>
Subject: Re: IRQ assignment for queues
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Apr 20, 2021 at 11:57 PM Srivats P <pstavirs@gmail.com> wrote:
>
> Hi,
>
> Not a XDP question, but more generic about IRQ assignment for queues.
>
> For a NIC which has separate RX and TX queues (no COMBINED queues), I
> see in /proc/interrupts that only 1 IRQ is assigned.
>
> ...
>
> srivatsp@EXA8:~$ cat /proc/interrupts | grep enp5s0f1
>  73:          0          2          0          0   ITS-MSI 2623488
> Edge      enp5s0f1-rxtx-0
>  89:          0          0          0          0   ITS-MSI 2623504
> Edge      enp5s0f1-rbdr-0
>  92:          0          0          0          0   ITS-MSI 2623507
> Edge      enp5s0f1-qset-err-0
>
> Is the IRQ for the RX queue or TX queue or both? Does Tx need an IRQ?

I see the IRQ name has "rxtx" in it. From my experience, that's the
same type of designation used for combined queues, and indicates that
the IRQ is for both RX and TX. I'm not sure which driver you're using,
though, and my experience is mostly with i40e and ena drivers, so it
could be incorrect when applied to your case.

--Zvi
