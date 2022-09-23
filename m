Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C75E7B7B
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Sep 2022 15:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiIWNLv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Sep 2022 09:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbiIWNLS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Sep 2022 09:11:18 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80125.outbound.protection.outlook.com [40.107.8.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF8E130BC7
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Sep 2022 06:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikaLPQwiSeIz5IZm431pCJIhxvMyspUoTwWsHWJjnyJXKMkUWgtOGNWr8lY9dKi8YeflEY1gvlKlHQNIsmjbvXyxGKuu1lDxbKw6sooYLhtUN8ZmdDp7OjvKFE71dhuDWEqCE33GuzNpSTEkt9CnLAmVdt9PxMkDLHm3i2MvAdiJdqe8sbaRBSk66mrXJnF1WosuXgGYF85AspcrjFJkd0+3FIF3PGZQvRmk17Pmts2s8+0Yvqr06vNtM/bU0k3lshL5VbmOweErKBvpez5azRAxgCWarfZWQkeeolzIbWkcijwfb3Bcok6nUbnfwNIrWo4Q6uxvIdYdTLsduH6wsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI3zA16p23uR1z+IxDIVItZbbohNNR1ffv3YnIvOPho=;
 b=FZfqWonEQZqF4ohnXSxzo0HELGdSY40alzSnJfbbmxGtFlZVTagkoJSZJt5FYq/DxC/R30FOiwZdVT6IKIOdNRcabpgM2qjlRpgkPMdGLUeZMt4pv8ZXudy6H33GbqLUc5t6JATNxL62e/QajyCLXHTq70JUiT3cTioYPgBQ+4O+Uc5FNcrukQfhQJVEgD+fCur3nIyDEDhn8/+RasOWLoDLNAVSrJPt4xmr3V6dRbCRWb3KJn5I6m/V/TN0RYq66H00+gl53ItQe6+P8VT21x4g/k6T0gwxGw5gdrb5e3Zd7BcOuQcdXo9On+JggNaBY7Q/MC0MhIMtLZp2qekVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polito.it; dmarc=pass action=none header.from=polito.it;
 dkim=pass header.d=polito.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=politoit.onmicrosoft.com; s=selector2-politoit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI3zA16p23uR1z+IxDIVItZbbohNNR1ffv3YnIvOPho=;
 b=R8k3tv6Xlfh/1FGPN3hTHc10cIRm3iuuU1iLhvk3DYFvzw5VbaYhpHTMFqnYA8bgUi5sLgKU/EUC+zrLeVWJ49AjpwzUAcKYerFBciv+oUBEpWtq714aP7OF/Kos7Dr2iuhAos5EinLXu0VhEf4q7EmrNTa3UuF8uzD2s3V9Mdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polito.it;
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com (2603:10a6:20b:68::17)
 by AS8PR05MB10416.eurprd05.prod.outlook.com (2603:10a6:20b:610::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 13:11:10 +0000
Received: from AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::fcc4:81ad:455f:df06]) by AM6PR05MB5223.eurprd05.prod.outlook.com
 ([fe80::fcc4:81ad:455f:df06%3]) with mapi id 15.20.5654.017; Fri, 23 Sep 2022
 13:11:10 +0000
Message-ID: <f95f7f13-57a2-ba0f-3125-057d320f43cf@polito.it>
Date:   Fri, 23 Sep 2022 15:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: XDP and AF_XDP performance comparison
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <26480f7b-44b4-c6d3-2376-9b4be8781645@polito.it>
 <87r103tfsw.fsf@toke.dk>
