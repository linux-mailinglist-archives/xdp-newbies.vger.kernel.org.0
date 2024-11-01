Return-Path: <xdp-newbies+bounces-160-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9059B9132
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Nov 2024 13:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB60283655
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Nov 2024 12:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3350719DF8E;
	Fri,  1 Nov 2024 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mwuKWR31"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2055.outbound.protection.outlook.com [40.92.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64E22097;
	Fri,  1 Nov 2024 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.58.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730464668; cv=fail; b=BnH1iksSGTH+dG42dHu65H3pYhvhwZ8s/KRjdwFfjAdx0KbLjXFwNiRx9AWdRlR4572gYMx6fFMPSMDBtjYVFkyLpjDqs2ko604MGBop9ZN5veyOHDBUaYy1EPUmE3085zWzl7lc70mv70WRWZloQGdJcomsie537G782Jh0E8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730464668; c=relaxed/simple;
	bh=XUpJUM2N1a/X0P4Spxg5xrNaMgb4VmdvlE2BdCJtwf0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jyYHMFLAKFp/ICkIs164kLyi9y2/CzdUNms8/rXr5cozXoUTnZfihtkhMzHAIDk22i15NG2hwZkR2p2MaMa/iYjRs6xtCziQE1PhysHnstIVXrZudmUqC3HqHv4074iQPeuMXJP2IsFT80TBbgKpJndwMhg8U9mEwWecNBopiO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mwuKWR31; arc=fail smtp.client-ip=40.92.58.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwPyXGeLbDS7+xsyi03NuXovnZLIEywZp35Syvch/c+f8vyTncXyzVgP6cLXd6rmwC78SmJPUfHj2hH6wGGOMC79pPkyj/sg2EUZwSvZGaMCqRaEfvyk+dO7BrEA65WWDK5WZELP1e8UdPxsCiWBG8111s3to4EYYLsBo4xqDqUrvqkR5jimvty38nXKyl64+OESxWg6b28Az8TEdUCDaeYkNEAKZ/hC+z9sYWjXrlYz5mQXMC5nLrO/ONsTyGCJ5RaDvR6Lh4xEkb5d48ljEzWMS3qvLmuBp5HEm6wUUkUYPVDihEzu8NUhnNtAeLdn3wfrNZS7t9vLCQpZdiyBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KklkXy1bHV9JWp5vd8bWzZ18TJDRqVRPkNAx43bzlxk=;
 b=hYvdpfy79TerM19ZspR20cwTin0QKINZcF0Z9wuizITPVKcIQA9oOZsX48rlTGYfu4qsqXDhx8wCmTI/OmWdvYuHx5Ifdf5FyasHqw00Soy6Uyz89H36lm3i8a6Q1OrIf3Ia7if2isDKMj5zR/AyVq2AFjpHxwVrvog/8IQNAUsIRETVGq8oG60qDVpCv/kuhs0xrTRhhScINj3ZsF5CVfULg9rHTSaS30gM2Kh9m0CbiJMx3qOAPjZ1B9cdQXEAUF2Nby5QCYVt8McDETQc/xPE2kjWHy8Rv3QC2yh03KlsMjOtDjziTOCznFNGZIwOgFptdf4koOIuuD8x8CTp/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KklkXy1bHV9JWp5vd8bWzZ18TJDRqVRPkNAx43bzlxk=;
 b=mwuKWR31hAkdMT1D2mH11wDinLlUKCgwyixJKkiWhRiQrvvJlC2CYd4ussgA0QW1lerVD7uUJP3yvZS/Rj8IwvSucDhGu6rhTpccn28iwVRDgjGSZg1gBnUstFAijxMPbQgyIU3qZYzhHQ2CMwZ6mopFMoYoBCxg+R2OpmLZIkcDh0GRSCiDD6CWJ2wRQBUL2UQZ+TzkeORZrVehc1Aw0QQ/dP6tEpYVJLA6aZsKi4cEdLPPwZ8+TAZJ1V8VBKOWdqc3Z2cciVr2QV++m6KUUvoNiQsSspr79NxnKFxPzwPdgfPd/sUTn3hfcTywEtVPBiuNkUhSFxdZl7MqgeXDyg==
