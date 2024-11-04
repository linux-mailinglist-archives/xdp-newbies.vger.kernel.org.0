Return-Path: <xdp-newbies+bounces-162-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B59BB47B
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Nov 2024 13:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7021C204F9
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Nov 2024 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFE01B219A;
	Mon,  4 Nov 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q2HQYx5Z"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02olkn2107.outbound.protection.outlook.com [40.92.49.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF015C139;
	Mon,  4 Nov 2024 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.49.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730722694; cv=fail; b=FI40hal0BSxYW7Qyc31htktoQFmPY8aBvyDJ+R9V93xR1uhNU8ZfAC4rFRYgRwA2xjrThpNyYrZGkxU3hOOfJTI8pVauG8cnUAcefVeJAqohcAUNTy2pLawASdEibRXcTxhVrqjz9WsZ42dsuIGWqxrZpHxfwWbHGiX25qjEdBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730722694; c=relaxed/simple;
	bh=IQudVE+KzrR805BEnTv0kUatEG2oqsutZRcCTfHK5dY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VXufhrzkoFQ0QiiC+Aihq8RrgS8nOth6t9+6NsTwfE87eBBcwVWXpSnzRiZAZmMe3IfUu5oKs/GPr3Qf5SkWRGuLxxux9wQJzKhl8d06TuOhgeDbrA+Fm6QZDURiE3PJCLpgXIBv8j35aB4CRzLFk2HLX+OhvupNA4brFYFfQ20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q2HQYx5Z; arc=fail smtp.client-ip=40.92.49.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGw4zwRIYqrydzatf3SWnEA+tOiCg8Yd5JEybauA8TL9eOy062j3EKRZY7LAPZhU34HCDs8e4NxXWqYBgEQ4+5hqcBew8Q0Cd3XgDnXNA+iXOFjZ3EjaBvjvccqrqgqTpjbjtL18X8FSjMaYMecs2ZlKzEUttxj6Cn/Fenal4oa5Elt8/1HK4/E8k6nisKdbMZ1pxqYbmYFXnkY+907jYOaFE7ohyywLIhnSfei/z4bS5OXVnb95FkQQV91TUcYkappySB2CUwaiQCf9RZhuZBUPq2uFpot623b5FCqQWiP4BDlqn1/hRLfmLrEstOG+ur0m4N6KvGleLe1pxzMn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjfARnaWNAEkZwuKgv5lKyc2Gg4NML3MQfsGihsVnIA=;
 b=PIkN0bMR+DX8UDI2cxQ8UfI6RW7POsurBEUOobTsxbfM4coj2wP3YnWFsco4x9VWFf5bRWHaat8dldgSa+7unL3TZI/EXQAfSb2+9HSqpmX7hQY2cbyuO5rciQEl6W77FrYxOOQ9s2fayX0t+IdS5jzD4H4FM+XW2RZVRQbk0svF2r4Dg9rBaWOmQl0CQbpbNWzioeVmxDHAgYKekvMWkQ3HBB+dUa7Fy5IdjV+dJXPyw7GIWeG1C+gNTN0Pv7I1JDCtFW+Nvx08pFvpxkvJr4WFHt/sEhVcrK97bn03ZYcwXwFqczR2SoHlBylir4GmAEPBRJhCuxrZWLxSxhb54Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjfARnaWNAEkZwuKgv5lKyc2Gg4NML3MQfsGihsVnIA=;
 b=q2HQYx5ZAdN+/GQvZrkwXXMxTUUS2QaqKxt9vOKPiedh5is3QVbN0ZfXWBezVNOmAc5NZqLnepoMdL3018uibUoqToLirHAhe9PHWe23p6stYSffuaJzveIkuc4ihwT2S7X2ElH2NLHRpbyYq6WhAmYwTurtfnaLW4ujT3xNGrdCEiNj1sGBuJEUIbAve8A+U3pRkljCl0kNqbN1SFM7mNMMSMnOpequza2/B0Brw6MOzYRf835kLwrG2QbsIXoNFCQteexy8WtIwNI91qcDc6JTxTbNmCXTOW5HaSQK4plXhbFvrLaIQA/X5KLlLyYKWwjzddVCrOqT1Fg0kzv0YQ==
