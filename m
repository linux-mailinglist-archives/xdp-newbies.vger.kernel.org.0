Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA3355CEBC
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Jun 2022 15:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbiF0JMJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jun 2022 05:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbiF0JMI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jun 2022 05:12:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F0A2675
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Jun 2022 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656321127; x=1687857127;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OIegBENjc1zEuFxoX0Db6ditkUKDaICsNmaBAihbsH4=;
  b=P7sBG8Sl00j3XbrlIDxpxMdvPb24cd3H2fs/ZDHNf5d0W8yC7xdMdiC/
   VkJX47mcE9BXBAtCGxl2PvrffY7EMIxjKqWA2ggUU8JyzYHXx+kMRGTbM
   hUsIwqTNXfzLq7cbF8f7T062myxrVvj9OBhy80yOFllR1eKAy8IlfrsGI
   jDSA9rL6rzAzcbsnGJAF/8K/TeJmJefhrt7x83a2FZZ9hSqKdaU1Ln7Zs
   FJH6At6w9m/HS69NKSSyll78xrFujOihr0KYh3B3qMCvUalKmj8mbXB3u
   uaLbIdloI6yCkFUeI1Lu3uUdQaM8qb4nzmXq+DjZ6bYXbKGMgoYUKdZrg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282495686"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="282495686"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 02:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="564579453"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2022 02:12:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 02:12:06 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 02:12:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 02:12:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 02:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQYoLcEOTL5YXPKd/jaTVFeoLbUN/ttpy62zSdH2xBMEDnGEKchq5TYvaTXlTaGdAnAz+yGuNaOKGLGujsIxqbCNPNW1pk2gDdc83nKv5DNdPZbn2DeLG2M5cXQbyZowP8xMxUdugXA84nk+G4AWq07wIBQSANGVW4D1vUEqcFEtCw5UaEikkQJY6RA3qQh5Xk71Kw7HVUDoLJ4X5BBokHs/FKaHJux2ufU3O+9x1ItRw0tADOnopy1dypLqcCvQE/xyNY561GyB1MoPo1Z/+Lsc0lCNjDaC9c/m4QFu0bh85oC9LuQ/E+rsDssncwW0EYWAU6pMulCo/zjsYBNpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIegBENjc1zEuFxoX0Db6ditkUKDaICsNmaBAihbsH4=;
 b=cbwPMUiKVC2EGtHBEMsFT9xLEyLR4TpAuDObbpGwtZeHc8SOu6oi8jUQ534E0f63o1ye6j/GhUTBRQykzT89F7e5Abfe3pAIxz/jEg6RaEOm4C5kUCd2zp97cLi+VLzgHgHjasdwda+LKZa7atuU8o8IfkMbwzh9CM+9wu/CtsFhq8ppJH535gWvmOqbvpd453H1FX0ANuolQ72qM36i4vgdpi4EbUP/80nWc5gsSpRGp/3wzX5g0hvrUgevkcKQO5oXaOhZXb/TGgp4fwYaAE2OTZUNjmLe3Es0q3kMyy+KuMQ7CRDCF5VAG0J0804pANWYaS5wee2NK/V8I90zXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR1101MB2360.namprd11.prod.outlook.com (2603:10b6:903:b9::9)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 09:12:04 +0000
