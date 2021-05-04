Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0613732A3
	for <lists+xdp-newbies@lfdr.de>; Wed,  5 May 2021 01:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhEDXIq (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 May 2021 19:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhEDXIq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 May 2021 19:08:46 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC3FC061574
        for <xdp-newbies@vger.kernel.org>; Tue,  4 May 2021 16:07:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id zg3so15697365ejb.8
        for <xdp-newbies@vger.kernel.org>; Tue, 04 May 2021 16:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZMx7Whbsy0orSwRidk7vLE/M7W9z1n9LEB7MPUro3Y=;
        b=CShCZQDKN7ClBXJu6o1lVDZdV2y7y+xveL57HUzCqzrAE7Une+VBHP80IovxlU3oOs
         MD0zqreTR1a1MzitM5eCdJWX9RtoNcLMgdQS4/LN06KcY5n9nX60OZQ/d8+gNAbO+8eN
         sbmOjxd7g6b0IDRVaByEJl0/PBlZFFTqvS+5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZMx7Whbsy0orSwRidk7vLE/M7W9z1n9LEB7MPUro3Y=;
        b=eANGo7sMyhcG1ZTU2GxI1RD7Z8BCPwqyTh/7SLhh86xgJU8FxABC2hctmpuh4H9Ujn
         WKVaFpnCe9cOmcC61d23zr39Z6C5XITTcW8QDZ0PRhtm8fEdxmSd/OHWXZzqVj9AxskM
         tE5z2FL9dXBEjJ+Yq7mGVK4LzRKNnmn82zbWdurDPqdBu7edwPhh9QHhAli4DrN5MLTn
         V3Yooaep1Po67mbfQPxVNrvgKAdULX6Dj2X/LGy09UliIwbeqmD4OmiT9qKGVAXUqPCs
         E4yFNY65OYM7Bo8Qgqt+BFutVocRGy2OiQfcFMtaeWXBDRC4Gnu/vX4DR2tqLYTuzPdU
         jYFA==
X-Gm-Message-State: AOAM533JctHU1ywWFev8jvBe7+4xgDzSfyoBzpvB/rczmFI6WqgjGlds
        fBi2euT2x00nr6M5RpnqqlLHJUWyyehtB4gpWmrGYw7XEclJEA==
X-Google-Smtp-Source: ABdhPJx84rwE/zL5fdn0gDd2ux2kcULQkMGERsLnszPXo+mkEuKF573nCTVqnlqSOUd2HpDrEGobSjHBGzk+d16Me/g=
X-Received: by 2002:a17:906:868b:: with SMTP id g11mr24212551ejx.15.1620169669243;
 Tue, 04 May 2021 16:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhjaBz_k255rU1jdO8Sw@mail.gmail.com>
 <CADS2XXpjasmJKP__oHsrvv3EG8n-FjB6sqHwgQfh7QgeJ8GrrQ@mail.gmail.com>
 <CAC1LvL2Q=s8pmwKAh2615fsTFEETKp96jpoLJS+75=0ztwuLFQ@mail.gmail.com> <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
In-Reply-To: <CADS2XXptoyPTBObKgp3gcRZnWzoVyZrC26tDpLWhC9YrGMSefw@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Tue, 4 May 2021 16:07:37 -0700
Message-ID: <CAC1LvL2zmO1ntKeAoUMkJSarJBgxNhnTva3Di4047MTKqo8rPA@mail.gmail.com>
Subject: Re: Dropped packets mapping IRQs for adjusted queue counts on i40e
To:     T K Sourabh <sourabhtk37@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, May 2, 2021 at 1:16 PM T K Sourabh <sourabhtk37@gmail.com> wrote:
>
> On Sat, May 1, 2021 at 11:26 PM Zvi Effron <zeffron@riotgames.com> wrote:
> >
> > I am wondering if not having the matching queues for the ingress
> > interface and egress interface on the same cores might be a
> > contributing factor?
> I haven't tested but you could give it a try to see if packet drop happens.

I have now tested matching the IRQs for queue N on both the ingress
and egress interfaces so they are on the same core. (Queue 0 for
ingress and egress are on the same core, the same for queue 1 on each,
etc, but queue 0 and queue 1 are on different cores). This did not
resolve the packet loss. I'm at a loss for what could be causing the
packet loss. It's clearly something to do with the IRQ remapping, as
all I need to do to remove the loss is comment out the write to the
smp_affinity files.

I'm suspecting it's something with how XDP_REDIRECT is implemented in
the i40e driver, but I don't know if this is a) cross driver behavior,
b) expected behavior, or c) a bug.

--Zvi
