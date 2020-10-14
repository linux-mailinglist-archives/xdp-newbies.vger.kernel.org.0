Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B37728DBB1
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Oct 2020 10:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgJNIfW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Oct 2020 04:35:22 -0400
Received: from mail-db8eur06olkn2016.outbound.protection.outlook.com ([40.92.51.16]:58753
        "EHLO EUR06-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729467AbgJNIfV (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Oct 2020 04:35:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z65Q5cVg9pFGdgQW+6hZZYudRBDLaV0F5Jhk9gQIsRiF4ABl0/T5xSUaSe6OpFDUMUP7dZtGNqYQKateYH/E7jsHua4AMohqofTZt6mVtCGGew3qy0eNj3+W9GH1GmBYD1h4Zb/AA6LWJRBX3WrFA4A3yHFwLELMurwFDDqv2FbC9ullkKLrAkHYWnWqSelq4eqVKccySjJG7gURlKJFqs5sYRMJVwoM05EiuPZIvouCoVAus9BqnwAc7ohJsyasIl8IQpqWsLgHKGcZ23380rovnQwSLEoJCrXPKzRm9RpVYIawHB7dNtJx9DWErK2+4L/C8vYjceVDDoBLPeCf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RwLE35NE/HwRvN+MLd2fH2s4ZkP2bKOYdrhf/8WR/E=;
 b=cSBMlX4mfVbcgbBDq1UlI37v/mW6mXvziDV6lCL1FH5bBdiVchpk6pAjwS9LKG2O89SSrSWg5So+6/XMo99n7Ok4IOE4O4kj1xSKv2poGYUgP5u/gVDcGqVDbxcJZyEUjsXjj0fcf6x7rQUBTe5DRVfa3EfQ5R+3tGGeWbsRDT1UUZmqkOLJvxOCVK22oYVri7w5fKUwhzv8XQ+8Bcr90kJ7923VUKp9NI+EUHptKSXWbVfrtFjQjp+Et4Hp7BLgmsRloaCVQ2F1+zD3Un2uauSnTdvFNCrmAaTslR5YoALVdUTh3dRYFqZ+1vNIswq1BBoX+rsKkdeL0efw9EaPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR06FT005.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::4a) by
 DB8EUR06HT196.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::153)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 08:35:17 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:fc35::45) by DB8EUR06FT005.mail.protection.outlook.com
 (2a01:111:e400:fc35::218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 14 Oct 2020 08:35:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DFD9E39730EF2C96CCB4CB54E13D9FB3384688E957DD898C63FDD439CFFC7D6D;UpperCasedChecksum:CEC86FCE9E53B7EFF05DBDAD0344C3BF0B6697CC20F3D80C284539CB448102BC;SizeAsReceived:8757;Count:48
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 08:35:17 +0000
Subject: Re: Multi-core scalability problems
References: <VI1PR04MB3104C1D86BDC113F4AC0CF4A9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <fede.parola@hotmail.it>
X-Forwarded-Message-Id: <VI1PR04MB3104C1D86BDC113F4AC0CF4A9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
Message-ID: <VI1PR04MB31042B28F2C3016EB460AB3F9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Wed, 14 Oct 2020 10:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <VI1PR04MB3104C1D86BDC113F4AC0CF4A9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TMN:  [44k1URojcuQ74fxSVQIZWe5qSCvWkWX2]
X-ClientProxiedBy: GV0P278CA0061.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::12) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <e370a5bb-a296-1289-7ae5-200a8014e446@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by GV0P278CA0061.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Wed, 14 Oct 2020 08:35:16 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 67e5d899-bcb6-4b71-aac8-08d8701c13d4
X-MS-TrafficTypeDiagnostic: DB8EUR06HT196:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPyY1NGF0Hfjo50fcTMpn1eWyq4Ztgo3QrgYscEE9seecntTHdFx145jjZr+3W2PLqrilUQEzcOeEiL+1pufa8KxvqlnEXLU7fWg4ByC9lTIQWyXs40zVIWE7/zGS6Bft4thFPbTGDhLsv+TqHM7e076ZzCVu9G03RuORLSo/exLs/cx9rCDMizfgZXSo+/qPJbzwQBs/sDfK/hWDeGbBJIz1sX5HE91PzWHv8lxs/rFjUGUETdYarTapFl1oKhZ
X-MS-Exchange-AntiSpam-MessageData: ms4pRROZK+bvzfNmsNeU68A/9x+43eJ/AMVCwR8LRZdon+JygeCqiovMRrq4YI5kAHJkeU5B2YdadNAVLHOSPQMIsXrgsr6Pdu41rL3H790bdu/Ks+yNEazgd8Rn9Gd+HZVKpusT4AX/sQzQdYvTsA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e5d899-bcb6-4b71-aac8-08d8701c13d4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 08:35:16.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR06FT005.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT196
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 14/10/20 08:56, Federico Parola wrote:
> Thanks for your help!
>
> On 13/10/20 18:44, Toke Høiland-Jørgensen wrote:
>> Federico Parola<fede.parola@hotmail.it> writes:
>>
>>> Hello,
>>> I'm testing the performance of XDP when dropping packets using multiple
>>> cores and I'm getting unexpected results.
>>> My machine is equipped with a dual port Intel XL710 40 GbE and an Intel
>>> Xeon Gold 5120 CPU @ 2.20GHz with 14 cores (HyperThreading disabled),
>>> running Ubuntu server 18.04 with kernel 5.8.12.
>>> I'm using the xdp_rxq_info program from the kernel tree samples to drop
>>> packets.
>>> I generate 64 bytes UDP packets with MoonGen for a total of 42 Mpps.
>>> Packets are uniformly distributed in different flows (different src
>>> port) and I use flow direction rules on the rx NIC to send these flows
>>> to different queues/cores.
>>> Here are my results:
>>>
>>> 1 FLOW:
>>> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP 
>>> options:no_touch
>>> XDP stats       CPU     pps         issue-pps
>>> XDP-RX CPU      0       17784270    0
>>> XDP-RX CPU      total   17784270
>>>
>>> RXQ stats       RXQ:CPU pps         issue-pps
>>> rx_queue_index    0:0   17784270    0
>>> rx_queue_index    0:sum 17784270
>>> ---
>>>
>>> 2 FLOWS:
>>> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP 
>>> options:no_touch
>>> XDP stats       CPU     pps         issue-pps
>>> XDP-RX CPU      0       7016363     0
>>> XDP-RX CPU      1       7017291     0
>>> XDP-RX CPU      total   14033655
>>>
>>> RXQ stats       RXQ:CPU pps         issue-pps
>>> rx_queue_index    0:0   7016366     0
>>> rx_queue_index    0:sum 7016366
>>> rx_queue_index    1:1   7017294     0
>>> rx_queue_index    1:sum 7017294
>>> ---
>>>
>>> 4 FLOWS:
>>> Running XDP on dev:enp101s0f0 (ifindex:3) action:XDP_DROP 
>>> options:no_touch
>>> XDP stats       CPU     pps         issue-pps
>>> XDP-RX CPU      0       2359478     0
>>> XDP-RX CPU      1       2358508     0
>>> XDP-RX CPU      2       2357042     0
>>> XDP-RX CPU      3       2355396     0
>>> XDP-RX CPU      total   9430425
>>>
>>> RXQ stats       RXQ:CPU pps         issue-pps
>>> rx_queue_index    0:0   2359474     0
>>> rx_queue_index    0:sum 2359474
>>> rx_queue_index    1:1   2358504     0
>>> rx_queue_index    1:sum 2358504
>>> rx_queue_index    2:2   2357040     0
>>> rx_queue_index    2:sum 2357040
>>> rx_queue_index    3:3   2355392     0
>>> rx_queue_index    3:sum 2355392
>>>
>>> I don't understand why overall performance is reducing with the number
>>> of cores, according to [1] I would expect it to increase until reaching
>>> a maximum value. Is there any parameter I should tune to overcome the
>>> problem?
>> Yeah, this does look a bit odd. My immediate thought is that maybe your
>> RXQs are not pinned to the cores correctly? There is nothing in
>> xdp_rxq_info that ensures this, you have to configure the IRQ affinity
>> manually. If you don't do this, I suppose the processing could be
>> bouncing around on different CPUs leading to cache line contention when
>> updating the stats map.
>>
>> You can try to look at what the actual CPU load is on each core -
>> 'mpstat -P ALL -n 1' is my goto for this.
>>
>> -Toke
>>
> I forgot to mention, I have manually configured the IRQ affinity to 
> map every queue on a different core, and running your command confirms 
> that one core per queue/flow is used.
>
>
> On 13/10/20 18:41, Jesper Dangaard Brouer wrote:
>> This is what I see with i40e:
>>
>> unning XDP on dev:i40e2 (ifindex:6) action:XDP_DROP options:no_touch
>> XDP stats       CPU     pps         issue-pps
>> XDP-RX CPU      1       8,411,547   0
>> XDP-RX CPU      2       2,804,016   0
>> XDP-RX CPU      3       2,803,600   0
>> XDP-RX CPU      4       5,608,380   0
>> XDP-RX CPU      5       13,999,125  0
>> XDP-RX CPU      total   33,626,671
>>
>> RXQ stats       RXQ:CPU pps         issue-pps
>> rx_queue_index    0:3   2,803,600   0
>> rx_queue_index    0:sum 2,803,600
>> rx_queue_index    1:1   8,411,540   0
>> rx_queue_index    1:sum 8,411,540
>> rx_queue_index    2:2   2,804,015   0
>> rx_queue_index    2:sum 2,804,015
>> rx_queue_index    3:5   8,399,326   0
>> rx_queue_index    3:sum 8,399,326
>> rx_queue_index    4:4   5,608,372   0
>> rx_queue_index    4:sum 5,608,372
>> rx_queue_index    5:5   5,599,809   0
>> rx_queue_index    5:sum 5,599,809
>> That is strange, as my results above show that it does scale on my
>> testlab on same NIC i40e (Intel Corporation Ethernet Controller XL710
>> for 40GbE QSFP+ (rev 02)).
>>
>> Can you try to use this[2] tool:
>>   ethtool_stats.pl --dev enp101s0f0
>>
>> And notice if there are any strange counters.
>>
>>
>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl 
>>
>> My best guess is that you have Ethernet flow-control enabled.
>> Some ethtool counter might show if that is the case.
>>
> Here are the results of the tool:
>
>
> 1 FLOW:
>
> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
> Ethtool(enp101s0f0) stat:     35458700 (     35,458,700) <= 
> port.fdir_sb_match /sec
> Ethtool(enp101s0f0) stat:   2729223958 (  2,729,223,958) <= 
> port.rx_bytes /sec
> Ethtool(enp101s0f0) stat:      7185397 (      7,185,397) <= 
> port.rx_dropped /sec
> Ethtool(enp101s0f0) stat:     42644155 (     42,644,155) <= 
> port.rx_size_64 /sec
> Ethtool(enp101s0f0) stat:     42644140 (     42,644,140) <= 
> port.rx_unicast /sec
> Ethtool(enp101s0f0) stat:   1062159456 (  1,062,159,456) <= rx-0.bytes 
> /sec
> Ethtool(enp101s0f0) stat:     17702658 (     17,702,658) <= 
> rx-0.packets /sec
> Ethtool(enp101s0f0) stat:   1062155639 (  1,062,155,639) <= rx_bytes /sec
> Ethtool(enp101s0f0) stat:     17756128 (     17,756,128) <= rx_dropped 
> /sec
> Ethtool(enp101s0f0) stat:     17702594 (     17,702,594) <= rx_packets 
> /sec
> Ethtool(enp101s0f0) stat:     35458743 (     35,458,743) <= rx_unicast 
> /sec
>
> ---
>
>
> 4 FLOWS:
>
> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
> Ethtool(enp101s0f0) stat:      9351001 (      9,351,001) <= 
> port.fdir_sb_match /sec
> Ethtool(enp101s0f0) stat:   2559136358 (  2,559,136,358) <= 
> port.rx_bytes /sec
> Ethtool(enp101s0f0) stat:     30635346 (     30,635,346) <= 
> port.rx_dropped /sec
> Ethtool(enp101s0f0) stat:     39986386 (     39,986,386) <= 
> port.rx_size_64 /sec
> Ethtool(enp101s0f0) stat:     39986799 (     39,986,799) <= 
> port.rx_unicast /sec
> Ethtool(enp101s0f0) stat:    140177834 (    140,177,834) <= rx-0.bytes 
> /sec
> Ethtool(enp101s0f0) stat:      2336297 (      2,336,297) <= 
> rx-0.packets /sec
> Ethtool(enp101s0f0) stat:    140260002 (    140,260,002) <= rx-1.bytes 
> /sec
> Ethtool(enp101s0f0) stat:      2337667 (      2,337,667) <= 
> rx-1.packets /sec
> Ethtool(enp101s0f0) stat:    140261431 (    140,261,431) <= rx-2.bytes 
> /sec
> Ethtool(enp101s0f0) stat:      2337691 (      2,337,691) <= 
> rx-2.packets /sec
> Ethtool(enp101s0f0) stat:    140175690 (    140,175,690) <= rx-3.bytes 
> /sec
> Ethtool(enp101s0f0) stat:      2336262 (      2,336,262) <= 
> rx-3.packets /sec
> Ethtool(enp101s0f0) stat:    560877338 (    560,877,338) <= rx_bytes /sec
> Ethtool(enp101s0f0) stat:         3354 (          3,354) <= rx_dropped 
> /sec
> Ethtool(enp101s0f0) stat:      9347956 (      9,347,956) <= rx_packets 
> /sec
> Ethtool(enp101s0f0) stat:      9351183 (      9,351,183) <= rx_unicast 
> /sec
>
>
> So if I understand the field port.rx_dropped represents packets 
> dropped due to a lack of buffer on the NIC while rx_dropped represents 
> packets dropped because upper layers aren't able to process them, am I 
> right?
>
> It seems that the problem is in the NIC.
>
>
> Federico
>
I was able to scale up to 4 cores by reducing the size of the rx ring 
from 512 to 128 with

sudo ethtool -G enp101s0f0 rx 128

(Why reducing? I would expect an increase to help)

However the problem persists when exceeding 4 flows/cores, and a further 
reduction of the size of the ring doesn't help.


4 FLOWS:

Running XDP on dev:enp101s0f0 (ifindex:4) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps
XDP-RX CPU      0       9841972     0
XDP-RX CPU      1       9842098     0
XDP-RX CPU      2       9842010     0
XDP-RX CPU      3       9842301     0
XDP-RX CPU      total   39368383

---

6 FLOWS:

Running XDP on dev:enp101s0f0 (ifindex:4) action:XDP_DROP options:no_touch
XDP stats       CPU     pps         issue-pps
XDP-RX CPU      0       4470754     0
XDP-RX CPU      1       4470224     0
XDP-RX CPU      2       4468194     0
XDP-RX CPU      3       4470562     0
XDP-RX CPU      4       4470316     0
XDP-RX CPU      5       4467888     0
XDP-RX CPU      total   26817942


Federico

