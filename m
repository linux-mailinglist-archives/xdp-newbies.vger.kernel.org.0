Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A396F71BB
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 May 2023 20:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjEDSFV (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 May 2023 14:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjEDSFT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 May 2023 14:05:19 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E61D5FE6
        for <xdp-newbies@vger.kernel.org>; Thu,  4 May 2023 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683223515; x=1714759515;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eCn7lBQZgw4YdyjvPqaPA9SQNUpCROLmPIo+hfdck0A=;
  b=ZFp0/W4YEp1MrkR7bIlcwT/S1EHRSEnQK0JIUIKpuPw7yiBJU3zhdyWq
   a38EujdcF48YbQA4pOonZvXn/icvM0nGqvnSwMX2A3zKxCdAYwBdCEx9N
   Nh3wxFuPg5xJgAzi1mr5p1IMMiDbpOojwxKi+E2essardboURFjSWq/wE
   roOWB8Jqz/KIsqnqUNbOIn6wSGqRGNukM/mEWYsXiP1f/qL8LDINav3XN
   CKSnHSXsofKyEDy7D3aItZQlC4IA/b3CUbtMVJzDONH+wYRs5Jx4JFC6R
   Qnq/tQH2zynDGCZJLgKescCW84KihU43Kz420c0Kje8j4bj1oOaui5n9B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347833514"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="347833514"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 11:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="697162407"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="697162407"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2023 11:05:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 11:05:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 11:05:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 11:05:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 11:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Clrh3KEX2ShmvoIjvVJPrBac142UaUNFWOcO6y04dYhPb5DCC+khD8+o/IX8UHYxP/ZPaRtvIYCY/IaIFJzD3LI9emiS0fxpvL69WGE1LFKN26cVMP1Z93pgITKhYwyOI0ficK2aAwYBAYqhLXsLQCtbb24scnV6fnuNLmFCcBHvme4ChKNzB49AGG3mUbYg0Vp98ac8obYqqgE9ZTLnR5s2jQTtQXU7V/9rCd0yTy7uBtIi9CeOhEmwlLOgfT2y2xgEMbN/fdw0i0cXlVr7FDex5MESUC5fEri+M7cmi8F0MM+ujTYkxBSiZZCaWUPjferYdvQPQm4itE26ZNfUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z7SCzlQF8VU8Yl6D8DSUspgA7AQzpzuOfc9+zpF0Lo=;
 b=kaRzwPE5/E8zBQhFaRWLYn/LhYl3bOPbhWmuctPMYru6VzrIeVQ9fuOh3lJFvCeMjp8WjTiUhqaxoGlh2wCJaoshC7zohO8gbgpQA2PUkGNHONUMNuLdS6KgDaGHOWoJEjBM92kc1yQVC2++JN+EN5iGgNy1vpdSg2PT3o6wpR7GFhT2Cx3+aCp2HW01WluEkXj4r3qvYbQUNtpCTrpmwW6cqQZf01l1mPMPN7oTW21DVt51kpublHxYnQ/UtY/opMqx/4bb2RNcYku1zAcPMqh5h0CKBNifmWIIZW84i7Kf42O+pyqlaT86iiUwjzrPrN/37mUXxTWgJhsJaWjeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 by MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 18:05:11 +0000
Received: from CO1PR11MB4804.namprd11.prod.outlook.com
 ([fe80::bd7d:9a06:cf40:43]) by CO1PR11MB4804.namprd11.prod.outlook.com
 ([fe80::bd7d:9a06:cf40:43%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 18:05:11 +0000
Message-ID: <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com>
Date:   Thu, 4 May 2023 11:05:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: XDP redirect - ping fail
Content-Language: en-US
To:     team lnx <teamlnxi8@gmail.com>, <xdp-newbies@vger.kernel.org>
CC:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
From:   "Shaw, Jeffrey B" <jeffrey.b.shaw@intel.com>
In-Reply-To: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 83143840-6e5f-4722-acb7-08db4cca1aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +EHGlCR+OpY7N0vATXu3ZvT1q0bML2PBeg0Pj6iWAvbI42I8Ui/346BnloukbNjMKJGNiyUS/mXfrCyGbALNeMHQOY9OeBcTJ6z06klbK31OB2fCZs1yWD5ReErwpp/VA+Jxz92/8LcZyYm4fkLNzxWHlukkTUqHHBj29GA0HRonxT8jVh4IzNAJNRkV6zRpb+6T+YNkmqbvGEOmxaXSUd7sNAtnoC6XHTKDPOvARP0tFsjnhUvqgFoj75d0vr0TLI1tQ+X2fUzTcydcbnaI31vbCcqRQjNSRvduT7x40bq8jrI/sa6B0ALRKjITkc4q5JoeiM7VgULMEKMx9KOM//FyhKtajiMNXj5PBdOqjHx5au/9yHX/shNTftHN6KVMLdWtoXjcjNYkYSN3e5X6+CwxXRdtEB6cFktVoRPOB6NnMKm7ocNhv1wl9KEyb5aOg9mreABNFYPirV8kXKyQfctvRAK3O9J4rBVSLpHieCBNXgRR11gOPtyDzm0cmHiKst9fQAVPpDsbmKUQe/fktDXIJOUg9HbxU7pcBHwAbSaI+USeddQARIRncE6uF5TPRmsvOmSsc3wdQhjlylDoW7Y680vT7kn6mW9W/yh5qbwC8w7TDiOcpxkwRpKjBdpjJaiyLYBnNQZA+SBfdbjFWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4804.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(38100700002)(2616005)(36756003)(86362001)(186003)(31696002)(82960400001)(4744005)(6486002)(8676002)(2906002)(316002)(8936002)(41300700001)(5660300002)(31686004)(478600001)(66556008)(66476007)(66946007)(4326008)(53546011)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldQL0dxNzh6RlpJbE40dU9iR08weHBXRmFGOTZpMHg1d2E2K25uWUd0R0RK?=
 =?utf-8?B?WWpGMnJKbkJYaEFEbTQvYVh3cHo3a20zQUh3RzJLdVVMZW9JbDFLV1Y0M2hK?=
 =?utf-8?B?M3hLOEphYWkzb1A3TzZQaWZmdGE4YW1Jai9aWDBmemZ4Zis4aTRqOHV6U3A1?=
 =?utf-8?B?M2JhaW1zV2ROWUtZTVhMSmFrUlVDT3pJeFYwaE4xZ1F5WW1oY3lXVFRrTkFl?=
 =?utf-8?B?cUVib3ppTlFrYUJJMnBVTWc1alFsSTZrS1cwUjhxblh3N0h6cnVvSGYrS2tV?=
 =?utf-8?B?OUZNM2lLNnZNSUhXeThMdDFudjN3c25vYlVRL3pXYlJhanM4T1lodEw4OTRY?=
 =?utf-8?B?OGYxMGgxUUFhRXloQjdjNDllbW1oeDVSMUpoUXZsSDQ5dWdXMHZ5aEZRV1hV?=
 =?utf-8?B?MHpEeHRkcGcyelhzcEdPYkw0cjVrdkwxbHc0cVhWN2FiQTF2c2M4S2N0MHFm?=
 =?utf-8?B?bUFyZVVyVEVIeEZYcy9zWjM2YVdyZGVMVFVkMlFhUkZrSXV6SE9raXAwdGMy?=
 =?utf-8?B?UTNtSlprYVpMQmFPbktFUnlnbVFSOGF4c2lndVlreVdmQTFqSXFMUnZ5eEN2?=
 =?utf-8?B?Y08rWEJMYVFWdFY3NlZYV3NNNW5PeFp2WGZ1ZEtCUmpuUFVEUGVzeUp3UzN5?=
 =?utf-8?B?V1ZKZEdUVmcwcVV4M2ZNUU01eVdnUSt0bStlUHVhVk10aVJZWmJVaEtXK21C?=
 =?utf-8?B?T3FJVVFXRko2dmplTVhvYjN5N0dEN3krT2NwNEVKOUtMOVZvVUMySVNCUS9O?=
 =?utf-8?B?NFBva0pueVYyeWZVKzNKWTlsUkl2clFMVWZSSzBHL0EvMnA3VkIrb0JzMzNx?=
 =?utf-8?B?OGZPaWNFQ1JUOXFGeUdKRFZRZis4VkdCM0txM0pCclJCaktFL3pTQ3pHMmYx?=
 =?utf-8?B?aVEyTVI0SXlZMFVNYnZWdlpPd1pCOEV6TXpzY2JhV0R5RzBWTlNJbzdTbGY3?=
 =?utf-8?B?Wk9TSmxRVWJBZTVUNDluN3JQaHFpMkFMQzlJZHdjSGJsRjVqSk9OR241dXRS?=
 =?utf-8?B?Ykt0RE14Z0pLTFFaRlo5NzhkaDRuWkN6ZkNhY2duN1ExcS85ZlUzN0xkTjBs?=
 =?utf-8?B?aWRoaEhJUjI5Y1hVVEFSeWI1cWQrdEJ2djJiMUZ0UzlsdVJIaVBVdWZDdmcy?=
 =?utf-8?B?N0tNazN6VnlITlZhaGJxQWt2REZRbFZVeFp4MFF5bFAyTEs3WFJTTEZwbjJW?=
 =?utf-8?B?K0NCNVhtK2hpOTZhZXdoUjRqMU5HT0g4NWZzRlFoaG5ORGp4ZzBxYXNKaWVT?=
 =?utf-8?B?ZUZUVEoxM3E5dytMbDQvdlY3ZTZqSFkvTmY0VFFkUTFtNVhpS2N6ek01WFpZ?=
 =?utf-8?B?SmZ5R3BlQW1iNCtndklRbGZrVWdFUXZkeC9rdkJMTHVqQjY1ajZwVUJCT2J4?=
 =?utf-8?B?UWVMelkxaGYrdTF4K1lTUWl1VVB5WXJlZlF2c01PUk1OcHNvV0lxNmRGa3dj?=
 =?utf-8?B?WUZQR1lkWjhwMUNkWmFxZkVKQ09nYkNoYXZHSE1PU3JaM1ljRm14SmZUSXQ1?=
 =?utf-8?B?TkpIVjVUS05HZWxBVklLNktjTVMzcS9URFM3dTVsWTNRZEFRbkI0V3c3NXNT?=
 =?utf-8?B?VitxU0ZlMytPbjdQUTNEUHpuWUxVN2R0WmU3b1pOYzFmdFMwVWNqZUthNmRu?=
 =?utf-8?B?eS94aTlLMWQzSlA1SCtaNXRlK1EyNHpqVld4emNNNUtabXkwcU5ZeHN2UUdM?=
 =?utf-8?B?NXBWOGxQWFcwMExPOXVXSGxxK2k2QncwQnpRZWJMOXI4Wkh4UE9jUlpJTzd2?=
 =?utf-8?B?eWtkWUYrOWplTkJlenBSNWZQOXhZOWh2RTRJOGtuelMxR3IrMEpZQ0h1Wmw0?=
 =?utf-8?B?L3lWNlNESzdSR1dwMkIyM2N4aDdtMWt1ZWg4eVVtSUxXWmdldUlIbm82c0E1?=
 =?utf-8?B?dkhwSzZMR04wZ3lZeGtNTXZudVg4THlEZmUvbWpmV2J3NytEK0hqZDhKS3N0?=
 =?utf-8?B?SnpXazZ3V2JFV2VYMzAvY3JvTzJsT0wrNTdJeWF1eWZaMGlXeklkeTEzbnpj?=
 =?utf-8?B?YzRkZ01uR1NQN1Z2Vnp5S3Bkam9HZmwxRXBhK0hsUFRzK2phcFMrS2ZwUVBh?=
 =?utf-8?B?cjVGVmpyMU81dnBQTGIvanZERTFaVjBWUHdlTUtzUFZja01rNTB4MWRGOEFD?=
 =?utf-8?Q?xlD53A6MuJopi3bP5cekgnAUb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83143840-6e5f-4722-acb7-08db4cca1aa9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4804.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 18:05:11.8998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+lhONVIEBH2uWHINV7ovOYNIHzvaUc0K0f82xnrBCV8BnSzHIWlyWZDnfrYTMAE782G6DA/na7HT1e1qGlFSGxbyq6MG3DJDvO7RwbrgJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/4/2023 10:38 AM, team lnx wrote:
> Hello,
> 
> I see a ping not working in below topology with xdp redirect
> 
> 
> IFACE1 <--------->   IFACE2      IFACE3    <------------------> IFACE4
> 
> IFACE2 and IFACE3 are on same host machine
> 
> IFACE1 and IFACE2 are  on static ip
> IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server
> 
> steps
> 1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
> 2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
> 3. Run xdp redirect on IFACE2 and IFACE3
> 4. start ping from IFACE1 to IFACE4

Does IFACE1 have a route to 192.168.2.x and is the next hop resolved? 
You can use `tcpdump` on IFACE1 and IFACE4 to see what packets are sent 
and received.
