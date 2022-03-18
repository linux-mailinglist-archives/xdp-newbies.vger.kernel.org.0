Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323DD4DE1CC
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Mar 2022 20:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236759AbiCRTay (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Mar 2022 15:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235549AbiCRTay (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Mar 2022 15:30:54 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A52E12E16D
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Mar 2022 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647631775; x=1679167775;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qy2hKmRnf7QOt2e5P6OpQcIvvWAprnKRfLOG6c9lsFc=;
  b=PLrsAaOCbD+Iw3kiuaZgXeomLmbhJlUrhBYqblhO2grCI61aqVZ2kDDe
   AR7TNRI45/VmTrsWpiomYVLWf8J8cm4wIIuAL9Uqyj9GQrmZUemfj2fD/
   6iov2XSYr3AQFr8UKdWaIB4VH5WCe3AtmqvD79nEHG6qIvKKZ/T8zfJFH
   dEPGS354/suyca7zuUfENdNqE6arhExSbgk5H47MBkQytAFCEJiTKm/lI
   IvrkYL7kAH77IOb4mV+4p80o8bFCOYsDPQ4nGQ4ZJSWFQfCwBF4Lsy4d4
   O0zHOw1Ph2vHrGB+W00um8P4TA0mI4WdXEbk12zqm6YZcqK4mPrdahknu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="320417013"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="320417013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 12:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="647593722"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga004.jf.intel.com with ESMTP; 18 Mar 2022 12:29:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 12:29:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 12:29:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 12:29:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 12:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEiUOkL3VYAYB9E8dbkhjEO4TMeftTsVFpx3wUmgIMNIs3bzC8eyClKrMBqPz/uNbk+XXJj/lWg/n7KhBpi4fHTDQcFEfhW4hcKZj8uHXC9IXyTr/hBFY1rwF0Nj2SrdlWP1ZlulBpipIR4rGotHMsQXGfSHQ682U3AY2qZhQOdwFgX0YDl3h4o+isHI3hrOXKBFl8cITNVQd6wy9sziW7WpgDKs34aQJ/tLqVcdT/OQMM4M8LmCy4C0eFSj3yX8PFxvj0HPAM1jMHSJxMvLdottGQQ+bUW6IINz4yajRsv2Tld5JwLIVg9VBYNJ5S6aG+nG+EpEISwJmbL5VyeJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eplHqljJ2mybS6K5BNi6SU3oCynLl6bcgBcTTIIdqck=;
 b=cHLpLGiLIufC7OV+ga75vsUNJY3nPOXjG3epJR/TkuDigo4CnBQDR+iaZROqvUfOwv702y1EeY/sJdnXPkVVqN3D3hhvnOGZWrodPg3F4/wa+V75k8lVmG0OEj10F92PMENVBJV0GcC0eTIX55y7mQCvUR442GFeqEEYsNeXe8uiDglo+xMaV+qgn2tSM2ccID/9Hppte7qiReFzT7Qnsyh84F1giFgmExmMVaT/7VU/fJ5DZVCszv7TpSFfOVltyXrLeMnfT0iBwBEvGM2mgESAY3KW9N5XiEs7NaFZm8JCQR3ZnYto34mbZJSY9bFsk+XvoKEdWHBasbSmG78awQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Fri, 18 Mar
 2022 19:29:29 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::2d6d:f382:c5a3:282b]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::2d6d:f382:c5a3:282b%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 19:29:29 +0000
Message-ID: <cf883b44-c192-cbcd-e430-1247b2335cf2@intel.com>
Date:   Fri, 18 Mar 2022 12:29:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
Content-Language: en-US
To:     Jay Vosburgh <jay.vosburgh@canonical.com>,
        Federico Parola <federico.parola@polito.it>
CC:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        <xdp-newbies@vger.kernel.org>,
        Piotr Raczynski <piotr.raczynski@intel.com>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
 <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
 <86baadd1-daac-09fa-c3df-50308272ef77@intel.com> <2430.1647559617@famine>
 <37d17135-df90-8101-159a-babd2ea58a4d@polito.it> <20413.1647628390@famine>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <20413.1647628390@famine>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR2201CA0048.namprd22.prod.outlook.com
 (2603:10b6:301:16::22) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b2780f-0939-47c4-e27c-08da09159f12
X-MS-TrafficTypeDiagnostic: DM4PR11MB5390:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB5390603765CED096FD0A6E4B97139@DM4PR11MB5390.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYfsuv9mCx/TcQJTF+xO40ET1mvpHYgL1w+bex92FRpRRZHI7YWvMpuRbiU8mCQWQFR8m86W3kCf3cGKwpUpUTVd881byvghEhBCm5gF2TTOioNuhZU0lRoLFF+cLYNffwhlcRLssLAG+mp1cMaS/7kyUKmHoYdhdET+G1yUZsScNb9LsPnyN5St8VLNjcVjQxCZg0/c0zjSWO8Uor4nuwAMHWFrS9VGpCm0YXjZR6vHqUn9B4IHv68ZhtfhWrbcmo1fRu93T2HdUxbBvJFWTMf/NnLl1UdiAeZtEkDNmzG7ayhBFhQdj2PQ9+tmhntYwsgPUwiaC7Uyoi3leTlBxVDz5jb6XFgj6Qfkchq2nhkwQCa55XuK+TLDIuco6pfx9qu6s/TWYJG9mZxhwTCiJJKgeRMBw+a5iGlv3rcMEwKeamXaoMeJpv0b+OUSL0lRCV8Q0KXEjC9ixEHQhz0J5nO9uhfVJ0VkykfwWMaFFA2zUKwKySCs36njy4WJVbqRKS5cMCVHJCxGvSxOI2btVJONBh2vHR28uWcXxrrcnjkJ1eI3Hah1CzxcK5fdgg/HCOgXGRjM0rDR+dw8ib1Nvf+3QGT5a8vxlb144oqAlunULBx441KXMR/+8ZymnhflWhCQwpWnQzPmdHMyVvtsRa6Cumfo2DFo24148hGd4Fe5ktNPCLJ4AJtm0Ax34mh3XkGuUgqNUi6Aa33rpFiWOpKgJzasRVkRpU/CIcdOrpRk5ECcOtkkd80vb7NTzylJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(508600001)(82960400001)(6506007)(44832011)(4326008)(54906003)(110136005)(66946007)(66476007)(86362001)(8676002)(66556008)(316002)(31696002)(8936002)(5660300002)(6486002)(38100700002)(31686004)(83380400001)(36756003)(186003)(26005)(2906002)(107886003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUczeHZFM1IwNGR4djlneW4vdEx5N2t5eEJUaUx0a2VwbHdIcENyOE9HcC9M?=
 =?utf-8?B?TVcvdytsQ0U5WklkakZHMmVpb295VkVpb1NDb3hMd3FRb3R0eVlZTzM0Tk8w?=
 =?utf-8?B?NHBXaEJNU052V051SXhlL1ZvdlZpcmJvcW0yK2tVaWdRMzhYYUpmQ3g5MXNl?=
 =?utf-8?B?SXBuRkNVQ3drbEdKU0J4bDhtc1pMOThuWkNYM3JkZzVydXVRL3hpcjViZnZM?=
 =?utf-8?B?RUFaOUdJb3cyMmxSMm1TV3hRTWJUQ0UzaTVQRnRCbHNZc0c5cUQvUVozT0ZV?=
 =?utf-8?B?aG41NFZNakEzZGx5NjNMNFV4ZmE2NXFWcGFUVG9HWUlkOG14TWsrbTNta0Mr?=
 =?utf-8?B?RXc3aGpLQWF3VHFVdmpvSkxIeXk3YzhqdDllMlRkbVc4RWhLY3ZyYjA0a3F1?=
 =?utf-8?B?b3JMckdCZEM4Q0tCWkljMUhXcDdoc01JaUJaYVBaMVJFb0IxVW1LVXhFdzhD?=
 =?utf-8?B?UGhiZ1FROHRReFo4U0E4RXBXOW5meFJDbDJjTytLRG9EaHVVZjdHeWIzVDl4?=
 =?utf-8?B?WGJxZVpnekt2VnZ1K0FSY09KdWEvVFFxeDlPY29TTzhKZzFCalArT1drQnQ2?=
 =?utf-8?B?OXJGWVpyZ0dKUFpMTzZLanp5VXR3OEhIU1hXQnlNNXp4TWZvdGtTd0cvQXgy?=
 =?utf-8?B?ZVBvbXdEVmNmNE1aZHpMRlNwNHBCSDNHc1I3K2d5QUh3OFlJUWY2cFFNNi8v?=
 =?utf-8?B?WUpDTndrUTk5dlVNR1lZZFAwZlhjK0NPTzhKU0U3LzVjTEdkQTltTUQxdFpU?=
 =?utf-8?B?YUpzT1Fkd2NtTTlPL0lNbE52WFkzUzJBanpNdmpQZVF6WkloU0FaeVNWY0N3?=
 =?utf-8?B?Nlh4U05NemRuN1o1NEIvRXlzendjWWhwejRQTDMwMUt6ZkRNa0ZkNHBHNngr?=
 =?utf-8?B?RUxuT1NJMU0vQmhIMXlZcUh4QzRXVTI4WDNsSTVaRWY5Rnp0YkE1cDhOanRG?=
 =?utf-8?B?Sk5OUTlPakZxMkdBdVVBMFQ5cE1tU1cvM1FZV1J4SUJwR1lEZ3N2RXVhUmxQ?=
 =?utf-8?B?MjN1alhDcFc1Q042T1NJUXNEOXFnY095RExzOEFKdFdZMU5odlpwbnowUHhD?=
 =?utf-8?B?NmxVbTExeUlwaWh6MzlHZ0lycVFKa3VVUDc4d2hva0d2NEJpZkRTZnRZWThD?=
 =?utf-8?B?K0VTNGo1Sys3dEFxNGhJbW5Ock02L3ZHelRuZjFJdWEwZU5jNGZ6bXRLMHJJ?=
 =?utf-8?B?SDhQWFRuS0pYZVlDU0Jac2Zab3lLWDFRQ21jaHdFa1dHZmNwbmtJVzBaTkxF?=
 =?utf-8?B?UWxLYnlkVjRCVnRmUUVpb1g4MHlLWXpKUEtoODE0L0dWL1RTWFRtSEtaOVRD?=
 =?utf-8?B?OEx4K00wc0xDL3ZwbDV1VDUyT01EMloyQ1lzZUl4NVJxKytaYUFiM2hkY0tZ?=
 =?utf-8?B?MDVVL3NQNEF6RzIyTy9IUmg3SnJBZXRJK3NTZHpOVVBjeTM2WUJFcTFhejRJ?=
 =?utf-8?B?NUQ4UzNXKzVqY0Q0QWJCYVFiMkl1Q01VM3BNenFuTFVhUjhnYWpGS1RqeCsr?=
 =?utf-8?B?UTVpeVdFSzBRbGc5MUs3TU5KaWFtODRwaEtWOUJRY2hoZmhMdHp3dytrK1R1?=
 =?utf-8?B?R1JSQzQxL2l4YUd5UmZOY2lsdmlFYnRCbkJMU0FSM3FuZURXNG5mMFlYYlA1?=
 =?utf-8?B?Y3JQYUVyU3ZjdklQU3llSUcwdnlucml6K1RqR3RWRG9JcnBHUTB2RmFiNkRX?=
 =?utf-8?B?ZWcxRGhnZlhPbUVvdWdLd1ZiSHNXdjU1VFdlbStCNnMwS1pVMTQ4VHNFbnZM?=
 =?utf-8?B?d25WQ01JQW1DYURNbVVQb1lRb0FqSWtpZS9PeGlVVmRabXVlSUU2cCs2UGlP?=
 =?utf-8?B?MFdXTHg5aWlyOXpYcmwzaGN5ajZTZk5xU0tML2NKL3ZwWml4Y3RxQmFhNlpZ?=
 =?utf-8?B?S0VKZXRuclo2YkRwYXVuZVZZT0w2d1RXaS9lMmZBNDkyVFFha2tmMU5jQ0Jm?=
 =?utf-8?B?NmpnSGJ5L25veklhd0NmRldLbW9talV0Nkd2bEUxVTUxZHJnV21FYXZRckJD?=
 =?utf-8?Q?QL3rXI2LsCMWrO+WU7DTrBir0WL7p0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b2780f-0939-47c4-e27c-08da09159f12
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 19:29:29.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiIXeyi7eeivqaDMjmweD0b5ioHtl9V8PpTrMeKNjKxK8cS4Z1B9Fy5xdQxUYh16NWvbhQO9IT3e2dcEipUKP9Vidz9Yoxe0C+KOD6uLoTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 3/18/2022 11:33 AM, Jay Vosburgh wrote:
>> I tested it on 3 different XL710 NICs, all updated to the latest 8.50
>> firmware, and they all present the same 8 packets "batching" behavior.
>> How do I check the PCI Cache Line Size (I didn't find such entry in lspci
>> -vvv)? Normal cache line size is 64B on my system, but I guess they are
>> two different things.
> 
> 	It's in the lspci -vvv, near the top, e.g.,
> 
> 08:00.0 Ethernet controller: Intel Corporation Ethernet Controller XL710 for 40GbE QSFP+ (rev 02)
>          Subsystem: Intel Corporation Ethernet Converged Network Adapter XL710-Q2
>          Physical Slot: 1
>          Control: [...bunch of stuff...]
>          Status: [...bunch of stuff...]
>          Latency: 0, Cache Line Size: 64 bytes
> 
> 	Checking the PCIe spec, though, I'm not sure why this would
> matter, as PCIe 4.0 7.5.1.3 Cache Line Size Register says it "has no
> effect on any PCI Express device behavior."

Thanks Jay, that might just be the sound of my brain short circuiting, 
as I thought that held some relevance for some reason. Our receive 
descriptors are 16 bytes (with options for 32 bytes sometimes), and the 
transmit are 16. 8*16=128, so I was suspecting something related to 
cache line size in the PCIe is triggering a writeback when we get to 
that boundary, it's probably some other trigger I don't remember.

I know the XL710 has a documented erratum where while interrupts are 
disabled (like while polling) that hardware won't write back until it 
hits a writeback criteria, or unless the interrupt is re-enabled. We 
have a bunch of workarounds in the driver trying to address this, I was 
thinking maybe one of those workarounds isn't hitting in the XDP code.

Oh, and WB_ON_ITR didn't appear until the X722 generation, so it's not 
there on XL710. Hope this helps!

Jesse

