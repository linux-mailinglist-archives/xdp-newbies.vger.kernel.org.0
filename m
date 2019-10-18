Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D44DC442
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Oct 2019 13:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392590AbfJRL7o (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Oct 2019 07:59:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44173 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392487AbfJRL7n (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Oct 2019 07:59:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so4692197otj.11
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Oct 2019 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDbRuZGr+40SBpbRty0Pgj1upMwxHtErrKB2TYnsQIc=;
        b=VecnXOuQfgBZb1frtT88yUBCu4UjjRgS+CEWLKHHWp1+/A0nPvvhWxdwHhLqLEWZlX
         njwTln2tYW1pn/5f0xB2m9QIw+onP4JIL8Xc1wYfqAQMFkoGyccDUEknXzKGxhTo0mu2
         jv80gNLJfEnchIK7LeJYJKZm+fTC2uepdSK2lIv9PFzUKWlk0g7zIINcnHGgVJNB4VDq
         HyXOVzzd78wDWoscyaSAUCtOY7rWR8Vn/rS8Kny7g/bBnAeDI6UZrI3A9rVbUIDFvPO3
         KmiptD+8gS04llrhwaKZHv0t4xNl/Za48iOaHzPMEvAjRC073J+K4x2BRQsTiIETWgB/
         skyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDbRuZGr+40SBpbRty0Pgj1upMwxHtErrKB2TYnsQIc=;
        b=QUuPaNnq4KPglyGbo5gY7hhPbKXrg6+JVG2ABxjTqBSO1HVpcD/hWRhDHj+u1emX3t
         MrmOTIMdtG4ynrSTIXQ4LHYGbdrT3H9GJgZvI3PHTIHhxYiM2c9yDZsZI8WiwTrf6QZD
         PMX3KuHD2SrViD+TEwqGebKYz2ptmxRFR6Y/UlJJaCBAiBESrinI1Y0ZmMfQVf1EeR9Q
         q4Qu3MzzU4JSJWb52VcdPZWPxo37sWqSu5466e41EZGAt54gkqMwnjYgmRvqt1HCLJYE
         uVDIDavrzFUeeqPeBI1r5C5HkLpC1AAQsM4kZ67jw7lkjKKmblTFqfPfsCRed91FE58J
         fUDQ==
X-Gm-Message-State: APjAAAX8lh84VHxfiUyFfysrTfWZuor3swKGYKMulT/fiN87ZieI6/0Y
        wCEWGF+w4WAycHuiER/0kHuqnNs8whQ8bYbT3B7oBsRfOUg=
X-Google-Smtp-Source: APXvYqzaH+WmLuRD+jkI2/6Mb+dqOyKhqknqCHmyGVpwUD6yKI0nHQhBK7hLkbvg01PixDQFEQpUsq3gDJ5riEDBJOA=
X-Received: by 2002:a9d:1d2:: with SMTP id e76mr7705919ote.30.1571399982998;
 Fri, 18 Oct 2019 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
 <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com> <CAJ8uoz2HYH3rWLX2zEOgZRyLioO7+JmXpH8wW6DFfi=VjTvCoA@mail.gmail.com>
In-Reply-To: <CAJ8uoz2HYH3rWLX2zEOgZRyLioO7+JmXpH8wW6DFfi=VjTvCoA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 18 Oct 2019 13:59:31 +0200
Message-ID: <CAJ8uoz1T_xs3+wuLQOB3vAeui4coxd0Etqto2ZUCEjONTo9X+A@mail.gmail.com>
Subject: Re: i40e: Kernel freezes with XDP_ZEROCOPY
To:     Kal Cutter Conley <kal.conley@dectris.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I have managed to reproduce and root cause it. Will produce a patch.
Thanks for finding this issue.

/Magnus

On Fri, Oct 18, 2019 at 1:23 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> Thanks Kal. Will take a look at it and get back.
>
> /Magnus
>
> On Fri, Oct 18, 2019 at 12:18 PM Kal Cutter Conley
> <kal.conley@dectris.com> wrote:
> >
> > Hello,
> > I have managed to extract a reproducer that crashes the kernel. We
> > observe the crash with all drivers that support XDP zerocopy (i40e,
> > ixgbe, mlx5_core). The program source is attached (C++). Compile with
> > a newer clang++ or g++ using flag -std=c++17. It must also be linked
> > with libbpf. Use libbpf v0.0.5 and make sure to revert
> > 5771dacd3dc2fdd041c51242819a9f212e04af55.
> >
> > The crash is a kernel NULL pointer dereference in xsk_umem_consume_tx.
> >
> > Hopefully this is useful,
> > Kal
> >
> > On Wed, Aug 7, 2019 at 10:48 PM Kal Cutter Conley
> > <kal.conley@dectris.com> wrote:
> > >
> > > Hello,
> > > I am trying to get AF_XDP working with the i40e driver (Ethernet
> > > Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
> > > kernel (machine) freezes hard. I have reproduced this on varying
> > > kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
> > > also, but at a later stage. I tried replacing my XDP program with a
> > > trivial one that simply returns XDP_PASS but it didn't help. On the
> > > same system, the xdpsock sample does appear to work with the -z flag,
> > > however. Are there any current known issues that could be causing
> > > this? I will try to extract a minimal example that exercises the
> > > freeze.
> > >
> > > Thanks,
> > > Kal
