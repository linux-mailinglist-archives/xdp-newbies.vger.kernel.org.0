Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36CB59064E
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Aug 2022 20:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbiHKSWk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Aug 2022 14:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbiHKSWj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Aug 2022 14:22:39 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C6C96FFE
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Aug 2022 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660242157; x=1691778157;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bZKVFiAPkGTZaqyHizaXdiDDHwSmgmPF4edCForLHDE=;
  b=dGHp+VALZojVBWHWb5RBxn9DyvWyOp7wgn0EXm7uWD1DMhS0zYs4hizC
   TdqaXH5qKllOx30c/pUgrfdkNPkL1G3RnvTeIOKqXsu9u5CXXqkf8jk/M
   8JtS+/vsaAdeOzvoh/mw3sy5A8y3m9HrfZJso8hFUGyGp+s4kr3VBS8Bg
   c/e+vBVZ1HyZ3QjnWzMgFK/Un1RszqTADxACEsANtDpvZQ5LG1ppG6mxT
   QXXQBbH2P/Ew0hwKnFlFETkPHZ/CN6l2emRIVjFFcfQX5WJPKSrmVfqfk
   9euZypgAc9N2UkLiyLDRDgF0BXdt/pAVkJ0KxQv49Y8M4b/e0Q0av4VtC
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="353169986"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="353169986"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 11:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="708718842"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2022 11:22:35 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 11:22:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 11:22:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 11:22:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 11 Aug 2022 11:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOO3v7HKBZxg02k8UZ/coAPbVsdPrM8voEjH6tya2z9w/cuuz70k2U/7RDILJnmBIA9aJ19dU/WkmHJgQfofS+Xg7C78mOT3kv9FslcjZbdMQhp132zf5WnyzH5s5z7ESG+8t+jvCBnaCflPGxZl63OQVZBwBlUqL64ra5HS4IxDsUvegc1UVggxXN6H0Me8ePY9fOnHk3MkDC+SgIrighMtfyuF1FxFVbpTnaRNAojvn3QLkjoQ5kKC332ownvojf8qlvp0NjjJ3Sky9eNFh0viplDUTZRWF6QMufAUZt6Ku27aTTCA8yItkXB4kgrqfEKuoZfaZWP7xeMHce2Qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+J0GzOURNmE9fdPF1K+wF/K8Aew8we1bDYM1ipPH7c=;
 b=dtb4IEc7WS0brJfqFfvuoXoIDNz+agnIRfBWGKbj95yU5X/dcEiXMGO5gPgRc6tcO+gdQlsvJssv0ib+t02ScVZaOwxBT+5xlQLpOaUiKxLWxQoEu6Or6Ee29TlWkPwQs74A5ZtrVcG1OqCcUA7P9FbUtwn6vMavPqz0D8ghn1dugUEB+9p1OWL68P9xW11vFexqLeOzG0Yo5KpqHaW6qtmqvbWdi9f8UOPVt6EJ8PyWmvNjicGuLb6gCEC/3ugCMpQ6sGhozbCkFDcpEUySGLpcPYLzRZR5Whut7OCX9kECH4l9hIZkmweVupGGoYUI/UsGfSS/28wcrQJwWXVklw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 18:22:32 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5876:103b:22ca:39b7]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5876:103b:22ca:39b7%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 18:22:31 +0000
