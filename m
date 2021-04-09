Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8123E359BDA
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Apr 2021 12:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbhDIKVN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Apr 2021 06:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbhDIKUb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Apr 2021 06:20:31 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EF8C061760
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Apr 2021 03:20:18 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so2935569pjg.5
        for <xdp-newbies@vger.kernel.org>; Fri, 09 Apr 2021 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8AsDkUCEqmEVGHbxSk7lCqxrVFIkwmyCHD6ZOtiZXug=;
        b=Q/LKexI7OPJiHKYJ4xr1B0cgi8FPLbnftbL1ANp3aY+h1RTqyWIF7YdM+/mOvRQbp/
         99vfUSinM6z+RaAJLkANHp4JVjUcK0hgxADBj5DqWnaXcmcSKd1qPka56DyBEu4PbD5T
         MmAEAf/8NbS4sBt0D7SGad5zX1exCJ3X+TVZAAFJLd3dWT8gcIbT7Q34fA6zHCa+sqcm
         oWFmjHw4Mqm3Zcwctli5txtgqNL26PFra0VIJyQjq4wblxTQOuyH/BXU6nXTYMbvX6TD
         Qh076t486kAU9hw3z1qw3wfKrd4TuSO3tNKHpj6PtQVzqlwNpnJy15LheIp3IMTXXgs5
         Fn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AsDkUCEqmEVGHbxSk7lCqxrVFIkwmyCHD6ZOtiZXug=;
        b=i+PhqKJcCBtHl6hlzZwiFDDTXIcHQaMJGze9334YV7aXGx1Mf7+QcDS1Ng68h+acmk
         tolhvZOfP9wZx3t4kbXCq0ZEEUMFlc+ZvUYETN9y9mt56YF1fbkgegkRYjYmc4JPO7ku
         r8ZBm8pI+/GCbD6rKKaZpSPF7nrdMJAVd5XwzwGdB71/2aH4zYJeLGIkclR+/+WVOzGu
         8gvNaUmjr50emasM/932bQdtt8Z4cr3ZhFFsyqc6uxXMyqY6ffUgQir1stBGZcJo/Upl
         hRAX91t+xN7CmhvWHRl5y5Krs5GpjrlmgAFeTlxWM+bJZUx++eUNFpWCDDJIPOu2YJuT
         5Vwg==
X-Gm-Message-State: AOAM533jhbLJ0EIBmlKXnh3+ySq8w/4QvaIfHmZaaFbMeKN/CQDkvLrG
        faYPF7aYD/1sB3wvSuxWXsGgCapyMC1xNKggzuk=
X-Google-Smtp-Source: ABdhPJxPEukhCVMGvsL2e7D8hJkNw6c6uPwHVEQdYVMvgPXP3HN+tTlvP2JNQqckGBBv68UW/7gGabIgFwlh+0ipI10=
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr12491065pjj.168.1617963618086;
 Fri, 09 Apr 2021 03:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAGZFCEHR2brK5yoMZt=GsaZtg_0XB+sb-XLz_m5WjZr9xQDP3A@mail.gmail.com>
 <CAJ8uoz2Kv7aQP1BoxKET+v5k9jgSgQCK38RpNp-xCzwfEKvFRA@mail.gmail.com>
 <CAGZFCEGDtF1SfBWEbrYG9=Na+71mJ1kk5L+9W3f-UcKjYGjLCw@mail.gmail.com>
 <CAJ8uoz0O2yXoA09ZNO5iviFOv-ipgaf0ZhYD=ZUb8QG7VP5Edg@mail.gmail.com> <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
In-Reply-To: <CAGZFCEEG=r1i4PY7bT3KOTEwR1RTMeqyS31fZ+kYp_XyvaH61w@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 9 Apr 2021 12:20:07 +0200
Message-ID: <CAJ8uoz3ipXOE2VeMLh02R0FKysuovLf3vFU_z5nEOffHNps1=g@mail.gmail.com>
Subject: Re: AF_XDP and dma
To:     ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Apr 9, 2021 at 12:12 PM ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 3:37 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> > Only if you are writing your own kernel driver for a NIC. Are you doing that?
> Yes.

Then looking at user-space code will not help you :-). Take a look at
the code in driver/net/ethernet/intel/i40e/i40e_xsk.c in the Linux
kernel for an example on how to DMA map the umem.

> > > > /Magnus
