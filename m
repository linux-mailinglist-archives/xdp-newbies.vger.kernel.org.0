Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E96D28E068
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Oct 2020 14:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbgJNMRw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Oct 2020 08:17:52 -0400
Received: from mail-oln040092069100.outbound.protection.outlook.com ([40.92.69.100]:13644
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727112AbgJNMRw (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Oct 2020 08:17:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQgumBrpbVQwFSjm4U4+TnYoqI99Cdf/f6J3cYe7TbyGXJCoreYgULDsz4a5liESN/yhCk7FZPSt51UhXyKD33L/F6yoVqa9oJhtxk9sHhOE71VGkZF1nqMOj5KZHkJY5Zbs06FCYIpHdBR8SyuSHxpcNkJOPztKpTshtegI2NHLfNsWrtqemIATGHzYpzkF8Gifhjew0lHxuXpKKp8EICqQZSWTcaXlcxdam14kjPlI4OMtzi9h6KekM1hCwZ6tiMq63/V0CZUohes7nE6R9eTQfTBvHeb+uKH32nxj/brAi4aPwDDrxTXY4pefnYap0Jmh/1zMdYeMVpyBd4draw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TizF1lI+0n5RmfRRTB856+NglpymmvfoKIh9BIU9Los=;
 b=LGCLl4lJTmaIDsCnzQEi2DHzo1MIdJIueDorkAoJJ/V/NM+DINzt/QbLS5kinXDjbKjXsHeSAbXgqqFXFExmmcgfP+JYR1//sDd40cRAQB9desWfTUZM8Us5QyEIbjPBxLWvJjE/J/roujaJz7gdySaXLIY3t1Jy/qWimHZLLAlkYLXr8NkPAWfGetbhXgIk3OK2GBlfJkpGTqYzOfgaNCF7UiJUVYLnuP/KpZWK3o3sfmzaDxDns7XPABGGv6smEHBed/6qC4NsNwiq8dWIqOnlPa7zCgpvjE9QbnXd2pDEOO8w0xLrel+a2Sq3awNKyn6AwlPrhL+mDQKUc/Hg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT032.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::49) by
 HE1EUR02HT226.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::388)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 14 Oct
 2020 12:17:48 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:7e1d::53) by HE1EUR02FT032.mail.protection.outlook.com
 (2a01:111:e400:7e1d::135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 12:17:48 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D0F62CD5F975B59D43CBD85E8D2F05C3F41DE354B0C167E448B7AF303F4302C1;UpperCasedChecksum:97A7D46FFE4E745D7003C53519D7C430E7D76C89D6AAB4F6FB7E9B673DDF9D2F;SizeAsReceived:8793;Count:47
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 12:17:48 +0000
Subject: Re: Multi-core scalability problems
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <87r1q29ita.fsf@toke.dk>
 <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014111529.6e464b4b@carbon>
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Wed, 14 Oct 2020 14:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201014111529.6e464b4b@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TMN:  [oAF6kn6wJqHv/WxyuXR3DrGAkM79rrBw]
X-ClientProxiedBy: GV0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2b::13) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <c12a7800-76f1-4aac-edf2-5ae02f5df815@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by GV0P278CA0080.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2b::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Wed, 14 Oct 2020 12:17:47 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f39930ca-4251-4ace-de99-08d8703b29e5
X-MS-TrafficTypeDiagnostic: HE1EUR02HT226:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXMLQ5D4mFQvMxMkDD0cb9xCsSes1qZU26ogxyNKCIKm7ZJ6OiMXwcM16lhjX6o+Z6fbKPlg1YumdZDaVNZDIayzgJilbpkykNR7GaA19hixtLBoz0iV/MX9XqQRhrM8Z+bWFSkgBwZ/f4QRDEp9bJu0/WlxR0FghJtzFyi5Fpu6eDDRbADVJYvGPsbdPJmzOfmN2N1sz72DacfxJV+DT+dqqhRBBDkCYmjpOcw1+WxzP2iOOOg8Pg6XF4fdsP2r
X-MS-Exchange-AntiSpam-MessageData: YOhR+jlz1ckojcPIlbCjHJBV26GahofKW+OLDEVMJnt9T+VrlZHWIcoigpmcGR0yAV7pdqK/H3zyOEf3lC93YzR/zhYd33qLzZlIky3YyG4HJoyOS9nbDgo2K7neloDss1GnoK5E1IJ+Vd8jYF9OkA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39930ca-4251-4ace-de99-08d8703b29e5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 12:17:48.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT032.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT226
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 14/10/20 11:15, Jesper Dangaard Brouer wrote:
> On Wed, 14 Oct 2020 08:56:43 +0200
> Federico Parola <fede.parola@hotmail.it> wrote:
>
> [...]
>>> Can you try to use this[2] tool:
>>>    ethtool_stats.pl --dev enp101s0f0
>>>
>>> And notice if there are any strange counters.
>>>
>>>
>>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
>>> My best guess is that you have Ethernet flow-control enabled.
>>> Some ethtool counter might show if that is the case.
>>>   
>> Here are the results of the tool:
>>
>>
>> 1 FLOW:
>>
>> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
>> Ethtool(enp101s0f0) stat:     35458700 (     35,458,700) <= port.fdir_sb_match /sec
>> Ethtool(enp101s0f0) stat:   2729223958 (  2,729,223,958) <= port.rx_bytes /sec
>> Ethtool(enp101s0f0) stat:      7185397 (      7,185,397) <= port.rx_dropped /sec
>> Ethtool(enp101s0f0) stat:     42644155 (     42,644,155) <= port.rx_size_64 /sec
>> Ethtool(enp101s0f0) stat:     42644140 (     42,644,140) <= port.rx_unicast /sec
>> Ethtool(enp101s0f0) stat:   1062159456 (  1,062,159,456) <= rx-0.bytes /sec
>> Ethtool(enp101s0f0) stat:     17702658 (     17,702,658) <= rx-0.packets /sec
>> Ethtool(enp101s0f0) stat:   1062155639 (  1,062,155,639) <= rx_bytes /sec
>> Ethtool(enp101s0f0) stat:     17756128 (     17,756,128) <= rx_dropped /sec
>> Ethtool(enp101s0f0) stat:     17702594 (     17,702,594) <= rx_packets /sec
>> Ethtool(enp101s0f0) stat:     35458743 (     35,458,743) <= rx_unicast /sec
>>
>> ---
>>
>>
>> 4 FLOWS:
>>
>> Show adapter(s) (enp101s0f0) statistics (ONLY that changed!)
>> Ethtool(enp101s0f0) stat:      9351001 (      9,351,001) <= port.fdir_sb_match /sec
>> Ethtool(enp101s0f0) stat:   2559136358 (  2,559,136,358) <= port.rx_bytes /sec
>> Ethtool(enp101s0f0) stat:     30635346 (     30,635,346) <= port.rx_dropped /sec
>> Ethtool(enp101s0f0) stat:     39986386 (     39,986,386) <= port.rx_size_64 /sec
>> Ethtool(enp101s0f0) stat:     39986799 (     39,986,799) <= port.rx_unicast /sec
>> Ethtool(enp101s0f0) stat:    140177834 (    140,177,834) <= rx-0.bytes /sec
>> Ethtool(enp101s0f0) stat:      2336297 (      2,336,297) <= rx-0.packets /sec
>> Ethtool(enp101s0f0) stat:    140260002 (    140,260,002) <= rx-1.bytes /sec
>> Ethtool(enp101s0f0) stat:      2337667 (      2,337,667) <= rx-1.packets /sec
>> Ethtool(enp101s0f0) stat:    140261431 (    140,261,431) <= rx-2.bytes /sec
>> Ethtool(enp101s0f0) stat:      2337691 (      2,337,691) <= rx-2.packets /sec
>> Ethtool(enp101s0f0) stat:    140175690 (    140,175,690) <= rx-3.bytes /sec
>> Ethtool(enp101s0f0) stat:      2336262 (      2,336,262) <= rx-3.packets /sec
>> Ethtool(enp101s0f0) stat:    560877338 (    560,877,338) <= rx_bytes /sec
>> Ethtool(enp101s0f0) stat:         3354 (          3,354) <= rx_dropped /sec
>> Ethtool(enp101s0f0) stat:      9347956 (      9,347,956) <= rx_packets /sec
>> Ethtool(enp101s0f0) stat:      9351183 (      9,351,183) <= rx_unicast /sec
>>
>>
>> So if I understand the field port.rx_dropped represents packets dropped
>> due to a lack of buffer on the NIC while rx_dropped represents packets
>> dropped because upper layers aren't able to process them, am I right?
>>
>> It seems that the problem is in the NIC.
> Yes, it seems that the problem is in the NIC hardware, or config of the
> NIC hardware.
>
> Look at the counter "port.fdir_sb_match":
> - 1 flow: 35,458,700 = port.fdir_sb_match /sec
> - 4 flow:  9,351,001 = port.fdir_sb_match /sec
>
> I think fdir_sb translates to Flow Director Sideband filter (in the
> driver code this is sometimes related to "ATR" (Application Targeted
> Routing)). (note: I've seen fdir_match before, but not the "sb"
> fdir_sb_match part). This is happening inside the NIC HW/FW that does
> filtering on flows and make sure same-flow goes to same RX-queue number
> to avoid OOO packets. This looks like the limiting factor in your setup.
>
> Have you installed any filters yourself?
>
> Try to disable Flow Director:
>
>   ethtool -K ethX ntuple <on|off>
>
Yes, I'm using flow filters to manually steer traffic to different 
queues/cores, however disabling ntuple doesn't solve the problem, the 
port.fdir_sb_match value disappears but the number of packets dropped in 
port.rx_dropped stays high.

The only solution I've found so far is to reduce the size of the rx ring 
as I mentioned in my former post. However I still see a decrease in 
performance when exceeding 4 cores.


Federico

