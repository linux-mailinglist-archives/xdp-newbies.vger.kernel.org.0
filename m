Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D164DD7EE
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Mar 2022 11:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiCRKbo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Mar 2022 06:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbiCRKbm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Mar 2022 06:31:42 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC2122A291
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Mar 2022 03:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls0rv1o1bSwhMp9+v4MCgERjS2Vjw/fR2GmDrQ56oQP9WE4HihRESk4O82VLpLmTc4RjEPHLlKtN1ZiWZ9jhxqwWO8Sp+WYV5wzP/CsKGB+9/U3OlzWo5xnQGHQ/SA2/ol2hbn6VTJN7qVU/c2c9diyqPE80+vr+3MilG73+1pHLjmNZ9mQwGxjW3kJfS3AuIWYI8l9u+14BQd9jbpeZiGeSK0JGGzJYFyKbcdDF6OdHJJxhx0XEXMDnv6hAmKwtqvA2t7IkzGPXOBiaH5n++LoAYSIXZLfLzp/mfu7PxNvdC5kY2939XlKXZEMe8VGJeCisigZcGKT3y/L8XI3SZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe5X96XgH9oqKyuQhwOEjXEhyT250sGAUc4ZiIL/c7k=;
 b=EwT8r7hgHYuh9jipvLV14Cwiu9NssxgbJvHMH7VJvtTgWs/rWeQzaQiEsAyFEXH+GNg4W7i7R7hQBnbrbrBy8Y2FywBFkX4I/jZG805VmvqIcPWmbmyPZllcZxmSVbYqdnjqxJ8CYdnjdJDfI94rE57Yv5ehgoDAeeHqLlICZ14Hm4Wo5fErQAPvVX2g4ID5Ae8uEiGvovF1pXrdWbxIQCmEVFCXy3C66VeXB2W29DnZqpxLkZR3fdNpoDTU0FGYtnmFlTQdMJHJIvhCZX3pR7O/ewUmgefKZMN9gAcdW42hMO0UoiRejBz666s3ImWxfs/LEuoRgSDpWtvGTm6dDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe5X96XgH9oqKyuQhwOEjXEhyT250sGAUc4ZiIL/c7k=;
 b=iJWvTpzHllfZeYCVOi8zGxqkfuRawc3+LERmQBleeH7Ijp5keki06uOBQ1+ju2onR1qB6OF8MvK2budxDWz4AtKulRzg//MDFqtiDcHUOYaXXfyEsQACi2xHs2F4JHasjS0SJtcVqF7TTRjRBI8atyZ04lX5aCWS61NIv8eZ0j0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AS8PR05MB7736.eurprd05.prod.outlook.com (2603:10a6:20b:254::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 10:30:17 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::aca7:88c3:e0d0:11ec%4]) with mapi id 15.20.5061.029; Fri, 18 Mar 2022
 10:30:16 +0000
Message-ID: <37d17135-df90-8101-159a-babd2ea58a4d@polito.it>
Date:   Fri, 18 Mar 2022 11:30:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
Content-Language: en-US
To:     Jay Vosburgh <jay.vosburgh@canonical.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org,
        Piotr Raczynski <piotr.raczynski@intel.com>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
 <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
 <86baadd1-daac-09fa-c3df-50308272ef77@intel.com> <2430.1647559617@famine>
