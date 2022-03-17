Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1678A4DCB96
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 17:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbiCQQmc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 12:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbiCQQmb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 12:42:31 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B41216F6E4
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647535275; x=1679071275;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pV4JC3qE567ygD8iYoQHFZUrVIAsICsD84lxEEyuYfA=;
  b=JJdv8roZxj3kNRFmvwDiNAA+yVIlJzb/Prwt67K3bXEWyZIzg9yyhHGP
   OKBjvH2zK/z7yBylas4EkdH3oWOxHl08EdEU5OHhnUWcur7uwoiQDT/Ev
   sxhc0molRDghOotm7s3NS+Yji7+DyMnfDX0FV6B/Edglk9TJTOrkfQLyS
   hT08/i8JBwESlwawb5WWG9NVi/d5lmxsM04Z+jNBxij+gUJOGWyjobqir
   umvP+q6NoxI9Tn769h0Js2gMDEHUXRADFFMg6Ms22msSvMpltOthVfNtR
   KhOw1htQIX2rqMMwAkGOZG96duEHTAx5PVD7dzC1a+AjOxeBsRuUTR3Lt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="255738274"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="255738274"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 09:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="783895495"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2022 09:41:14 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 09:41:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 17 Mar 2022 09:41:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 17 Mar 2022 09:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLM98zdAtL3y+jx/vYwpiAzHXyIIJ+r0syWv6i8WY3y9aFrSOnP20my3jh6IivH1rDp8QKV2P5DQK5eHidSjftf2zAMlQiOhzh2+M/YJNeREcn5oRBgXTJNt1/e23b9qnEe0SrJf3Hic3kMFp6cKascCMMEj+o2y18AidvWEylUN0dX7mhlzj/cwTXuuaC5mg83BUiMCXSKldQJPomrBjrg/xNF37ZXuHp8h6FPLW25SWZcdEAjRvC6/Z/RXbcxdDl19A58raDnn99WqzVQGkynacIRpJWnFxrMJ7taibk6D4LU9e/24zyOLPz6aNECn//iioKNHEmFIg3yKxjA3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl5DmnfyCVRv/Zf47IJW0jUyjLRtyzivkXtHPPCCFgU=;
 b=B5vqsTnxSWkf1nbTxov7R1Y91rk8adNJTCd3bTEtidcbDx/7/LgXDX3R5Bh+SguzVuvyqgyryDvc6IFsu1yLgExlvfe/Jjkb5TQgbh+t+FVm4Vc82tPVcRyr6twTLKe/SU8lLHHVRFwPwFsISMgJtb9VxXL4DCzxiqAg3zYl5rwm73Sre9RQZ96aADfCWMjXQDzeqmCkws4lXFVGo9JYvNOfdM0IFHTpgo5Fc+eIDPEe9BOzStp4B9n8L3Gxx+j/7+kdGqWbjGtbgmPLGcsipeqQzHetmdWtQCEABStRt3y4wn0FnULpwuSAJv0WxLzS1gC1elL0Ypy5T3VSAU/MAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by BN6PR1101MB2115.namprd11.prod.outlook.com (2603:10b6:405:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:41:10 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::2d6d:f382:c5a3:282b]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::2d6d:f382:c5a3:282b%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:41:09 +0000
