Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78537359CA3
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 13:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhDILGn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 07:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbhDILGm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 07:06:42 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28113C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 04:06:30 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id g10so2567017plt.8
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10d4Ycmz3EdeYAbhxkb4aNaMWOKu5qFv5ajiTtMtkaw=;
        b=RI4teVr+OUb7CCJA4ItJDc+E0mc+srx+Ui8TG7mKCndE26U98rcXFM1GhC1tN+fuFb
         xrZryj3rKlhMXLB4r2cSlMv5YhwJ1SR8G9cjOlGTGrPGmxfCRHa6P4c+799Ivu47oOVr
         f8KSQP8nvk7mjLAvKqOQC+R7lxoe//RVljPAqAmGC7V7ZWxenaEcE0UGUN1doSYcnsnC
         3LMt+l35BhBIdS0Wqpxjm/mW6nhbMlWpsia76sKXZk71fXHfhKvh1ma7sqHKstK3xMJ5
         B912jS+HxW9knXe/jKq3SJk0Y2eRyMloDT4ey4b/L75p87/S0hdHa7mdZ1b7ZnpjPYU4
         3nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10d4Ycmz3EdeYAbhxkb4aNaMWOKu5qFv5ajiTtMtkaw=;
        b=eUKoscSgkeshnjFKsHUm1mCj2J0DWJXoXr4TxOS6QziAle2QuelqL+tsbWBArHGg9/
         3JC5jkEo54qGyg6RFjgWfOhw90mFMEWfDnbsxFOHh2Rw5Qz/H2GE0wuFV4kGRaEyr3Gh
         UhH/xs88ld9KMIc1sHSgySlr3JXJyaqoI40EZLRmRR+j4IOWvUaKnNx11ly9FbVCt8qv
         fPoRQXT+xz5Vm4F8lguskQLHuM+hdSEKpv5Nb+LK218X6uChxoIFqjInEmSxAff3Hf4P
         uqNa1q7jQ3agVn/bY1PtlQhZ6WvH2O6Av+bN3K1PcgrNpfGsYwboJ3D+yJOjjJzzDDn3
         VAtA==
X-Gm-Message-State: AOAM531ObChKxAaHt5LHZbWb7yLdcLnalt9r+1e3Vb4TMx7pXx5aP4gZ
        r1YwBJAIoCFVjT7YdpZerXM7rep9K3touhRhaC2jl2sxJVp4jg==
X-Google-Smtp-Source: ABdhPJzT84ieq61MPySm2tD2/XiVNK6R57gd7yjZtPMET+M/GOaKdP6KM4C9P6ZOQA3L7ktcYuV7kDb8Ly6Aub9POZU=
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr12745985pls.49.1617966388667; Fri, 09
 Apr 2021 04:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
 <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
 <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
 <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com> <CAGZFCEGzm5M=pnuXrA5vXGfntX8BOtyVfVK2hmANVfAn7b79=Q@mail.gmail.com>
In-Reply-To: <CAGZFCEGzm5M=pnuXrA5vXGfntX8BOtyVfVK2hmANVfAn7b79=Q@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 13:06:17 +0200
Message-ID: <CAJ8uoz3ZoCXK6H7rrbV8oRA7TBBz9_zW=Um1+v4vNTXOWag8nw@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 12:50 PM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 3:50 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> > Then looking at user-space code will not help you :-). Take a look at
> > the code in driver/net/ethernet/intel/i40e/i40e_xsk.c in the Linux
> > kernel for an example on how to DMA map the umem.
>
> Thanks, i could see that it is pinning the pages and mapping.
>
> Using Kernel DMA api, we can map the virtual memory. But how the NIC
> can write/read to the memory if it is not physically contiguous. NIC
> card only understand physical addresses. Correct me.

In XDP/AF_XDP mode, the NIC only uses a single 4K page (on x86-64) per
packet so it will be physically contiguous by definition. Every single
page will be dma mapped separately and can reside anywhere. There is
no scatter-gather in XDP/AF_XDP mode.

> > > > > > /Magnus
