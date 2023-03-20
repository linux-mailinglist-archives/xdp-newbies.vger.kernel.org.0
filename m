Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CD26C0E34
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Mar 2023 11:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjCTKG3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Mar 2023 06:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjCTKGN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Mar 2023 06:06:13 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47C62448B
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679306726; x=1710842726;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cpWC/V10U5wp/GSPRH8+ZRjsSFB90guVdIg/W1Vkelc=;
  b=a6+b8Nxyw/+BTxyKjOPaF7v9rFOgirTsvuZcE4cy2jhv/KAt+uKD+Puy
   9EgfIeWNGWS2mXPilfkRhL+4Blnz7NMpD8JUpgFgsMVMNkEiCgNnol+li
   4f1MNzWBaap9l9QF4qIVT8CIXzg5auGHYPv8rIaReMDL/FEpTeHB00B8s
   AszmXRKuznLkTVuFEczjN49xdvBKW4FlJvgVu+tr+wPAEOnCRpNIynzbw
   7R1VMmUxBM7gC34300I8jo0b3pwroC1l9TzuRcQkUHliDW5Y6GFQx98kW
   rGi9RP7ZYZ0wk20pP8n2j4m5VxLNvcIrXVKY7u08DVMXMT6EcNF3/8xam
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403490924"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403490924"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 03:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="683398338"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="683398338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 03:04:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 03:04:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 03:04:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 03:04:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 03:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WM52cM5+DAqQjoN2hvxL0UNDUqfHA7IhcJotZxm6+xRevWlZviV8UQ+zSP6b39w0Isu4Svh0uE1hsORljZMUZnSmRH8XO9wVaYevwCpjzZn7atH1Q+M42qdmrgORYGZRaq4Z5NjMmAWTSeUpvsIcaQacO5Xbpc1c1NULLbaKKMYoc/WW0hvd/2ZyWxH7+Apzup0qjHfYF8FpbZ8DKQiXpMQfSa4rmu/do87oWL3XFa3B7BsMK2+/q2pZibgK3nja+ebxDk1/7c0RBv5M8tQQoRU5ZyT5G/arXPJgxviSDAQmxhsza9XFC9wRETM1LmI9E/44okismNI9vESI0tOx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpWC/V10U5wp/GSPRH8+ZRjsSFB90guVdIg/W1Vkelc=;
 b=YTgc+BRT66NzRwi2e7DB1xvUsKHgrF6Yqe7qHrYX0RM/AOlK2ti4JrMyr5QFxuwnYVmm5rpqKAkLibYJi4nx/EFevEhXj2hgyc8Q5L9tyoiRYxmLYqDuZPo819NYCqvMUfooTLaJeVGDUX0fB3XGjFNgh5u+VR23nNXzq3byXGkq9v1chHgyqbEJrHv48/bAF3pdhJm+3ld/xQp3GljnhTqk4+rOH6YLRL55rLjtlTFPP6K6Bl4qn4yTAMfLEW476vIy4qrhOkxj6im2CBhUIjCzKEHEay2cczWj6oHPdSNitKQwRuWLsiku7bEubXhlFYdYvXts9yamZNfrcYjLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:04:23 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::aa7d:908d:ed3a:5598]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::aa7d:908d:ed3a:5598%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:04:23 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     =?utf-8?B?TnVubyBHb27Dp2FsdmVz?= <nunog@fr24.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: RE: [PATCH] xsk: allow remap of fill and/or completion rings
