Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6509765513C
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Dec 2022 15:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbiLWOQl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Dec 2022 09:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiLWOQk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Dec 2022 09:16:40 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2114.outbound.protection.outlook.com [40.107.6.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5802026135
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Dec 2022 06:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLTDtqbfvRn6jDnb7LL0p04qHxm72W81zSt2M21BNLYRNop5OloInOA+yXanuAs0Lkb6hunjGsd5q/ZKpeitO+i9PtA5Lk52db8Y01AyBMmVwj2mjQd+HbvJO3lgxweLySSKhxTHDKkEjZ30YVkLR81RcKMp9fg9Wte3x6NsHGiefW7/HHxHijSRGwMz7x1kfCYuKynY4Iy6TKnlTB8Iy+9QohCLskMoT9RBawUIyBkMiARDbIdNIiS+CGHUBL5KvnXOld3Wm4y32Lts5I8bvLMk+Y2x5+g9AxT69+nQqpxOnri6/bvVoC5RhXfnXbTNNycOzO/yIljaffIoZGDt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTflO5gYcQnThr8BG1L8IDmkpVbvlbQACBSRRtGwKj8=;
 b=JSihIDodo19OH+HgrDEzQF8gSkWGM5ktQk9SB3FyqCvWx7WB7GQRf+BeoclGJxPQ/fokaZMagSgoXqPv/65k1Tx24/LKpIXaXUC9DoM8jWzDMwZ37y0tyNnMn+mK3SSZoSQ5V+LoFF6k/m0lLxUO/UIkhnGPUtkPFgZhrs5l65RvIy+qz3l7wQowL5jgs0wrPlDm+uWKGzm+l2FlVwnAUTDDICJr9VDSpTT96kTAO9yMd7JxuxATRb9cBreuTkpIVhT9UCx5tNNjmXmguZZRpE3oPUALeRp8XjRWwXyMv/FIopcJC+wSFAam+dQkS6hn/j5pvSKAmEitn3x96CGXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTflO5gYcQnThr8BG1L8IDmkpVbvlbQACBSRRtGwKj8=;
 b=flROEzG8q06wZ0noeglepujBk02z9S2wjC9UQsnO657Q2oLyDLmS5uRYYE0SwtY2TXAoSEBxz3ODsrRNfoFNU9NcNXLYMQoSyLFaSd8N8mcmf7cckYooBiuSbBppSfmfiypFgXOTJmOK6SclyhnehH5789krY+Z1OBzvh7KRWoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com (2603:10a6:3:6e::18)
 by AS2PR05MB10847.eurprd05.prod.outlook.com (2603:10a6:20b:62e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Fri, 23 Dec
 2022 14:16:35 +0000
Received: from HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7]) by HE1PR0501MB2603.eurprd05.prod.outlook.com
 ([fe80::758e:d109:319a:7ef7%4]) with mapi id 15.20.5924.016; Fri, 23 Dec 2022
 14:16:34 +0000
