Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B3238AFA2
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 May 2021 15:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243214AbhETNHy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 May 2021 09:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243380AbhETNHr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 May 2021 09:07:47 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881FCC05BD07
        for <xdp-newbies@vger.kernel.org>; Thu, 20 May 2021 05:50:34 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 6so11788446pgk.5
        for <xdp-newbies@vger.kernel.org>; Thu, 20 May 2021 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRGCWqINMvrt7chfS7HxhvpQP3ZFzelSK1hPMQ+Wkvw=;
        b=BWBqu4N4Eu0GWG7UcH/oyjuwwGyZThezDr+6z1eVBZc0tEEcAq+Z9QF2Bzs1kgtxxH
         qTc7h2Dblzj2jaj1WX1dPaUOuJBbrn2UHsVSDQOhqwQJ/stL44N9o0ZA82uetvMPhKqK
         hgUElZKaaiA4NOhEmboTIMAVvJe89cDkbTliVQe1I+ZMpueDHo/mTmUTeIY2xNESYla9
         8nDssHXNyKGQ2pRd00Y1V+hXrzRtA3I9gfn8mj3IileaDHd0uRYITaM/EHxS8H4CgmaC
         pKwUCwX3IEqHDj74X1BMbvMoDijTFg0VCqFJxuH/V7CCeRiHC+RulRN1r5+pRUX8splH
         fj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRGCWqINMvrt7chfS7HxhvpQP3ZFzelSK1hPMQ+Wkvw=;
        b=BJdpfV9cC3vdtJm7278W6DwWNf/WnAhJaPr1oQ5IwYf9+QJh7SwJjKjsdAj9kCo7wN
         pkNbUuJQENYotwSDZ1quL6s/7VQfw+Etov2CX/IgNhwf233frGn52MITXHmodXk7OS5A
         tQosju0H+hAcYXdGe1AqHf84kR+vo1y8dwmU0IpcO16AnbEz+mQ9A77/hjB+B35fTZ6N
         9KkexbpVzBzVc6fJWGyDy1g5lCZ6bSIXOe+sR0NxbL9zgNVbbCaDvrLtbRHwJjqAeX3c
         o2D42QfveR52H+jGokHrd5KHo9MJbDfOJeVVkSGwB9nVxpLyFu5+tyV7nshBKKtq6ZDU
         GNQQ==
X-Gm-Message-State: AOAM5321WeCUZEJM0Zq7I7AZpkVnSOcZ2thd06mvP6FbkqlFL0UKjBgz
        En8gKk67guNzCTUJqwTNt6NRDWwq3NHcUVndXkI=
X-Google-Smtp-Source: ABdhPJzNwiHigtujAPCaBt/zQAJwH1rz9SUeS1z/fSsPgNQWyh26H+WSerFbemOceaP5yOoqRzk7HmDGY4q7Z2ubZJQ=
X-Received: by 2002:a63:7056:: with SMTP id a22mr4569121pgn.292.1621515034066;
 Thu, 20 May 2021 05:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
 <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
 <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com>
 <CAJ8uoz023wsbt9mfa2V96kFgkQJiUqj-TG4etbyszWNh1u4qww@mail.gmail.com> <CAJ8uoz1=H8-vNajPaGoBYLKHAypT_DePb-G=9QzQXsQ4841eow@mail.gmail.com>
In-Reply-To: <CAJ8uoz1=H8-vNajPaGoBYLKHAypT_DePb-G=9QzQXsQ4841eow@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 20 May 2021 14:50:23 +0200
Message-ID: <CAJ8uoz1Q-a8wS0nb=iCBjrgqzNT0ww8sPbT1tgF0kbBxEhG2sw@mail.gmail.com>
Subject: Re: Umem Questions
To:     Dan Siemon <dan@coverfire.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, May 20, 2021 at 2:40 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, May 20, 2021 at 8:14 AM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Wed, May 19, 2021 at 11:09 PM Dan Siemon <dan@coverfire.com> wrote:
> > >
> > >
> > > > > 2) It looks like there is a limit of 2GB on the maximum Umem size?
> > > > > I've
> > > > > tried with and without huge pages. Is this fundamental? How hard
> > > > > would
> > > > > it be to increase this?
> > > >
> > > > This was news to me. Do you know where in the xdp_umem_reg code it
> > > > complains about this? I guess it is xsk_umem__create() that fails,
> > > > or?
> > > > The only limit I see from a basic inspection of the code is that the
> > > > number of packet buffers cannot be larger than a u32 (4G). But you
> > > > are
> > > > not close to that limit.
> > >
> > > Yes, the failure is in xsk_umem__create(). I don't know where
> > > specifically but there are a couple spots in kernel side of that which
> > > return ENOMEM which is the return value.
>
> I think I have found it.
>
> static int xdp_umem_pin_pages(struct xdp_umem *umem, unsigned long address)
> {
>   unsigned int gup_flags = FOLL_WRITE;
> long npgs;
>         int err;
>
>         umem->pgs = kcalloc(umem->npgs, sizeof(*umem->pgs),
>                             GFP_KERNEL | __GFP_NOWARN);
>         if (!umem->pgs)
>                 return -ENOMEM;
>
> This structure becomes too large to allocate with kcalloc(). It needs
> to be turned into a kvcalloc() so that it can use vmalloc instead for
> requests that are this large. Will spin a patch.
>
> Thanks: Magnus

Could you please check if this one fixes it for you?

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 56a28a686988..f01ef6bda390 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -27,7 +27,7 @@ static void xdp_umem_unpin_pages(struct xdp_umem *umem)
 {
        unpin_user_pages_dirty_lock(umem->pgs, umem->npgs, true);

-       kfree(umem->pgs);
+       kvfree(umem->pgs);
        umem->pgs = NULL;
 }

@@ -99,8 +99,7 @@ static int xdp_umem_pin_pages(struct xdp_umem *umem,
unsigned long address)
        long npgs;
        int err;

-       umem->pgs = kcalloc(umem->npgs, sizeof(*umem->pgs),
-                           GFP_KERNEL | __GFP_NOWARN);
+       umem->pgs = kvcalloc(umem->npgs, sizeof(*umem->pgs),
GFP_KERNEL | __GFP_NOWARN);
        if (!umem->pgs)
                return -ENOMEM;

@@ -123,7 +122,7 @@ static int xdp_umem_pin_pages(struct xdp_umem
*umem, unsigned long address)
 out_pin:
        xdp_umem_unpin_pages(umem);
 out_pgs:
-       kfree(umem->pgs);
+       kvfree(umem->pgs);
        umem->pgs = NULL;
        return err;
 }


> > Can you issue a "ulimit -a" on your system and share the result? Just
> > to verify that there is no per process limit that kicks in.