Content-Language: en-US
From:   Federico Parola <federico.parola@polito.it>
In-Reply-To: <87r103tfsw.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::16) To AM6PR05MB5223.eurprd05.prod.outlook.com
 (2603:10a6:20b:68::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR05MB5223:EE_|AS8PR05MB10416:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf8917f-5ea6-4f7c-fcc3-08da9d65158a
X-POLITOEOL-test: CGP-Message-politoit
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovZpj4XPSr5cKtj5U/oVx8ZQwSS6k3+VDUhEQF9213GxI0/upQOHc+LQdbVhTOQm0fWIGyB5Btn7VS1Eg0yhfD2Pptzz/zI9tB3mFuWnvt0iGswoHPQtvd0d2LXP1SDORJAj4/bf6u/hafNEBVuy/EzklyDsclBCUquzBBWsMYHtXDpysn8CV2DbxbfS7jGJcXIc/r0PG2kLo4I7YDE16B8MDjf9YelH0ghJAuVKjGo+lhmaBBio5WfwRTg+sd2yjumN8uYvNXjXYwz2RMsAPZ7Sq783V8i3Rq8EjRZY34rKMkIR8BNgNnTA1lkd97F1jQFsjQnsyC9QeZqr/jJyaa90q0GTi3j2LwMDY+ynNNdiH5lZM8duGKzeuNUxUEgFPizOcD95ogL0nYs7RHkD5pHgiZ8POyhCR/nsBTIp8d97/egrwoR75fbBRuf8xJkW/63KV1uwq4DebdJUD0NZqGEX3G4YGS93NmyAfTW+cZfYKhO0+l+hOxQrR5W5u8do0DZeyMNq7uJ8Zh3f08DC7kYRmqPSkfPM3k54XAPLQcaif3k+1uQxmwFq+y8ztA7Ee+mhrKclcH0zD1l8RzZzMgCujH6J7VSo204drdNd6JAFhOYMUwj+M+vKgLp4ezIFU9TbFrEuTsSzC8tNtamxYruiGpiEGsrdM6oThULr4DZ1KYG6w63hgsepFz43bKULA/W9e3vNVn8k+fKeDZ5Ib9q0kDBpMAXaJz69/evob8tjixbvlzIP0zJG++nLHmJPQzkCsu5Vgsg9y5cnZEOJkWx7XIbBAZpm0PfN2Ayf2SObjTSLqJw+wAtAJdkEVAKA3EmlGqprt15jWm6HciVi+lBt0LuUulE6fR7WVxCGQJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB5223.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199015)(66899012)(86362001)(31696002)(31686004)(36756003)(38350700002)(26005)(66476007)(66556008)(66946007)(41320700001)(8676002)(786003)(316002)(6486002)(6512007)(53546011)(52116002)(966005)(478600001)(5660300002)(6506007)(38100700002)(2616005)(2906002)(44832011)(41300700001)(8936002)(66574015)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmN4UmRUNTdFa3FaOEY0T3ZFUis0ZzYyeFZzeHc0TFMzQUQ4cE1GUW5yangy?=
 =?utf-8?B?bWFHZ1J5cUdmV2J5cnR6aWtXVVdMalltYUR0VExWc1BaZ01NRmk1RXhRNjF0?=
 =?utf-8?B?S2RpYkhWdFZBRjVUSjlLQkxDWDF5MHZVa0Uzcm5uZm0wMmNRcUlteU1SUWN0?=
 =?utf-8?B?VEN6RVkwd2t4bjA0enFlWTB1dVlEclFpM0RSd3Z0WDNmTGVXSGRvQkx5aXBp?=
 =?utf-8?B?TlhpQzFteGU4TldyNHU2bk94eTNKZFhzcUhyQUpXbmhhKzVaNHl6bUgwd1RE?=
 =?utf-8?B?NUFqcnIrOE50MTI5UVVveTlsVDRFUm9INmlxUkZLZURpcmF3M0FpQzhlRWdq?=
 =?utf-8?B?SHR2c3gwbXZLa0JZMUdUcVBtQlhzWTNKNmdrK3lPQlJrTmpEd3FaTExPQzdO?=
 =?utf-8?B?eDNkMExoSlVOQ3Uyd3FkSmxkaE1GRzBFTHFISXJhNU9meXVYa3BkQ04relZU?=
 =?utf-8?B?OUtFekp1TmFZSVJNWEdqQ2RtTUViYllnL2VZangzT05tT1FXemRmQjE4U21U?=
 =?utf-8?B?UkxvSENKOTBJZXFyWFY1Wlp3eFlBQ3BRQmZ4SkwxYlAxYU1xUEZvWXJZTFNM?=
 =?utf-8?B?YlFXSk1HRXFLeG10MDRCOHd2MTUzeFA4Vm9VV1hrWHdiNCt4cUwyWEljSHpU?=
 =?utf-8?B?U2phakNZMEtjcTdnekZ2dHNwclNHcm1uTm9aTUl1OFZsMlpzS1IrV3RVaSty?=
 =?utf-8?B?cERSYUdkKzlWakdHVm5aYlJwZXExL2lnc25STUZ6VTI5RW9SNkZoWTRYRnF1?=
 =?utf-8?B?TkdEc1kwSUwvNW8raXRPTUN6OUpUcFYzTk9jeldVM1haSEswR011NldtUnlL?=
 =?utf-8?B?NWMwRlJhakRxNkszeXRYY2JhcldQcnBIeEhqRUZDNGxpSDYyOXVROGtkNkJT?=
 =?utf-8?B?R2hlN0FmRi9ITVZhbXZPYlB0Y1RQUGpPZVdMcURIYmpuOERWS0lPOTlqeXVa?=
 =?utf-8?B?ZjJGa3dZcVM5MVVvMENOSDdONndiZU43T0RhaTMvMWtKdDZlRFRQbzRLZVNt?=
 =?utf-8?B?YUMrQy82UjFVd1hpVlVEUG1ScFJRM0gxaDR2ZUFZT29yOHJVb3hLdFczKy8r?=
 =?utf-8?B?UVhGbWtJVk9FQzZETXZpZm9yS1pndlRHUWpwb1lMdnlCRlB1N1B2VjJ6dXRG?=
 =?utf-8?B?SDZDRWZMY05RQllkQktBbElOZ2FQNjhXL0Jtd3ZTYk96SVlVTW90NysxREFi?=
 =?utf-8?B?WFJINEVSSWRQNnNWOEpsMGFhUzJiVldseVg4VzE2cU8xVXFQWTY2Y3N2dU41?=
 =?utf-8?B?SHpmVHNJVTg2NDVia0kzL29PSWZYUXFySnZnVUZPRHhET29LUmIzSDlaQmFu?=
 =?utf-8?B?VURLZnU0MGpFZlhoQ0JEOENNUkdKRk9qUEFvWEVUQTlGUTdkRjBPWTVGc2Qy?=
 =?utf-8?B?R20vRkphY1l1MnR1T3hOZmFqMnR3MWU3dTd2U2JVRlU5THJyRjZndWRwempZ?=
 =?utf-8?B?cXFXNm9lT1dyejJpOWcwRnNwbXdLa2pqeE8zelJFMUJzd3FQTmpYdzNjSHcv?=
 =?utf-8?B?Vks5bzJqbTM5ZWpjdVdTZ2dEb2tuN29DUzF3Nlg0YTY1SHVKQzk0dElWL0dN?=
 =?utf-8?B?dWw4elFiT3NOR2FaMVo1b2thamlick11a1dNOWJHYWlhZG1mMzR3NEhEQ3dN?=
 =?utf-8?B?ZVhSN2FST0ZLaEJvM2s3UGt1MnVtZkF6UFNvZVZJeVlxOTdXdTM2YUFXS3Ju?=
 =?utf-8?B?Mlc3MFVKMkJVbW9zKzFYeXp5eHROUzU4RnpBTWtrK09EUUxSMzlBWnBFNWNa?=
 =?utf-8?B?RWJUbGg5UVFNM3hHMXFTNGxkR3JpbjBRdWNMTkRXRkFqeE92WTc5dkVUdXcy?=
 =?utf-8?B?MjZhVEViSFhWSjhGdzJTQktSWXo0NWxycWtNZnVKeHE0bDVJNEovcTVkVEV0?=
 =?utf-8?B?VzUzaCtlZU1QeUgxV3EwcGpZbTczcHV0Z0czZWZOczZvUzFCb2wrdkhHcHFp?=
 =?utf-8?B?UUNKdnJuVnlXbEppVlVYOEJmUEluU1Z6NjdKWWNEMXFpTmVnSXViaytGVkpl?=
 =?utf-8?B?RFZEdFZzLzNXaFZLWURZR2x3MUxZSjJFRmdmb2NXRkVWMHZScVZkaHZ6bCtX?=
 =?utf-8?B?UWRCRTlyczU5eVBDUXNFNDZSVkRwU2dtZzk3bHJGdnR4S0JvcWtuRStMdERp?=
 =?utf-8?B?R1ExTnh5Sksrb1IvaFc4VmpPa1ZMNXIwUlUwaUhzRkNGRWRlR0F6Qm9aby9I?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: polito.it
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf8917f-5ea6-4f7c-fcc3-08da9d65158a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB5223.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 13:11:10.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a05ac92-2049-4a26-9b34-897763efc8e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsXR9UO36QqMVlQqAx7ZALyKVriJnOO9qtG6YSdvSJ3fMN8mje0dLb8f+oZX51VLcj0w/jDxBoF0PQqasD2T0MK6rqzxc73ITzLkv4myymU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB10416
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 22/09/22 20:38, Toke Høiland-Jørgensen wrote:
> Hi Federico
> 
> Thank you for the link! All in all I thought it was a nicely done
> performance comparison.

