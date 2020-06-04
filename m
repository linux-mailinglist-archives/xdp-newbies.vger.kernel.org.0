Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2057F1EE4EA
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 15:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgFDNBX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jun 2020 09:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFDNBX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 09:01:23 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410C7C08C5C0
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 06:01:23 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id r11so3456710vsj.5
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jun 2020 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ol5OFsETnxHyskmFn0bgNvdLB5/9fmivngXlezFIBVU=;
        b=S/IxASXC5Ccwu58vmLzil4vE3SYM0i50+twyJNp6cwsYiZIkCcl1ZvQJhbCUd//tdC
         EgpmpwngnSl3OKZxmNye/RYrsZuSq5BGubFlZ35p2GbHyOsJYeG90Q0oReMI8urrXo2e
         eCWqMxK8dOsEAWI2LZZJOPM0jk9VoFVyas6nwPonsckRGN6P0zmtsLV1Dh312jehDwY6
         yfDf7JUJilOORwf1mBLdIuPcUZaP+Pcm2HsVfNH1c5EQW50LAVL7xYOQv6KL8SYVV7sw
         tfPK76h8FdcvsWYF8n3NWZz4hGBeDq9DGkAb5KN8Jl/bK0EElqMl9zeCt3zN0K0DIN+U
         IcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ol5OFsETnxHyskmFn0bgNvdLB5/9fmivngXlezFIBVU=;
        b=OMVCMOBQCxYjXbfI/mpxufswl9BN7xBg7pqsSlCKc96zaBtKW3OXn3YXBkSq5kAjYG
         MMBZ/Lt0BsKKtItU17l1LQ1pAsAAWsRT8bY5wdxy4qppyZA6OxUT3CpbK7XOox3Q6yLG
         WyS9aKJxEksj+nBpC4jlc6YCpYzQ7pL38/bplIiKlm5HT8Ul2UJgtBSz/qQjN8fCwALY
         nlFJ/JTOGBfpq+7rgT+8MhuBwLsIiTEiEVn+yNHIM/m636rFTxI3INhT+xPo1Mw99kZl
         6Vsoak+8pTCL3kXkZkcQ9JCtFU3idOaEUAuEzi3d+lrxJzKV00PnSOmeUhO2Gni28SvU
         ezZg==
X-Gm-Message-State: AOAM533mfllO2xh8bc8T0T+N+anjU5dT0ZQbCtyoGRuAaKRzGlPtRETL
        qcIKM9MqIRVzI3JJFpsfWz1eqMpiHAR9u4wdhtE=
X-Google-Smtp-Source: ABdhPJxuoojXgkhWUgMD4pmTWch+nfbZaMNzXVr/MODcQwnJ8SLr8hqsjhAdRrmI7DSwBy4dSgNriRzD6Uyj+NMpx4c=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr3141583vsr.158.1591275681188;
 Thu, 04 Jun 2020 06:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <dd7946c400c544feac167dab0ff4f974@hm.edu> <CAJ8uoz2kCCmGC_+0uZiZnL4msWLYjoaW-fLB0arzK1FfMtPGDQ@mail.gmail.com>
 <8e61772f33674b54b1548198fb55bd4b@hm.edu>
In-Reply-To: <8e61772f33674b54b1548198fb55bd4b@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 4 Jun 2020 15:01:10 +0200
Message-ID: <CAJ8uoz0VC-DFuS6YM7gZ2fcSz1suf+LSsNSt-1Efpkeptv1W7Q@mail.gmail.com>
Subject: Re: Dynamically adding new multicast streams
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 4, 2020 at 1:59 PM Gaul, Maximilian <maximilian.gaul@hm.edu> wrote:
>
> > What NIC are you running on?
> >
> > /Magnus
>
> Hi Magnus,
>
> I am using a MT27800 Family [ConnectX-5].
>
> There probably is something wrong with my code I just wanted to know before going into heavy debugging whether this is something that shouldn't be done.

You should be able to do that. I do not know how the ConnectX-5 driver
is implemented, but might there be a time period in which it does not
serve packets because the NIC is being reconfigured for the added
queue?

/Magnus

> Max
>
