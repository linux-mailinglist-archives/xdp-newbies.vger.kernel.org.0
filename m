Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC00B443A13
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Nov 2021 00:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhKBX5A (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 19:57:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:45575 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229960AbhKBX46 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 19:56:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="211449508"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="211449508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 16:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="489313948"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2021 16:54:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 16:54:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 16:54:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 16:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mmhdq2K+iCFWcAUnzy1UGEcrvRi4aWYZVKVFnw1Alt0jQPxAy30QwqUxb3QHJdlQt0Ys+Q0dscf2okvZa8vQlU1F1EERCsheqSix+CzfmC9uQ84zRD3YQ1ZzXXZgbfnvT5aT7XUZfTQr+YX2/FJLOr+qY+VQPT3DG69GSN8il9aeA7aEhu4e3SJZlgdX5hJNTlOnGWOeW2dr0PgQIupsHjPU8WlnelrgqfZHUz0x0gjTpXfb0mYoM23Hktjeg+JYY+X+wDJKeZDeK8hUkEB4AezB1ReDm+pN+aQAeDnkjBj9WLjatyVTM5qf6l1OZYoQexxoZtPRJUQJqDcsg9KFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTBxOsgF8Z+kXP5/5w7zkhkmGj/kfVA5DvG7YZN8dyk=;
 b=XT/55iuHtjdiQtbHiDJJuIZTtF5Ow/gJM8HhrEiB2eQYHwcWXTIsa+APWe0vvF4LpywiPud75nR28nYAspJ6Zzl9MoAcVPQIwHtPVpqqMxvRI54pe755ZLm7vG7tXeZpXen883ypED5IWd2X0E1Wb8BkjacKxHsqQKi2gfdxqAjJ6HK48Ejbqy0kgCfeOYNb0+qwJ7AA23Y9Jzr3glukhkrSkYuZ9wmBqXg+iVjAQYrylu8n6knjUg/0NV9H/4XrzEDCU5EZAxHS6qQwW6Zr/7RTa4VHMLyAc5vzeUcx9YKy4TCN67FaJq6MMeQF9QX0RhKv0ez/F9GZEeg2oEvFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTBxOsgF8Z+kXP5/5w7zkhkmGj/kfVA5DvG7YZN8dyk=;
 b=eLgdPjaNRcHGLbFROI8Vw8i9qhGCcFxdvzW+QswuRu7qa7s2C9xPfO4Xj/etFCbzPu+nOsLIN679ob5ExhV+8O/bwXGB9I28YttUIBQBygkPsmKRaNdDJjFUewODhbKzbQj+/NHnQwWR6nR7V/1gec6HsPA/1CCkrTEionCYuAc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by MWHPR11MB1984.namprd11.prod.outlook.com (2603:10b6:300:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 23:53:37 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::3166:ce06:b90:f304%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 23:53:37 +0000
Message-ID: <7af6d2d6-502c-6733-30e6-63210dec8348@intel.com>
Date:   Tue, 2 Nov 2021 16:53:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: RPM for the kernel samples?
Content-Language: en-US
From:   Jesse Brandeburg <jesse.brandeburg@intel.com>
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
 <87lf265ilu.fsf@toke.dk> <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
 <87ilxa5e0j.fsf@toke.dk> <61408aa4-e21d-6073-1481-042379124517@intel.com>
In-Reply-To: <61408aa4-e21d-6073-1481-042379124517@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR2001CA0011.namprd20.prod.outlook.com
 (2603:10b6:301:15::21) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
Received: from [192.168.1.214] (50.39.107.76) by MWHPR2001CA0011.namprd20.prod.outlook.com (2603:10b6:301:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 23:53:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87419dc1-e1e4-44c2-784c-08d99e5bfd1b
X-MS-TrafficTypeDiagnostic: MWHPR11MB1984:
X-Microsoft-Antispam-PRVS: <MWHPR11MB1984B0FA9CDB4E8CF2FAE12B978B9@MWHPR11MB1984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSxjXgxrM8jv0WdRgZTUfE+Fv+E90eElnGQdYZwHzzOITloenpBFytpEpukId8XgzW+EpAsBWh2pshwzU569fJE2OCh/cHD9UsYn9EJJDcMRlUS8riEBCQge63eqONRe6OvlAy+UoutVBzcvJKb1z9L/oBso7zU2oTuLj5ZuSlIjk4KI8uJdQcFrG3ObmT5+FiUze1qnpHvx+CnVD742VJm9TK9gNemmtMJ6CIhhnXZZbu/hdn0fNpV1WrNr0NAbN4g+WKEj5FqjfmoAR1LVSfNpSUipPUYiQr1WNQ5+MR/8Zbl9npvrzZ5bwwaLKQ06fxaMdrtGWATrPA5QUWIfdLjGSoNxykxteI+mVC4YXjzH/m/61MOIiShVotN3MceXiiaegknuMIN5QkgCPi0XNp1H2mRpJAr5xudLN3fxZb4Ah5GQtmmmXswlbVQEor7DhqzpyF9QEI5HberIGyZXxwZ8346i1q0KpJzsNsfzBS2mcXEo+pD+blzEYSOGt/wlz+MgljNAoMFMfPtvlU0yHgqzcP9sNRDBnTayynmpLfswVO3wkDItDaIC5Bwfdx2pmAOASIjAqzPCIEMTe6jFs92JGG9dgOpcfC7oPPmy7YejEj/AtmciD+3GaIf38i6UEs8AZ8a92b2iQDRP8gtd1vgWROL/Pkv5g9tE0S2PXXB/imNM/fqIk4rGJ6oDJY5qyYcpqbTk5lBoomj9eFekX0ew37FVKbFmUF+V6n+sC5dHjVQ0ZuT89sOW/E4u8uiAhcCZupiqLkqeGX88KePMaR9RNdkbQusJYhMZ9Y4/c40C7p0w8d1q8I26TUr1Z4lndMRoAojY7T1HhkQ+5Agy7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4914.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(110136005)(558084003)(8936002)(2906002)(36756003)(66946007)(66476007)(66556008)(31686004)(86362001)(26005)(16576012)(316002)(82960400001)(186003)(38100700002)(6486002)(31696002)(2616005)(44832011)(956004)(5660300002)(966005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDVaOVhicURuS1IwZ0MzdkFTa2kzbUpzODcvU09WckpNTmtRWkpTbkt3RWoy?=
 =?utf-8?B?c3B2MTVmVjh4WEx1QmxZcTJpNUQ5Y3FsMnlrRGlVVmNUR292NzdWaXR2UmlG?=
 =?utf-8?B?WXMvc0JqTDlHSDB1WXlrM1NncUsxa2JjeTlnVEtUNU4zZ3FYcVZDTkFPMUky?=
 =?utf-8?B?Sy9KcG1KZUovOXFxSUIvNE5ncXo5dGk0ZnBxK1gwWFFKTXAwcFpqM01WSklR?=
 =?utf-8?B?a3hmTHdHVkgrekpLQ1lQTVF6U1huVkFjK2FmWGRHMFI2MVp5Y3NKZWkxaDN2?=
 =?utf-8?B?MmtIL1RpS2xGYmY2Tk5UTm1zak5xTEtUVzh2UjNjcHBscFJCZStwZStFc2ha?=
 =?utf-8?B?Z1BrcXZ5RCtUUDNUL1pST3lLWnByQm96VHA3VXZPbmc5c0U2MndBT3pQMCty?=
 =?utf-8?B?L0MzRjNCQktCOXY1Y3V2OVN4UUNOUlMrVStnOFhuMzB0NVdETHk5OVRJU3Zm?=
 =?utf-8?B?YlRjU0RYVWZ1aG92alJ1WFV1U0g5Sm9TeW01b3pVcEZ2Qk8ySFM4SVhUazlz?=
 =?utf-8?B?S1BYMTZLdFdJSXhYYy9jVHIwQ3RYNm40NVNrM09Nd3pEQmo1bWF4d2pEQ25I?=
 =?utf-8?B?WTJueTNXeTBybFIzc1hSb09KWEZmRHNRZ0xZS1RjL2IwQVBORUtaSWl3U1NZ?=
 =?utf-8?B?YkJjcWJ3cU1hbG5TMXlEN1JTSDEwY3pNejFIRUROL2M4aWJ5Nzl5K2Z5dGRt?=
 =?utf-8?B?MFJ1WnB2aDBDcjFIMDdvM1lFMU1tV1VubEhVVyt5MGQwS2grOXkxVHUxeTBk?=
 =?utf-8?B?TkE5amhKK01HN0Jwc0Q2ekx5aXcyT2J0TEQzdnQ3RzdqRGJDbUZ6c2plN05U?=
 =?utf-8?B?clhXUEdwZ0lmVTJtU1dTZEFoRXJSeDFzcmZIaEhVWjBIR0swaWR0d3dSTzlT?=
 =?utf-8?B?Y3VoSWZ6OXZ4bUs4Wk5SbUZBbjJQcmlxNmRmZGRCaWRrck5YZVNPRndzOEhz?=
 =?utf-8?B?U2tUK3JDTG8wN1Z1cXhiOVFZd0VycU42dU11TnhTaHU0MUpFenY1SE1WYWJy?=
 =?utf-8?B?Z1VuS0krd1pRSHNRbDR6M1FnV0o1b0hFRnh5Q3owUklqTW1CckpYV3Q1eFk5?=
 =?utf-8?B?RmVyQkFRcDdxSzNTTkJNV01jajFPUTJMdjdEWGNsSkgySzhQbGVrY0RNNGN3?=
 =?utf-8?B?a2tQMVJ5a1NJdjdhRzhQOVRqeCtpcGY1T1FDenY5RlFXaHB1emtaY2g0MEVO?=
 =?utf-8?B?RnRHTTR6S29TOFZEUVh2Y21pMzMrT04wVDVMVnRUVGpySXRIYlNyVHNYbElI?=
 =?utf-8?B?OE1Fai9SKzZoMFRFb0NLQnNVbk0xdDVRR0xBM1VHZ2o0a2tlUlVzcC9wRWt4?=
 =?utf-8?B?YzJyRXpTcS9CNGlhQkpuQm9PRzIxdmRGZ3hUdVFjWU1vcE54ZENCK2UyaHo0?=
 =?utf-8?B?ZytNVzVlRUpjZGNreThCdGUwbWF3Z0ZWNmhqYVY3NXlPTTRKWVNYb3kzSEFO?=
 =?utf-8?B?aEJrNnFGNmJHVlNaYTZsMjI5MGIwNzVBQVhpczZaSE9PVHhhVDMxMnlWOGYw?=
 =?utf-8?B?RWxuUG9MdUFvTU5LSDJBc0hYR3FGWm1pTmR6Q2ppTkk2Y1p1RURYWEJaNE9h?=
 =?utf-8?B?QmlMYlh5ZHVFTnJkZW9ydXRYNFdNMjlXblk3OXYzMVd1dURPK0pUMzV2RU1F?=
 =?utf-8?B?VEZXdVlyY2liektJTTdHNHpaQXJkNDU1QjFFcFI2NnV5eVhkY09OMVY2Y25x?=
 =?utf-8?B?aHhYakNLMWx4YUhDbFlVMXBlaDc3RDc3a0I3ZXgzeDQyVUxBYUoremtsaFNN?=
 =?utf-8?B?UVhHMllZcUhNdDcvQ0xyT1I0VUZXSkNDcjB3eWpPazRLU2dvcjR5aExVcGIz?=
 =?utf-8?B?VExyOEZvRFFCVWlkWTJORDUzZW5tRUtDT2x1M0tuREMwa2ZiZHptTDd3Vkds?=
 =?utf-8?B?RXdIVlpYcjlBZHJoa0d5ZGp5bm1ObnNidE41SjF3VFM4MWpqRURreXlCMDFy?=
 =?utf-8?B?ZXRkVnVqVXNndi9KZld3Um5pcjFJd1JPM3RNRi9JKzBCSnU3MUQwWndQak1k?=
 =?utf-8?B?UVJPRHlMeFozcDkvRmU1dHBZcWEyZ0IwWFVpbmY1RlBodldqcy9UemtraDMz?=
 =?utf-8?B?bDROUWJIS2Z5aWZ2Yk1ValArSVUySExMMTF1bDhvKzdTVnRTWmpvL3pIdUpo?=
 =?utf-8?B?YWoycWFtU1UrK0VCWVNxK3ZQa3NNL1RBRlE0ejBtTEUxa1RnSmdjNG1Sa0h4?=
 =?utf-8?B?YlhxN3paNkxQODBTaURkcVExYllQL04zZlRlZVRrMHNWWkFwai9oNk1FdnJR?=
 =?utf-8?Q?JFn6a8pJbhPpFJGafVfigQGMlWp3AjWgZ12f8CeQVA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87419dc1-e1e4-44c2-784c-08d99e5bfd1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 23:53:37.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2T5tv57c8z4d7ltqrSRFD2gTo2bE7HjvPUM1IfMVUJUvQBDTSAJeQm2Vn3wwFnsmeOH515WvfgS13w1ctPXBlphtyxjmLiJPrXgP76GeKlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1984
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



>>> I'll file a bugzilla.

Filed as https://bugzilla.redhat.com/show_bug.cgi?id=2019616

>>
>> Great!

I tried to add you but, toke@redhat.com is not a valid bugzilla email 
address?

