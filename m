Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59222403266
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 Sep 2021 03:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347007AbhIHBwJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 Sep 2021 21:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347014AbhIHBwJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 Sep 2021 21:52:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89160C061575
        for <xdp-newbies@vger.kernel.org>; Tue,  7 Sep 2021 18:51:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c8so1626530lfi.3
        for <xdp-newbies@vger.kernel.org>; Tue, 07 Sep 2021 18:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrfernandez.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hBJ7PApEWotDvoF8jaU0GzgeYxsyCGzaiymsdtV6piM=;
        b=ZfpHh7egL/fASVC7FbxVkTtG5Su6P4BQuvirJJ26ISAfxqkby4JaIHJlXsWgUsHTQE
         R32MmjN5cdnKms3KzqokSvJmPNlnFyembxkczSUYX+TL23ASY8nkex+mzwroeMrY07rK
         2MWnV0h0CboJ7fMRWIgw4cJxcZ8lVruEieABs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hBJ7PApEWotDvoF8jaU0GzgeYxsyCGzaiymsdtV6piM=;
        b=jk5erR6BYFNtAzdzZCy009CEf9qxdqSOwwf4kp2iCLbm2ln5p8uDLOfk4QMColBl11
         fwLzlPYGCSmz2E+YzLYgqpp9CMZQA9B5jvAdceezXI87OOk4B4k3f+IYHpiOFJRHGnie
         MuENJRYD9mUQ55NgWL36Souk6N/2i7IQX1BLURqtV6yteva6VC7UA1N58UYlGHjd/la0
         5gWMHPC3IBSqwz4hLwTs2VLTM/yL0CzpjOG2AkNrPabg+TxFkllRFeYNnrpnU2svut5/
         UUwSAhl0dChaKTWbid8pCBZUc+b30yRlcRqsmOMOaI8wpQu0tiV5EHWE88R8wFGKZHLp
         sG/w==
X-Gm-Message-State: AOAM530wlllWLP2Juyec2dhYAYeDocGlAim+Hdp2kFR55Wz3Cf568ZnP
        3IM7EKStaXs3D1EoFIqV3ewBL9ng763ijpi+7r06JQ==
X-Google-Smtp-Source: ABdhPJzAjF9i5b4YbaUvaqPJ7ucMjG5IDLn3686u1l6s2fjuJ4K4FrM+gHpEZYDm4XKhW5JiTCBgRQvO+sLRbSsJPgU=
X-Received: by 2002:a05:6512:3e04:: with SMTP id i4mr942927lfv.163.1631065859875;
 Tue, 07 Sep 2021 18:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
 <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com> <87k0jsp5se.fsf@toke.dk>
In-Reply-To: <87k0jsp5se.fsf@toke.dk>
From:   Jose Fernandez <me@jrfernandez.com>
Date:   Tue, 7 Sep 2021 18:50:49 -0700
Message-ID: <CAPwzzmu_YGhSjQvyx23enetF_5DTdeAa49jh73CvSQoAK766ug@mail.gmail.com>
Subject: Re: Linux laptop with native XDP support
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Zvi Effron <zeffron@riotgames.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> Nope, no XDP support for WiFi. There was some exploratory discussion
> about that some years ago, but XDP has Ethernet as a pretty fundamental
> assumption so it's not an obvious fit to the Linux WiFi stack...
>
> -Toke
>

I came to the realization about that a few hours after sending this
email. I found this link useful to identity which drivers support XDP:
https://elixir.bootlin.com/linux/latest/A/ident/bpf_prog_run_xdp

I had my eyes on the latest gen "slim" Linux notebooks (Lenovo XC1,
Dell XPS), but these don't have built-in Ethernet anymore. So I'm back
to the drawing board. Thanks for the tip on ixgbe and Broadcom.

- Jose