Received: from PA4P194MB1005.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:bb::20)
 by DB9P194MB1259.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:296::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:18:09 +0000
Received: from PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 ([fe80::2903:e8fd:39bd:f0ca]) by PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 ([fe80::2903:e8fd:39bd:f0ca%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:18:09 +0000
Message-ID:
 <PA4P194MB10056F208AF221D043F57A3D86512@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
Date: Mon, 4 Nov 2024 12:18:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Content-Language: en-GB
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Magnus Karlsson <magnus.karlsson@gmail.com>,
 "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
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
 <PA4P194MB10059D2195A387ACD32CA27E86562@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
 <ZyhznlGIjio3saic@lzaremba-mobl.ger.corp.intel.com>
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
In-Reply-To: <ZyhznlGIjio3saic@lzaremba-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0043.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::16) To PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:102:bb::20)
X-Microsoft-Original-Message-ID:
 <a154d9d7-dd33-4ee5-b682-5ee771448e3e@outlook.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P194MB1005:EE_|DB9P194MB1259:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8d72bb-1264-4108-f48c-08dcfccabe4e
X-MS-Exchange-SLBlob-MailProps:
	JXe7TI5Vt+yqtXtFcsd3cJiLEPuOoEdbePBNvXsL49HbebDcqyJzB9AGkncL4bdVCENWC54ALRENYvZJOqDUng1AS6qh5MozZiLKh9dlecQ2axlEzBsV0IzL4ImIUNdF9eFRmxFVHWpH9mZhOGfcQlt/erkS1rWnenfwUIMm+LFZzjMGyfIj8EpOZBDFgIybG+6ncmTKOuBzvhymcp8gyPMoCN133RpMgi33HiFBu66G4cW7GsBbPEmPKOKNNRQlL+Nsa76BnOzLl6HMgXuqK0Dn/5uctIMzJrh0NcEgQq024IIBS4mnLv+DTkArB1AbwefzC7D1mNan38wPQmxwmDl5kmoB7TAz55/8xJ/5ZA80BTOUb1qLWsbeutwecSL/tZ9vX4EiIfNLjaFVLhCmVzPWPh8KR5qg1UV3pVAsL7Z3UTksFwnaVOlAW90xASjpaoMaZ0kztBetKB/beRif9ofVXnpbEbFJMC41D7D19UiWcuI2cmeBQ66MIuZv9icGR7w5D8aNHAGOJa//nvgrIxIKMZQCJf1L80ZKaiZO6V2GYzmXCtsyV0bMJgA7jpWIt0B3IuCjIK15L7S0dYR13LAhM0ujNsmWvczfbfb83LnbL+AljX0mszjTtbgMnWy/eeEFHKoPXRdvN102PimZu8oY+k8tuUzAH7msd7g0JwIfnYRuVNPbQD+ZWbP8NxvRGxEZkY97xzKkHwOro0qAaMKPdc4nrxBvNCOP+RmZGCg=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|5072599009|6090799003|19110799003|7092599003|15080799006|4302099013|3412199025|10035399004|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE1oNGpIbTdpUHVsTjFnYmJFSDN0Nis1OTZ0cTJQOUdFaTBLSGhVZlFVRDg0?=
 =?utf-8?B?eWEyZGJBN3grMlNvenY3TWpXaCsrQktaNHI2dHJBTGZlZnNGVDFDYlR3cnpZ?=
 =?utf-8?B?THdBZGhzdEJKelRibHhORHB2QWZHTXJIclJ6NHpZdzczWU4yZmdhK1k3ZEJ2?=
 =?utf-8?B?amdiZGdkZWswQUxkRmFpUnNvMVpJV3A2TTJvcEZkVXhUaWt1aG41aklwc2hP?=
 =?utf-8?B?RW1RV1dSODVZSjhwZ0dRbEdxSG1vVnpDY0QxVVNnUDUrWi9Ed0dWQVoydUJ6?=
 =?utf-8?B?SXBJQUVwWHBwUXEvM0VPK0VYVE5PVmUxb1dlRlJjNlBZakF6aG1XRU9BZVQy?=
 =?utf-8?B?ZUpBdUNXRUg2aTdPWUVXOVJtd09RTUpBM1ZzOWJFcFdkSGg1Y1U5TE1pRmhs?=
 =?utf-8?B?bkhGQjIwWGp2WktGdEVHQTUwSkZVYjVNWmlua0Nlb0E1QytpWVIrK0JvaCtG?=
 =?utf-8?B?eXlpbHpYTW1WWjIvYzVVUzZvaXdOU0tQd2ZkTkM0QitJMU85WUhDSGpsQUVV?=
 =?utf-8?B?bWhDdWxkaEJEYXdCeDg4dUh4c2pRckIydFIrQ2daVjlINnhhaG5sYzlaODRQ?=
 =?utf-8?B?RWZMMXZEZVNLQkJ0ejJmckFqa2hZK1k3a0svVFo0WjhPQ05Ud0xQVkRybHJk?=
 =?utf-8?B?OXB5cVd2UDN5WDhoUlRGck1Tb0U0UkhVUmkvV3VHUzRTV3JnN3o2cXZuWml5?=
 =?utf-8?B?YjhaRFAwNDJuK2wzQkEvcnlDMTVvaUxoRGxmaWYwbkJuVmRyY2s3S0pNTVZN?=
 =?utf-8?B?K29uRThlY2N4YXVLNTFWd05jQ3hpK0ZvdDl1T2tkVEV6OHdvK2dMTUJIc2lE?=
 =?utf-8?B?aWRhOWVrMmQ3Tmc0L3VrSS9wMGFTanZDTE1MRnlFZW5uRi8zYkxSYi9GM3ZG?=
 =?utf-8?B?Vkp1TmVrcFB4cmI3NTJRRHJEY0NLTXJHVm0zdXZsRDRKaHVFbVl0bHU5V3FL?=
 =?utf-8?B?VWZHa2x3OVZsWFRydVlGTXRWSTFQVXBwWm1WRC84SnEzczVEOGh6RnZGcXEz?=
 =?utf-8?B?YndnSEtKbVlhUHBHUEkydy90NXgvSXorckxYK1lzMTM1RTloZWNveDBTVWEw?=
 =?utf-8?B?a0tzRnV2SjVGNWRxUzdHNXg5Y1BGdGJ5YWZ2eGhnWEQ4NllyUitIbE5EcTBx?=
 =?utf-8?B?S3dRUm8vciswQm1ZUHdtaDI4U2I1TWNEc3pBV1N4blhsYks1MjZZcWhjSmlG?=
 =?utf-8?B?V211NkFsQThnenBONVlDS1haS0sveEIzZDZVV0ozS1BvU3dPaGdsQVNGdjI3?=
 =?utf-8?B?dVBKcFJyTEE4OTlzcGhYZVJuR1JXRzg0OVIxOHcrRHZoejRqTUdLWEluK2FU?=
 =?utf-8?B?RVJPSXZvQ3hQQmpWUTA4ZFh3WFQ4Z2lVdVYwSmY5OEdCdnNZNmw5MDZnZnBQ?=
 =?utf-8?B?b3FHSUhpMGJsVVpnUW83akNGaDNzQ0xFZzlCTUNJdjZHbVE5ZzdCNjhRYzUr?=
 =?utf-8?B?cW1hMVc5Y1ZNZmx5UGs5VEpZdzBaTk5mRys4TTAyQ1phbFBhdEo0eWpRbERZ?=
 =?utf-8?B?L2ZlcWxvQVdjM1F3MFhTWHd2dFVzUklDM2FYRHhZclZ5OGpiditYKzhnWjR3?=
 =?utf-8?Q?8vn4WfH3ci+hUYe9SXdDN59yypObFU/P6dOZWERIAGJ8ar?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEhCOXB0NWFla2lpcVdWSHIydDBsVHBEQ0hCdUw0L0QraFBLSnVZR3puN3h5?=
 =?utf-8?B?bDJoQWkzbTJPRlFBUnBoR2hCWWxmemY1bStRK0NRbldBKy9EZWZLc3lOUld6?=
 =?utf-8?B?VXBkZU44SGt0cEtaUytxTE9FbkVJRmlNYTBxOVU3QUllZW9ZSzNvOHVjclNh?=
 =?utf-8?B?Z21YQ0twRGl4NnV5NGdZL0dtM013UVUxN1MxdUxtWEV3bmJ3WkNYV1ZaVmxz?=
 =?utf-8?B?YytwRzFIWW9jTmtxaXNBVHd1bEZHNURYRGN2dHVhRHhTQUlLemxEK0pldEdl?=
 =?utf-8?B?ejg4SEtmMVE3cnM5Rk96NmtUdGkyUFVBQ1FjeHlIZVlhMG5MN1Y2RHBwb254?=
 =?utf-8?B?N0JhNGlnaHQ0NE9acm9OZStibWl3ekdHTTZXYkYwc05SdmtCUGgrbDNmRWVL?=
 =?utf-8?B?eDJvdTFHaW9MRUwvWFhCQTh6bGNMc0s1RkpxOWwyWkJNSTAveVpaRnB6KzJI?=
 =?utf-8?B?N2VPSTlNYTFDZ003MkxKZGJ3THo0N0gxRjlybER5a21FWDQzQWRWM2lUbGxi?=
 =?utf-8?B?amZDalNGNGNvWmg5VlRhT3hTNks4dEQ0ZE14YnlvRlVoYTBvL203dXVnZ1Ew?=
 =?utf-8?B?Z2hWZWYrWFQwNER1TFJPNVVHcTA0S0kwOEtPQjR5T1RTNzllU3Nna0ZibFNN?=
 =?utf-8?B?cVFnekNyTVdqSDlqS1daSHU4d01xS0xDN0VDenFISnpsemNCRGxiYkVZUVFL?=
 =?utf-8?B?T3phcTRzTFE5K1Y5K2hXMzFtUzMxYW5SSlJ0M2JOc1Z0NlpiZzhmYXZ0K1Vw?=
 =?utf-8?B?Qy9URU9YZHhPTmxha2FKd1d6QmFhSy9WeUVoL1pDV3NTYllZajBSYWtTSDE4?=
 =?utf-8?B?K0E4Z3FNQWZRZ1JDS0MwRkdJazVrTCtONlJ6VUdhOWF4TVU1ZUxFQ3BCSjJT?=
 =?utf-8?B?WHpCNlFRMGIyY1cvRWFsTGsvc1l5S3lteE5zKy9XczIxYVgyZU5iOWFtcXBs?=
 =?utf-8?B?U2VaTTk1N3MxZTFSZ0dUSDRRbzM4TzIwL1FnY0I4QnM0YStuQ1RhVHFIR1Vy?=
 =?utf-8?B?a2hpTTd4Wnh2ME5MQ2IzM1RnR0IvL2huaGdwZ2ZHVlJhL0RMNERpWkhxM3hW?=
 =?utf-8?B?SUZsd09kSVEra3M4Mzl2QWF0VVVQV3FJek5IenBSY29xUWNXZ1hyWCtKc0pS?=
 =?utf-8?B?L3NKaHFBa0FySjhrSnJKSE5McFNiRm11T1FHclg0bWFhc1FIOEFML0NvMEhv?=
 =?utf-8?B?SjZIc0YyMWJKdEVuNDZPN2ZYUzRGM0dpSFhqalNTenE5S3d4SkFIVGRvUTVl?=
 =?utf-8?B?SlMvU0s5dUNOWXFlVE50K1pCR3Z0OHlKRFZ0MWMwclQxeEFiVXJodndBaThv?=
 =?utf-8?B?Rm1ZazFDbmdYYmM3dGkzNmR3Q3dhOXhrTGNmN3ZsenllZThvWkF2azhWU1Iy?=
 =?utf-8?B?d2gzUERuODlxbU9uSGRrcmFiUEFkQ0Y3SlVzeURWd2FrWVZXSUFqSDI2LzJw?=
 =?utf-8?B?TWV1Tjk0VXpPVXM1RzJhdEc3ZGEzU3F5cU5iVWF3MXRVM0pBdGI2NVlBYlpR?=
 =?utf-8?B?UERaTkUvK3VJcVJMUUZWV3ZocHZpS2RKWUxaQmpyUUVWNUwzbDBPZExpaSsx?=
 =?utf-8?B?eTBBQWdOaW5sVkh0MTlwWFQ5bVQ5MEZsYUE4WnY3UzUwRlNMMGp5MStnR1B4?=
 =?utf-8?B?eUYwNzRlVjdaSk5sWi9nNUhYT1I4T1Y1WEswOUtmczV2MjB1bVBSaWxZODcw?=
 =?utf-8?Q?8aJdzUdXQzOijQxYqNsb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8d72bb-1264-4108-f48c-08dcfccabe4e