Message-ID: <86baadd1-daac-09fa-c3df-50308272ef77@intel.com>
Date:   Thu, 17 Mar 2022 09:41:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
Content-Language: en-US
To:     Federico Parola <federico.parola@polito.it>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC:     <xdp-newbies@vger.kernel.org>,
        Piotr Raczynski <piotr.raczynski@intel.com>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
 <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:300:16::25) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da272761-d66c-4eaa-abc2-08da0834f097
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2115:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR1101MB2115F329BCF64B560581EFC297129@BN6PR1101MB2115.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9a9OxuVnJV18SLywlNEosXy4YN+l8wTHj0cN42wjywAUK2RJEjyktlbaNzw51MCCsLg734V+4z0BVRTIDD5dEYOBNNtXA/l/esf5mRg0Op3ftjmS/1WjIDT06VVXci9NffxO3o83iuLs9352BlhG0uJk/GPEn+0yu+7AeNVmcQekBjzDls7h1mCuVE43o98daBRtliwS5+fCRwhsOkLSl3pQjepvxn48na1TAvfSLqdfBS2a1e5tIsB5UbLab9MRHOjPvJWNngtr16S+Bw3mgm583NuyfMhqOt2D1ce2Olr6ANi8m2qn4uBPhlR+azrjnGlbLgE8pODFV2lw86C5ConDvGq2gPkb/Ky+VIPY7Y5RzTdNPK1hfeD2XshLXbCxI+6pXMUrdwXgQqeeGkYaTxu3lS310P72zAVmzXMJSWgeUGVpC8fXetDXwN1NEyea6zel1emdjc43Yjn70Teup+oqU4ysOs3cOIV2/I7jKEUlRgm7ecwMKCgM1uL9IqRx/5qLuP1QmRcCguHcQ3tSNgnkNBku2lV0fBeHwG72pYRegLHu3y+NpV2qiyV1ENTJ9itIt8ZbhbUurjRmVNlkovEMqgUsZZuy1XrehBCZ5d71rWhjLXLbF1grnln68LdnWRG1n9fGV9POtCwdmti9P2gY6h6yAHSAmOC4oHfw6YlxJAkKU0jMo1yQmsA21iy0Xv/VYZuKSpQh7TsRYRXa6ZBaFSgk3AHELSaAwta1co=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(8676002)(4326008)(66946007)(5660300002)(6486002)(508600001)(107886003)(38100700002)(82960400001)(2616005)(8936002)(110136005)(6636002)(6512007)(2906002)(316002)(53546011)(6506007)(83380400001)(31696002)(6666004)(44832011)(36756003)(86362001)(26005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm0xOHkzanhiRFlFakYrTlFnQzVVRnppbGtYb3ArVTVwQUM0S0tQbHJuUFZB?=
 =?utf-8?B?Y1VTTzNUdkU5dXNWZm1YWGRpRStGY0JncmZUZEw1dXJ3bnlQVFF0L3pRUkZn?=
 =?utf-8?B?UDFSdjFJTml5S2NXRm1mSGJPTFNHWmRmKzg1akdkZ0xUQmNOZGtkbzdMdmtR?=
 =?utf-8?B?enVjYTJpK2hyZCtJS2VQdU1ES1Frd0lYd3NyUDVWZ2NUaWErZTI0MUdPYVl5?=
 =?utf-8?B?TkhvakxEckdHRUgvQWFQLzJnUDk5b0svc3BTU3A2Y3dVR2ZCaTU0dXZSK2ZE?=
 =?utf-8?B?NFkzcGJiQ0srNkF4VkpnWDNxMC93N21LZ2I3Y1dYOWFmSW03em42THFDcUVT?=
 =?utf-8?B?cEdGY1dVdGl1SExiY2xEUjNvR09qSTh2RkJIVXFmOWpGSzBWeDlla1laOTkz?=
 =?utf-8?B?U3RjR05XaVBvUkVRdTR1aHlkOUxOeHNTclMyWVN5cmU3aldyMDBKUmd2eHdQ?=
 =?utf-8?B?MGgzUlo5U2xwbkRSSnlHeHBCWWJrQkIrWnFFdy9JeVAyQVcxWmQycTQ5NTBo?=
 =?utf-8?B?dlF6alU0eDh3c0VhWG9pakRpMnBuM2dqZll0TWwzbkVpRnpyY2VrRGlTbUlD?=
 =?utf-8?B?K3FxMXVTaGpDbzVzRDJjVTNqWFdZdUppVGlLQjA0UnZISjI1TzNZQVlaTXhx?=
 =?utf-8?B?clRRZHRkNTdDMzNLYXZBNDd0Zk04M2lPMkR6OGRyM1VuZEQzS1lLWXBoRTZQ?=
 =?utf-8?B?blRrLytLY3RMK3lwN0VwaUJ0aXYrODdlMlNuUVkxQ2FoOUZYbjFXMS9oYjJ2?=
 =?utf-8?B?WE5rUHQ2QUJFMjFWYS82OFhsTFZYZjJiMisrT3QzYndHRUNEbUowUWVTVHZJ?=
 =?utf-8?B?dVVveFlZYnpvZzJaUmh1SFl6M1NyN25PUVJUVlRTc2Nhd2plQU9oRmlsVzdp?=
 =?utf-8?B?T0RlS1hoVGNnYlNKdkoyM3JWQUx6OVdiQlo0dkF6RjVuaU50dEUwUVVSNjNJ?=
 =?utf-8?B?QWxDQWZPNmFJMG9iaFk3WFRZUk83Rzhoa1hqRlo0eU9zVGNUZHFYaTJLTVBa?=
 =?utf-8?B?eU9mcm1JazJheEtKeWsvdHRON2s5UVNrODRYc3pvaktyME5kRDdTNkpKdFNW?=
 =?utf-8?B?VWhERC9TZUxwMklwcGVqRHQ2dzRGT05YdmIwOFJTZzR0OXZRU3BDeGwxdVlO?=
 =?utf-8?B?eEdwMmpoakNESDZ2VERFZWVjcU9xK21FVFFwalRHNUhVRGcrT3hxZUVyc2NF?=
 =?utf-8?B?d2RadEVqVWphU1VVV1hKUXlqaXdwVGp4QlBSZVlFd0NuR3ZLNm5yVVkrZmlZ?=
 =?utf-8?B?Z1RZeUFJYmhTWGF0M0w5VmlvN1JaQlhIYjNvSTA2THd0b0NwU2ZnSkVMb010?=
 =?utf-8?B?b1dzQkRVNTBDcDluYkpGRUhnKzBhMjl5bkd1NXRseGtaZC9zRlkvWXpVRGx2?=
 =?utf-8?B?SlZndzhEaHlFTEM1WE8zenZscXBPV2VEamZJZndYMzNMZjBhSmh6UTJXUU96?=
 =?utf-8?B?VHFpSm5oSng5WTJLU1ZNMHRXVHhRbDJlNXo5YWUzbFZLZkRSdXpVcyt3T3pU?=
 =?utf-8?B?NzFSQlBCWnVQTnRraWdrdlYvWjJaakdQM0ZZRE1pS0JlTWNvaXFxWVQ3WWtp?=
 =?utf-8?B?dGlCa09qOWZrUEtEVkpHcEE3WFNWRDZCYzRoU3ZMYXUwSy9pcmpjZFdKYWhT?=
 =?utf-8?B?cGNKZjBONnJ3M3BZbzJuWXo5ZUo0MGhBMndtYWR0azk0TDhhRW1oRTkzdW9o?=
 =?utf-8?B?Ny9wK2ExOUkyQ1NCY3ozZ2QzRVJZM0JEUTBRenVmK2VJbSsvYVl3MTVxVUlr?=
 =?utf-8?B?UE9PYllaTEMzSG9jNldMZXJpSXU3clkxOTN0dGtlMmtpbDdkaEs3SUh4NjYy?=
 =?utf-8?B?UHYvOHd3NUprNWY3VFdEbk1GYUwyVTNvdUh4M0J6VHQxRys0N0JXYm9HY0Mz?=
 =?utf-8?B?eHU1YjB2WVdRR0t5TEdzRDlmYzgycG8rMXdMbmlWd2hmckEwSlFLa3d5WDNu?=
 =?utf-8?B?YmI0TEV1R0hoMFlka0s4QUYyRmdIVGdXTW5LODVndUR1eWgrb2JNaGIyaGlj?=
 =?utf-8?B?Q2tkcENXWW1BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da272761-d66c-4eaa-abc2-08da0834f097
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:41:09.8357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWR2tQGPyab0vxPG0OOVf85631W0EMQKPbWje7oLhMCcD9pFk/OtF2JHqYDfOTmoUOJI3N2oHl08BvoKKbZ7VVykxDWfYu+2IccQ0eOHQ7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2115
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 3/17/2022 8:34 AM, Federico Parola wrote:
>>     We observed similar "batching" behavior on i40e devices late
>> last year in ordinary use (not XDP, but using SR-IOV VFs).  We
>> instrumented the drivers at the send and receive sides, and determined
>> that it appeared to be a behavior of the receiving device itself, i.e.,
>> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
>> update of the RX ring pointers) until packet 8 arrives, at which point
>> all 8 were delivered simultaneously.
>>
>>     The issue was evidently in the firmware, and was resolved after
>> a firmware upgrade.
> 
> Hi Jay,
> I just updated the firmware to the latest version (v8.50 from v8.30) but 
> unfortunately the problem is still there.
> However I'm experiencing the problem only when using AF_XDP in busy poll 
> mode, all other modes (standard AF_XDP and normal packet reception) work 
> just fine.
> Maybe the two problems are correlated in some way.

This sounds related to the WB_ON_ITR feature in our hardware. If 
interrupts are disabled the driver needs to set that bit (and an ITR 
value) so that packets get written back in a timely manner and don't 
just wait for a cache line edge (I bet your Cache Line Size value in 
PCIe space (lspci) is set to 128?)

Maybe something to chase there? We may also be able to look into it if 
it wasn't fixed already upstream.
