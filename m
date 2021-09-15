Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A931540CBC4
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Sep 2021 19:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhIORhG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Sep 2021 13:37:06 -0400
Received: from mail-108-mta137.mxroute.com ([136.175.108.137]:45979 "EHLO
        mail-108-mta137.mxroute.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229573AbhIORhG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Sep 2021 13:37:06 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Sep 2021 13:37:06 EDT
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta137.mxroute.com (ZoneMTA) with ESMTPSA id 17bea82bdbc00074ba.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 15 Sep 2021 17:30:41 +0000
X-Zone-Loop: b6f441f6cf32626cc3693d99019694e748cf4313e3e4
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Ekswx0ri7zBblWRdKLcXaFiq0/R7oLL3jnyEUYEfQUE=; b=nf5AcggnB0dLPpuunDZuDiSjUO
        7p1OZSKOiLxvD/z8t/EpRdtbx6M7jnfVSCLiO2lydHzN9FtE4APR0tMOxsAa/TGusm7qqUaMLU20k
        stWoW/yg+w2qP8nYRG3JrDW+O8t0NzIrN0ihnviFXEzs4t7Eii+ybvnMCBuvZitnrUQOuPdU5TBUA
        gV1qRPtpquBzPUsqBKhs1S1ofC4bcVtbE/FfG0axZ94PMlvc8m2xKogxtpw3/M2F+EGhlJHtCDYGX
        oau4+bQHx6nSypCDhVENn5kQc6v7ATlE+4vDBpjbqJoJVNB9XfHA5YZP5FnYH7cBhHG7JJdFyWhzK
        x2JgPC4Q==;
To:     xdp-newbies@vger.kernel.org
From:   Christian Deacon <gamemann@gflclan.com>
Subject: Parsing TCP Header Options In XDP/BPF
Message-ID: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
Date:   Wed, 15 Sep 2021 12:30:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AuthUser: gamemann@gflclan.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi everyone,


I wasn't sure whether to submit this under XDP's mailing list or BPF's. 
However, since it's an XDP program, I figured I'd start here. The issue 
has to do with the BPF verifier, though.


I am trying to parse TCP header options within XDP/BPF. In my case, I 
want to locate the 'timestamps' option and read/write to the sender and 
receive timestamps (the option's data, which is eight bytes in total I 
believe). In order to do this, I believe you'll need a loop since the 
TCP header options are dynamic in regards to location in the 
packet/memory, etc. For more information on the TCP timestamps option 
specifically, I found below a good read for those interested.


https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_timestamps


Everything I've tried so far and the source code is all within a GitHub 
repository I made below. I also included a full BPF fail log in the 
`logs/` directory within the repository.


https://github.com/gamemann/XDP-TCP-Header-Options


In the code, I am trying to locate the timestamp offset within the TCP 
header options. One condition in the loop is when it finds another TCP 
option other than timestamps. In this case, I am trying to increment by 
the option's length (the second field within the option) so we can move 
onto scanning the next TCP option. Whenever I attempt to do so, the BPF 
verifier states I'm trying to access outside of the packet. However, 
I've tried including many checks for this (making sure the length in 
memory is within ctx->data and ctx->data_end for example). You can find 
more information about this below.


https://github.com/gamemann/XDP-TCP-Header-Options#fails


At first, I was only checking to see if the location was outside of 
ctx->data_end, but since that wasn't working, I figured I'd try to see 
if it's within ctx->data and ctx->data_end to see if it made any 
difference (it did not).



The tests I've ran occur for multiple kernels. From 5.14 to 5.10 and 5.4 
(which is the current kernel I'm on and what I performed my documented 
tests under). This is also on an Ubuntu 20.04 VM I have at home and here 
is the output from `uname -r`.


```

root@test02:/home/cdeacon# uname -r
5.4.28-050428-generic

```


I was wondering if anybody had suggestions or could tell me what I'm 
doing wrong in the code above. I apologize if I've missed anything 
obvious as well!

Any help is highly appreciated and thank you for your time!

