Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB94644D53
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Dec 2022 21:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiLFUgV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Dec 2022 15:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLFUgU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Dec 2022 15:36:20 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8151CFF2
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Dec 2022 12:36:16 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so9161702ejb.13
        for <xdp-newbies@vger.kernel.org>; Tue, 06 Dec 2022 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yl5n8wKWk8gHstzNwzkbBhfX8RGBauEonlXGHqYR2lg=;
        b=SLLjwLgr0HMgmBmyP5CQpDARslsL3Q0iTvIPJLBiNpZmTzB5yyL4w3/QsFf3+G5cdP
         wTRGgam7p5qYD7NCR1L11w+IFNwk8eR7N9AnMHuYihsVbAYd/3gTWJwlg+2XQBjNb8Sx
         UWLzCBjs6ivw68ygJcDcTohyHxpZY1cIyH2aR6x2Z3nrBZ/fEJVQEtMfNLeENaHfoC8w
         KTiVeoNFlOYlonyBCGMn4ipasXPnu8QQbZxEFYvKJiUwWgCRGa60C0LqryR8GNfhvxex
         ne/TrjjuJoF4TxqByKtEAopmOWxtaei6dkO6EY4jNr5Vyr7ymytfne2nn8PCOXMGr80c
         5SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl5n8wKWk8gHstzNwzkbBhfX8RGBauEonlXGHqYR2lg=;
        b=8QAGVBfUOn+qMa3nKKjrfCWrIqS5ujzs6k3yuqbHb+g5tyGcwjUNQ6EJRrW9OsdZ5N
         HoUEOYfipYhvTYN+8GdEnKVqwzkQ2fNpD78IgmrKbLHjAoXgrOJViMJ8ZSoqWgVuI5Cj
         +lSyWuNGiSySE+U+kqD4VUdK9JAGYX+zfs9pRYFpR4JoQz42dMg+if35EprPpcHwZUsO
         JfMk9xaLG1xRDJ+I7St3k7ebhlMlE7n1fBOpToSASwap1ajbUfmA/CIO2WKCxs6eiKrb
         PKY6O8BYLOlHCGoNX09OMTtlo6jC6xE2/tJrgYnsWrD+nEWAcUiDRil1NF01SwU0yrJi
         MBbw==
X-Gm-Message-State: ANoB5pm0nB14Smyuo3n3whcsvt90ey4WaX2YOp6CPjj+HShFzmBmbeY2
        PuYg+VuuNQprF2ouqpvFvst6H/R/jWmPMsAkI7v+fWwqqscuIw==
X-Google-Smtp-Source: AA0mqf5/i/ernAKtpP8tQqMNx2//3ldTTuX1gtb5JerBgnHqtIop+V3sxYm6PAZ0+xZEnkVzie44/ZyDv7xKLS3hWno=
X-Received: by 2002:a17:906:30c1:b0:7b7:eaa9:c1cb with SMTP id
 b1-20020a17090630c100b007b7eaa9c1cbmr3125799ejb.745.1670358975307; Tue, 06
 Dec 2022 12:36:15 -0800 (PST)
MIME-Version: 1.0
References: <CAOLRUnAmtz3yP=sD7zmDip1d79UOWeJmt96gVOUF_xvJy64T2w@mail.gmail.com>
 <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com>
In-Reply-To: <6da4a45e-07ce-7cc9-760a-9be317122eb0@gmail.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Tue, 6 Dec 2022 12:36:04 -0800
Message-ID: <CAOLRUnAfh5_MWo+1HeWSZbOeVjscMCaaW37V5b2jGh-sOvg5gA@mail.gmail.com>
Subject: Re: xdp forward issue
To:     David Ahern <dsahern@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 6, 2022 at 12:10 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 12/6/22 9:43 AM, team lnx wrote:
> > Hello,
> >
> > I am a beginner for xdp and following is the setup
> >
> > 3rd party Board - (64 bit arch):  This has 2 ethernet interfaces
> > supporting XDP (v0 and v1)
> > Host machine: Ubuntu
> >
> > step 1: 3rd party Board <-----connected over ethernet (v0) ------> Host - Ubuntu
> > step 2: echo "1" > /proc/sys/net/ipv4/ip_forward
> > step 3: Assign static ip address for v0 and v1
> > step 4: run:  xdp_fwd -D v0 v1  on 3rd party Board
> > step 5: start ping from host to v0 of 3rd party Board with expectation
> > of forwarding from v0 to v1
> >
> > Observation : In the above experiment I see xdp_fwd has a return code
> > always set to XDP_PASS and when I traced it found that below
> > conditions is the reason
> > in net/core/filter.c
> > if (res.type != RTN_UNICAST) {
> >  return BPF_FIB_LKUP_RET_NOT_FWDED;
> > }
> >
> > 1. Could you please help in understanding the reason behind this ?
>
> RTN_LOCAL means delivery to a local process -- ie., nothing to forward
> to another device / host.
>
> RTN_MULTICAST and RTN_BROADCAST: broadcast is not supported. Multicast
> ... I forget how to use that. The fib lookup and xdp_fwd test predates
> multicast support
>
>
> > 2. Once #1 is resolved, do we need to add manually arp table/neighbor
> > information as well ?
> >
>
> the xdp_fwd app is a demo. In a production deployment, you will need to
> have something manage the neighbor entries for hosts. e.g., look at `ip
> neigh ... managed` if you have a new enough kernel.
>

Thanks for the response,
Understood #2, but for #1
I have initiated ping from Host (ubuntu) -> V0 (ethernet) of 3rd party
board with intention of forwarding/redirecting to V1 on the same board

But I see XDP_PASS being returned instead of XDP_REDIRECT, anything
missing/wrong in steps ?

Thanks !
