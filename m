Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582E74438B9
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 23:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhKBWtl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 18:49:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:46324 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229685AbhKBWtk (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 18:49:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231637376"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="231637376"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 15:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="599678743"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2021 15:47:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 15:47:04 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 15:47:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 15:47:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 15:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTM30aTBFLVakCBVLGjrjPgQZ4vIXwkpB593AaOn1xrPaYq6CrYPFtCunY4Yshb2JspCZoqM81+ypkQAnVemtk8p2PznAzVKV2yycWI2PhTOgp4QMs2OYChVcJjeQZbvpIC10FAbRKUnpPWTmgnH2wB3MeLX3lMlRyD6g/174Achhs3EWwFY3cE0XRGOY+6Ji3PtkRjamZxomIWJE0ErsTzaaPA4wuRMuR4hSBHQxCohdxUZQxfbeoKHeZBA11fqwsobd/ypWUV9ylPQ5swFXPrMZHsfPG9YnY/M6QwAi+/Gm0LGjh5HwlIaqK6CNj4p4PrwzntO6qps3EhzoTlbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOU1w0Br5ZgeQvWDheRDBnO6c4VLAJn+Wks1gDNyp0Q=;
 b=n9lVZq7jsbgwTabvQQcDS6vxAJ/W3Ze1hBi4qHKxh8U0yKiNOgRz/yKWXRb8TlgGLuKmnsTViCS0LY51+BeFf6Ew9VLWO+Ok+5REWJ+vDfBtZjztYoTcgCkIexqt5XAkCxoCmqJYh5P/03/XRW89WINCWqcJ4RQuLLMQPZAyxSNzA8BCcvWKmFfnLgTteIyqLJjlHmE9UjDAbz/NKmZKTv3g63Ih5BM2d8l7VQsvsvVU9dqcmFJSzZROPi++Vtp967dlm+/GMiCikqbH208dOlZnCbTfd//pkXX3mPlQn5if6e7AAcOPJuzBW3QKzNPmQ3KfgCcIIUMQET2rNPn1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOU1w0Br5ZgeQvWDheRDBnO6c4VLAJn+Wks1gDNyp0Q=;
 b=zgv3Nu9UPL4Ji5o4q1n1GAUjcoJHykPRBg/a0adP9xZP9eV17dTD+k5YiCL63/xi9tO44xXydE/NX5Bcbk6JFre6d6gj7p28ytCJ7i/NqdABOneabomkLwSUN+gsXI5WC0M0nZa1a/6FgwRSN9sOckYTGlc8UDx0a9LHZksuHUA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 22:47:02 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 22:47:02 +0000
Message-ID: <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
Date:   Tue, 2 Nov 2021 15:47:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: RPM for the kernel samples?
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
 <87lf265ilu.fsf@toke.dk>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <87lf265ilu.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:300:16::25) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