X-MS-Exchange-CrossTenant-AuthSource: PA4P194MB1005.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:18:09.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P194MB1259

On 04/11/2024 07:11, Larysa Zaremba wrote:

>> It's been a minute since I've looked at this due to other commitments
>> but accidentally bumped into the fault again when testing the latest 6.6
>> LTS for a new feature of our software. (I forgot to revert the commit
>> for "ice: remove af_xdp_zc_qps bitmap" in our build system.)
>>
>> This led me to wonder about the current version, and can trigger the
>> same crash on 6.11.5 [3].
>>
>> Reverting "ice: remove af_xdp_zc_qps bitmap" [1] in the current mainline
>> is a little more complicated as commit ebc33a3f8d0a ("ice: improve
>> updating ice_{t,r}x_ring::xsk_pool") also changes things a little so the
>> reversion doesn't work cleanly.
>>
>> I have tweaked everything a little the below patch [2] applies cleanly
>> to 6.11.5 and 6.12-rc5 and seems to fix the fault.
>>
>> Thought I'd bubble this up as it's definitely still an issue in the
>> mainline kernel as of now.
>>
>> Thanks
>> Alasdair
>>
> 
> Hello,
> Could you please share the reproduction steps? I will look into this.

Hello,

I should probably have provided better steps to reproduce - apologies.

Our stack uses AF_XDP in zero copy mode with shared UMEM between XSK
sockets.

To isolate other bugs in the past we've used a modified xdpsock app
based on code previously in kernel samples. The original sample has
since been taken out the kernel repo, but we maintained the modified
version in our public repos here [1].

There's lots in the readme but suffice to say if you run the build.sh
with bash, it will compile xdpsock_multi user-space app and accompanying
xdpsock_multi.bpf eBPF app. You'll also need to necessary dependencies
libxdp/libbpf et al.

I can reproduce the issue with this app using 8 channels. It can fault
in two ways (step C or D) below.

Terminal 1:

A# ethtool -L <nic> combined 8
B# ./xdpsock_multi --l2fwd --interface ice1_1 --zero-copy --channels 8

Terminal 2:

C# kill -9 $(pidof xdpsock_multi)
D# ip link set dev <nic> xdp off

Sometimes the act of killing the process (step C) causes a kernel crash [2].

Other times, it may survive, leaving an orphaned XDP program attached to
the NIC. Unloading this manually (step D) causes a kernel crash [3].

Stack traces are actually different so hence I've provided both.

Affects:
6.1.x
6.6.x
6.11.x

Hardware is E810-CQDA2
Firmware is 3.20 0x8000d83e 1.3146.0

Let me know if you need anything further.

Thanks!
Alasdair


[1] https://github.com/OpenSource-THG/xdpsock-sample

[2] Kernel crash triggered by step C

[  220.921136] BUG: unable to handle page fault for address:
ffffa3eee1637f14
[  220.921175] #PF: supervisor write access in kernel mode
[  220.921196] #PF: error_code(0x0002) - not-present page
[  220.921217] PGD 100000067 P4D 100000067 PUD 100238067 PMD 0
[  220.921244] Oops: Oops: 0002 [#1] PREEMPT SMP PTI
[  220.921267] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Kdump: loaded
Tainted: G            E
6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
[  220.921315] Tainted: [E]=UNSIGNED_MODULE
[  220.921331] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
3.2 12/16/2019
[  220.921357] RIP: 0010:ice_clean_rx_irq_zc+0xde/0x7d0 [ice]
[  220.921489] Code: 0f 84 d0 01 00 00 44 3b 7c 24 08 0f 84 a1 02 00 00
48 8b 53 38 41 0f b7 4d 04 4c 8b 24 c2 89 c8 81 e1 ff 3f 00 00 66 25 ff
3f <41> c7 44 24 34 00 00 00 00 49 8b 74 24 18 48 8d 96 00 01 00 00 49
[  220.921518] RSP: 0018:ffffa3eec64d0d88 EFLAGS: 00010206
[  220.921529] RAX: 000000000000014d RBX: ffff89bbc2aa2a00 RCX:
000000000000014d
[  220.921542] RDX: ffff89b408830000 RSI: 0000000000000040 RDI:
ffff89bbc2aa2a00
[  220.921554] RBP: 0000000000000000 R08: 0000000000000000 R09:
ffff89b407655000
[  220.921566] R10: 0000ffffffffffff R11: ffffa3eec64d0ff8 R12:
ffffa3eee1637ee0
[  220.921578] R13: ffff89b414710000 R14: ffff89bbc7919500 R15:
0000000000000000
[  220.921591] FS:  0000000000000000(0000) GS:ffff89bb5fc80000(0000)
knlGS:0000000000000000
[  220.921605] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  220.921616] CR2: ffffa3eee1637f14 CR3: 00000001d9820006 CR4:
00000000001706f0
[  220.921628] Call Trace:
[  220.921639]  <IRQ>
[  220.921647]  ? __die+0x20/0x70
[  220.921663]  ? page_fault_oops+0x80/0x150
[  220.921676]  ? exc_page_fault+0xcd/0x170
[  220.921690]  ? asm_exc_page_fault+0x22/0x30
[  220.921707]  ? ice_clean_rx_irq_zc+0xde/0x7d0 [ice]
[  220.921759]  ? ice_clean_tx_irq+0x166/0x3c0 [ice]
[  220.921808]  ice_napi_poll+0xb2/0x2a0 [ice]
[  220.921858]  __napi_poll+0x2c/0x1b0
[  220.921870]  net_rx_action+0x30d/0x3e0
[  220.921881]  ? __raise_softirq_irqoff+0x18/0x80
[  220.921896]  ? __napi_schedule+0xa6/0xc0
[  220.921907]  ? ice_msix_clean_rings+0x4f/0x60 [ice]
[  220.921959]  handle_softirqs+0xf0/0x2e0
[  220.921972]  __irq_exit_rcu+0x80/0xe0
[  220.921983]  common_interrupt+0xb7/0xd0
[  220.921995]  </IRQ>
[  220.922001]  <TASK>
[  220.922008]  asm_common_interrupt+0x22/0x40
[  220.922022] RIP: 0010:cpuidle_enter_state+0xc8/0x420
[  220.922034] Code: 0e b6 3e ff e8 09 ee ff ff 8b 55 04 49 89 c5 0f 1f
44 00 00 31 ff e8 97 69 3d ff 45 84 ff 0f 85 38 02 00 00 fb 0f 1f 44 00
00 <45> 85 f6 0f 88 6a 01 00 00 49 63 d6 4c 2b 2c 24 48 8d 04 52 48 8d
[  220.922061] RSP: 0018:ffffa3eec4377e78 EFLAGS: 00000246
[  220.922072] RAX: ffff89bb5fc80000 RBX: 0000000000000004 RCX:
000000000000001f
[  220.922085] RDX: 0000000000000005 RSI: ffffffffb255a8a3 RDI:
ffffffffb2533173
[  220.922098] RBP: ffff89bb5fcc0cc8 R08: 000000336fecb8ce R09:
0000000000000018
[  220.922109] R10: 000000000000453f R11: ffff89bb5fcb47e4 R12:
ffffffffb32bdce0
[  220.922121] R13: 000000336fecb8ce R14: 0000000000000004 R15:
0000000000000000
[  220.922135]  ? cpuidle_enter_state+0xb9/0x420
[  220.922147]  cpuidle_enter+0x29/0x40
[  220.922161]  cpuidle_idle_call+0x100/0x170
[  220.922175]  do_idle+0x7d/0xd0
[  220.922185]  cpu_startup_entry+0x25/0x30
[  220.922195]  start_secondary+0x116/0x140
[  220.922206]  common_startup_64+0x13e/0x141
[  220.922222]  </TASK>
[  220.922229] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
nft_chain_nat(E) nf_nat(E) nf_conntr
ack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E)
nf_tables(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
intel_powerclamp(E) coretemp(E) kvm
_intel(E) ipmi_ssif(E) kvm(E) iTCO_wdt(E) intel_pmc_bxt(E)
iTCO_vendor_support(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E)
drm_shmem_helper(E) pcspkr(E) drm_kms_helper(E) i2c_i801(E) mei_me(E)
i2c_mux(E) mxm_wmi(E) mei(E
) i2c_smbus(E) lpc_ich(E) ioatdma(E) acpi_power_meter(E) ipmi_si(E)
acpi_ipmi(E) ipmi_devintf(E) ipmi_msghandler(E) joydev(E) acpi_pad(E)
drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E)
crct10dif_pclmu
l(E) crc32_pclmul(E) libahci(E) crc32c_intel(E) polyval_clmulni(E)
polyval_generic(E) igb(E) libata(E) ghash_clmulni_intel(E)
[  220.922280]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
dm_region_hash(E) dm_log(E) dm_mod(E)
[  220.922416] CR2: ffffa3eee1637f14

