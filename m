Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0129D64DF9C
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Dec 2022 18:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbiLOR1u (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Dec 2022 12:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiLOR1r (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Dec 2022 12:27:47 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A60531EE1
        for <xdp-newbies@vger.kernel.org>; Thu, 15 Dec 2022 09:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671125265; x=1702661265;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ahsVNEfyMKa56Q3krQawTkY6pfv3fYhmQrvhKCREC3E=;
  b=Hswyt3/8my1FAv3KjUFcJG7lvvQjuWqvPikfey4iIjnwcgYuCbz2SK82
   ODhcewknz9BMSKGLy6cu0++93NPu42ZcXd2/6OfdcVBqTYPkZVOxdQiEo
   wHAsY3+e7/bfSbk5KW9aG0hMoAXeS4q46U7WQ2xSMSqVV78C8qy0HvKUg
   +gI2Vr/T1bEM3CG9yELQgZD2H1/aJZA9xKIJz5XAgBc8o64W4t5vef3o6
   5UHRcofuLXFde0Jnzit2L/BOjjLeLaioA1KivW8CPIJJI64HbSh5AiOzG
   XmrDqz55I3j5F2vkl9LxXb7TgPePbRhbrwpoC2kU35CedlyiVo2OYNXGO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="319907964"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="319907964"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 09:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="681964800"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="681964800"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2022 09:27:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 09:27:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 09:27:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 09:27:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWaXRa0taJIkF5nekNY4BF0SZy+1lvAl4m4d0Fy8m+BHXqe9ngFYe5TiqaoFK7AOg0A6J/BTebH+QXg+ZThKe31TNouTtTgH9pqvsDMIlfximmtydYjNlI7rl6qD0e8eSC/Te3Db3/uwofD1++X7eNfvnBnn4OvAygmeqkkSzR/L6YR73iHS8OACXEShlM1UNfOrHqSYxBUWEQkNEtK7gbpY7ttj1yJs8HjZgwOjKWpYuIXZXO62zrep9ZMClnJslPbzLKU1eufF+DF78NHQl6FDqnBBO+WnDOlz3U6/qamhWK1e22qt+1NAR2opifnrMcX0C9xf7/bSMqOszKBc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKQ9hKMowOHdRy6JUotnIkDbRypHpsnNQSXPxtHhbFg=;
 b=R6AjSNHPSYggXkoagQiYOw0fntaeBtVUe0IaZvQHmi7N15N/wqlv73MVzGqmSkRy0tPkJhJpnS2agGVujGiJwjulaq5qMnzTPI4W9TsGcjbrKMEHvPOb+GY1kjnVrEkTxx3ms/tjOGl0DN/RR+zX1I33JDChHwtWbbWOQYTz2zmY/y0gX1klbrsKmVBMl+cX2BoSD5K12kAi0VwWR65z0K1wPXcN6EJhpVAZ1fLYGYBJoETvRpuSnv4DwnRDuNzRhIkiuDg0x2/ay47zZTzliM+fHvCG9zfNO/Ure4oN5sL4erwAqY6wQSTXR+an9yIotBc1IlhvJ3XTI8U5ulrABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 17:27:41 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::fd3c:c9fc:5065:1a92]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::fd3c:c9fc:5065:1a92%6]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 17:27:41 +0000
Date:   Thu, 15 Dec 2022 18:27:30 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Robin Cowley <Robin.Cowley@thehutgroup.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        <magnus.karlsson@intel.com>, <michal.kubiak@intel.com>,
        <larysa.zaremba@intel.com>
Subject: Re: Potential ICE driver bug when returning XDP_TX with multiple
 channels
