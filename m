Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839B61E0277
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 21:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388084AbgEXT1Y (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 15:27:24 -0400
Received: from dal2relay21.mxroute.com ([64.40.26.21]:45089 "EHLO
        dal2relay21.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387992AbgEXT1X (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 15:27:23 -0400
Received: from filter004.mxroute.com ([149.28.56.236] 149.28.56.236.vultr.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal2relay21.mxroute.com (ZoneMTA) with ESMTPSA id 17248275ead00054f2.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Sun, 24 May 2020 19:27:19 +0000
X-Zone-Loop: 24862cb7815961a58245773988235848530a71334f79
X-Originating-IP: [149.28.56.236]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter004.mxroute.com (Postfix) with ESMTPS id 5E96D3EAD8
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=N5ywiXTjTD3i8xJysqPotIH9ob6bhQj2nIEWmd1QpHY=; b=uSVGomNbhXcF28LXG5jx7o5EhI
        4INm7gZ4wVYKbWz2/fagmo9FfeKRNOTUNp82GqgKLkmoRaYLR7Tu0pNFwgOIts6uW6ps1t8u46yj1
        Y4Ihm5FvO4Tol+1yMlnr/NLGNiFPkgagM6Cq9tnDrh/B7oSH/+CvghUWp9DHza+hJRmPV+gFtY/Bs
        8OzSz6QT9gpErA6cljlpFGg5TR+AYABH62k4i9+h4kD+TLbI6W4n4bQ/0e1g5ud5t1H5t9KStjWYQ
        T3R9lbgqV7t/BQ8KkngmLIP/KPYjEX2Mrtrfm5mjPsuxQLKIZ/u06Wwm4HIk6zWMTgDpdRpMNo4+V
        a7phbQtw==;
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     David Ahern <dsahern@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
 <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
 <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
 <f4a901ef-6edf-0b92-5ec1-d931956c0ffd@gmail.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <25405fb0-83f3-066a-629f-f89044e2cce7@gflclan.com>
Date:   Sun, 24 May 2020 14:27:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f4a901ef-6edf-0b92-5ec1-d931956c0ffd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey David,


Thank you for your response and the information! That cleared a lot of 
things up for me!


Yes, this is with Vultr.


As of right now, the packet processing software I'm using forwards 
traffic to another server via XDP_TX. It also drops any traffic via 
XDP_DROP that doesn't match our filters (these filters aren't included 
in the open-source project linked below). Do you know if there would be 
any real performance advantage using XDP-native over XDP-generic in our 
case with the `virtio_net` driver for XDP_TX and XDP_DROP actions? We're 
currently battling (D)DoS attacks. Therefore, I'm trying to do 
everything I can to drop these packets as fast as possible.


If you would like to inspect the source code for this project, here's a 
link to the GitHub repository:


https://github.com/Dreae/compressor


I'm also working on a bigger open-source project with a friend that'll 
drop traffic based off of filtering rules with XDP (it'll be version two 
of the project I linked above) and we plan to use it on VMs with the 
`virtio_net` driver. Therefore, it'll be useful to know if XDP-native 
will provide a performance advantage over XDP-generic when dropping packets.


Thank you for all your help so far. I appreciate it!


On 5/24/2020 1:58 PM, David Ahern wrote:
> On 5/24/20 12:13 PM, Christian Deacon wrote:
>> Hey David,
>>
>>
>> Thank you for your response!
>>
>>
>> The VM only has one CPU right now. It's possible the cluster has 8 RX
>> queues I'd imagine, but I don't have that information sadly. I executed
>> the same command on another VM I have with two CPUs (not being used for
>> the XDP-native testing):
>>
>>
>> ```
>>
>> root@Test:~# ethtool -l ens3
>> Channel parameters for ens3:
>> Pre-set maximums:
>> RX:             0
>> TX:             0
>> Other:          0
>> Combined:       8
>> Current hardware settings:
>> RX:             0
>> TX:             0
>> Other:          0
>> Combined:       2
>> ```
> That's odd that they give you 8 queues for a 1 cpu VM. This is vultr? I
> may have to spin up a VM there and check it out.
>
>>
>> I did receive this from my hosting provider when asking which NIC driver
>> they use:
> ...
>>
> I agree with the provider - the hardware nic's are not relevant to the VM.
>
>> To my understanding, if the NIC isn't offloading packets directly to our
>> VPS, wouldn't this destroy the purpose of using XDP-native over
>> XDP-generic/SKB mode for performance in our case? I was under the
>> assumption that was the point of XDP-native. If so, I'm not sure why the
>> program is loading with XDP-native without any issues besides the AF_XDP
>> program.
> The host is essentially the network to your VM / VPS. What data
> structure it uses is not relevant to what you want to do inside the VM.
> Right now there are a lot of missing features for the host OS to rely
> solely on XDP frames.
>
> Inside the VM kernel, efficiency of XDP depends on what you are trying
> to do.
>
> A 1 or 2-cpu VM with 8 queues meets the resource requirement for XDP
> programs; I am not familiar with the details on AF_XDP to know if some
> kind of support is missing inside the virtio driver.
>
>>
>> I will admit I've been wondering what the difference is between
>> `XDP_FLAGS_DRV_MODE` (XDP-native) and `XDP_FLAGS_HW_MODE` since I
>> thought XDP-native was offloading packets from the NIC.
> H/W mode means the program is pushed down to the hardware. I believe
> only netronome's nic currently does offload. Some folks have discussed
> offloading programs for the virtio NIC, but that does not work today.