Thread-Topic: [PATCH] xsk: allow remap of fill and/or completion rings
Thread-Index: AQHZWq9cHjgEcuMLkke5/one2oQF+K8Db2ig
Date:   Mon, 20 Mar 2023 10:04:22 +0000
Message-ID: <MW3PR11MB46023B056366E7B79E105549F7809@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <20230319220811.165506-1-nunog@fr24.com>
In-Reply-To: <20230319220811.165506-1-nunog@fr24.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4602:EE_|PH7PR11MB6833:EE_
x-ms-office365-filtering-correlation-id: 2a674276-905e-4c96-7ae4-08db292a7ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yfcU3Gew7cXGL2eC7H9EeTDx+Ff9ZCqgdJPHXUFvibgXUy4icoqoyPl8jVzQlfnRBhWm4qreaxTatlStHvgXPBKmcRvkpW46d9LyIUO030DoU/bFTTP6sxhoQqRpFBxNRDkKoWcpYDJWdMXdU3NBnNv5BSxMqLVbKEdLf6vxlwsv1rdxX5xjS1WCv9I6kwqD+oDPnoJoLjpntHv8lK+jmzrihKa/BEFDk24GE29VXx0kODV1AFc7SbPIz1RzM0/33b9pONF0FZo7QvwCou5V5CWXvc5je4MiWFxS/Q7U9KAmHXVcO7Qrl9H6s7a5uJuZAtP6/PvPBEnLCy6/AlIP7de50zEhpL5hdO6S1gb1hcxhm7R0wi9WaQR47fr85MuINMZsSslBbdI9yvXC7czrMHBEqF44SslV3devaaR9z29wyLnRNLqSRbCvJeUq42IYN6D4Mz3q4ZGp/eoCd2RoF1QY4RfGPH/2doz62vVl5e8T585OiVSuKvbO4RMYUsGBZhuwTlo2mLfzkb0MeIYiS3fFIOiKwS3qK9Uscg6Df00nQnlbuof8CoynvTX2vxavJgkhyGVoo8kDtAr1XVSvAPfXdy5t9qkhO0290Vp+7Gp0A9x5vjxDffr2lkU4Kx2lmjrLj9wo0XFMQPslgxipIJ8VKMaR69Gl6klxr1gMyw0pPgYWPu6J7hrLd8p91BLnuzT8rRuevXUzb3pfvrLxhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(66556008)(53546011)(26005)(110136005)(6506007)(9686003)(8676002)(64756008)(83380400001)(316002)(71200400001)(66476007)(478600001)(66946007)(66446008)(186003)(52536014)(8936002)(5660300002)(82960400001)(122000001)(2906002)(41300700001)(76116006)(38070700005)(38100700002)(86362001)(7696005)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2Q1Z3JLc0dENHNBaWRNV1ZJbmljRWhLMmMwd3RwSE02b1NNQjNMT29HeWZG?=
 =?utf-8?B?ZEgwVVZFSENFTXFsNFdVTkoxeGV3ZnY2eGsxaUY5MHpkQVQyZGpqZGdmRzNx?=
 =?utf-8?B?ZmdKK1I0YUlYRlFvZjQ5b2hwNGMzeU1NUmxzdVdNQVRneTZsTWJVZXpkKzh2?=
 =?utf-8?B?WjJ0L29EVDJlV3FIQ2h6Tnd0dzJKWjVrcktDdm1wUmxuc1k1THM0OFJ2UVdW?=
 =?utf-8?B?NXp5TnRUUWZNak44cGdMNnJnRU9ydUZYbXM5ZG5EWVhSN0NLV1BWaFVGRUNz?=
 =?utf-8?B?NkFBWmNlcFNxaVZuMjZMMUhyTmlVSGxlQkRBSG5OUGhTZW5xWlJVeXVwd2pK?=
 =?utf-8?B?UWttRTJmOUd6K2RCRkU4b3lQZ0dHUXBBTnNTRkdOQW5MOGRWK0liQTlUb0ds?=
 =?utf-8?B?emNIRitGRVZtdk80MkJQWTJVcllRMHlsYzEreTR4bWpDY0FIVUZ1TERWMXo3?=
 =?utf-8?B?ZWZSeHJ6L3BuOEI5Nkx4SjYyZFZVb1BBK0pLNlFkaTVCdlNTaEMwOVY2aTgz?=
 =?utf-8?B?VHk5cXBKeEdDek1zZVdsejNpSW9aZGhDcnlCR3FTMkIvUGRNU0RCM2ZITC9n?=
 =?utf-8?B?NDEwSmVvblRzN0VtM0lVbDUwb0p1Zkx6dFZSYWY1YnVmZ3NENUZVQXNCc2J6?=
 =?utf-8?B?eWxxUmxyWE9JSThVOS95OXg4MmtJSzBQTzgrcUNva3EwV2NYWnBHSTk0MjBh?=
 =?utf-8?B?cisxa1hOajl0WTZlaXo2RE0vVVRQMEx3VTRWVEloRUhLSDVmQ1ErMUJhUHlK?=
 =?utf-8?B?RzJCVTRjdllmUG5FVGljeU5TV20relYxbGQyaXpVQUNVdWI2MVp2YVM2WmxE?=
 =?utf-8?B?MHhuWVRVVDZkNGtTUXY5MXNjQ0RCUlZkazM0SVdUOVhKeUczQVJQd2g0azFi?=
 =?utf-8?B?cFI1MHZsQ2RYR1k2MWtSS25rdElEKzJkNTZxUWt3ZGsyL3FVQjBwdk5vVHVo?=
 =?utf-8?B?eW9nOXJPa0dGRTliOTYvQk8rSGU5MGo4QUoxMWhmK2paREhNclhZZnIrRWJ2?=
 =?utf-8?B?SWRJS3BtTEpsUzM3RXdjd3E0SU9pM1V0R05nNjJobURFNXMwRFFaTHhVbXV4?=
 =?utf-8?B?YnlhZXdnei9maHV2WitYUUw1TTZTdG0wVUxvQlR1dzVneE1LcHRveGV4UFBU?=
 =?utf-8?B?U2E1UnI3YnBNWGJJZWt0WDhoZjE2VFk5OWNrV2pQaktITGNMUzBsczE5UjNa?=
 =?utf-8?B?SXBCTXpYRzViam1XRFlXeGRPbmdRY09IamFuWnEzS2NyUnFrK05uNC85aUZS?=
 =?utf-8?B?V3ViZDdiSStRUXVjYWFxVjE4STJFYnNrS1R6TmhwWmt4UXRDblg1amhpY0lp?=
 =?utf-8?B?T2I2b2hFS3U4ckJBZVBBNHFteWs3OS9GL0c4NGhOTlJEOVFpQWJGcDYvaHMx?=
 =?utf-8?B?b3I2RUpuUDVtcXlQYnhXN3BJRmNtSWx1UVkwTTQ2bFJudXl2WVlOb2M5M1RV?=
 =?utf-8?B?NWt6Sk1aWERSblZ1cndxU3U3b0VZSlJjbDZrSjdwWnpobVZCcVBHZS9iSlNE?=
 =?utf-8?B?UUdtNnZXdlJwdmtkRHludUVrakZNUXRkWGFuQXkwOGpOTGRrMjZZNUZGeHBM?=
 =?utf-8?B?K29wcGlLWnJ6QTdzeHRBUHdpY1ptL3U2UmdXU2dDYzFxVU52N3NVQSttVVpy?=
 =?utf-8?B?dytNSlp0bnVURVhkTFNzVTlNMTBTWHNGMmU3QkJHSDk0VXRRWkYyWjAyVFZk?=
 =?utf-8?B?b0VKWnJaUTB4bVFtTFpTL2NRQW51T1VOWlJrRlo3VUlVdVBZWk9Kc0VBUU93?=
 =?utf-8?B?OUwvc2VxdmpRemtHV1E4RGFtR0NkaDBFM3V1eEhZV29uTGlUVXlsV0RYeUpp?=
 =?utf-8?B?cnRjRkVSbzBoOGNURWZZTWF4NDBqalJlMnpFS0VDOG1NazVWVVdUTHI3QnhY?=
 =?utf-8?B?T3BvRDNwYUpkUHpEVTZhRG1MNlkzbXI2bTA5cUI1blBXNk5SVkk5NkxuVk52?=
 =?utf-8?B?UnM0SEtHZVU3emNadU1jUk9pUHphWVhVaHIyQ25URDJ1Q0pxTFA0cnkxTVZJ?=
 =?utf-8?B?TmdMdHBKam03WjI2VnRjeSthd3owLzlqaUdneS9uMENPZDlhQlhBWGVDV2dw?=
 =?utf-8?B?NzhmdlRzU2lzaFA4Tkhua2dmV3NNWmxEeVV5VTRCTjhzcDVIOURndjJ5a0Zy?=
 =?utf-8?B?bEpycjJxb1ExWjhWWHFEakVkQldsUGJxZXdpajlMTFFnck5idFZhcGNzTU1v?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a674276-905e-4c96-7ae4-08db292a7ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 10:04:22.9854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIrzq8yo0NFaQg9lAq5YA1X0uIDlky3fx9EgBkegr8kUzRKbtWWPaF/B6owJNfhTvkKPPumejxs7DjPs7HxP94X9i5mx+yMx8Trl/nOaKiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTnVubyBHb27Dp2FsdmVz