Dear Toke,
thank you very much for your observations and your interest in my work.

> One thing that might be interesting would be to do the same comparison
> on a different driver. A lot of the performance details you're
> discovering in this paper boils down to details about how the driver
> data path is implemented. For instance, it's an Intel-specific thing
> that there's a whole separate path for zero-copy AF_XDP. Any plans to
> replicate the study using, say, an mlx5-based NIC?

The impact of the driver on the results was clear from the beginning, 
however I wasn’t aware of mlx5 using the same path for XDP and zc 
AF_XDP, I thought different paths was the norm (my bad for not 
checking). This could radically change results for NVIDIA NICs. I 
performed similar (but less extensive) tests on a X540 NIC running the 
ixgbe driver and the results show similar behavior in the relation 
between XDP and AF_XDP even though the performance gaps are smaller. 
Another factor that impacts results is the kernel version: again, same 
relation between XDP and AF_XDP results but different gaps. In 
particular I experienced significant performance drops (of both XDP and 
AF_XDP) moving from kernel 5.15 to 5.16 and another one from 5.18 to 
5.19 (the latter much more consistent). Unfortunately I don’t have any 
mlx5 NICs at disposal in my lab at the moment. If you are aware of any 
way I could experiment on an NVIDIA NIC (I know there are some open 
testbeds) that would be very interesting.

