Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795694437E3
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 22:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhKBVjU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 17:39:20 -0400
Received: from mga01.intel.com ([192.55.52.88]:55511 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhKBVjT (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 17:39:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="254991854"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="254991854"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 14:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="583840233"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2021 14:36:43 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 14:36:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 14:36:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 14:36:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 14:36:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVxMOaTjFIEfzCwcq4Nwm4MJ1KJyHpaZD2tIOalLK7sjcCYyqSuby415xHEocjF9MEonh3oIRTPgO4NrNCeKcLGACwZ9lhu54iwRkvwFOadSCWhA0QVQnhijUx2qOXxJwZKUif6+CG5O0AljznnVsrKFWsniY7obcnuYXTR+1AJ9IYRo8Mi+QirOaSrmvZK573V3diFqKo2P1PAAIdc/oDr6JLTo2QmDs/5oVMu/CatggLuG5/VIJAiQyaj5lGoS853KKDRSQ7/0qbpooOhbVLUiB6B+XQMDzhEv6XSwOQpnWHsBQYhKSm2avlWCueLGMj52xkExXGQw57yTHA/47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/klwwvpXraEqaUYNysFDNWINELjIlZc6yJHyy8F0Vls=;
 b=Kh0PdqSRji2gKpY4QTXGrkEpOyLS/uM7vwGPGceyf3XbnIRjwRjy084bpYyP2dBtcvpKvqUhVCaz0hcqmaJaWDyXaFd20ymWqNkx1kN/BkgvMtiHmWcRWDROd2DQc22ZyCEw25xdnqSF39GHOYyMzVZp8ALzaVTqVEXAV8d/mGtxWAHuNFXarN9YYAkVEETGxJuyIG0pCsGfJbaxJP1I+6d3LUgh6H7UJoo4BIVodvKjZ9xadBG/O7v7k2MlLFeYYIRyczPZZD//9/2q8KUudZZUBrogteIIRte9oosZ+e82HOgUhHas3YGJqSzETQF993Hstb3yMK42/1HWtRTP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/klwwvpXraEqaUYNysFDNWINELjIlZc6yJHyy8F0Vls=;
 b=B7bbH2/+oOXXlTVAUotXon+y9WwR80kvZagNkiMpxx8AU8UsKvz6sMG6Fk3C/KzpdvGBuj7TQVIRBfaLq5qMfopl1yP17JpAqDn9QwlmpSRNbecHnMcUFqPitKzXTi7cV+Sg/tQoXUPpMAz7h0T7YlGJHgt6fSOkJ2/yJl6PkWs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 21:36:38 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 21:36:38 +0000
Message-ID: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
Date:   Tue, 2 Nov 2021 14:36:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: RPM for the kernel samples?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0317.namprd03.prod.outlook.com
 (2603:10b6:303:dd::22) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
Received: from [192.168.1.214] (50.39.107.76) by MW4PR03CA0317.namprd03.prod.outlook.com (2603:10b6:303:dd::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 21:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f516a0a-30cd-46a6-b4e0-08d99e48da51
X-MS-TrafficTypeDiagnostic: MW3PR11MB4762:
X-Microsoft-Antispam-PRVS: <MW3PR11MB4762E4AADAB03470E1D8E6BF978B9@MW3PR11MB4762.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAbu7s/ST+f3Pfrn5JHY+P6IDis4gLADBFiTeg65He7AAu1CGWVHNUYZdgnExH+MWOGp9jtV0aVfzAcZ2303wsz2XveFsHxNbcJhbmWCUDD4ZrOUgKFDI58l7eA6zxeqBB5ZEE8XClfrIwadXch+bpc9qlsg6IKdoBmOAQhWP57T9sgmgIUEs8d+5wXRm5H102vOhHbiugSoSfMqGgH8AnQa9dW5q8VuPAoGjuugqk7Q3FJtFbb9Id+iHwxMxsa9mQJVHiy5AGH5BWu3i9pHJKhz3f/TXhW8J0m3n9eUiYXK3FXff8ruprvR25DtwJwM1mbjW9aYiVUdFpuyzh8C8fPJpYr5XrsV1ZeCtmuRqkAoz+RJJ96moe9BXc0em79/3tFo8Mbd+C++42gjn1IWaY5wotoV7kuj5wUNvV5fXQchKydstY9SgpgYNLA7oW90AN9QPsHQVSBKFqLz1r6PdYClxqslyNyOpilpIra0jjzemED2w8kBTyFAbEkTqeCnQbo+KgrPdqbk9Qbo5kGNquhkxNHh1evDrfg62fC9VVevEDtXbcvSEBY/KW/LO2TEB8p6tDxXoDZSGRW5ZOHGipfOLDHOZ+WzUyfOv25a9buNFBFNFu9MYM3OgFyrDw8Qk4H/w5MNPZELe4WssSG4lrKNAH+/mSsupKVP7b4aNWXrjs9X3o7bXHuQlvL9DRMEM58zXc0EowrV+8WfPrRJcuHBUbFDgPO60+x378bWnWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4744005)(186003)(82960400001)(2906002)(83380400001)(8676002)(6486002)(8936002)(44832011)(26005)(31686004)(5660300002)(36756003)(31696002)(86362001)(6916009)(316002)(956004)(2616005)(66556008)(66476007)(66946007)(38100700002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZTZzByRVBHeTl4SWNBRXF0Nk8vemIvV0ZuN1RvaC9nSUU3a01wWWR0aDBy?=
 =?utf-8?B?Vzg1d2VyU2lTZk5CVEEwc3lqNG5VUVJPMmxlREJZLzlCOWhZTDF0YkErTGJ4?=
 =?utf-8?B?ZW93WFJZZjh1QmFGU3czRUxZalh2YVBZQzk5SEJHTEkyeGZ3VnhiTzJGZlBt?=
 =?utf-8?B?T0FEZ2w2c01WRkIyd0Y2ZUtzOVpHQmoreGRiOHYySVhKLzhVam9JQWFPSFNy?=
 =?utf-8?B?bTliZWxZTGtLem9RWisxcFJYVVBHbC9qaXJPOTEwZTY3VjB3dENkd2tMWnU4?=
 =?utf-8?B?TDB2cjNuWTJvbDM5UkxUN2hwRVRoRGRYcDVEUk9SZFFJNnViYmthOVd6bkF4?=
 =?utf-8?B?c0F0SkxSQ2ZNWUhvdGMyVjlkbGw5QkZ4WmtiMklWRkxRbW9oOE5iTzdhcUp5?=
 =?utf-8?B?SC81c1FsUC9YY2NlMUl5cDdaUTRSMnB3cWZ5SmgyZjJYZDNqNU03aWwwY09t?=
 =?utf-8?B?Q05tZ0NDSVBsTHZIU0UzSVdCVXErdUlURkJjSjh2eENoWGxHTWVxcUsxS1Zk?=
 =?utf-8?B?QTl4YmNJSkdZd1RkVWhHWitkck9DUFBid1dBL2ZLMk1aVWxJc1l1Z0ZzdkxU?=
 =?utf-8?B?bzg0ZGtsQ2h2MXE4MUMySit6V1FUTWx3djhTT203VG9lbGlmZCtVOVkzMmEw?=
 =?utf-8?B?TmFrZEZzbUZXQVpqNlcrd09vdEljVDBtVWRXcDM5bjc5SDBYenFmWFowV1ha?=
 =?utf-8?B?RXhsK0xVRXNtMXkvTklSMWJsRzFvVmcxelJybTI2em16MkQ3UUdQMHovc3Zj?=
 =?utf-8?B?cmprY3U1V00xMWtlbTBIQ004Q0ZPeXNKY3Q5SUluMUZzcFVIelB3MXI0UXJm?=
 =?utf-8?B?SWVCYnEwd0o5TEZvY2tqOFlCc0Q4NWJXWmlVS1BnR2dYNDA5c2dJbFpoNlFF?=
 =?utf-8?B?M0lwM0JkcS92OThaQTVyZVRoam1zeG15M2FBQ0J4cW5QUVFaODlZYzluWXNO?=
 =?utf-8?B?L0FLVTFXRHc5SVczMi9pckJaU3NtWm9pVnJaUysvNnJRcmw5YnhjeW52L1Mv?=
 =?utf-8?B?RVNtRSt6Ym1KVkg3SUdIOWY1bGhzWnVxbHBaaFJlaWVXNHlNUzI3REZnWHNT?=
 =?utf-8?B?Y1FzUlI4VmN2cHNDQy9kUGdIVzRvK1dkZkNkWHVSR1BDYTI5cm9NeWw3VmJY?=
 =?utf-8?B?eEluNWpQU2RtSVRmZHR1RzdzaXliNG9wUnY2cGdhUVVacTVMQmRNb2RqUWhp?=
 =?utf-8?B?alVicVhqOUVyWHAva1pSVnR0c0xaZU5lVXU5MTA1b2pNbjIvaFg4MjFKRXdM?=
 =?utf-8?B?OU1TTGVnUWZGTE8vZXRVNG4xY3c1dVY2WUJLK0N3bVE1NzVLU1ZEWXc2VmpB?=
 =?utf-8?B?K1A5Qk41MWJCNDd6cG9sL3JiajFSYjZaaFRCbGtTMTZLRGl1amltMVY0ZU1M?=
 =?utf-8?B?L20rSURwT2VyOXZlNU9lVG53RFIxbGhyQmVsa2UybzJUVzFaK0tGdUFaUmQ4?=
 =?utf-8?B?ZnRKcTlrQzluSE9Ka2hXSUZDZDB4TlFWL25adlNHZndhekRqQkJ5dHdoZ2dN?=
 =?utf-8?B?UVpTQXdBTDlOMnkyYWpqNEpHSGp5WDdmWWQ5S2syTGM4U1ZPMnBQQ2toRFZs?=
 =?utf-8?B?dE5tMlJFQW9rbHoyeXUzTXU4R1JnOVZSZVpMN2FxU0EvUHFrTjNBU3VrRkNk?=
 =?utf-8?B?K1c4T1J1aW9xYytTSDJPYXgrNmtyMFNVKzZFc1Z5VzFXS1RRSWxsNS93RUV4?=
 =?utf-8?B?OGRSbE4wTitYZnNhd0hjKzNLZ0pKY2kwaUhkK0hpY2N3MW0rTnVBcFVVV3hD?=
 =?utf-8?B?VlZ0T3pzcFhMSERZbGVNSElHR1NFcm5jaDNIRnpvcFVraHNaS1REbGY5dlhI?=
 =?utf-8?B?MXB2L2g4U0FxS3dZQXhldStYazVIM2pRZnlhWVFlRnE2ekJyejNFTnhGT3lN?=
 =?utf-8?B?ekM0U1M0ZEttdngraFF3dHpyM1dwNVJQMkxDblE4Q09rankvMWxGOVdkMFFa?=
 =?utf-8?B?MkNleE5pTXlrUnJxMkVOSm9BcEJyMjl4TjgrRUJkWHhDQVFDOXJiaGlqNEdv?=
 =?utf-8?B?WG1DMEdGTVlMcHh5d1g0VnNDcW85eHMwUDdpeHliOU5ZMGZjN3JoYjhjWEtF?=
 =?utf-8?B?VHBQZ0NLTTVpdVFCdXRYd1B2YWFpNnpoQzJQRVRLMTNBQy8zYzZGVVg4c1BQ?=
 =?utf-8?B?OG9pNWkvbzZGSEJCWlBxYURtTzJ0blU1SnZOaEtlMTdZaVUyeTg5NVU4d0Rz?=
 =?utf-8?B?dmpiRGMzcWh6RUcwMVBXemZkUFlPRnllOVQ0NklHamo3YlVGblJrdmJTSjcv?=
 =?utf-8?B?MWxnQjRHOFIwUnB6eVZTT2JYNElBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f516a0a-30cd-46a6-b4e0-08d99e48da51
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 21:36:38.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjuP9umPiCjnLZ7YT8IZDAcK7YPd/Qk3BUT4NewKXue98iVW1krPpB6SCl81Zy9VzM92Jxc3eAtFunsf6RhvKAb3cLyphX9P7cNIq7sHRao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi there, does anyone here know if the samples/bpf directory from the 
kernel is built as a part of an RPM from fedora or RHEL/Centos?

In my searching I've not found anything.

I do know:
1) other directories/tooling in the kernel is already packaged as 
standalone RPMs
	a) see kernel-tools package which packages cpupower/turbostat
	b) the spec file would be substantially the same as the above
2) The tools/bpf directory already seems built as an RPM.
3) This seems very possible.

Does anyone know why I couldn't / shouldn't submit a request to Fedora 
to do this? I might even get the .spec file working myself just to prove 
the idea and give a sample?

Thanks!
