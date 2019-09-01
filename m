Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FC4A4AB1
	for <lists+xdp-newbies@lfdr.de>; Sun,  1 Sep 2019 18:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfIAQrb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 1 Sep 2019 12:47:31 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:56287 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728874AbfIAQrb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 1 Sep 2019 12:47:31 -0400
Received: by mail-wm1-f42.google.com with SMTP id g207so8138893wmg.5
        for <xdp-newbies@vger.kernel.org>; Sun, 01 Sep 2019 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=miorOBFk3ql5nJeCyuEp9B1Zv9bvXkljYrWCZcwlOjE=;
        b=ky3p2pelJStYotGdkpZ2qEAfamdAXGUT/Tfxai0a8kbFwc0Ekis9YaZ6zyNTX/D/g5
         s3ezlvwni6yf/H6lEJzC1AUg5e5C/Av1q4kGyRPK4EYF2k6TJ+WhTOG0B2OZf8uYAA0f
         KY5VePCadFTixc2PmV9iSVtl+qyVHvCjpqIZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=miorOBFk3ql5nJeCyuEp9B1Zv9bvXkljYrWCZcwlOjE=;
        b=Qsru7bCMBrXYzZrSEUwoNt9YTfTI9ypzHL3dGXcg7lGFUchdjRcBLxXdpLd1Pf3dOE
         KMUlsK1LxrTK95F3MM+KZvvjxdYW3grOTgA4ekbznjUenyYltC58c8k6Rfxx2hjPDimu
         TX3NltyZk4S4Oq14RMPktJ0OWc9eqH/DAIm1rZ6DXgWMhwEt4jhxJ4etDnhQ4XmcKxz5
         9I8OS9//tMjKQ2cnX6IUgcmD7E22EJ07jpLATfWFY6spH7L1yRFppENt9xjvcxRp//Dr
         gRZbbir6osuyDCSyKRSINLllfECV3R54Oswp9mBa3AD5qNsm6vhfQyGtAU+/1iyw1hP1
         b6Jg==
X-Gm-Message-State: APjAAAVNWw8GTAg/UMCL6W+1eqHF+C3kCbRJ8mSWaFybomdNMSlWqetV
        12vz5xodkiQ3OAdJmKNzwMnSYY5YmoFjSEKsrVbaLfI4UFo=
X-Google-Smtp-Source: APXvYqyko6DRFD4Dni0G0DCq2FMB4rVk2GxxNfMK/IrIRp9HTCKRIsSBJyUZMRowG/bOduR3jZgsXrd2NubWehIrHkY=
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr15356462wmd.45.1567356448578;
 Sun, 01 Sep 2019 09:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mMi2jYAOCrGhpkRVybz0sDpOSkLFCZfVe-2wOcAO_MqQ@mail.gmail.com>
In-Reply-To: <CAHApi-mMi2jYAOCrGhpkRVybz0sDpOSkLFCZfVe-2wOcAO_MqQ@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Sun, 1 Sep 2019 18:47:15 +0200
Message-ID: <CAHApi-=YSo=sOTkRxmY=fct3TePFFdG9oPTRHWYd1AXjk0ACfw@mail.gmail.com>
Subject: Re: net/mlx5e: bind() always returns EINVAL with XDP_ZEROCOPY
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,
I figured out the problem. Let me document the issue here for others
and hopefully start a discussion.

The mlx5 driver uses special queue ids for ZC. If N is the number of
configured queues, then for XDP_ZEROCOPY the queue ids start at N. So
queue ids [0..N) can only be used with XDP_COPY and queue ids [N..2N)
can only be used with XDP_ZEROCOPY.

sudo ethtool -L eth0 combined 16
sudo samples/bpf/xdpsock -r -i eth0 -c -q 0   # OK
sudo samples/bpf/xdpsock -r -i eth0 -z -q 0   # ERROR
sudo samples/bpf/xdpsock -r -i eth0 -c -q 16  # ERROR
sudo samples/bpf/xdpsock -r -i eth0 -z -q 16  # OK

Why was this done? To use zerocopy if available and fallback on copy
mode normally you would set sxdp_flags=0. However, here this is no
longer possible. To support this driver, you have to first try binding
with XDP_ZEROCOPY and the special queue id, then if that fails, you
have to try binding again with a normal queue id. Peculiarities like
this complicate the XDP user api. Maybe someone can explain the
benefits?

Kal


On Wed, Aug 7, 2019 at 2:49 PM Kal Cutter Conley <kal.conley@dectris.com> wrote:
>
> Hello,
> I am testing the mlx5e driver with AF_XDP. When I specify
> XDP_ZEROCOPY, bind() always returns EINVAL. I observe the same problem
> with the xdpsock sample:
>
> sudo samples/bpf/xdpsock -r -i dcb1-port1 -z
> samples/bpf/xdpsock_user.c:xsk_configure_socket:322: errno:
> 22/"Invalid argument"
>
> Without XDP_ZEROCOPY, everything works as expected. Is this a known
> issue/limitation? I expected this to be supported looking at the
> code/commit history.
>
> Thanks,
> Kal
