Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB5175E5D57
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Sep 2022 10:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiIVIVS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 22 Sep 2022 04:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiIVIVR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 22 Sep 2022 04:21:17 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80129.outbound.protection.outlook.com [40.107.8.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0607C1901B
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Sep 2022 01:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmOfXANyzypC66+OeLhMdMmv8q55BEfNmiMDFuWbKsjuQDC8DNrlAZZI6eXYOqBSnoTuzh61Q+8aVOeffY0odr6vI6hpcrgoXKHZEZvAf5hoOKEdRhTMtu90qLfzyeL0tYGhrfDp1SykSWjXeiM0wB5usWeHE8OTmhk9B5AI0T/OP8Xamc0cfEcwxJ/ica7yYV98WYhqyNCAiwCGDVaazVxyeoIIxyo7RXTDp/O+UFeNrGoMzoOdpQHY+QuiyUGFKCr95HgMdanwE1vef8fM0/t4+ec4dLQncsup1AEtt6zr8+dseeEKMO9J80dlWYfuKP8pZhh4xuTX+i4uiTcqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy1fkKdpSf4WVO6/PrVclY++IRPzdoIk0e7n07S1dJY=;
 b=S08KQLWspNBGVcn2j0HO4efEPDTYCzsEINJseMlCGaCPTkmAUU/9uMqF9lUqVUOFIfkAewA/4SiGnLzU7GfM/WlYp1V0XGhMvO+R7C1+Llrnoa9DHSSF4y58TbAXua6t+pkyFf++HCPoVAXUN3vp6wbzf7iYMcM5LYthj/n7JC3WDBALWas9boyFt1Pxgt1FOtx7ZYodhI18z5dnE3FSH5oMsU2h8yenOsCcQ34nUgCCGHC36uYx9yIfIbUfrgcZ1xBqriZYuHEg/g8reoobCOXm/1DF75CmJ8kLfDf5DhpY5KUJPxS2WxWgU3qp/V5U/9ojAtRlZpk8e29Z6JPeUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy1fkKdpSf4WVO6/PrVclY++IRPzdoIk0e7n07S1dJY=;
 b=jiuixouj1/hMwknl1qxTd6WcZeeZIJjBawtrMRcAZeogCvkuZM8CYDL1LMBgUJF6rHdLgL43sbNOKUNemXMdUtrLEo/2At1bKVdP1bsnWPw/3GFkVAbc57BKP/CnnyMzszCHa/tM8GFZRb8/1DYbtbcqL/ZUr8zgwm64FM0y9+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by VE1PR05MB7486.eurprd05.prod.outlook.com (2603:10a6:800:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 08:21:11 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::fcc4:81ad:455f:df06]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::fcc4:81ad:455f:df06%3]) with mapi id 15.20.5654.017; Thu, 22 Sep 2022
 08:21:11 +0000
