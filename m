Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A52590F91
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 Aug 2022 12:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbiHLKhY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 Aug 2022 06:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238056AbiHLKhX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 Aug 2022 06:37:23 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91525A7A98
        for <xdp-newbies@vger.kernel.org>; Fri, 12 Aug 2022 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660300642; x=1691836642;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fNKKoONvmUOFgOcwSZ5HDoP0CA/MTfBvjGb6nTYsZLk=;
  b=avNtN5tqE2vN3s+PSJp3/GNJ1+DvilwFQyo/zU3PogLSSoCoOXL/11tq
   vlX48rpeOI8R0TAd0blrl940GC6oC+Xqg/LjrRWG+U4a1K6KzRo2aJCiJ
   EXOJqtdfZFkFvkHgdcGTeh7S8KAmyYiXeJQpaZLpmqp+VN+7KWnnNgjA1
   wze+pVapKLJ3T4ulJ3bn4cvFkurGsF7W4ih3zdWINbCm22tH378ZXWgym
   tlKArvDe4//DpDXKmgR5zmmQBzJmXvhgP53+hh8uwtjN2YNd92LqHnuv6
   UnfbEUNq7hlfZyVdwz+qC+hp/lJwlSY+yzIiiLBOqFj6bcycNZBfFfDCO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="290324484"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="290324484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 03:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="638857439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 12 Aug 2022 03:37:21 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 03:37:21 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 03:37:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 12 Aug 2022 03:37:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 12 Aug 2022 03:37:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W15ffVi1eOVuwzf8Tzb1V818iDf2DmcXSIWuwbCrKy8Mn3LpZtzKSr9GuNRiOO+g+YqekKCauZivctCfMVbrXYP1gqSbtV8tdDY1AVZkn1mKKjetmN35mKeRJ/koVYORL7v22+pxR90VI4vBASuGPW8j0216EkXvMCAc0bwQUmZmN6YZJQizHmfqFMnT7bls9GwqJ4DHa9fYbJI77HsdKz2EAdP9if5Gp/kNbK5ZkMTs8ww99CgjIXhZBs9d3rOFlczbXrCz7zmC2S3yOCJwEm5i6ui9q40WtM6iYltE7yJOhABVqyXkN05KKNwVkmUBk2p/IQh6+6DqzWm1jIe83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic4RGktqFmukCb+fmvj3wlK+8BQyXwPmpbdvb0xKKvI=;
 b=aed66+3XyFX7F75yPwy2kc8F0nInn66imgH//BNfCjLsqbuHg8aNuAXdcFhuPdLwzF5u2fR9XLa65rKU4HF+Y66Z2SS57Snli+cdk2qO+MltA9CQouM2bLfJSZbiaWS7CxD97DZh0XLBdknlM+mBbMAHzZw+33ybyszGe10emQ4B7dr8oEFAIlbIlyV7L5sx0cq1WEPtVKxItEwqaEwDs5FnWkWKntIK1vWcWg/rVJTmo7B2ioHbI09wpeFVIwxQ7rTJV779h5iDs2UsqVgaXYlQUbmNSHaYEWhbGy9aaDzlo387HUaNzf/BhCBPjrID4r9qJmTilCzxiwuYi+rjEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 BN8PR11MB3842.namprd11.prod.outlook.com (2603:10b6:408:82::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Fri, 12 Aug 2022 10:37:19 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5876:103b:22ca:39b7]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5876:103b:22ca:39b7%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 10:37:18 +0000
Date:   Fri, 12 Aug 2022 12:37:12 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Message-ID: <YvYtWIf5H2xl96oF@boxer>
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com>
 <YvVI3BKjmXUBhd8N@boxer>
 <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
 <B97FAE5B-BFF0-4433-AEE5-47DF87711783@outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B97FAE5B-BFF0-4433-AEE5-47DF87711783@outlook.com>
