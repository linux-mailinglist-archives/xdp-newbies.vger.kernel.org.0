Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631AB1EE387
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 13:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgFDLkb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jun 2020 07:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgFDLk3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 07:40:29 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38F6C03E96D
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 04:40:28 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id k13so3292557vsm.13
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jun 2020 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8A4P2pMy0975rPx+Pf5aUowjMf1LhHZqfAo/ZJSA114=;
        b=TdkgLYGA5zmOdPYiRF3UKYvKPBFRrvAdbcTuAh4cR6DTtlQqTXyykxoLbw1y7jMU/4
         NiJ4OovbPhaBN5mdM5N/VA3kPd1f84Dzd4x3dDWlySIdAvuVYkEQ5qbHKb1pLuHjx1kr
         M1d8WxkV+S83lL+zE0nIPHg2hRENwb4LlYI2wQnp0kfIFLlKOi/0a29jZgAafMKkC2l9
         MptYMrhKtQ+dg9QUz3hei1maA9Fa3qdisBQhNXGLinP0Snmx7Hvd0tb8XcjploCEl4ZI
         alTbEJnRY8esNsVmO/505zR2M307fZegclqgt1YixDcsWeKoq4NFjatG4BobWvA+o4qg
         VsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8A4P2pMy0975rPx+Pf5aUowjMf1LhHZqfAo/ZJSA114=;
        b=eAXFayyFZgBMGAelh2PEbTpSyqWXxQweb2Mth9ouWoccxv/6kryLegvi1OlYzFTAgx
         akOW50AHWy+cSexnZh1wRdouU8JcqIihbdtIM9WLGsnBoxzz2uvS2/enIeblsg8OLUec
         4xdtoMV2WqUmpckqQzEYDaEhwyLAJw2MPpibJK3h/cFeLm/lhMbOCUiPgUgTG4lZE2BM
         qegp58WC+Eu7yNjErxJ1yv3+Q7vjvvFq2+rrRAeHkzrzQCVoIJVTSTBlJuIsOiwNib7p
         M7zWDZADbT5QpNz4pkGYs0zMdWC7BM3AQizIAezNpO4xNgdg7OZYSOOpuyG4Pyirm31V
         20ew==
X-Gm-Message-State: AOAM531hl6tB+dRoBVGnhJf9a0BWs8Sa3xRTNrF5mN4atB1Q+MppzL88
        tKonIwEwFAuoRfS/rhxslTbX6YBznJXyLj9ByQ2+3uZQSZ8=
X-Google-Smtp-Source: ABdhPJzOG4Fp/11S6Vl2DKO5skC8CdeCyNnT5l6lj/PJlRIRops8D0yDOB41UDfqsXnETGIG8t1vvi3ni9XUGrKzJL8=
X-Received: by 2002:a67:d10c:: with SMTP id u12mr3032032vsi.218.1591270827926;
 Thu, 04 Jun 2020 04:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <dd7946c400c544feac167dab0ff4f974@hm.edu>
In-Reply-To: <dd7946c400c544feac167dab0ff4f974@hm.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 4 Jun 2020 13:40:17 +0200
Message-ID: <CAJ8uoz2kCCmGC_+0uZiZnL4msWLYjoaW-fLB0arzK1FfMtPGDQ@mail.gmail.com>
Subject: Re: Dynamically adding new multicast streams
To:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 4, 2020 at 1:19 PM Gaul, Maximilian <maximilian.gaul@hm.edu> wrote:
>
> Hello everyone,
>
> I try to dynamically add new multicast streams by creating a new AF-XDP socket bound to a RX-Queue.
> I also create a new ethtool-rule to steer the flow of the multicast stream towards that RX-Queue.
>
> My BPF program has a Hash-Map which maps a struct consisting of { src-ip, dst-ip, dst-port } to an index in the XSKMap (which is then used to redirect an incoming packet).
> So adding a new AF-XDP socket also means adding a new entry to that Hash-Map (and to the XSKMap).
>
> Now what I am experiencing is that the moment I add a new XSK, other already running sockets are loosing some packets (around 10ms worth of packets).
> I don't experience any packet loss afterwards.
>
> My question is: Is there something happening inside the XSK- or HashMap which could cause other packet streams to drop packets?

What NIC are you running on?

/Magnus

> I am not using Shared Umem, just launching a new process which starts that XSK.
>
> Best regards
>
> Max
