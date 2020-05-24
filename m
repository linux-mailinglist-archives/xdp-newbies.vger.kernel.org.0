Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C241E0163
	for <lists+xdp-newbies@lfdr.de>; Sun, 24 May 2020 20:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387844AbgEXSNd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 24 May 2020 14:13:33 -0400
Received: from relay0114.mxlogin.com ([199.181.239.114]:37475 "EHLO
        relay0114.mxlogin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387823AbgEXSNc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 24 May 2020 14:13:32 -0400
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by relay0114.mxlogin.com (ZoneMTA) with ESMTPSA id 17247e3cee800054f2.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Sun, 24 May 2020 18:13:31 +0000
X-Zone-Loop: de7e4fd18f8c497e79ab99db29f7e9e4845b360f9e30
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id 6958160013
        for <xdp-newbies@vger.kernel.org>; Sun, 24 May 2020 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pgikGtQl5j7YHqXan1E4MY/CPiKh9umevqqhyrf5UPA=; b=vx4TRV4cyJz2zRJbOWuijaNl83
        flTkux3ZYjKaoaeUiawpoXf8OV3wjQw2gLaLAYEm++HuCd8iTDrEZ7PDuDHuymMa9C4EfQZX1x8Dn
        xI++PRKbOL4cA4UuNIN4h7kZvDeQZfcabXR9mwxPhiXBdpFo08B2Kd2FYRW+Dcf7bk0OARRwgxKpO
        S2UJxvddBWyOrZU4wI8EYeOgs/u0/MTFvdI//2b7REDEPjMNUzsE3SfZM9OmUrmCQXlURTwLD8jvQ
        /TKgcAb5KKXQ4L76oMKyJa2U127KstEp1U30KiKRpEzqvegGFAlhU2kxca3t/04BBYb0BT30reKsN
        fgoCTG9Q==;
Subject: Re: AF_XDP Side Of Project Breaking With XDP-Native
To:     David Ahern <dsahern@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <50fe1ab5-55e7-980b-54d4-cd1d5e864865@gflclan.com>
 <20200522175136.5a6fdc55@carbon>
 <cd32e639-018e-2346-9570-f2167dfe651e@gflclan.com>
 <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <2ed7d441-1a98-b4c1-8799-733ae286ed5e@gflclan.com>
Date:   Sun, 24 May 2020 13:13:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6709130c-a676-127d-ac9d-d0ab35397b0d@gmail.com>
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


Thank you for your response!


The VM only has one CPU right now. It's possible the cluster has 8 RX 
queues I'd imagine, but I don't have that information sadly. I executed 
the same command on another VM I have with two CPUs (not being used for 
the XDP-native testing):


```

root@Test:~# ethtool -l ens3
Channel parameters for ens3:
Pre-set maximums:
RX:             0
TX:             0
Other:          0
Combined:       8
Current hardware settings:
RX:             0
TX:             0
Other:          0
Combined:       2
```


I did receive this from my hosting provider when asking which NIC driver 
they use:


```

Hello,

Thanks for your inquiry.

We do not pass through the host node's NIC to your VPS.

Because of that, it's not relevant what NIC driver we are using on our 
host nodes.

Thanks for your patience.

```


To my understanding, if the NIC isn't offloading packets directly to our 
VPS, wouldn't this destroy the purpose of using XDP-native over 
XDP-generic/SKB mode for performance in our case? I was under the 
assumption that was the point of XDP-native. If so, I'm not sure why the 
program is loading with XDP-native without any issues besides the AF_XDP 
program.


I will admit I've been wondering what the difference is between 
`XDP_FLAGS_DRV_MODE` (XDP-native) and `XDP_FLAGS_HW_MODE` since I 
thought XDP-native was offloading packets from the NIC.


Thank you for the help!


On 5/24/2020 12:35 PM, David Ahern wrote:
> On 5/22/20 10:12 AM, Christian Deacon wrote:
>> Hey Jesper,
>>
>>
>> I apologize for not providing that information before. The driver is
>> `virtio_net`. Unfortunately, I'm not sure what the NIC driver on the
>> cluster is. Once my program's code is confirmed to be correct, I will
>> try reaching out to our hosting provider to see if they can provide this
>> information if the NIC's driver is the suspected cause to this issue.
>>
>> ```
>>
>> root@SEAV21:~/AF_XDP-Test# ethtool -i ens3
>> driver: virtio_net
>> version: 1.0.0
>> firmware-version:
>> expansion-rom-version:
>> bus-info: 0000:00:03.0
>> supports-statistics: yes
>> supports-test: no
>> supports-eeprom-access: no
>> supports-register-dump: no
>> supports-priv-flags: no
>> ```
>>
>>
> Is this a 4-cpu VM or 8 cpu VM?
>
> A previous response had:
>
> root@SEAV21:~/AF_XDP-Test# ethtool -l ens3
> Channel parameters for ens3:
> Pre-set maximums:
> RX:             0
> TX:             0
> Other:          0
> Combined:       8
> Current hardware settings:
> RX:             0
> TX:             0
> Other:          0
> Combined:       1
>
> The 8 for pre-set max says the nic has 8 queues. If it is a 4-vcpu vm,
> then try
>
> ethtool -L ens3 combined 4
>
> which leaves 4 for xdp. If it is an 8 cpu VM I believe you are out of
> luck given current requirements.
