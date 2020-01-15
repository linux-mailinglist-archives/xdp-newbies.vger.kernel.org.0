Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2F513BA6A
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 08:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgAOHk3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 02:40:29 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46521 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOHk3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 02:40:29 -0500
Received: by mail-oi1-f195.google.com with SMTP id 13so14478058oij.13
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Jan 2020 23:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9aEqwZY/0nu4T0nw90dzzuf9K/wuTw4S0KYBEI6pGsU=;
        b=LMgL759i0F6lsoPRv1hNHkAH13vmZpGGCv4KWbqsbWp8Pvlqaoj+keAV5ZgwZraT/V
         /mOiABtP+NEJHoLTiDHVidAZWNsS+Grl63hnQfY4gEL8QKbSEVco0IRut+WQZvRwm9bC
         IxfOLyVc+xc9IgTL4H6wZJvdetAXG87PjDBw4uWzj05nGlMNkewQuFkkWd/rCSFSdGb6
         mN5xKWMyQGWoLSvlC3hUVprfCZXqk80EPQqdlc1lK0urtx/VwqDelMrfaHd7NGbXrq9p
         xkFsA1kklwVBomYldmzw3RYWnlDhWj4NEJcKXzvh4LisIUSuQxZwV3xjZmAhLEOc3b7z
         98LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9aEqwZY/0nu4T0nw90dzzuf9K/wuTw4S0KYBEI6pGsU=;
        b=WUqD8Lf5sqUsHNXYuyjf5nBRsHuN6IuyyAiwwg5bypPO4O6wMHxopiOx04B8YEfJ/L
         g/4PEFTKsRSv25DXrL4b+j26DGyCWZnmwVNwaHSoU2jpQDYVu7oNb/VXhgVqd7f0FLf7
         pzJF6uEAh2WHp2uSiBna7bmnevhZIDuwht/hWdG6OgytVZ9VWo6a9dZbMQffRLBue1cG
         0zyzNFvXdnHP0s7x/wyfhW9SugumiBLzCoZFFAtLB8Kt4fK8rPl/GGASK3fIYi2BeZ32
         nE/7eJl47BxFYtorHYPZqGJOUjpf0+N23mI1hwTmBXvnQPabP4PelNROsrvkiRyKnNU2
         tfDA==
X-Gm-Message-State: APjAAAUwf+ig4JZTppYTiFUnx35IAvO5D15TcmRH0jzHP3FwYAffTQ7/
        sAeoliEb9bR1ETfqMhBIV62zi0OtMJHulrSgdDg/sXnTwN8=
X-Google-Smtp-Source: APXvYqzWeRMX5XaBXsIRWqTQfQDobj9UrRK1aoyZgVCfVsXaNzVXAzrJQ8edXwYsFq7Ex2YPVdFuaHZVXQ8/UKe4epk=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr20970727oig.39.1579074027683;
 Tue, 14 Jan 2020 23:40:27 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
In-Reply-To: <20200115014137.GA105434@smtp.ads.isi.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 15 Jan 2020 08:40:16 +0100
Message-ID: <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 15, 2020 at 2:41 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
> On Tue, Jan 14, 2020 at 03:52:50PM -0500, Ryan Goodfellow wrote:
> > On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> > >
> > > Just sent out a patch on the mailing list. Would be great if you could
> > > try it out.
> >
> > Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> > tree and manually applied to the 5.5.0-rc3 branch I've been working with up to
> > this point. It does allow for allocating more memory, however packet
> > forwarding no longer works. I did not see any complaints from dmesg, but here
> > is an example iperf3 session from a client that worked before.
> >
> > ry@xd2:~$ iperf3 -c 10.1.0.2
> > Connecting to host 10.1.0.2, port 5201
> > [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> > [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> > - - - - - - - - - - - - - - - - - - - - - - - - -
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> > [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> > iperf3: interrupt - the client has terminated
> >
> > I'll continue to investigate and report back with anything that I find.
>
> Interestingly I found this behavior to exist in the bpf-next tree independent
> of the patch being present.

Ryan,

Could you please do a bisect on it? In the 12 commits after the merge
commit below there are number of sensitive rewrites of the ring access
functions. Maybe one of them breaks your code. When you say "packet
forwarding no longer works", do you mean it works for a second or so,
then no packets come through? What HW are you using?

commit ce3cec27933c069d2015a81e59b93eb656fe7ee4
Merge: 99cacdc 1d9cb1f
Author: Alexei Starovoitov <ast@kernel.org>
Date:   Fri Dec 20 16:00:10 2019 -0800

    Merge branch 'xsk-cleanup'

    Magnus Karlsson says:

    ====================
    This patch set cleans up the ring access functions of AF_XDP in hope
    that it will now be easier to understand and maintain. I used to get a
    headache every time I looked at this code in order to really understand it,
    but now I do think it is a lot less painful.
    <snip>

/Magnus

> I also gave the 5.5.0-rc6 branch a try (without the patch) and packets forward
> OK.
>
> --
> ~ ry