X-ClientProxiedBy: AS8PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::24) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0da14b06-c99f-4347-4ef2-08da7c4ea181
X-MS-TrafficTypeDiagnostic: BN8PR11MB3842:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3WXlVByeajKo5ZveTlKGMNDUpQMX2At1L34IzZ+UcX0+KVn/kbX2/82oURcV9C7BYnZztjdw3EetYNhomkKiWOr/0DGakLc6YfYsbuyM3o+ASTmOfpbDtGJIFu5CN2VX9rfvaMsRf9HHaiGRSCYGoUxtHaJIv22GclM7RzzvU9INPH4Aqlj6xq/Ze0Y7kJHY0TH7BcoQDdmRArNv9zPc8jdwWZnYdM0tuDSigLxJYv4SNJ7SYdsbnv3h7h5o4Y6kZkhaqT/2FnzMktSgUZs4I/96ypvVES6KwK8swc/p3ZWwmowWbZYVzhCGi4l3ybiI2JErWHsbzGsfrjMspuMtnQ6tmb+ywZXEbQ5SqBya3TJimWIbA+mxluY9bNZDu794HTdU8CYRTg1cVivStXRCcmW1RrEbJesz+cf/0T4Wl5fGyM4tDjeD/7XX2vTbLnHIV7GTF77Mtb5iqg/kBlgg+A3OytM7ROdlVuuJ66AqwMWaQSU7U7I/NnNigPYCD0IsrFwf2fGxgi/HRkPcZGETijFOmA72XLFqmqVsjSf5h5SQxqceA7PjWEjqDySlkd9utkJNKLGXc7IwIBsiuTBpEX1RLpoDtk7ptjfhsl+f5TtGAKWrOZLKqSORZ58FGFnRyoCNK4qbuG3bQKOoaa1IQZ6n8nBBF1k/3YLAlHcUqL9qg8trcgC5Ot0vRHMiS4lq81bWMlwjrQG48c8jSk27ADFmbZOTdCMTKBrrzEYera7Lvdy4GDq8PWOinN1mAxT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(478600001)(33716001)(83380400001)(186003)(2906002)(6486002)(8676002)(4326008)(8936002)(66556008)(66476007)(66946007)(82960400001)(44832011)(5660300002)(316002)(38100700002)(6916009)(54906003)(9686003)(86362001)(41300700001)(26005)(6666004)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZRcTJtY0dSTVVRUFFDMzkvQ3FHOHdLaS96VWhCa1NLSS9BRmRqT2tZZzVW?=
 =?utf-8?B?cXJueDYwSithMXRTY210NWNncXVxakdQQ0t1OExtQjAvOGNOTnJDUEVkUWtH?=
 =?utf-8?B?aktZb00wMmdXTVl2aXNWem9KZ1NoYTVVc0RPWGdUa0NtOHRabjExUUVYdE9Q?=
 =?utf-8?B?QmF4ejFBQ3Q2YnpMWTdpYWdDb1dFeFZQTFdpZ25SUHYwM1ZlazdMZHZCc0dG?=
 =?utf-8?B?MVQyNmhlaVk3QzRSMzQ2MUhpZkpndTNBTTZ5cmdpMEdscG5IQWZiam1RTFM5?=
 =?utf-8?B?ZHh1MEJyKzhCUGVHbWdmNWhteVVndzFnQTAwTzJVRGVoUmhmVk1kWGNQVzhx?=
 =?utf-8?B?TjZKVE1JZlZhQmdXRmZtK294RXExejE0UVR5Si9ySjZhb05Dc3ZBTnArVEY0?=
 =?utf-8?B?eURjUjVRNXliQWVvdWVkb1dSUFVFbjQwWDR5Y1VLai96SmZia05mdGg3N3lT?=
 =?utf-8?B?cUJRZGxIOWhObVBhb0lETjlQSjVodVluK3ZrNmRxZmZGb0hJaGlicy9JUXBz?=
 =?utf-8?B?dlhDdUNmcm5JN25qYU0yb3p6dXB0eFo2VXIwa09wZWFkQ3BRa1h5UUsyanZR?=
 =?utf-8?B?V1B2TnBLclVCMWp6NlZ2WXVLemlFNTE3SEd6aDNPN0VRWVZRU1JXMkE0dGwv?=
 =?utf-8?B?U2l4WWVWc1Jaa3B5Z04xWTVVY1ltaUZFZTJtRHZsNEk3cllLeVhidy9jcUx6?=
 =?utf-8?B?TVdUQ3NuR2Z1M1B5RGpmS2liemk4ODlCVTVZRG5WYmIzYURkbnBBMHM0ZGRX?=
 =?utf-8?B?NzFpNVFQcHJQOHM3R0FIL2kySXZFcVUwckMzQmMzVFF1Zjd4WWhoUWNtZjRM?=
 =?utf-8?B?RU9NR2g4dUlnOWtINHhOMDBEVWpxamdqODZ2TndYVlVOY1MzYy9zQld4NlpO?=
 =?utf-8?B?c25CVm8zWXdNZThpencreDlGcXhVdms3eWs4RjQ5Qitadk82VjlqTVR2bDZC?=
 =?utf-8?B?TmNCb2NnUzJBa0ZMUDJiSEZ5dVhlbkhVTXJQWWNuc05WN3NaYUxEY3lEb3Nz?=
 =?utf-8?B?dGg5R0tONDhIS05jYXlzalNGZlJjYVVxUlRRbGNaSzdtemF3L1JLdVlpUGQ1?=
 =?utf-8?B?czZweVNFaHRhYlJXUmtSVVpBYzA3dURBZjJXU01Vd0dzdUtiT1NiZ0wwbW9y?=
 =?utf-8?B?T21xUTg4citjdmJQa0UvWXpLSjdYUm00bFM0SmIwaVRIUEVXRmZKUnN5Rjl1?=
 =?utf-8?B?c3pQZTcwNUNEbmhmNlhZdHRzbGloVnIxSWlBa3F2K0JqWWR5cmxRK2YxV2JP?=
 =?utf-8?B?M2xBSkFXeFR0aHM5cU8vM0ZQaVkvSXFDdkttZUFhOEZKZ2l2dE8zVDltbldl?=
 =?utf-8?B?N0dFTUk4V1JvRlpiT2JyZTlLY2hYNWVQTTRwY0R2WlpxbFU1QUVvSWdrRmtG?=
 =?utf-8?B?NDJ5b2lvdHlIR0V2a24wdXNmZkxmOWsranlMdlE5dnBDaVRhOE51M3cwWDQv?=
 =?utf-8?B?TjcwWG5peThvU2xYUFV0OUllSmdEN015Q0Y3cjFxZ0srdjdzVTgxSDlPOXZu?=
 =?utf-8?B?aWs3alc3dHdiUFRhSmVnZThrQTNvVzF6NHY1SURjc2pCdXIzeG1QYzhuaXdM?=
 =?utf-8?B?azZDWGpqc3dqWU50NEs4bnNGcVFwRVpCUUIzWWtSdFc3dzF1a1FVam9zUFpD?=
 =?utf-8?B?ZktzL2UvOGFzQlBvaFJpQjZTckRCU2VwaHliU0srTUxlNWh0ZlkvYURyeVpF?=
 =?utf-8?B?YWVNMlNlMGplZnZlNTljemtkVXVxUDlYNTV3UEg1ZlBqajlwR3ZLNEh1VU1s?=
 =?utf-8?B?S1YxTS9aRGJrb0w4eEN0N2VJTkR5WEY3cmlIOTN3L21sOHlUVmIwQWF1YkZD?=
 =?utf-8?B?NWFHV0FGYlM4eUoyVnF1TDhJYlVIYlJZeldSUkVzWXcwdWpMS20xRDhSM0ZI?=
 =?utf-8?B?RVdCdFFiUzJPek5YV0QvdlpNc2FNakI1OWRVZ0lTb2NObW56Nk9XemhsSU5S?=
 =?utf-8?B?WnBnWkNpVVNUZGVIQ1dDWXg5TFBZOThneU5SaCsyM0EwTG5SSGZIZnoxMzNP?=
 =?utf-8?B?ZlZOV3NtRGt6THQyUndxUkpabDN3a2EyWk9VbHpaazFrZ3dWOW9QOGF6cGNv?=
 =?utf-8?B?a3dJWDhnV0YwQldBbmg3aWF6RUgyckV5RDFnd3IxbE9qOXRqa1Azd21VWXhZ?=
 =?utf-8?B?ZmtwOE5qOGdRMXIxREd4T3M2VGp6bWtCZjc5RDc2VjN5VC9lMVNWWnZQNVVv?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da14b06-c99f-4347-4ef2-08da7c4ea181
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 10:37:18.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7csFhH5867GLhAtcd+IjP4hWQ8JaV3E02n6WF+/+11bT0G95H36ckid6xeL5+lApth0rtaeGPA8AL/6ZLcAkDLJjpQNi8EhTZ5GYyDs9dSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3842
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Aug 12, 2022 at 10:29:28AM +0000, Alasdair McWilliam wrote:
> Maciej, Magnus,
> 
> >> I have just sent patches and CCed you on them which should address the
> >> issue you are observing. I will be grateful if you could test them on your
> >> side and get back to us with results. If this won't help then we'll need
> >> to dig this more.
> 
> >> What ring size you're using?
> 
> I’ve applied both of those patches on top of the patch from Magnus the
> other day (including the if (!pool->unaligned) tweak below).
> 
> With both NIC tx and rx rings at 4096, using xdpsock_multi, all queues
> now seem to see process packets, which is good, but only up to ~4096
> packets before stalling.
> 
> However, your additional question about ring size got me to try a tx/rx
> ring size of 2048 each, and it springs to life! 2Mpps l2fwd per queue on
> 8 queues with xdpsock_multi. Repeated with 4 queues, 2 queues etc and
> all looking good.

