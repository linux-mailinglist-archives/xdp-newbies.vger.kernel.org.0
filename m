Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26D6DC75E
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Oct 2019 16:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408649AbfJRObB (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Oct 2019 10:31:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46735 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbfJRObA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Oct 2019 10:31:00 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so6481574wrv.13
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Oct 2019 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBcxTpUfmURwMQKuhT2RymSDM/gT5yWZDmhOZi0/Y9k=;
        b=W/605dxJy+xavxccTrAVm0XAKtMhpWaVWrS1vzphyTy50d0UYfxwm2T420Y62x4eTb
         65xP6e/Dmou4L8LhHqf4yZ996BSPR394s4BGq2V/1mO+WTuOCFfdW0mJNvhqI7eQDER4
         odWXK6FTCu3fVwcAn1IdH8Sc43U0K5jQoM61A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBcxTpUfmURwMQKuhT2RymSDM/gT5yWZDmhOZi0/Y9k=;
        b=FHgzAoUIaz0vNyUEs09XNFRQ1No5vqtGUl4WEEYu3vS6Lm+zuuPpvy8HhJAwhHtz67
         SFllunWiuemaSCFALpLT7tMqzzy7sLXd9VN/tCEbJsmoFQw1NfTxoP893S0+wWi/MOwe
         DAdqQjGdZUQE9jbKM9e3x9fF1qw0HwBzjWF+9vaCKPk77OpC1CCkcnBXXyKPB2jw02Ic
         Yo4ertSN2klvIrPPfXDABDH92aj+lkzYVS55ZP4K2kNaa3Ne7AcEMpRcikOGoJ4Rf6xR
         NpGraCD2q04iac7tbIoPoIuOUeSsYkQbotWsu4WgAH1708OmaUKVJVqcyDYArBuQJWvY
         mGpA==
X-Gm-Message-State: APjAAAVSJm3c80Id8lD5mEOJqLnIOrNNkHPKuwtKvdg4Lkg4hFhik9/8
        C/OG3Kn5+61Bsxta7KXG+bZolnVLC0mFGWOBgRTXwQ==
X-Google-Smtp-Source: APXvYqxBKJokibzOKosA8FM4+KiRWhZqeGtSILDYJuY3xwPzVmO9r8ZIXT6paxFUdHcaulephdYzEfBT6XlosDLmohc=
X-Received: by 2002:adf:8123:: with SMTP id 32mr8522531wrm.300.1571409057978;
 Fri, 18 Oct 2019 07:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
 <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com>
 <CAJ8uoz2HYH3rWLX2zEOgZRyLioO7+JmXpH8wW6DFfi=VjTvCoA@mail.gmail.com> <CAJ8uoz1T_xs3+wuLQOB3vAeui4coxd0Etqto2ZUCEjONTo9X+A@mail.gmail.com>
In-Reply-To: <CAJ8uoz1T_xs3+wuLQOB3vAeui4coxd0Etqto2ZUCEjONTo9X+A@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 18 Oct 2019 16:30:46 +0200
Message-ID: <CAHApi-np0-yod95YrdWnVOnKyBRndKpsdn8CagGSfmiLF1RPJw@mail.gmail.com>
Subject: Re: i40e: Kernel freezes with XDP_ZEROCOPY
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Magnus,
Excellent! Thanks for looking into this. Can you send a link to your
patch when it's ready?

/Kal


On Fri, Oct 18, 2019 at 1:59 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> I have managed to reproduce and root cause it. Will produce a patch.
> Thanks for finding this issue.
>
> /Magnus
>
> On Fri, Oct 18, 2019 at 1:23 PM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > Thanks Kal. Will take a look at it and get back.
> >
> > /Magnus
> >
> > On Fri, Oct 18, 2019 at 12:18 PM Kal Cutter Conley
> > <kal.conley@dectris.com> wrote:
> > >
> > > Hello,
> > > I have managed to extract a reproducer that crashes the kernel. We
> > > observe the crash with all drivers that support XDP zerocopy (i40e,
> > > ixgbe, mlx5_core). The program source is attached (C++). Compile with
> > > a newer clang++ or g++ using flag -std=c++17. It must also be linked
> > > with libbpf. Use libbpf v0.0.5 and make sure to revert
> > > 5771dacd3dc2fdd041c51242819a9f212e04af55.
> > >
> > > The crash is a kernel NULL pointer dereference in xsk_umem_consume_tx.
> > >
> > > Hopefully this is useful,
> > > Kal
> > >
> > > On Wed, Aug 7, 2019 at 10:48 PM Kal Cutter Conley
> > > <kal.conley@dectris.com> wrote:
> > > >
> > > > Hello,
> > > > I am trying to get AF_XDP working with the i40e driver (Ethernet
> > > > Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
> > > > kernel (machine) freezes hard. I have reproduced this on varying
> > > > kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
> > > > also, but at a later stage. I tried replacing my XDP program with a
> > > > trivial one that simply returns XDP_PASS but it didn't help. On the
> > > > same system, the xdpsock sample does appear to work with the -z flag,
> > > > however. Are there any current known issues that could be causing
> > > > this? I will try to extract a minimal example that exercises the
> > > > freeze.
> > > >
> > > > Thanks,
> > > > Kal