> Also, a couple of comments on details:
> 
> - The performance delta you show in Figure 9 where AF_XDP is faster at
>    hair-pin forwarding than XDP was a bit puzzling; the two applications
>    should basically be doing the same thing. It seems to be because the
>    i40e driver converts the xdp_buff struct to an xdp_frame before
>    transmitting it out the interface again:
> 
>    https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/intel/i40e/i40e_txrx.c#L2280

For what concerns XDP_TX performance with AF_XDP sockets enabled (XDP-sk 
in the draft) this is definitely the case, since the conversion from 
xdp_buff to xdp_frame requires a copy of the whole packet in a new 
memory page:
https://elixir.bootlin.com/linux/latest/source/net/core/xdp.c#L559

For pure XDP (no AF_XDP sockets enabled) on the other hand, the 
conversion only requires copying some fields. However, given the very 
limited size of the packet processing function (macswap), those copies 
might have a significant impact. This would also explain why the gap 
between XDP and AF_XDP shrinks so much when we move from macswap (+29%) 
to the load balancer (+14%). However it seems to me that the conversion 
is common to all drivers, not specific of Intel, so I wonder if it can 
be avoided (maybe relying only on the xdp_frame?).

> - It's interesting that userspace seems to handle scattered memory
>    accesses over a large range better than kernel-space. It would be
>    interesting to know why; you mention you're leaving this to future
>    studies, any plans of following up and trying to figure this out? :)

This is definitely the most curious result. Given my limited (but 
improving) knowledge of XDP and AF_XDP internals I limited myself to 
observing this behavior. The key point to move on I think would be 
mapping the additional LLC store operation that XDP needs for every 
packet (even when dropping them) to some code in the driver/XDP 
subsystem. This basically causes XDP-based I/O to have almost double LLC 
occupancy w.r.t. AF_XDP-based one (checking if this is Intel-specific of 
applies also to NVIDIA would also help narrow the possibilities). Any 
guidance on how to further inspect the problem would be really appreciated.

> Finally, since you seem to have your tests packaged up nicely, do you
> think it would be possible to take (some of) them and turn them into a
> kind of "performance CI" test suite, that can be run automatically, or
> semi-automatically to catch future performance regressions in the XDP
> stack? Such a test suite would be pretty great to have so we can avoid
> the "death by a thousand paper cuts" type of gradual performance
> degradation as we add new features...

I would be very happy if my work could benefit the community. Please let 
me know if you have any idea or guideline on how my testing suite could 
be integrated in the XDP environment, I guess the xdp-tools repo could 
be the ideal target?

Best regards,
Federico
