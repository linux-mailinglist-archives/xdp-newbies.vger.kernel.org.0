Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2222128F1CB
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Oct 2020 14:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgJOME4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Oct 2020 08:04:56 -0400
Received: from mail-db8eur06olkn2094.outbound.protection.outlook.com ([40.92.51.94]:64737
        "EHLO EUR06-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726149AbgJOME4 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Oct 2020 08:04:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sixy2UNgCB+cu/fbfH4rUyOTyuFiCUtAfHfrQtgYYw5baaJ8OWFHBJNElmDEvXEzSDi3wxH09fu0l2EpAQJXnqk23noIXlBjQkCFLzDooKNkpLf5c8o+SXBkygTXfJAD6rxUJH37IBcaFRABHxfaRc7AicZaIGJAWx2Idr7HCyjQ3jSsddFEAy/fsDamTw88jD+T2jMfNWAWYAvObVB3PlSXQQJohk5DhpvVxCU+PXLLaDH0z05uhJ0mSnioxdK/anWW7TWU2VOgjxPyhUzVfaQFzEx/qrjKVY4umPyEmv8/KYhRSJU2Lh61wE/IqkCrtjTDtq5/09OhvLV2L99Mow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxQJ7CDqvdMESMNnWFxW7KjXOiASmeS5vy3679u1TzQ=;
 b=Z3QoRwwmqTobHMY25d5LXW9rG9OoJJWLmKofMbJ0KwzUq8DNhM5MQJdtfFEe5Rlo1XHCki6IWosTqO88zqFYzsHWF+Idik4jyXlbJ4BBJi9so+/1KC/11rJoTyYXObFgffyPEZBgiz/aykF5/pAr5XU+rp7cRfm+f7T7+T4qTa18gA2iaWvYpeVmGfXSSg14V9OPywiqeSHrHjBt0wYiVJp6Yd6wEsikspgoKIqUWliJxYCNiQhUR3jvFCHSasTBOqIOJTzl7QYERipOwRexhSUaA1W9JfmIdgKMhk1mBhp/OTHnm2bSsLBY0X20NXxNy27O8y22CEsFvJRtI/+qmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR06FT066.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::45) by
 DB8EUR06HT168.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::123)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 12:04:52 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:fc35::51) by DB8EUR06FT066.mail.protection.outlook.com
 (2a01:111:e400:fc35::476) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Thu, 15 Oct 2020 12:04:52 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:326128AB5B792544D853FC70DDFAD17F190E04928BC57DB0CAA8C234F9FD2231;UpperCasedChecksum:96832E36EAA0BF28CBA18DFB6434EAFF8BFE32E0705EC1FFA85CAAF297205191;SizeAsReceived:8913;Count:48
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3455.030; Thu, 15 Oct 2020
 12:04:52 +0000
