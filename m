Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D75359026
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 01:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhDHXGB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 8 Apr 2021 19:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbhDHXGA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 8 Apr 2021 19:06:00 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A65C061760
        for <xdp-newbies@vger.kernel.org>; Thu,  8 Apr 2021 16:05:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v140so6693382lfa.4
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Apr 2021 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ph7E79AK/XSgsEM0ilKW0U/DhJSw1Jq4bJ426G85m6I=;
        b=aGj03OxoVLZiDypF+k+5qZfKMWo8GM/liecwGel802HQXZj2wLobhPNg80GMre7uks
         cUjUCMvwvoCxDrnen534psAHT+gu9+z+QtdZGqbz/DJChN72YqdYFGCb6F/cXP2thpXX
         VWza3hdUUaNVi1sYYvI3ReuGIQ2FYeOUBqNvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ph7E79AK/XSgsEM0ilKW0U/DhJSw1Jq4bJ426G85m6I=;
        b=mo7sEGTBoD/dH0POSTzGJ2yEhy8Gxy9EbNxIHT8Th+dCmOC482jAOE8qzHTjkbfht/
         KWqX6cm2qzQ1JlUXlR5RFinluSs55EOU/yFZmzjHFlxUP5pTFsmjtqvh0TH5RISalq7X
         oNL+QcmCnH5yguuPzO5ZORQxW8aWFLKQj5i4UvdCC2lbEYbj10RHEu/RC0IRGacrhlBU
         Ve+vSTpCnnBgfr6KQ9DPtGqzaFVLUzl800df/Bsh4hMdiWZrR8k6HJKXVBnZxQ8tn6fu
         9zyPQBx5LEj+WqOCTaQluUt4iAHIqA0HyzKUoUhEM/Fhxy2JERcPt9g3VI/OTbw1GQWd
         O2/A==
X-Gm-Message-State: AOAM533s6HMdkG7GQr6fdo4vKdmP/wiOuyzpF7fm929D1cWKfybLXujq
        id0XyZ9ViNYd4esl2pYTZu8umP5eTF8LGyrd7iEhpg==
X-Google-Smtp-Source: ABdhPJwrYonklnGAmKm5u5npui1NUA40Qm7GdqbZFMioUhonTFyivyBedZBblHz0tCzUq86eyuyzl6lizUBfWxPftRY=
X-Received: by 2002:a05:6512:6c3:: with SMTP id u3mr6294368lff.194.1617923147100;
 Thu, 08 Apr 2021 16:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
 <8735w112yx.fsf@toke.dk> <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
 <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com>
In-Reply-To: <CAC1LvL3g-VT+uwPjv3ArQiVnDAL8ydcrAnbWgrZT-_wk4DLLVA@mail.gmail.com>
From:   Neal Shukla <nshukla@riotgames.com>
Date:   Thu, 8 Apr 2021 16:05:36 -0700
Message-ID: <CAJwr_MfPOzpdaM+MhkYVcLdQyc+XWvm=PChrRTrZXATL_X1pbw@mail.gmail.com>
Subject: Re: Profiling XDP programs for performance issues
To:     Zvi Effron <zeffron@riotgames.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Using perf, we've confirmed that the line mentioned has a 25.58% cache miss
rate.

On Thu, Apr 8, 2021 at 2:38 PM Zvi Effron <zeffron@riotgames.com> wrote:
>
> Apologies for the spam to anyone who received my first response, but
> it was accidentally sent as HTML and rejected by the mailing list.
>
> On Thu, Apr 8, 2021 at 11:20 AM Neal Shukla <nshukla@riotgames.com> wrote:
> >
> > System Info:
> > CPU: Intel(R) Xeon(R) Gold 6150 CPU @ 2.70GHz
> > Network Adapter/NIC: Intel X710
> > Driver: i40e
> > Kernel version: 5.8.15
> > OS: Fedora 33
> >
>
> Slight correction, we're actually on the 5.10.10 kernel.
>
> --Zvi
