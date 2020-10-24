Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F6B297CAE
	for <lists+xdp-newbies@lfdr.de>; Sat, 24 Oct 2020 15:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761809AbgJXN55 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 24 Oct 2020 09:57:57 -0400
Received: from mail-db8eur05olkn2046.outbound.protection.outlook.com ([40.92.89.46]:29792
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759690AbgJXN54 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 24 Oct 2020 09:57:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAdPblAjsrPCAKx0erUKrqWNy6IuvHMspgYuF9uxPfPYz8stblvccrLDIf5OgqiIM7oz41RAWKETNtc8SK+8XqJzTFdWLRieTHi8JDvGUPb95YpWgSGAlT8t0xe+RTkRJwCVFBxlSvj0rrkgYfE5Gc+06Z6zHfK10067kPhgI7Qb6OW7SR1iXXnKGmFtp0IEfKoE+HTmz9hcbuqZZX+8sjXXDjLsmBF6fT3TSwt+nqSYpIAlv8Cg12LFa2uWVQy56eRXmZpXw/XhVKeYN/XD+ZKfnk4KebwKHmX4kkOdTsUPhhnY5wqWM9oe8oGeh1lJDOIHKBDUO0jvZposmtz7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiGxXcSimE9u4pH6yaCTZrZRL5Al9nNDWVP72RqX0lE=;
 b=IP2ruXeCkaI47Q7DypM7PuKXtlrbVZefnR9U9DHCgfm3JcDJkV9z8fnYFMPke60XQeDqieqlHri52gI+A+bBG5qUA8cczy7EuxqQGbLbuIJ+HBM9QjpEUZp+WJNI+2OLBB3SHMPUuX8d3G2r4UXjiEh2HxowIzwRcB/94x8qLWCkIGUKoTAOUf6285hb7mWq4QXjKAHxK+22ALW2/gYmDzxapSuSZfbx7v8atvL6EUSSNerW3vBZ2GdNLBG+xWY3ZYtobxJ325hE53LRnxEnfLt51FAx8XuUlJKPNoUFwMfkRVwEisfhC4WR4LK3Mk29crAdpCI42uCyb7x5/MO3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6EUR05FT057.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::49) by
 AM6EUR05HT061.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::84)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Sat, 24 Oct
 2020 13:57:53 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:fc11::4a) by AM6EUR05FT057.mail.protection.outlook.com
 (2a01:111:e400:fc11::78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Sat, 24 Oct 2020 13:57:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:39C96BCCD63D691921F1C1A43D29188DF6F6D5F79820D697E50DBD2BDCDA7D2F;UpperCasedChecksum:BE6E817A0493FE02EF956BFC3BD3ACB3DD5FA6363B5F181F4381DE39BA32B22B;SizeAsReceived:9168;Count:48
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3499.018; Sat, 24 Oct 2020
 13:57:53 +0000
Subject: Re: Multi-core scalability problems
To:     Jesper Dangaard Brouer <brouer@redhat.com>
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <87r1q29ita.fsf@toke.dk>
 <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014111529.6e464b4b@carbon>
 <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014162636.39c2ba14@carbon>
 <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201015152252.4360cf9a@carbon>
 <VI1PR04MB31049251BB588E95D5C5E3009E1E0@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201019202621.690aaacd@carbon>
Cc:     xdp-newbies@vger.kernel.org
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <VI1PR04MB31048EB4062CAE0C9245B87F9E1B0@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Sat, 24 Oct 2020 15:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019202621.690aaacd@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [of5Dq08aqUbwJUXOLd3tdVSBnGXnaZmE]
X-ClientProxiedBy: ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::13) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <24978c83-2459-a1d4-bd38-53599a8da42c@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by ZR0P278CA0003.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Sat, 24 Oct 2020 13:57:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ea7018a5-7ff3-418b-b606-08d87824cc86
X-MS-TrafficTypeDiagnostic: AM6EUR05HT061:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54OH+tXfycv8e0KDE4UdTtTF87gS/nJImXwbaIYsAtRHo4p7oEul08MQWScDseV1ru9JMDZjv74ObzA+Eph04182j+11gNl6+aPxOffxEk7NoZKWMrGmoSuzFdAlVEfAK0a436Qlo73fRapuGgqq2xFLupaHd3E/uPFetUFffsmj9XfA6cYses7gfKRuu6nYqXwHwiY04cP1OdpPesUWkg==
X-MS-Exchange-AntiSpam-MessageData: 0RU6tHd5paYvVSjOCXwu8lbEK2CywmrcLzYsP+AJY8IMnjJ000MIj/qLih59dBHIhRvL2P/GDtC3tnnZbB95qs+o74aUcPT/zIJu1INo5VYlRJVBh2skmErv9mJS9LM9rxKWFrUYLUyVo6G0ag02QQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7018a5-7ff3-418b-b606-08d87824cc86
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2020 13:57:52.6746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT061
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 19/10/20 20:26, Jesper Dangaard Brouer wrote:
> On Mon, 19 Oct 2020 17:23:18 +0200
> Federico Parola <fede.parola@hotmail.it> wrote:
 >>
 >> [...]
 >>