Subject: Re: Multi-core scalability problems
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <87r1q29ita.fsf@toke.dk>
 <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014111529.6e464b4b@carbon>
 <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014162636.39c2ba14@carbon>
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Thu, 15 Oct 2020 14:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201014162636.39c2ba14@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TMN:  [SC1slEhDpQEizlSK/+UeUyGU4051d/3Z]
X-ClientProxiedBy: ZR0P278CA0091.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::6) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <90f5229f-fade-d4b9-7ebe-5a0321c1be88@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by ZR0P278CA0091.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Thu, 15 Oct 2020 12:04:52 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f71d598e-3d2d-4d33-253c-08d8710285d6
X-MS-TrafficTypeDiagnostic: DB8EUR06HT168:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MLgb5k3UMy+NvNCJ1GTZzk/I2frXafx0zWwI5r1iHT3iK72fP/c2dmxbtoaG4JTNheS8hLjstS2H4yvNHIdKGDKMg0rht+VWO5wMLAFaBrPZWD3hMJ4j+xBeXd0zHKPlJj+bSeZAvmLwdus1quZdd6yqjI3KZKl2Sf8/BhsE/Ih7aucg5kvDpNkIh92ycsXk4nu+GOBNS9mBKK5cfe00JN3Js2jyLwXiEyalPqB9tKkz5DELc71Q1HMcJ4rTYH/n
X-MS-Exchange-AntiSpam-MessageData: A53SCQTa8MthQkkja8VGYGxW9oTNAcwk9TThju7wR4JLi6HAt2BS+lHl+Fo7r1Iaj5kStmlMhOIOA6uNTtB4fMigCHRGbLaZ7cy8Cy2A7HysFO5w0pHUEM6QJtvmQ36Z/6A+E6UDxEkZJb3u4rOsOQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71d598e-3d2d-4d33-253c-08d8710285d6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 12:04:52.5240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR06FT066.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT168
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 14/10/20 16:26, Jesper Dangaard Brouer wrote:
> On Wed, 14 Oct 2020 14:17:46 +0200
> Federico Parola <fede.parola@hotmail.it> wrote:
> 
>> On 14/10/20 11:15, Jesper Dangaard Brouer wrote:
>>> On Wed, 14 Oct 2020 08:56:43 +0200
>>> Federico Parola <fede.parola@hotmail.it> wrote:
>>>
>>> [...]
>>>>> Can you try to use this[2] tool:
>>>>>     ethtool_stats.pl --dev enp101s0f0
>>>>>
>>>>> And notice if there are any strange counters.
>>>>>
>>>>>
>>>>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
>>>>> My best guess is that you have Ethernet flow-control enabled.
>>>>> Some ethtool counter might show if that is the case.
>>>>>      
>>>> Here are the results of the tool:
>>>>
>>>>
>>>> 1 FLOW:
>>>>
>>>> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
>>>> Ethtool(enp101s0f0) stat:     35458700 (     35,458,700) <= port.fdir_sb_match /sec
>>>> Ethtool(enp101s0f0) stat:   2729223958 (  2,729,223,958) <= port.rx_bytes /sec
>>>> Ethtool(enp101s0f0) stat:      7185397 (      7,185,397) <= port.rx_dropped /sec
>>>> Ethtool(enp101s0f0) stat:     42644155 (     42,644,155) <= port.rx_size_64 /sec
>>>> Ethtool(enp101s0f0) stat:     42644140 (     42,644,140) <= port.rx_unicast /sec
>>>> Ethtool(enp101s0f0) stat:   1062159456 (  1,062,159,456) <= rx-0.bytes /sec
>>>> Ethtool(enp101s0f0) stat:     17702658 (     17,702,658) <= rx-0.packets /sec
>>>> Ethtool(enp101s0f0) stat:   1062155639 (  1,062,155,639) <= rx_bytes /sec
>>>> Ethtool(enp101s0f0) stat:     17756128 (     17,756,128) <= rx_dropped /sec
>>>> Ethtool(enp101s0f0) stat:     17702594 (     17,702,594) <= rx_packets /sec
>>>> Ethtool(enp101s0f0) stat:     35458743 (     35,458,743) <= rx_unicast /sec
>>>>
>>>> ---
>>>>
>>>>
>>>> 4 FLOWS:
>>>>
>>>> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
>>>> Ethtool(enp101s0f0) stat:      9351001 (      9,351,001) <= port.fdir_sb_match /sec
>>>> Ethtool(enp101s0f0) stat:   2559136358 (  2,559,136,358) <= port.rx_bytes /sec
>>>> Ethtool(enp101s0f0) stat:     30635346 (     30,635,346) <= port.rx_dropped /sec
>>>> Ethtool(enp101s0f0) stat:     39986386 (     39,986,386) <= port.rx_size_64 /sec
>>>> Ethtool(enp101s0f0) stat:     39986799 (     39,986,799) <= port.rx_unicast /sec
>>>> Ethtool(enp101s0f0) stat:    140177834 (    140,177,834) <= rx-0.bytes /sec
>>>> Ethtool(enp101s0f0) stat:      2336297 (      2,336,297) <= rx-0.packets /sec
>>>> Ethtool(enp101s0f0) stat:    140260002 (    140,260,002) <= rx-1.bytes /sec
>>>> Ethtool(enp101s0f0) stat:      2337667 (      2,337,667) <= rx-1.packets /sec
>>>> Ethtool(enp101s0f0) stat:    140261431 (    140,261,431) <= rx-2.bytes /sec
>>>> Ethtool(enp101s0f0) stat:      2337691 (      2,337,691) <= rx-2.packets /sec
>>>> Ethtool(enp101s0f0) stat:    140175690 (    140,175,690) <= rx-3.bytes /sec
>>>> Ethtool(enp101s0f0) stat:      2336262 (      2,336,262) <= rx-3.packets /sec
>>>> Ethtool(enp101s0f0) stat:    560877338 (    560,877,338) <= rx_bytes /sec
>>>> Ethtool(enp101s0f0) stat:         3354 (          3,354) <= rx_dropped /sec
>>>> Ethtool(enp101s0f0) stat:      9347956 (      9,347,956) <= rx_packets /sec
>>>> Ethtool(enp101s0f0) stat:      9351183 (      9,351,183) <= rx_unicast /sec
>>>>
>>>>
>>>> So if I understand the field port.rx_dropped represents packets dropped
>>>> due to a lack of buffer on the NIC while rx_dropped represents packets
>>>> dropped because upper layers aren't able to process them, am I right?
>>>>
>>>> It seems that the problem is in the NIC.
>>> Yes, it seems that the problem is in the NIC hardware, or config of the
>>> NIC hardware.
>>>
>>> Look at the counter "port.fdir_sb_match":
>>> - 1 flow: 35,458,700 = port.fdir_sb_match /sec
>>> - 4 flow:  9,351,001 = port.fdir_sb_match /sec
>>>
>>> I think fdir_sb translates to Flow Director Sideband filter (in the
>>> driver code this is sometimes related to "ATR" (Application Targeted
>>> Routing)). (note: I've seen fdir_match before, but not the "sb"
>>> fdir_sb_match part). This is happening inside the NIC HW/FW that does
>>> filtering on flows and make sure same-flow goes to same RX-queue number
>>> to avoid OOO packets. This looks like the limiting factor in your setup.
>>>
>>> Have you installed any filters yourself?
>>>
>>> Try to disable Flow Director:
>>>
>>>    ethtool -K ethX ntuple <on|off>
>>>   
>> Yes, I'm using flow filters to manually steer traffic to different
>> queues/cores, however disabling ntuple doesn't solve the problem, the
>> port.fdir_sb_match value disappears but the number of packets dropped in
>> port.rx_dropped stays high.
> 
> Try to disable your flow filters.  There are indications that hardware
> cannot run these filters at these speeds.

