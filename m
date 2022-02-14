Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C313F4B5B48
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Feb 2022 21:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiBNUqG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Feb 2022 15:46:06 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiBNUpr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Feb 2022 15:45:47 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0FF160FED
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 12:43:17 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id i62so21463908ioa.1
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 12:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=princeton-edu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k2Mq8g+NgkTZp0gnLUuRF5dHaqJ5sbVGkrljJZifI6c=;
        b=mpo5LBuK7AncN1CjLqvbqk2rxGOCkfvv9j4Hn6NUWiqiefHi0GUZ/gRlFhnGBVWAzB
         vw23izNdAYqc7BaBNunhlnGUX5IGqsIxRtjYPaovQs80C7nlZb/pHGXWYieo2/dYx6Jk
         yPtxt7nWIpVle5KpMFEl7rnDSTbWqCz9MBC3nXWO9A5aRD+B9bkYoB3IGOobV1W3GBxI
         KvOSui5dHjyxiFPdZvL+0GFyNBswhZGGXONVrPoa9P2S+c3Sbr07WYvH3x7nuwFfEkbP
         at8FiYx2wl6VDeO7OJpW0zSLcYTxjae/Tus9rTqaD/I+JQu6mIXul8zjpbukPNzUGZbM
         gjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k2Mq8g+NgkTZp0gnLUuRF5dHaqJ5sbVGkrljJZifI6c=;
        b=FiemQXS2Lw3FYKQmBvfOwpCJKV33fWlVQAAaS3FKXDyu6dcVcxrFL/7nOzBvLtJ+E0
         cnNps5wfeAzTjYFdvqnM+VsMirQeUgUntV2CsU/g+mdH28S8lLlXNuYO+U8GU77KPkzY
         7IjHEh3f7al4jePdzQqJX74g1ig5p4ibO3QW3A18EisuOqz2PnpFdo3iFB3Z5HmgJwCS
         xogVRpKx6BMeQcfnTjuhsA7QOEY+Jog5qM9IM9NvD/t57pCYMAEDnAgzCpIAjbFzI+dH
         TcPJXpq/m37hh5BzqZmUzn5kl3WwkLHWN8AkL9lc5joCfr/DY7jGjNdR5f478fBy96Pn
         5WxQ==
X-Gm-Message-State: AOAM532wRJ/NV+dxtGnDJ7AGVTQ7rAkSM+wTLexO/leQAy4NqynE2ptn
        +0aGjOlotQuPHIAuzoSn8ON2i2Nrn9gI6Qk+COJ5s2Rq8m0=
X-Google-Smtp-Source: ABdhPJyLKYUMTkvWK8qklN+ER7FaThl9iym739JpJY3163y1XbJNliPn70q/bbtrp1MI5ppQr784uiMYPEDHNbY3CSg=
X-Received: by 2002:a65:538e:: with SMTP id x14mr516487pgq.58.1644867545690;
 Mon, 14 Feb 2022 11:39:05 -0800 (PST)
MIME-Version: 1.0
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk>
In-Reply-To: <877d9x7168.fsf@toke.dk>
From:   Sophia Yoo <sy6@princeton.edu>
Date:   Mon, 14 Feb 2022 14:38:55 -0500
Message-ID: <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Feb 14, 2022 at 1:28 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Sophia Yoo <sy6@princeton.edu> writes:
>
> > Hello,
> >
> > I am relatively new to BPF/XDP, and I=E2=80=99m currently trying to use=
 a TC
> > egress program to redirect a packet back to ingress, where I have an
> > XDP program attached. When the XDP program is attached in generic mode
> > (XDP_SKB_MODE), the redirect occurs properly and the packet is seen on
> > the ingress of the interface, but when the program is attached in
> > native mode (XDP_DRV_MODE), the packet never redirects and is just
> > seen exiting the interface, even though the return code of the
> > redirect function is =E2=80=9Csuccess=E2=80=9D.
>
> The difference between XDP generic and driver mode is that the generic
> mode is hooked into the core networking stack whereas driver mode runs
> in the driver as the very first thing after packets are physically
> received from the network.
>
> This also explains why what you're trying to do doesn't work: the TC
> hook runs in the core networking stack, and when it does a redirect, the
> packet does not actually pass through the network driver, it appears
> further up in the stack, where only the generic XDP hook will see it.
>
Thanks for your quick response! I see, I didn't realize that the
packet was being redirected before it passed through the network
driver. However, in this scenario, shouldn't the packets "disappear"
after being redirected from tc egress to xdp ingress? In other words,
even if the packet doesn't actually show up on the xdp ingress hook in
driver mode, it should at least not be seen exiting on the egress path
(e.g., on tcpdump)?

> So this has nothing to do with the support in the driver; XDP is simply
> not suitable for what you're trying to do. Why are you trying to do this
> in the first place? I.e., what's the higher-level use case here?

The higher-level design goal (simplified to what's relevant) is that I
am trying to perform a TCP 3WHS between the kernel network stack and
my xdp ingress/tc egress hooks, where some trigger on xdp ingress
sends a SYN packet to the network stack, and when the network stack
returns a SYN-ACK packet the egress program redirects the packet to
the ingress interface, where the XDP program converts the packet to an
ACK packet, then completing the handshake with the network stack.

Initially, I had wanted to use an XDP program instead of a TC program
on the egress path to do the redirect to ingress (which I believe
would bypass the current issue if both ingress and egress xdp programs
were attached in driver mode), but as of now it seems that redirect
from egress to ingress simply isn't supported in XDP, which is why I'm
using a TC program.

Thanks for the help!
Sophia

>
> -Toke
>
