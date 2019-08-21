Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E6797F91
	for <lists+xdp-newbies@lfdr.de>; Wed, 21 Aug 2019 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfHUQAx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 21 Aug 2019 12:00:53 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36609 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHUQAw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 21 Aug 2019 12:00:52 -0400
Received: by mail-ot1-f43.google.com with SMTP id k18so2555503otr.3
        for <xdp-newbies@vger.kernel.org>; Wed, 21 Aug 2019 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zd5B+jmj+czgoa06n1HLf1FtCHjVm5xFjkWgWU9Rdro=;
        b=UgP9WuUKra3krF83X8M0s+W5YMYZ5Nc2JsdmJsZu0z0gbndCNdamJllLCyZCKgKsUb
         hpPSCATlDcfhavnwByC9crEl4tlIRH9EusScFPJA5aARHO1/y0hYTHlAnStjM5XkKDqG
         wmd8AF5XhluX0ZGW4SIXgxKoE989QCGDdtZUhjmqcaz4bjJ6pdTei+wwb8HAXZmM1t1K
         H6bbannOrqO6uSnpiwRA/e391XSsbgY8UmE/t3APLrg+p7KVhQRB6ZbXs7U9GtQOm9a8
         UoT3g/O/i4CYHjD8dEGHWIKVKXmRQG9AfqOR7v92P45tSHgFJIQwi23MTUKNXSSEm7bd
         IBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zd5B+jmj+czgoa06n1HLf1FtCHjVm5xFjkWgWU9Rdro=;
        b=aqXwjZuQnLYsidGIZmzvRs2Sdvxg1vv7nGREl5yuncdsiFQ7KRozlyWQJPzgw5ny4S
         A8h99lFMtCnL8f5aFG/z/NVDnG88a2Qkm0Nx9VCNZ5iJn1YjC+nBAgitALR8k9/aubrz
         f6My6ueLy8nVe18u52YLrXFYFRwPrGHgrNTO1qDRyypfaqbZBsHvFBWNScdxmRMY/2JF
         GgVFi+eklJ1TLjF2aKKqmPrdFCpuE3rfWXzk670QAiFpNnR8aJTElU2dSbyr3SAjV83T
         Wjt6SUhigpaO7PN592Cww47Nv4f1B/NBEH+cUwrSVrhNB+Was/f7Vct1thf6Z4U9O6zW
         sACQ==
X-Gm-Message-State: APjAAAXXOD45a6A8yKOzopqe5ZrUApq2BpyAvqf0W/QYIrHYrSwjuYaA
        OB6efaGXbL5iYo7v4xUq45WABh8pjDLAn46IEdU=
X-Google-Smtp-Source: APXvYqzuR3ohygJXEFco8fRR1ep5u1rZeWPHSDxZyeayz/MRFRoKuKLCdU5r8NSgx2Bgs97k1LLpXASRrr5Y0o05RXY=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr28270910ote.39.1566403250817;
 Wed, 21 Aug 2019 09:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <c4ba6c71-89e0-e8c3-1353-184b2e9f99a8@yandex.ru>
In-Reply-To: <c4ba6c71-89e0-e8c3-1353-184b2e9f99a8@yandex.ru>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 21 Aug 2019 18:00:39 +0200
Message-ID: <CAJ8uoz1LyGyUwKzkLsAr+__ch+immBHvWHEfd5UApLELpb16pA@mail.gmail.com>
Subject: Re: l2fwd between interfaces
To:     Ilya Golshtein <ilejn@yandex.ru>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Aug 21, 2019 at 5:52 PM Ilya Golshtein <ilejn@yandex.ru> wrote:
>
> Hello,
>
> l2fwd mode of xdpsock sample puts a packet back into the same interface.
> Is there a good example how xdpsock can be modified to read a packet
> from one interface and to send it to another?
>
> I've failed to find such example and created my own app
> https://github.com/ilejn/xdpbridge.
>
> Do hope that such a thing already exists.

None exists as far as I know, so great that you are contributing
this.But could you please move your implementation over to the libbpf
interface? This will simplify it greatly.

> If not, I appreciate if anyone can review the code of my application. In
> particular I am concerned about the ENOSPC case in xq_enq_copy.

Do you not just come back and retry in this case? Looks correct, or am
I missing something?

> Basically the thing works Ok, but not as fast as I expected.
>
> I've tried to share umem to get rid of memcpy, but bind returns EINVAL
> in this case. Exploring xsk_bind (net/xdp/xsk.c) in 4.18 kernel I can
> see, that there is an explicit check umem_xs->dev != dev . Is it a
> fundamental limitaion?

Can you try supplying the same umem memory range to two different
sockets and their respective setsockopts?

Thanks: Magnus

> Thanks.
>
> --
> Regards,
> Ilya Golshtein
>
