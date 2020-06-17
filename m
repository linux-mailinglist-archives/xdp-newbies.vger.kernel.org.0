Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322471FCA25
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Jun 2020 11:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgFQJrv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 17 Jun 2020 05:47:51 -0400
Received: from mail-db8eur05olkn2086.outbound.protection.outlook.com ([40.92.89.86]:42432
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726044AbgFQJrv (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 17 Jun 2020 05:47:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRQDxDjV9fapV8N3of2VHMZfeTRJw4riHsezif95X+b8E1NGwGQo5c5+KfAi3mTSshMlptC+g4d6ZyNWiqphSeubb8eSCZcZF/L+USJ6KU6pNbh1hD4zPBmLH3ITT9h+4pHdOoBv198mIEUoljMUZwKwMHjKC8dq+jPl0AbXME8YUIWTC1oJhka+dc4YM5lxkTHEGZEzbpBQeMDLfAgzbmsxnq548WMGY0xHyfowW/sBGkxUoPfIVIhYmQPhaTlR80uG6/astbs1SBHvGrmBSDgYQBm24i1lhZRErpsRVqCXW32JCElivAtnk9f/lNae276+fC7yMym4TN+eEHW8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TT5c5wVIH2qjSYXEcm0R+FqJPsqGGtZVJ+2x7JB8gE=;
 b=GMc1FJAz1FtdkUQHhk9wy0nc8VHNZuib2fAWa3XmFBGD1m5u8ckZ7IzRZmS/IPhlABHbynq7OXfzi7IpPQyZGxRjnidSbApD3xGjOFYDJqlj76tD0Iq8tEwVC0yO0q0HLlTIQl6nmLUkCgjn1VK94ZHFSECRwHFs8thEVSSsRbkFx7MmbpSf6M4OuV+7DnUcuevzCevr3e3unTFBZ3T8vo8giuRjflFN7tLhscQDEruRu7m0m5n2xHZVY/QGCxZsPVRv+l0kir05QaCDJ1Me90pBEFXiT9zjtLxIVM8AuJGKuuPfRT+WmCaum2XjI2JxBKtvUb1XOmAY8BSjsdSPtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6EUR05FT038.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::4f) by
 AM6EUR05HT155.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::485)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 09:47:47 +0000
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 (2a01:111:e400:fc11::4e) by AM6EUR05FT038.mail.protection.outlook.com
 (2a01:111:e400:fc11::443) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 09:47:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DFD88B866A29A6DB9EFAC6D8FC4F01EB42A3203852A9CE97A0D939449B0C8660;UpperCasedChecksum:0637D7242D9F76AFBE9AB85016B113256DCFDE8FB7452367E7D0D790A83EBB9B;SizeAsReceived:9112;Count:48
