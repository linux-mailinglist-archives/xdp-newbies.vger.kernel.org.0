Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BBD38AF91
	for <lists+xdp-newbies@lfdr.de>; Thu, 20 May 2021 15:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243095AbhETNF2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 20 May 2021 09:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237522AbhETNFJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 20 May 2021 09:05:09 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1552BC04FF00
        for <xdp-newbies@vger.kernel.org>; Thu, 20 May 2021 05:40:41 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d78so11387814pfd.10
        for <xdp-newbies@vger.kernel.org>; Thu, 20 May 2021 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lcr9v5TpVxMe/IhGBd/UC/GCg8a4vJ5/rMWzEZNShQg=;
        b=I58MRvbQjDBDiWFIlhpPB2U40iQCwoQ/JxLVkfQldH1ovoH04i5tKshhQd6QIGf9zr
         6iZxIXkUphQnqYdJAGuPqfb+alsv9JuCj8YK04WKBFLVNv2qs2kpzh9/UQEb5U2mYx3/
         tHHtZyJVVDHbVfxNhUYPVR/32g43rL0OT/PYGjuKU7oZbaYa0lj7xUc62x55Yf/8kBwp
         uw1cC2ast//HEIFl8wlAExIPVAFJp5I5A7/BMtqfGZ5CJPXwT1UFBQS6/N9vyPa1UHom
         EAlkbIJW2CQ7hZ8YXlFaWy/g43+dHl+IDUqlrYLGygyzyBv5K0myZiEQu0YqdlbIBO8W
         xumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lcr9v5TpVxMe/IhGBd/UC/GCg8a4vJ5/rMWzEZNShQg=;
        b=Omat3Iuszqy3rnIPBd2IvBlf5e8YuxHGPQ0EVZCtrOAG/xHFhoCjUkMyhiiuML/H6A
         UFQMWiKm1k+uHRrUGidKO5+STjS+XYtTPy5E9V7m2W4nCkcZfrYx9FCzXRZo+bYoNP8G
         qBqNcyDyUwkbvvUvKdzUgXHeEibumMRYeoDoIw4V4pAFJ1xN1n/ggBUT3J03oUkamKuj
         d5rqizGUZ/ntW3ydbs4Zqqgw2kaYporcZ6hxJLFf/UgtulTBEMu6JHHfqo0MrdgFuysw
         VQ/OFrpkfLkRgExxQ+jrn52adFuhxFmID9zxVQFjlvUGlydgAGZVAJo9sUrgXIESHOBC
         5HuQ==
X-Gm-Message-State: AOAM530nFPXuVgODiyTzIEl3PuLE6+QMiIb4lZWvUqhBUzmO6IOzHoIh
        SN8B0vrN4khEtcE52SOJudg7Q4quoefWBu7xN6ytuZIU7jZFGVeENPo=
X-Google-Smtp-Source: ABdhPJzNNV/dgZ3DDcvWPjV+Z2pHIqwqKJwOJ+U62hSLxkMWDMpVc7bgPO2mt0oQ2/VzEq+2z2YPT2v9ae9ZQ9uIEXM=
X-Received: by 2002:aa7:9a4b:0:b029:2db:2fe9:e73e with SMTP id
 x11-20020aa79a4b0000b02902db2fe9e73emr4355601pfj.73.1621514441459; Thu, 20
 May 2021 05:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
 <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
 <da5422fe0fd031212d6e422177979354207aa609.camel@coverfire.com> <CAJ8uoz023wsbt9mfa2V96kFgkQJiUqj-TG4etbyszWNh1u4qww@mail.gmail.com>
In-Reply-To: <CAJ8uoz023wsbt9mfa2V96kFgkQJiUqj-TG4etbyszWNh1u4qww@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 20 May 2021 14:40:30 +0200
Message-ID: <CAJ8uoz1=H8-vNajPaGoBYLKHAypT_DePb-G=9QzQXsQ4841eow@mail.gmail.com>
Subject: Re: Umem Questions
To:     Dan Siemon <dan@coverfire.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, May 20, 2021 at 8:14 AM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, May 19, 2021 at 11:09 PM Dan Siemon <dan@coverfire.com> wrote:
> >
> >
> > > > 2) It looks like there is a limit of 2GB on the maximum Umem size?
> > > > I've
> > > > tried with and without huge pages. Is this fundamental? How hard
> > > > would
> > > > it be to increase this?
> > >
> > > This was news to me. Do you know where in the xdp_umem_reg code it
> > > complains about this? I guess it is xsk_umem__create() that fails,
> > > or?
> > > The only limit I see from a basic inspection of the code is that the
> > > number of packet buffers cannot be larger than a u32 (4G). But you
> > > are
> > > not close to that limit.
> >
> > Yes, the failure is in xsk_umem__create(). I don't know where
> > specifically but there are a couple spots in kernel side of that which
> > return ENOMEM which is the return value.

I think I have found it.

static int xdp_umem_pin_pages(struct xdp_umem *umem, unsigned long address)
{
  unsigned int gup_flags = FOLL_WRITE;
long npgs;
        int err;

        umem->pgs = kcalloc(umem->npgs, sizeof(*umem->pgs),
                            GFP_KERNEL | __GFP_NOWARN);
        if (!umem->pgs)
                return -ENOMEM;

This structure becomes too large to allocate with kcalloc(). It needs
to be turned into a kvcalloc() so that it can use vmalloc instead for
requests that are this large. Will spin a patch.

Thanks: Magnus

> Can you issue a "ulimit -a" on your system and share the result? Just
> to verify that there is no per process limit that kicks in.
