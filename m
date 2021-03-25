Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B04C348A12
	for <lists+xdp-newbies@lfdr.de>; Thu, 25 Mar 2021 08:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCYHYy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 25 Mar 2021 03:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhCYHYf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 25 Mar 2021 03:24:35 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A6AC06174A
        for <xdp-newbies@vger.kernel.org>; Thu, 25 Mar 2021 00:24:35 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g15so1132620pfq.3
        for <xdp-newbies@vger.kernel.org>; Thu, 25 Mar 2021 00:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAx7fvia9ya8xsfYK++oyL4xTM/vN4YwKRByLpN3H3k=;
        b=Z+bCMH5pa6rKN9Gqh8dzx/kywPOTcolnGkPToP5Uc6KBa0E7MWyrcnTXDRSRUcbNUN
         JFIdfHZisQ/Iau63inHohiSODExehRJmStOoY9ghN9ml02umkSk9fSJuHft4IKYkj98l
         E9Q9kRm9yZI/kvU17IpUhHbKF2A/9V4dHw4F9dCpJu0UvjR7Z3CbmviJ58rTVVeQmXsi
         9kUdySX4gJbMmz0uhSqzAPhKIlmCSK01AmCtkb3kR7rpbey710sFCsA+x8sOhw2gl0Jg
         Ir9eImX99I2EH1QvJSDx0VpBJl7IaXYR3lJT+oOHwvafv4A/LIkRSVylaVPM5MA3oU+I
         NDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAx7fvia9ya8xsfYK++oyL4xTM/vN4YwKRByLpN3H3k=;
        b=Kio74UZjGwQNlBLLlqfZ+MyH920AhMXAjKfbQ6T3iZ1mTMULadUnJB4SkoRVFrgCTR
         H3EKGfV14ukk44FtRppgbcT9FsE/Gt7Hv5AM1EvOfOlk9Mxi4igl0mDf5q3dJCel/TZ6
         3ub4WHNodrNU29maHP9SY/Hpt6nNCJRvf/inVA6dGVZ6kNtHJWMR/nTglY/zyDesL3FV
         lMYTjPES1ZKLOnGR60hG8me6RS6dhGNNlJn8lY5Bwo/qELwD6krKCvWzhgiwMxdANIO1
         QfKpm7XnD8Iu202XPbFMzioi29Uv6dZF/VuF7APWMoDLIHEl5TPx84pzE5h78GDeOoDm
         pzzA==
X-Gm-Message-State: AOAM533ouyvQuz0XvXk9PuyDDlRVuZPMLRQ+8NZPNngqsyRPNRkmi3Uu
        y0RRMYKwiObZBftOC325KOOt01GnptPzx4OqDzw=
X-Google-Smtp-Source: ABdhPJzptcXZb6iwhRdkBKlpvaeXCaBsRj9bRkpp/of5bCwKDLZDDYg69CDbziKG0VJ4gOHKgFF+FOCwX2XC6R+snFQ=
X-Received: by 2002:a63:6fc1:: with SMTP id k184mr6530236pgc.292.1616657074906;
 Thu, 25 Mar 2021 00:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
In-Reply-To: <CAHAzn3peP-j-oL76FxmyRgHg=QbMfeykA4rQdoDRA-0c6iQ4mg@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 25 Mar 2021 08:24:23 +0100
Message-ID: <CAJ8uoz1VyA7OvtPzXUqUfZRPUv18RxEs3szR03k2vgDuwq3N3w@mail.gmail.com>
Subject: Re: AF_XDP sockets across multiple NIC queues
To:     Konstantinos Kaffes <kkaffes@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Mar 25, 2021 at 7:25 AM Konstantinos Kaffes <kkaffes@gmail.com> wrote:
>
> Hello everyone,
>
> I want to write a multi-threaded AF_XDP server where all N threads can
> read from all N NIC queues. In my design, each thread creates N AF_XDP
> sockets, each associated with a different queue. I have the following
> questions:
>
> 1. Do sockets associated with the same queue need to share their UMEM
> area and fill and completion rings?

Yes. In zero-copy mode this is natural since the NIC HW will DMA the
packet into a umem that was decided long before the packet was even
received. And this is of course before we even get to pick what socket
it should go to. This restriction is currently carried over to
copy-mode, however, in theory there is nothing preventing supporting
multiple umems on the same netdev and queue id in copy-mode. It is
just that nobody has implemented support for it.

> 2. Will there be a single XSKMAP holding all N^2 sockets? If yes, what
> happens if my XDP program redirects a packet to a socket that is
> associated with a different NIC queue than the one in which the packet
> arrived?

You can have multiple XSKMAPs but you would in any case have to have
N^2 sockets in total to be able to cover all cases. Sockets are tied
to a specific netdev and queue id. If you try to redirect to socket
with a queue id or netdev that the packet was not received on, it will
be dropped. Again, for copy-mode, it would from a theoretical
perspective be perfectly fine to redirect to another queue id and/or
netdev since the packet is copied anyway. Maybe you want to add
support for it :-).

> I must mention that I am using the XDP skb mode with copies.
>
> Thank you in advance,
> Kostis
