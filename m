Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364B1359D6D
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 13:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhDILa7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 07:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233316AbhDILa4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 07:30:56 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABEAC061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 04:30:43 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t22so2279255ply.1
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8db4R0KoH8el6sbtObf4ahIG/e2OYje0S+GHhR5Uqho=;
        b=qjJ+hDVAkF3mIGzHC+xkY+ueCHTcHdOmvOxt7sqLfE3mk3um3WL5kI4PQGcCJjO7ie
         9hvTvb79cf6w5Jk4fToMpwqPsepnqJ8OU98EG8VThe7a7ysT6TH5mz05Mq2Wm0KUBHq8
         Qf+MUU5+gFyY6ElxbGWcoTBZ2fzi8Th8EmpslD1ghz8MAXQHZBP0jmjQA5Bo65wLG8Tp
         nGN6Hmt+EYShCFaqY8PlRztaXMtbVFYjUWLTwB/1Aen++O5B160q/pXLnfvS1BOHdZLM
         TM4wU60zbkaSZ3b6TOUi04Rodxm0dg/zCwxV6ycAMkOmgjHHGzcSEyLMmXZRe1sn9PBS
         wY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8db4R0KoH8el6sbtObf4ahIG/e2OYje0S+GHhR5Uqho=;
        b=n5JGxE6kUI8bvIUGeQUKwAO9PbxKejvmGZ4DTTx1izT7GEetDBN9GMs5dDcAulgAjn
         orUoJLfmz/OJFCbLLA/u5vGs6LG6cKbDvm82QM7O/r+hm2YtXNb1gjirD+v9KCsOzA3s
         EkyBbWI+dN57Y3CfmPKmMUKUKfC/gd7eDV8o6EYKUBKTIZKgQ4+KyWV+xbivoDQ/Fxkj
         6Sr2HbYNWDiqP5+22GiWBRVwjWwqCuXOyVPh4HbdvSSiYWf84FHt+S2PizbyOHNRhGpw
         gsMaGIknaA6yOahMhA9t5kXo39RXbsfG4jEugcJgyLUd/XjQV56lj5jZZCUBQQNdnGti
         J7yQ==
X-Gm-Message-State: AOAM533jylgO2N7lLDVTIWTzIm2E8Urv48NQ6RM7oTWLPpCGmg5rrrhu
        drTkE5X3S+EaH/LmTrR4FVjddAsVneFxfd5Pxm8=
X-Google-Smtp-Source: ABdhPJzZV683T//ERL88tuE9ygNV61e3yXu8V4CbMJ5UkSMRkj5GthGy7V/fHEOBQPQ8ZpxG+SSZSaVWuR0Ll/I9ky0=
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr12743858pjj.168.1617967843232;
 Fri, 09 Apr 2021 04:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
 <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com>
 <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
 <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com>
 <CAGZFCEGzm5M=pnuXrA5vXGfntX8BOtyVfVK2hmANVfAn7b79=Q@mail.gmail.com>
 <CAJ8uoz3ZoCXK6H7rrbV8oRA7TBBz9_zW=Um1+v4vNTXOWag8nw@mail.gmail.com> <CAGZFCEF5+WycmVFv9kdmRDc2s60mKa88VPLw_9+72W6DL37o1Q@mail.gmail.com>
In-Reply-To: <CAGZFCEF5+WycmVFv9kdmRDc2s60mKa88VPLw_9+72W6DL37o1Q@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 13:30:32 +0200
Message-ID: <CAJ8uoz35ZPf7y719VHoFnKdQQrV0bLHWxD4LFds9aYmWnOLdfw@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 1:23 PM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 4:36 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
>
> > In XDP/AF_XDP mode, the NIC only uses a single 4K page (on x86-64) per
> > packet so it will be physically contiguous by definition.
> How ? if userspace allocates memory, it would be only contiguous in
> virtual address space.

Physically it only has to be contiguous in a 4K page, since we are
only using a single 4K page for each packet. And a single page is
always contiguous in both virtual and physical memory by definition.
The umem is broken up into pages and these are mapped separately. The
whole umem does not have to be physically contiguous. The NIC only
cares about every single frame (and only one frame per packet is
allowed with XDP for now) being in a physically contiguous region and
that we satisfy by limiting the size of a packet to one page.

>  >Every single
> > page will be dma mapped separately and can reside anywhere.
> I agree.  My concern is not on total memory. it is about each chunk.
>
> >There is
> > no scatter-gather in XDP/AF_XDP mode.
> i agree.  i am not talking about Scatter gather (nr_frags or frag_list)
>
> > > > > > > > /Magnus
