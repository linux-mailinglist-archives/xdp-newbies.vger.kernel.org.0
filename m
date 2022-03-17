Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE1C4DCA0F
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 16:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbiCQPfc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 11:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235896AbiCQPfb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 11:35:31 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00121.outbound.protection.outlook.com [40.107.0.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5C5179B0B
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 08:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EByIt5MYwXh5Yge1DVJAjuKYzC8SkSof0WZdVwbhbsuuMd8Jf+XpzsCej6K36Swk5Z7Cur0/F7t7MeVucz/wi9Ka/WYWtZKpeJq6ZON9Rs20UN0Ei66SKgVcMZCsKxg8AkeAvbNzdxshzAJ4OLp/4FfMX5GwiPwhlAZbfrBbWGPeXJLH/3XQP+erArLQn/E4ZhlBDMJuqiAEOdzBO/GjYc0ZABWdXwrsXCvHMTPrIZh7xmv2BxabQ3qRmI6PkfWRej0PBz1uuuXdnZJnc1y9umooiMngiqpaAmyzd2SLM+1xu7s3MWFkxeCDIj1HkGquN1+efif5YiQc6sLT+4UUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1DP+TEDwBYDp4N7JlsmfDkAut9elLt39rIqBpCc+R0=;
 b=KHyWH7iLYWI/IRPuS/JRey3SdDuiBa4v8ZwOaVagMt870iMvlEYswrGx1DH4gnWdZsudTa29mLLqw0eaTqyNlmOcx0tAPDNpw6Cah/+QfcRbo1t3JoavzER5g0F+WH7KDpSJUO84r5QtbJajfACGfDi1Lu6Yddo/KXR94tLvWUbqY15LNwDseqCVmLecHvjp4g3mdZ+J2GZhhjFyV0yqxATiGx+/cV1wVucxr+Y5e35wos6W+dIZrLr5g4ApY0Ub6DGj7GmZh+A0zCtUyTVCUawu2oM2FTdpgaFu8rhm8DX0kBdIIu7Bw0OfSzSgNwiIbP9Qr4iI/RUozDQVR6SgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1DP+TEDwBYDp4N7JlsmfDkAut9elLt39rIqBpCc+R0=;
 b=dwmgs44WTHGYnbD4g6bj4eMOtWX778PooIKo7vpGjKLmjHgl8iIi4N0KOTPECF1j5ZyJlfYndnULcK+rMLkDFVBFLde5yvnaDdz7Vg6Nrktbwn6v17yKkiIjNn1kN+MsqGtDv88cOgEYTy3wf+gpwddhW/YZ4zru9DT4ZleCd8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AS4PR05MB9207.eurprd05.prod.outlook.com (2603:10a6:20b:4ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Thu, 17 Mar
 2022 15:34:12 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec%4]) with mapi id 15.20.5061.029; Thu, 17 Mar 2022
 15:34:12 +0000
Message-ID: <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
Date:   Thu, 17 Mar 2022 16:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
Content-Language: en-US
To:     Jay Vosburgh <jay.vosburgh@canonical.com>
Cc:     xdp-newbies@vger.kernel.org
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
 <6736.1647529145@famine>
