Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEF4292A4D
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 Oct 2020 17:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbgJSPXX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 19 Oct 2020 11:23:23 -0400
Received: from mail-am7eur06olkn2063.outbound.protection.outlook.com ([40.92.16.63]:37601
        "EHLO EUR06-AM7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729849AbgJSPXW (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 19 Oct 2020 11:23:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi4wDt/LUtgfPipLEilQfsPSJO+yc3OosqUB1okv50j2h1F0ntwROWrazoLB0SDgcXX4Y8yjVXPmdg2GE83TvTxPMyobtVFXNJAp0kGyrNU0MAIQJlZj0Otj2iqYFdgXlPuYAhTML0rPqYR/LQIXpPOL6dt+px6V/Alunz8pUK/LiQ9jKof4euvJ5Ve6/ThZFN57OiERNfJaniv+5h7vjshB4zN6A7YW47iVV824WgaGiHeF43KNGL4+ICS84R3nuA45jd7rZ2BmKCzp17Ozru0BTUYyzetTj0FGbyr4b22ZUA4o/ydJyiwgjN9ylU5arVfMFsBhRg9Ja71JlLgDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNitmTEAa+oum7KSvglBIdZcrNRS8DIp9o2xr6PFutE=;
 b=PT/ziAvXPf9eBGkKaUAtoFO/Aj3QKSTumxt8vgyIkXXE5D9majcfGfqW1dbhZXMgB2et/5AhUw0T0uLwXXQrhy8qds5Cfyl2QRxWK/rogCefpFy4FNaRiR6+fxDQf5gLdCz+opJ8t3Ie/VFbRtNw1fa4LMQX+gZ9GjGR3Zugqvu+IDcCPdM8+rw91DyzW/E1Tjfv6eb37sWaheFL2hw2fCNKGqggEzDhAbBHswl8+QDRaPxyzkp4vrYlcYYbnz46UyZPE3K6NECQpKrYE+A4USQ8Yv0zAHtsWZGZ0TW1mmSr40MpfF0Oyph64zEnoAxsYLBSyIDhqAzPxFBrEQQStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR06FT051.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::40) by
 DB8EUR06HT036.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::472)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 15:23:19 +0000
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 (2a01:111:e400:fc35::43) by DB8EUR06FT051.mail.protection.outlook.com
 (2a01:111:e400:fc35::279) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Mon, 19 Oct 2020 15:23:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FA1A464D57E427AAAD435F0ACB9CE3A2250274DD8CDC8AB9D34CC3828258AACA;UpperCasedChecksum:2B5131BCF4BB6275BD7D4E06AF18D02A348857BCB2B38CF8490474B9FDC09F72;SizeAsReceived:9049;Count:48
Received: from VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a]) by VI1PR04MB3104.eurprd04.prod.outlook.com
 ([fe80::48ad:4ee2:8bb0:bb2a%4]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 15:23:19 +0000
Subject: Re: Multi-core scalability problems
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <VI1PR04MB3104C89EF8DCB98F5330F36C9E040@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <87r1q29ita.fsf@toke.dk>
 <VI1PR04MB3104B4EA129004982325E2389E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014111529.6e464b4b@carbon>
 <VI1PR04MB3104C2AE44381640763C1F3D9E050@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201014162636.39c2ba14@carbon>
 <VI1PR04MB3104487E7F503BEEE13AE7999E020@VI1PR04MB3104.eurprd04.prod.outlook.com>
 <20201015152252.4360cf9a@carbon>
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <VI1PR04MB31049251BB588E95D5C5E3009E1E0@VI1PR04MB3104.eurprd04.prod.outlook.com>
Date:   Mon, 19 Oct 2020 17:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015152252.4360cf9a@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [GTaOlDC+R2VSPcoKlPp3jRIKHzgpGMrJ]
X-ClientProxiedBy: GV0P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::22) To VI1PR04MB3104.eurprd04.prod.outlook.com
 (2603:10a6:802:6::14)
