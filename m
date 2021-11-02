Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EF7443A03
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Nov 2021 00:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhKBXwn (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 19:52:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:5992 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhKBXwm (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 19:52:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231346461"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="231346461"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 16:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="489313118"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2021 16:50:07 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 16:50:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 16:50:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 16:50:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 16:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5FsbLgdiPyyJQeUDLcuZ1kDmCSRy1pRMJrTbkfiQv/pQi75Os1xsveQJoelNn29OKi1vVGJyuxo/8E0i4f/3Lis4GkPbiFXsrsh6p/DTMwriGFZZ3/Fpprx0JMJm/sW3zA3tyzNIS1MIiC/2HJmQF2JFq05uM5w8bDAtAmwsC2bftfXp6u9ZlmdPSeYF6Hi0XX+tO9B/MS2pAj6m+7IzqU3PZ8Br30vkuiUDusm9mpfnjW7O/cg5M/Qd/W86dKHiiSp489TnHalce0zrriwrqVLG8X9SCGqjyy9xQqfmIajXyPKbYly7OXWnjjsWrls6UF2CDY/z4nP7FZnMbp2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qheNUzbOvxwFIyS6oqcg7tNz+yR36u3S8HIEv9U6V7w=;
 b=gACyKnu//MsDTm44eezKBOBepRhXcWA2D7wlk+XBOQFFahxCPHgGBiKCg8Dx+tlMfY26FLR+x+gtZzIyKw6LhnSqFhgbP8azaO8PkeL34fji/NDbzT9I4rXt1YMqntEix9PbU9yE92BBy+PJYAsQns/mqmDneI1oQWOauCLS6Nj0aSXj/TlbJEbMUkmE/mMJ4m74Vl8YF8u//4fTWR2IYJDIPNmmHugHDBo52XfL0ai3Wjf9112L14wocxtocdN/3S1GPGQ9BzDdJA2sgT50VAuTnuqwcDUxvZO9Mhh7wre5NgD70kg7N5KKDhbhdqgOe4UrqxXaTPmga/UhtLP1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qheNUzbOvxwFIyS6oqcg7tNz+yR36u3S8HIEv9U6V7w=;
 b=jc1Nb9mxIIieNFUNIXPvy+PcTDMp1+sSrXFryhkny43i4RSLDcBC26V3P6iOIfrTitUOaK7P5PXGke3HKHndbRPXQx1LOI+Hv8yTCvNMu9FLinfz0CO1r/htk0tpo5NOOlXxIn7tTxjCJDSU6A6KJcz58P98m82geqddj5wnFqY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 23:50:04 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 23:50:04 +0000
Message-ID: <61408aa4-e21d-6073-1481-042379124517@intel.com>
Date:   Tue, 2 Nov 2021 16:50:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: RPM for the kernel samples?
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
 <87lf265ilu.fsf@toke.dk> <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
 <87ilxa5e0j.fsf@toke.dk>
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <87ilxa5e0j.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR15CA0026.namprd15.prod.outlook.com
 (2603:10b6:300:ad::12) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
Received: from [192.168.1.214] (50.39.107.76) by MWHPR15CA0026.namprd15.prod.outlook.com (2603:10b6:300:ad::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Tue, 2 Nov 2021 23:50:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 065821f2-3540-43d1-5b7c-08d99e5b7df2
X-MS-TrafficTypeDiagnostic: CO1PR11MB4947:
X-Microsoft-Antispam-PRVS: <CO1PR11MB4947EFFC9578687EFC2D72DD978B9@CO1PR11MB4947.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/zlwDXYmkMaYgq0nubaNI7ZUZdgoTGFSJr35hHJm1iJvDkLMod7FAMwfbt1TWLPbyUuzIgup0rCdsJ8nWiLtls3aJgUtuPgqPrCKRN/OTX/hsrZmAkMDungmPt6hDqU2Zc0rJ7Llx1DP7M+JLwvK0xq19bMoAGIiCnSbAKaU2gY5IwD2fAABPP41skgUrC8IaAyR1nHRUcLyWQLauw0ALpwaajzLnYszyNJB+RMOnrZl8UMaabRQaiFXGT5i27Uq9VtpIYK2JkrzUbjb9TvZ4u3h1eDkJtv+0M/NgYmqrtLffcc1KocicRg8WYGDzSDxfh2R6l3JJZfKuOubewmqr2qMUu0wCVWZdcUjdxbkterAzpw9yBI1NluyADkrRgcttwCkwDyqeES5c8xAN7lLMJies2xnV7durVA0lJHtNLPI5M6rc6q6gnhEy1j+UPd77kWc5wXth9gJkmU60k3BkpEgdtiqxQ0LHTwwRTXHImjZI+TOVywdG9y9RxsdFwTqj220v1sJpuRM5F/r6TCn17LB1RVBSAd+zRMWirMeslMcfLpKTHtpBcQxqcXQU5OepgtnSErpGhzrZTY/Z9La30bC7ON+Y/ERbIpOkq4sn10hJQNWoW9RSHXDLU3eD9aUGtKdkBXkWQPCbHn1UR2y08PDvqOQ6DOwJQI89xtQHKi2kQnVl11mE1+Y5/r1GaPJtc2Mzo9JP4v0FBjggm1QPCDj2XtbVapCgQUqwpapRthL1zxudFzh0fzXCjIxVp/tt8svbGyRDhoiioOXNPOuu5oEr9u0IUeOTSPvXcLgXAEEMz8AJAQtasDjHrLXgkRF5EWYwgcKBmmYvsaPoaNJhEHdteVRHPjAKqc+xT9FZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(86362001)(38100700002)(53546011)(26005)(31696002)(83380400001)(508600001)(2616005)(5660300002)(316002)(82960400001)(8936002)(956004)(44832011)(16576012)(110136005)(966005)(66946007)(186003)(8676002)(66556008)(66476007)(2906002)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlaMi84MGkrLzNOY0hGRCtGcFMwLytqRm5OTmxiTFRCcEhyUlUwdVhIUEUv?=
 =?utf-8?B?OGRrOVc0bUJwY2IzdS9na3Bsd0k3c1p0cWRPcjhsN1Y3WTlndFpJMFZ5RkYw?=
 =?utf-8?B?S1JUQUR0cC9qRHkwQVR6ZjBRRjJDSEsyYytOd2h4OFRmZ3h0SS9ZQmtET3dJ?=
 =?utf-8?B?UXlPbVhyY1plUm5la0wzemJ5YnBONUloQVdNNGFLbDBsbGJlTDN6ME0rbHhW?=
 =?utf-8?B?U1dpQlZsYVdzejg2TzRXcTQ1blhZSGs2VkRLTGJvMWVtNllrSHdlRTF5MGZj?=
 =?utf-8?B?SFBneUM3N2lHOUp1dlNPMitVcnJTVVNVUmtMa3Frd1pLM3EvdWxIVGtBS29Z?=
 =?utf-8?B?NmMzeDByMjhoZDBOeURkcFhyR3o3cFg3TXNLTWs5bC9aOGFLdnZ1d2NLUW50?=
 =?utf-8?B?Zno5WW8ySjBmZy9sK2h0aEY2aHpzeW0vUXpUZ2d3elBkak80NVh0R0dpcTVa?=
 =?utf-8?B?VEpwMmo0bmhrNFlFeUVwSTFLTU5Xdzkrb1ZDRDZBVnN1SUduaW5FNmhtaDlX?=
 =?utf-8?B?RFBLcXdMNFloTFViNXVSeHh3QU51N1ZFRi9zZ2pNbFRBMFI4c0V0d09jQkll?=
 =?utf-8?B?WnZNR2JKOFB1TGY3cXovR05YTjZkSm9nUXM1cVJJNlBOMVI0V0M5NVNRbVd2?=
 =?utf-8?B?OXZRZU45U1RhYjBFR05LbThQR2ZyOEdOTlhLdXYzSU1iRzZNeGRndGQ2Q0lt?=
 =?utf-8?B?R2hiQ0MvMjZKZUxDWlBXd0FqL3VlanI2UWdudmcwRGRBek81bGtIcXlZdEJC?=
 =?utf-8?B?RERBdEJjbG1uQVZobktqZGlSQUlYWG85ZmV1S05UVGRURmF1YkZYQXJvRUdh?=
 =?utf-8?B?dHVVWXZ1ck9mK2I3YXZJWW5BT0dPRHBBMzJTRTNtQXVxMWJkMzZKVXcybFdP?=
 =?utf-8?B?YlhDdXFLV3JZZUZkQ1FkRVBaaTMvYmtBem9KQXhVMkpPTE1wdVk0amhHVnhR?=
 =?utf-8?B?UENQRlQwaVZGQVdFRkdPNUNrN3dqdzd2NExzRm9xRzQwYzA4Z1BGT0VTbWor?=
 =?utf-8?B?eERiQ1dONWExQU1rdUdobDg4WlRXbTFyWlNGUm9ERkNJUmc3ZHRmVS9LdHRX?=
 =?utf-8?B?SSszd2hXbkJGUGZLbXg1N01WVGgydnhrVVV5SGQrc3RKNTZDTVpnWHBxZXk2?=
 =?utf-8?B?cXNSTkxJSGdVM1laeWNzTldtam05TlpFUkVFb3FubDNteTRKV0prZVFObDk3?=
 =?utf-8?B?TVhBTU12dlVNdXM2RUQwci9mVjRLcldWcW8rSkF4Z0pjU0JSSjhoRFFidTdn?=
 =?utf-8?B?MnE4QjVOQnpyQmhUOFVWUTlleGpvZU9Qb2NJU0Q3aFZ0NHVRenhNNmN6T2d4?=
 =?utf-8?B?Wjk0M1hUMDNSb0JCbk9seEx2Z015QVFEN3dBNUJzK1VaQjJDQWtaaUgrVHRy?=
 =?utf-8?B?VmRTeEVyd1NTdmpUSmhPTFo5QkRxRFhNM2htWlRqTWhqYW9NRkJhRllodUNy?=
 =?utf-8?B?RXljTzhuamFvM2VoNitacjVtb28zS29EaUc4MDlhazFqNWJQbUR1VUtvV0la?=
 =?utf-8?B?ZTUxT3h3MklLYnlnaFFMNXF3SEdCaGVGOVpxWFExd1V0cmJuVjF2REpMakdV?=
 =?utf-8?B?VTlWcFgyclZrNUZtK3BuUGpZcmRyUFNJVUI1SFNSY0grRllzZ2diWDFldW9E?=
 =?utf-8?B?Zmg0RkNEdkhZS1g0VHVsT1ErNm0vV1RCZzVvSmZZYSttaHk3WDROOWxiSGRF?=
 =?utf-8?B?eUtldmNWNHZpeVZaaGgydStkWko3eTN5eHYxczA4QUJwVVFUQlJndnVyU3NO?=
 =?utf-8?B?RGsrSUJlU2FmQTRpWHhEb05lRlFUZ1JsbEZpOU1oVEtQK09NOGpYMzBRM1pm?=
 =?utf-8?B?VVpTOFdoVzRHTjN6NDVhSWlPc1M4Z0tDTWRSVkttakFZTzRxcEphYTE0RUc0?=
 =?utf-8?B?a0d1YThvOS9lYnd4bHpkdVErQitSaU4rY0ZaSUhwOEVjK2lwUWcwK2pKRk1x?=
 =?utf-8?B?aXBWOU1YMytGKzFKeStqWXZRYlQ0ZTlGOEk4dVlMaXdiM0JGeVk0U0Vvd0NU?=
 =?utf-8?B?d3N0RU5wQ29laDRIekt0bWNObDhzUnUvNC9JUFFQWGI5aVI0c1UwNzdVSzZY?=
 =?utf-8?B?WlBYY2JFMDFDZTdacyt3b3ZiQWZ0NGlLNnI1T1Y4TEJnM1pXcnF5RUFtY29S?=
 =?utf-8?B?UU4wcHlPRVc4dXpCWG80VXB6VzhoZ2dKL3d6YlJ0ejh4TEE5WkErTUVXNG1G?=
 =?utf-8?B?dllWQkhTZ2JrZTFLNWtQQ2xOTTc2dUR5WTFXbEdWamYvN3hjZVQwZ0hDY2hL?=
 =?utf-8?Q?HzvqNo8ccdAKV2escUqbaXLK+U1/YUFhzOiMY9Au+I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 065821f2-3540-43d1-5b7c-08d99e5b7df2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 23:50:04.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8ktmaGVYuRhXW1mPBfLilt3NaMTNMb5XU2dusjTFBXrGVxdM8yWXUCG2PfT/+/oJt2FGw/LoHtbYSWysgjN7xLE+T8lwSRR/mudbhlsDe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/2/2021 4:33 PM, Toke Høiland-Jørgensen wrote:
> Jesse Brandeburg <jesse.brandeburg@intel.com> writes:
> 
>> On 11/2/2021 2:54 PM, Toke Høiland-Jørgensen wrote:
>>> Jesse Brandeburg <jesse.brandeburg@intel.com> writes:
>>>
>>>> Hi there, does anyone here know if the samples/bpf directory from the
>>>> kernel is built as a part of an RPM from fedora or RHEL/Centos?
>>>
>>> It's certainly possible to build it from the existing kernel .spec file:
>>>
>>> https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_1046
>>>
>>> I know we have this available as an internal package for RHEL, but I
>>> don't think we ship it anywhere. And it seems like the flag is turned
>>> off for Fedora as well.
>>>
>>> What do you need it for? Opening an issue asking for it to be built for
>>> Fedora might be a good start; feel free to Cc me on that as well :)
>>
>> Hi Toke! thanks!
>>
>> I'm tired of fighting tooth and nail to get the samples compiled on my
>> own system whenever I need them. I'd much rather there just be an
>> already made set of executables.
> 
> Right, makes sense. FYI we were discussing moving (some of?) the XDP
> samples to xdp-tools[0].

Not a bad idea, as long as compilation and use gets easier.

> 
>> We use them for testing our driver's functionality for XDP, among
>> other things.
> 
> I don't suppose you have anyone interested in working on an actual XDP
> test suite of some kind, would you? Like a set of "compliance tests"
> that lives in-tree and that any driver author can run to test their
> driver's XDP implementation?

Good idea! I'll ask around ;-)

> 
>> I'll file a bugzilla.
> 
> Great!
> 
> -Toke
> 
> [0] https://lore.kernel.org/r/CAJ8uoz1GP4M71E-PNScndfeTbcCG2OUg+wcoO4ZaJF5UTBiXCQ@mail.gmail.com
> 

