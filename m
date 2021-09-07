Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F6C402E8C
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 Sep 2021 20:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhIGSwK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 Sep 2021 14:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhIGSwK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 Sep 2021 14:52:10 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647F8C061575
        for <xdp-newbies@vger.kernel.org>; Tue,  7 Sep 2021 11:51:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id e21so94048ejz.12
        for <xdp-newbies@vger.kernel.org>; Tue, 07 Sep 2021 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/yPAdrtt3l3NKXs+ZowP9mvGH0ssBcphQjq2yk+jYI=;
        b=BRlqKto2BMTcty7XlD432x8yfd1CQh6XeFWOOzcYsQWCscvtvngsGmrDPlRS+M/W+y
         araUzP5DX52VYH/B9HHuK9zKrJSsk1PpZn25gtvjJg+aZHVLy60SkG+/4V6dl0eQ19kV
         GVvu6149+sSxZ711XRB1/8wYkG/M3l1vRAQ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/yPAdrtt3l3NKXs+ZowP9mvGH0ssBcphQjq2yk+jYI=;
        b=rc7/4EmxdSGuuoGw0Mp7DT6xWxoZUtpRI87ZLQNXzW+pcL346DLDI5w1iV9wyMuE4g
         6giqFdFxN52jEdJwgWpWb+NJM7YFpUovtwLVWC6ZQV5Fl4uj7rdAXrhDVXpz8kHXG48d
         bfVWtgGLmhvcX2x+F+X5ixm5vfXbiDC2lzhy+4/d8F9m/TLLFXbPO6OUQkkf1psTzQNp
         bJc0J9J8B7JOr8YZt/gPFJkRTgYGf0g0w2Ts7HbGsDEQW7gEaOeerOG3AYRj1tDLafKt
         MXIxQpIwkh7Xw1R+CK6GeMs9SzHyO3rgJiQeT6ITWMb/O7CBGf5WghnkJX0mccMs4NZL
         QsPQ==
X-Gm-Message-State: AOAM532XiQesAoYhjBd0paHol+QMMlreeoGKW+DuHgmDRpRCIh36TC23
        12OzICFL+wDnNikGRodjiFDyo70uTl2c6mcvRqWqJVctAYfJrwCq
X-Google-Smtp-Source: ABdhPJzeaBBdLDjHaXIYdkOLTWy7+ysx+/of5oUWZQpQlfJcV/TNtjcNx1DOGNrc6z4jdLlz/lInWfU93exX1i0QBaY=
X-Received: by 2002:a17:907:924d:: with SMTP id kb13mr19925864ejb.151.1631040661950;
 Tue, 07 Sep 2021 11:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
In-Reply-To: <CAPwzzmsGdMqa9PnOQvtDOcwdByi8CzVEmLHpCmvdVfa4Rnkjeg@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Tue, 7 Sep 2021 11:50:50 -0700
Message-ID: <CAC1LvL1x4Y9BJPtLncy=uFyq-0LdjpM45a=hRtf8gGVQevD-qQ@mail.gmail.com>
Subject: Re: Linux laptop with native XDP support
To:     Jose Fernandez <me@jrfernandez.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sun, Sep 5, 2021 at 4:29 PM Jose Fernandez <me@jrfernandez.com> wrote:
>
> Hi folks,
>
> I'm looking to purchase a laptop for Linux development and was hoping
> to find one with native XDP support. I believe the i40e driver

The i40e driver is for high throughput (10+Gbps) Intel interfaces. I don't
think you're going to find a simple laptop that has a NIC that uses it. That
would normally be a very custom option for a laptop,

> supports XDP, but I'm having a hard time identifying which laptops can
> use that driver (I was first looking at Lenovo). Any advice or
> suggestions would be appreciated!

The ixgbe driver also has support for XDP, I believe. (At the very least is has
support for XDP sockets, which usually implies support for basic XDP.) I don't
know if the XDP implementation is as complete with the latest features as i40e,
but it might be a good place to start, and I believe any Intel Gigabit NIC in a
new laptop should use it.

Also, Broadcom has support for XDP (again, I'm not sure how much of the more
recent XDP functionality, though), and there are a lot of laptops that come
with Broadcom NICs.

I think the biggest thing might be to make sure the laptop has a wired ethernet
port. Wireless uses different drivers, and I don't know if any of them have XDP
support, currently. (Maybe they do, but wired is a bit more obvious, and likely
more relevant to your use cases, anyway.)

>
> - Jose