X-Microsoft-Original-Message-ID: <46687c12-4f94-25cd-e270-118860585068@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by GV0P278CA0035.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:28::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 15:23:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a5266e97-222d-4b17-91a6-08d87442e8c8
X-MS-TrafficTypeDiagnostic: DB8EUR06HT036:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+++RTEVb1jtaBjem8OZShnYwISbdMJSCl0BHupU0RdlVs7H+DnqBKblpuZaDppp1Vl4zWDs6PvwfNKhYLgcfdidSbxuu1kCA+7yFUGMzoGR4E640bFdcpZgZj0VorhS8XvAzVNM1Muo3Hya9f8ta4MAxrXjKpmYWmyfeW+XbtAKyd9OTkZ2QjsAmAWiENz55sJSeYJbHV/3fIzY75S8jmk/FsfJuPIw/U+5Myz5aqcM7u2Oc120gIqU5xnHJPbd
X-MS-Exchange-AntiSpam-MessageData: Mp+oXUqseSypUqy8fhMTx/Xs9VQ3f0TbWXi3oR3MyYUYp+Ab2S4DsIP09HU7Qp+7EBSc68DwfkouPuQcr506DIAxhEeag4RzB7ex2k2/J3/B6aje+MajnnpPlWkueAfa2Qgepj8IDRtJxn4tgwXEVw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5266e97-222d-4b17-91a6-08d87442e8c8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 15:23:19.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR06FT051.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT036
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 15/10/20 15:22, Jesper Dangaard Brouer wrote:
> On Thu, 15 Oct 2020 14:04:51 +0200
> Federico Parola <fede.parola@hotmail.it> wrote:
> 
>> On 14/10/20 16:26, Jesper Dangaard Brouer wrote:
>>> On Wed, 14 Oct 2020 14:17:46 +0200
>>> Federico Parola <fede.parola@hotmail.it> wrote:
>>>    
>>>> On 14/10/20 11:15, Jesper Dangaard Brouer wrote:
>>>>> On Wed, 14 Oct 2020 08:56:43 +0200
>>>>> Federico Parola <fede.parola@hotmail.it> wrote:
>>>>>
>>>>> [...]
>>>>>>> Can you try to use this[2] tool:
>>>>>>>      ethtool_stats.pl --dev enp101s0f0
>>>>>>>
>>>>>>> And notice if there are any strange counters.
>>>>>>>
>>>>>>>
>>>>>>> [2]https://github.com/netoptimizer/network-testing/blob/master/bin/ethtool_stats.pl
> [...]
> 
>>>> The only solution I've found so far is to reduce the size of the rx ring
>>>> as I mentioned in my former post. However I still see a decrease in
>>>> performance when exceeding 4 cores.
>>>
>>> What is happening when you are reducing the size of the rx ring is two
>>> things. (1) i40e driver have reuse/recycle-pages trick that get less
>>> efficient, but because you are dropping packets early you are not
>>> affected. (2) the total size of L3 memory you need to touch is also
>>> decreased.
>>>
>>> I think you are hitting case (2).  The Intel CPU have a cool feature
>>> called DDIO (Data-Direct IO) or DCA (Direct Cache Access), which can
>>> deliver packet data into L3 cache memory (if NIC is directly PCIe
>>> connected to CPU).  The CPU is in charge when this feature is enabled,
>>> and it will try to avoid L3 trashing and disable it in certain cases.
>>> When you reduce the size of the rx rings, then you are also needing
>>> less L3 cache memory, to the CPU will allow this DDIO feature.
>>>
>>> You can use the 'perf stat' tool to check if this is happening, by
>>> monitoring L3 (and L2) cache usage.
>>
>> What events should I monitor? LLC-load-misses/LLC-loads?
> 
> Looking at my own results from xdp-paper[1], it looks like that it
> results in real 'cache-misses' (perf stat -e cache-misses).
> 
> E.g I ran:
>   sudo ~/perf stat -C3 -e cycles -e  instructions -e cache-references -e cache-misses -r 3 sleep 1
> 
> Notice how the 'insn per cycle' gets less efficient when we experience
> these cache-misses.
> 
> Also how RX-size of queues affect XDP-redirect in [2].
> 
> 
> [1] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench01_baseline.org
> [2] https://github.com/xdp-project/xdp-paper/blob/master/benchmarks/bench05_xdp_redirect.org
>
Hi Jesper, sorry for the late reply, this are the cache refs/misses for 
4 flows and different rx ring sizes:

RX 512 (9.4 Mpps dropped):
Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
   23771011  cache-references                                (+-  0.04% )
    8865698  cache-misses      # 37.296 % of all cache refs  (+-  0.04% )

RX 128 (39.4 Mpps dropped):
Performance counter stats for 'CPU(s) 0,1,2,13' (10 runs):
   68177470  cache-references                               ( +-  0.01% )
      23898  cache-misses      # 0.035 % of all cache refs  ( +-  3.23% )

Reducing the size of the rx ring brings to a huge decrease in cache 
misses, is this the effect of DDIO turning on?


Federico