Message-ID: <Y5tY2pQSotkN+5Jl@boxer>
References: <LO4P265MB3758A4D43FB2F5EC0508231487179@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
 <Y48p32+plvWxNCoX@boxer>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y48p32+plvWxNCoX@boxer>
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 754d4a12-db2b-4444-ad77-08dadec1ab4c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhJbbE1wssiDKdsbKweCWZpSvxEmjufRP7O6rDp0P4ign8QZp9vvKrJbIJgFs0fxiY+t+0GRNoz3XcxocGblvzJZT/WX94RdSiV2oqJcjX6G+IWcD2hhLysqZOW3AQwBb7S4y8hQXqdlf/UbsyZkyCLnM0G1eV5vkcunCP9RNMgI0Tc49RGhuSp7mZn5YJCJqiNbI8tVp2BCNaPfG1RLCbVRIUkSYud2DMDIXtsKOXa0ZWMddyvdHDMNWV7ZewKLITdMGbEB2obZClMVWbqiHl3XOj+lXv+S3Ix9jznUFAe7RrHXm42YUboUUMvjRntdWtvHXo1CDk/PkVy7X+NnepeGVpntw22rxBZiKM6nUZB1P7qhBtqBd/RGwbAnV3DO0R5UwB7lKPWyAKM4FwLT7JSyOq01HTtCTOHa5FjCGb2Cr154khfAniy2/9lmUsl2wrqxTOsxch2w7kDffsL++i+yR/TlLLSfAxZp7E8i48Zr7YJHzZiEWNWBgKJCIB1W9KjchNizjjMgSvUz/A0faWPdZ0pBmlnyZQzDIJAlwKYdNXDrRJdjDxbw7opKLzBlE3cSRwiwM7HnhFr7o4+xovAK8bVMZYcURPj2aiip7tMgagnKhuWs1s+7yOj+KbWXnjEewbrqzuG5LE0kBzHVbMT407pJaEMRXAFKnKAS1b6HLbWSsvE24vTKcbcmL5ZLvsHOyopcE/BmfZOUzGe08K/2WXir65Un90NkRitTY7x0W1wn9QUPs6WJDVZbNb8a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(6916009)(66574015)(8676002)(2906002)(41300700001)(4326008)(66476007)(66556008)(66946007)(5660300002)(44832011)(316002)(83380400001)(6486002)(86362001)(107886003)(478600001)(6666004)(8936002)(33716001)(186003)(26005)(6512007)(82960400001)(38100700002)(966005)(9686003)(6506007)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25jNnhkOVdGSzN2T1AyanhBbzhVV2JyTTdRNnBVQUpxRDQybGJ4K2dFVUFy?=
 =?utf-8?B?L2R2NlFVT1N4S0dpZXNrdnBuWXRtNzIvMWdxNnlSaHlWOXlYdmc4RlQrcXkv?=
 =?utf-8?B?KzRMWnFxaTBHeTBkQXdJS3BveXpwWTJBbkRWblBpY1BhY3hCSjNtUzdzdkRp?=
 =?utf-8?B?Zm91TUcvakgrdkhoZ1o4VVBTNDUxeG1RNlFSd1NsNTBwV09YL0ZuQjhWTmhI?=
 =?utf-8?B?VWJMSlNENVVQeWFlNXdhdDBiMGhlbXBoU1k5T3QvdDdZbVdvVHV3QlpVS2FH?=
 =?utf-8?B?TTJxT0NvSXJWbG5nQjk3SVJ1VjJuc0Nta3pvSmFsQ09JMk5xa01GcERQY294?=
 =?utf-8?B?emJKQmNtSVd6ZnRYZFd4aFZUN2E2QjcwTlpxRmxkUzRLYS90WHQyRHFhNGkv?=
 =?utf-8?B?KzNwQXZLMXBhQk51MjdDUk1YQmZvbW5Qc1lKL0dNczFhT3FnemxrMEdOL1Vj?=
 =?utf-8?B?VUMzWklGVkJuelcrMmRDQ1Fic2dLWXErMXJBeG1rdUt1Sm5zbHpEZW5FbDk3?=
 =?utf-8?B?cGpjMmJIVFFCQUVGUnhLcHNNVlhndmQ5c254OUUvY2E3MDM5SXNLd2F2VUtl?=
 =?utf-8?B?U2JyQ3MxQWV1NStTaTg5MzFXcXhic1VIaW54cm54STFhckpTZVRKV28ySk5I?=
 =?utf-8?B?Q1lkR255WkxCQWJ6NUJRUUJ5RUYzOU96NE1LdmVOdlB5VVVncFZYTytUbXE1?=
 =?utf-8?B?Mk1NYUhnMklZUFVNYlhCM2VmQ0xwSzk3S3dCMExwUnlOaVhna1BPZzBXYVZG?=
 =?utf-8?B?eEd2N2VaWXF4OG5vaE9EVXV1dzFSNHA4UGVCOUN1bzdmb1dkbzJqTlpMWkNH?=
 =?utf-8?B?clFDTHR2YVh6N3BGT3dNY3JwclBneWFMVWZHdHZrV3lOYW0xdnBaWkQrR0FO?=
 =?utf-8?B?Q2YzMlVNdlZIK3I3ek1EODBPNlIrU2pVZ2UwaHlkQzdaQ1luMkpVc0Rxc1hs?=
 =?utf-8?B?QzdLcS90TC9rS2gzL0Z2MWc3eXZjazM2WXFaNkVwRDIvMjBkSGp0ZGRVK2ZZ?=
 =?utf-8?B?N0ovQ0tubmt1UHF6djQ3U3ZsZ3VPYWFsNFJJNmlYWkU4VkJ4WVBMcGFINlh0?=
 =?utf-8?B?SUZmamI4MUhzdDVlcGhMNFRWZXJocTVmQmUrZXFzb2dWZmdnK1dzVjkvSHFY?=
 =?utf-8?B?c2xyRXRYYUFSRHArd0NCRjl5azIxczFBU1RTZStEQ09zTjRZZHIvS3QyeGlu?=
 =?utf-8?B?M3dxYWRxQkwwek5ibmdYOGluYlQwVENUSnoxSHBJMzhtZUVneWNmS25MNkV5?=
 =?utf-8?B?V0hhTENkWXkzUVFyREpFbVdZZzFKQmpmVG9FQUV2L21sdkdJbnpTYk9wK1BN?=
 =?utf-8?B?eXQ4S2NrSWZQSGdXWWNUcFNRcVEzVWxtVnlEOG9kM2NraWdrMTVrRVhzSHB6?=
 =?utf-8?B?SDU4VEtSWVk2TE1TeE04ckgyb3ptNWRjM3VockpHa0hBUDhVRnZ5elpudDlK?=
 =?utf-8?B?YnhjKzRRdGVWQjZQd2FQZDViRHlOUU9iWkwwbjFLRFdmZktseThyRWFJQ0Mz?=
 =?utf-8?B?M0VnQzRHUE1HWmQ5dkRpRHBrYTRSQ3VkUDZFTXJJcnFDb0xUNXdVNG1UTVZ1?=
 =?utf-8?B?UWNvcC8yZWI2UURJZ1N5dmRQZHdITE1qVWhIUWRyQndKR2dNQXlqTi9ZbVpB?=
 =?utf-8?B?dnExTDUyS0VvK3c0UDlqNkFNZUtTaThxckx5UGMxcE83c1VQbDQxNEkzTHI3?=
 =?utf-8?B?cUVvdzdHY283VDFjUk04bDNwUWhJaG5PSW4yTlFNUnlrZTRCQ2cyZWtKbFRx?=
 =?utf-8?B?UzFnNTV2YU8yWWw0QVN1UXJSb2xwQlVrdmhpQnRWNnQwa3B0d0dHdFRCOVFP?=
 =?utf-8?B?SXNlNFZTcEhyYklkMUl3SHZ5aHRGWDVsOVJFSVZjYytHTk1naGxhRFVvTGJu?=
 =?utf-8?B?RmNkRWNkOGR3ZWxzRXN0ZU8vdXA0UkFNWUtUS1cwWUJHcVZOWmpSMFRxRHZm?=
 =?utf-8?B?SlkxQytmYmpJRDE1eCt4REdHSTJZb0M3Tk1XTWNzNG0xaWliWWVoTnJKRElT?=
 =?utf-8?B?OXFhcG5NaG5QL2l5V1hjZ0RtKzB6bUt0TGRCc2NoTklGRnhab1JpbE5vTEti?=
 =?utf-8?B?TVBYT2l6MmJ4N2pyd2Vsd0MrS05IQS9tRWpIVVlJb0YweHVzd3dhQisraVly?=
 =?utf-8?B?OG9tck5hSkFUY1ZnSEo5V21RaGtJUHF3YWx0WGJVWG93OGtIN1d5RFVuTXYy?=
 =?utf-8?Q?yCua4RJZ7wz9WCFJt5rWdsk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754d4a12-db2b-4444-ad77-08dadec1ab4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 17:27:41.1892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iknHBQSdnderMxfJE491qJoxla6F3qwu+uyV0cjT3mBWfaKZoaOkyraISMgZ8IOyTGKRijKyIWfom/BwO1Bls3fnb1KU49bOjTR1UCsHVTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Dec 06, 2022 at 12:39:11PM +0100, Maciej Fijalkowski wrote:
