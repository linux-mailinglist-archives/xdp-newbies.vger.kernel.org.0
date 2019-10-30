Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9948EA243
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Oct 2019 18:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfJ3RGv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Oct 2019 13:06:51 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:40162 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726619AbfJ3RGv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Oct 2019 13:06:51 -0400
X-Greylist: delayed 408 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Oct 2019 13:06:44 EDT
Received: from mxback20g.mail.yandex.net (mxback20g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:320])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 32D3350E0C03;
        Wed, 30 Oct 2019 19:59:50 +0300 (MSK)
Received: from sas2-44d129ed7200.qloud-c.yandex.net (sas2-44d129ed7200.qloud-c.yandex.net [2a02:6b8:c08:ff0a:0:640:44d1:29ed])
        by mxback20g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id hnI6KxLvyF-xoAWxkng;
        Wed, 30 Oct 2019 19:59:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1572454790;
        bh=CGTu2hnpmZvtAFADjgB1v9j1oXHf0tgLexvwE1JOyJI=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=XYQyRKGLcRnfWqslrO73ywvhAclT+Ju752cnVF5wMZc1YOY7Aosr0yoUQwQkkFy6b
         WgDr00iwW3v++i2U2rBFw3eU9U2/m5pWlcyHTJiyTHMF+TvtT0sciqqPyae/VUEEzx
         LqUXTqeG5Y2zKi5k+Wl8v9dJy5gt3Vi2M+mCk6ZA=
Authentication-Results: mxback20g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas2-44d129ed7200.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id RjQTukMslU-xnVWajbN;
        Wed, 30 Oct 2019 19:59:49 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
 <87imq0ut8l.fsf@toke.dk> <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
 <87a7bcusg3.fsf@toke.dk> <ac54dbc6-245a-c1b6-4bef-47296c69ec75@yandex.ru>
 <20191030173902.09311289@carbon>
From:   Ilya Goslhtein <ilejn@yandex.ru>
Message-ID: <ef2e89e5-d5fe-5f06-1506-f233a92b9a7c@yandex.ru>
Date:   Wed, 30 Oct 2019 19:59:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030173902.09311289@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Jesper,

thank you for your comments.

I agree that it is strange to use AF_XDP as a bridge, while it might be 
not so strange if you consider some userspace application logic.

xdpbridge is basically a sample. With the help of this sample I can ask 
questions about one or another XDP specific issue, e.g. to clarify if 
zerocopy is not compatible with XDP_REDIRECT.

Initially I avoided using libbpf but currently I use it anyway so I 
agree that using it properly is a plus.


On 30.10.2019 19:39, Jesper Dangaard Brouer wrote:
> On Wed, 30 Oct 2019 18:44:27 +0300 Ilya Goslhtein <ilejn@yandex.ru> wrote:
>
>> Hello,
>>
>> playing with xdpbridge https://github.com/ilejn/xdpbridge/ I've observed
>> a limitation which is serious for me.
> Hmm... I took a short look at your code.
>
> Sorry for this candid/blunt evaluation: I think you are doing it wrong.
> Both on how you use other FOSS code and how you use BPF/XDP.
>
> First of all you are using bpf_load.c[1], which everybody should stop
> using (sorry, I know I sort of started that trend).  Instead everybody
> should use libbpf[2].  Second you have copied over bpf_load.c and
> re-indented the entire file, which is bad, because it makes it very
> hard to track the difference between the original FOSS project and your
> project.
>
> You *also* use libbpf, but directly from the kernel tree.  We don't
> recommend doing it this way.  Facebook engineers are maintaining a
> libbpf mirror on github[2], which can be used as a git-submodule.
> Before all distros start shipping libbpf, the easiest way to get
> started is to use libbpf as a git-submodule.
>
> [1] https://github.com/ilejn/xdpbridge/blob/master/bpf_load.c
> [2] https://github.com/libbpf/libbpf
>
>
>> xdpbridge is basically a combination of xdp_redirect_map sample
>> (world=>client path) and slightly more advanced l2fwd mode of xdpsock
>> (client=>world path),
>> where AF_XDP sockets are bound to two different interfaces (vanilla
>> l2fwd mode uses same interface as ingress and egress) and where
>> multithreading is supported.
> IMHO choosing AF_XDP for a bridge implementation is the wrong approach.
> I would implement this in the XDP BPF-program, and use fallback to the
> normal Linux bridging code (for broadcasting, ARP etc).
>
>
>> xdpbridge sets options for client and egress interfaces independently.
>>
>> So, setting zerocopy bind flag for world interface (-z command line
>> parameter) prevents this interface from working as ingress for
>> world=>client path, although different queues are used. No errors, just
>> no data transfer.
> Sounds like you want part of the traffic to reach the normal kernel
> networking stack.  In that case, the XDP program should sort that out
> (and call XDP_PASS) before doing the XDP_REDIRECT step into AF_XDP.
>
>   
>> It would be nice to understand if this issue fundamental or specific
>> for the kernel (5.0.0-31-generic #33~18.04.1-Ubuntu) or card (Intel
>> Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01))
>> or driver.
>> Or, may be, it is just my mistake.
>>
>> I do appreciate any comments or suggestions.
> I'm glad that you are open to feedback.
>
> I recommend you look at our XDP-tutorial[3], to see an example of how
> Toke and I recommend structuring a project that want to use XDP/BPF.
>
>
> [3] https://github.com/xdp-project/xdp-tutorial

-- 
Best regards,
Ilya Golshtein

