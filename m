Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59FDB19D8B6
	for <lists+xdp-newbies@lfdr.de>; Fri,  3 Apr 2020 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgDCOKx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 3 Apr 2020 10:10:53 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:34304 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgDCOKx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 3 Apr 2020 10:10:53 -0400
Received: by mail-vk1-f178.google.com with SMTP id p123so2029265vkg.1
        for <xdp-newbies@vger.kernel.org>; Fri, 03 Apr 2020 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+prKxFUW3NHV8f+fRMKc3hJgjkcNxBcsYL1CXE28D64=;
        b=eQnmZXImqGN1O2Nw5gCSqqg+3cYARrDjdMyJMZvNbDXkgYIcoCR1r80Gu1lsT5qfeg
         wrEnI4oDxW5f6QS6MCoDoKV6CM5LFUSnTXa507JyHllGCfHUh7sWhrK7z1ZrsWEkZ87z
         BTXiadasiCx2t3IF14KZkNlTWD8ljZ57BV8faihhAGpsdSPX8k7C5OfGSrFsqzSmPcq+
         7WhFlB3xtsxhh0gL+AfjuFCP9qKKcTvUdFPWD4NSZmhynttsP+nlyjcK1R54Gkr03QkO
         PfsFxW6rg2d3+VCH7Md4AwsVGcMBwaJCCjksNHq8FuUBDMrX+Ic2/xOm3Y8nHBJagYSj
         0NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+prKxFUW3NHV8f+fRMKc3hJgjkcNxBcsYL1CXE28D64=;
        b=hTm5LDrxyB8eGJTOaRWyIBoMNEGHcXxNHRSCYlE3t5jo5JhAapqMzd89S8u3Y+nV2m
         beWCevjSuJl6oq/FZbvWJl19qpkzNLbfY01pmWvokl7y6n2/DaeZMNqSpfDh0essPQv2
         QDuVputsUMXkvcbZ7fCYKYFKQF7UxG+iL1LSiGZ1zF1V2ffw/06MAApU/9qIL8knPM/7
         qFzZjQ51sQzxvLVCtGRmMdsGdb/RS4pvXW+CslL+iUFmd4coinDAPm0g98jMJQ2BGi8U
         rwEk2i09AUKAdx99cVDgaEnfbD4YxqbnjlY/pdkB5ysrZiwtJf8n3J4sN49/dORdsA+e
         ypwg==
X-Gm-Message-State: AGi0PuZwnve/lmF4bCKUSa64L9AN3u8qalTyplAQP6zxfFBNmeLP5+uq
        hikiDth4ebMcsXgz2odsUgTSIHd5RRPs/rTB9H9TM0iR
X-Google-Smtp-Source: APiQypLyIl+JVwGuna/qvH2JP3F86/alBOdokW+RXDR/F156yVnEe+AgwvWEitaQCFNNeI/tNuv5otRumLPGAwz2Hjs=
X-Received: by 2002:a1f:d084:: with SMTP id h126mr6269255vkg.25.1585923051115;
 Fri, 03 Apr 2020 07:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <7c11add0-e837-4ce4-9158-249c800d0d2d@www.fastmail.com>
In-Reply-To: <7c11add0-e837-4ce4-9158-249c800d0d2d@www.fastmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 3 Apr 2020 16:10:39 +0200
Message-ID: <CAJ8uoz1FeupoucsiF_Nrxv6S+XVXjpeB_pqcNJ3n12B1XsEyAQ@mail.gmail.com>
Subject: Re: Running XSK on a tun device
To:     Gilberto Bertin <me@jibi.io>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 3, 2020 at 3:07 AM Gilberto Bertin <me@jibi.io> wrote:
>
> I am trying to bind an XSK socket to a tun device, so that I can run some
> automated tests on an XSK based server I'm working on. A tun device would in
> fact allow me to have fine control over what packets I'm sending to and
> receiving from the server (as opposed for example to an approach where the
> server listens on a regular interface and tests interact with it over sockets).
>
> The XSK logic of the server is largely based on the one presented in the
> xdpsock_user sample in samples/bpf in the Linux kernel (the server is using the
> XDP_USE_NEED_WAKEUP bind flag).
>
> When I manually interact with it using a pair of veth devices and netcat,
> everything works as expected: the server receives and then sends back packets
> properly.
>
> The troubles start when I try to bind it to a tun device as I am not able to move
> any packet between the device and the server.
>
> I tried then to reproduce the issue with a simplified setup based on the
> xdpsock_user sample, and I got the same results (I tested different combination
> of options such as driver mode vs skb mode, poll vs non poll mode, need-wakeup
> vs no-need-wakeup, all with the same outcome).
>
> By inspecting more closely the behavior of the sample program I found that:
>
> - packets are actually being received in the rx ring, as poll returns 1 each time
>   something is written on the fd of the tun device
> - the program gets stuck in rx_drop() [1], more precisely in:
>
>         ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
>         while (ret != rcvd) {
>                 if (ret < 0)
>                         exit_with_error(-ret);
>                 if (xsk_ring_prod__needs_wakeup(&xsk->umem->fq))
>                         ret = poll(fds, num_socks, opt_timeout);
>                 ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd, &idx_fq);
>         }
>
>   where xsk_ring_prod__reserve keeps returning 0.

Which kernel version are you running? If my memory serves me right, in
versions prior to 5.6, the update of the global state that signifies
that there is space available in the fill ring was updated in a lazy
manner. If you are not using the latest kernel, could you please try
it? Maybe it could give us some hints on what is going on.

Also have to say that the sample program is quite simplistic. If you
cannot reserve some entries in the fill ring at some point, you should
just go ahead and do something else (receive for example) and come
back later and try to do the same thing. It is not critical to always
be able to fill it again, even though it is good practice in a high
performance situation to keep it as full as possible to minimize the
risk of packet loss.

Note that there is not zero-copy support for TUN, but there is XDP
support so copy mode and XDP_DRV should work. Also note that I have
never tried TUN with AF_XDP, so you can have stumbled upon something
new.

/Magnus

> I'm not sure why this is happening as most of the descriptors in the fill ring
> should be available (especially since this exact same code works fine for other
> devices like veth).
>
> As I'm still getting acquainted with the codebase it's not obvious to me where I
> should start looking for to understand what's the underling cause of this issue
> so I'd really appreciate some help/pointers on this.
>
> Cheers,
> Gilberto
>
> [1] https://github.com/torvalds/linux/blob/8ed47e140867a6e7d56170f325c8d4fdee6d6b66/samples/bpf/xdpsock_user.c#L873-L880
