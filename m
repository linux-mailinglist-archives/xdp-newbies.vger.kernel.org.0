Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDC83DFD5B
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Aug 2021 10:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhHDIzx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 4 Aug 2021 04:55:53 -0400
Received: from mail-db8eur05on2090.outbound.protection.outlook.com ([40.107.20.90]:62529
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235522AbhHDIzx (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 4 Aug 2021 04:55:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRPJG9HMbANzeim4segUqucpXi8aCPDTOH6MqVBJKQn32V3bxuZsAibD9YDIXW3bCpHgDb2obOUVw+h3b3ydggjsA1fAjaiJFH1CQZ6PA+v+Cb8f5CS3uoog2EG9mZ3/m7OSVkzFVXru5QTLlYd08X7whSFWexNareI5FHAMOg7dVG6Sbuf6pu4E8STVM2sVDn2rNEoMetO8YazxL7epNcwyD1mD3GI0MTDLO7q9d4GJfxyh2pjdVpzPZiNqEtZgoExB+vtI0URwo5NmUIfnzHnq8FUi8UVoXYDtleWNNgJpvtQA2QassHxVc0euB6H073dcVA5NAjlqPkEEUEsL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkyKuLc91v2uRSMukjBKUZD345fdhYvX/fN2dGM2DMc=;
 b=ZOSLJ5TzbstvlIGridS3SWtdOyz3lvjGffsxbc6S/6tKWgygFUPhQ22mDNHrOTN0R9xlmTZ1PK9FDLOIDdTZ4WRVqYGrwYWN8gYI0uHyrDktaOgpDQjUgdMdYQBhUY5kt6x6a+Bs5oczQEo9zmDtO3NKr8eJAmNKA1+YXjMo9RZMehzxlftJN7YVHeENJS/xDEQTNe8dm5BH4kEhm0hY4gf57VcaDnVO8MvNmXP6vbdPwOannUiA8oCHXZnJeQqDfSIJROqNDY86gaNp+d8eP3exv26YGiGcEJViYFRwOFPSavgV7pM4C3RG4YEqs/DMUNKZcXTNvDOAhP3ZR9VO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkyKuLc91v2uRSMukjBKUZD345fdhYvX/fN2dGM2DMc=;
 b=IhMSeEHjRAnVGXMX2MS3gNBxjzTOOg29+yHxxFYmfyIro5hPgi1ak55R+Df81apDToM7CPjiukYNXsfvwInSHUFbdLuSOpkJCZlf4vGPlDHGYxR+6KWI56He2vrJvcaB958teivWi5B6dZ7q8Mg8RFf27vfA3AoGJtxYXx+cNH0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AM5PR0502MB3107.eurprd05.prod.outlook.com (2603:10a6:203:97::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 08:55:39 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::f8a1:b29d:9c93:ab0a]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::f8a1:b29d:9c93:ab0a%3]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 08:55:39 +0000
From:   Federico Parola <federico.parola@polito.it>
Subject: AF_XDP busy poll and TX path
To:     xdp-newbies@vger.kernel.org
Message-ID: <eeb976ca-4af1-34fb-4723-bddd77f972cb@polito.it>
Date:   Wed, 4 Aug 2021 10:55:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.60] (93.88.125.241) by ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Wed, 4 Aug 2021 08:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47f0529b-cf30-435b-84b9-08d95725a1bd
X-MS-TrafficTypeDiagnostic: AM5PR0502MB3107:
X-Microsoft-Antispam-PRVS: <AM5PR0502MB31079205367FF540827A942FF2F19@AM5PR0502MB3107.eurprd05.prod.outlook.com>
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZx5q6e3vWbsn+71NZ45GdKUDYUbumIVMtT8Tu/q3NAOa71t5Bd8ObNeprR61NuAKYGmgPHdHhb8IQEq2hJ7+La35cmI7CG5eY/WfvGsELofpi7mEIlZ5kOulc7D+8hRCh9U784iJuyY6h5XbrftfmzghnKHH097q5GdHw+1NSKNUOSZmB9pv/DchR9mb7Qhlpz8TFFNaBHytPEY6rz7VBKXWkb/BCH3LOOxD/BLqoJv67cjPCsf7KegL4CfPpu+LMjWI4IIkvAhNnDCXEu0CGgWiQ+AwmJJawQzoUz99J4z0yadAtelg00flQkSpEfxknzhFV8ex/f5FgPdbn3ARyXyD19Q5FOApYtPDWSMArenv/1j8sEjflLePYjZ7V5+VqlJUOgJfeKUcoELtK1XAF82GNN06YuElZm6zvjlUBdKgARV/FkozQO9g29AKWUfr0wNcT2HMBeqW6krLyR9p8HhN4Ttjp9Yzj72/pbh5QcNDb+144wQKpKqpGpzdgPoTWC/zC676PdL0JuaP2iM1VzGySLMMxF8B51srwYsp5IqSi0D138GdCWaDitOVi3+GYdcgPAY+QQV/CkagmsBnlSwZgItBAdSSZ4GMt2MKU8nj69c8dyACh5LaEFfoom3YAufoHmjEuYOLnPLtX2iCs92FbOg4P0a9nSnFcSo0W5uy8IhiyI/gLual89Hq4ZXz9/lpEOK8+ENyx141ECpU49iigGtUeGgdu4g8C6RMwQkwlRoEcP15c6rWHBm3TSaWdUJu5Msgen3uHIO4UQNKDnwo2cccoNgk3Suo6TDIFQADUPP5qmpDADC08qUBWGt+Y+6jhB1HcFV1EihKCqqBM20Lti9MYLv6tzm75BFZMipR6BI7bgkV4sVeEEfUbzU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(346002)(396003)(376002)(6486002)(86362001)(478600001)(966005)(83380400001)(31696002)(36756003)(2616005)(66946007)(66476007)(66556008)(52116002)(2906002)(44832011)(956004)(38100700002)(38350700002)(786003)(316002)(8936002)(6916009)(31686004)(16576012)(8676002)(186003)(26005)(5660300002)(10126625002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkEzMnU2ZEhNbllSckM4aUZueHlZaWdHWVY4VVRMSjluTWU2bTFXaGVrb25U?=
 =?utf-8?B?a1dCWnE3UTZkYzdNUmh6bkdYaU5DYVhFeHMzUCtyWTJMUXExTHZUZTJTczd4?=
 =?utf-8?B?blZtMWlWeklhckNzSDczc0RmN2dXbkxNMlY4aEFRaWtxYVJHKzMwWlFCVnhl?=
 =?utf-8?B?dlZTcjd4QW8rVGhHRnE1T3o1OXdCdGJaRXBYa1FDeUlVTWZGeHNKZTdYakRm?=
 =?utf-8?B?TDE4S3VCS0xVOCtUU1NuTzR4ek8rWGEyT1MySFJVL2Q5NHppdllGWW5LbGlV?=
 =?utf-8?B?U3pSM3N0dllObUZQeW5BRVNnRjZaZmF3S1NEQmhBQml5ZVg3OGJLd01lL0Jn?=
 =?utf-8?B?Yko2RzNoRjVta2d1bmZCZlE1SVJJWTc0U29SemprcndNSkF2U2tEL0poRDhS?=
 =?utf-8?B?Z1BJRjVRamIrMmFSMTB2V01ldEdwRFNUVVFRTnFVYi94WEZjUG4rNzdqY2VL?=
 =?utf-8?B?Q3EwNXJicHY0bGFRS21mdkQwRmhXaTdMTHg2Vmxld2Q5T0NqSlNpUHNnWlRp?=
 =?utf-8?B?V1FYRHp5NWNMRE1WVUt0WUNqcm4xVnFOc3lqTC9UZ1JDbk83ZG1ObUdvTXJw?=
 =?utf-8?B?UXAwNkw4MjNDaGtlam9nSGhFcmpPSkE4cjlQU0F0Q3FGMWltbzJhN1VrUXpU?=
 =?utf-8?B?R1M1T2xOcURIVUw2cGRaMWpveHRkNjUvVnZCQWRhR0NTcWFJdjFQUFhFWUQ2?=
 =?utf-8?B?VGFhd091RTdVSUdJZ3NVRldCRmpSTGd1dkxRWWk1Qko4RGZpNTkvY1VOQnBR?=
 =?utf-8?B?bVNad1JuazViem5nLzEvSmMwTGdjdC9XVFV6QXNnYVZVRTBmRTh0bjdHTkRU?=
 =?utf-8?B?ZXN6L1NCc01rRkttN2JGalV2MjN2R0N0ajgrUlNtOUNNQkd3S2t2OHFTY0pR?=
 =?utf-8?B?aWM1Z05OWTdyY09ET25CMHpFaEdnZ0VWazhlWGhaYkNpcXNleG55TGZBejUw?=
 =?utf-8?B?U0k5ZzJ6VmpFUW9XTXZhYXVtRUFlNk9hYjJ0ZDdIbG4wSHJjcDl5dGVvT0lI?=
 =?utf-8?B?TzBqdXpnYkVFVWxxTWwvT2xTU3g0bmgyTEhoK2NJbGQ3UEsybEF4WGZsWEdN?=
 =?utf-8?B?TjJQbGloTTlmQlpENk1wcUQyNW9MSUcvNTd6WFNYQW91VDVNTmNpK0s3Z21B?=
 =?utf-8?B?Qk1aenpaZERkcmNzcG5lQ3QwOVRQbUZ3VDN0cW9FRmZvbnlMNHFldFlBMlBI?=
 =?utf-8?B?WEdobSszSUo1S1dwRUVrTEN6OUozTHMzOWJxak1wTDNSSXpMMThCTGpOUHRT?=
 =?utf-8?B?UjQyaFMvQ3RRMmsyak54SWxYL0N3UDFOM2l0MlVkL1YrY25RZko2cU5NZHZH?=
 =?utf-8?B?bWxsaHlZQkhaSVJlQldDUDdYdGFmVEp4WW8wUE4yTVpYUEZWdXBMTXlBV2pV?=
 =?utf-8?B?TjBaT0Z4ZlVLa0d1NnRMeWtsakV6N1lQSS8rdlcxMjF3bFI1bHNpY3RVUjFP?=
 =?utf-8?B?ZGlPWlFZeUI2a1QvNUF3Q3pWUzZCWlZ0N2FmWDRiOXEybE9ISmZmUU5tZlBx?=
 =?utf-8?B?YnNoNUFpcGdDeno3SnF6MGp1QUlpUUtXNzJxNTBkeFc3aVRQSVQ5VVNRbndw?=
 =?utf-8?B?TDZYVStFYWhmY1JyblczVDBnSWFqTWwrUlQ1b1NnMkFHTjhqd0k1Qi9PZDVq?=
 =?utf-8?B?VlBENFptOTVIeCsybU1WT0l4OXljTG5wWVJYeGxEV2RHVWlFSENqYStqeTg0?=
 =?utf-8?B?WXd2MURQNGxuckNRMFc3WnFZRTNhQWkzZFdkcUtaSWJqV1l6TzlqYVNEaU5W?=
 =?utf-8?Q?oJzoMQhSJ3rE9cIpG1Lp8uVbi7b/mSvB2jj1YcA?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f0529b-cf30-435b-84b9-08d95725a1bd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 08:55:39.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnVnVWx8afiDFjTy02BAtqcTj0k8Y6NcR48ZQD8UxNEh2OlExs9kj950h82AtQm7jtBAbZlpRx94fONhd2bTuO4I+N3lcpRNe0AIDeyXgGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0502MB3107
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Dear all,
I made some changes to the xdpsock kernel example to support the l2fwd 
scenario between two interfaces. I didn't use the xsk_fwd sample because 
I didn't need the complex umem management used there.
The updated code can be found here:
https://pastebin.com/p54T5nfW
(I'd be happy to submit it to the kernel, with proper modifications, if 
you deem it useful, just let me know).

I get a strange behavior when using busy polling on two interfaces. Here 
are the numbers I get when testing on a Intel XL710 dual port NIC (i40e 
driver). I ran all the tests on a single core (both user space and 
interrupts) and tuned the input rate to achieve maximum throughput (this 
was fundamental in the non busy poll tests). When running in busy poll 
both interfaces are configured with:

$ echo 2 | sudo tee /sys/class/net/<if>/napi_defer_hard_irqs
$ echo 200000 | sudo tee /sys/class/net/<if>/gro_flush_timeout

TEST     | Mpps
---------+-------
1 if     | 10.77
1 if BP  | 13.01
2 ifs    | 9.49
2 ifs BP | 7.25
(BP = busy poll with default batch size, 64)

As you can see when I move from 1 interface to 2 interfaces in the 
non-busy-poll mode performance reduces a bit, but I think this makes 
sense since we are handling data structures for two ports instead of one 
(does it make sense?).
What I don't understand is why performance on 2 ifs is lower when using 
busy polling. I made some tests and saw that with two interfaces there 
is some sofirq CPU usage and the tx port keeps generating interrupts, 
while this doesn't happen when using a single interface.

My question is: should interrupts and softirq processing be disabled on 
the tx path as well, when using busy polling? Or is it just a rx feature?

Best regards,
Federico Parola
