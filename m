Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A2334A299
	for <lists+xdp-newbies@lfdr.de>; Fri, 26 Mar 2021 08:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhCZHh4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 26 Mar 2021 03:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhCZHhq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 26 Mar 2021 03:37:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA57C0613B0
        for <xdp-newbies@vger.kernel.org>; Fri, 26 Mar 2021 00:37:45 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso1319861pjh.2
        for <xdp-newbies@vger.kernel.org>; Fri, 26 Mar 2021 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhT8sVIgNhepoeDx6NrFympH82S3SYQTGpfjTyASnHs=;
        b=lBKkcfgSSgjGuyyHkaVMaJOJZd5wiMSIVBab23d9WUd5MD67GUJKek7ia4T/zEOO/P
         F03rp0USfSP5h78VzYaETdS6ZX5vkg/rgfrWJZfNyl6TYDPzoqTydyjF1NJCKnbjdlTu
         PT310HbYyonFvjkq5udhKGqmpd49F63kpw6tygDoYRU+lY72zbokyJ9gUPKDt8+A6DR1
         AQ4WKCtEVCfm3BlPQg2CqY/PRAAmCc4HQtLVeAvWZAcC4T3yk0OPfR6NprQ4WwDAeuT3
         TYgF4TIznP+rnXg8abjBW+FomSPnZpE0CO41G/ntRO4r0l2PlZOo5WerM6rdLClVuXF+
         F5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhT8sVIgNhepoeDx6NrFympH82S3SYQTGpfjTyASnHs=;
        b=J729APKAb0cARQCcN6y9maa4TbKZKxBxO21Rd73xz7E/GrAPQINbGCMMtTSh9W1yG9
         02MHtQacmMBh1xJmZ/iv7yAq3mdym8yhUCuY/VBKMChwLmTpRA8vYgSUAq1h0yLAm5ZJ
         gsqlzW4SiJAb6P2OAh14wjVGu7MQ2e5CViLMZO9lVOkz8GeF6d8+6QvCJAi0IL2Zdfwz
         GEwk2Ovhh+hlf2XWvG35WuFqlRtVRUzaKIb5GNR3NVODABSVEqpmCBtu1x14Py65OeDs
         OStHZXzyLN8PMipSqvxWb5NzZym0t2K5dgvVFrHKUsU0jFrIueZEiglkIPe5VGsm7Tyh
         MJuw==
X-Gm-Message-State: AOAM531j496yY1a/mi8v6HXWEKeDXvM5SF4gd7B+mU+BzYN3sO8LgsRJ
        fKkIPD/C9hjy+vu3j1p9a8yFJ3O6kChSTvXFmx+mKD6jqHU2hQ==
X-Google-Smtp-Source: ABdhPJwvOo7fOuNLJB56RETUzXdXiRKx2/oqydbs0vLEXych51RjPf4x3rD+893PNLGH2sgBqJu5qvxeYvg4XtXyPH8=
X-Received: by 2002:a17:90b:e01:: with SMTP id ge1mr12875876pjb.117.1616744265299;
 Fri, 26 Mar 2021 00:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <35a931df0e2cb4bf1fd23ecc15895419c7ca0e3c.camel@coverfire.com>
 <CAJ8uoz3n=R2KZagznZ9XK+tVwdpMoeqY8CqJxyqh1B508bqntw@mail.gmail.com> <eb19b630c087ba6497f2a0a627c232d45a5af22f.camel@coverfire.com>
In-Reply-To: <eb19b630c087ba6497f2a0a627c232d45a5af22f.camel@coverfire.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 26 Mar 2021 08:37:34 +0100
Message-ID: <CAJ8uoz1OTAW36rM4An1ZtO4M_0HTGjps5FKWfYwAuTGCQoHVmg@mail.gmail.com>
Subject: Re: AF_XDP (i40e) behavior change in 5.11?
To:     Dan Siemon <dan@coverfire.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Mar 25, 2021 at 11:17 PM Dan Siemon <dan@coverfire.com> wrote:
>
> On Wed, 2021-03-24 at 11:00 +0100, Magnus Karlsson wrote:
> > On Wed, Mar 24, 2021 at 10:22 AM Dan Siemon <dan@coverfire.com>
> > wrote:
> > >
> > > ./xsk_fwd -i ens1f0 -q 2 -i ens1f1 -q 2 -c 5 -i ens1f0 -q 3 -i
> > > ens1f1 -
> > > q 3 -c 6
> > >
> > > On 5.10, the cores (2,3) assigned interrupts for the queues (2,3)
> > > are
> > > idle when there is no traffic.
> > >
> > > On 5.11, the cores immediately go to 100% system time when the
> > > program
> > > starts (as viewed in htop). There is no network traffic.
> > >
> > > Intel 710/i40e.
> > >
> > > I tried this with xsk_fwd built from 5.10 and 5.11 trees with the
> > > same
> > > result.
> > >
> > > Is this behavior change expected?
> >
> > Thanks for reporting this. No, this is not intentional. I did send up
> > a fix for a bug in the i40e driver that was introduced in 5.11. It
> > might be the culprit. Could you please try the patch below and see if
> > it works? It is not yet in net.
> >
> > https://www.spinics.net/lists/netdev/msg729128.htm
>
> Hi Magnus,
>
> It appears (quick testing) that the patch fixes the problem.

Perfect! I will send a mail and try to get it through the internal
testing as soon as possible so we can get it up on the list and
merged.

Thank you: Magnus

> Thanks.
>