>> Hi Jesper, sorry for the late reply, this are the cache refs/misses for
>> 4 flows and different rx ring sizes:
>>
>> RX 512 (9.4 Mpps dropped):
>> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
>>     23771011  cache-references                                (+-  0.04% )
>>      8865698  cache-misses      # 37.296 % of all cache refs  (+-  0.04% )
>>
>> RX 128 (39.4 Mpps dropped):
>> Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
>>     68177470  cache-references                               ( +-  0.01% )
>>        23898  cache-misses      # 0.035 % of all cache refs  ( +-  3.23% )
>>
>> Reducing the size of the rx ring brings to a huge decrease in cache
>> misses, is this the effect of DDIO turning on?
> 
> Yes, exactly.
> 
> It is very high that 37.296 % of all cache refs is being cache-misses.
> The number of cache-misses 8,865,698 is close to your reported 9.4
> Mpps. Thus, seems to correlate with the idea that this is DDIO-missing
> as you have a miss per packet.
> 
> I can see that you have selected a subset of the CPUs (0,1,2,13), it
> important that this is the active CPUs.  I usually only select a
> single/individual CPU to make sure I can reason about the numbers.
> I've seen before that some CPUs get DDIO effect and others not, so
> watch out for this.
> 
> If you add HW-counter -e instructions -e cycles to your perf stat
> command, you will also see the instructions per cycle calculation.  You
> should notice that the cache-miss also cause this number to be reduced,
> as the CPUs stalls it cannot keep the CPU pipeline full/busy.
> 
> What kind of CPU are you using?
> Specifically cache-sizes (use dmidecode look for "Cache Information")
> 
I'm using an Intel Xeon Gold 5120, L1: 896 KiB, L2: 14 MiB, L3: 19.25 MiB.

> The performance drop is a little too large 39.4 Mpps -> 9.4 Mpps.
> 
> If I were you, I would measure the speed of the memory, via using the
> tool lmbench-3.0 command 'lat_mem_rd'.
> 
>   /usr/lib/lmbench/bin/x86_64-linux-gnu/lat_mem_rd 2000 128
> 
> The output is the nanosec latency of accessing increasing sizes of	
> memory.  The jumps/increases in latency should be fairly clear and
> shows the latency of the different cache levels.  For my CPU E5-1650 v4
> @ 3.60GHz with 15MB L2 cache, I see L1=1.055ns, L2=5.521ns, L3=17.569ns.
> (I could not find a tool that tells me the cost of accessing main-memory,
> but maybe it is the 17.569ns, as the tool measurement jump from 12MB
> (5.933ns) to 16MB (12.334ns) and I know L3 is 15MB, so I don't get an
> accurate L3 measurement.)
> 
I run the benchmark, I can see to well distinct jumps (L1 and L2 cache I 
guess) of 1.543ns and 5.400ns, but then the latency grows gradually:
0.25000 5.400
0.37500 5.508
0.50000 5.508
0.75000 6.603
1.00000 8.247
1.50000 8.616
2.00000 8.747
3.00000 8.629
4.00000 8.629
6.00000 8.676
8.00000 8.800
12.00000 9.119
16.00000 10.840
24.00000 16.650
32.00000 19.888
48.00000 21.582
64.00000 22.519
96.00000 23.473
128.00000 24.125
192.00000 24.777
256.00000 25.124
384.00000 25.445
512.00000 25.642
768.00000 25.775
1024.00000 25.869
1536.00000 25.942
I can't really tell where L3 cache and main memory start.

One thing I forgot to mention is that I experience the same performance 
drop even without specifying the --readmem flag of the bpf sample 
(no_touch mode), if I'm not wrong without the flag the ebpf program 
should not access to the packet buffer and therefore the DDIO should 
have no effect.