Received: from [192.168.1.214] (50.39.107.76) by MWHPR13CA0015.namprd13.prod.outlook.com (2603:10b6:300:16::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend Transport; Tue, 2 Nov 2021 22:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bbe373-ed94-42b3-2921-08d99e52afe7
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:
X-Microsoft-Antispam-PRVS: <CO1PR11MB486795F365E88020914529C6978B9@CO1PR11MB4867.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: On7U2AVsqzulAQ0iHRb11U0ZT1l+9yreSerXP0vzHAiIisDMpS0FB4wY1RxoK9ujXdhxMTYctcsf1pyFkSHde06kHvg7RFuHX9fgqcRCS7LGtLs7ip224XGi6XOhaFc17v9MwrgkPX+NgSRs3Byy5vTU7tkZ5L9FFntYEH/IT+j7iWgkMna0tjtCUlLjGmHTseSjMTFc42txFCcd7JAeAb2HRohqg/oOKIrajjsjjy18AUu2iXFTE5MFf2RIkaAo/5jSztLLWttzjDGL+QQn7NEEOxboPuZ0rvAYMy4k4Qyna9/0X5u//JbSlwStv/9j8g9Q/9M4nRwylt8FZQFXPF/z77jmp9mOUCIZ5tcto0hfAchnCfAmQ1nzAUw1aYzz+f1C0LxxI3yEYQSehzwptTpYJPxHFgXSdzIIoHvYehEzj50c9G1snF19XGbQkXAOe9ge9Hn2u8vapuxkU2P9z+1IHg8iOWZ0rBgn9vuEgdMQq3lDtKqCY1zJ2KNivrhuROZp00BvCs9dh5ELQb/hw+6/I32fMn8IUCLAh/U6TOOzRXTG8/GYp66CkBgvckIJaTOuA+0adXgdHMwJM5mjl63sKr1LtuO50CiZLv/H1lBASC7SWWcr3TpEvsejjS8Smb0gCeYk879GR0cCTMfvk6jDYzXivIM3ji2k4ozY3+pab4EnNIVHU1F8Yu2W2FESVvRndKd+cndpmZEoDP0XaHMY4xXZQb+DNQrkT7hODslH4jloHj0lLlZQt6uOLcDbYuNQV0iQNW5pVlTeusppPzGFoe1fpafJUzli688UWYxqZMTq4+Ma+U1qG429+rOZpAPBkYJqOBr2vV7b6037cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(26005)(5660300002)(53546011)(66476007)(2906002)(38100700002)(956004)(186003)(2616005)(66556008)(66946007)(8936002)(508600001)(8676002)(44832011)(31686004)(966005)(6486002)(16576012)(31696002)(316002)(110136005)(82960400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFpCd0s0SmhrSWNzUFlBeVU5akd1b2lNMmo4SVZVbmVDb1EzS0dFbzFmSDBT?=
 =?utf-8?B?UGRlWjdvM1dLNjI4SXZYblN1RkEwcU5VREVEN21aQWQwL05XNlhTQlJ5YnZ1?=
 =?utf-8?B?UnBpZ3pGS2ZHUk1YbkRGN1ZINE15c1RJb2UwRTlzRE5XQjZQYVJaMlBqeHIy?=
 =?utf-8?B?ZEc2ZnREU2ZJdDFNdWRjQnZTUitVdk5WODdNOUlUL0xpZ3htWXpDaStPbWI5?=
 =?utf-8?B?cmRJSWx5V0FzWGVtcGVxN20yY01MSXlwYnh4U21VRU1MdGhLb3NvcXUydkh1?=
 =?utf-8?B?ZWJtNTcxWHE2Ym5pNkxETGRoUjlRRHAyK0JWRlRFZkYza0EvVUwzdWIwdHJm?=
 =?utf-8?B?cXA1eGU4SmhQOVVOMGo3VGdNVzlyUmhJb2crb0dIQ0J2Vk1NN01SdjE5NVJz?=
 =?utf-8?B?TWVHbWdJdnBldFJlSWNWTC9hS0pPZThvaWtjdzlSMmhxbXBUR3NPK0EzZmE1?=
 =?utf-8?B?c3NpTitDYWRKNmpLNVNZUUdSTW80WFEyeTNYNnJ2dmRpQUhOY05RWlJjbDdB?=
 =?utf-8?B?UkF0cDVIeUU1S013cDlEZkdPVm8rMm10YW1idVRrNWtXZm9VZmtIUkFlSUxI?=
 =?utf-8?B?OVZHNzhhaklxaEtlMmRqUTdER2t5VWo0OHkySnZkcXhKaHRqK2xCaUpIenZE?=
 =?utf-8?B?U3JTWVQyMjZIMEFTRWdsZjZIUCtYdUR0NjBkSGRMM0swTStJZ1ZjY0FsTjNz?=
 =?utf-8?B?SWJBS2F3dXZzSUhoWlJzWU5FVm9Nb2UwVEZSVm1xdk15bUMzT0k0aEJCT0V3?=
 =?utf-8?B?OWtZQndVVzAxQ2YzOXNBOUhwc3NnK1huNmxmVlBiYklyYkdnTG1KLzdIc3Rw?=
 =?utf-8?B?TUVMZzJBMmkvMkg0S0FqcEVmSWU5WnhFYlY2c0RFQVdUenFiZThOMld4Vjl4?=
 =?utf-8?B?MTF4NHpRSUpCQzYzaXh3aHlCaXl4dFJJdWFWcHJqeWpQOUZUZGRFQWlZd2lB?=
 =?utf-8?B?NXcyUEVTZUVzZnh6aEhQV3ZmVzVoRjJCOGVhbUIwNUFOUjFtcmNXa25SVmNO?=
 =?utf-8?B?M3Y2N2c5QzlHNEdodlV4L3UzbzlsYmViL0x1Nm1YRFNpYlE1dWg5UEcrWGZC?=
 =?utf-8?B?UnBkZXQ4a0dPSGFTSmdaQXBwWDRqN0lWbnpqMEVEcmVCZU9HTDZuZ1hZRU84?=
 =?utf-8?B?dWhET0J2ajZpWXlZQ0VsQzJNVFByNmJ6a1NRUzR4bWN5MGJVQTNYZHNyZElS?=
 =?utf-8?B?Rnd0RTQxTjI4d2R0enBldGNZUFIweGdheUlQQlFTcmNkZUxtQmFoYWFMYTZs?=
 =?utf-8?B?emwxYkVLR0pZN2Z0b3hZRmNWc0lyK0tyb1lCQWJPL2J4dDc1RWZXQ2puRHZB?=
 =?utf-8?B?WnJ0ZUJudW1mUm4vQndyd3EwMlVhckhGZ0dZN0pKSWE2UEZoeXZIMlBNTmhS?=
 =?utf-8?B?YkhINVg5WGd1R2F3TEZTNjM5MHhEcUN1Q2tCQ3NXYlZUYmkrbi96Um9VcjB6?=
 =?utf-8?B?S2pRYldnSi8wRmErWFRzMUxyY0puOHRBa1NITGFHRld4OUtNYXNndjVEZVZ5?=
 =?utf-8?B?RnpGVmg5ZzJFZXp3VkVWb0ZFMmlnRUxucnF5YlY2ZkxqTVVkcFJYRERVWENO?=
 =?utf-8?B?NTBmT1pyMEtFc3daUUtCUUs4NHMycyttWEMvbDFscTNOOWhNWWNCT2duWWZp?=
 =?utf-8?B?aEpWVTJEd3FocmdaWXMyTGIzRjV3dmd0bVh1WmltSnVub25hK09SUlB6SEg1?=
 =?utf-8?B?bGZoZFNlYk1oKy9tS3E5N3FlWDdpZDdYbmVidXB0NjZWUlVqNTVGTld2aUJY?=
 =?utf-8?B?VzZxdlpnT1NPZTlhWWNmdzF2RFhldkxMZ3ZLUnFoYnpsTVFuUlcyeUFxNkVS?=
 =?utf-8?B?QWxnVjZVeER6alNVZlhEeGs0RzU4cWRXdUozaVNDSmE0cDNuS3FZNzRjbXBS?=
 =?utf-8?B?d29BQW53UjJVLzJFK2xjb0lKdjlQNEZ4MUZIWVNKTzRXbzVOUUxBTFpzRzFI?=
 =?utf-8?B?UmRMaGk0T0V1ektoUU9BRngwdEdLOEtPWC9EYW5XUTBjdHZCUU5ZUVhDYy9u?=
 =?utf-8?B?azdGUDV1M01rSHRkRVlwN2hhcCszV3BlMVNoNzd4TDEwNllPWExLMUwySmhk?=
 =?utf-8?B?d29yKzBoUmMxaFhsWkl4dVg4VVdWVXNvNnAzbkx0bEVDY3JMR3hXNmVoQkEr?=
 =?utf-8?B?Y1ZyUEZJT1JXc202eFU1ZCtHQ3ErWWduUEU3Q3V5WnVQME5jbGc5T1A3Q0Zj?=
 =?utf-8?B?eUlzV3I1bkxDQmJoM281VUNKcHAzQXYwcmVRUGFqRisrNVdsVDAwSzRZcW5T?=
 =?utf-8?Q?04W+L4hkTPGas26aeKBpShgyv6ziqv82xDKCxIPgmU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bbe373-ed94-42b3-2921-08d99e52afe7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 22:47:02.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8wTtvUkahKD70plncI4qWAxpj0q2EAE6qXI1Bqo4PoaMdUGhDrbJtA4JxsseZqxcbElF0j68bvcK3pC79GMVxwHdUOYRDgoglPYOo6OgaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4867
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/2/2021 2:54 PM, Toke Høiland-Jørgensen wrote:
> Jesse Brandeburg <jesse.brandeburg@intel.com> writes:
> 
>> Hi there, does anyone here know if the samples/bpf directory from the
>> kernel is built as a part of an RPM from fedora or RHEL/Centos?
> 
> It's certainly possible to build it from the existing kernel .spec file:
> 
> https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_1046
> 
> I know we have this available as an internal package for RHEL, but I
> don't think we ship it anywhere. And it seems like the flag is turned
> off for Fedora as well.
> 
> What do you need it for? Opening an issue asking for it to be built for
> Fedora might be a good start; feel free to Cc me on that as well :)

Hi Toke! thanks!

I'm tired of fighting tooth and nail to get the samples compiled on my 
own system whenever I need them. I'd much rather there just be an 
already made set of executables.

We use them for testing our driver's functionality for XDP, among other 
things.

I'll file a bugzilla.
