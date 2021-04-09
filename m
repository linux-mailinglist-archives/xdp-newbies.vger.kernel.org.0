Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C13359D36
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 13:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhDILYB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 07:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbhDILYB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 07:24:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92994C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 04:23:48 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o16so6023018ljp.3
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+GFkGMieIG1s4le5Ylqv57SXCwkkISmK/Whui/hTTA=;
        b=A5jRQNnNYFAsglc6MV5tLPKLt+nmLRBwM1eZZLf5a3NjuHrvBBLOrZcptcYzBKOZTH
         3RRU2PbZcd887bNcmURKFuNtIjWxpETdGKMwpzuSqNI7Og/ghIU0RfR0hBuwzzLLphN8
         wowSowuoLX6i33lU5p8kYM/h/aH40wvb/eh0CB5fk/rr6n+ups+gkpX2KMRFdyyNI18g
         iOeqTzEBZu4VcFnLE1CLsTCI/hainkVtTFGJmiPElAO0eJfKa6KrRHPWAIYsMgyQcGTt
         cxeg2lwYMFjunF2sPxVNFqWKZcKT2LXHVk/M7S29FZNXKthZCoPsPVUDfFIBmDFl4Z/O
         Fv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+GFkGMieIG1s4le5Ylqv57SXCwkkISmK/Whui/hTTA=;
        b=CP1jQKgUcsROPOrslmp64u/5RE67+uC9OtB6a6FIzXFMioWtwkXYnoeZzdn4asBd+K
         POvJoVnOder08asNVurZsnYkcYq9e97BcCQUe1TQgMfpvMWFuz/wt1fqniv6iFYoaHb4
         GR8yMxTo4hTHU1gTeqvCR+HExCKCQUsk66xyWqXKLh/Nyoc51gJDAtvQqDKZ5RSsF9ed
         FJJZpz3d6W5JjrmDbnDiQXq4wYZWaorpkDN0pnEzzXiapcBBuEOm7o/V4w3duJFRHSNz
         P7bgl5snLZU8DkwuUkoVkrVt1c44zobJ+VPx9+OtwE1m2Vw3YFYEIo8e7kfJK+eu03aF
         64/A==
X-Gm-Message-State: AOAM533WcsX7yPZiFhRbk0YhlmyFyKG9dwWk76794do6HRkLq9h+Hyaq
        SvAaZXAHtB2f/JTa547AIXyNo6KfJKF28qQHQvs=
X-Google-Smtp-Source: ABdhPJzREzFc/IU0TXRJ8SQd03+8AmcNaAytK7nBKrzta+m7IWY7CrSmKQ37yJA/wlbZ6kZn0/CInOB31mdyvnxyk6g=
X-Received: by 2002:a2e:720c:: with SMTP id n12mr9022696ljc.67.1617967426856;
 Fri, 09 Apr 2021 04:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
 <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
 <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
 <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com>
 <CAGZFCEGzm5M=pnuXrA5vXGfntX8BOtyVfVK2hmANVfAn7b79=Q@mail.gmail.com> <CAJ8uoz3ZoCXK6H7rrbV8oRA7TBBz9_zW=Um1+v4vNTXOWag8nw@mail.gmail.com>
In-Reply-To: <CAJ8uoz3ZoCXK6H7rrbV8oRA7TBBz9_zW=Um1+v4vNTXOWag8nw@mail.gmail.com>
From:   ratheesh kannoth <ratheesh.ksz@gmail.com>
Date:   Fri, 9 Apr 2021 16:53:35 +0530
Message-ID: <CAGZFCEF5+WycmVFv9kdmRDc2s60mKa88VPLw_9+72W6DL37o1Q@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 4:36 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:

> In XDP/AF_XDP mode, the NIC only uses a single 4K page (on x86-64) per
> packet so it will be physically contiguous by definition.
How ? if userspace allocates memory, it would be only contiguous in
virtual address space.
 >Every single
> page will be dma mapped separately and can reside anywhere.
I agree.  My concern is not on total memory. it is about each chunk.

>There is
> no scatter-gather in XDP/AF_XDP mode.
i agree.  i am not talking about Scatter gather (nr_frags or frag_list)

> > > > > > > /Magnus
