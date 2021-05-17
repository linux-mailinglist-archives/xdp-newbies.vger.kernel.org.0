Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3323826BE
	for <lists+xdp-newbies@lfdr.de>; Mon, 17 May 2021 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhEQIXJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 17 May 2021 04:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhEQIXJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 17 May 2021 04:23:09 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4000CC061573
        for <xdp-newbies@vger.kernel.org>; Mon, 17 May 2021 01:21:52 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id a11so2709648plh.3
        for <xdp-newbies@vger.kernel.org>; Mon, 17 May 2021 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LF/5kpHuQdIXnEKS0eVbmi0/1AmzttrfhiDq/EMjbmE=;
        b=XGIZNjcYsWdsg2We5lMX/EGc07eyof0emh28xw0/6E3yWbpmNCMAEes6YJS0l//hOq
         hjPM9f+okmpL2io44T4WUSW9lrNMaTVmuv+tmStCwUy8ix+0BEFUqTnYDZfOTOlUlfqI
         hlMbUml62eiid+grNj2FshQzEw3asOeo0PAr1IRV8rDp1dXqBwCle3UCoz7q5eLAUNEM
         9Fo1J8OOEUHgV6BPH0IpIn6GLT+9wV1nQkyXOLmuc37CzO8giwhRX1s5NDWzS3fBBAJA
         G7iZIZhksWLf+5Jo+E5ZR419edVWXOrrpEn/jKJUuM3nDbZoaNw2pTOmp/XV0ddtWOwx
         7DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LF/5kpHuQdIXnEKS0eVbmi0/1AmzttrfhiDq/EMjbmE=;
        b=hMIjE+pG+RE+k883gXYClSzECZdgZ6+/fomTRV3as8eiIK95a6i1H1bxzT7+ciAtCT
         4/G/FJjIqfhP9W1SxJ0IUgUXUeIR806OYwS92s2Dek+KcMd5E/tqVKad0mScuavjolnI
         oDXFujFSvqobYfuoYmXObhWmxsmReVcprmr9kDeFS5aG3+KbTW5GgW1K/+E5WDf5/i9t
         y0Rfgsg9ihZbPncSPUjlMwFpFkOfF3PO8+kueGxTpJa68bRkRhNNvFeGnnlaYK+ziyQ5
         OySB2aviYKQfAPqzEWTOFwe+eFbucU7iaXR28ab8QQdl558yzEVGhkWYMO31vEEijbzI
         H7Pg==
X-Gm-Message-State: AOAM533gJYIZ5imbACN/9CufkMZXgoPvhLyUcIuTUGcWpcLJiIcpBkAl
        EOYx9y/TS8dP2dXMV9Ctb+TxIRo9FMZIM2A5leM=
X-Google-Smtp-Source: ABdhPJxW3QD0jaGGilXFeOGMel2jzuH17tnHNgi7F8iOSBVECUf2Be+GbXTKQd87JsSsQlyzwPtG3Kwy0MaCzaGX8es=
X-Received: by 2002:a17:90a:4497:: with SMTP id t23mr24877396pjg.168.1621239711692;
 Mon, 17 May 2021 01:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
In-Reply-To: <c276e6d316beedd47f791aed0453aa181619edaf.camel@coverfire.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 17 May 2021 10:21:40 +0200
Message-ID: <CAJ8uoz3HLFgGOMkVgKSvyiRBLSu+MoFPKUrSn0w6_s8--oVqOQ@mail.gmail.com>
Subject: Re: Umem Questions
To:     Dan Siemon <dan@coverfire.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, May 14, 2021 at 9:21 PM Dan Siemon <dan@coverfire.com> wrote:
>
> I've been trying to work with large Umem areas and have a few questions
> . I'd appreciate any help or pointers. If it makes any difference, my
> AF_XDP testing is with i40e.

These issues are driver independent, but I appreciated that you report
this. As you are very well aware of, some things are driver dependent.

> 1) I use kernel args to reserve huge pages on boot. The application
> mmap call with the huge TLB flag appears to use huge pages as I can see
> the count of used huge pages go up (/proc/meminfo). However, the number
> of pages used by the umem, as shown in ss output, looks to still be 4k
> pages. Are there plans to support huge pages in Umem? How hard would
> this be?

Something similar has been on the todo list for two years, but sadly
neither Bj=C3=B6rn nor I have had any time to pick this up and cannot see
me having the time to pick it up in the foreseeable future either.
There are at least 3 problems that would have to be addressed in this
area:

1: Using a huge page for the umem kernel mapping. As you have
allocated this using a huge page, it will be physically consecutive.
2: Making sure dma addresses are physically consecutive
3: Using a huge page for the IOMMU and its DMA mappings

#1 and #3 are hard problems, at least in my mind. I am no mm or iommu
guy, but I do not believe that there is support for this in the kernel
for use by kernel mappings. The kernel will break down huge-pages into
4K pages for its own mappings. If I am incorrect, I hope that someone
reading this will correct me. But we should do some mailing list
browsing here to see what the latest thoughts are and what has been
tried before.

As for #2, Bj=C3=B6rn had some discussions with the iommu maintainer about
this in the past [1]. There is no such interface in the iommu
subsystem today, but components such as graphics drivers use a "hack"
to make sure that this happens and if not fail. We do not have to
fail, as we can always fall back to the method we have today. Today we
have an array (dma_addr_t *dma_pages) to store all the addresses to
the 4K DMA address regions. With this new interface in place, we could
replace the array with just a single address pointing to the start of
the area, improving performance. #2 is a prerequisite for #3 too.
Christoph Hellwig submitted an interface proposal about a year ago
[1], but nobody has taken on the challenge to implement it.

[1] https://lkml.org/lkml/2020/7/8/131

> 2) It looks like there is a limit of 2GB on the maximum Umem size? I've
> tried with and without huge pages. Is this fundamental? How hard would
> it be to increase this?

This was news to me. Do you know where in the xdp_umem_reg code it
complains about this? I guess it is xsk_umem__create() that fails, or?
The only limit I see from a basic inspection of the code is that the
number of packet buffers cannot be larger than a u32 (4G). But you are
not close to that limit.

Bj=C3=B6rn, do you know where this limit stems from?

Thanks: Magnus


> For both of these, I'd like to try to help make them happen. If the
> kernel side changes are deep or large, it may be beyond me but I can
> offer lab equipment and testing.
>
> Thanks.
>