From:   Federico Parola <federico.parola@polito.it>
In-Reply-To: <6736.1647529145@famine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c206eda-1679-4458-b901-08da082b95ff
X-MS-TrafficTypeDiagnostic: AS4PR05MB9207:EE_
X-Microsoft-Antispam-PRVS: <AS4PR05MB92077A5231DC6BA27C7D4753F2129@AS4PR05MB9207.eurprd05.prod.outlook.com>
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYhez6rojEnSwPiiGsh813jk/EzU3i2IKBPdj6RAkx5G8zzsg6bbrzJu/6FOnjkIGI15A61EP0OmmZc9H57UhN/re4Ets8Ll/QUWQ1C4A+fYUFyMtPqnPZu3xe6xJcD2/XeukLpCECt76puySUAeKtfCvtIFBLQ9b8TNNLs+zGxcQkRzLfk9Y02qeYY4m3oboBiG/H0fsL86j/xr0xOkNfBWTyw8YLaiBwVCLgMBCYRqlPZOLzrzLs7NjwvLN5WDsFKCjbAtg0CE9yialTxICRiS86iLBpW8AQxHmQQitbumOQz9SBjoPdsE4YNRpJNwtkJ5ehXMvClXlmhvliyyCK06YWx19yRPX7CtEHLvFrzeFGCEW32zqHKCBGzQL5OCwqHQNYH8aLQljJnUAt+nhrlFpTD1FwgLCvaghiv8GyJ5aASl5ZYzMNi8hgkPtNGQtnLCV3ZwgWlJdVW2CJOqXDsFq+QFmPkEMhCG8IHIzd5MPKuS19UftQliG4uNCEWn1/LDkfdPSOvgGhdwclTNVUcbrMmGKMxtiHqWuNEUVcxvev2a57k0/0bqr4MwE2ouQSSJRJrfEB3yNqi7+54Y/x3Hkw062GvILk5OA+0s+jPA8VQPJOzxkZNoQJkiUV9HYE0N9au5FvXGwG5jyzrNw2h0kbEns2pwIiD8Mh2omHJIdtEKIvJGp9Pch9X2ztTTYdTZO1sap3zYxDq3StMHrDXtB9LCLSKIXAUqFzb4Dp79J6jVOXR6vlAgiht7lG323dp0v62pDMKtFXIvcVXCog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8676002)(66556008)(36756003)(66476007)(4326008)(66946007)(44832011)(2616005)(38350700002)(5660300002)(31686004)(6512007)(8936002)(38100700002)(83380400001)(86362001)(26005)(2906002)(6486002)(186003)(53546011)(6506007)(316002)(786003)(6916009)(508600001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFlNQVQ2VlhjYm1iWnl5djBnVlpLTTZ1RklPWXluaEdpdnhwYkRtTEh3cjNN?=
 =?utf-8?B?QUh6OUhBY3ArQmhSMUs1OWE5VUIzYU9hZ3RBTFpYUnBOWG1ycFZhYWxiS2NW?=
 =?utf-8?B?cXBzTDRoRU16Rk1LeFZBd2I0T0djUUZjMVdWZGhlcDlVemc5WThnc0l3NDFa?=
 =?utf-8?B?djVaSTVYZ3Z3WXd3bmt1VFQ3bDEzZVNOK3dKMlQ1dU5QM21XWGZpYUxIN1Bt?=
 =?utf-8?B?ZUl4SjZjNVRGOXNmZURWZ3crVTA5VlNiWXdMUWx3emNRSy9SV3hCOVZlWHFj?=
 =?utf-8?B?R2E0VHVzTWxaWWtXVS8xM0ZWYVpvQWVWNmVPSlJGVXZzaHRxOUlGRURJRjhK?=
 =?utf-8?B?QUZNejEyckVTQ09VQ2NqSGVxMVE4bXF0UFErcjRzMHlNYjEzdVRtVUFpWU1P?=
 =?utf-8?B?YnVCSHl5UkJpY3Izb0VLK1kyODZlMlFlZzNKYkJrdW5RdkRHUzdzSHlGQjlK?=
 =?utf-8?B?SlVaNGN1UkRCNHVrUktvNy9DTXZIRFkyc3NDbFRneUMwZmVHQ0dYejc0b0pG?=
 =?utf-8?B?by9TVzFsUW90TFRDdnlhN0YzUCtSai8rVlllSG9MRHhWSnIxWDhVSHZnem5l?=
 =?utf-8?B?a1FRVzdzVTNKSXFLeDFQZWVaT3pFSmhFVFBVVDZ3a25KeGlSa3FLdVoyZVRU?=
 =?utf-8?B?MHFmcnlOTkVFRmRrQXlnK0RNaGIvalU1WEw5QndZNTF2amFCRHVxNVJRNUJX?=
 =?utf-8?B?ZUEweGJBQ1lZMjVKSGpQbTBnRlJodFZoVERVdlhqY1ZoU2MwRVVaVXFsV0h6?=
 =?utf-8?B?ckErR1hDQkxuV296WFhTM1FFUCtMQ3c3a2NvZDNxaE9qMkJ3SmJQSjBKWm10?=
 =?utf-8?B?djhuRkU4eTM2dHJuVlE2azROOTE5NmhJckJYdFQxMGN0UUlPb1VOL3pZOVVC?=
 =?utf-8?B?Q1NvNnFsRGJWc1NrSUorUnlka3VQd3FSRzg1bW5LVFhSRlZJTmdURzdLZTB5?=
 =?utf-8?B?ZEdkMXZqc2t1bjNrVS9CWEhXR3dPTitCTm9aVFlmM0wzckVpNHlPZWsvS2Vx?=
 =?utf-8?B?R2EyYjFYMWlTdmVieStaQ2RsSXlEcGdmK2lLNkQ5SmhNNUZnRnQycmh4dysr?=
 =?utf-8?B?MkJWYTU1SlFNN1dyUUhIeDdQTFpPb2FKMG5XcFg2Wng1V1l1bnlhZVphRlRZ?=
 =?utf-8?B?YkpYaEgySlRwdUN4dURSamlSRVliQjBRYloyUjV4d3BQWmZlNXQ3ZXR6dnBz?=
 =?utf-8?B?MnRWMTBqSm16dU9seHM3TGhhd2VDdzVpbjFJekVGY1hUQ2RJbUVaa1VFWGpt?=
 =?utf-8?B?Q1JVcC95S1ZYN001ZlpEQUowbFVFQmNqTHBRblViYlRFVXVUNVltR0tPMUh4?=
 =?utf-8?B?L1JSdUtUYzZ5aGpLNTBpMmJZUDFGQVd1SEp6eStLclVYNjFZV0JPLzdTTzNU?=
 =?utf-8?B?WlI5K21PclJIdWZVaWQxQjF0QVVxV280a0VpalYyMzJtMXBtRUtVUzJSVkl0?=
 =?utf-8?B?aEQ0VGIyQ0Z5QjRaTGhTSkhmc2I1VWhvTCtYNEFDb0NiRldlU0I1azAxV3h6?=
 =?utf-8?B?ZVhTYlFEVFpoaTFtQ3VyTkVaM2tDQWsxdjdtSVM0TnRvS3MrdWNQWjFoNm9u?=
 =?utf-8?B?MzRrYkV0SUMwMVFtZVo0VU1ZOHl3WldPVHpMUmlUWm9HS2VCRXJva0NaaWc4?=
 =?utf-8?B?WS9CdThJZXNKSFpGTUZ2a3VZSDdTakQyaWFYTWhUZEZWWVhXQ1UzdVJURWJZ?=
 =?utf-8?B?Q0gvWnkwd0hrQ2RYMGRtcWNKTUh1aFd2bmdZYi83MjM0T0g4SjlQRGdxd0tE?=
 =?utf-8?B?c2p4ek5mZzFocEZXSE9Ua0VIUlg0ZXRqbHM2R2hJc3dCcXB0YWx3Ritvd0lk?=
 =?utf-8?B?WjZUdDR1YXlBTS81cFM5cFRjWHFNcUFtT2JlUEFvdDgzOUcvZCtaamVDVlF3?=
 =?utf-8?B?L3JnMHByNlhmWm5zQ2dRVnEyWUlRNnErYkNCWm4zUjVTdDdKakhzeW5lRnVD?=
 =?utf-8?B?RXpudXJHdldnNUxnbzY3TU1KNWl2SmRnbDRxSGdYWFFPWmNpc1BBY21CU2lT?=
 =?utf-8?B?cnNEOFlNNE1RPT0=?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c206eda-1679-4458-b901-08da082b95ff
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:34:12.0464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjHshnoW3YeDMByxmcVbm/yQu4dQIQlmv1QVG1LfrxuxxjYqTj3mzM+hQ4zyGicJcSrseGTzK64LzRI7dABvukSAz4/nRw5gn/byoL7ZVYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR05MB9207
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 17/03/22 15:59, Jay Vosburgh wrote:
> Federico Parola <federico.parola@polito.it> wrote:
> 
>> Hello everybody,
>> I'm experiencing a strange problem when running an AF_XDP application with
>> busy poll enabled on a Intel XL710 NIC (i40e driver).
>> The problem can be replicated running the xdpsock kernel sample in rx or
>> l2fwd mode.
>> The first packet I send to the machine is correctly received by the
>> application. After this, packets are only received in batches of 8.
>> If I send 7 packets the application sees nothing, while the 8th one
>> triggers the reception of all 8 packets.
>> Disabling the busy poll mode everything works fine and packets are
>> immediately received as they are sent.
>>
>> I tried changing kernel (5.12, 5.14 and 5.16) but all present the same
>> problem.
>> I also tried using another NIC, an Intel X540 with ixgbe driver and the
>> problem isn't there, so I guess is NIC/driver related.
>>
>> I tried monitoring ethtool statistics. When sending packets between 1 and
>> 7 these counters are increased:
>> stat:           64 (             64) <= port.rx_bytes /sec
>> stat:            1 (              1) <= port.rx_size_64 /sec
>> stat:            1 (              1) <= port.rx_unicast /sec
>> stat:            1 (              1) <= rx_unicast /sec
>>
>> While the 8th one triggers this updates:
>> stat:           64 (             64) <= port.rx_bytes /sec
>> stat:            1 (              1) <= port.rx_size_64 /sec
>> stat:            1 (              1) <= port.rx_unicast /sec
>> stat:          477 (            477) <= rx-0.bytes /sec
>> stat:            8 (              8) <= rx-0.packets /sec
>> stat:          477 (            477) <= rx_bytes /sec
>> stat:            8 (              8) <= rx_packets /sec
>> stat:            1 (              1) <= rx_unicast /sec
>>
>> As far as I understand the first set of counters are hardware counters, so
>> it makes me think that packets are kept in the NIC and not even sent to
>> memory.
>>
>> Does anyone have any suggestion on what could be causing this problem?
>> Does enabling busy poll set some flag on the NIC?
> 
> 	We observed similar "batching" behavior on i40e devices late
> last year in ordinary use (not XDP, but using SR-IOV VFs).  We
> instrumented the drivers at the send and receive sides, and determined
> that it appeared to be a behavior of the receiving device itself, i.e.,
> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
> update of the RX ring pointers) until packet 8 arrives, at which point
> all 8 were delivered simultaneously.
> 
> 	The issue was evidently in the firmware, and was resolved after
> a firmware upgrade.

Hi Jay,
I just updated the firmware to the latest version (v8.50 from v8.30) but 
unfortunately the problem is still there.
However I'm experiencing the problem only when using AF_XDP in busy poll 
mode, all other modes (standard AF_XDP and normal packet reception) work 
just fine.
Maybe the two problems are correlated in some way.

> 
> 	-J
> 
>>
>> Best regards,
>> Federico Parola
> 
> ---
> 	-Jay Vosburgh, jay.vosburgh@canonical.com
