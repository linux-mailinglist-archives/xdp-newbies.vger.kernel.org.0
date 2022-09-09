Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636B95B35FF
	for <lists+xdp-newbies@lfdr.de>; Fri,  9 Sep 2022 13:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiIILEU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 9 Sep 2022 07:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIILET (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 9 Sep 2022 07:04:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D576D49B4F
        for <xdp-newbies@vger.kernel.org>; Fri,  9 Sep 2022 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662721455; x=1694257455;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hz/AdeiVu9qSNFQxFkykPH7lcbZ9hhisUhttvUQ//44=;
  b=Hl9VQOFkU73v61ezb+QKQfiwSJUnlOORco2AIvbwseJe44f1h0i0AC2C
   0NjAEhW2gthy9GmTj7gib4iA7kKRjARayy6dabLfDb8s5NTNWKMmp/jWW
   Ep8RjU3ZhVa0ItGXS5G8sCku50l7Th/xF1Zq0wwyxy07b7bDFpHFA1aUS
   bjeSMdGo43qk53wJEtnVcgvC/CoB3anbQ3XIaVt/R2A6ydfPn3uYrhZFs
   SqA5LMwhWucxv8GFsSswF/p88wegtMW0MvWDh9/WC5T57jTkM3YXFNchA
   NegBCDuUlmiVSM1rgjUGphkB3X2MIB5L69tqF4lAiYPLyHgqJ8GELDgyz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277840280"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="277840280"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 04:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="790779206"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2022 04:04:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 04:04:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 04:04:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 04:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKTX0HXDCSrUUUCDVu8mIt0A5ZnP/XGkxG916Z+W9xv+pk83LC1rJhZidEbAqnRK6YBEG6EymlAAxQLuLx/dchEEPMLVNZ2g8RnuPv+riwvfoSLI/bRkijxWraKqs2JtRvUyACDd3YPbIfyuSCViH1IwUKWBgxE1e7g9XWFDlGCGT9iYhib7VkW+N2K4GswH/kCjsAhI7XMu8b58hOWFRCcRl9gAuu4AN+JLPDHwcyafiCqHgiaq/9YgpfOLj/zn/S2qFbgDKdTSSXtHJKqZivwAQqTycHjDDKfj4rqDat6nurlOsCGay1KCJfMo5708KzYFeSNMeFoMm8MSaca6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npGSuXHfberRvHKTEMErMuHiIKXcSSSIL0MfodLYTs8=;
 b=l2s7LKMCHTQKFdCumZ4VIsrEHu1WzlgU/9QfmRiIt/vaYVDhXsojAFDC62N7OPyc1+RIS7ZpWZY2fpMbhQqHXgRNCjNrIZl5Dl+IYEHR3IuPVA0LXB9aGRxw6fjvz0xJ8N9/DKp8FQtJILxW2X/Rt4OMz+/w1Hs9B/nTvpiLnZdBoxu0JwOB1673b9U1DWPcHQLnQQASUUh7WmM+9na6K57eFV2OGcuTK7FO91TPpTM2dkZ+Ftn3xPPix2g+SGs6HuNjIrFlvUiWUglAhji++srwtENP1UBVNFOKwsiyxBf7suJUs7jfG1LTSfKkoU6b3nujQMoqojgTUDRJpSF0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 11:04:07 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9c36:9a9f:d20c:bde1]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9c36:9a9f:d20c:bde1%4]) with mapi id 15.20.5612.016; Fri, 9 Sep 2022
 11:04:07 +0000
