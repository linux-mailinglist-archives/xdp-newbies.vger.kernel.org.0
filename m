Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFFF5561A
	for <lists+xdp-newbies@lfdr.de>; Tue, 25 Jun 2019 19:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732192AbfFYRlE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 25 Jun 2019 13:41:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36544 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732127AbfFYRlE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 25 Jun 2019 13:41:04 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so3395226ioh.3
        for <xdp-newbies@vger.kernel.org>; Tue, 25 Jun 2019 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5kXVsfh/KZxe3rwG9hDQWejesFsfHAdHBDG1fshMCQ=;
        b=XN7RLQl6lqlBcQSfWo4F8MtDInTc6o5MRIB0fqVrMjFaU0OuYlZeF/P5O2w41rHsIG
         08NhTGCSD2mZQD7MGEPwPjCk1IFj5PkHvzD1HKmieAIFi/VPrAIOxFB27JeuosTeTJYG
         rrl21UtGqQUdlBJLmA9q1vCr3khlF3npVkzwNDRbcR+PdoXUsjne5r/QpLPw/7TR48AG
         r+AmduUjwkqu1cJOm4hPLbfBFwsP/sHeLVqdLCjR6DYv701ZnxqV7je5onjLELMXQAbe
         VfYEsbKtPmKZtfDMUpUd/C/2nZ3NcMTzvC7GAZQeqd1qtfMqGYbPJ+rzaWd+K9kK8PbM
         LSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5kXVsfh/KZxe3rwG9hDQWejesFsfHAdHBDG1fshMCQ=;
        b=NY7iJqAxelP/v/+J7M+ichm5A5QWV7ntl/LOBsbBm8rReSxHjUOn15dTsCtqRS04Ug
         tCB7XnmrGqRzwtutO9AVxGBvOD+7+NWq7xbytH5Jp8HpBEfI75ErUoKauRS5sGguSXcy
         +hqUwF/jXpulZ2rINQri8licNrvA30Uj7/GpW8+sCrpLI8m5q9UvbnNs8+C8HBfVYOnp
         uJLiLBtWD6LQ+jUdY5D+49B00z2NRTkZar/xPDjSNO3mIgJjjfBrv4ZyNPd7oABX0KDQ
         LdYgzd3wA5ifREA43H8KJZPbA1/X9D2eeymX3KQU4V9XLEP4sirxV1wWs2/Y6xYVS8jC
         E+Tw==
X-Gm-Message-State: APjAAAWcpSjx0gKGc3rPcZBL+xVajhjZB0OTgZJcvrbS5m2pPeGnnaZq
        yv8EMNIZkIPDJNyUhglpKZMNzZZ+UH/2VCWFcwApQg==
X-Google-Smtp-Source: APXvYqwDnFhoU6tSjQ3Xptf+cXz6SHUzv43IdxfgvETRfPbychhdnEmRLQGvOMWBXGXSQFls8y+nhfcSEVYFhj3IlMI=
X-Received: by 2002:a6b:bf01:: with SMTP id p1mr4752096iof.181.1561484463013;
 Tue, 25 Jun 2019 10:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmn0Mge9mK14AS+y=JY-hGoXZGYo+Q-yG3VsrCXiYc9eDg@mail.gmail.com>
In-Reply-To: <CAMDScmn0Mge9mK14AS+y=JY-hGoXZGYo+Q-yG3VsrCXiYc9eDg@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Tue, 25 Jun 2019 10:40:26 -0700
Message-ID: <CAH3MdRVzmB=WJz4vvvpX34X_Yd1K3EDRXzUFzib3Jkj4wsALiQ@mail.gmail.com>
Subject: Re: Still need to inline functions?
To:     Elerion <elerion1000@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

As of today, the `__always_inline` is still required. Some work will
be needed, e.g., to merge codes between different sections, before
`__always_inline` can be removed.

On Sat, Jun 15, 2019 at 5:07 PM Elerion <elerion1000@gmail.com> wrote:
>
> What version of Linux is required so I can use functions without
> __always_inline in the xdp kernel object?
>
> I read here https://lwn.net/Articles/741773/ it was supposed to be
> allowed a long time ago.
>
> When I remove __always_inline on a medium sized function,
> bpf_load_program() will say:
>
> "jump out of range from insn 5 to 796"
>
> Is this possible to fix, or do you still need to put __always_inline
> on every function?
>
> Software versions:
>
> Ubuntu 18.04.02 LTS x64
> 4.18.0-20-generic
> 5.0.0-16-generic
>
> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
>
> LLVM (http://llvm.org/):
>   LLVM version 6.0.0
>
>   Optimized build.
>   Default target: x86_64-pc-linux-gnu
>   Host CPU: broadwell
>
> Compile flags:
>
> clang -O2 -target bpf -I/usr/include/x86_64-linux-gnu -c kern.c -o kern.o
