Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9235113BACE
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 09:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAOIUn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 03:20:43 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40901 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgAOIUn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 03:20:43 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so14577874oib.7
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 00:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=78Idg/P3Sp96SW5ukaA6rGe+lqFFC9QTX1P5i4K8Ycc=;
        b=N+7WXxP3gKVyPmAH5Tx0oWsM60ZqrjfCo8wW9AqOvSHsnw4frU3mB5Oeh7Apxbn1Es
         HSLyuati/jvqC8CH4mReov5akZ8sCmzNO8u6z8dwUkE3pRuEK4R9wt482jDzMiN2PgwZ
         PzzS6wBRmSoqm96lZGVD8mXldVAGkhPAVg8xCwVgUhZhbNdQTUMdfOyeHfQbsSqi/uj1
         En0Q8S5MrAwZ1Uop1bcF0HZzf82HWdmHRgvzKWwH/ARsFWcMjp3Dt2qITzgCZomRQy02
         px3ORHJIJ2DRPZD/5F8HqfZ9CwB1rgJDHeSDikN0M0hGdY9hBGqMWGCiFFQmegX6kp9K
         zGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=78Idg/P3Sp96SW5ukaA6rGe+lqFFC9QTX1P5i4K8Ycc=;
        b=V9TRtpiecKt6Gh/kIxzuc68gjF3pmlT0NpC/pkIYzfZnhXyGNv++3a7B+dgJaIFtrZ
         +zQDILxOaxZVPh1V1BN5ptM0pd/ksmzJM+IbzYCkBV9afgpidHYn5TjkqOju2D/bA4N+
         RbMksB/hv6/7Ha6u6vB0frSZs61HCAjjJ8to9vLkCCbOhFmEQXhLVO7ie0YFaIKugINw
         THRCSzb1SMr73FSGRi2aoALIxqqsQja/Pao1TWTz2a0hdqbTdTeEidhF3O1N9Kcw2wdc
         XUymSXwy2ZieOscD7z2ACj2fvuE1y3lDc7ZEsmV6mPjGyxlOSb6J9XNVFN+kkKTilxiK
         +gHA==
X-Gm-Message-State: APjAAAVubUcqeHglb/WXvKldKf5fzVSo6kBVRl8uCxEQKamyIl/Ec73Q
        rPCC6lCcW/h6wZL5uspwZcD01WgNtox7RWJJ278=
X-Google-Smtp-Source: APXvYqydBu2bZI+ly0esPv96xogIeDaiDPjYXMYQBrvzD6htdKkW3FxLZoyuHnxeryOZ9v1MuIUTuqmuOomx5O9Botg=
X-Received: by 2002:aca:54cc:: with SMTP id i195mr19556798oib.126.1579076441911;
 Wed, 15 Jan 2020 00:20:41 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
In-Reply-To: <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 15 Jan 2020 09:20:30 +0100
Message-ID: <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 15, 2020 at 8:40 AM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, Jan 15, 2020 at 2:41 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> >
> > On Tue, Jan 14, 2020 at 03:52:50PM -0500, Ryan Goodfellow wrote:
> > > On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> > > >
> > > > Just sent out a patch on the mailing list. Would be great if you could
> > > > try it out.
> > >
> > > Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> > > tree and manually applied to the 5.5.0-rc3 branch I've been working with up to
> > > this point. It does allow for allocating more memory, however packet
> > > forwarding no longer works. I did not see any complaints from dmesg, but here
> > > is an example iperf3 session from a client that worked before.
> > >
> > > ry@xd2:~$ iperf3 -c 10.1.0.2
> > > Connecting to host 10.1.0.2, port 5201
> > > [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> > > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > > [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> > > [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > [ ID] Interval           Transfer     Bitrate         Retr
> > > [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> > > [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> > > iperf3: interrupt - the client has terminated
> > >
> > > I'll continue to investigate and report back with anything that I find.
> >
> > Interestingly I found this behavior to exist in the bpf-next tree independent
> > of the patch being present.
>
> Ryan,
>
> Could you please do a bisect on it? In the 12 commits after the merge
> commit below there are number of sensitive rewrites of the ring access
> functions. Maybe one of them breaks your code. When you say "packet
> forwarding no longer works", do you mean it works for a second or so,
> then no packets come through? What HW are you using?
>
> commit ce3cec27933c069d2015a81e59b93eb656fe7ee4
> Merge: 99cacdc 1d9cb1f
> Author: Alexei Starovoitov <ast@kernel.org>
> Date:   Fri Dec 20 16:00:10 2019 -0800
>
>     Merge branch 'xsk-cleanup'
>
>     Magnus Karlsson says:
>
>     ====================
>     This patch set cleans up the ring access functions of AF_XDP in hope
>     that it will now be easier to understand and maintain. I used to get a
>     headache every time I looked at this code in order to really understand it,
>     but now I do think it is a lot less painful.
>     <snip>
>
> /Magnus

I see that you have debug messages in your application. Could you
please run with those on and send me the output so I can see where it
stops. A bisect that pin-points what commit that breaks your program
plus the debug output should hopefully send us on the right path for a
fix.

Thanks: Magnus

> > I also gave the 5.5.0-rc6 branch a try (without the patch) and packets forward
> > OK.
> >
> > --
> > ~ ry
