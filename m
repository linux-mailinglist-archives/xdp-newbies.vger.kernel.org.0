Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064161F5DE0
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgFJVul (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgFJVuk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:50:40 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62066C03E96B
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:50:39 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id r11so2226319vsj.5
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ob3e95frNUFNe7Nsw1vUYqyMp3bDMOZxQWtqkTgqhuY=;
        b=mCl8NbQSG1f+SMqZ2FLyg10/MRacIWWd5AF/J+7FqYnDNyD0P3MRI1DeWKfih7W0+7
         haTAx++//AvDMEb70MgE7NO8bX7V3oFyuE/tGXiqwbsrVOWv1KXHtZEmOZcxw+ijfBBp
         iqBtagqW2wE8y6/inXgqoUTSjk7+scVWZ5AVfQPp328VS2k2JSjgUhpfuZJy0IKnwHmK
         0S0gAaJqpMbx95q3MdwXeIMut89LeZtg7iiOVaWSij2kXgAxItsJS/84ZBs63OGnjd6k
         28PmIBBjxab2iOd9o5CM6eaWyClwjGAEz7Up/17fN0xVKa9CRJDAjhb1aDQat116KrtP
         N/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ob3e95frNUFNe7Nsw1vUYqyMp3bDMOZxQWtqkTgqhuY=;
        b=aLGnkm2lGOEli2iKBfbDO1JYvntz5vn4tRO+ljWCw0rgXIDWzsK24WfkBBldxJ/Uil
         OKCn/qZco6QWTbqXFPX27WzECknP+/z8uvlVok3sW95CCkRVp1U8/2QqIVyeQe7C8QcG
         rNA525eBbsw3m0LbZy3C1bkQxAv8LdGM1YmwE+2U/Y6q7mLG2rW005emroU4iRwS25Fw
         H9yPpvclzhDceJ5Wr9dvak/xVBg1XKCz3ZHmCDh1G7Vt0UH5c7Y5grEwKRgHFTCHGtUG
         CU6ldMFvY1DPLXyO9gCcEa084IuYgm/g/yuvf3ewo6hwrQNU8zBTjghM6ILBfC2nXXM6
         s9jQ==
X-Gm-Message-State: AOAM531+3NGtnb2g9yDXbmKl8fFPzy68W/eSM89cr38eG2k+nPB2Z3bM
        dFLgqAC5y7zsG6P0X58BXqyZG/sCUATTfiyfJYKyjBfZ
X-Google-Smtp-Source: ABdhPJyClPLasu1/PP7K1oaADh3/c3K7wqTnzuieSlZDnFJ2ZEoOeDje8Fh/9JCLcoxgSGEkVw8Ie93oKbhjB2eRSDc=
X-Received: by 2002:a67:d597:: with SMTP id m23mr4484438vsj.209.1591825838636;
 Wed, 10 Jun 2020 14:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk>
In-Reply-To: <87a71a7gay.fsf@toke.dk>
From:   Elerion <elerion1000@gmail.com>
Date:   Wed, 10 Jun 2020 14:50:27 -0700
Message-ID: <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Never mind, I fixed it by downgrading to Clang 9.

It appears to be an issue with Clang/LLVM 10+

https://github.com/cilium/ebpf/issues/43

On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Elerion <elerion1000@gmail.com> writes:
>
> > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
>
> 'vlen !=3D 0' is the error. Not sure why you hit that; what's the output
> of 'bpftool btf dump file yourprog.o' ?
>
> -Toke
>