Received: from PA4P194MB1005.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:bb::20)
 by VE1P194MB0750.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:149::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 1 Nov
 2024 12:37:43 +0000
Received: from PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 ([fe80::2903:e8fd:39bd:f0ca]) by PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 ([fe80::2903:e8fd:39bd:f0ca%6]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 12:37:43 +0000
Message-ID:
 <PA4P194MB10059D2195A387ACD32CA27E86562@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
Date: Fri, 1 Nov 2024 12:37:41 +0000
User-Agent: Mozilla Thunderbird
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@gmail.com>,
 "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Larysa Zaremba <larysa.zaremba@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev <netdev@vger.kernel.org>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <30bd4ecb-961b-404a-ac3d-9c25c8269e4d@leemhuis.info>
Content-Language: en-GB
In-Reply-To: <30bd4ecb-961b-404a-ac3d-9c25c8269e4d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:102:bb::20)
X-Microsoft-Original-Message-ID:
 <9db26f44-d969-4482-8624-54df0bec155b@outlook.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P194MB1005:EE_|VE1P194MB0750:EE_
X-MS-Office365-Filtering-Correlation-Id: afa3e99d-c7e7-4614-a324-08dcfa71face
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|19110799003|5072599009|8060799006|6090799003|461199028|1602099012|10035399004|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkNHQ0p6NUcveVJweTZJVGhLejlEZ2cyRUlJbXVoUEhYVm1RS2I1cUdydmJR?=
 =?utf-8?B?cG5GNmRYRUgvSjhTUkUza1ZOUDN1Q2dYaDNsZk8zckpTeHJZazRnKzBZOWNi?=
 =?utf-8?B?QUdFT21mejRRWXIzTVowbTdwY1gzczMzenVTUi9KK0x1SXRjc1NLR1Zxam45?=
 =?utf-8?B?Z0JtdnhGeUV0WVhETnk1T0t4c2k3QXU4OVpBcFdJbkY2YUZIa2toajkybVRx?=
 =?utf-8?B?MGpVV3ZCMDk3V3YvMDJrZlcwZ2srZHpiYXNZU2F5YWZyeDZaRjZsK3pmTlpn?=
 =?utf-8?B?VmxodFVrVHBoNWEvS056b3NIcmY4eXBhU0MwSlRESlEyRHNncmYvVzlzdUF3?=
 =?utf-8?B?bnVidFRIcEhrRmFIdEV2L3JKeFlaTThOT0tQSi90V2lWR0xDYnpoWVlWcU5X?=
 =?utf-8?B?TWNVQm1CMkNhdkluNE5BUlhEN0RFWE5iLzk1MzNPR2VhMDFNZzMxbURqUVpw?=
 =?utf-8?B?eWdnNVpmMGp3YXRydUhqTjB2T0ExWW0rY2FTc3ozTWI5aWJyZU1oQXhBUTNk?=
 =?utf-8?B?TmVjTGwzNURkNFB0cG1qZ1crUmlyUXh4NExNKy8vRUdLTk1Dcm1PMnRUZUlT?=
 =?utf-8?B?NGxaK2dBeGlNcXdMdkQ3bjBPbDVlcnE5bERvVXU2T0dCZ2svK25YcWdzQ2d4?=
 =?utf-8?B?dDRLMEhOa2I0bjZocS9iRXNwcXlWbUpzM2FaZVlNV0RpUnNHQkUvc2lNN3Ru?=
 =?utf-8?B?d1lZcTJFd3prL1FiaVAzQ0dFaU5aRUdlckZRT2wxY1ZHdTFYaXRxTlR5M3VO?=
 =?utf-8?B?RHNpc0tjaGdsUWFRNmRKd0o2ZWdaRkxxOUR0RzBYYlVtdHF3ZEo5M3FSNDhG?=
 =?utf-8?B?UVF1RjFMK1N3WjJ1WGxvQlgyd3NXSmh4Tjk1by9IcS9VeWliNHUyajJ4RmxF?=
 =?utf-8?B?cnNZUnhOUGw0cEVyUmcyeDhHdUxVWHNPVWsrVzRhdlllQm9ta0t3QURMUUFh?=
 =?utf-8?B?MXVhTkJnRmsxcnZPcm03OU11V28rR3Y1VncyTnIxdUY1RkpDZEM0cGhZYW52?=
 =?utf-8?B?M3Q3eDFnN0xESGdaSTU4cVdqL0NjYThtZG5vWWFxdS81K3FlREV1SytUemM0?=
 =?utf-8?B?UVhnSGZJclJrTlJHbUh2WDRzMmZRb0MxNzE5TDBIaWl6dTF2WFZ4OW1MQzd6?=
 =?utf-8?B?OUlMVEtYaUoxVDJDazFDekd5ek9TWExJVXNTUmtSY1JhZzhiYXZPQWN5VHNF?=
 =?utf-8?B?L3hJdVRPdmxmR2ZtTUJQSllMd3hWNWNQMTcxM1ZCZDNCeDloL1daZVFsM3A2?=
 =?utf-8?B?OGlIN2xhd284RnpGRTNVMTdsTDRYenZKbmYyZjlJVDRoMmZBQ0dpOWd3QUJy?=
 =?utf-8?B?eW1RZVlSQ2tFOE9GbDZNZFBoY1grSTE1ZzEzbitYRks4VElmUitRMkJFT25r?=
 =?utf-8?B?TkJuS3ZneUFuT1JtQVZud0RIYVRqYWFid29adWRHOTNyaWRKQmovZEhxOEFq?=
 =?utf-8?B?NW9xc3lDdWs4OEFVd1RNSmFQeC9FWjd3ZDdUUkdZUkxxUTl5aWlnekdrQWJT?=
 =?utf-8?B?UkxhYTFRV0NSbzRKVGFxbmxNYW0rb3BRTjgrdlQ2QUZoSU5kWWhlRWovWlFs?=
 =?utf-8?Q?3iBcd/dkp7cz22oZsP8GEo/SsWSVlytKfIaDzjtncO+oR2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUVNaTVJSy85U0RaVFFRTUNCenU2ZWZnaGNCVy9MeW5TYzVteHhFbXNqNDdW?=
 =?utf-8?B?R2RNODNaMXJJeXgyV2h2UXJFNC9ESnZBU2h3dVh6dXhJVTdjbW8yREZ5Z2w1?=
 =?utf-8?B?ckJGcFlRUlZkUTlIZ2VFVzdLUHowQ1lSTE5mM1dZa0dpRHVtRVlHcnArVSt5?=
 =?utf-8?B?U2tsbzNRNXFWSFdYWUs3VGJ0N01vbWl2VzJ0MVptbVN0K2hlR0RYWktJMzRG?=
 =?utf-8?B?WmsvZ1ZncjhvV1kwM3licmRxVGVjZVpkMUx4ajQwR1Z1M3BoM2M4SStNMmpK?=
 =?utf-8?B?ZFJHMzQ4TDkvRUNiU3JiSktJNUpJYXVnUDI1WHZ2S3Z5YnIrSVBuWHpsME1r?=
 =?utf-8?B?cDhVWlRuSHJNdTBzK2dsUmFDZGFjUHN1ZlREN3BTZVA3T0JXVkFtRy9IVEJN?=
 =?utf-8?B?UTBVNU5GbVFiYzF2UENxODh3ZUsrZmJNRSszVk5lRnpFU0ZpMCtFem5FNjJR?=
 =?utf-8?B?VGt6MjM5akRVSUp1dlpST0Exc0dpUE01U01wTXVjUTZVelhONG8rTUpsUGRX?=
 =?utf-8?B?RERwK0g4NkRmYjdHTU4ya2U2UzI1V2JJLzJFTEo1ZUdvZTNOSXJlOUQ0R0Jp?=
 =?utf-8?B?dlhVeGR6aVJBU2FzYldoYitRdkJMaGI2UmhreGp5aFZVQmM2ajdTZVBlc2NS?=
 =?utf-8?B?Y250K2ZodTAvOTlKMm5CT0RHczVBTXJmSkJiUTZIR2VEeDdRdHJzd251UTJy?=
 =?utf-8?B?L3FPUGtUVGhqRE52VTh2VDFUUDRZdUdLSDBmeHc4LzhJN2xtT2lCQ2Z5MVk5?=
 =?utf-8?B?SVA0NUJxTFFLRGROaUFkUTdEUHlCNkQxamVvVWN3SWlqb2FIcUNaQWc5Sy85?=
 =?utf-8?B?NkVBbzV6aFZvd05PckhyYXU0eWNtTktGMUxZc0RNOXR5UUhqdjk3Y2YrdWpx?=
 =?utf-8?B?Z2l6TDQ0aC95bUpERlZseG1RdzdCV3hsdmxIZEE4ZzJIWE14d2kyMUUrM1lp?=
 =?utf-8?B?cVQ4ZVhrZHpIOThMaVpYUjJZVmVSVzA2b3kwRHprWkRqN2xOeDBXRVJKOElE?=
 =?utf-8?B?S1VBQUw2bHh4VkZpTTROOWxDSGkwQkdqOHRRZ1VPVmtHV0YxRkJYdTUwS2dP?=
 =?utf-8?B?R2NDNjlUUHU1K0g1Tk9peWVJTUtacHBXY0xxY2lScC9JOExrTStGMTFnTUhv?=
 =?utf-8?B?L2xiaVBYamJRK21ncUNxNHlhMlJQSDN3ai9vdFJUQ1p4dzdNZzQrai84SUoy?=
 =?utf-8?B?Qy9ZSEppdzNIYUJ1bnp2MHN6cldsWm80alpzQUxDU290RG5YRVJFSHNCZUd2?=
 =?utf-8?B?aTFhMERNcHA4LzQyRVcxbTNxc2wxcjIyYXVhUkh4WDVBUWpHUTNUT1RXeTZS?=
 =?utf-8?B?YTJaOFdzem5rL0NFMFk4dWpXVS9sMHU4b0M5blZWZnVDZjREWHhkcWdmVzdX?=
 =?utf-8?B?cHVhOWdQUEp3TU5QTzhPSkF5Y2dHd05HS0RrUUhoUFlWTUlvaG1wY0I4clov?=
 =?utf-8?B?NVFvTDNOVEdNaHlucUlOTHV1Ri85T2ZhYUFkZnpqQjlUczZQWkd4UnB5UVAv?=
 =?utf-8?B?WERvZzJpUEwwZmtGUDcvaG1XY1RJMkVNRENxcTI0UEJqQ3JQTnFQUXV4dFhB?=
 =?utf-8?B?YnQ3UGpxbVlGbXNsQXIwM3ZkRW1IaDljS2RRQ2UwTHRaUUd5MXYzQWY1V0Nv?=
 =?utf-8?B?b0NQNUlCd1pxRkIvNzA2TndKL1R5UGpUQ2M2K3hBWC9XbGYzR3NXaitUYXFB?=
 =?utf-8?Q?KZQPKUVhTuSB8uST+80x?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa3e99d-c7e7-4614-a324-08dcfa71face