There are no changes with flow filters disabled or enabled, except for 
the presence of the port.fdir_sb_match counter, here are the results of 
ethtool for 4 flows:

FLOW FILTERS DISABLED:
Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
Ethtool(enp101s0f0) stat:   2575765457 (  2,575,765,457) <= 
port.rx_bytes /sec
Ethtool(enp101s0f0) stat:     30718177 (     30,718,177) <= 
port.rx_dropped /sec
Ethtool(enp101s0f0) stat:     40246552 (     40,246,552) <= 
port.rx_size_64 /sec
Ethtool(enp101s0f0) stat:     40246558 (     40,246,558) <= 
port.rx_unicast /sec
Ethtool(enp101s0f0) stat:    143008276 (    143,008,276) <= rx-10.bytes /sec
Ethtool(enp101s0f0) stat:      2383471 (      2,383,471) <= 
rx-10.packets /sec
Ethtool(enp101s0f0) stat:    142866811 (    142,866,811) <= rx-13.bytes /sec
Ethtool(enp101s0f0) stat:      2381114 (      2,381,114) <= 
rx-13.packets /sec
Ethtool(enp101s0f0) stat:    142924921 (    142,924,921) <= rx-3.bytes /sec
Ethtool(enp101s0f0) stat:      2382082 (      2,382,082) <= rx-3.packets 
/sec
Ethtool(enp101s0f0) stat:    142918015 (    142,918,015) <= rx-6.bytes /sec
Ethtool(enp101s0f0) stat:      2381967 (      2,381,967) <= rx-6.packets 
/sec
Ethtool(enp101s0f0) stat:    571723262 (    571,723,262) <= rx_bytes /sec
Ethtool(enp101s0f0) stat:      9528721 (      9,528,721) <= rx_packets /sec
Ethtool(enp101s0f0) stat:      9528674 (      9,528,674) <= rx_unicast /sec

