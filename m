Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E9D19245A
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Mar 2020 10:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgCYJlW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Mar 2020 05:41:22 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:44259 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgCYJlW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Mar 2020 05:41:22 -0400
Received: by mail-vs1-f53.google.com with SMTP id e138so1052527vsc.11
        for <xdp-newbies@vger.kernel.org>; Wed, 25 Mar 2020 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFV51ls/MyXTuoBqrSQ2vu1C9CMIZlIsg8j1BIYYLBI=;
        b=hVgM9u3+uAjZCZ1C9M0FqzwjOojXG6aPYH1d128NwZgfjq+bwIrgVNf3Uedu3fMmTQ
         b2N9ut8uW9hIftH1q8bN6w68Kz9AlaznWzSIhMOjqcHekbubDf9QlO+uaXflfwHKICoK
         n6d3TdXbTkMA1Murfiw6gkfgOZ7GZBmDeFQ2COPK80eQzIPgAJ5TF7Km1Z+lIHnpf0Pq
         9HbC3gOF3CaaPa9T2ndqiK7w6NryBsPC38CLKJ5Jj958muNSoKqZJnwgLkgxhHs0wwUM
         6zXHBILmgxsqymXWhXFBhj2k5htBPv1uf0pbhjuAGdI2iTPXkGmptDWmVBMiNYcUuqk1
         LxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFV51ls/MyXTuoBqrSQ2vu1C9CMIZlIsg8j1BIYYLBI=;
        b=UrE8X/xCVffiTxwuHY/1He2qXP3YqeYEm76ehXkOSjqtBy9APqku8OQNCjAi9ZZn8Q
         yK5Wac1kQQBQ5/FDiJStO90S51LzxDkhUKeBgOk4JI0LRuyJT9W8BwZ4KO9nkSVdY0OB
         OHOFrqKGCQcVhvxd04YXiX+OQecVYx95fc/v2gPeEmxFoMPAlmg4EkmHDOpbvSK8xOjx
         tfScrdZBkGalLPbPteTxLWth6i8PjV2xC1DUSDnuLuIp/FPuWtVoLVHVC4iJXgEUuzv4
         Px3yBPUSWBM8ZH4hXlG780GV+tZuKJ3Es2uVj+CpWv6U/hbdA7EpE/VTZrn6FTB+9rNG
         dvmQ==
X-Gm-Message-State: ANhLgQ3zoIEdrIu/KScOLP5VnyATy5Mwa1X2uKE6eKmKQaQBS9UPlhrW
        kGntrxP2CVNUZ/iHAejKsme65FII7EVYDtYux+2fMqhK
X-Google-Smtp-Source: ADFU+vsPzWhH5uEZQnqNfhnDu2RHGKU3zba1DIIyp4SrL4g97XOVDp6S3ptlw8CG9phUmy+/QITfNaUzCw++4ccVFHo=
X-Received: by 2002:a67:24c1:: with SMTP id k184mr1660121vsk.177.1585129281203;
 Wed, 25 Mar 2020 02:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <018e8071725b48399141cc46b63641e1@hm.edu>
In-Reply-To: <018e8071725b48399141cc46b63641e1@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 25 Mar 2020 10:41:10 +0100
Message-ID: <CAJ8uoz1Vh+zj6msumTNWgtZY6jdOeYgoyDBoizfna1dzhC465A@mail.gmail.com>
Subject: Re: Shared Umem and reducing ksoftirqd-Load
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Mar 25, 2020 at 10:04 AM Gaul, Maximilian
<maximilian.gaul@hm.edu> wrote:
>
> I am running a Multi-AF-XDP-Socket approach per RX-Queue (using Shared Umem).
>
> Unfortunately I am noticing, that at around 650k pps, the *ksoftirqd*-thread of that RX-Queue ramps up to 100% thus leading to packet loss.
> I tried setting *XDP_USE_NEED_WAKEUP* on *xsk_socket_cfg.bind_flags* but those bind_flags are only taken into account if *umem->refcount > 1* (libbpf/xsk.c - xsk_socket__create()).
> As far as I understand this correctly, only the first socket is able to set *XDP_USE_NEED_WAKEUP* because for all sockets after, *umem->refcount* is going to be at least 2.

Yes, the other sockets just inherit the settings of the first one.

Are you using the SKB mode? What is your packet size? Sounds like a
low number unless you have large packets and are using the SKB mode.

> I didn't observe a dramatic change as I've hoped to. Are there some other ways to reduce interrupt load (user-space application and ksoftirq are already running on different CPUs)?

The need_wakeup flag has a big impact when you run the softirq and the
application thread on the same core. When using two cores for this, it
has less of an impact.

/Magnus

> NIC: Mellanox Technologies MT27800
>
> Best regards
>
> Max
>