Received: from CY4PR1101MB2360.namprd11.prod.outlook.com
 ([fe80::8d1:b04e:ea0b:dc8c]) by CY4PR1101MB2360.namprd11.prod.outlook.com
 ([fe80::8d1:b04e:ea0b:dc8c%6]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 09:12:04 +0000
From:   "Sarkar, Tirthendu" <tirthendu.sarkar@intel.com>
To:     Kal Cutter Conley <kal.conley@dectris.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
CC:     "eric@sage.org" <eric@sage.org>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: RE: XDP multi-buffer and AF_XDP
Thread-Topic: XDP multi-buffer and AF_XDP
Thread-Index: AQHYRb0fn/IWROZgkEG00H7CPEzuhKzbCRKAgAAAaQCAAApeAIAGHJeAgHqpgwCAB6WYAA==
Date:   Mon, 27 Jun 2022 09:12:03 +0000
Message-ID: <CY4PR1101MB2360C2F07AEC4EAB9043A64B90B99@CY4PR1101MB2360.namprd11.prod.outlook.com>
References: <CAHApi-mGEA61pL6Ff_qQK0rUkLXqAr=TppS4sWQPPZCC67z8tg@mail.gmail.com>
 <CAHApi-mY5V6k4c5YkD+38Vs1FWwWq3fvGgMhDoELjXjAUrdL1w@mail.gmail.com>
 <87wng9f2y3.fsf@toke.dk> <f7e966f9-17ac-7f06-4a2e-2f6eb29888a7@redhat.com>
 <MW3PR11MB46026CAA24BE95736BB3D58CF7E09@MW3PR11MB4602.namprd11.prod.outlook.com>
 <YkcDgmldUGWoFWmQ@sage-macbook-pro.local> <Ykwj+ycjc+F70iko@boxer>
 <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com>
In-Reply-To: <CAHApi-nTBXLUB+3jt27A2Qiewfam_YjfFXZs0mKu2qarPXAguQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f31a9ce3-cb40-4935-a102-08da581d1a02
x-ms-traffictypediagnostic: MN2PR11MB4695:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxi78WyUYPLnSL/msTBBYiEumHFYpzw1cvHQoNsoUWWz/FLYcyLPXSNg4r/vyRNoBOoc6D8H3FIEeNPiUJbMSGMHUI5ASXK31c27KIpi4/vpxlrYzPjqGwvsVDe6hlWHhfgYiL8FY3xQ/IGpPcfzUNLTihzn+KTaiEKVm4rrEObdSTmSSsgs5dEj4aqpDrOFml9KPD2xHP9llN9fIjMyJ7GC+JZlwSdXJPDYHZc2PemZe9N0I+aMDiaw6tJ5hZl20ujTnGMCbWUKy6afB5C13IUd7cC95oj2n5Gra8tYHgDb0X03ZUx335VAH0lPgKeyFFFSxCtT93WuUDHDnhsAwOJGn2MJzEzYjTmGwGkI8CQERfxDEib+tF8fc32cxHvwUgyA93yOS4axhmE7P3MX3xPI20wgmQVdXZrN5g6OKmdIXT/anKujhg5pootV6M3wWGfhB0jfTG4lWoV8+m28sParhAK4g2edgUcWNCc9qvAgY5CO603LLsk0i0JyNyfPnp4xGGjIhD/zcQbTrJsPVQ37O+Tw3ciUFok72j4y7eHxWH5UonjKDzrHsElAwDvbk7LxUozpeOuyQBMq98m8l3i22t2G9iV7P2VeRQ/swJvPH60tqbT/gO8n6c/0YrQv0rjI/VIpb3rG7hZPF22YOzF8gLpbQ4TuD0hkaJF6jPX740cYIX/r23UrmWnshifXiKwgp5ZNz8TZIZIukz35Vh9LPvzF93r8gOSA+wGcIfgHobjg+EmVT0DxOnMm/2UBTB7R0BNohF1n60QT4HS8LqkE3F571Nof4Wd8+gqtOCM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(396003)(136003)(39860400002)(41300700001)(71200400001)(6506007)(7696005)(66946007)(5660300002)(53546011)(38100700002)(26005)(9686003)(38070700005)(186003)(83380400001)(86362001)(122000001)(478600001)(33656002)(8676002)(66446008)(55016003)(66556008)(52536014)(316002)(64756008)(66476007)(76116006)(2906002)(4326008)(8936002)(54906003)(66574015)(6636002)(110136005)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWhDT2xKdDBvaENWN3hjTTFWUXVWMnU1RnJLSHdsM0lCcE50Nzl5OGM0Myt5?=
 =?utf-8?B?UjdXT3B4cTZUdGxvSDhsbDFkS3RRRmtVRWpiV0VSTTU2SHBQcUZFb3FmcHZa?=
 =?utf-8?B?OTBTaHJqZnQ4OFlmMkgzM1BYMEVicko2NnVkVTJrMVBxLzlmT1cyNVdWMUI2?=
 =?utf-8?B?VFJUSytZM1hUbng0WVF0V2tVSVJJT0x1R1pINlVYWjVjTHlnMWF2VGVaRWpt?=
 =?utf-8?B?ZFZqNFUxdG9QNlYwNmJ3ampjZ0RuZmgxcXNaUVMrSGduZEZIS3VISG5nWE52?=
 =?utf-8?B?RVYyZ1JWTjhlbnovQ3BLelp6ZDZ2OTQ1bzQ1N1BGOGtzNmdOeFhnOVllTWQr?=
 =?utf-8?B?ekxHS2pKeW1uL1BjTHUvdWdVWFZ5RXl5NnBCdDEyVkEzaGVUV2xod2FRL29R?=
 =?utf-8?B?d2V5S2JiR0xCT0FNc0Y2dExmak8wdXJnR0tQaTFZaFpHRndhK3RTb293OWlG?=
 =?utf-8?B?VHo0SG1sKy9DcmVpZ1pNL0ZIdEc5bG5heDVOT3V3VkpSdHJNMnVlNStrQmxY?=
 =?utf-8?B?UGwyMzdmdXRpTE0yMEhjakZoYk1oV0MrbGRISUx4UHJURGpEcVhmcDltVEtu?=
 =?utf-8?B?dXhKaGFDVXZIQ20rK1UxWXAzRGZqcDR1OWlsU1V5RlF3WWZaWVhyVnpjV0Fh?=
 =?utf-8?B?OEJrdzc0SnFLRHpvMWttOWJjMHpIc2U0Q0dRcmZKSjhWaThoS1BrNStoUEVN?=
 =?utf-8?B?eEovQkpZa1YrcThlcmVGTlBoMjhqMVVzM3dnWk5pU1o3OE52U1lMc2F3S0lm?=
 =?utf-8?B?VUV4Mlptc3pTWWlRRUE4djRRR01kcUQ3RTl6K2lIR1NKOEljUHlUS3c5eVRL?=
 =?utf-8?B?VXlqWUVURWtMOEpibkd2SnhiYlp5Wk1waXlwMjdKZ1VBNDFSNzErOUZWd0JI?=
 =?utf-8?B?TUZuM0Nnd3gveXBuRVlsb2pNM25GbkVRbk9UdnZMWWFYSndtTjR2Q3FmZTV0?=
 =?utf-8?B?THBSUFE5dkFYOUo3c0d6VzNySXhTOVQrZmlZaWdKUEZiZ0tmL2lyWHZzdVlZ?=
 =?utf-8?B?QU00ZGVncnBYU3VhVUdQZG9xVFNzUnZZb3B5ckFxbVhwNG41aFh1dGdNWEpX?=
 =?utf-8?B?OEJUT1dYVURpeHJMaXhNYzVyU295a0xzYXh2MXRIeCtpa0gyTmV5YXdVS1o1?=
 =?utf-8?B?Zm1HMENwcGVkNkNQeGVvVzNGbzY2ejFOTWZ0RE5ubENoUUFQREJBejlHRUFt?=
 =?utf-8?B?aWhvWTdGVzdsTjJmRkExUlVxT0ZnT0ZFV3dDSS9VVjhyY3Z5NGx4SHFCQ1pS?=
 =?utf-8?B?KzlScWczZVlrZTVlcGtPaWova1VLZHFNYXE1T0lzTUEyMTkzVzIyKzZ5OEFz?=
 =?utf-8?B?T0cxcm9GN0tQcXVudVdBL2d4RytRRWhIRlNoZVA2S09xZExRUnd5c3dMNHln?=
 =?utf-8?B?VmptdUpXRmppa1BPVTZaUFNLUUxaclZJT1VtLzlBcHFMd0hwWUNRWkpzczFm?=
 =?utf-8?B?VmtQV2U2UC8xdlg1SkRKUkV4UGIwbXQvM1ZiNG9KMnc2T2ZSUVNDWWlpVVBR?=
 =?utf-8?B?eTUzRmg0TFVOK3U4N0FMekhXdkVVUXdrMWxBK1ZUeCtrQzBHTVJqdmhWMG1w?=
 =?utf-8?B?UGVCdis3VC9VSDlhTWJwNE1oc0kzMHl0WVFOdlZ0WDhOZ00vTStaNGRvY0ZG?=
 =?utf-8?B?aHBWeWRTZVBSZktKQllrZ0J0L05rQ0NjVzdoUXVUYk5yVGVWa3ZpaUxyeDdW?=
 =?utf-8?B?ZzVpZWUvSzBTN1dhTk9EcUNnbUtzaFJYOS9QZEorbDh1Mi9kOUg2RldUWFZq?=
 =?utf-8?B?eUdmaGM4aDlKR2hpSnRGSTJ1TFcvTk40a1RZUS9wL3pUVjNZdmt6eHlac3Nk?=
 =?utf-8?B?ZVMrV2RwdUJua2dYUmdCY1ZZdXN2N3hhdHlacHZ0Slo4Ny9zWXppMlB0V1hh?=
 =?utf-8?B?QmpsYzBzL1A2dURFSnlta2pOUE16TzNqQ25lMUVvdzdLWTFKVDNyckVaQzda?=
 =?utf-8?B?NmlDSUVIUm05cXNTYVZrdmgxeGwyclU2UTFCR0lxcmlHbFQxNWNQeHFKeU5h?=
 =?utf-8?B?WjU3TFlSaWx3bjVndVZYdFBUdUk5WHo1UEt1ZlhBQzAzL1VnWkpieEE4Si9O?=
 =?utf-8?B?cTVud2puaG1pVDBDNmVrYzlnTXRVWThOYThaUzIwVWJBSVYxWDJLTzNVWTJW?=
 =?utf-8?B?dmtPNkFTcmNzVFR6Mmhoc29GZDZmMFNzcFBINjJSUm5VaFk1eGhWYW1QZlJx?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31a9ce3-cb40-4935-a102-08da581d1a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 09:12:03.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YthHYlzdDj/2ktJqgGKJ2/xUBRXLwi5LZO0mK9LKfmEr13IFEXguK24M/z/qHW3n+csTQ4IXOm78DHh/P9jtMvhuMi9Rt42KkDM90gdJEAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGkgS2FsLA0KDQpJIGhhdmUgYmVlbiB3b3JraW5nIG9uIGltcGxlbWVudGluZyB0aGUgWERQIG11
bHRpLWJ1ZmZlciBmb3IgaTQwZSBidXQgZ290IHN0dWNrIHdpdGggcGVyZm9ybWFuY2UgaXNzdWVz
LiBJIGFsc28gaGF2ZSB0aGUgQUZfWERQIHBhdGNoZXMgYW5kIG1heSBiZSB3ZSBjYW4gZm9jdXMg
b24gdGhlbSBpbnN0ZWFkLiBXaGF0IE5JQyBhcmUgeW91IHdvcmtpbmcgb24/DQoNCisgTWFnbnVz
DQoNClJlZ2FyZHMsDQpUaXJ0aGENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBLYWwgQ3V0dGVyIENvbmxleSA8a2FsLmNvbmxleUBkZWN0cmlzLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBKdW5lIDIyLCAyMDIyIDU6NTIgUE0NCj4gVG86IEZpamFsa293c2tpLCBNYWNp
ZWogPG1hY2llai5maWphbGtvd3NraUBpbnRlbC5jb20+DQo+IENjOiBlcmljQHNhZ2Uub3JnOyBK
ZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxqYnJvdWVyQHJlZGhhdC5jb20+OyBUb2tlDQo+IEjDuGls
YW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT47IFhkcCA8eGRwLQ0KPiBuZXdiaWVzQHZn
ZXIua2VybmVsLm9yZz47IFNhcmthciwgVGlydGhlbmR1IDx0aXJ0aGVuZHUuc2Fya2FyQGludGVs
LmNvbT4NCj4gU3ViamVjdDogUmU6IFhEUCBtdWx0aS1idWZmZXIgYW5kIEFGX1hEUA0KPiANCj4g
SGkgQWxsLA0KPiBEb2VzIGFueW9uZSBrbm93IGlmIGFueSBwcm9ncmVzcyBoYXMgYmVlbiBtYWRl
IHdpdGggcmVzcGVjdCB0byBtdWx0aS0NCj4gYnVmZmVyIHN1cHBvcnQgd2l0aCBBRl9YRFA/IEkg
d291bGQgYWxzbyBsaWtlIHRvIGhlbHAuDQo+IA0KPiBLYWwNCj4gDQo+IE9uIFR1ZSwgQXByIDUs
IDIwMjIgYXQgMToxMiBQTSBNYWNpZWogRmlqYWxrb3dza2kNCj4gPG1hY2llai5maWphbGtvd3Nr
aUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBBcHIgMDEsIDIwMjIgYXQgMDk6
NTI6MDJBTSAtMDQwMCwgZXJpY0BzYWdlLm9yZyB3cm90ZToNCj4gPiA+IE9uIEZyaSwgQXByIDAx
LCAyMDIyIGF0IDAxOjI2OjEyUE0gKzAwMDAsIEthcmxzc29uLCBNYWdudXMgd3JvdGU6DQo+ID4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
ID4gPiBGcm9tOiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxqYnJvdWVyQHJlZGhhdC5jb20+DQo+
ID4gPiA+ID4gU2VudDogRnJpZGF5LCBBcHJpbCAxLCAyMDIyIDM6MTMgUE0NCj4gPiA+ID4gPiBU
bzogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+OyBLYWwgQ3V0dGVy
IENvbmxleQ0KPiA+ID4gPiA+IDxrYWwuY29ubGV5QGRlY3RyaXMuY29tPjsgWGRwIDx4ZHAtbmV3
Ymllc0B2Z2VyLmtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gQ2M6IEJyb3VlciwgSmVzcGVyIDxicm91
ZXJAcmVkaGF0LmNvbT47IExvcmVuem8gQmlhbmNvbmkNCj4gPiA+ID4gPiA8bG9yZW56by5iaWFu
Y29uaUByZWRoYXQuY29tPjsgS2FybHNzb24sIE1hZ251cw0KPiA+ID4gPiA+IDxtYWdudXMua2Fy
bHNzb25AaW50ZWwuY29tPjsgZXJpYy5kYXZpZC5zYWdlQGdtYWlsLmNvbQ0KPiA+ID4gPiA+IFN1
YmplY3Q6IFJlOiBYRFAgbXVsdGktYnVmZmVyIGFuZCBBRl9YRFANCj4gPiA+ID4gPg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gT24gMDEvMDQvMjAyMiAxMy4zOSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu
c2VuIHdyb3RlOg0KPiA+ID4gPiA+ID4gS2FsIEN1dHRlciBDb25sZXkgPGthbC5jb25sZXlAZGVj
dHJpcy5jb20+IHdyaXRlczoNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPj4+DQo+ID4gPiA+ID4g
Pj4+IEhpLA0KPiA+ID4gPiA+ID4+PiBXZSBhcmUgdmVyeSBpbnRlcmVzdGVkIGluIHJlY2Vpdmlu
ZyBqdW1ibyBmcmFtZXMgKD4gODAwMA0KPiA+ID4gPiA+ID4+PiBieXRlcykgb3ZlciBBRl9YRFAu
IERvZXMgWERQIG11bHRpLWJ1ZmZlciBzdXBwb3J0DQo+IFhEUF9SRURJUkVDVCB3aXRoIEFGX1hE
UD8NCj4gPiA+ID4gPiBXaGF0DQo+ID4gPiA+ID4gPj4+IGFib3V0IGluIHplcm8tY29weSBtb2Rl
Pw0KPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4+PiBDaGVlcnMsDQo+ID4gPiA+ID4gPj4+IEth
bA0KPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPj4gTG9va2luZyBpbnRvIHRoaXMgbW9yZSBJIGZv
dW5kIHRoaXMgY29tbWVudCBpbiB0aGUgbWx4NSBkcml2ZXI6DQo+ID4gPiA+ID4gPj4NCj4gPiA+
ID4gPiA+PiAvKiBEb24ndCBlbmFibGUgbXVsdGkgYnVmZmVyIG9uIFhEUF9SRURJUkVDVCBTUSwg
YXMgaXQncyBub3QNCj4gPiA+ID4gPiA+PiB5ZXQNCj4gPiA+ID4gPiA+PiAqIHN1cHBvcnRlZCBi
eSB1cHN0cmVhbSwgYW5kIHRoZXJlIGlzIG5vIGRlZmluZWQgdHJpZ2dlciB0bw0KPiA+ID4gPiA+
ID4+IGFsbG93DQo+ID4gPiA+ID4gPj4gKiB0cmFuc21pdHRpbmcgcmVkaXJlY3RlZCBtdWx0aS1i
dWZmZXIgZnJhbWVzLg0KPiA+ID4gPiA+ID4+ICovDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+
PiBTbyBhdCBsZWFzdCBtbHg1IGRvZXMgbm90IHlldCBzdXBwb3J0IFhEUCBtdWx0aS1idWZmZXIg
d2l0aA0KPiA+ID4gPiA+ID4+IFhEUF9SRURJUkVDVC4gV2hhdCAidXBzdHJlYW0iIHN1cHBvcnQg
aXMgcmVxdWlyZWQgdG8gZ2V0DQo+ID4gPiA+ID4gWERQX1JFRElSRUNUDQo+ID4gPiA+ID4gPj4g
dG8gd29yayB3aXRoIFhTS3M/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gV2VsbCwgdGhlIGlu
aXRpYWwgcGF0Y2ggc2V0IGZvciBtdWx0aWJ1ZiBleHBsaWNpdGx5IGJsb2NrZWQNCj4gPiA+ID4g
PiA+IFhEUF9SRURJUkVDVCBiZXR3ZWVuIGludGVyZmFjZXMsIHdoaWNoIGlzIHdoYXQgdGhhdCBj
b21tZW50IGlzDQo+ID4gPiA+ID4gPiByZWZlcnJpbmcgdG8gKHRoZSBUWCBzaWRlKS4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBGb3IgQUZfWERQIHdlJ2QgYWxzbyBuZWVkIHRvIGRlZmluZSB0
aGUgVUFQSSwgYW5kIG1heWJlIGFkZCBhDQo+ID4gPiA+ID4gPiBzb2NrZXQgZmxhZyBzbyB0aGUg
dXNlcnNwYWNlIHByb2dyYW0gY2FuIHNpZ25hbCB0byB0aGUga2VybmVsDQo+ID4gPiA+ID4gPiB0
aGF0IGl0IHVuZGVyc3RhbmRzIGl0PyBOb3Qgc3VyZSBhYm91dCB0aGUgZGV0YWlscy4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBZb3UncmUgZGVmaW5pdGVseSBub3QgdGhlIG9ubHkgcGVyc29u
IHdobyB3YW50cyB0aGlzLCB0aG91Z2g7DQo+ID4gPiA+ID4gPiBhZGRpbmcgaW4gc29tZSBwZW9w
bGUgd2hvIG1heSBoYXZlIGEgYmV0dGVyIGlkZWEgb2YgdGhlIGV4YWN0DQo+IHN0ZXBzIG5lZWRl
ZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IENjLiBFcmljIFNhZ2UsIGFzIGhlIGFsc28gZXhwcmVz
c2VkIGludGVyZXN0IGluIGltcGxlbWVudGluZyB0aGlzLi4uDQo+ID4gPiA+DQo+ID4gPiA+IEFk
ZGluZyBUaXJ0aGEgdGhhdCBoYXMgcGF0Y2hlcyBmb3IgdGhlIEFGX1hEUCBzdXBwb3J0IG9mIG11
bHRpLWJ1ZmZlci4NCj4gPiA+ID4gVGhvdWdoLCBoZSBpcyBjdXJyZW50bHkgaW50ZWdyYXRpbmcg
aGlzIGk0MGUgbXVsdGktYnVmZmVyIGRyaXZlcg0KPiA+ID4gPiBzdXBwb3J0IHdpdGggTG9yZW56
bydzIFRYLXBhdGNoZXMgdGhhdCBoZSBzZW50IGFzIGFuIFJGQy4gTGF0ZXN0IEkNCj4gPiA+ID4g
aGVhcmQgaXMgdGhhdCBUaXJ0aGEgaXMgcGxhbm5pbmcgb24gc3VibWl0dGluZyB0aGlzIGluIGEg
Y291cGxlIG9mDQo+ID4gPiA+IHdlZWtzIGFzIGEgcHJvcGVyIHBhdGNoIHRvIHRoZSBtYWlsaW5n
IGxpc3QuIEFuZCBhZnRlciB0aGF0LCB0aGUNCj4gPiA+ID4gZm9jdXMgaXMgdG8gYnJ1c2ggdXAg
dGhlIEFGX1hEUCBhbmQgWkMgc3VwcG9ydCBwYXRjaGVzIGFzIHdlDQo+ID4gPiA+IHN0b3BwZWQg
dHJ5aW5nIHRvIHRyYWNrIExvcmVuem8ncyBtdWx0aS1idWZmZXIgcGF0Y2hlcyBhdCB2ZXJzaW9u
IDEzIG91dA0KPiBvZiAyMyA7LSkuDQo+ID4gPiA+IFdlIGp1c3QgY291bGQgbm90IGtlZXAgdXAu
DQo+ID4gPg0KPiA+ID4gQWgsIGlmIHRoZXJlIGlzIGFueXRoaW5nIEkgY2FuIGRvIHRvIGhlbHAg
cGxlYXNlIGxldCBtZSBrbm93LiBNeQ0KPiA+ID4gY29tcGFueSBuZWVkcyB0aGlzIGZlYXR1cmUg
c28gSSBjYW4gd29yayBvbiBpdCBmdWxsIHRpbWUuIEkgd291bGQgbG92ZSB0bw0KPiBoZWxwIG91
dCBob3dldmVyIEkgY2FuLg0KPiA+DQo+ID4gSGV5IEVyaWMhIFdlJ2xsIGtlZXAgeW91IGluIGxv
b3AgaW4gdGVybXMgb2YgcHJvZ3Jlc3MgYXJvdW5kIHRoaXMgd29yay4NCj4gPg0KPiA+ID4NCj4g
PiA+IFRoYW5rcywNCj4gPiA+IEVyaWMgU2FnZQ0KPiA+ID4gPg0KPiA+ID4gPiA+IC0tSmVzcGVy
DQo+ID4gPiA+DQo=