Message-ID: <26480f7b-44b4-c6d3-2376-9b4be8781645@polito.it>
Date:   Thu, 22 Sep 2022 10:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From:   Federico Parola <federico.parola@polito.it>
Subject: XDP and AF_XDP performance comparison
To:     xdp-newbies@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR05MB5223:EE_|VE1PR05MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 7375692c-9005-4898-9231-08da9c7367da
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxMDHulnA28LYX1KJ2ZbZHkk4dhuYZMx5K64K/EmXxng6euvjZFZjrqj2qGHfqw85dT71IS9OGA+aCLQ3J7WJrfTb1xiGhCBF+KU92xLs5KINWN4h+kIPFrRNHMQJLKb0Eupp05n08pyOiCaUpfpjXUkMVhQBGbzE857qAXujfpeAPz8Ow6KS3Fovfj85yr68jUHgnEvzSy4os5AXatVPi+vANcWYGPfKIJjI9cRR+Y2YnK3df0rbp1cRPkoMYe8wq4RdMvmjWwX70Vl9Z37Z0CBpPSWiH5xMAVIAvyz5bwvQ15Ang5VQhcRM3NvvqTAHNzr8fvHNxWVnNy0wR4ugnMphKwK0aPmP9BzdWTzl9OsK49XgcskQj1BxRqc3TTPuqyK6urRVOfHixGXdkwjA5T8CJCOU3veG17IDe1smEbH34OdnwUpSqqBCZ2OB5AjK27B6XOevLRTZKuBPJZkPlpmWeEm2FblLW4ALq2PR/1g6mOxF2qpstZIAeVP1hE3Dkfy6ZyJZbv2NQbXKldpa27FdOdnMaRIDVw7W+yBKGYkSHy76paQayFAQSwVPcgJCd70qfqL5bEKEWqvWA/zkCSTf1cBiWdZxtexAQBH2UrdtRSvx5wAf02v8RXZcMdtYrg+RSQhZ78WjLvwc1qe4v3H3CqZB/RlPPmdBa+GUVuxIiD8dx14GmK2IAmOuxbezCiTQxt9786Y1pwUiqb80SD/GY9++4U3CZB3Rem3/9OGS+YuWzDqEnjmWpXxrWHQvGmSA6eBImBGQAM3LNoM+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(451199015)(38350700002)(26005)(6512007)(31686004)(66476007)(66556008)(66946007)(8676002)(36756003)(44832011)(86362001)(31696002)(41300700001)(786003)(6916009)(316002)(2906002)(4744005)(8936002)(5660300002)(478600001)(966005)(6486002)(6666004)(6506007)(52116002)(38100700002)(41320700001)(2616005)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVd1RnRONVVFSnRsMDdMSk84Q1VrenIyMC9HbDd6clJWdXQwRmJlSjJ1TU15?=
 =?utf-8?B?OGJNcUw5U0ZaZDRXWXdoeGl3QjVXSWdCdUlwWjJLNTc4Uit6QmhKeFVjSEth?=
 =?utf-8?B?Tmpiem5Sc1Q5UG1EbjlsN1FIbm9menpZZk9uSDl6SWpNam92bGtmVVlUN3JR?=
 =?utf-8?B?Z29ydEZEYlVpclVrVVRNeHFEYWZwVEduSGJTUlUwWHZrUVQ5emlKNnRHR2xh?=
 =?utf-8?B?Nmc5WDQ2eDRjVmdIQ09Td01OZEdyT0MzN1pmTnZ6YUF4TEVGbWg2MHRFSHd4?=
 =?utf-8?B?REk4Ny8xWWRUalh2cmpIMGVTWWpYcmF1NDRwT2crTXFFbEtCU1JUaUtPT013?=
 =?utf-8?B?dThXYU9mWXpTR1N0cHV6VnFNWERaMldPazRmdmhnL3BiWEpzc2NCaXhtNkJE?=
 =?utf-8?B?QXAzaXNrQ3FCWllWRVZWMk5FQUMxeWNpQlJVQUpDRDV2Qys5OXRMK2tONHVW?=
 =?utf-8?B?TzRseURsQnp1eVVLaDZSdUVIYWdYYUtlL1FVeUUrUThQOXFOWTg1TUJ5L2Jx?=
 =?utf-8?B?TVpFMDd3endDT3FBNzYzM3dvRE5xQnNFTkN6ak9tdm4rM3VIOTFDMUNyUzdB?=
 =?utf-8?B?azhFUSs4eVRQampjd2FJSGppWm9yKzdRVk9QcjBJdmtUb3ljMCtrM2RRaFIx?=
 =?utf-8?B?dC9Hb0xvN2FCVWpaMmUrOWNrc1JFcDh5YVV1T3U1NVo2RVhDWTJVTWt1WUtE?=
 =?utf-8?B?WWV2dG14UERMc2Q2cnFjYmQzaWdaVTdtM1FqcEhUcUJ4WFZ6KzdDK3BtcnNN?=
 =?utf-8?B?VUxzZ0dTUDV6N0JMVnlyWlFaeTRzOTIrbGpHdUp4S2tkNDc0SWh2clNTWnpj?=
 =?utf-8?B?ZEE3NDZtSkE2RDJXeW1yQXdmN2Fja0IvajVXSEVMbWRGUnVPWXNSMGdDS3Vk?=
 =?utf-8?B?ckxhMFdxaHBFcjQxRHU1U1dNNnljbGlKZTdLSjN6NUQ0V0hXN2dINXA2b1hD?=
 =?utf-8?B?K2t3NEEvR1luMHJ4Nk9qbndTVXVBOENqRTdicisvcFd1b0hoRVJDa3MrclBj?=
 =?utf-8?B?NlpGQXVORTN2cmpjREJvOFY2UVVTUEdpaER5SmUySlFyWEIxZnNLMll1NUxa?=
 =?utf-8?B?MU9sd1ZlNDJxcTI5QzdMekNoZllvRjUxbU4zMmlzbFpKNlRIV1hlVTR4c1JN?=
 =?utf-8?B?VS9WbE12UUVyQWVuRklEempSdzQ1eVo4OVVMek5kV0dXN0dkWHFaL0N4eWZr?=
 =?utf-8?B?MElhazNXSUpKMy83K0xOMWdONHdjT0RzdjdHMGhZZFIxcVJXYW5pd1IvTysv?=
 =?utf-8?B?TXVnYk1PbjNmWkpuTVo3RGJxUkRKaXZXSDE0NThzZnA4Z3dBR3BVMVBLQy9J?=
 =?utf-8?B?L3lIWVJFdEdjZGRyZWNCd1JuUmR6b2JtVHB1dnlmWHhVT09KQVZ1TVBrQkVK?=
 =?utf-8?B?UmpkZUFBVGluRUtCeFVRbEROOXhkcEJTVlZwVkdVdkZGbUllK0NaSTBpeHJO?=
 =?utf-8?B?RzVKS3hOUTF1QVk4ajVNSmVyd01hVWE2VWtHRWhkejM0R1RxN3pGQnMxN08y?=
 =?utf-8?B?a1dpbmRVSGZ1aHZIQkRydFhyYmNDbXJMenhIT3N0WWlPWTRBbGhwY21RUW90?=
 =?utf-8?B?SmlhWEJ3NEJjalE2WUZEOGRTRHJNVzlLVzR4Ukp6MnNpb2llc2xhZTFab2FT?=
 =?utf-8?B?cWZKcWU5TWFWaDFwMlVzRm1GTnhEN1dMVjVKV0VvRERBTHJwRkd2NWJtQVh2?=
 =?utf-8?B?aU9YTFlDZkZqL2JpeUNXNFFiVzFWZlFYNzI0TmtlcVlqSzZEaVc0R2FSYS8r?=
 =?utf-8?B?QXp3QXFhdDJ3b3hlVjlySGFLUUo3bnJOT0YwUWo1OVNSQVhoVUIvRGNZU1p1?=
 =?utf-8?B?bHd1RU0ycGdhaERDaHg1VnBhSFdRNCs1T2k0UVdpSXFobG1OczViVjZJY1Mv?=
 =?utf-8?B?ZHVUcjR1OG9BWnFaMkpUTUpJUU1NY1ZsV1pkbXhnOHBTV1RtdnlyR3FQa3c2?=
 =?utf-8?B?Wjk3elRGeSt6MDh1N3lYSWpsWHB1SS9qakgycGtoT01Id0N3eTNMYmFVd1cy?=
 =?utf-8?B?SEtXRU5wMGg4anJjQ1RoUVpmVmFHT0tFL0pOazYrNTZ2UlpZUHpLb2VvYjJR?=
 =?utf-8?B?MUgveDRqQjVqRDVzVDg4b1VLaFh4cURUdVMrVWlxU041aTFHOW5LR0lJVGtW?=
 =?utf-8?B?b1N5ZUtLaGNKellhRzQreG41Q2NJcHdUZGorNWYrSzdwbzFMc1RhME9vR3R1?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 7375692c-9005-4898-9231-08da9c7367da
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:21:11.0926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6zRGnnjGH1nfTH+yhE0hID4p0Zp6eBC+r3l2J9FVnm/DXsIlXlcoUh5v5Kf65J2gQ10d48UvX899ijdtbrOoVTBJcrj29ElbDezBcUHLiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR05MB7486
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Dear all,
I would like to share with this community a draft I recently wrote [1] 
on the performance comparison of XDP and AF_XDP packet processing.
In the paper we found some interesting and unexpected results 
(especially related to the impact of addressed memory on the performance 
of the two technologies) and tried to envision a combined use of the two 
technologies, especially to tackle the poor performance of re-injecting 
packets into the kernel from user space to leverage the TCP/IP stack.
Any comment and suggestion from this community or any type of joint 
work/collaboration would be very appreciated.

Best regards,
Federico Parola

[1] 
https://fedeparola.github.io/publication/xdp-af_xdp-cmp/Comparing_User_Space_and_In_Kernel_Packet_Processing_for_Edge_Data_Centers.pdf
