Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC234DB9FF
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Oct 2019 01:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441515AbfJQXBu (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Oct 2019 19:01:50 -0400
Received: from forward101p.mail.yandex.net ([77.88.28.101]:38417 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389846AbfJQXBt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Oct 2019 19:01:49 -0400
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Oct 2019 19:01:48 EDT
Received: from mxback19o.mail.yandex.net (mxback19o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::70])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id 4FDE43280365;
        Fri, 18 Oct 2019 01:56:28 +0300 (MSK)
Received: from myt6-4bc43443fff3.qloud-c.yandex.net (myt6-4bc43443fff3.qloud-c.yandex.net [2a02:6b8:c12:25a9:0:640:4bc4:3443])
        by mxback19o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id zcpvc5egPX-uSQ0gvTB;
        Fri, 18 Oct 2019 01:56:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1571352988;
        bh=k35+ikf30XZtwEbONyacNZH/az0HslFr0m9YfepsvA8=;
        h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
        b=lYLc5Ba/XlSi8P6lgJalPEFTjaIUznrvenBQ5nIEa+Thsb2pY2SnZP9s1pA1zPkza
         WasXsdwQQ26uBQDvOBPPlvym3yx8B/lXnALv12xBVIIxBy1pmq5dGY4sYeKpZsrGLt
         hXsOYqVIpNPSUW9K1oF/p57XYrXRbfWqCaz/y+ys=
Authentication-Results: mxback19o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by myt6-4bc43443fff3.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id JVvabQfVBu-uRq4qXd0;
        Fri, 18 Oct 2019 01:56:27 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Subject: Re: i40e: Kernel freezes with XDP_ZEROCOPY
To:     Kal Cutter Conley <kal.conley@dectris.com>,
        xdp-newbies@vger.kernel.org
References: <CAHApi-mbMMx5bhdyfoLuiw7V3qML3L8f+N-+ReQ9XmAKH_2q8A@mail.gmail.com>
 <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com>
From:   Ilya Goslhtein <ilejn@yandex.ru>
Message-ID: <10b8a1a6-5b59-7226-df49-ec902d6c3261@yandex.ru>
Date:   Fri, 18 Oct 2019 01:56:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHApi-mwp8ZjoC9MavMbzKSdEi9c2js-cD1+Qr8nzJF-P-Sz9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Kal,

I've noticed that all created processes in your code snippet bound to 
the same queue without SHARED flag.

Is it supposed to work?

Thanks.

On 17.10.2019 11:53, Kal Cutter Conley wrote:
> Hello,
> I have managed to extract a reproducer that crashes the kernel. We
> observe the crash with all drivers that support XDP zerocopy (i40e,
> ixgbe, mlx5_core). The program source is attached (C++). Compile with
> a newer clang++ or g++ using flag -std=c++17. It must also be linked
> with libbpf. Use libbpf v0.0.5 and make sure to revert
> 5771dacd3dc2fdd041c51242819a9f212e04af55.
>
> The crash is a kernel NULL pointer dereference in xsk_umem_consume_tx.
>
> Hopefully this is useful,
> Kal
>
> On Wed, Aug 7, 2019 at 10:48 PM Kal Cutter Conley
> <kal.conley@dectris.com> wrote:
>> Hello,
>> I am trying to get AF_XDP working with the i40e driver (Ethernet
>> Controller X710 for 10GbE SFP+). After bind() with XDP_ZEROCOPY the
>> kernel (machine) freezes hard. I have reproduced this on varying
>> kernel versions between 5.1 and 5.3-rc3 with 5.3 kernels freezing
>> also, but at a later stage. I tried replacing my XDP program with a
>> trivial one that simply returns XDP_PASS but it didn't help. On the
>> same system, the xdpsock sample does appear to work with the -z flag,
>> however. Are there any current known issues that could be causing
>> this? I will try to extract a minimal example that exercises the
>> freeze.
>>
>> Thanks,
>> Kal

-- 
Best regards,
Ilya Golshtein

