Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F92764CCEC
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 16:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238814AbiLNPQn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 10:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238554AbiLNPQd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 10:16:33 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2120.outbound.protection.outlook.com [40.107.21.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1549417598
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 07:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWWWULoohA+NG/x0c/X+pLIYyBFlAIrqfZEIVFQzOEeD7kzzRxGIN/kUCOJG0NdStS2X32/BthYtpCiStmtgbPyN08tREMUN3cuGWHIyROaUkDaFpONJfrJR9v1FnGxtj6r71YP8dNFGgFJ16lz/TEkPGSclLwLiVKZifiYYvKYgJyKP/MSlnYKclc9cWYWgsDhZi3Kx97sl0V4Gy87aBIrw8RcFY8C+7pFf3OG5BSLPF25bRLQmaJMbkK1mscJGrRTsAcl9J/tiZqur0qzvdQ3VqAye9s8cnPj6TibroX8iMd0L9Ne3SeC/I8Tlyg8ZMPGrjVt98vxJdcx3nGURVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sofHbGo9O6HAQMUQmeOypXtIxiM7ZIrXQgA8X4C3sTM=;
 b=XMseMO9dD3+a45T5ZPlwpmS/+325eI/g/YBma0X2TypaHrH5Q/fh1Vw4smgHNe7FSfWQ6KaSlv/h9t6GAvw7JQblL2TXkDgNaMvMP6Nrl4JCkgb9jkPiuN6t7R4+M17bG/8iOoOqDkl6+8ChscPnmgNCL9QoB0dN3dGQ4BA23f+dyU5lVVexeKZZerpSceUdQxFBHa9nVS/bRuLDt+k6jApYXAOWAQ2YhAs9uSO7sFld5lTUdTYITr9ST0yWuSET9PA+5MnKrkeqVOQd4/+D/ERWrYV9UFZD0g5pGs9ebs+h1xujW3PVm60kWA10lKaVrMZfkaJzjMDXvhYxuGB44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sofHbGo9O6HAQMUQmeOypXtIxiM7ZIrXQgA8X4C3sTM=;
 b=gZmJEDsRx8B2OmsxAEHlpsWiZuFXO8BhJeeVyUhDHGTv+ar0TUy8pD5AHERswJ3eLBjdWMlSunNUAFlM6lxs6ywJX5HhGJNdHVhTqZRy+Kv4Cl0BhIwYkSt5tZr4NSUpWRvsjhqrBxDLQ7xlUVzzwvlSMBtwN4nHwLjF6IZqgXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com (2603:10a6:3:6e::18)
 by DB3PR0502MB9993.eurprd05.prod.outlook.com (2603:10a6:10:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 15:16:11 +0000
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7]) by HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7%4]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 15:16:11 +0000
Message-ID: <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
Date:   Wed, 14 Dec 2022 16:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Why choosing AF_XDP (busy polling) over DPDK
Content-Language: en-US, it-IT
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
References: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
 <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com>