FLOW FILTERS ENABLED:
Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
Ethtool(enp101s0f0) stat:     15810008 (     15,810,008) <= 
port.fdir_sb_match /sec
Ethtool(enp101s0f0) stat:   2634909056 (  2,634,909,056) <= 
port.rx_bytes /sec
Ethtool(enp101s0f0) stat:     31640574 (     31,640,574) <= 
port.rx_dropped /sec
Ethtool(enp101s0f0) stat:     41170436 (     41,170,436) <= 
port.rx_size_64 /sec
Ethtool(enp101s0f0) stat:     41170327 (     41,170,327) <= 
port.rx_unicast /sec
Ethtool(enp101s0f0) stat:    143016759 (    143,016,759) <= rx-0.bytes /sec
Ethtool(enp101s0f0) stat:      2383613 (      2,383,613) <= rx-0.packets 
/sec
Ethtool(enp101s0f0) stat:    142921054 (    142,921,054) <= rx-1.bytes /sec
Ethtool(enp101s0f0) stat:      2382018 (      2,382,018) <= rx-1.packets 
/sec
Ethtool(enp101s0f0) stat:    142943103 (    142,943,103) <= rx-2.bytes /sec
Ethtool(enp101s0f0) stat:      2382385 (      2,382,385) <= rx-2.packets 
/sec
Ethtool(enp101s0f0) stat:    142907586 (    142,907,586) <= rx-3.bytes /sec
Ethtool(enp101s0f0) stat:      2381793 (      2,381,793) <= rx-3.packets 
/sec
Ethtool(enp101s0f0) stat:    571775035 (    571,775,035) <= rx_bytes /sec
Ethtool(enp101s0f0) stat:      9529584 (      9,529,584) <= rx_packets /sec
Ethtool(enp101s0f0) stat:      9529673 (      9,529,673) <= rx_unicast /sec

>> The only solution I've found so far is to reduce the size of the rx ring
>> as I mentioned in my former post. However I still see a decrease in
>> performance when exceeding 4 cores.
> 
> What is happening when you are reducing the size of the rx ring is two
> things. (1) i40e driver have reuse/recycle-pages trick that get less
> efficient, but because you are dropping packets early you are not
> affected. (2) the total size of L3 memory you need to touch is also
> decreased.
> 
> I think you are hitting case (2).  The Intel CPU have a cool feature
> called DDIO (Data-Direct IO) or DCA (Direct Cache Access), which can
> deliver packet data into L3 cache memory (if NIC is directly PCIe
> connected to CPU).  The CPU is in charge when this feature is enabled,
> and it will try to avoid L3 trashing and disable it in certain cases.
> When you reduce the size of the rx rings, then you are also needing
> less L3 cache memory, to the CPU will allow this DDIO feature.
> 
> You can use the 'perf stat' tool to check if this is happening, by
> monitoring L3 (and L2) cache usage.

What events should I monitor? LLC-load-misses/LLC-loads?

Federico