Date:   Thu, 11 Aug 2022 20:22:20 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Message-ID: <YvVI3BKjmXUBhd8N@boxer>
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com>
X-ClientProxiedBy: AM6P195CA0082.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::23) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce568595-4f06-44b9-a4f4-08da7bc6749a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4695:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7LLW0n6tpyy2xoJL3zbw8qBBgEKYWN47S98GaYm8awEWAxQS8n5YzG1m9XAo4W0Lo3g62OMmEcAsm1XS7jcWBwlfcpZSKezdfN47Vs8k6oP3s115+4N9LRxBsJh0UhGLlTRIAdr+uoqYirMp3LfsfXCSvbm6o76EZ1DBP0jwOoXuPxFTmM5cP3RnoP5nF7+6GuIgEuuL+YM64zGwZlfJ6C19B7kuZD12zYN90pZAg+LumMt9jF4h8SkwzcrzVrcgVfxd9GsjaQV89twbMGYTHRtPpb3KeAQKN15YwV3FCcps1ZYQo7kpPayhtocPACKamPdj3yyKg4cn9lV3pR9efjz8stSvWVCFMKA/46H/4WpKQAzw1ZjB6Zlci3733yIzno/+4WAmWgnlcEYrJ8pA4G2ImmEpsJHVM1v4qNFvP7rYyJKXnWoooix9j3yyHv+jE9XPrIyoRqJI2DERNxFvshNh3R9MjBT9VOhDxfjZKUJw4SnyJf3XPDBcM84DS5rY71ySaI2gV61iqmH3cQVj8y2Y1Shc4Vhh3ncDz7sEIiN/xoDw2ge7CGb1o9HcX8PTk4FzQN8pdRZWuEhmxwq8uFl8TZVSeQdr1ZEhB+XWdZaRLy5XGx9/iPUBaAc9k3/gzhbguvHmIF5wePEr5kMJAclmDxeIyPnqZDx6tMm9bVNSKPgxMoIgvk3FfWZkGaokoZH/UDAhZFnfOzf9ftQ5Pfz5RzqqEjlqg0r4HAMthUmu2tJ0geTCPkBXNrzVW9m7yAyjTCTfS/tZ4bxgSVS2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(396003)(39860400002)(376002)(366004)(136003)(316002)(33716001)(41300700001)(82960400001)(2906002)(66946007)(66556008)(66476007)(53546011)(4326008)(6506007)(26005)(6666004)(8676002)(38100700002)(6512007)(9686003)(44832011)(5660300002)(186003)(45080400002)(83380400001)(478600001)(6916009)(8936002)(54906003)(966005)(6486002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1J5KzZ3dVFJZkVrRUZFSjZodjRQTVFuLzBSTWV4WVQyL2FpVUw3ZWlNS1Zq?=
 =?utf-8?B?eWpzU0toTG9RMkVkTTdhUkI1cUtrcnFTL0V2bW0xb3RmakRIWC9SZTA3Qmdl?=
 =?utf-8?B?Vk1oa3dnRHhhTDIzY1M0Vk1hUE5KYjJ4OFg1OGh6ZXloVFFBOEhxUHloQ2ZH?=
 =?utf-8?B?bWpHS2R6TGI1VmVOT1hLMlBQd09iVWV1S3RuM3U4UVA4dnQ3akJVV2JDZGFO?=
 =?utf-8?B?TzNvYnJqM1R2MDBRUmx6UHhQZGlkREdNOHlxTlcxQVc0ZWZSbHZWbkpMNUFE?=
 =?utf-8?B?S2ZsdkNGMmRzZkhjOVNRMkFKMHRBaTRiS3I4ZC9maTcxUTRxWkdjWGp2cDdV?=
 =?utf-8?B?bWsrbmVqQTJvamJ1Y2pSeEErQWFrUVlLOXpYWUlwOXVPVGx6KzQ5MjlRV2FK?=
 =?utf-8?B?OFlnT21OcWhoN2xqZWtqdGxVUmhMKzN6Q0RPWmV4MDMvZmhrK016SUVrK0Er?=
 =?utf-8?B?YUR0L2Naajg0MzZLVFJQNWtRdlhYVFBEWWhXUldXSktlZkxnYllEVFcyc1BN?=
 =?utf-8?B?bTk2akZzN1JYV3puNExGYzV6czE4blNuMHppYlkxMyt1MU0zQUs1MzNSRUsy?=
 =?utf-8?B?Z1ZuVTJxd2QxUGdpeElwYjA0U0QxNmJPK3lkQUNvOHMvVzRPRHFUYkV2dHRk?=
 =?utf-8?B?dy91dUFnbm5Nem5YaXJUbWNPMHZTd3YrRVhyRGVpcDB0WEhsRzVEYkIwcDBZ?=
 =?utf-8?B?b1ZoTzlFVFpMc2ZpVzlEa1pGbFdkQituT01EOE0rbUhmSnVFUWM1c0JEbHla?=
 =?utf-8?B?cUtMdCttT1hxVy9TYThrTTZ3c1BycjdwMm56dnpFdVlwK2UrMUxPYzFYVVZK?=
 =?utf-8?B?NVE0VU1pK25GKytnV0tLUGQzZHJHSmk5OHpiTDYvM1dwQzF6UDZoaGNaNWJC?=
 =?utf-8?B?djAveWJPVzNIUStIQkVSYWQ2aDg1MzJrZzZiRlAzWW12dUVGM0QzeldqWUJ3?=
 =?utf-8?B?dkhXbGJ6Z2NYTmVSdVJlMkcrZzVCM3dDNVhkaXdpbVB6a2xORTJ1SzFlZUV5?=
 =?utf-8?B?YlNpL1VoMXNKWU9vQm5hNXFjbXZTczc3azV3dGg3NXBWM3RQU25adDRwQUR6?=
 =?utf-8?B?UnhoY2pQR3FjanlVODU3NDhrSE1qYkFheERJLzdzZjZIck9nODBWQVh4Wmpw?=
 =?utf-8?B?UmZQRlRXaWpGSngzZWpnRHM1UmtZS0wyZEpMS2NtMytFVVNJamhha2JqZ0Fq?=
 =?utf-8?B?bDllT0UvUlB4K3h3VlRpZTErUUxya3poMFFaWS92cWpSMUpLSGIwaWNVN2lX?=
 =?utf-8?B?R0pYWVZGSkllcWVVMzU2OEFtSGJYMHFadHlRN3VaUDhiOEY3Tk43eU1iRkhp?=
 =?utf-8?B?MkI1bnJJN2orMk5FcjVhM2dtdFd2MGl3aFRBRW82VFJIZUhwak9rM3N2Y2NS?=
 =?utf-8?B?WHhTcVEzSkluYVpsVXllQUV5YkdIM012cHUvT0tWMUJGZTVkcnhuZm9BQ1Q4?=
 =?utf-8?B?SVdsak8rTTkrRlhNQllpMkV2RGZPUlAyOTNKZlJsUkR5TkpTWmJkU0JYa2h5?=
 =?utf-8?B?WGJzOXhyYUlzME55bC9rdmp2Nnpta2kzbXVveXdnUGFMQ1RPY3paN1gxRlB0?=
 =?utf-8?B?U1NOd1dJbE05TWpaZTQxKzhPY2dIQ1B5TmYybVVVK0dkTDFrMktHQ1FKQ3VQ?=
 =?utf-8?B?U2FBekZRY3RkWFV0Y1JmOHJpeTUyb3pQeHNSbjh4YWVvZWJ4dFZ1N3ZwWUNH?=
 =?utf-8?B?azBLNTJ4aUppZnpyOEFwdXo4U0tOWlJPZEZFL3BGWlA1THF3Ty9VOXk3S1VY?=
 =?utf-8?B?bHVIbEFLcHFkejlZcVZnYlI0WHF2Y25BUnVFdElJUEJpY2Jma0JvMzEzbE9K?=
 =?utf-8?B?Z3YvNDBPbHdlUzRicW1YZjJXQVFGY2I3akNuTlFkSXI4VDdQRThYQnh5N053?=
 =?utf-8?B?WmlQZldQL2dwMXJqbHo4aEpTYXlOTGJzL3FFem9UU1hmNmovVURDL2xRSTRT?=
 =?utf-8?B?eGtQam9Bek1zK0pQdUtBNVo1WXBkS1hGdU41bUdtVUQ3RmNZTUcwTnY0QUxt?=
 =?utf-8?B?bjBGZWNqYVpsVm5sbDZ3UndBSFNpVGc4Tm84OW5JSitvY2xGMjVqRGJQUml6?=
 =?utf-8?B?dDRYa2d4cXphOHZnQ2lhRzlMVFJ3ZkdiZnNjcEEvWUdVQ3hCaS9ianlVM0wx?=
 =?utf-8?B?aXUwQTFoZmRNMkhPRXFtQkx2ZG41aDlhNllzbEgydFJJazRUN0UvbDVyOTFt?=
 =?utf-8?Q?7lnXGC4EAqQFjFodfmdLx/k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce568595-4f06-44b9-a4f4-08da7bc6749a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 18:22:31.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKQxPrtFaKUlKpe6CoscvaBnhqGRWMAuHSjJoSjyJ6WPgMEBlyxlcmuYC57PND8D2wF7EBik9DHmEFcDlP7h9mrxkzKepXR/moyO9lAGGkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

On Thu, Aug 11, 2022 at 05:20:30PM +0000, Alasdair McWilliam wrote:
> Thanks Magnus,
> 
> Results on E810 is mixed.
> 
> In terms of RSS:
> 
> Tested with 8 channels, 4 channels and 2 channels, processing a low volume of packets first (e.g. 8kpps, 4kpps, 2kpps per setup).
> 
> * On an 8 channel setup, it is usually channels 0-3 see traffic, but 4-7 do not. (I’ve since observed a test where queues 0-3 and queue 5 see packets, whereas queues 4 and 6-7 do not.
> 
> * On a 4 channel setup, I’ve had it where channels 0 and 3 see traffic, but 1 and 2 do not.
> 
> * On a 2 channel setup I can’t replicate the behaviour of only 1 channel getting traffic. Both always seem to work.
> 
> If a queue does not see any packets on a test run, I see what I think is a proportional increase on ethtool rx_dropped counter.

Alasdair,

I have just sent patches and CCed you on them which should address the
issue you are observing. I will be grateful if you could test them on your
side and get back to us with results. If this won't help then we'll need
to dig this more.

> 
> In a very low PPS test (e.g. 8 channels, 800pps) I can actually observe broadly the right proportion of traffic, to the queues that work. E.G. ~100pps up to the 4096 limit before stall. I don’t know if that’s good enough data to infer that RSS itself is working.
> 
> In terms of queue stalls:
> 
> Each queue seems to be able to process at most 4096 packets before stalling, and the ethtool rx_dropped counter starts incrementing. (It may have already started incrementing if the queue fails to work at all in the RSS notes above).
> 
> Interestingly, sometimes they stall slightly below this - I’ve observed 4091, 4093, 4095 etc. I’d have to do more repeated testing to try find the threshold before it stops servicing the queue, but once it reaches around 4096 or just below, it stops.
> 
> I can reproduce this even with a single queue.
> 
> Also worth noting this behaviour is seen with and without --poll and --busy-poll. It’s also observed if I don’t specify --zero-copy, but goes away if I force copy mode with --copy. Off the top of my head I’m not sure if the XDP infrastructure will default to XDP_ZEROCOPY if capable and XDP_COPY is not explicitly set on the bind flags though. But, putting it here anyway.
> 

What ring size you're using?

Thanks,
Maciej

> 
> Results on MLX5 (hw is ConnectX-4 Lx)
> 
> The patch seems to have resolved issues on MLX and I can reliably rx/tx 2Mpps per queue with xdpsock_multi which is good news. (Same parameters as per testing on E810: poll, busy-poll, zero-copy).
> 
> I unfortunately cannot test beyond 2 queues in my current rig as I have to manually program flow-steering rules for 2 source MAC addresses into 2 different channels, and I only have 2 source ports on my load generator!
> 
> I could see if someone can generate a test pattern that comes from 8x source IPs, and flow steer each IP into its own queue, but I’m not sure this is useful re. the comment on RSS above. Let me know?
> 
> I will do some more thorough testing on the E810/ICE setup tomorrow to see if I can get a change in behaviour or observe what the exact stall threshold is.
> 
> Thanks
> Alasdair
> 
> 
> 
> > On 11 Aug 2022, at 12:55, Magnus Karlsson <magnus.karlsson@gmail.com> wrote:
> > 
> > From: Magnus Karlsson <magnus.karlsson@intel.com>
> > 
> > Fix an issue in XDP_SHARED_UMEM mode together with aligned mode were
> > packets are corrupted for the second and any further sockets bound to
> > the same umem. In other words, this does not affect the first socket
> > bound to the umem. The culprit for this bug is that the initialization
> > of the DMA addresses for the pre-populated xsk buffer pool entries was
> > not performed for any socket but the first one bound to the umem. Only
> > the linear array of DMA addresses was populated. Fix this by
> > populating the DMA addresses in the xsk buffer pool for every socket
> > bound to the same umem.
> > 
> > Fixes: 94033cd8e73b8 ("xsk: Optimize for aligned case")
> > Reported-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
> > Tested-by: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
> > Link: https://lore.kernel.org/xdp-newbies/6205E10C-292E-4995-9D10-409649354226@outlook.com/
> > Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
> > ---
> > net/xdp/xsk_buff_pool.c | 14 ++++++++------
> > 1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > index f70112176b7c..9b09da63a7c3 100644
> > --- a/net/xdp/xsk_buff_pool.c
> > +++ b/net/xdp/xsk_buff_pool.c
> > @@ -379,6 +379,14 @@ static void xp_check_dma_contiguity(struct xsk_dma_map *dma_map)
> > 
> > static int xp_init_dma_info(struct xsk_buff_pool *pool, struct xsk_dma_map *dma_map)
> > {
> > +	u32 i;
> > +
> > +	for (i = 0; i < pool->heads_cnt; i++) {
> > +		struct xdp_buff_xsk *xskb = &pool->heads[i];
> > +
> > +		xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
> > +	}
> > +
> > 	pool->dma_pages = kvcalloc(dma_map->dma_pages_cnt, sizeof(*pool->dma_pages), GFP_KERNEL);
> > 	if (!pool->dma_pages)
> > 		return -ENOMEM;
> > @@ -428,12 +436,6 @@ int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
> > 
> > 	if (pool->unaligned)
> > 		xp_check_dma_contiguity(dma_map);
> > -	else
> > -		for (i = 0; i < pool->heads_cnt; i++) {
> > -			struct xdp_buff_xsk *xskb = &pool->heads[i];
> > -
> > -			xp_init_xskb_dma(xskb, pool, dma_map->dma_pages, xskb->orig_addr);
> > -		}
> > 
> > 	err = xp_init_dma_info(pool, dma_map);
> > 	if (err) {
> > 
> > base-commit: 46c8229c4317ba8576a206d285a34783390ba6ab
> > -- 
> > 2.34.1
> > 
> 
