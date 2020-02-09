Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE711569DA
	for <lists+xdp-newbies@lfdr.de>; Sun,  9 Feb 2020 10:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgBIJ62 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 9 Feb 2020 04:58:28 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43556 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbgBIJ62 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 9 Feb 2020 04:58:28 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so3483520oth.10
        for <xdp-newbies@vger.kernel.org>; Sun, 09 Feb 2020 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Gsa+SswKqN2ZTKuSUfQ4xjnRojZ4Js8UB779P+vy+Y=;
        b=t9bo4ol+ffjVa0sAjvUb1Wf6I4KrlpHT96e1szVYrgQuW2bzB3YUDKcLAxCa0ncKli
         BkDujRWZ9TL2Z70PfObT3H6uSmx0AOa7F2aiyI4PXE+06FqpoV9zXWyohsDkz5TPaobf
         zYUQzichw5yuzsZPnU90iR/y4/z3gwDLjMT6xkOjlnI9R/TDa6rVstx7UKPSU8gYXZKm
         f8qKJs32dRrQlu33Ooxksc+8lN6tnrnZK4H41HqgkuYhtdoCBRwoLcUyqHjIMhlAnBPr
         5wcbsLJL79ubh8qHWbeKo19WDU8UhSW6HBLY+4pAneaVK7v4c0JLz1VlbFLfnlz9ViRw
         8upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Gsa+SswKqN2ZTKuSUfQ4xjnRojZ4Js8UB779P+vy+Y=;
        b=B4QlXv/ZTIayLTn90M4y7rp+6odJ4C7BnH+SJ69hREJ6wI8U407swtPeJIvPCxwTyg
         fhqT/NxU9wV/Xbi1N0ddIxqh2jcOmWjyTzbazuGNVwvF10BgdDEGgDDtlBQHyHWtCdOn
         V8rPe3yHmZCleamlE+VPzTuBORZC6NZg+k6N3qt0eCnRXPWZjJHOAl5O5/hyzrFT0eDA
         f/DLL6Qgky1CtOqjK5YpdkLhe9+SRPhCtcIwJ+dqnzNaB8rvMAqejt7kh6Bv4vtd3luo
         A2Zi7HrARlLrAlyp/Ve0cx43TE3sLbrmMQBkiTIuV78poD1znFUXcvpJxZ0dN8nqWd+S
         1f+w==
X-Gm-Message-State: APjAAAWXL+wZj6T9XzpyepplcbVvmYQZBW5qX9Ixf2P+DJ1HxA0Qbp8D
        vXfpJiNHDevAiazuAZTPKggywLVV1DGzszvwvWM=
X-Google-Smtp-Source: APXvYqxgpSbLsIZfSCCrRdCZV6paUHZU6y+N71zTc751Jp4zympuJ/N5WfRwWqntq85x5jteYNiuro2xkMhz6s+BbY8=
X-Received: by 2002:a05:6830:210d:: with SMTP id i13mr1147971otc.192.1581242306131;
 Sun, 09 Feb 2020 01:58:26 -0800 (PST)
MIME-Version: 1.0
References: <1581068272-4615-1-git-send-email-magnus.karlsson@intel.com>
 <c5d6fd11-8696-e898-6f05-5fcc087c0065@mellanox.com> <95de5e86-8930-5655-62b9-ec60b9952440@iogearbox.net>
In-Reply-To: <95de5e86-8930-5655-62b9-ec60b9952440@iogearbox.net>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Sun, 9 Feb 2020 10:58:17 +0100
Message-ID: <CAJ8uoz2Qn496NX2Q49_Ct_r4b_NjouqhM8iz+c2yp8y9=e4wSg@mail.gmail.com>
Subject: Re: [PATCH bpf] xsk: publish global consumer pointers when NAPI is finsihed
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Maxim Mikityanskiy <maximmi@mellanox.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Ryan Goodfellow <rgoodfel@isi.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Feb 7, 2020 at 10:41 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 2/7/20 1:34 PM, Maxim Mikityanskiy wrote:
> > On 2020-02-07 11:37, Magnus Karlsson wrote:
> >> The commit 4b638f13bab4 ("xsk: Eliminate the RX batch size")
> >> introduced a much more lazy way of updating the global consumer
> >> pointers from the kernel side, by only doing so when running out of
> >> entries in the fill or Tx rings (the rings consumed by the
> >> kernel). This can result in a deadlock with the user application if
> >> the kernel requires more than one entry to proceed and the application
> >> cannot put these entries in the fill ring because the kernel has not
> >> updated the global consumer pointer since the ring is not empty.
> [...]
> >
> > Acked-by: Maxim Mikityanskiy <maximmi@mellanox.com>
> >
> > Is it intentional that you didn't send it to bpf and netdev mailing lists?
>
> Yep, please resend with Maxim's ACK to bpf + netdev in Cc. Thanks!

It was intentional, but maybe confusing. In the mail just before this
patch I suggested that this patch should be part of a patch set that
we send to bpf and netdev. The purpose of sending it was for you Maxim
to ok it, and you did with your ack :-). But I will repeat the other
questions from that mail here.

Does the Mellanox driver set the need_wakeup flag on Rx when it needs
more buffers in the fill ring to form its stride and the HW Rx ring is
empty? If yes, great. If not, please submit a patch for this.

I will produce a documentation patch that clarifies that when the
need_wakeup flag is set for the fill ring, the user need to put more
packets on the fill ring and wakeup the kernel. It is already
mentioned in the documentation, but I will make it more explicit.