[3] Kernel crash triggered by step D

[  894.619896] BUG: unable to handle page fault for address:
ffffb5818c2d7f14
[  894.619921] #PF: supervisor read access in kernel mode
[  894.619932] #PF: error_code(0x0000) - not-present page
[  894.619942] PGD 100000067 P4D 100000067 PUD 100237067 PMD 0
[  894.619957] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
[  894.619970] CPU: 5 UID: 0 PID: 2540 Comm: ip Kdump: loaded Tainted: G
           E      6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
[  894.619994] Tainted: [E]=UNSIGNED_MODULE
[  894.620002] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
3.2 12/16/2019
[  894.620014] RIP: 0010:ice_xsk_clean_rx_ring+0x37/0x110 [ice]
[  894.620086] Code: 55 53 48 83 ec 08 44 0f b7 af a4 00 00 00 0f b7 af
a2 00 00 00 66 41 39 ed 74 33 48 89 fb 48 8b 4b 38 41 0f b7 c5 4c 8b 34
c1 <41> f6 46 34 01 75 30 4c 89 f7 41 83 c5 01 e8 f6 5c c6 da 31 c0 66
[  894.620113] RSP: 0018:ffffb58189c376d8 EFLAGS: 00010293
[  894.620124] RAX: 0000000000000000 RBX: ffff92f681f6b800 RCX:
ffff9302f2860000
[  894.620136] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffff92f681f6b800
[  894.620148] RBP: 00000000000007ff R08: 000000000000081f R09:
0000000000000000
[  894.620159] R10: ffff92f684dc0000 R11: 0000000000000020 R12:
0000000000000010
[  894.620171] R13: 0000000000000000 R14: ffffb5818c2d7ee0 R15:
ffff92f681fcd740
[  894.620183] FS:  00007f7ee9e27740(0000) GS:ffff92fd9fc80000(0000)
knlGS:0000000000000000
[  894.620196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  894.620206] CR2: ffffb5818c2d7f14 CR3: 000000010e25e003 CR4:
00000000001706f0
[  894.620218] Call Trace:
[  894.620228]  <TASK>
[  894.620236]  ? __die+0x20/0x70
[  894.620254]  ? page_fault_oops+0x80/0x150
[  894.620268]  ? exc_page_fault+0xcd/0x170
[  894.620283]  ? asm_exc_page_fault+0x22/0x30
[  894.620298]  ? ice_xsk_clean_rx_ring+0x37/0x110 [ice]
[  894.620350]  ice_clean_rx_ring+0x16e/0x190 [ice]
[  894.620401]  ice_down+0x2f8/0x3c0 [ice]
[  894.620443]  ice_xdp_setup_prog+0x193/0x460 [ice]
[  894.620485]  ice_xdp+0x7a/0xb0 [ice]
[  894.620527]  ? __pfx_ice_xdp+0x10/0x10 [ice]
[  894.620567]  dev_xdp_install+0xc7/0x100
[  894.620584]  dev_xdp_attach+0x205/0x5d0
[  894.620597]  do_setlink+0x7d3/0xc20
[  894.620611]  ? __nla_validate_parse+0x125/0x1d0
[  894.620626]  __rtnl_newlink+0x4f7/0x630
[  894.620639]  ? __kmalloc_cache_noprof+0x225/0x2b0
[  894.620652]  rtnl_newlink+0x44/0x70
[  894.620662]  rtnetlink_rcv_msg+0x15c/0x410
[  894.620676]  ? __rmqueue_pcplist+0x5f/0x2c0
[  894.620686]  ? __rmqueue_pcplist+0x5f/0x2c0
[  894.620695]  ? avc_has_perm_noaudit+0x67/0xf0
[  894.620708]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
[  894.620721]  netlink_rcv_skb+0x57/0x100
[  894.620735]  netlink_unicast+0x246/0x370
[  894.620747]  netlink_sendmsg+0x1f6/0x430
[  894.620758]  ____sys_sendmsg+0x3be/0x3f0
[  894.620771]  ? import_iovec+0x16/0x20
[  894.620783]  ? copy_msghdr_from_user+0x6d/0xa0
[  894.620795]  ___sys_sendmsg+0x88/0xd0
[  894.620807]  ? __mod_memcg_lruvec_state+0xce/0x1c0
[  894.620822]  ? mod_objcg_state+0xc9/0x2f0
[  894.620833]  __sys_sendmsg+0x59/0xa0
[  894.620844]  ? syscall_trace_enter+0xfb/0x190
[  894.620856]  do_syscall_64+0x60/0x180
[  894.620867]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  894.620881] RIP: 0033:0x7f7ee9d0f917
[  894.620891] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f
1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
[  894.620920] RSP: 002b:00007ffd0b9a9e58 EFLAGS: 00000246 ORIG_RAX:
000000000000002e
[  894.620935] RAX: ffffffffffffffda RBX: 000000006728b03b RCX:
00007f7ee9d0f917
[  894.620948] RDX: 0000000000000000 RSI: 00007ffd0b9a9ec0 RDI:
0000000000000003
[  894.620959] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000078
[  894.620971] R10: 000000000000009b R11: 0000000000000246 R12:
0000000000000001
[  894.620983] R13: 00007ffd0b9a9f70 R14: 0000000000000000 R15:
000055784e873040
[  894.620997]  </TASK>
[  894.621004] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
nft_chain_nat(E) nf_nat(E) nf_conntr
ack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E)
nf_tables(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
intel_powerclamp(E) coretemp(E) kvm
_intel(E) ipmi_ssif(E) iTCO_wdt(E) intel_pmc_bxt(E) kvm(E)
iTCO_vendor_support(E) rapl(E) ast(E) mei_me(E) intel_cstate(E)
intel_uncore(E) drm_shmem_helper(E) pcspkr(E) i2c_i801(E) i2c_mux(E)
drm_kms_helper(E) mei(E) mxm_wmi(E
) lpc_ich(E) i2c_smbus(E) ioatdma(E) acpi_power_meter(E) ipmi_si(E)
acpi_ipmi(E) ipmi_devintf(E) ipmi_msghandler(E) joydev(E) acpi_pad(E)
drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E)
crct10dif_pclmu
l(E) crc32_pclmul(E) crc32c_intel(E) libahci(E) polyval_clmulni(E)
polyval_generic(E) igb(E) libata(E) ghash_clmulni_intel(E)
[  894.621056]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
dm_region_hash(E) dm_log(E) dm_mod(E)
[  894.621193] CR2: ffffb5818c2d7f14