From:   Federico Parola <federico.parola@polito.it>
In-Reply-To: <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0093.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::8) To HE1PR0501MB2603.eurprd05.prod.outlook.com
 (2603:10a6:3:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2603:EE_|DB3PR0502MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 220c11cd-8530-49fc-4859-08dadde62257
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pws7cncomBhwitY/TIaGczCbLq228vcM4DAQfUd5I4FcR9o5a2FpxL9XK4eBmV+cZM0PXoTOJghCzCCdYbAUybMttQYWwt5AsK1kqRTZ6JbCc0rLA9KZwwDI6/OR3lKfG4t0j32OrPnhP2eq1NjowZJb38cskkbIuypYdTDpIIhsMnUnekfH4g/ZemEx5PwPizUljoFXErvHXcJhwnVkYj5fY5AQ6/j62fXFAdQNnLQJS/M1qmSZhu406GppYyIqVzjgd1SvkofugnPh6mbRnfhNLRgQ9TkqkOpHMnzlZYvOajs2f8dI6a4h6La19KPiSSyKAYZyH80kTzAr6T7dr0Agig39bxvGU+h0PuGKTUP6HcrhWNaGkbnsiK2+RmG9zdEtNPG+4LojHk2dj9i6cRXjshAAhDvVBephX63sWZkfZUUiXgQsLCPIUhRCHHvYLecmGigKYXmSR+MLM0CW9I9laTp4QzmMCWSjaiEilGNDQwJ+P4vpahL4mVFBYNFDOGxP974xMUjT02xyjkWITflxPEk+ypCBCz0al5wveeVGIf0PZpFPCxkt//voyomPv95C5J8zO1k+OAKf7DIMG8mzrzfAd/H3TVrfKi/9PSmne+PMKwBe8ziLydyF9GdnfZhDc7TxSlDdYNj0JVhGzIfR+hOhMCIRfJH7zneqV1WHa1qNYeBzjYRBS9be91INbDgPdMa/tC6U1roVYc8VeekvmDKweAAXcWl7I8asVL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0501MB2603.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199015)(31696002)(86362001)(41300700001)(38100700002)(8936002)(44832011)(5660300002)(41320700001)(66946007)(6512007)(66556008)(66476007)(8676002)(4326008)(2906002)(316002)(2616005)(26005)(186003)(83380400001)(66574015)(6486002)(6916009)(6506007)(53546011)(786003)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejNqVnpUaUgrRVRxZXp6NHh6Q3dieEZURDJvMU92amVkT2hwdEtpekttVUM0?=
 =?utf-8?B?VE4xcTVOS2hONEJFaHlINll5ajNISzM0QUhSSVk2SHhXbkxxOUtBUWZHM3BX?=
 =?utf-8?B?dFlBN2dVMVVIU2hIV0p1Nldqd1BUSUpSdHVaVDQyU054SG1PYW01S3dkMkd1?=
 =?utf-8?B?OFBjYnJ1UzRJeERDZlhxYzltcnhEaFdUYXkvdVVHOUNVZHUvZUhnbFlkOHJu?=
 =?utf-8?B?OXpJZTR6MnVkcTNmVnVDaTlKdWx5WStKN3d6UHV6eEU3TnJhNDlOSm9rSTZL?=
 =?utf-8?B?YXl3N0FUSzJ3QmY5M05Ibnd4TG0waVkzTktaTktGSnRZUFduS1lPVVhhWUdo?=
 =?utf-8?B?RGR2NlZOWlZEV2pmZXRQM3VnUkxiWnNoczc4MGVnSFFZaHpvWWJCYldackNE?=
 =?utf-8?B?RjYvMTEzZ2w3V05rTVNhbU1YZHZObkl0YlpBQU9hNFg0aWhTa1hSRFV2bWNJ?=
 =?utf-8?B?eEJZaTBZRzNZc29Bc2wvSVF6a0RxVmh4cy9QYjZiNmxJWTh5SUVkems0VlFV?=
 =?utf-8?B?bk9IcSt3N1A5Tm8yRWE0SG5RaDhXWlhveklzRW1neU9mUVFWNjBPVmcyVkNU?=
 =?utf-8?B?N2JYMVlWb05JdzVvZnZHQnhyd05nT0VZRlI4amlMSUNBcG1WTCs3OWtzSGd1?=
 =?utf-8?B?ZjAwMmFZa05SZGpEa2VYSFRDTUEzdnlaMkpERFNtZDYxS1RRYkp6a0VFelc3?=
 =?utf-8?B?dWlYVkMrajRmOG9aYWRnSXRGa2g1ZGRuU2VrSUE5Ty9XeVBZVE9NZnB3YmxE?=
 =?utf-8?B?ZUJjaFMxTk0vNC9KelVCQmM3TEdWaUFNWWk5d1pXd2VuQVNyRmVCa2NHVVps?=
 =?utf-8?B?RFU1RVQ4Slo0Ukt6eGk5UGFZY0JiZnZPUkozZTRZckRITmg1Q29VRHFiVVRJ?=
 =?utf-8?B?ekdyUkdrUW1YWUV6VFg4N2JTSFQxWUloankzZnR4TEFtQ3BMRHdvekhKRUJu?=
 =?utf-8?B?aVpPL3VXK1BtTWgwb0I5Z3hobkRuWE1NMDhmbTgxazhTL0NsZURsdGZlcUwy?=
 =?utf-8?B?OGpReFB1TVl1SjZQWU1obk1EYm1sQnpLT0ZLWmFLd2hNTkRTTVkzR3pWck9P?=
 =?utf-8?B?MVozckNWWTl0bDd3b0hpZTd4MXU5bXl0bFdVYitLU0Znc0o3Yy8waFVXSjhm?=
 =?utf-8?B?QkpIbDgwYUxqczRXVkY5SHdTUnNIWjYxcGVvemljd0p2amY1UzA5bFZKU2Zl?=
 =?utf-8?B?RFZrZzROS3JHUDE3anlrMGZjRGRYdWpzaFdscEpXVUVQK21wdEYxVU1nYllY?=
 =?utf-8?B?QTJaQWUzSE5DNWdJeEdMZGV3cEpFWmpPUFNpOHdJK0MzTTIrWEx6MHlXdkl0?=
 =?utf-8?B?WVFDdm5oa0ZndGIrSldwY2dacGRyZlQ5b2pJbE16ZW5TeE8rNVRYWTM0RTAr?=
 =?utf-8?B?SkRXTGtMMCtVYjlEa3RRZXQwUFBMWlNyZFZoL09ZNUhUbDd4T05QSm9IbEdY?=
 =?utf-8?B?Rm9kS3lKVFhIRjhxdjV2cElBYWNhc25tQ1ZPV1hoR1dqZFk0NGNoSVJleDZZ?=
 =?utf-8?B?UVcyZ1h2dlBVb1NYMDBGSzhHaFZiaUFOQ2dUZzlhd0tlYzBmWlFIZ1lGMGdT?=
 =?utf-8?B?RlVybWlUQ3pEQkZiamNxVUF2QnZnL2JGbFpNanV5UVRGMmQ4Tlp5dzFRVDl2?=
 =?utf-8?B?U3NLTmwxL0tFWU9KcWpZR2tSK1VWWmc5OEpZQWNBbWFEcjF2bTFRaHhiSGlj?=
 =?utf-8?B?R0hNeUVyMjVHUHdtTUx2MW5CNUhBTTIzTnN5czA0UDlZcmVOcHRJeHFkQS9N?=
 =?utf-8?B?alZjQ1R4TUtUeTRaSGI2a0xpeUgzRmJwcCtRQ20wQXNtVFdOTDBzZW1DTm12?=
 =?utf-8?B?b3oyNmZNNGVnZHRvZnNsV2ZiVGkwMk1mdlVUQUpxT1hRTFZ6UEdtc3ZhM0lQ?=
 =?utf-8?B?RmIzb1hHQmZZd3JHekhGcGVOeHIvUXNWL05scmpKRGV3T0NsbjVlMm1YdUFW?=
 =?utf-8?B?enhzTnh3aVVMZUlucWs3cVBaMG5SamFaTmg2bWx2MW1ZcDNyZzNjaWNUN29v?=
 =?utf-8?B?WnUrcnM4SWNDRnllMlZMVSs0M1dhRGN3N0V2cUEvdGk3VHQzdFdEejM0NWpH?=
 =?utf-8?B?K1NmdTJCYjFSeE5FR2RCY0JJYkxPb3RVWEp2ZGx0elREQ0M4eERUMHEzNVdj?=
 =?utf-8?B?aG5lQzlscDd2cFd0SkFSbWVuL0czSXpCbnRjbmYxNTdlU3JPN3BFNjdod2F1?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 220c11cd-8530-49fc-4859-08dadde62257
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0501MB2603.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 15:16:11.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOcgaqDRYlzEpTcUJrXcY735alnRKHmOAfvtpKVFjtLPoiDLhvx9FNdQialoILbWv8qXXYNAUejxiJ27KVzS8jvNe7oJ0Pb27722Ym7b3rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0502MB9993
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 12/14/22 10:00, Magnus Karlsson wrote:
> On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
> <federico.parola@polito.it> wrote:
>>
>> Hello everyone,
>> in a context in which all traffic is sent to user space, and the main
>> concern is performance (so AF_XDP busy polling is the best candidate),
>> is there a reason to choose AF_XDP instead of DPDK for packet I/O, given
>> that the latter is still much faster?
> 
> The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
> The choice is do you want to use user-space drivers or kernel space
> drivers. There are many pros and cons with both approaches. The two
> main advantages of user-space drivers in DPDK are that they are faster
> than their kernel counterparts and you get access to many NIC features
> that are not available right now from user-space if you are using a
> kernel driver. Kernel drivers, on the other hand, enables you to
> deploy your application on any Linux system (from a certain version)
> and does not force you into the strict execution model of DPDK (which
> is what most people use with user-space drivers). Everything in Linux
> is still usable and it is easy to have a system that mixes data-plane
> processing with other types of workloads. If the only thing you care
> about is max performance of a pure packet processing workload on a
> system you have complete control over, the choice is easy: go with a
> user-space driver and DPDK. If this is not your ultimate goal, then
> XDP and AF_XDP might be something to consider.
Thanks for your answer Magnus.

- Concerning deploying an application on any Linux system, what could be 
the limitations of DPDK userspace drivers that AF_XDP doesn't have? The 
use of hugepages?

- Concerning a system that mixes data-plane processing with other types 
of workloads, do you refer only to the capability of XDP to steer 
traffic either towards userspace with AF_XDP or let it proceed to the 
kernel? Or are there other features of DPDK userspace drivers that would 
impact this kind of system? Maybe the use of busy polling is too 
aggressive to share the CPU with other workloads?

> 
> There are likely some good write-ups on the Internet about this.
> 
> /Magnus
> 
>> Best regards,
>> Federico Parola
