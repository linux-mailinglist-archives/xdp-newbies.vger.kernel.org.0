Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691C244387B
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 23:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhKBWfs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 18:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhKBWfs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Nov 2021 18:35:48 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ADC061714
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Nov 2021 15:33:12 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id f8so2625153edy.4
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Nov 2021 15:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=LXd04v+y86+n6yOzhou60WK1I1DhOfn9w+OZJBcS2GM=;
        b=qHcMX6FsZI5jOtQntsygmc9tF4mMFQ3q6ktNsJDCgc7zvZLbxR3g6B0v+VBj92gzpT
         eCLE7MnCkTzUwTFmEzaha3OynaiE7MxAspgz8IkimNQd+/rV8EzklCpuCKdhzlw02ItD
         jeK/Fbk1D7qqfT8TdGElwh/NIl76YUjPiKRg/9/MnjkEEvy4B0TFdITGNEMPItJzazub
         neeN2zjCSV617ppnkCauqbKKQEWf7yCasyNmxGiE8u1+yTV0eUJDn6C7ZmYPppQ68Ds3
         KkpT0riLEY5wzd7NKybffMFNJt73GHP9/Y4Sa+NPCao31ZUlJvTDXvWX4uXknjhHoXp5
         dRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=LXd04v+y86+n6yOzhou60WK1I1DhOfn9w+OZJBcS2GM=;
        b=zWwXvkb3GJx606c6kvY4GW/49KsrIEbUSE3aoXvgCnO2k+zDNABY7mntdoVkTDEv1f
         IZ8Y+l5Rfa1jUUUGbgZQJic8B3yToAmXPBl4EAXYymfIxaKf9WPZ3eeGuQLTXPsaCRzJ
         a9OjC0hU82KObaNgzqp5s/aEIwmF1ZIgChC8dgza9RVAkSLccRkeT4xlLZTIjN0r6ePb
         L6SLk514nr2RLlEAibxUzL5PLfPPJHIsm+Yk4y18s1vho57pwnXbjfm3AVPsZDm0vFT8
         Ppzf1NzqfqhqyPZr29t9iVZUsOZcbTICgRf4p9/KqorYrL0v3OrfxIFf0jcQe0PMz3Lu
         hKpA==
X-Gm-Message-State: AOAM532G4xZiZ8cRXEgrYNyOp8pJR9frxxpNLyEXJxo/4K3hA1QMfSu+
        pp1ynbM7coFWfQZDyH6q/EHLkipxsSco/nr25731cVk491Q=
X-Google-Smtp-Source: ABdhPJxjoKjMBXZTaxGZdXb/n2Nz+EJ8ZO5R/7oswD3Xg2zGz30NxVGLsHNypa5P0MhONJLwA9Svqj16iwY1LGyWTTE=
X-Received: by 2002:a17:907:1622:: with SMTP id hb34mr50049648ejc.8.1635892391300;
 Tue, 02 Nov 2021 15:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANDGNvaJZxXJaDYQKOF0pRZD5GWQYYZytnPyOUcZtejYE39jLg@mail.gmail.com>
 <c238d2db-c962-6e6b-cf2e-2eefb8d27c66@iogearbox.net> <CANDGNva6f6vU05yu2ZDha2Y43X556ckV2R13e17k-w0Qe2btOQ@mail.gmail.com>
 <2014aa37-a491-459e-329a-3e0502aa5bb9@iogearbox.net>
In-Reply-To: <2014aa37-a491-459e-329a-3e0502aa5bb9@iogearbox.net>
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Tue, 2 Nov 2021 17:33:00 -0500
Message-ID: <CANDGNva-tvC_D1qnJFaUSaqU_u4iRwEs1AYTGHg+-C3jKkkdGw@mail.gmail.com>
Subject: Re: TC bpf_csum_diff problems post-5.6 kernel
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     xdp-newbies@vger.kernel.org, lmb@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks for the context!

I write back to the packet directly (I chain all the checksum updates
through a series of bpf_csum_diff() calls and then write back the
ultimate value).

Since we have a mixed fleet right now, I'm guessing I'm going to need
multiple versions of the TC BPF .o binary, since it looks like
bpf_skb_net_shrink() EINVAL's on 5.6 with that
BPF_F_ADJ_ROOM_NO_CSUM_RESET flag.

A small price to pay! Again: many thanks for this; this group is really great.

On Tue, Nov 2, 2021 at 5:28 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> For the update, did you use bpf_csum_update() helper or directly writing into
> the pkt?

---
Thomas H. Ptacek