Received: from DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59]) by DB7PR08MB3130.eurprd08.prod.outlook.com
 ([fe80::1096:7af0:893c:6f59%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 09:47:47 +0000
Subject: Re: Lightweight packet timestamping
To:     xdp-newbies@vger.kernel.org
References: <DB7PR08MB3130BDD01387627E7FAD775F9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <b712de09-fd35-1d5e-1842-31bb3b2e163d@gmail.com>
 <DB7PR08MB31304BCD517885F0E1C063F69E830@DB7PR08MB3130.eurprd08.prod.outlook.com>
 <87d0667hm9.fsf@toke.dk> <20200616180001.7409bbad@carbon>
 <65a07187-8005-a78e-b684-eaafda886fa5@gmail.com>
From:   Federico Parola <fede.parola@hotmail.it>
Message-ID: <DB7PR08MB31300A48E2638C814C929B929E9A0@DB7PR08MB3130.eurprd08.prod.outlook.com>
Date:   Wed, 17 Jun 2020 11:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <65a07187-8005-a78e-b684-eaafda886fa5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To DB7PR08MB3130.eurprd08.prod.outlook.com
 (2603:10a6:5:24::15)
X-Microsoft-Original-Message-ID: <177f9df6-9e2c-0e99-d2b9-0bfe2dfcbdfe@hotmail.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.96] (93.88.125.241) by LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 17 Jun 2020 09:47:46 +0000
X-Microsoft-Original-Message-ID: <177f9df6-9e2c-0e99-d2b9-0bfe2dfcbdfe@hotmail.it>
X-TMN:  [fCUAS0LnOzQQ5wyL4AYP9o+i+BEWpM1W]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 85281fcc-f08a-4948-2e56-08d812a37d89
X-MS-TrafficTypeDiagnostic: AM6EUR05HT155:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78cprypgKahfBecmFr+8hcAKRtV8RItjbijMtzBzME1LD8cCr23zpxI1vrNwfhkXkCv7C5JPdr6LniJpu5ZJt2S2eUfyzElZ7nntYS1sJtQr2kb6jmmK9kapEnSudcnSFrFjOXyG3GMvYTaRj3urMGmAywH0tLT5xp5p0qSV2RVEbN55JzE8fBXdtWXdRlXpd4ViIkvvMA8nR2kIH+L+1oMYm1mOhVLNTsrCgRyp3ksxs0mbQ7rcNDaiPProOeCp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3130.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 6UK3bKfLkAtZeEjrWfD/1reVW2gczaWHEU9abNT4K5VKZOMPUCZsZwAH2PidQe4dSCCPByUTlBlxluHtsO6I5kQuXyGa3d/0LPXO34n7StfLAE0r6mHeeOYIDT8RXbmmD9J5wn8zSvYGJNQsB2NDfQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85281fcc-f08a-4948-2e56-08d812a37d89
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 09:47:47.0385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT155
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 16/06/20 18:07, David Ahern wrote:
> On 6/16/20 10:00 AM, Jesper Dangaard Brouer wrote:
>> On Wed, 10 Jun 2020 23:09:34 +0200
>> Toke Høiland-Jørgensen <toke@redhat.com> wrote:
>>
>>> Federico Parola <fede.parola@hotmail.it> writes:
>>>
>>>> On 06/06/20 01:34, David Ahern wrote:
>>>>> On 6/4/20 7:30 AM, Federico Parola wrote:
>>>>>> Hello everybody,
>>>
>>>>>> I'm implementing a token bucket algorithm to apply rate limit to
>>>>>> traffic and I need the timestamp of packets to update the bucket.
>>>>>> To get this information I'm using the bpf_ktime_get_ns() helper
>>>>>> but I've discovered it has a non negligible impact on
>>>>>> performance. I've seen there is work in progress to make hardware
>>>>>> timestamps available to XDP programs, but I don't know if this
>>>>>> feature is already available. Is there a faster way to retrieve
>>>>>> this information?
>>>
>>>>>> Thanks for your attention.
>>>>>>   
>>>>> bpf_ktime_get_ns should be fairly light. What kind of performance loss
>>>>> are you seeing with it?
>>>>
>>>> I've run some tests on a program forwarding packets between two
>>>> interfaces and applying rate limit: using the bpf_ktime_get_ns() I can
>>>> process up to 3.84 Mpps, if I replace the helper with a lookup on a map
>>>> containing the current timestamp updated in user space I go up to 4.48
>>>> Mpps.
>>
>> ((1/3.84*1000)-(1/4.48*1000) = 37.20 ns overhead)
> 
> I had the same math yesterday and did some tests as well. I am really
> surprised the timestamp is that high.

Do your tests show a similar overhead?

> 
>>
>> I was about to suggest doing something close to this.  That is, only call
>> bpf_ktime_get_ns() once per NAPI poll-cycle, and store the timestamp in
>> a map.  If you don't need super high per packet precision.  You can
>> even use a per-CPU map to store the info (to avoid cross CPU
>> cache/talk), because softirq will keep RX-processing pinned to a CPU.
>>
>> It sounds like you update the timestamp from userspace, is that true?
>> (Quote: "current timestamp updated in user space")
>>
>> I would suggest that you can leverage the softirq tracepoints (use
>> SEC("raw_tracepoint/") for low overhead).  E.g. irq:softirq_entry
>> (see when kernel calls trace_softirq_entry) to update the map once per
>> NAPI/net_rx_action. I have a bpftrace based-tool[1] that measure
> 
> I have code that measures the overhead of net_rx_action:
>      https://github.com/dsahern/bpf-progs/blob/master/ksrc/net_rx_action.c
> 
> this use case would just need the enter probe.
> 
> 
>> network-softirq latency, e.g time it takes from "softirq_raise" until
>> it is run "softirq_entry".  You can leverage ideas from that script,
>> like 'vec == 3' is NET_RX_SOFTIRQ to limit this to networking.
>>
>> [1] https://github.com/xdp-project/xdp-project/blob/master/areas/latency/softirq_net_latency.bt
>>

Thanks for your suggestion, currently I have a thread in user space that 
updates a PERCPU_ARRAY map with the current timestamp every millisecond 
and the precision seems to be good enough.
I'll check your solution as well.

>>> Can you share more details on the platform you're running this on?
>>> I.e., CPU and chipset details, network driver, etc.
>>
>> Yes, please.  I plan to work on XDP-feature of extracting hardware
>> offload-info from the drivers descriptor, like timestamps, vlan,
>> rss-hash, checksum, etc.  If you tell me what NIC driver you are using,
>> I could make sure to include that in the supported drivers.
>>
>

I ran the test on a Intel Xeon Gold 5120 @2.60GHz on a single core using 
a dual port 40 GbE Intel XL710 NIC (i40e driver), forwarding 64 bytes 
frames between the ports.

Thanks for your help.

Federico