From:   Federico Parola <federico.parola@polito.it>
In-Reply-To: <2430.1647559617@famine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1e5225-6eb0-4db0-f8e5-08da08ca4b19
X-MS-TrafficTypeDiagnostic: AS8PR05MB7736:EE_
X-Microsoft-Antispam-PRVS: <AS8PR05MB77364B941DCD7B8C54221831F2139@AS8PR05MB7736.eurprd05.prod.outlook.com>
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ob2rUQ8ZFhYOUobHwxGWZ0u8/hE35OS/btPgcTAx7GNAY10zG0XLVODhFHo7li9IbXWAWqJMxfXiVQOO0KLgpYXhHojsD58Y3CZrSwf9vra6aPh9cGM4M6ejQMt9Z8gtJMeU+H31OhHqnrvJbgLUMQXyljql2QNq6V/B6rkLLUtpoVkiSeCdzk5Zq6Ke8LKX97OpIkvCjpHUBshKLMhYyMGeNVE/zK+dNC7r6TFjE7vUPeFkp91Sp/fOJG2U5qvFvgg3PtOkhuBTET7y858WcFCiYeoYs3H9h35uPpEEw1nPx9B67+1WcNbevHSWhtj3qz4K8R8QhhoHmL+MWjf9/lstlySrHf2I6uxV2sF7sP1Ukc02dYcP6Wv2JvRyQ8UCo8ksC4zf+Eip0kMQf1R0Ub73ZEEuz8/I3fMUxOCaXauPyhz9NgKO50rU3mM5GCcRwCzHOic5X+cXjUopwq7YWltgwFx2LYTW24/ElPw10JNFVQAz5Mt8jQfHzlqccDquW+4A3hN2gGCowCA4T/alzIlyOzUE0H2IZ+9lbrWv0+8GGJTBbb/BA5OjhW+uy+fSTNTkYkGJSz7JOiB24UUq5mXVtBN+Hq1ENZf27h71WXwjPMPEsmhhfcLog7yHvuPANFJhcgvz8f95tg/06VSFv7QNZXgSpuKlx8WqwQX9oGkZU02ipqB9ON2ZRWJnIuj3Mpk0q/rT9KGQgby3nvOi57lWzHUST9uyMlasQC7RdztF+WfScrPvbzNVML7/3DJnzNeP03+Pu+4YO/YsXVsRfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2616005)(31696002)(83380400001)(26005)(6506007)(6512007)(8936002)(53546011)(44832011)(52116002)(186003)(36756003)(2906002)(786003)(66476007)(8676002)(4326008)(66946007)(508600001)(66556008)(38100700002)(5660300002)(31686004)(316002)(110136005)(54906003)(38350700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdESy8zYkFyTE8zV2ZDdENUb0NmcWZ3dlo2VUZwTnBmNFA3cEVaVzc2dS80?=
 =?utf-8?B?R2hSbWg1Yk5BQVo2blhaOG1HUTNBRFF5aHFualV0Y1dLcU4yOXJUVWJ5WVZ6?=
 =?utf-8?B?OE9Mbkw3WFRyR25LM05xNFlkbDBxRGZReml6eDNwSXlPSHBhZlRORWc1TzIx?=
 =?utf-8?B?VDNiRzAzczJMbjNod0VMNHpPRUZocjBuY2tJUENwUjBIdytvazdBQzExckwz?=
 =?utf-8?B?QXpTa2tRdFdJSjlHaGllblY4Z2ZRS2doV0dmcUZvSmhPZmV0MElJaFBjWUdy?=
 =?utf-8?B?RjZ4RTVqZ1I1OG1CU1B1NGZNWFF4bWd3TGlkUDZXUzVvakpBSmZmT3BXSWNL?=
 =?utf-8?B?WHVQbzFVcFc4bW1LYi8rSEJNS2xiN0Eyemt4N2ljR0dSN1F6V2M3TUNURkVH?=
 =?utf-8?B?cnhmNGV3ZDdMTlFweFl0R1FsQ0pmcGcyODFIMFNiNjVuTFc4QXFYaFAwa1B1?=
 =?utf-8?B?Ync5SnVNQ2RmMzRZajc1alcyNzBveWJVeEh0a0JWSjNlcWg1eEgrRHovekJu?=
 =?utf-8?B?N2RiNzFQVWRTYzZjRWNUOTdKZVZtYTJURXFEQ21FaW5aMlhMNGFBdzEwSWdo?=
 =?utf-8?B?S1RTL0Y0SXZkRUFUZ2s4MUprZUw0M1ArVjRlMXBnUDRZMmIrbnhyS2kzMjIx?=
 =?utf-8?B?eFpyK3d4eFplb28vYk5LcmhId0pnYnVYa0lGY3ZJQ2QzQ0p3WmEwdmpTRGZ1?=
 =?utf-8?B?UUhTbVV5TTZ1ZUFkRW42WjMwdkQyVmRLMCtyM1JiRG05S0VGalZwS0cwQzM3?=
 =?utf-8?B?VloxVWtqT0VkN0RDYUg5Q1A3VDBhSDR5bmpSRWRWQzR4TSt5Q1EzUU9aSWpO?=
 =?utf-8?B?a05lQWVWSXBBajUzVnlmNG03akNuYjI1UlhuS0QxTUp6dzhTdjEwdlo3VzhM?=
 =?utf-8?B?WmVJLzZvczR3Rmt2V3ZrM1pMNis5SDNKK2hTNDA3b1FoeVNacTdNNUxLZ2My?=
 =?utf-8?B?TVU2U3RHd3Joa3l6NFhwV2w1U2M5VVNjZmFkK3FUWERWaXdsQldKcWg0NWdB?=
 =?utf-8?B?bGk3UXdqenltNGx5aGNzTzJuaEp4dmt2cXR2UFNtMlZRbTUrRDZXVmNHWmk4?=
 =?utf-8?B?U3Zva045S0Y5V29aZXhZN3hqMWx1bld5NGd0UmZVaHBSYnNPU3Z3QThXQ0Vw?=
 =?utf-8?B?OVRWUi9mNERvM2JwWHNoNDRPQjNuNGFiS2p2cllXMkw4U0ppQ1BKd21PL1FC?=
 =?utf-8?B?UlpxMTdtOWJrR1lyM0ZuU1hwenVQNU5vOFBVbkJUSnBKM1VCTjZ1T2tsMXhY?=
 =?utf-8?B?dTVxaGNhNnFiVUJpSmJ0TWxvVm5ZdWxZczN3cUkvWnFyYUNTdnVuUXIvUlJ6?=
 =?utf-8?B?NmRmM2tJcDI3SXFYeElpZDNNNlBvODcyVHN3bklZNFlGbW9GdFV2bGMrZ3M2?=
 =?utf-8?B?UCszdm5tR0JLWVNEdHNEc2FnblNJaGFHQW1Lby9GeGMrb1V2aHBHandZaVFN?=
 =?utf-8?B?dVFRL3JCOFdGdkR6ZlkvUS8wZFUwZ1dUTjNPZUJaSjQwT2FHVmV5RVlQT3VX?=
 =?utf-8?B?WkowYWwvSFJuOUVyZ0lMU20rQkhybi9lcWtKSWVYNnJyRDFzMVFwcW4zTjJK?=
 =?utf-8?B?TU9BYXRFaWp0Z3RTZExlUUh0YjNxTWpYcmVDSHJiM1draEMxWWJHV3dnNFZP?=
 =?utf-8?B?Y09CamYwd3BJVzN0eHVHd0pxL2U4VkdRSWR6U0RKcDNaNkhRZ3kvZ3VBSFZi?=
 =?utf-8?B?K2lyN2RnRkVDUHd2cjFHOVZDN2VCSHc0VmVPaHVoUXo4UEtSWkdEZU8vaXpn?=
 =?utf-8?B?akZVd2xHSW9kaENGYWNpUEhVcEVqT1dHWSs0TzljQWQxTTc0dHJhNkUvWVho?=
 =?utf-8?B?RVVIdS9xQ2RFeG5nRTljMDJwdUlsUzZQbHhYWklwUmI3Yk1qWG5yWldVd2pW?=
 =?utf-8?B?dU5wVkhWSFV4ejVIZUhRTTNCMC92TDJlbzRGTllSNHBUNUxxSjNUREdMb1Q5?=
 =?utf-8?B?eGVMZWFoeDM0aFlpVFdCa0psN0tMcnN2aEVyQjJHZVIvQnAraXFJTHkrYnJW?=
 =?utf-8?B?RDVkVU84ZVBBPT0=?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: be1e5225-6eb0-4db0-f8e5-08da08ca4b19
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 10:30:16.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSnTltZeIkoIsLxzlj352B5zcxHItNzB052BLYzAECBC5cXpXSy8DJf2ZNGD73A18R5BBCWelyyn49Vg3sfbsqrd/Q1MTBxLXgYBhxH4AUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB7736
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 18/03/22 00:26, Jay Vosburgh wrote:
> Jesse Brandeburg <jesse.brandeburg@intel.com> wrote:
> 
>> On 3/17/2022 8:34 AM, Federico Parola wrote:
>>>>      We observed similar "batching" behavior on i40e devices late
>>>> last year in ordinary use (not XDP, but using SR-IOV VFs).  We
>>>> instrumented the drivers at the send and receive sides, and determined
>>>> that it appeared to be a behavior of the receiving device itself, i.e.,
>>>> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
>>>> update of the RX ring pointers) until packet 8 arrives, at which point
>>>> all 8 were delivered simultaneously.
>>>>
>>>>      The issue was evidently in the firmware, and was resolved after
>>>> a firmware upgrade.
>>> Hi Jay,
>>> I just updated the firmware to the latest version (v8.50 from v8.30) but
>>> unfortunately the problem is still there.
>>> However I'm experiencing the problem only when using AF_XDP in busy poll
>>> mode, all other modes (standard AF_XDP and normal packet reception) work
>>> just fine.
>>> Maybe the two problems are correlated in some way.
>>
>> This sounds related to the WB_ON_ITR feature in our hardware. If
>> interrupts are disabled the driver needs to set that bit (and an ITR
>> value) so that packets get written back in a timely manner and don't just
>> wait for a cache line edge (I bet your Cache Line Size value in PCIe space
>> (lspci) is set to 128?)
> 
> 	FWIW, in the case we had, driver changes (5.14 upstream, the
> then-current Intel out of tree driver) didn't change the behavior.  The
> PCI Cache Line Size was 64 bytes; the device was
> 
> 13:00.0 Ethernet controller: Intel Corporation Ethernet Controller X710 for 10GbE SFP+ (rev 02)
>          Subsystem: Hewlett-Packard Company Ethernet 10Gb 2-port 562SFP+ Adapter
> 
> 	From an lspci -vvv perspective, failing and non-failing cards
> differed only in the serial numbers.
> 

I tested it on 3 different XL710 NICs, all updated to the latest 8.50 
firmware, and they all present the same 8 packets "batching" behavior.
How do I check the PCI Cache Line Size (I didn't find such entry in 
lspci -vvv)? Normal cache line size is 64B on my system, but I guess 
they are two different things.

>> Maybe something to chase there? We may also be able to look into it if it
>> wasn't fixed already upstream.
> 
> 	-J
> 
> ---
> 	-Jay Vosburgh, jay.vosburgh@canonical.com
