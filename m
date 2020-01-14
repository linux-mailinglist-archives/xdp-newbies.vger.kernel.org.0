Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1820313A4BC
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2020 10:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgANJ7b (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jan 2020 04:59:31 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35736 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgANJ7b (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jan 2020 04:59:31 -0500
Received: by mail-ot1-f46.google.com with SMTP id i15so12061066oto.2
        for <xdp-newbies@vger.kernel.org>; Tue, 14 Jan 2020 01:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c0VUpfmjGtHTBDmZOly7sFUoBQqED4PyV7Y4gKT8ZGc=;
        b=EKSz5yqhra4nYA8Ohjs5a+n/kRRWrC8Zfqha5qFy2Uo8/e0sVVSApH4pYBxuzfyph9
         Qs+xBCfQmc3d3lee2vScaG5iPLwzos4zLN622WKm0QYB8SyawoXyR9Yt1oI/hsjw07WU
         /Hu7fyuVWhwvhcR9pZGLl5MOCS3aMONj3f5EOzbiHvLGmSUgNUEWiiFBe4Y27WBrwTtu
         ml6kTtQAPJfr4eAFQIaMKMUWk8yPEmZeGix1bdhNKZcW0JA9rRxJUWCzjcOW3YpwdskE
         VvzUuz/0FkIjHhBl6DrfGjMfvC17i9Bw/d8E0jzOAi8d8s/Sl76JQaLseJU2c/5t+l8J
         ChaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c0VUpfmjGtHTBDmZOly7sFUoBQqED4PyV7Y4gKT8ZGc=;
        b=mp/Z/i5Iws5ewcwmP3Xo6QfXjhFupA+LyO5UilsqrCWLiKR60ek9e8uY36zOZwXDzH
         XEUizVZyLqfzP5T5H/KGRiMqWsL+dcpBawn87xISpvHbLuN5o6jb/0K5GaSL0fW16j5D
         tOUeo5le3iHn7VmCpgxJG4Z3gjFsCtVssgVQQNlLIV6e2cTLKRiEJ/OPc8f3KEBKSCTY
         A/vQOunrhXnK7wlk+KkwcCfhdPMr9RhoSf9ueJXoo0lAHXiylLpe7ITXHeTv4WyxZMjL
         Dl98qBGejqSSQboB78whij+TVIAALF+tF1KpWoEAntkWMKDetG9y8w7CIHSrDusoSkvF
         In5w==
X-Gm-Message-State: APjAAAXsFHzv85yuD5yNWBOFUrr10eCvu5EQhQBlKOavMv2XL3UfTKZr
        FqA44CvAWFhpMZ1N8X5F7eek7ZSWXvsmGRhGurlJEFDn
X-Google-Smtp-Source: APXvYqyKuGHfWd5nw+A3iqazTr/mqsvhJdW9GGX5Y4EdV0jzxTFF8VgdwQQT5mlJ2K2khUZQRGlk01uoEExT0p/z/hU=
X-Received: by 2002:a9d:5c1:: with SMTP id 59mr16667010otd.192.1578995970257;
 Tue, 14 Jan 2020 01:59:30 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu>
In-Reply-To: <20200113151159.GB68570@smtp.ads.isi.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 14 Jan 2020 10:59:19 +0100
Message-ID: <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 4:12 PM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
> On Mon, Jan 13, 2020 at 10:16:47AM +0100, Magnus Karlsson wrote:
> > Thanks for taking XDP and AF_XDP for a sping. I will start by fixing
> > this out-of-memory issue. With your umem size, we are hitting the size
> > limit of kmalloc. I will fix this by using kvmalloc that tries to
> > allocate with vmalloc if kmalloc fails. Should hopefully make it
> > possible for you to allocate larger umems.
> >
>
> Thanks!

Just sent out a patch on the mailing list. Would be great if you could
try it out.

/Magnus

> --
> ~ ry
