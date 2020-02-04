Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F045B151D78
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 16:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgBDPln (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 10:41:43 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:39414 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBDPln (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 Feb 2020 10:41:43 -0500
Received: by mail-qk1-f180.google.com with SMTP id w15so18334868qkf.6
        for <xdp-newbies@vger.kernel.org>; Tue, 04 Feb 2020 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZQHkTRk2uBXMhrZyClffkQvDe/bV2pTdvDlROVpDyuQ=;
        b=UPj9GrZWLO7q27bwDK5+ySLRp8YPgprFLkUJtSYrcrwTkGGI+1DOCpvKFMKQvIsYbL
         IzdQOD1oi0bt6V3MFMrHMrubCe+ukwoGZGCpALG9veZJSvbxUq1bahWd7KSv4Q3GJL0p
         5hYigKPyPxJYO+XnyDOemErrjV0PTTrOJZQAVdu5yiABdlxii7Z+sxn8Ovfur4hTGwZx
         yqZ1ASFvwZRsLKmGU8bWGr9bE1KG5x3XGb0e+bH1QjUtEXVO6oCJb0Hvxt79uAdhuW0J
         yMWDthK/votV5jmkPtfV/FFrkaqi4jJYuBkGqql8bjoI4qdYEsbbppkvjtZHmMlf0LQs
         i6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZQHkTRk2uBXMhrZyClffkQvDe/bV2pTdvDlROVpDyuQ=;
        b=GOjGiYBjDdnktD799d6X7HOYgTBr1i5Pxsk4hzGbRd4+AkukKUL4jeZGpwwByXUfNI
         d8W0YGfCQXiN87iR1hc3jgJmmTnpLtZV2k1nyekJS7BbM5nDXk/YbYzWs1rZr0G3tloJ
         QzDlsfjxz1Jl7TjKUbfjyoxTxz6JhZ5uzxEgHQNM2EK8K2J5xdtPNtN1b2lfz2w3AFDR
         43DE5/CNy9o96N7d4UW04w9bNJ2o04LsVNXbA0HLAQtUAPBtX+KjfNWDwbQSEjDyJy0P
         t19HVzkmG9KFk3TAdmy+ji+oqXXBuRInIK/YQ+9h1Bqnd/TQ1CnwEbAiBEOWXNaI4Adx
         hraQ==
X-Gm-Message-State: APjAAAX7HzUgNT/h1N7OEYeB4HyWDGSlwHujbmu/ob9wtM5tB9A5DNOU
        NZb+rLUzi2l/mj3T2+siiE0WORNOScDUheZ7zII=
X-Google-Smtp-Source: APXvYqwizT6G0E2dAV96MYfx17S61wkjESzMjwDRMGGVKMV/1UKZtZLdtfMoj8QZ3X698nDDnY1lw8nAJTiBrfA2D0Q=
X-Received: by 2002:ae9:e10a:: with SMTP id g10mr8305902qkm.493.1580830902469;
 Tue, 04 Feb 2020 07:41:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMyc9bVixUDEJ-WHLJaCCTF3iV4pFF2j+RPM0hM1XOKh6S2yBw@mail.gmail.com>
 <CAJ8uoz0btU4L80d2DHv+=ivL3RJmunnAsmetL=2zBo_2xfpgAA@mail.gmail.com>
 <20200203031104.GA19512@ranger.igk.intel.com> <afcf4030-aee3-7e9c-a57f-c5458c285b74@mellanox.com>
 <20200204065000.GA44903@ranger.igk.intel.com>
In-Reply-To: <20200204065000.GA44903@ranger.igk.intel.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date:   Tue, 4 Feb 2020 16:41:31 +0100
Message-ID: <CAJ+HfNj0+o3A9TM+K=Eiqrj_wwSOsnPw2f00u_P-sX_-ckp5=g@mail.gmail.com>
Subject: Re: Cannot run multiple 'xdpsock' concurrently?
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     Maxim Mikityanskiy <maximmi@mellanox.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, 4 Feb 2020 at 14:58, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Mon, Feb 03, 2020 at 01:49:11PM +0200, Maxim Mikityanskiy wrote:
[...]
> > Right, we shouldn't drop this check, at least it's needed to sync on
> > xsk_wakeup when closing a socket. I think there are two issues here, an=
d I
> > suggest this way of solving them:
> >
> > 1. __I40E_CONFIG_BUSY is set while a single QP is being recreated, e.g.=
,
> > when opening/closing an XSK. I considered it as a flag for global
> > configuration changes, but apparently it's also needed when a single XS=
K is
> > being configured. Probably xsk_wakeup shouldn't return ENETDOWN when th=
is
> > flag is set, but something lighter like EAGAIN. xdpsock will need to re=
peat
> > the syscall instead of bailing out.
> >
> Haven't yet checked the l2fwd case since I broke my hw setup, but do we
> really need the syscall repetition? For tx only scenario skipping the
> syscall would mean that we wouldn't post entries to completion queue and
> in case tx ring gets full we would call complete_tx_only() again. So ther=
e
> we have syscall being repeated?
>

I sort of like EAGAIN, as Max suggested, is better. Kind of nice for a
user to know that "hey, for some reason the driver couldn't service
you ATM, please try again".

> > 2. Should xdpsock stop on ENETDOWN? Normal network sockets don't close =
as
> > soon as the carrier is lost, so why should xdpsock fail on ENETDOWN? IM=
O,
> > xdpsock should handle it more gracefully (wait with some timeout?).
> >
> > Does it sound like the right direction?
>
> It does! :) But in general I would allow ENETDOWN to the set of errnos
> checked in kick_tx(). Not sure about repeating syscall though.
>

The fact that xdpsock die() on errors are a bit harsh, can't argue
there. So, I'm all in for simplifying the sample error checking for
kick_tx().


Bj=C3=B6rn