Awesome!

> 
> Seems ICE doesn’t like a 4096 ring size atm. :-)

I have a fix for that, but please give me few days to clean this up. I
will be able to share it with you next week and I would really appreciate
if you could test this as well.

> 
> 
> > Thank you so much for testing Alasdair. I believe your tests are
> > successful in terms of not getting corrupted packets anymore, which is
> > the only thing the patch I sent will fix. So we still have two
> > problems to fix for you:
> > 
> > 1: RSS not working correctly for E810, which is what Maciej is
> > addressing in his patch set
> > 2: The queue stalls after 4K packets.
> > 
> > I can take a look at #2 using the application you sent, but after
> > applying my patch and Maciej's.
> 
> 
> >>>> static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dma_map *dma_map)
> >>>> {
> >>>> +   u32 i;
> >>>> +
> >>>> +   for (i = 0; i < pool->heads_cnt; i++) {
> >>>> +           struct xdp_buff_xsk *xskb = &pool->heads[i];
> >>>> +
> >>>> +           xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
> >>>> +   }
> >>>> +
> > 
> > This for loop needs to be protected with an if (!pool->unaligned), but
> > I will not send out a new version here. It will be in the version sent
> > to the netdev mailing list.
> 
> To confirm I applied this as well before applying Maciej’s patches.
> 
> Now we can now run xdpsock_multi with ring sizes at 2048 okay, I’ll spin
> up our software stack on this patched kernel to validate that side of
> things too.

Glad to hear that! I'll ping you once I have a fix for 4k rings.

Thanks,
Maciej

> 
> Thank you both!!
> Alasdair
> 
