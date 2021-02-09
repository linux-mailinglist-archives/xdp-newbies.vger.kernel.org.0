Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93727314B9A
	for <lists+xdp-newbies@lfdr.de>; Tue,  9 Feb 2021 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhBIJ3B (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 9 Feb 2021 04:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhBIJ06 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 9 Feb 2021 04:26:58 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6DAC06178C
        for <xdp-newbies@vger.kernel.org>; Tue,  9 Feb 2021 01:26:18 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id n19so4095708ooj.11
        for <xdp-newbies@vger.kernel.org>; Tue, 09 Feb 2021 01:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rcDSrHaKoEmqjLaSe9y7dRjQusHQrkmDuKjqilP6BiM=;
        b=Gy9Q+HrTLGHFrvPPgdnw+Id8ngspUaNFy8ss+0AE4CO4CyN4V3r/mtjrIXxMhZz66Y
         dImgxzToUyzfjU8NaVEI2ModBUJxRsAlsjidigseI23gexQ+d7UIVsA9e5uCDdNR2ZtC
         m9oX6G3tWMwTZ5LoxoeR4QpldrAg9Eo4vG3zilt7eKC+Konjih+0KTHj9tAATrUhcQ7v
         UssEwCT+l+c+pKg/mrsfTc1Do/y4D9wBRxpAxO8JRREy6NaYVB0PisMWkUvINoVHtJRo
         VS8yPwJi2QLbuBHe5Vbllc8m9TqR4YEEIMoujofnYK4AZm2xr9u/FF+MnpmpEJJXeTr1
         Sf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rcDSrHaKoEmqjLaSe9y7dRjQusHQrkmDuKjqilP6BiM=;
        b=c5mJSkI6nDZ9/4zE2io6Y3WaVTdUmO4+t6jYt5N4SFdIUJ2dNUXF5sqpdJznqPOxaC
         73qXVwbyxWJ0bFwc+2vfsLgBgtyM4uEw9ugvYBKoT9PuyDU52l3q6USbb7K3j1VmB596
         taBZghS4Xoq1wTlJ8Gb1aHNsqcPNOEBqGGeW/Szaq1DZF/SXVUYLi7ztA9KlzNlITjiA
         c5ST/xmo7m7yKuyjidLuMMbM0RzTz1//+bYwZNDnPZu/F5qkOLMSISyMMnLUbZItmtgE
         wSmVdmkSA97i1sS0yxN7iFfvfOyf1KWMGF2Vm9mVaToNfopFRgHUzZA+A22wIeiWZ+jP
         gUoQ==
X-Gm-Message-State: AOAM5307wHccAVBtpxxIZUE61tmv4pC0eKMTdK7AuCL3ATR/U3I9l6kW
        IPJcmrUqvQaziQNqgwNiKQSZneUEeI5ARUOBsI0=
X-Google-Smtp-Source: ABdhPJxoz+uLKSQe6br7l/uW3nWGd0AgO/HR6piGE+tB5t/fmkWrC57MU9HECDtSDnm7BVTVPs98NJuhgGns9iSOz10=
X-Received: by 2002:a05:6820:445:: with SMTP id p5mr15194355oou.63.1612862777830;
 Tue, 09 Feb 2021 01:26:17 -0800 (PST)
MIME-Version: 1.0
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
In-Reply-To: <20210209102118.476f507d@carbon>
From:   Radu Stoenescu <radu.stoe@gmail.com>
Date:   Tue, 9 Feb 2021 11:26:06 +0200
Message-ID: <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
Subject: Re: Redirect from NIC to TAP
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello

My physical NIC is a Netronome (I can come back with exact model type
and driver version).

Redirect NIC to TAP doesn't work when XDP is attached in driver mode.
It works when they are both in generic mode. I haven't tried other
combinations of attachment modes (one driver, other generic etc.).

Thanks

On Tue, Feb 9, 2021 at 11:21 AM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
> On Tue, 9 Feb 2021 10:31:50 +0200
> Radu Stoenescu <radu.stoe@gmail.com> wrote:
>
> > Is it possible to redirect packets from XDP program attached in driver
> > mode to a physical NIC to a TAP interface?
>
> Cc. Jason Wang as I think he implemented this, but I'm not 100% sure.
> Maybe Jason can remember?
> (or point me to the relevant code that I can check).
>
> > The same works fine if the XDP programs are attached in generic mode.
>
> So, you have tried and it doesn't work.
>
> What is your setup?
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
>


-- 
Radu Stoenescu