IDxudW5vZ0BmcjI0LmNvbT4NCj4gU2VudDogU3VuZGF5LCBNYXJjaCAxOSwgMjAyMyAxMTowOCBQ
TQ0KPiBUbzogeGRwLW5ld2JpZXNAdmdlci5rZXJuZWwub3JnOyBLYXJsc3NvbiwgTWFnbnVzIDxt
YWdudXMua2FybHNzb25AaW50ZWwuY29tPg0KPiBDYzogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0Bm
cjI0LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB4c2s6IGFsbG93IHJlbWFwIG9mIGZpbGwgYW5k
L29yIGNvbXBsZXRpb24gcmluZ3MNCg0KUGxlYXNlIGFkZCB0aGUgYnBmIG1haWxpbmcgbGlzdCB0
b28gaW4gdGhlIHRvLWxpbmUgYW5kIHJlc3VibWl0LiBJIGRvIG5vdCB0aGluayB0aGlzIHdpbGwg
YmUgcGlja2VkIHVwIGZyb20geGRwLW5ld2JpZXMgbGlzdCBhbG9uZS4gQW5kIHB1dCB0aGUgQUZf
WERQIG1haW50YWluZXJzIGluIHRoZSB0by1saW5lIHNvIHRoYXQgd2UgZ2V0IHRoaXMgaW4gb3Vy
IG1haWxib3hlcy4gWW91IGNhbiBmaW5kIHVzIGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlLiBQbGVh
c2UgYWRkIEFsZXhlaSBTdGFyb3ZvaXRvdiBhbmQgRGFuaWVsIEJvcmttYW5uIHRvbyBhcyB0aGV5
IGFyZSB0aGUgYnBmIGxpc3QgbWFpbnRhaW5lcnMuDQoNCkFuZCB0aGUgZGVzdGluYXRpb24gb2Yg
dGhlIHBhdGNoIHNob3VsZCBiZSBicGYtbmV4dCwgc28gW1BBVENIIGJwZi1uZXh0XSBpbiB0aGUg
c3ViamVjdCBwbGVhc2UuIA0KDQpUaGFua3M6IE1hZ251cw0KDQo+IFRoZSByZW1hcCBvZiBmaWxs
IGFuZCBjb21wbGV0aW9uIHJpbmdzIHdhcyBmcm93bmVkIHVwb24gYXMgdGhleQ0KPiBjb250cm9s
IHRoZSB1c2FnZSBvZiBVTUVNIHdoaWNoIGRvZXMgbm90IHN1cHBvcnQgY29uY3VycmVudCB1c2Uu
DQo+IEF0IHRoZSBzYW1lIHRpbWUgdGhpcyB3b3VsZCBkaXNhbGxvdyB0aGUgcmVtYXAgb2YgdGhp
cyByaW5ncw0KPiBpbnRvIGFub3RoZXIgcHJvY2Vzcy4NCj4gDQo+IEEgcG9zc2libGUgdXNlIGNh
c2UgaXMgdGhhdCB0aGUgdXNlciB3YW50cyB0byB0cmFuc2ZlciB0aGUgc29ja2V0Lw0KPiBVTUVN
IG93bmVyd2hpcCB0byBhbm90aGVyIHByb2Nlc3MgKHZpYSBTWVNfcGlkZmRfZ2V0ZmQpIGFuZCBz
bw0KPiB3b3VsZCBuZWVkIHRvIGFsc28gcmVtYXAgdGhpcyByaW5ncy4NCj4gDQo+IFRoaXMgd2ls
bCBoYXZlIG5vIGltcGFjdCBvbiBjdXJyZW50IHVzYWdlcyBhbmQganVzdCByZWxheGVzIHRoZQ0K
PiByZW1hcCBsaW1pdGF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVz
IDxudW5vZ0BmcjI0LmNvbT4NCj4gLS0tDQo+ICBuZXQveGRwL3hzay5jIHwgOSArKysrKystLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbmV0L3hkcC94c2suYyBiL25ldC94ZHAveHNrLmMNCj4gaW5kZXggMmFj
NThiMjgyYjVlYi4uMmFmNGZmNjRiMjJiZCAxMDA2NDQNCj4gLS0tIGEvbmV0L3hkcC94c2suYw0K
PiArKysgYi9uZXQveGRwL3hzay5jDQo+IEBAIC0xMzAwLDEwICsxMzAwLDExIEBAIHN0YXRpYyBp
bnQgeHNrX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBzb2NrZXQgKnNvY2ssDQo+ICB7
DQo+ICAJbG9mZl90IG9mZnNldCA9IChsb2ZmX3Qpdm1hLT52bV9wZ29mZiA8PCBQQUdFX1NISUZU
Ow0KPiAgCXVuc2lnbmVkIGxvbmcgc2l6ZSA9IHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydDsN
Cj4gKwlpbnQgc3RhdGUgPSBSRUFEX09OQ0UoeHMtPnN0YXRlKTsNCj4gIAlzdHJ1Y3QgeGRwX3Nv
Y2sgKnhzID0geGRwX3NrKHNvY2stPnNrKTsNCj4gIAlzdHJ1Y3QgeHNrX3F1ZXVlICpxID0gTlVM
TDsNCj4gDQo+IC0JaWYgKFJFQURfT05DRSh4cy0+c3RhdGUpICE9IFhTS19SRUFEWSkNCj4gKwlp
ZiAoIShzdGF0ZSA9PSBYU0tfUkVBRFkgfHwgc3RhdGUgPT0gWFNLX0JPVU5EKSkNCj4gIAkJcmV0
dXJuIC1FQlVTWTsNCj4gDQo+ICAJaWYgKG9mZnNldCA9PSBYRFBfUEdPRkZfUlhfUklORykgew0K
PiBAQCAtMTMxNCw5ICsxMzE1LDExIEBAIHN0YXRpYyBpbnQgeHNrX21tYXAoc3RydWN0IGZpbGUg
KmZpbGUsIHN0cnVjdCBzb2NrZXQgKnNvY2ssDQo+ICAJCS8qIE1hdGNoZXMgdGhlIHNtcF93bWIo
KSBpbiBYRFBfVU1FTV9SRUcgKi8NCj4gIAkJc21wX3JtYigpOw0KPiAgCQlpZiAob2Zmc2V0ID09
IFhEUF9VTUVNX1BHT0ZGX0ZJTExfUklORykNCj4gLQkJCXEgPSBSRUFEX09OQ0UoeHMtPmZxX3Rt
cCk7DQo+ICsJCQlxID0gUkVBRF9PTkNFKHN0YXRlID09IFhTS19SRUFEWSA/IHhzLT5mcV90bXAg
Og0KPiArCQkJCQkJCSAgIHhzLT5wb29sLT5mcSk7DQo+ICAJCWVsc2UgaWYgKG9mZnNldCA9PSBY
RFBfVU1FTV9QR09GRl9DT01QTEVUSU9OX1JJTkcpDQo+IC0JCQlxID0gUkVBRF9PTkNFKHhzLT5j
cV90bXApOw0KPiArCQkJcSA9IFJFQURfT05DRShzdGF0ZSA9PSBYU0tfUkVBRFkgPyB4cy0+Y3Ff
dG1wIDoNCj4gKwkJCQkJCQkgICB4cy0+cG9vbC0+Y3EpOw0KPiAgCX0NCj4gDQo+ICAJaWYgKCFx
KQ0KPiAtLQ0KPiAyLjQwLjANCg0K
