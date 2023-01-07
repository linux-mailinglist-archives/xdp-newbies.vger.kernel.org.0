Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4126610C9
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Jan 2023 19:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjAGSZA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Jan 2023 13:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbjAGSYw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Jan 2023 13:24:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15E63F108
        for <xdp-newbies@vger.kernel.org>; Sat,  7 Jan 2023 10:24:40 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id s9so4116401wru.13
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Jan 2023 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzqG7QVy9EEFWbE9I9MIOZjsE7v48Z0bKkkpaoowGzk=;
        b=RkNfCYjUADoHjgVkxufifvpK9QWnktlte6b+rLX+lrAiA8KHPOK4XUqSno/Ewba45s
         cefWEcBFwmRFw5wjoj7JUeebmg4HdUdQJumsO6GBd0+F2fzsROKnOjxJU+fgzXoW+8eU
         vKdePfuK38uDpxPSVqRfGgGIBk/O863BZNUqAxn/nCxX0lHiDwV2Od76P1S+MDR69ZJh
         i3FjpJ7Yy3GdVw4ZsQud18thhar72I8/Rj506gId/KGvV58mdg5cudTSvqrwWDiAgQyd
         dqRoqHryHlZJFoxVaCDMmGlDyyEoZ1b8qzTEVp+WbQfOQhOlYm5ShWeLXQoEprsUbGTH
         WteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzqG7QVy9EEFWbE9I9MIOZjsE7v48Z0bKkkpaoowGzk=;
        b=XBATcYDY/yHAUNoASPgDcar70shI96XUC8PxGvGrY7G4gmkRiF9zhUN92pqEBEQaCu
         EzzSC6IPRHmyL8KCBchWESMEwaCWS0Zi1eB8e2/NOrF62+E4ywy8GtHWmSSVnetIj9b2
         GO8/qN+Wk89k7dLkLqJdcYAru621uncH8f+6P44+uM+WvopVE8vFpBn6GUNSpEF+gZGG
         4yTRNxGD+a5e0QyIdZxG+fhaeAng2UUUOMq8Tdi9QshDAufIt4uOYKFQckYKZygnDP8N
         37corye+TbUYnRV+Bf+OdGl1kKESKyyxsgs7tN8ZOjM26lFOkEAaBsODApW/6p62GBdY
         n/Kw==
X-Gm-Message-State: AFqh2krXxRRC7vDJCDth62/mpPbnM0N/ZwUsRoVeobvr7d/LrZGK0jCq
        SRRltOVgcaqiQwB6HPgmdwsPc4bK/bNv/JEGS/5/mEUe10M=
X-Google-Smtp-Source: AMrXdXv/knYalEMdL2D6OxF5dIRehwyYEXFPy6sFofmFehvwFV6cpjzmjff/F4WOWN5Wm3fBnN94wKvLIIXj/Oo9gik=
X-Received: by 2002:adf:f706:0:b0:274:bb42:e461 with SMTP id
 r6-20020adff706000000b00274bb42e461mr1119741wrp.430.1673115879458; Sat, 07
 Jan 2023 10:24:39 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk> <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
In-Reply-To: <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
From:   Dave Taht <dave.taht@gmail.com>
Date:   Sat, 7 Jan 2023 10:24:27 -0800
Message-ID: <CAA93jw5EJ7OEo9hDJNWn8nLQhO+WezDs-rf+V0mOqUZ8ExAuLQ@mail.gmail.com>
Subject: Re: Pause and unpause queue
To:     team lnx <teamlnxi8@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Jan 7, 2023 at 10:08 AM team lnx <teamlnxi8@gmail.com> wrote:
>
> sure, during xdp redirect i found that sometimes the number of packets
> arrived are too many for an interface

That is often the case.

> to handle in which case. Hence thought to experiment with tx pause to
> make room for successive packets and then unpause !

"pauses" are really not how the internet works, there needs to be end
to end signalling to "slow down", either via packet loss, or marking.
RFC970 is a good read here.

I like to think that some of the most advanced work for xdp is our
ongoing work in libreqos, which
leverages XDP for the input path, and then a complicated setup to
manage 10s of thousands of ISP bandwidth plans.

Demo here: https://payne.taht.net/ (hit bandwidth test, click on things)
Code here: https://github.com/LibreQoE/

I think it would be good for that project to attempt a simpler setup
someday merely to load balance XDP connections at some point, rather
than emulating plans.

>
> Thanks !
>
> On Fri, Jan 6, 2023 at 5:00 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
> >
> > team lnx <teamlnxi8@gmail.com> writes:
> >
> > > Hello everyone,
> > >
> > > 1. Is there a way to pause/unpause queue ?
> > > 2.  Is QoS (work in progress for XDP) ? Can we use work in progress
> > > series if  there exists any ?
> >
> > XDP has no pushback from the driver at all, nor any way to queue
> > packets. I am planning to add this, see this presentation at LPC last
> > year:
> >
> > https://lpc.events/event/16/contributions/1351/
> >
> > Could you elaborate a bit on what your use case is, specifically? :)
> >
> > -Toke
> >



--=20
This song goes out to all the folk that thought Stadia would work:
https://www.linkedin.com/posts/dtaht_the-mushroom-song-activity-69813666656=
07352320-FXtz
Dave T=C3=A4ht CEO, TekLibre, LLC
