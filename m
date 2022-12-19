Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EEF650828
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 Dec 2022 08:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiLSHlk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 19 Dec 2022 02:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiLSHlh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 19 Dec 2022 02:41:37 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2116.outbound.protection.outlook.com [40.107.105.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07522ACC
        for <xdp-newbies@vger.kernel.org>; Sun, 18 Dec 2022 23:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4GxpJ3YCxemJkeUPIQYDNGQB0e1kG0YwpBzckkfBksdrWy4I5tdF/jA3Qy+Jpu91SZidBnPZDM4u7LK1GWz1ybHdghOv50fF2ZkFMw1aFmYh5XRyUGRN335lz8XLuu/YJfJGsElbHq7tPoLV757cq22/ERWlBPQkLJZilJuyDKeL/dIMysNNEOUw+H3sXDEsbr1qh6lJUrGTr8Y6Na+SEQPUysTuZezfRAow9sc0gu2v8lGRs0u6Sjj8lppcolVA8ci8BRyZksqCvEqW8XwP7UWsssP8hSNUvepeZXvGhFZgAVtRsuouzQP2zbbvvzsLObAdJF6/hx3AJv2GJ7NcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE+MHr5q7XF2xuB0Nmtd1hl28Gm6xonCXiPKpWN+zTI=;
 b=UvsT9jb9FucjrlYAGwaIMst9CTcI9L92bARsMnw0GOAYu0yV6rLSLrTNZduCUHDXlFe0RsZct4jw4dZVfu0CLZbU+wvN/PVbSe0+tLyIbcx8G07f4dQQhKvguqy+U2y6b13TOUZ33JOan9UB4C84onHU7MR/PwyzFRQqeHg47IiqGjW1rPGwW/oqU22HZpi0fQUq6jatoWtvaXFuksc725kvgkJVjMALhn2pbKTRqWKwPe4WnY9nPiVFYaqcshVq2PuSaRE+WvGZsw0+qSc4tDm3zYpxZe5FFbKRzyg3I6KSoNM9+hpadoxN4thRx9EgNQ5B7vv+Z1tnfIeLtGL//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE+MHr5q7XF2xuB0Nmtd1hl28Gm6xonCXiPKpWN+zTI=;
 b=sQuh3PxWU0CkWYoks4MKeJgcKGZvRIYHwK3pQwsjotOnFP0s1LlzhqUubOS7ezUNRRecgxJ8YaVd8iBKLnWRS51pmv0Nj5dHV494ue15X8mm/tW2houVFUIpgT1v5m01FHSrWp8X0vr93Z6NB1ulfoTfcV7LcK31PQdxoyGC+x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com (2603:10a6:3:6e::18)
 by AS8PR05MB8582.eurprd05.prod.outlook.com (2603:10a6:20b:3cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 07:41:26 +0000
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7]) by HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 07:41:26 +0000
Message-ID: <86f02c52-48bb-6128-fd26-b332dc4769ed@polito.it>
Date:   Mon, 19 Dec 2022 08:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Why choosing AF_XDP (busy polling) over DPDK
Content-Language: en-US, it-IT
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Andrey Slastenov <a.slastenov@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
References: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
 <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com>
 <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
 <CAJ8uoz0zo3zH8a_Zq+L5WzDYjgZh7-pU+ubo9MSbmk-NbxKoiw@mail.gmail.com>