> On Fri, Dec 02, 2022 at 04:01:24PM +0000, Robin Cowley wrote:
> > Hi there,
> 
> Hi thanks for another report :) again I think I have a fix for this, but
> this fix is on top of the XDP multi-buffer support that I am working on.
> 
> I can share the set with you in the current state out of this list so we
> would know if this is a way forward.
> 
> From our side I think that we didn't believe that there are any ZC XDP_TX
> users so apologies that we didn't test this properly...

Robin,

although I shared a set off the list with you that is supposed to finally
address your issues, we thought that it would be worth explaining publicly
what was going on, instead of saying "I think I have a fix for this".

Some time ago we added optimizations for both ZC Tx and XDP_TX sides.
Then, it was pointed out during upstream reviews that for ZC Tx this was
problematic, so we removed it [0].

Now, the case is that ZC Tx and XDP_TX that can happen when running XDP Rx
hook differ internally. So, when you combine the two, things can go south
as both ZC Tx and XDP_TX operate on the same XDP ring.

ZC Tx (ice_xmit_zc() in particular) as a first thing tries to clean XDP
ring. Tx logic precedes Rx in ice_napi_poll(). ZC Tx can affect
ice_clean_xdp_irq()'s due to the fact that it looks at particular spots in
the ring for done descriptors. If these were already cleaned, then this
function interprets this as there is nothing to be cleaned and in such case
driver bumps tx_busy stat and drops the frame. So you get a deadlock of
some sort due to two cleaning functions racing with each other.