X-MS-Exchange-CrossTenant-AuthSource: PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:37:42.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P194MB0750

Good day,

On 27/09/2024 12:32, Thorsten Leemhuis wrote:

> [CCing a few people that were involved in mainlining the culprit
> (8adbf5a42341f6e ("ice: remove af_xdp_zc_qps bitmap") in case they want
> to provide advice]
> 
> On 13.09.24 17:54, Alasdair McWilliam wrote:
>> On 05/09/2024 13:50, Alasdair McWilliam wrote:
>>
>>>> We've been working recently on somewhat related issues and it looks like
>>>> not every commit from [0] has been backported.
>>>>
>>>> $ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
>>>> 5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
>>>> 8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
>>>> 15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
>>>> 3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's
>>>>
>>>> can you apply the rest of it on top of 6.1.107 and see the result?
>>
>>> The first one I've attempted doesn't apply cleanly to 6.1.107.
>>>
>>> Eg: d59227179949 ("ice: modify error handling when setting XSK pool in
>>> ndo_bpf"). The above looks to have been based on code from around 6.8 or
>>> 6.9 where the makeup of routines like ice_qp_ena() has changed. Looks
>>> like this happened around a292ba981324 ("ice: make ice_vsi_cfg_txq()
>>> static").
>>>
>>> Should I try and apply a292ba981324 as well?
>>
>> I just wondered if there was perhaps any further feedback on the above.
> 
> Hmmm. No reply afaics -- but that's how it is sometimes with
> stable/longterm kernels series, as mainline developers are not required
> to participate in their development.
> 
> Still it would be good to fix the problem. So unless the developers come
> up with plan, it might be best to just revert a62c50545b4d in 6.1.y;
> guess asking Greg to do so might be best way ahead unless some solutions
> comes into sight within a few days.
>

It's been a minute since I've looked at this due to other commitments
but accidentally bumped into the fault again when testing the latest 6.6
LTS for a new feature of our software. (I forgot to revert the commit
for "ice: remove af_xdp_zc_qps bitmap" in our build system.)

This led me to wonder about the current version, and can trigger the
same crash on 6.11.5 [3].

Reverting "ice: remove af_xdp_zc_qps bitmap" [1] in the current mainline
is a little more complicated as commit ebc33a3f8d0a ("ice: improve
updating ice_{t,r}x_ring::xsk_pool") also changes things a little so the
reversion doesn't work cleanly.

I have tweaked everything a little the below patch [2] applies cleanly
to 6.11.5 and 6.12-rc5 and seems to fix the fault.

Thought I'd bubble this up as it's definitely still an issue in the
mainline kernel as of now.

Thanks
Alasdair

[1] Commit adbf5a42341f6ea038d3626cd4437d9f0ad0b2dd

[2]
https://github.com/OpenSource-THG/kernel-patches/tree/main/2024-11-ice-xskzc-page-fault

[3] 6.11.5 ooops

[  565.069120] BUG: unable to handle page fault for address:
ffffa566707380c4
[  565.069144] #PF: supervisor read access in kernel mode
[  565.069155] #PF: error_code(0x0000) - not-present page
[  565.069167] PGD 100000067 P4D 100000067 PUD 20ef17067 PMD 0
[  565.069183] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
[  565.069195] CPU: 7 UID: 0 PID: 6967 Comm: tlndd.bin Kdump: loaded
Tainted: G            E
6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
[  565.069220] Tainted: [E]=UNSIGNED_MODULE
[  565.069228] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
3.2 12/16/2019
[  565.069241] RIP: 0010:ice_xsk_clean_rx_ring+0x37/0x110 [ice]
[  565.069338] Code: 55 53 48 83 ec 08 44 0f b7 af a4 00 00 00 0f b7 af
a2 00 00 00 66 41 39 ed 74 33 48 89 fb 48 8b 4b 38 41 0f b7 c5 4c 8b 34
c1 <41> f6 46 34 01 75 30 4c 89 f7 41 83 c5 01 e8 f6 0c 7e ce 31 c0 66
[  565.069365] RSP: 0018:ffffa5660f8f36d8 EFLAGS: 00010293
[  565.069375] RAX: 0000000000000000 RBX: ffff8bb105d38600 RCX:
ffff8bb184930000
[  565.069387] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffff8bb105d38600
[  565.069400] RBP: 00000000000007ff R08: 000000000000050b R09:
0000000000000000
[  565.069411] R10: ffff8bb10f910000 R11: 0000000000000020 R12:
0000000000000004
[  565.069422] R13: 0000000000000000 R14: ffffa56670738090 R15:
ffff8bb1116b5740
[  565.069434] FS:  00007f677a5d1dc0(0000) GS:ffff8bb85fd80000(0000)
knlGS:0000000000000000
[  565.069447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  565.069457] CR2: ffffa566707380c4 CR3: 0000000120164005 CR4:
00000000001706f0
[  565.069470] Call Trace:
[  565.069480]  <TASK>
[  565.069489]  ? __die+0x20/0x70
[  565.069504]  ? page_fault_oops+0x80/0x150
[  565.069517]  ? exc_page_fault+0xcd/0x170
[  565.069531]  ? asm_exc_page_fault+0x22/0x30
[  565.069546]  ? ice_xsk_clean_rx_ring+0x37/0x110 [ice]
[  565.069598]  ice_clean_rx_ring+0x16e/0x190 [ice]
[  565.069650]  ice_down+0x2f8/0x3c0 [ice]
[  565.069692]  ice_xdp_setup_prog+0x193/0x460 [ice]
[  565.069734]  ice_xdp+0x7a/0xb0 [ice]
[  565.069774]  ? __pfx_ice_xdp+0x10/0x10 [ice]
[  565.069813]  dev_xdp_install+0xc7/0x100
[  565.069829]  dev_xdp_attach+0x205/0x5d0
[  565.069841]  do_setlink+0x7d3/0xc20
[  565.069853]  ? dequeue_skb+0x80/0x4f0
[  565.069866]  ? __nla_validate_parse+0x125/0x1d0
[  565.069880]  __rtnl_newlink+0x4f7/0x630
[  565.069892]  ? __kmalloc_cache_noprof+0x225/0x2b0
[  565.069905]  rtnl_newlink+0x44/0x70
[  565.069915]  rtnetlink_rcv_msg+0x15c/0x410
[  565.069928]  ? avc_has_perm_noaudit+0x67/0xf0
[  565.069943]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
[  565.069956]  netlink_rcv_skb+0x57/0x100
[  565.069969]  netlink_unicast+0x246/0x370
[  565.069980]  netlink_sendmsg+0x1f6/0x430
[  565.069991]  ____sys_sendmsg+0x3be/0x3f0
[  565.070003]  ? import_iovec+0x16/0x20
[  565.070015]  ? copy_msghdr_from_user+0x6d/0xa0
[  565.070028]  ___sys_sendmsg+0x88/0xd0
[  565.070038]  ? __memcg_slab_free_hook+0xd5/0x120
[  565.070050]  ? __inode_wait_for_writeback+0x7d/0xf0
[  565.070065]  ? mod_objcg_state+0xc9/0x2f0
[  565.070076]  __sys_sendmsg+0x59/0xa0
[  565.070086]  ? syscall_trace_enter+0xfb/0x190
[  565.070098]  do_syscall_64+0x60/0x180
[  565.070111]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  565.070126] RIP: 0033:0x7f677ab0f94d
[  565.070136] Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 0a 67
f7 ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f
05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 5e 67 f7 ff 48
[  565.070164] RSP: 002b:00007ffd1e4f7a60 EFLAGS: 00000293 ORIG_RAX:
000000000000002e
[  565.070178] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f677ab0f94d
[  565.070191] RDX: 0000000000000000 RSI: 000000001d698848 RDI:
000000000000000a
[  565.070203] RBP: 000000001d5350e0 R08: 0000000000000000 R09:
0000000000465f98
[  565.070215] R10: 0000000000200000 R11: 0000000000000293 R12:
000000001d535110
[  565.070227] R13: 000000000051d798 R14: 000000001d698830 R15:
000000001d5384b0
[  565.070240]  </TASK>
[  565.070248] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_
defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_tables(E)
libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
intel_powerclamp(E) coretemp(E) kvm_intel(E) ipmi_ssif(
E) kvm(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_support(E) rapl(E)
intel_cstate(E) intel_uncore(E) ast(E) i2c_i801(E) pcspkr(E) mei_me(E)
drm_shmem_helper(E) mxm_wmi(E) drm_kms_helper(E) i2c_mux(E) mei(E)
i2c_smbus(E) lpc_ich(E) ioat
dma(E) acpi_power_meter(E) ipmi_si(E) acpi_ipmi(E) joydev(E)
ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) drm(E) fuse(E) ext4(E)
mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E) crct10dif_pclmul(E)
crc32_pclmul(E) crc32c_intel(E) lib
ahci(E) polyval_clmulni(E) igb(E) polyval_generic(E) libata(E)
ghash_clmulni_intel(E)
[  565.070304]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
dm_region_hash(E) dm_log(E) dm_mod(E)
[  565.071430] CR2: ffffa566707380c4


