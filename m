Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3062182F27
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Mar 2020 12:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgCLL3Y (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Mar 2020 07:29:24 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:32812 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLL3X (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Mar 2020 07:29:23 -0400
Received: by mail-qt1-f174.google.com with SMTP id d22so4014687qtn.0
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Mar 2020 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dh8SnP65lNEzCjJUNDQqfm8hPjEIxDZt1bjp69Gk+ps=;
        b=RzoWeANACJ2+8fwqO9De8RAd+lbAmrHEe60Vhi6+/0+5Fum0D/Im/inKnXTo+7zXUv
         l8OQwcYNY/pG3xqy57An7ebWA0zL9TKTNROfjZmjLGVAhNquy9SrDp+mKzjawQeuPaBq
         gp4O+3yxX0ghiy5JfT3AMKo3oVjLtkoKGVsZapO5g6KiJUGpLUtPDzhggOZqcZibtfcb
         46l6SnFlqzOmDWb4B8Itsv3hdrgC8avMdCIqDZ4hDswpMkdOOqyXClm4n6XpwmAQ0qf8
         cLREnYKo14GsaLYPorXg+eKxhCtj+JYZuizxXXCkc0JcEoATfE00uYzRGB1cG7g9UjN+
         zUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dh8SnP65lNEzCjJUNDQqfm8hPjEIxDZt1bjp69Gk+ps=;
        b=EXPCY6LTr5uRBsQz5cK74bdxFGMr2YolSSABkAx+XNojInd1ustkUuiZsLXhYtWxZx
         6GKDm3w/l+L6gT9tlVTtd+p22mK3IO6YDnJm2ZV4s6BZ2KnjPYODhQo6L3/IFr5jLfXr
         SI+YtLlpHsWm17iYiSv8kpcvereirlmpQT1LF0TU//1SqHKE5Z4V8m0dkPeCQaDajrez
         g0fCU64fSM99O8zWPPRuSHnGuesURyTxKZiqx2BE8rT7s8qZt/QuAlTJoz9kLyQ6zmxI
         yvwEBzMSUyjSacA1HQuFov8NIpNklLVetmilkJ1mHUIcreKMwG1HrTjBvmlNXwcHeABJ
         Kttw==
X-Gm-Message-State: ANhLgQ2vWYL9gW1c+1H3iOI7THKditLl09Wp+Bw7QafqsAFn1IVB5vb5
        pJHt5pfsmkQDFCh+wG7E768e+uwnYntW5XHAupk=
X-Google-Smtp-Source: ADFU+vsJQgajNjGUp1QPjxAC1nRzbJalBidoEm/iqK3KiewJpdrDlJ3KDGA4e4yMF1xPR/RXCHQqdqv+tHx0/U3g5UM=
X-Received: by 2002:ac8:1762:: with SMTP id u31mr1994387qtk.359.1584012563099;
 Thu, 12 Mar 2020 04:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <fd5e40efd5c1426cb4a5942682407ea2@hm.edu> <CAJ+HfNghFctg3L=3QdeoWyqDdj4wP4EKWjYyF01=SmCO5+=32g@mail.gmail.com>
 <a80ec2c07cb9493eafabb9decf479c60@hm.edu> <CAJ+HfNjiDCdaQm_PocHXC+gHABAO67b6H+f2pf+ZdHRu2uhMVA@mail.gmail.com>
 <69569dcbc4ce450eb5b2c1905bf11208@hm.edu> <CAJ+HfNi5sstcz20EGq2sak0RpYdBwVO5P+NLX8cALBuG_xsnHw@mail.gmail.com>
 <046ac5d67f6a447f98266eacaa2c25e5@hm.edu> <CAJ+HfNjNMhxzXTrwKjOZALO5=3UTgQz0ytyAMs5zoGB0HX29DA@mail.gmail.com>
 <87sgidon13.fsf@toke.dk>
In-Reply-To: <87sgidon13.fsf@toke.dk>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Thu, 12 Mar 2020 12:29:12 +0100
Message-ID: <CAJ+HfNgRahagXKiiUCwZMO46cPL--OxXcE3HwpbWAyph9Cjy3Q@mail.gmail.com>
Subject: Re: Shared Umem between processes
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     "Gaul, Maximilian" <maximilian.gaul@hm.edu>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 12 Mar 2020 at 12:01, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat=
.com> wrote:
>
> Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> writes:
>
> > On Thu, 12 Mar 2020 at 10:17, Gaul, Maximilian <maximilian.gaul@hm.edu>=
 wrote:
> >>
> > [...]
> >>
> >> Thank you so much Bj=C3=B6rn!
> >>
> >> just to wrap things up:
> >>
> >> - if I want to distribute packet processing from a single RX-Queue to
> >> multiple sockets I have to use shared umem because it is not possible
> >> to bind multiple af-xdp sockets onto the same RX-Queue
> >
> > Correct! And you need a tailored XDP program that spreads over the
> > shared umem sockets!
>
> Could we lift this restriction? Not with zero-copy, obviously, but if
> there's a copy involved it seems it should be possible to support
> several sockets on the same RXQ? That would make it possible to use XDP
> as a per-CPU load balancer for a single RXQ, like we can do with cpumap
> for packets hitting the stack today?
>

Yes! It's on the (never ending) TODO list. Never heard that before, right? =
:-(


Cheers,
Bj=C3=B6rn

> -Toke
>
