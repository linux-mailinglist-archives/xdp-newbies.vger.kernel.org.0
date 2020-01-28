Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C2614C07D
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Jan 2020 20:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgA1TBC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 28 Jan 2020 14:01:02 -0500
Received: from qrelay22.mxroute.com ([172.82.139.22]:45615 "EHLO
        qrelay22.mxroute.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726162AbgA1TBC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 28 Jan 2020 14:01:02 -0500
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Jan 2020 14:01:01 EST
Received: from filter003.mxroute.com [168.235.111.26] (Authenticated sender: mN4UYu2MZsgR)
 by qrelay22.mxroute.com (ZoneMTA) with ESMTPA id 16fed829c7c000f036.001
 for <xdp-newbies@vger.kernel.org>;
 Tue, 28 Jan 2020 18:55:57 +0000
X-Zone-Loop: d4075e307bcd1fb1e90a132402e3030580f2a4ac682b
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id 8930E60012
        for <xdp-newbies@vger.kernel.org>; Tue, 28 Jan 2020 18:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Lblo4Ayz3JJ82p/lT/w2mtFS5CdI9SACJPrRFGWVZSg=; b=V26wKatjaCpPTyf7IlLPjKa8v/
        OFXKeCKyq5kvsXouJXai7tPQYiIZGLcv4CmKuxW/M3QHvvWTAfBlMSYmsBcbk+llRRH0RJPmtj7Qy
        QDyJm0F8VBc8q+M1rEZbolJjR9sp0rgA/tHmmKq8YVdfm+/+7hX3ufhfrXGrk+CFLuDLVy5EFtQiE
        nuLeh7G5OJt59NtNnCAo+sgiGC9oSxzaI4ue1aRTD/cJOYyA4baM5Fj6TSI15lQsEY1x22Ef+fLZq
        4tg6dRl9mi1X8AkKsPmLWbNDv3br+i5iEmNRHxuxmiuCQ+pna3VCRjN8zViFCdGAkVgi5HJmK7RIh
        R/IFanIg==;
Subject: Re: Measuring/Debugging XDP Performance
From:   Christian Deacon <gamemann@gflclan.com>
To:     xdp-newbies@vger.kernel.org
References: <6c3dc8ff-e2bd-a06e-d9f0-c5be0103d266@gflclan.com>
 <20200123141122.3783e298@carbon>
 <23ec64c0-e0d7-a60b-ecc4-6ca401dc4896@gflclan.com>
 <20200123213808.7a1f200b@carbon>
 <fdd597bf-7da9-f9bd-d97f-f1bd90f14281@gflclan.com>
Message-ID: <f5242b7e-6c26-8682-9bc6-61f39497ca8e@gflclan.com>
Date:   Tue, 28 Jan 2020 12:55:51 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fdd597bf-7da9-f9bd-d97f-f1bd90f14281@gflclan.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey everyone,


The only NIC our hosting provider could replace our old NIC with is 
using the `e1000e` driver (it's a one gigabit NIC card). I dug through 
some older mailing list threads and read XDP isn't very effective with 
one gigabit NICs (the preferred minimum is 10 gbps IIRC). These were 
threads from 2017 and I'm not sure if this is still the case. However, 
if it is, I'm still hoping I can use XDP, but hopefully have the 
performance equal to the network stack at the very least.


I understand the `e1000e` driver doesn't have XDP support upstream. 
Therefore, I tried implementing the driver patch that adds XDP support here:


https://github.com/adjavon/e1000e_xdp


Unfortunately, this patch was based off of kernel 4.10.2 (I'm using 
4.19). Therefore, I had to manually implement the patch code (this is my 
first time messing with NIC driver code). Sadly, it doesn't seem like 
the patch worked based off of the 'perf' results which are linked below. 
I still see "do_xdp_generic" calls:


```

xxx@xxx/xxxx/xxxx# cat results_2.log | grep "xdp"
                           do_xdp_generic
      0.33%  006  swapper          [kernel.kallsyms]         [k] 
do_xdp_generic                         -      -
      0.09%  006  swapper          [kernel.kallsyms]         [k] 
bpf_xdp_adjust_head                    -      -
      0.09%  005  swapper          [kernel.kallsyms]         [k] 
do_xdp_generic                         -      -
      0.07%  006  swapper          [kernel.kallsyms]         [k] 
generic_xdp_tx                         -      -
      0.07%  004  swapper          [kernel.kallsyms]         [k] 
do_xdp_generic                         -      -
      0.05%  003  swapper          [kernel.kallsyms]         [k] 
do_xdp_generic                         -      -
      0.02%  004  swapper          [kernel.kallsyms]         [k] 
generic_xdp_tx                         -      -
      0.01%  005  swapper          [kernel.kallsyms]         [k] 
generic_xdp_tx                         -      -
```


With that said, it appears my other POP servers that are using the 
"virtio_net" NIC driver are using XDP generic according to the 'perf' 
results as well (they're similar to the above). They're also on kernel 4.18.


My question is, how would you know if you're using XDP-native or not? Is 
it possible you're still using XDP-native, even when there are XDP 
generic calls from the 'perf' command?


Here's a link to the outputs of the 'perf' command discussed above for 
anyone interested:


https://g.gflclan.com/6sHmHPlo3W.zip


Any help is highly appreciated and thank you for your time!


On 1/23/2020 3:38 PM, Christian Deacon wrote:
> Hey Jesper,
>
>
> Thank you for the information and that makes a lot more sense! I 
> didn't realize we had a NIC that doesn't support XDP-native. I will 
> see if I can get a better NIC card for this dedicated server (I don't 
> believe our current NIC card supports any other drivers besides `igb`).
>
>
> In the meantime, I have stopped announcing my dedicated server to our 
> Anycast network and have started announcing the four-core VPS that had 
> similar issues before ordering the dedicated server (even though I 
> feel this VPS should be able to handle the traffic load). The CPU is 
> virtualized and running at 2.5 GHz per core. The VPS's OS is Ubuntu 
> 18.10 and the kernel is '4.18.0-20'. The NIC driver is "virtio-pci", 
> which I believe is supported (please correct me if I'm wrong, I do see 
> 'virtio_net' in the list of supported XDP drivers which I'd assume is 
> the same thing).
>
>
> I will execute the 'perf' commands tonight when we have higher traffic 
> load and reply with the output.
>
>
> Thank you for your help!
>
>
> On 1/23/2020 2:38 PM, Jesper Dangaard Brouer wrote:
>> On Thu, 23 Jan 2020 11:22:31 -0600
>> Christian Deacon <gamemann@gflclan.com> wrote:
>>
>>> Thank you for the information and I will try these commands tonight 
>>> when
>>> there is higher traffic load! The 'perf' command seems interesting.
>> Thanks for the perf output in the private email thread. From the output
>> I can clearly see the problem (some copy pasted below signature).  You
>> are using the driver igb which does not support XDP-native, and is thus
>> using generic-XDP.
>>
>> This driver only have 192 bytes headroom, where 256 is needed. Thus,
>> running XDP-generic will be slower than running the normal network
>> stack, as every packet will get reallocated and copied.
>>
