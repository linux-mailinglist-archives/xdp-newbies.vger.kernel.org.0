Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCDF4729F
	for <lists+xdp-newbies@lfdr.de>; Sun, 16 Jun 2019 02:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfFPAHZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 15 Jun 2019 20:07:25 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40309 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfFPAHZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 15 Jun 2019 20:07:25 -0400
Received: by mail-vs1-f66.google.com with SMTP id a186so4018220vsd.7
        for <xdp-newbies@vger.kernel.org>; Sat, 15 Jun 2019 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wW7IztE4QMEWHS4HlHmRfNrBnf+ofJKoJQgV50/G/K8=;
        b=JukhM8WhPZ/UTP1Tz21D1TvljFtD0pNKrBZf1CS6NqdP+RKqFXtp8mRUlVvou4C6ul
         kuhsJJFL7O/ybR/gP5tUg1v2Ny9kgp2+KHYSJ4cYcIECJdBk7Ct3jIT8ZRMygYWd+2vt
         rFvCmLJ/2vESs3CRrdrGncCfkcTF+HRGKYYRXQVEMMJdjHPYqtj77v4mA4+6MOPClTaQ
         uZYn+ZDnrZGwkqnW/0fP0oRlkQs4E4i7ngREfieSuJNl9WYp6VKzaUI/Ut6qA4x3IyKc
         KW7BDsXRfTPNFeGqkO6asl1pRc32B+AmczeGMGo5ECsTGRPIbafPnRa885teWPx9pj7H
         7EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wW7IztE4QMEWHS4HlHmRfNrBnf+ofJKoJQgV50/G/K8=;
        b=bXihjYjakfdJ9v9WzkrtUf3NFQfXR4lVWlNOK2f7Cl84R4PnLDvkFkrFYFBWy8X3QW
         ZDxDXd7EgqJY2fhak+w6hzPKaCycd9i6PhFlN4mBImLgq0lhjkmrL7K3snH77CGEydpf
         XpB4nFZigYEF+Oh5pDdFioms6UUVJ1suWgXW8ovdWNchojJZFH6bEObnJPvnbfC5mkru
         XTwiDLAN53urbsZW1vIKhCTPSgxZJgyvUAFG4Kwc10Xp/YOsan+i0aCGapD6xe5orl6c
         E3ZtZ7tA316rMIs8KYp4KW/2Z6q0gCGmZxYFbwBeFGf4lsMK6UXjybw8bqZa5myNwo9s
         PUOA==
X-Gm-Message-State: APjAAAVk6blxlLK7BxvsOmokF4X1x2PudsOA9xEyc2mgfg2ZIRhzVJQZ
        qrqfYOzbqKIn6/sqaFljgHpQb13Vs6e4eS2TNP82plUN
X-Google-Smtp-Source: APXvYqwgpdHD0lUybhAqYSrKebXBusJL0hMJIBh0UrjvA4JP5t7+HftrQCLjH9aOK2kF0UFlgokrRGpu6PGk5YEIzs8=
X-Received: by 2002:a67:1a81:: with SMTP id a123mr24571522vsa.162.1560643644098;
 Sat, 15 Jun 2019 17:07:24 -0700 (PDT)
MIME-Version: 1.0
From:   Elerion <elerion1000@gmail.com>
Date:   Sat, 15 Jun 2019 17:07:14 -0700
Message-ID: <CAMDScmn0Mge9mK14AS+y=JY-hGoXZGYo+Q-yG3VsrCXiYc9eDg@mail.gmail.com>
Subject: Still need to inline functions?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

What version of Linux is required so I can use functions without
__always_inline in the xdp kernel object?

I read here https://lwn.net/Articles/741773/ it was supposed to be
allowed a long time ago.

When I remove __always_inline on a medium sized function,
bpf_load_program() will say:

"jump out of range from insn 5 to 796"

Is this possible to fix, or do you still need to put __always_inline
on every function?

Software versions:

Ubuntu 18.04.02 LTS x64
4.18.0-20-generic
5.0.0-16-generic

clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

LLVM (http://llvm.org/):
  LLVM version 6.0.0

  Optimized build.
  Default target: x86_64-pc-linux-gnu
  Host CPU: broadwell

Compile flags:

clang -O2 -target bpf -I/usr/include/x86_64-linux-gnu -c kern.c -o kern.o