From:   Federico Parola <federico.parola@polito.it>
In-Reply-To: <CAJ8uoz0zo3zH8a_Zq+L5WzDYjgZh7-pU+ubo9MSbmk-NbxKoiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0135.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::14) To HE1PR0501MB2603.eurprd05.prod.outlook.com
 (2603:10a6:3:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2603:EE_|AS8PR05MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 717f7454-933c-48a0-6e5e-08dae1946f09
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fb2T2/fyAeOu2ll5ci6zBHh6qpbcDUC0J+o1f2GKoQ+LAotu1SfJDtGVw0iDRyjMZsCfQtihcPl7QzKIgR76PQ+9Ce91ZKK2CNpQAzC4C9Inu+gb8yHRT4WpsNGVeYie6MwJNrdfvhtirHIM60UTizNrAwL/XtWXTY7kLgZ+1PP2DMYibJalXEFVygC0DK46+Y2MGZKy3DWTFAJgKGRMWEyPju3paCM7rlioKzY6d7il1HM+tH+kTz7Ahnr058O+pkkpjmso4kbCKQ1bTW5if4Yi1uy7i70kDfypefaOfhLEcE9/HomtGCX12BEKGoMCT877DeoneiUNKuny0sXNnT5OAp+NqYci0dfAovz+VYW55DQAFWelOsJfUQP9EXzOlgNnGXvVx8P2A6BLy8LH5nXIqYATvQ0AJFZg63gJZO2HWrwyQRnQRifdPwiJQ4OK5nBD8m/esn/cHLMaIyi2Snro3FyH1cYq2lfmanuY1hzr5Oaym0x1yCJtrpZRA3DHt1DenBHELEO9vPUYCJ7bHn1s16qr8NpmuzDnvSfvnXshG+h+tTNYZ09cXV7dIEo1vMT/QPpJ8nJFFop+U3I23HA7/ogAH/r6SopMeOA31KxpNKf0plyixJQyQbaZCWHfIp0ycPdQ6JkEZqyL2OJhCUDFgVJJQhSGLZfUQrMYyKp2uowgdf6cc5/pPVuuN5M3JEH+iCBNNEIj/IbM15cw2vM4CDcx2weXtyXPH82Z8GokK/LNJ7/6say16e4n/LKX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0501MB2603.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39850400004)(396003)(376002)(366004)(451199015)(31686004)(8936002)(8676002)(66476007)(66946007)(66556008)(4326008)(5660300002)(44832011)(41300700001)(786003)(316002)(2906002)(110136005)(41320700001)(86362001)(2616005)(31696002)(83380400001)(55236004)(6506007)(53546011)(6512007)(26005)(186003)(66574015)(966005)(6486002)(478600001)(36756003)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBOai90MU1qb1BOdjlScmNlS3o5YTh1STl1M0dBNVd0dk1jUWNvZFc2M1RN?=
 =?utf-8?B?NDhJcElDMFEybXZncm5GNlJoUlM2TXZCdG5BZUlvMEY3cFpFWlZ5SW0wUmhu?=
 =?utf-8?B?bkJCMXFhcmJheGs4a1BiRW1ydTU3MkU0T1QydjB4SmNtS1hFa0lvUnE3SDZt?=
 =?utf-8?B?ejFieWJFSFBxMEExZVlIT0ppOU4ybkZTY1FEVDlmUXZGNWJhRndOYVBNRHQr?=
 =?utf-8?B?UXlaL050cXYxTWFBMVlKdGVoeGNZV2FzaUlYOW81RVh3emxRWEd3bkw0YkZM?=
 =?utf-8?B?bWtYdUl4SThPcUxOdzNTdmxXZXFRcnhvTFFQUjJubnRwY0h6U2VYWUp2M3h5?=
 =?utf-8?B?S25KNkM4dVNaTWdsR1hHOHVSZzlhemRjR2RQWmpMSVZCSFhva2FUaHVFQnBa?=
 =?utf-8?B?MFJ4UjlZZjZwNUdTNzRjb3lORTVneVYralZFTTY3VFhnYnkvVTRwVFNaNDVV?=
 =?utf-8?B?U2JQdGp3Mk1ubW52L1hOVy9WbmFFeW1oNnN2LzkvRTd6aFROYXUxbjRTUzlv?=
 =?utf-8?B?OGE5c3ZCSDhublR1UVFCcU9NNXhmRnVVWHMwVFQwZFd6L0o4MEU4ZU9hODk3?=
 =?utf-8?B?SmFrSHFSaExXUnNqV3czTlYrblY1UU5WSkFUQWR6V0lQQjZKNlhSWVJSdFI4?=
 =?utf-8?B?c0grc1RiOWNEaU8zTnFocExkNnJUU0tVOHl2VFFaOWlySTJtNzJ1RVZzSGVX?=
 =?utf-8?B?Tkk2T2dzenFxamZDRzgzcmQxYVVyazAwVC9WOWZNdkp6d2RFV20rQUpiOHlW?=
 =?utf-8?B?S24yMmxLUm5xN0NjemNnYktHYklNbExFVmpPSXdjVHNBbDhWbk5icE5sSFZZ?=
 =?utf-8?B?OFM5QUVMbUVFVDZ0RFkrVUpNRGR0ejR6YWRIYzk4NEtocDEzUDVLdG9qWTY4?=
 =?utf-8?B?WnliSTZIMGpicFYrM25Ja29VZjFPQ0d3MzlMQ3VvMXYzaFhMQ1Fpd0VocWJ3?=
 =?utf-8?B?eERtaVhLbDJWZWJoQVlYOXB6aXZERUlSNTk2ZEQwc09GYmtuSDB0OEtzcCtO?=
 =?utf-8?B?ZDY2N0hTMjhNSm84bzZMbjNtRXh1amRoL3NyWXBLM2I2YmEwRlI4b2sxVFhE?=
 =?utf-8?B?Z3BwRkptYkRDYlc5Z2ZwRDQycksyTnVERkpPUGNlVndXQllVekZQcFFOUVky?=
 =?utf-8?B?S3lvK0lsWGpRSkh6T1p3emRuOGNpd0FDOTdwNE9LajJQdFllcmpNS3JxektN?=
 =?utf-8?B?MWxMTnZjWExacVVFWHk1RW11OFFQUkYyR0R4WTRVMndlNm5YbDFyUkprYndy?=
 =?utf-8?B?bUcyMmNKNk9yTGpvWldhMStOcDVIckd0SlFNdm5VWUNsUzN0QXdNSGhWdkdZ?=
 =?utf-8?B?VlBaUloxK2hjbktuQ1ZHMlRGZGRTSzJxellINGt4UmlHNWEzQlNBaW1BSkdL?=
 =?utf-8?B?YitITnE1dEFSZSszOWV2RmwvZkhhb3Nhb3IySGUvQzhCM0ZRUVA2VUNnN2Ew?=
 =?utf-8?B?NVByS0ZpancyYkZGU1BCTUp6MWxYOGsrR0ZLSi82NURsSFFBUnV4MDVyZklF?=
 =?utf-8?B?dlhDRld6WFhtUGRYS2JiWmJXV3VzL3hyZEV4cUdwd2RVemw2SnpIeG8xZzRY?=
 =?utf-8?B?cXFhSWJBUEhFR3BSUk1idldvamxlV3RIV2k0T1MwbHplMkh5RGtISTh6ZlMz?=
 =?utf-8?B?OEFFUVV6YUNiMWJLeVY2UVlEejJUSkZ4dzJ5UThtb09URHp6QWVXK1pFNFRJ?=
 =?utf-8?B?NjJHVEpXblJabFhjbFMyeGVJY2lyeE8xeVRxQmNDelA1N2hDMDdDbUg2TklB?=
 =?utf-8?B?QmxZbktRZDZ4aStrS3F3eHhGeVMwN3VXU3JWSEdFek12d2lTZFR2OEpZdWhu?=
 =?utf-8?B?a0M0Z2puSmlqblFlclJkUlFSSjFqK3dEMklaaXRURXNudGNLdm9UZjJrTjBX?=
 =?utf-8?B?amdNVkx5T3hNR0MrMjRGZnN3bjdvbU5mTGw2V0FTcHh0ZGVlc1ZzN3JzeUVL?=
 =?utf-8?B?Y1hJVTRqbEVCeXB0aEhSb3RlSnlCSEhXQkZNN252cDNzRWlRTU5UemZnaVAw?=
 =?utf-8?B?dkZKMktFVVZNeWg1WGhGVGlhWS9uckw5TzdFRzZxaG1WOUV5UW9odEQzeVlE?=
 =?utf-8?B?Q1VYck1TZXhvTUdzS0pWdm05RWNlVXhyWURLbDM1dWRjRmducDVIK0E2UDdI?=
 =?utf-8?B?Y2RBV245enljMDM1eTdPWnBpanNXQ3RFbkM5dC8vbUgvekVWdnVFSnVpM3dm?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 717f7454-933c-48a0-6e5e-08dae1946f09
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0501MB2603.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 07:41:26.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ie6ulFsGBAPy1XvgXM+DjrRRb7SQoRMyPL16kxGNwLDIqy0HLz1yg+zCf+uTOIG+QvQlm4pJGXpZxsicLgr2WKU/ptZ0HEkArji+He+DV0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB8582
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 12/14/22 16:31, Magnus Karlsson wrote:
> On Wed, Dec 14, 2022 at 4:16 PM Federico Parola
> <federico.parola@polito.it> wrote:
>>
>> On 12/14/22 10:00, Magnus Karlsson wrote:
>>> On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
>>> <federico.parola@polito.it> wrote:
>>>>
>>>> Hello everyone,
>>>> in a context in which all traffic is sent to user space, and the main
>>>> concern is performance (so AF_XDP busy polling is the best candidate),
>>>> is there a reason to choose AF_XDP instead of DPDK for packet I/O, given
>>>> that the latter is still much faster?
>>>
>>> The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
>>> The choice is do you want to use user-space drivers or kernel space
>>> drivers. There are many pros and cons with both approaches. The two
>>> main advantages of user-space drivers in DPDK are that they are faster
>>> than their kernel counterparts and you get access to many NIC features
>>> that are not available right now from user-space if you are using a
>>> kernel driver. Kernel drivers, on the other hand, enables you to
>>> deploy your application on any Linux system (from a certain version)
>>> and does not force you into the strict execution model of DPDK (which
>>> is what most people use with user-space drivers). Everything in Linux
>>> is still usable and it is easy to have a system that mixes data-plane
>>> processing with other types of workloads. If the only thing you care
>>> about is max performance of a pure packet processing workload on a
>>> system you have complete control over, the choice is easy: go with a
>>> user-space driver and DPDK. If this is not your ultimate goal, then
>>> XDP and AF_XDP might be something to consider.
>> Thanks for your answer Magnus.
>>
>> - Concerning deploying an application on any Linux system, what could be
>> the limitations of DPDK userspace drivers that AF_XDP doesn't have? The
>> use of hugepages?
> 
> That would be one. The requirement of shared memory, forced unity
> mmap() calls that might fail, lack of binary forward compatibility,
> etc.
> 
>> - Concerning a system that mixes data-plane processing with other types
>> of workloads, do you refer only to the capability of XDP to steer
>> traffic either towards userspace with AF_XDP or let it proceed to the
>> kernel? Or are there other features of DPDK userspace drivers that would
>> impact this kind of system? Maybe the use of busy polling is too
>> aggressive to share the CPU with other workloads?
> 
> Yes, busy-polling and sharing a core is not a good idea in any system.
> But there is a good solution to this in DPDK that uses capabilities in
> newer CPUs. Basically, if you use DPDK you should adhere to its strict
> model of one process per core, otherwise you will likely get into
> trouble. Either by performance dropping significantly because you
> enable things like interrupts or 4K pages in DPDK, or because you do
> things like trying to run to DPDK polling threads on the same core,
> which might result in deadlock. If I am not mistaken, there is a
> concept in DPDK called service cores in which you can share a core
> between a normal process and a DPDK data plane thread. But it requires
> you to program specifically for it.
> 
> If you want to steer part of the traffic to the kernel, you are better
> off using XDP. Bouncing things through user-space is expensive, DPDK
> or not.
> 
>>>
>>> There are likely some good write-ups on the Internet about this.
>>>
>>> /Magnus
>>>
>>>> Best regards,
>>>> Federico Parola

Thank you very much for this information Magnus.

On 12/14/22 20:46, Andrey Slastenov wrote:> Hello everyone
 >
 > Check out this short article about why XDP was chosen over DPDK. The
 > reasoning for this decision is also explained.
 >
 > 
https://gcore.com/blog/how-we-use-regular-expressions-in-xdp-for-packet-filtering/
 >
 >
 > BR, Andrey

Thanks for sharing this article Andrey.

Best regards,
Federico
