Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E2A4DC8D5
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 15:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiCQOiA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 10:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbiCQOht (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 10:37:49 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2130.outbound.protection.outlook.com [40.107.21.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7F61D66CB
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 07:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWfvBzy9qqsNs0zv6VPRoaXfhLkF3eEOc6VSbEuCrO3/DrKd5HV9SRq2cdRXnUM0CFfwhJEMKioDEX+cWFVSSWdtlwxRO4smNZnXLOZzuLnB/Pea/55DsxFmCJ5CTKttl/lQkqp9ucVSowKSig51n4MCL8E6D9X27y2U2665XmNN6VOH390GgHwVlcPxWgHL/+MKGNtC/rug1HUQc3Nc+reo929JuMMwkzm2QBOgJoNzhztPivD5gcZXvluHLhXT2gqtxGYym2RwRMOf4aeBVPpcY+eyKkYyvZjf3PqPnx5J3+necQ5snOFEpt8kcT9chRFFfvLle0/IRUG5KWFPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgTx3DZU4rFvOooXk1s98gU9Td5Je6a4sFbY1WW5wjw=;
 b=L/9xDRKzjpMX23mJcH5+0aGcYy7U5QgkKJMon5oKSmpDVw6qnLWh+S+5VUUPhl9aa0ylnguJGWReVkIrV/xt75xaUexZoSJcHj6MsDSqKPkmKtVzrcV77UEkU0HcZdcOuPX+1O/7gB7rzA64B9amldsKDSbevAZv00vNmwCwlACwIjm+5uOAI/OPWMwucGarBsEb4X2yBDYWgxWpltx946LgcgGoFMDgb4BogZW9YZLd/obpab9u0mKkv9jGM4r9oMKZQsy+r+o3vnt0umoXfb7XQNto4rbI4oRxrXp/xv+i+Wpw1m+VumsGJ5i472DLWAwehegAIgD/cZejvV8Ltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgTx3DZU4rFvOooXk1s98gU9Td5Je6a4sFbY1WW5wjw=;
 b=kcQWAxtgt3v6rclh4ExEXIsg5OMyXMVKZ4Lx7HsYC92v84oe09SJTWK+xc13vl3hpSFvM30Y6N8HqJ+HpMLysT/ClzwdjFIVQCjM1Ej++Yzh9aIP3gaWgNOBFKw3NCzAXf8cxgEqxM8cIVg7VHVr/wHHcaFxLHl/zFWdzW/Bx3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AM9PR05MB8720.eurprd05.prod.outlook.com (2603:10a6:20b:413::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 14:36:29 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec%4]) with mapi id 15.20.5061.029; Thu, 17 Mar 2022
 14:36:28 +0000
Message-ID: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
Date:   Thu, 17 Mar 2022 15:36:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     xdp-newbies@vger.kernel.org
From:   Federico Parola <federico.parola@polito.it>
Subject: AF_XDP busy poll receives packets in batches of 8 on i40e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::21) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b7a8563-07ca-482f-baa4-08da082385a6
X-MS-TrafficTypeDiagnostic: AM9PR05MB8720:EE_
X-Microsoft-Antispam-PRVS: <AM9PR05MB87206492C08D69C6FEA08C24F2129@AM9PR05MB8720.eurprd05.prod.outlook.com>
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXLW734U6KDpCeHchufR0DMR9Kva0sH8m/PylODmGmUpqup1czx4rRcNMo8oeaRI+7aEp8iP2M5HVTt3VgUFp+6Sb4uXhDzjxkGNH+lWzcG8+Y8XaV1COVPqMIt5rD280oCNmNtvD26Y6VCHEjYioif2mAZ4y0Lxr0Fu+IU3GIAROuYwlB2nkhtH2XXwhwaym9hOA3caSfY1TnWzlBXl/JdEJQgVDz3DpjFNmQxQaCQVpWcrab50gYWeDwyu5VzIv9tI/1g73yfkD9x0GJfxPqhBm/10wzVxHixYfQsVsHCOM7gUrXn3Bjn+EWzdsFX1uNnu3PjxDKXnE4S/JJb6GbvctXPJlLguRI0DN9hsSjL23Wok9cvOTmOmi32usGDLJjEr5zuro0vTB+QtpE0Q9jT1sY22ffL2lzOyfbNF2C9eydx7SwcDkl+oLfGHIgK+KERMVPZpgUikzdMSWvBCPVER+MzjhvzNGwBjqYyvEuJXhNo7HESx19NmLvrXzaU6wicjjUo6JYLXN7FaMMB/K7rDYBgvgU4/ulfLppIdDsR4TVyBJXgc8rIj5MfREbguaA4HHj41iDMGvOzG0ebRan1AfN5wiZj67cp+ePiwG2AWXa5s2oQOPLwLW0nwRzFSIAm0DFm0+lcLUxlPBCwYgCkqRlHvhoHE0Et4oUxf3urnDbv9cN5FsPPkIbOm7+RRyH47eWq/wogc3yGSiYN5VwlimDMzbEPxEpJPBQTZbQCuDG/F1X5v+q9WclXYD7AMq+6N9QJTEIDFql4pGmBF7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(38350700002)(31696002)(316002)(36756003)(31686004)(52116002)(6486002)(508600001)(6916009)(786003)(6506007)(6512007)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(2616005)(2906002)(86362001)(8936002)(44832011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWM3aFpqSEttTklxajNBUFQxTlhEcEVBUXY3ZnNUL0JROENZaS94M0JPbHc1?=
 =?utf-8?B?TkVPQ2hSVFpIbWw3UWNXS1UwQW5IZEhLOTBiSVRBQmNCcVROVFJHVzlhK0ZG?=
 =?utf-8?B?Qyt5YWdsZWJkYkdnbUN4SFc3Ky9TcC9IS1NUeWdaV1B4NDFSdThvMG1SeFVn?=
 =?utf-8?B?RUtUVUhBUkNZY2ptTHZsbGF6U080NzJUa1hZV2cwTU9NQVJpTjM2dHpSYWZP?=
 =?utf-8?B?dmxXZzdvaVRqT2RMUkt2czRQdStCbkpEQ1o4d2h4TDJRVFhPUTRiemtiWFRh?=
 =?utf-8?B?ZUZkeUwyT3pEcDdPN1FkRDI4ci9keFhDS1BVa3VsWUJQYU5sQWZmSjBzdXJa?=
 =?utf-8?B?VUpYMHhaVlhrbjhQWkRhRGsxTmZDR2QrZHpyb1huQmgwNkJiUGdXN2pYUWdR?=
 =?utf-8?B?SzNaR1JpSFQySHdpQS8zTnd4L01JcXhrYmhkRnc0RWJwb3haclZpdVpqVzM5?=
 =?utf-8?B?RW9SLzNnWEFpRjNrdXo2ZXJOWk9IdThRVzE2VnV2dFhpR2xZU0lhbHhCZ3pI?=
 =?utf-8?B?SmpxcDl6WERPU1gxbWNUUjc2TEdOMDgybUFYZEh6L1ZJUXR6TTZDKzhpN1Ba?=
 =?utf-8?B?UWdDNWJJSmF1RTBTcDg4YkduTGxYV0Y0QjJjQXU5OU5FOFNYYmlNeSsyemNO?=
 =?utf-8?B?dFRodE02Y29Ia0p6MHBnUnBlZHJJOXBSckRRZzQ1YnZDamh5TDRuUEFPVnNG?=
 =?utf-8?B?MGVxRjI1aW9DajJtNWFYOG9PcXhJVGtLMXpvTGY4Q1FESEVGMEpjR3J0eTlp?=
 =?utf-8?B?clcybnVBWVJ5M1dsaHpHc1hNd1lNT0VnazFsL2dldTVDRG9ubmh1bWFSUHB1?=
 =?utf-8?B?RnZPV1hIOHl3WVE2OGZoeTd1VHEyeWU2Y1ZvWGgzeGNkdWlqa1E2V1NDN3No?=
 =?utf-8?B?TVVPNERoOSt2VjhiSVFveDBJZ2JabnpxaERpYkNzVnd5Wm80cG4zNFc1SFB2?=
 =?utf-8?B?eEU4NHJVYU4yTG9lSVhuaTljeVhKdVppcDdER2dycVNlRWRad2ZUUUpURXJi?=
 =?utf-8?B?cFU2aFdjOVVFemdIbHArOTg2ZFp0K25zNzlWTHQxeUF3STBsRWxyaEt0QUxq?=
 =?utf-8?B?Q1AwOTdXVFNQR3QrRndCY0RkYkUrZ3NNM095RDdZZnc4eFN1V09hWEFBMjdh?=
 =?utf-8?B?M2tBWXhnRW02L3NEYXYzSm1YT3c2Sm9DbzczTkRhT2lrTkg5TjJqNUlYRHRs?=
 =?utf-8?B?SlByZ1NRMXJNZk9sMEIrMFpPUTJ0OE1SQTd0V0RLQVJwUUsvOWI3M3R6RW9y?=
 =?utf-8?B?SUdUZTN2VDVtSmJHTUFZMGNYbjd3b01SV2hzT3R5SzlhM00vTlQyeldES25D?=
 =?utf-8?B?blZRcTdFVnBTbnJMYW92RFRoZVhmYmZpL0tITEE5R21OV3E1Zy8wdXpMSXRh?=
 =?utf-8?B?UXQ4ck9vaDNHRTRlZWFLL2hUR1EzVHRaZnFyT1gweWNoanptc2NnZ2tMYzBa?=
 =?utf-8?B?cjYvZnN2NGpjV01HUHVPNk1TUWNyU25oZFUwRGkvaEM2YWFkZ1hkOEI3Y2hz?=
 =?utf-8?B?YWc3SVUwZTZrdmtOazYwYktYNUZzSXNrZ2FDOEluY09YVWpDSGVzMmozOHBL?=
 =?utf-8?B?VFJ4b2Q5U2hjekhjSUxGcGFtYWsrNnJXNFZCQ1hzTWI4RHJoVllDMkVtVGdk?=
 =?utf-8?B?Q0k2cGFJSXZIUjhuR2pZODJNU3pLVjI4VGVucFlvV1M3VExtTzBTNytzSjFN?=
 =?utf-8?B?dUd6Q2JQRGVWN2VFNEdSZWFKU3JMaGNCZXVneS9kU2pqNFRHM1gzR2NWOEdy?=
 =?utf-8?B?UEJUdURUYmo1dXlOSlNtVTBsSUUvTlh2T0ZjUCsrS3ZRWXUyOW4vVDhuQU1T?=
 =?utf-8?B?WmVZWFFlTkRzT3FiaGxnRFRjYjgxamxld2ZYWHU1YmhSZUlxc2oxL0dJYURH?=
 =?utf-8?B?RjZSTlRWVGdxaE9qenJuTnRwS1J6dzRxSFZuNVdtS3YyMFVWVGdZV2I1bzZB?=
 =?utf-8?B?N2Q0Mk8wcjFIVnplaUtyWXRpOEV2aWo3L0FUQ09JSk1mUkdybTdUTlJkTDNw?=
 =?utf-8?B?Z3dpV1p1aXF3PT0=?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7a8563-07ca-482f-baa4-08da082385a6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:36:28.7551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWmkXAB63hLzXJd1TymW94oGeRmYTGptShZbOfjRUD80XtVb3RRIC26JmHFyyBo2xc6tcIF1a/6e/f+xytVl3ugOmWgU7m4Oo/5r7BQLqHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR05MB8720
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everybody,
I'm experiencing a strange problem when running an AF_XDP application 
with busy poll enabled on a Intel XL710 NIC (i40e driver).
The problem can be replicated running the xdpsock kernel sample in rx or 
l2fwd mode.
The first packet I send to the machine is correctly received by the 
application. After this, packets are only received in batches of 8.
If I send 7 packets the application sees nothing, while the 8th one 
triggers the reception of all 8 packets.
Disabling the busy poll mode everything works fine and packets are 
immediately received as they are sent.

I tried changing kernel (5.12, 5.14 and 5.16) but all present the same 
problem.
I also tried using another NIC, an Intel X540 with ixgbe driver and the 
problem isn't there, so I guess is NIC/driver related.

I tried monitoring ethtool statistics. When sending packets between 1 
and 7 these counters are increased:
stat:           64 (             64) <= port.rx_bytes /sec
stat:            1 (              1) <= port.rx_size_64 /sec
stat:            1 (              1) <= port.rx_unicast /sec
stat:            1 (              1) <= rx_unicast /sec

While the 8th one triggers this updates:
stat:           64 (             64) <= port.rx_bytes /sec
stat:            1 (              1) <= port.rx_size_64 /sec
stat:            1 (              1) <= port.rx_unicast /sec
stat:          477 (            477) <= rx-0.bytes /sec
stat:            8 (              8) <= rx-0.packets /sec
stat:          477 (            477) <= rx_bytes /sec
stat:            8 (              8) <= rx_packets /sec
stat:            1 (              1) <= rx_unicast /sec

As far as I understand the first set of counters are hardware counters, 
so it makes me think that packets are kept in the NIC and not even sent 
to memory.

Does anyone have any suggestion on what could be causing this problem? 
Does enabling busy poll set some flag on the NIC?

Best regards,
Federico Parola