So, what we need to do is to find a way how to fix this smoothly so that
we will be able to backport it. Next kernels are going to be fine, but
previous ones need some massaging.

Aaaaand we need to add test case to xskxceiver for XDP_TX :)

Thanks,
Maciej

[0]: https://lore.kernel.org/bpf/20220927164112.4011983-2-anthony.l.nguyen@intel.com/

> 
> > 
> > We have been testing an XDP program with Intel E810 / ICE driver. The program uses AF_XDP in Zero Copy mode. In some conditions, the program logic decides to return XDP_TX action rather than XDP_REDIRECT, so packets are transmitted back out the interface they arrived on. (In this condition we also swap the MAC addresses in Ethernet header within the BPF program).
> > 
> > We recently identified and submitted a bug report onto XDP-newbies, as we were seeing memory type errors. [1] The patch supplied by Maciej fixed our initial problem of an incorrect XDP memory type. However, upon further testing on Kernel 6.1-rc7 with Maciej’s patch applied we have noticed some further strange behaviour with larger packet rates and more channels.
> > 
> > It seems that when we use multiple channels with dedicated F/C queues, some of the channels stall and do not transmit any of the packets back out of the interface.
> > 
> > We have been running a slightly modified xdpsock based program as a test harness on the test_zero_copy_tx branch [2] as per the previous reports. (Again, we’ve tested with the version of the program that enables multiple F/C queues per XSK).
> > 
> > This XDP program now has some percpu stats added into it, so we can have visibility on what actions we are returning from the XDP prog. We observe that while the BPF program does receive every packet and return XDP_TX properly, some of the channels experience a TX failure, leading to packet loss.
> > 
> > This led us to do a little bit of digging and we noticed that at a certain point, when a channel stopped transmitting packets back out the NIC, the tx_busy counter is being incremented. We looked into the ICE driver code and we believe this is originating from ice_xmit_xdp_ring() at ice_txrx_lib.c:288.
> > 
> > We progressed to enable tracing on XDP events; we can see an xdp_exception trace for every failed transmit operation. We added two additional tracepoints in the XDP_TX code path within the ice_run_xdp_zc() function of ice_xsk.c file – one on successful TX, one on failed TX – with both highlighting xdp_ring->q_index and rx_ring->q_index values. Our rationale was to try and identify if there was a pattern to which channels were failing.
> > 
> > We were able to establish with reasonable degree of certainty:
> > 
> > A) Tracepoints following XDP_TX failure always had a TX/XDP ring q_index of 15 or less.
> > B) Tracepoints following XDP_TX success always had a TX/XDP ring q_index of 16 or above.
> > C) Both points above are true irrespective of the number of channels we had configured (1, 2, 4, 8)
> > D) Tx/Rx ring sizes did not seem to alter behaviour – we tested with tx/rx rings of 1024, 2048, 4096.
> > 
> > We think this might be a bug within the ICE driver, but we’ve only picked it up following resolution of the previous issue [1].
> > 
> > Our test rig happens to be a 16 core (dual socket) so we think that might have some bearing on the above. Due to the test machine being NUMA we have avoided testing with channel quantities above 8, but we’d be happy to if it would add value.
> > 
> > We were testing this on the kernel version 6.1.0-rc7+ with the patch supplied previously by Maciej.
> > 
> > Everything above was seen using Intel E810’s with the parameters [3] below.
> > 
> > Any guidance would be appreciated.
> > 
> > Thanks
> > Robin
> > 
> > [1] https://marc.info/?l=xdp-newbies&m=166973074709850&w=2
> > 
> > [2] https://github.com/OpenSource-THG/xdpsock-sample/tree/test_zero_copy_tx
> > 
> > [3] Ethtool Parameters:
> > 
> > 
> > # ethtool -i ice0
> > driver: ice
> > version: 6.1.0-rc7+
> > firmware-version: 2.50 0x800077a8 1.2960.0
> > expansion-rom-version:
> > bus-info: 0000:03:00.0
> > supports-statistics: yes
> > supports-test: yes
> > supports-eeprom-access: yes
> > supports-register-dump: yes
> > supports-priv-flags: yes
> > 
> > 
> > # lspci -s 03:00.0
> > 03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-XXV for SFP (rev 02)
> > 
> > # ethtool -g ice0
> > Ring parameters for ice0:
> > Pre-set maximums:
> > RX: 8160
> > RX Mini: n/a
> > RX Jumbo: n/a
> > TX: 8160
> > Current hardware settings:
> > RX: 4096
> > RX Mini: n/a
> > RX Jumbo: n/a
> > TX: 4096
> > 
> > # ethtool -l ice0
> > Channel parameters for ice0:
> > Pre-set maximums:
> > RX: 16
> > TX: 16
> > Other: 1
> > Combined: 16
> > Current hardware settings:
> > RX: 0
> > TX: 0
> > Other: 1
> > Combined: 4
> > Robin Cowley
> > Software Engineer
> > The Hut Group<http://www.thehutgroup.com/>
> > 
> > Tel:
> > Email: Robin.Cowley@thehutgroup.com<mailto:Robin.Cowley@thehutgroup.com>
> > 
> > For the purposes of this email, the "company" means The Hut Group Limited, a company registered in England and Wales (company number 6539496) whose registered office is at Fifth Floor, Voyager House, Chicago Avenue, Manchester Airport, M90 3DQ and/or any of its respective subsidiaries.
> > 
> > Confidentiality Notice
> > This e-mail is confidential and intended for the use of the named recipient only. If you are not the intended recipient please notify us by telephone immediately on +44(0)1606 811888 or return it to us by e-mail. Please then delete it from your system and note that any use, dissemination, forwarding, printing or copying is strictly prohibited. Any views or opinions are solely those of the author and do not necessarily represent those of the company.
> > 
> > Encryptions and Viruses
> > Please note that this e-mail and any attachments have not been encrypted. They may therefore be liable to be compromised. Please also note that it is your responsibility to scan this e-mail and any attachments for viruses. We do not, to the extent permitted by law, accept any liability (whether in contract, negligence or otherwise) for any virus infection and/or external compromise of security and/or confidentiality in relation to transmissions sent by e-mail.
> > 
> > Monitoring
> > Activity and use of the company's systems is monitored to secure its effective use and operation and for other lawful business purposes. Communications using these systems will also be monitored and may be recorded to secure effective use and operation and for other lawful business purposes.
> > 
> > hgvyjuv