Message-ID: <85adfa75-e6c4-b225-651b-39feaebd93c0@polito.it>
Date:   Fri, 23 Dec 2022 15:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US, it-IT
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <federico.parola@polito.it>
Subject: mlx5 AF_XDP busy polling
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0033.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::9) To HE1PR0501MB2603.eurprd05.prod.outlook.com
 (2603:10a6:3:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0501MB2603:EE_|AS2PR05MB10847:EE_
X-MS-Office365-Filtering-Correlation-Id: d49675fc-08da-473f-35d8-08dae4f04c01
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWYXfMAS+GmVcbNRwfBw329U1F3GQIo30oCElIWtTHVqlvYA2QEtOswwOnwR2Td2+EpuXec90XmFl9aUK3zUqzihdGr0MHk31mnnov0F1rmYqbxBhBOClZnj1B/yBF1CLJUIqfKLUFl48Yws/lu54eiPS/Hm5ldzWN3LGy2h4CWtsrlDX2zrCm1InunxqtIMMMOuCE+xa+jmTo4bSgK41ikI5tyq7mYBqY1iRS/B4KF2x8sChaUjfsBpSqp+DHHwZltYd9b4WTqBqRnOngV5tuNzw1fV2QZMSwArlXFyihpwoWEwgA2kcYv1bkT/00iKPt33fM/UL494t0ESRYCbT/KeofE3QLr1fl7pkX9lqURa6JvpwENPbVFl5ZEsE0zgbbIEkD4mDuGf+2NUf/HJjKEwPX+aLinscYnrDMxRNNk4tpFawlMWD07DIWWoda+hrCXsIYbP4BJLqiAjprtvhvfEMLGA+8JL8Tvj05gYs7WKCzyg4t11JW+8DqEteY48xEO+0ZijEhdQZFDUsc4pEm2bwCHJTU7IM4QBMfNnikpf83KxQVAuREaVGjvSEFjegqCRnHRTd7QWNfIHK2ZM20RVCY3Se/xt3yRnjl2QSNyCx8aMrcM4UzZPuAV0zpB3fV2shqW8PkwPgz7FYaBstuhZYkYAozY1vmqMzxq3Ro2rdaf0xdSb23J0WlHl8ntpV8RYEukq5qhfeqZT2KcUEQXDYhqyAHWjcPmcetGIDz+9k0KOoLhjiDyWw0pmfOmS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0501MB2603.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(478600001)(6486002)(6506007)(186003)(316002)(31696002)(41320700001)(2616005)(86362001)(6512007)(66556008)(66946007)(26005)(786003)(66476007)(6916009)(2906002)(36756003)(38100700002)(41300700001)(8676002)(44832011)(31686004)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FPbG15WFRZektsUi9DM0c4TDVBaWhjM1BqOXJtRTRsb3liaDlWVDU5bGxX?=
 =?utf-8?B?MzAvMlNmbGpja3FNVlBvcEw2RmVkV3I5NU0rY2lvWW56clM5TVNNZ29kcEk5?=
 =?utf-8?B?alN5V25BS25iYXpNU3BNaEl2UUtBZ25JNUNvYzVtMXZvMEU4OUhVVWRMMVRl?=
 =?utf-8?B?RGhrZGJKdjhQTHo0L1UrN2F5YWZTK3YzWEM5OS9Femh5OEpqcWZoQy90bnlN?=
 =?utf-8?B?ZXFiSTRya3B1WG1wRWx2RHZBMUdzMWwyTElabkFjM2w5dUM5NFJUNjRsdnFY?=
 =?utf-8?B?NDF4UER6dTQ0VkJqYzZPaGFkTDY3ZzBZK09EVGdmMXpMUTR2cVEySmxBU0E4?=
 =?utf-8?B?OUNncHVtcHV6N3h4Rm9HME1uQUpySnJWMGVyTVBPUWZPbTkzUlJaOWRYd1M5?=
 =?utf-8?B?UlBBa295SXd4eHliWUNwRUxobmQwUEZsWEJad2xLc1hLV2ZiSDkzeVN1KzhQ?=
 =?utf-8?B?OStsK2o1MEIxZTVEbnlraW8ybkVhRTBxeWFWK1YyUEwybDFuVERsdXcrWnNH?=
 =?utf-8?B?RWNpVk1lS3JkaUJMV0dJS3Bwd2xlSm80anJQTllQTHM0c2U1Si9yY3QvMUUw?=
 =?utf-8?B?OXlvUGNibUcvc2Y1emo0RElLSlNZSndXYlBjYXMyWG1JUDJTU1dTYW1CU0Ns?=
 =?utf-8?B?a3dNc0tPK24xcUphVGZDOHZYMXBnZitsNU5JWDBhMnN3d2JVamRKamd1dDdZ?=
 =?utf-8?B?TFd6MzdwT1hHMWZaM0RDZDVIb29HR2pzUTBxQStwL05nVG42Z3gxUlBMVGMx?=
 =?utf-8?B?dFZFNUJXQ0xla0xaeHFTUGM4WHNVclIzaTRjNDU3aDVWL2dONEZTZ0E5RFFp?=
 =?utf-8?B?cDFiYldXeitpVDFjcDA1b0xLWnBCOVRpMVdLK0VDMmVGU0lZTVlhNTFVZkFs?=
 =?utf-8?B?dnZUYnp1aHYwYmx4eWUzREltbFFsNzc2QTJ4Z00xejFXY2hYankrM014dHRr?=
 =?utf-8?B?RGZZb283UysxU2NtYUFMSHRkMGs4Z2J0ekRwdWp6STBaTWpyOWRzMG1DTWsr?=
 =?utf-8?B?bFZIT3BOZ0VqUG1LbS9oRWtVUFZIQ2o0YWpUc3BFMVVaeExaejJZY1V6NnVM?=
 =?utf-8?B?VUxOSm9xa3k0NDY3N1EwVGVyeExpSWE5dnpxMnBaYVhtWEdsUHdmcllJYkt1?=
 =?utf-8?B?aEJoSVl1clVVeHVrK1Rocmd5N28rNGMwd0ovT3NiTThxZ3FkcTB2SmxTRnlK?=
 =?utf-8?B?ZDhub3QyM0Nic2ZxM0QzcWd5Mm5qR0xhRjhKVnJYMHV1TTA1dFJ0c05VZ0ow?=
 =?utf-8?B?dHBhOEJldDNHUzgwYUFBZHViV0xzam1vbFZnTkRlWS9DREZHaStqVzhXK1E4?=
 =?utf-8?B?dzkrRlNkeWtmTnYvQ0l5S1k2NVZJUWJTRTRqMDR5S25WSERQUFQydUJ3aTl6?=
 =?utf-8?B?MzVZdks2aS94c1FYbmJTV3pQNi9QM0pjRU0veksyQkdGbm1HUU81VEpEc3lh?=
 =?utf-8?B?Y1Q4MmZwSGsvc3B2MlRISTJGdFRjUlBPUjU4NnYvV3UyQlA2b0NYbmk0K3FF?=
 =?utf-8?B?T3BTN1F3TzJwWXoyMWZ5eU9CWE16UzBtWkJJeTZwWUp4VlRvWUEvZDREOUsx?=
 =?utf-8?B?ZTZTUkYvUHdSak1HU3RLdmZ6S3NOOHlDME1Ga2RXT1lRM2R2cCtLeHdrdEtZ?=
 =?utf-8?B?M2xWMU9pVkZWK01QZm5PWjN5TmJWeTE3NGdpSERtVnN1bGJzS09vNmVNVkVR?=
 =?utf-8?B?VWhYdUFEeFlNanF4R1E4Rm15a3F5d050VjBvNnJ3Y3ZLUWRXUktLRy8rU0h3?=
 =?utf-8?B?M1paV2tCeEdTUW5GZ044aVk1Qk9La243NXdKK3RxUGtyckVYdkd6RjNpVHM4?=
 =?utf-8?B?emZ2WXBTN3hNdmpRL01MTmU1dThJTVViQURrS2VvT1RwN2JsMTBUNlJvZzhC?=
 =?utf-8?B?OG5GRHZXTCs0L1hROFpmMWxKUWovcFJTdElhOGc2S3JCeXRMYkVIWk9xSHYw?=
 =?utf-8?B?S01ESFdjVm9PQldpK2MzS1Z0WDZOcGF0a2plZyswSXNsM21zVjludllyRWpu?=
 =?utf-8?B?NzdtWUJxRTNadndNc0g0c1J3QzRUSkdKU0ZNcWFDazBQY016NTZtVEI5MjNR?=
 =?utf-8?B?enBwc1V4a2k5cjNJVTRsOGdpWTY1ZWZpaTM5Z0ZtSDMrN0tPRVp0M0h2Qm9N?=
 =?utf-8?B?a0NZd05EQUFoMVBkWFd1S1d2Y1N0ZXJWZU5qMkZoRm5yUEc1b0RXTXRnQ3p1?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: d49675fc-08da-473f-35d8-08dae4f04c01
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0501MB2603.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 14:16:34.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu9kR9cZjQno3E7WcHF1lAEZRtlDlIoFJt02xOTZmkjFr0RvLYIAV+cK+jJWVh/2VPxG4LTIiddVfH6n1Wi84GFk/bNFCvrkUvLHTjiquso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR05MB10847
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone,
I'm not able to make AF_XDP busy polling work correctly on a ConnectX-4 
NIC. Whenever I run the xdpsock application in busy polling mode (-B 
flag), in either l2fwd or rx-drop mode, the NIC keeps generating 
interrupts and processing rate is very low. I'm on kernel 5.13.
Is this a known problem?

By looking at the code I might have a possible explanation for this 
behavior:
- To perform a busy loop on the socket, a valid napi id must be stored 
in the sk_napi_id field of the socket structure 
(https://elixir.bootlin.com/linux/latest/source/include/net/busy_poll.h#L109)
- The sk_napi_id field of the socket is populated when the first packet 
is redirected to the socket, and the value is taken from the rxq 
associated to the packet xdp_buff 
(https://elixir.bootlin.com/linux/latest/source/include/net/busy_poll.h#L173)
- mlx5 appears to always assign the napi_id 0 to xsk queues, that is not 
a valid napi_id 
(https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/setup.c#L74)

Does this make sense?

Thank you,
Federico