Date:   Fri, 9 Sep 2022 13:04:01 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Message-ID: <YxsdjrpSpeS96RUA@boxer>
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com>
 <YvVI3BKjmXUBhd8N@boxer>
 <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
 <B97FAE5B-BFF0-4433-AEE5-47DF87711783@outlook.com>
 <YvYtWIf5H2xl96oF@boxer>
 <331B1170-98A9-4C99-B16B-2EDAC6634392@outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <331B1170-98A9-4C99-B16B-2EDAC6634392@outlook.com>
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf08896-55d4-4fa8-c308-08da925303b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MCEkIoroEz33TVBfw47+U5TrVhfJZt/CX2WqLZD6/vfQCgy7gHNi64qi1AA7z7FTOFXx600Xt2suTJ+I0X1RbQVMIq6Jc9HTNFY8q9L3XmS5izl/LnpVIq27HBH29S/SFzTEibnfxFblBBs0WZ6AN8J0BpjNuLkYAc3LX2R+pYS9UBFsrU6aw9wbp+Dg4wdFm/cWvLzpNXZQJDsspp4ewum1SpESmJKDbHG2d9yzhs5dR5u/5FfbPDxg2ovEH4ZCzd2zbuY3ZnQGpDC8pWZhzY2AubljT0MRtZb2uUkc7OHRziNuNm7uaMKTZOe0dyln4Rxu6H9j26FhPV7/Rj6T3yDmG23SJP6LvdXXcpnHj7S6uS7KVlZf6yfbHQyuHOsr03CvJ81Pbp8gCmuvGi4LpQQnhevEOb7eToUpGGXpqPTq5v3ISC5grM3+Ph5WMJC8gQPw8AFYvjhtIMCQ8bXMXLwt6V4dHGzCfIbhvXzeVul7O4aXQ/WRekWJIk3ZxjPUxaAGVBInaX20Rgt1TJM+Ra6gP92NIv29/e8of0pMim9/ZDC1eFpfLgPcw8p4Cv7I2z3iYwcYuE09lnJFj96I/WsFkYQWsHRvfyjXnGKdMLin+gMBft/ncZVkvsUxvs/TMpQW79cVogCoyGfutmBpNWSjQFzc6583yXlQtunNNlJeOXKrhtZSxazC225fD3YpGV8DMLeIGuW2PVIKjMOb1ENN0NQ1iOX0UXd5FyKbphN1ne0TV5ogdjh8XOQO6v2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(346002)(39860400002)(376002)(396003)(136003)(316002)(6916009)(54906003)(86362001)(6486002)(83380400001)(186003)(6666004)(966005)(478600001)(82960400001)(53546011)(38100700002)(26005)(44832011)(6512007)(6506007)(2906002)(9686003)(8936002)(5660300002)(66556008)(4326008)(41300700001)(33716001)(66946007)(66476007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZktLY1JXRWV5T2xuelVGZlhCeXVyNFYwL1hTY2dmRE5VMkF4eEV5bDVMeG1F?=
 =?utf-8?B?TkZEWStac21KZFVPaVJVVVRob29aeEprcFZMdyt5MTBaL1N1WXFRZG54VzVO?=
 =?utf-8?B?ZWRIWkFnYkNYVzBIUXhxcXJLK0ZnY3Y4Z013K0RVY3B3K1RpcnMwbzRvTEpo?=
 =?utf-8?B?MGdkdkJkRHh5VDRzZ0duRTUxQWlkcE9PSEQzSFFwQzl2WUE0VWs4bDMrdTZJ?=
 =?utf-8?B?WUpNQjl0QVg1enJmRU1Db1lFMERHUjBLM2dXMVBKMHBhZkRLV3RpMWNYZEFr?=
 =?utf-8?B?Qy81ZzA5eVpWS0ZCMXFDci9yUFJTQXF4N2Yxa2pMQ0c4RmI2VG5EdmI0QUJM?=
 =?utf-8?B?K2dwWmU4Qkh4bnBYNDRBakRUZGFtaGNJUjJUV0pWM2NHbmxmbVpKMy9NczZn?=
 =?utf-8?B?cVYwUGtibE5OQ0dhWWF4RmRvUExOc0tQdkJyR1VTWmo5dWRwVUVNWUM2czRM?=
 =?utf-8?B?NmR3RWhFaCtUemJyZFovdG5uaVVYQzFmd1FOZGJQaU56QUl1cXRoNEFOZmRr?=
 =?utf-8?B?SFdqYWVzWnM0UUE0blVPUkcvTDZCSTdFMGhwMmdGSTlYM3NVd1N5ZDNlNUJV?=
 =?utf-8?B?QlR3RllTUU15T0FPaFZlSVpXVkRLOHBKeUM3YlpZZU5mNU1RYXVCVjRPTEV0?=
 =?utf-8?B?dVVCMUdsWU1ubXZqYi9adWRkcTE4Lzd1QXl4RDBqLzNyMkc4RTVxb3JlbVQw?=
 =?utf-8?B?endTcWJsYVpmRVp5T1RQNE5IQ29YSEswU0ZFL2g1MXR0bDFSYTNQQk1GM2dT?=
 =?utf-8?B?UXRFZTNzWWF6ejQ3Ulg0ZmxldmlJVFZRNG1mcGh0RnB3dlFWR0kxUmozWkhM?=
 =?utf-8?B?WmtBcm4zM2czYUQ4VWwyemlCV2Vtc1QwbFhtWWZLZmlGNmZNMlB6YmYxb2U5?=
 =?utf-8?B?bENZRHNuWHpOR3NIRU9FUEt6ZVlJNzhkWU1oQkNuVmtVc1B4T2dRRTFQbkh5?=
 =?utf-8?B?Tmg2Z0loZkl2dnVQc1NXSENmRUMrMmhTaEsrYXNWaTd2dGUzRzFQVWZNSVhN?=
 =?utf-8?B?SE1jRUVSMk00M0J1aWpIdW1mUmRXenREOUloT3lYRUIwSVNSODJJdWZhNTRh?=
 =?utf-8?B?dFFVR3NIYkxxNWJIYlYycUFDYUIyQkZrZXFWcDNiSCtJUHNzM3hLK0p4NHZ3?=
 =?utf-8?B?Tjl1RVRDZmRhamdEdDgvTHBLS2dZODNIVkxJTERsSWdoNmpnbmpBK3RnbWhl?=
 =?utf-8?B?NlgyUmk3VjFNY29hRlUvRTAxbkJhQzB6WXY5d3ZXaEp5enp1V1Q5V0dnamps?=
 =?utf-8?B?SFRjODdvRmJFUmtGUmtUWTcwazA3R3h1YnZ3RFh6K3VqWkJXNkgyWmZOaUtR?=
 =?utf-8?B?MU8xV2NrY3dWclVZeTJ1SzlDV2RSVUJKSThaOVh1MXQrRUtpaUYyMEQyc2V1?=
 =?utf-8?B?Y2VGRW1nbGtIUzJ6b1NjLzhKa2VhNVlVV3VGRWJIYml3bmpubmp5ZjR5U3RN?=
 =?utf-8?B?K05zVjFVNHRsLzA5T29TWmlBTDJTR3RLd1lLWFR1YTlrWVNNdFBiYXFuemdZ?=
 =?utf-8?B?M2QwVjlTWHg3U04zVVorQzliYVp4QkVpZ0VhTE1VQmpGRDg3b0dWa1hXdzhm?=
 =?utf-8?B?VkNJZExNTkFBY2RkY2V1aTQ2MWlpeENwOWpDRjlkVFBUR2xuMEp0a0UvSmFS?=
 =?utf-8?B?UTZaYXdXSHlEUnhTVEk5Vk9KOCs2Rk52d3JFaEFKY0JEWHl2Qmx2UCtnNXNw?=
 =?utf-8?B?R3YvWjdDM1VBWEc3UjhDL0NKTVVFYkF5ME1OZGdSUnFIREVqM2tEeDlWbWgy?=
 =?utf-8?B?aWdTSFdsSC9CRmEvMnRFUWc3QjE4RFlVSjcvWC9BY2ZWWnVUQ1hvNFJxeGx1?=
 =?utf-8?B?YU4yUjJCam54T1M2cUZQc205UjFpYjFsdE5tdk9SMjMraUh2M1NKQXBJazVS?=
 =?utf-8?B?Y001S2dNS0E5YUxwWHZNU2x1TlFST210VVJZQWVKdFQvbDRIR2tsbjB1Ukkv?=
 =?utf-8?B?d2dDdWo1SVpIcEFvQ1AzUEwybnQ5ZFhkZTYwTXVuZFhXdWtIa1p2cUVwVTZv?=
 =?utf-8?B?ZXkzd1pFcDF1NG1qY2dzYjN3cjZFMXA5WGczdHZncERXZnZRd3F5SXdURSs5?=
 =?utf-8?B?MFBmSXlnU283OGg2d0xPL0lLOWwxN25UMW84d1VNRWRKT0VCbzhLWTEvdXNt?=
 =?utf-8?B?eEhlYjNoUmRYUXhXMUI1aVR2cVFoOG5idGgyalFVTUJSTXhEUGhteVp2Z1N0?=
 =?utf-8?Q?lErhYWtt/vlIjGrHqIUGqOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf08896-55d4-4fa8-c308-08da925303b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 11:04:06.9609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9qzJFPadSe9msv4eQK+Qwq8Wy+tooWlT1EGv6L8pAlVbtvy9Og7fpRTJJzseSdQjECvV/dm/ADFz/4kFWtM//jTxxQHBuf6N2AI6LsJ5Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Sep 09, 2022 at 10:15:22AM +0000, Alasdair McWilliam wrote:
> Hi,
> 
> Just to confirm the two patches provided also fixed our internal software as well.
> 
> I’ve seen the patches have made their way to the mainline code so thank you again.

Hey Alasdair,
Great!

> 
> Would you like us to test the 4k ring size fix still?

Yes, this would be much appreciated.
To do so, could you pick up the following:

https://lore.kernel.org/intel-wired-lan/20220901104040.15723-1-maciej.fijalkowski@intel.com/

Let us know of the result.
Maciej

> 
> KR
> Alasdair
> 
> 
> 
> > On 12 Aug 2022, at 11:37, Maciej Fijalkowski <maciej.fijalkowski@intel.com> wrote:
> > 
> > On Fri, Aug 12, 2022 at 10:29:28AM +0000, Alasdair McWilliam wrote:
> >> Maciej, Magnus,
> >> 
> >>>> I have just sent patches and CCed you on them which should address the
> >>>> issue you are observing. I will be grateful if you could test them on your
> >>>> side and get back to us with results. If this won't help then we'll need
> >>>> to dig this more.
> >> 
> >>>> What ring size you're using?
> >> 
> >> I’ve applied both of those patches on top of the patch from Magnus the
> >> other day (including the if (!pool->unaligned) tweak below).
> >> 
> >> With both NIC tx and rx rings at 4096, using xdpsock_multi, all queues
> >> now seem to see process packets, which is good, but only up to ~4096
> >> packets before stalling.
> >> 
> >> However, your additional question about ring size got me to try a tx/rx
> >> ring size of 2048 each, and it springs to life! 2Mpps l2fwd per queue on
> >> 8 queues with xdpsock_multi. Repeated with 4 queues, 2 queues etc and
> >> all looking good.
> > 
> > Awesome!
> > 
> >> 
> >> Seems ICE doesn’t like a 4096 ring size atm. :-)
> > 
> > I have a fix for that, but please give me few days to clean this up. I
> > will be able to share it with you next week and I would really appreciate
> > if you could test this as well.
> > 
> >> 
> >> 
> >>> Thank you so much for testing Alasdair. I believe your tests are
> >>> successful in terms of not getting corrupted packets anymore, which is
> >>> the only thing the patch I sent will fix. So we still have two
> >>> problems to fix for you:
> >>> 
> >>> 1: RSS not working correctly for E810, which is what Maciej is
> >>> addressing in his patch set
> >>> 2: The queue stalls after 4K packets.
> >>> 
> >>> I can take a look at #2 using the application you sent, but after
> >>> applying my patch and Maciej's.
> >> 
> >> 
> >>>>>> static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dma_map *dma_map)
> >>>>>> {
> >>>>>> +   u32 i;
> >>>>>> +
> >>>>>> +   for (i = 0; i < pool->heads_cnt; i++) {
> >>>>>> +           struct xdp_buff_xsk *xskb = &pool->heads[i];
> >>>>>> +
> >>>>>> +           xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
> >>>>>> +   }
> >>>>>> +
> >>> 
> >>> This for loop needs to be protected with an if (!pool->unaligned), but
> >>> I will not send out a new version here. It will be in the version sent
> >>> to the netdev mailing list.
> >> 
> >> To confirm I applied this as well before applying Maciej’s patches.
> >> 
> >> Now we can now run xdpsock_multi with ring sizes at 2048 okay, I’ll spin
> >> up our software stack on this patched kernel to validate that side of
> >> things too.
> > 
> > Glad to hear that! I'll ping you once I have a fix for 4k rings.
> > 
> > Thanks,
> > Maciej
> > 
> >> 
> >> Thank you both!!
> >> Alasdair
> 
