Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3593FDBE01
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Oct 2019 09:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409619AbfJRHGT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Oct 2019 03:06:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44026 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409617AbfJRHGT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Oct 2019 03:06:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id j18so4965005wrq.10
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Oct 2019 00:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IAptZT3iH+lWo29gGnn+UfC9mUmMK1DOs8fpexnnUHE=;
        b=g4v4wi9u9mplu7Bv+DMgcYEBbzPDPuRklfu5QkITHeIqRfy/1h0HzpHHWe6b5+m+H3
         s5sqX7QdJKpHLbuupLh7klKEw0zbM9Oy88gFczms+KIJNRkEPsMcIB0xJRbtOcBzc2Sq
         98TWsKvaSOBTtGyYdZVuLYFs5P0dHO+3B4bWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IAptZT3iH+lWo29gGnn+UfC9mUmMK1DOs8fpexnnUHE=;
        b=bdJPEY4/wr/5WzuZe3xIZoo5XuOTGrwinxdKDtzrWDciTueZbuwzUKUXnJwDS+Qplf
         RD7LAz8TxyDf4T6qXt30P5tR+mhDnKA0oOS6SjWt/vxTUE8Glk2TF4DUWL4UzbqKjzju
         eVqZyYH5+4bsqw4UcTaoJk4PRop8UUAwy0sfJ1f8izQ5/82ZRwY5iyS+7iRj32gY6Ox+
         INFJbuMVMnkMjKIIe7G+n0ofnkkff0t133cUDbzWqg2eGfCoVon+tUVV270SIW3tFx18
         GxQG69MK1rTJZSGiWx6TtWbcgBkroFSLBEtTY0LDbqgmzmiWpL81ZqgIwOO/7GnZRoB+
         eg+A==
X-Gm-Message-State: APjAAAWUapD1lClzn+yM7jzrwGbt8iWhDiS04OBMV/Zacmtowab912Pu
        WxCBPWVU6ME/dIpKr4rEw//uyy7RBfJRnzj1KfDTI4yhigrVtg==
X-Google-Smtp-Source: APXvYqx1c4qQgyzWp3h22fwQTAM0V2HJfaZUc91EUVXLWPmTQhgyxNrr3CAp0jfq4BGQc2JXeRIf7Nx6rziq+B2N6Tc=
X-Received: by 2002:a5d:408f:: with SMTP id o15mr5775009wrp.139.1571382377106;
 Fri, 18 Oct 2019 00:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
 <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com> <10b8a1a6-5b59-7226-df49-ec902d6c3261@yandex.ru>
In-Reply-To: <10b8a1a6-5b59-7226-df49-ec902d6c3261@yandex.ru>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Fri, 18 Oct 2019 09:06:06 +0200
Message-ID: <CAHApi-migoMstZZ5x2zE8b8P+SPkuD_+FVaXQq0HfU3N5Coudg@mail.gmail.com>
Subject: Re: i40e: Kernel freezes with XDP_ZEROCOPY
To:     Ilya Goslhtein <ilejn@yandex.ru>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Ilya,
The processes are created in serial (parent waits for each child to
exit). I only use fork() to avoid clean-up code. Sorry for the
confusion!

Kal

On Fri, Oct 18, 2019 at 12:56 AM Ilya Goslhtein <ilejn@yandex.ru> wrote:
>
> Hello Kal,
>
> I've noticed that all created processes in your code snippet bound to
> the same queue without SHARED flag.
>
> Is it supposed to work?
>
> Thanks.
>
> On 17.10.2019 11:53, Kal Cutter Conley wrote:
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
> >> Hello,
> >> I am trying to get AF_XDP working with the i40e driver (Ethernet
> >> Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
> >> kernel (machine) freezes hard. I have reproduced this on varying
> >> kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
> >> also, but at a later stage. I tried replacing my XDP program with a
> >> trivial one that simply returns XDP_PASS but it didn't help. On the
> >> same system, the xdpsock sample does appear to work with the -z flag,
> >> however. Are there any current known issues that could be causing
> >> this? I will try to extract a minimal example that exercises the
> >> freeze.
> >>
> >> Thanks,
> >> Kal
>
> --
> Best regards,
> Ilya Golshtein
>
