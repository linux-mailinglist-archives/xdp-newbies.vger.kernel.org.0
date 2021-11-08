Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A00447D16
	for <lists+xdp-newbies@lfdr.de>; Mon,  8 Nov 2021 10:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237729AbhKHJ4B (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 8 Nov 2021 04:56:01 -0500
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com ([40.107.21.130]:56801
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229807AbhKHJz5 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 8 Nov 2021 04:55:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5/y1BqJxMQW8AXwVu62wuzVqmrpDOCVwteNlo71NeGclo2nV1URazuSIa3HGcQe+lpywmhKyHVIUIb2gZZLwrsZgc+40SWkO08ljzlyJj6N0Q5CrNeyYzxKNRGybFRusl8UcmKma6c/WZhXgTUeCysvVOO95gDa+J5jO8mWWiW2saWVr1pkR/kIuH3/cwyr8enstJaOpc5j8T8I4ELX+ikdXjL8bqGcaRmYUBSm6kvHkPmz1SdNJNt1AXRc1gIIGbWRt/TblaMzcFCwhFaghMXFY14FvWBedqVaZtc0L/jGi81/F+91WgBDxyHtEVwbBrfZLNT5mcLxFW5PDGBbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne5WQK2f4uFmQDgeQgYTJgNVtAPnk5e4c8zxyVbvqJ4=;
 b=lVMFJEEVfJC16fq8bEhN1fkqoURsEizP+cbtjoURqmq+gJXtBgOihp/YqHFJpLimOt3IQBzfXKnecOadccXV2sQa2dyW+olJwfNkZVrmzcXnKNIs4e8JW+QVfa7loDSLVu3ygdr3SXdTbGXdquVzOiHEwjB5b2HajDBMxRYQEyDCTrL7dflWx5qCgrRl96RIuXlfL5TX1hwHM3rb1wV3pEqfVX2tg/h+unNiM8gSk69l27dLqB1fD+bnuPRn5fBUnUuPM3LFC4IO8vaJ5sCBFICsW7+JnmirgVxTmjicgl9Fn6ziYTvwGdPM5A+e73Li5JjHsg8zSb8Z3xsgTmUVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne5WQK2f4uFmQDgeQgYTJgNVtAPnk5e4c8zxyVbvqJ4=;
 b=nYVvO5hJBS6Gcf0tn45Zh/g+7s3viGiwkjW126a9bcwms9bypXERJn0D7E5XYjTUt5MsF/uMxKmYxheYN565Pl3/NAqoWIOeD2+zww11A35WhGQH8LYqP7v/GQGr47iAld6BoSWKSCVm/zWl3U+tliHNvy8ZfQAxBobWW3zWNY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AS8PR05MB7877.eurprd05.prod.outlook.com (2603:10a6:20b:258::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 09:53:11 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::50a7:7a0b:413a:864c]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::50a7:7a0b:413a:864c%6]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 09:53:11 +0000
Message-ID: <cb827b68-ae61-5116-7f84-d930ba66f0eb@polito.it>
Date:   Mon, 8 Nov 2021 10:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: AF_XDP busy poll and TX path
Content-Language: en-US
From:   Federico Parola <federico.parola@polito.it>
To:     xdp-newbies@vger.kernel.org
References: <eeb976ca-4af1-34fb-4723-bddd77f972cb@polito.it>
In-Reply-To: <eeb976ca-4af1-34fb-4723-bddd77f972cb@polito.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::7) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
Received: from [192.168.1.61] (93.88.125.241) by ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 09:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8f51683-fc99-4349-1479-08d9a29d9357
X-MS-TrafficTypeDiagnostic: AS8PR05MB7877:
X-Microsoft-Antispam-PRVS: <AS8PR05MB7877DD391C429541DB8F86F6F2919@AS8PR05MB7877.eurprd05.prod.outlook.com>
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IQzXjasiJekkeNwR30YDq1IocG7RXRnCKncmcGIhmHx/jCQOqDkNE0U2kcDbBRyWzPdBLP+k8C74Ni+sxwJXHFrNgZ8DLz0JjZdx8wKBcQBe3MMsHNqJEPc9uivB3pmzhx1JOQHc8/XV5R+fR7Ip41PNnIliZS0C1aLv6PxSkMFL8AjpVNBFxM+/XW6Lb4vZbEps+c3lch+bf4scwEHgkL8BbAYEMZ0wF1ZhHbC9fwJxzJP0bldDfhD2OoBdC6oG6X9xg71rjH78Z8m+im6TxKsIj/xYZJDL5NjZUx+RqLkPn6fbZtPVrkeSScYHb4BqsF27NyPG7cw8JDP67y5jnBh51+BEXuS5w9K1fG4qCZXkwBRrPRD3hUC76okh1LqdJoe7Yh6OFZcyx1JVbnZAPGbJuDJ/46Sje2H6J1IcQDY49XcZV0NU2FurvI9UrIPobOrK4A8s3/yYPXouJSkragujVEr5tOjebUEyb/fR76YtvyQ9CG0xSkqcNfddKKfHZ5j+rBNa8U/GGWISt83T1HmrVOAnqE/W9wPGmuZKA8ZcNK++Lr6+IWouvOoMh461EcRzAn3XBA4vd1DTyKTLpwNSOeeJbKa0qsGsaAI3zkMzIidf1EU5i216DSTl5qxUy7erksO1cv5p2rAFn5511/G1fbWWqQSnq5H8hrS+43pfMZ8KN0/rMQuji8zrecz8cRsWC66b3nARU81lY5OwiLgK2HT1IBjQmbYCKviX+2ZNL/03cwTC3YqKZF5Br7kSdLLu4y5ZX6k/aiGusXeLkljmM3RyGwySfxqg0P4hVkJdEPgHb0TvxPxFekNdcEYPWOfg5zWZg9qbAY4X7kHtb1L1n7HkCXC+yVNUo2WhCoVhI3+XQ/awOz3slC1fubqS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(83380400001)(186003)(53546011)(508600001)(31696002)(8676002)(86362001)(2616005)(966005)(5660300002)(8936002)(316002)(786003)(16576012)(26005)(6916009)(66556008)(956004)(2906002)(36756003)(66946007)(31686004)(6486002)(38350700002)(38100700002)(52116002)(66476007)(10126625002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVnUk5EVzFYdkV3Nk0wdlhFTzVOc3RyRC9jRFBORExrRUMxa2tFeDcrWEZr?=
 =?utf-8?B?UC9kUE01REpLNmxKbzVnVFRqb1FnbTdQTUUzallSY2dYdVdIM3RIYXlFNkJo?=
 =?utf-8?B?Q1JoVlVmbUhtbWttREVveDlBOVdjc0dyNDgrUjNxTUw4bldyZUtnK25zMkdL?=
 =?utf-8?B?OVVRbUErNlNJdjhPeTdzOE5waGFkd0RHdUNhVTRINWhYV2pNVFY2SjVSZ0N0?=
 =?utf-8?B?MzlQMUFhWXZXaGF1OGdKd21nc25IZEQ0RittdkFINFc1NGhSazhGZnhGWUxp?=
 =?utf-8?B?S1FCVDJGeE40SEE3QlNCQ0JFcTgzY1c3dFJ5b1FBZDBsZHg4dkp6SGFCUjBs?=
 =?utf-8?B?T1d1NVBpd3hxOTZFREpQbVNyNW5EQnJGWFIzOEYvQXg4Z2IxaDIzZUs5bXp3?=
 =?utf-8?B?OUhXbEpvVDkwNkZvRDM2U3dheXdMWkREUVA3VFZLNVE2VTNXS0pFYy9pZEFN?=
 =?utf-8?B?NlFTdXVQbWZva01qQkUyR3g0QjVVOENtK2hCWWZlR0J6RkJSc0k5T3FTc1pI?=
 =?utf-8?B?L0ZKb20zNjduK2JUdUY4SHEzS0FEUEFzVUJMN1RYSEJ0QVdsU0s5Zk9qMm5k?=
 =?utf-8?B?dk16Z1NUTDhNci9nZ2Z5TnJWRWNieDhJY0hOc2x6b2J6Nk5sbjVuSzZWVlZo?=
 =?utf-8?B?VGdVRVNscWFMZXdCOGRlTFQyNFNIdFdVQjR4LzdpRFNqenFoc1I0MjZRbE5r?=
 =?utf-8?B?R0hGZ2IrbldHL2pPYmlvSHJ3UEM5RGhrdkkxUHV6emZsNXJkQVRDWjYreHJI?=
 =?utf-8?B?Qk9sZVdZck1ESDBKSklsL3JBVmViVDdITG9BMkV6MjBicUZWL3U2ZW02Ujhl?=
 =?utf-8?B?OEtEdmdsbzRvYm8rc0pGd29NdE53dGM0dW9FZXpncHd1MTRtak5kSU8vUUV2?=
 =?utf-8?B?K09pNGhoZG5LcXlJeUgramNGeUIzdWIydHM5RUtPbUlwZUZxNTl6aHBaSkpq?=
 =?utf-8?B?bjZzWFlsT2RNeFNObUNhcVI2ekRmMkZPL1dyMVN0T1hFcFhvTVYzT2o0L1NP?=
 =?utf-8?B?bVRFcGNBZkQxdWtGT2UyeElYbzl0WVozbkQ1MDMrMU5leHNJNGlMaVlmR3d6?=
 =?utf-8?B?eEtwdWlCVlBwTVovSHVVQlcrZ0NvcFZmLzVHbG5aNVhQS0lXQnZDcG1hWkJk?=
 =?utf-8?B?dXVEbEoxUWx3dGxSSUJ5WFFiaGFjRVFrV0pkUmhYNThwc1dhMlVlTFZiOG8r?=
 =?utf-8?B?ZnMzcTJrdFpmUG1YNm13MitPQkdoMFlidWJSZ2FnZ3hYUk41N2gxc1hRWXVu?=
 =?utf-8?B?b0o1SUhEZmtHRW44ckV2TGJyWUFDTzRvUUJQbW0rZXdvNG9nMVhxOUlnUi9h?=
 =?utf-8?B?d0JLK3JaN0JlejJaNm1DdTVKU3ZibTAwUWZXUFlJNzFFSExRbUN0VmpnNEZj?=
 =?utf-8?B?VHJaNUxMS3dKeVZsSzhBL1BweFViN0F4ck5qQ1VPZGlWU0hRdHRsQUZDQnRs?=
 =?utf-8?B?dG5CVnpLOXY3YTlsWjQxVzJJaEl5aCt5RncrS3U1VlhaUEVyb2h3SmtNV3ht?=
 =?utf-8?B?alNMTFNuV1BLdFA4RFphZFQ4ZStKcDROWm5iSGo0aUpaWFlmRWVGL3ZVNWFu?=
 =?utf-8?B?N0tRbVVwQlhSTUlMWHcycm1pNDB4YW5CNjdBSmhPdG5lL3M3TVY3UWxySGRy?=
 =?utf-8?B?c3dKM3VsTDRwNjlrdXJSTnB3TmczMktvYnk5S3lVenJFTGZ2VWpyalV3eFdF?=
 =?utf-8?B?aERqa1BnOGRLaDFSdnU1a25Cd2s5QzNueWVmdVk3bU81N0hLYi83Z2xGbDU0?=
 =?utf-8?B?eDhRMThPZnJzRUJaNFhFdzJVSzluS3h1T3ZMOS9QK0RtU0hhbXZOMXowTHZC?=
 =?utf-8?B?eWlXc3g1cFVuTGNzZEtiWjZ0eWNMa2d4VGJSSnowQk1XWkNYM0wzWFpHcmtJ?=
 =?utf-8?B?bjMyUkZETWRLa0ttS0JCMHNXcDZXVytKT24vc25uME5FNmZ2QzcybVphQ1dY?=
 =?utf-8?B?NjZ3bVB5RjBSK24xVXVsdDY2MDFYbUo5bHFYUHp6REUyei9GalJpSFFHVFFh?=
 =?utf-8?B?amlMdXVxSFpzeGRlZ1BDMEhaMkpHQXgwSzJDYTJhRW42eDZTMVVUWFFKc2o4?=
 =?utf-8?B?c3psNWFDd24xL21GK3FvbHJrVEFxY1BONG91SWNBNFJXZllyOHR2RXRYcSts?=
 =?utf-8?B?bER5dHpYaWxvTWorNkZWU0dXMk1NY09PYjFjZlZCakVJZHhoc2lFRE0zdkk5?=
 =?utf-8?B?UC9IZlN6ejJxZ0VDVzBIQU9GRXduaktJZTgvN0VCTWVQNmRnZTArWld0dmFG?=
 =?utf-8?B?b0Y0UXdXUldRQ1FUclN6bEg3YWZnPT0=?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f51683-fc99-4349-1479-08d9a29d9357
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 09:53:11.7387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foFZGmVrkVc7NmB+TixIqjxWrZKfLUYRbRIZYWyvmJhHoEpNe3j0i8anIjtzAQmvo3o53YRH1ZvcM/O2Rk087o7tsvR/r7wrmsXtJ2GWU3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB7877
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everybody,
sorry for bringing this up again, but I didn't receive any answer and 
I'm still experiencing this problem on kernel 5.14.
Does anybody have some insight on whether this is an expected behavior, 
a bug, or maybe just some problem in my code?

Best regards,
Federico Parola

On 04/08/21 10:55, Federico Parola wrote:
> Dear all,
> I made some changes to the xdpsock kernel example to support the l2fwd 
> scenario between two interfaces. I didn't use the xsk_fwd sample because 
> I didn't need the complex umem management used there.
> The updated code can be found here:
> https://pastebin.com/p54T5nfW
> (I'd be happy to submit it to the kernel, with proper modifications, if 
> you deem it useful, just let me know).
> 
> I get a strange behavior when using busy polling on two interfaces. Here 
> are the numbers I get when testing on a Intel XL710 dual port NIC (i40e 
> driver). I ran all the tests on a single core (both user space and 
> interrupts) and tuned the input rate to achieve maximum throughput (this 
> was fundamental in the non busy poll tests). When running in busy poll 
> both interfaces are configured with:
> 
> $ echo 2 | sudo tee /sys/class/net/<if>/napi_defer_hard_irqs
> $ echo 200000 | sudo tee /sys/class/net/<if>/gro_flush_timeout
> 
> TEST     | Mpps
> ---------+-------
> 1 if     | 10.77
> 1 if BP  | 13.01
> 2 ifs    | 9.49
> 2 ifs BP | 7.25
> (BP = busy poll with default batch size, 64)
> 
> As you can see when I move from 1 interface to 2 interfaces in the 
> non-busy-poll mode performance reduces a bit, but I think this makes 
> sense since we are handling data structures for two ports instead of one 
> (does it make sense?).
> What I don't understand is why performance on 2 ifs is lower when using 
> busy polling. I made some tests and saw that with two interfaces there 
> is some sofirq CPU usage and the tx port keeps generating interrupts, 
> while this doesn't happen when using a single interface.
> 
> My question is: should interrupts and softirq processing be disabled on 
> the tx path as well, when using busy polling? Or is it just a rx feature?
> 
> Best regards,
> Federico Parola
