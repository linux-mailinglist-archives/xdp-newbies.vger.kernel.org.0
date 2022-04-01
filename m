Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCF64EEB61
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Apr 2022 12:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343994AbiDAKfy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 1 Apr 2022 06:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343913AbiDAKfx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 1 Apr 2022 06:35:53 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5ED62BF4
        for <xdp-newbies@vger.kernel.org>; Fri,  1 Apr 2022 03:34:03 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id x20so4238225ybi.5
        for <xdp-newbies@vger.kernel.org>; Fri, 01 Apr 2022 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=2FcAIlW13R1YTzIyu+sdN96SIVl/qcLwKZtb0a07o7k=;
        b=oCtadiGx/H9gubsbvA9ZFuNOoCSKnojj4DThxppyKLhvUCF32c+f3Ni40cdMdWXw8m
         Yv42JWRUTNY7j9NXx22rQ7pVxnV75BUc9jSv1DCsEuG3LPi7IMQ1TFW+Ryw11sMD5DVS
         3ZN3RIUNvyNkmjd3jemitnfJGrwgbTbtHNqvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=2FcAIlW13R1YTzIyu+sdN96SIVl/qcLwKZtb0a07o7k=;
        b=2UZ0bd7S4GAy1TwQIO/mKb47HQtOKs87RhB4cCliKt7F/Gko7XZa/p583KFMWb9+c2
         o1+NVX8330nJkP66ZcFGBpBSnOBcFu0G6ACxdFjb6UFK7W1h/Q3KMM8hlP8kHtMMRS0h
         QNjrD/hTMW/9Mt+ubcdjaN8f4iFDf0wqHE6m6AvxzMi2Mmhs2dXUqcbkbClY7KZQEP3X
         CtqSGHIGSGwuaVAai7PQ7nCNjeM9cgUn6+ykN/At9Vg1FBYjnvMaRsq5ALUN7rGp7nb4
         wkT0zgikOygwRjUfP/Y/UdEMURoncz7V/rx70maQgpA0J7VteP12CCxwn8Wzjs3EZeF7
         1tgg==
X-Gm-Message-State: AOAM5328Sz6KIsnUbRwppSF/i8CPKgnj0M3PpqWyzNvpe1xXXfozsLFR
        9f+j6we5WLC5JhDMmYaKUd49xaGdJA6Cs1ExIjKaoUGVkmrjKO30
X-Google-Smtp-Source: ABdhPJyq7/n8FwbbTcvd9PyKsOcVRzVUuCMiRFlQkFyBbiAN2UtjKnSk0FKQUGC/99ZUhbqJlwL0qzlaDLrZxhBH0/0=
X-Received: by 2002:a5b:28a:0:b0:63d:4556:1c05 with SMTP id
 x10-20020a5b028a000000b0063d45561c05mr5175686ybl.177.1648809242427; Fri, 01
 Apr 2022 03:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
In-Reply-To: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 1 Apr 2022 12:33:51 +0200
Message-ID: <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
Subject: Re: XDP multi-buffer and AF_XDP
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

>
> Hi,
> We are very interested in receiving jumbo frames (> 8000 bytes) over
> AF_XDP. Does XDP multi-buffer support XDP_REDIRECT with AF_XDP? What
> about in zero-copy mode?
>
> Cheers,
> Kal

Looking into this more I found this comment in the mlx5 driver:

/* Don't enable multi buffer on XDP_REDIRECT SQ, as it's not yet
* supported by upstream, and there is no defined trigger to allow
* transmitting redirected multi-buffer frames.
*/

So at least mlx5 does not yet support XDP multi-buffer with
XDP_REDIRECT. What "upstream" support is required to get XDP_REDIRECT
to work with XSKs?

Kal
