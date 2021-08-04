Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3633E0605
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Aug 2021 18:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237992AbhHDQgr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 4 Aug 2021 12:36:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:17908 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhHDQgr (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 4 Aug 2021 12:36:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="194238016"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; 
   d="scan'208";a="194238016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 09:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; 
   d="scan'208";a="467176857"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2021 09:36:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 09:36:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 4 Aug 2021 09:36:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 4 Aug 2021 09:36:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 4 Aug 2021 09:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpNFa+MGRnoQP/zQqBhXLAFXCSi3nyOtnoG36Klk6Ua7p8yO4FbWliKLV+f1/CyjIIKEQ+7YinCZVR1tf5hxlwILjkhTyFx2OYRY6vUXzDITfCvh84rmryBnnnvdriaBsSWkNwtIXbcuI9fUMcKjFStlI+KGXAUcPFjttdWoMEfDSrbazsGatr4jbSZNON5HrqRowokljlpbaWKD3d54Nrv7bOFlPJN7HlWFc8ZUTpFIK6NhvOJCMjd+6f7FRVbuVDqaACbes70rgbYo0twy3yNzAYGgahGO8TkYIafsPTj7jnu3LUcQLSF7Xv1WOpcowjCDFyzAPEkMafFitwD7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lAEi18MoNJfKk3xcB3Ab5xAJhv8GoXgCJ0rhlGsIho=;
 b=WZfBreuubyujHzlD9ZX4OBXYVEteoSDoURywSA92ZKX5TkA/9o0Tk+/lKnITFbIJpZgpChs82+2eNblR3RYdAEidI2OfEVlB+V4JRvA1vXyvId7Fyli0FRSEuSD4L9CF2OQNOxmgAt5OeVifDOjIrhGitI5dfV0YxaxoIHYIvJefd44fdM0xUu6xevqhHx8fZ51rO21tYBinHAupldfybjMy32MNYZEeDG8QsrLSznolteUOfjl8n7p4haPV67JfPOYghhzNcxSr7sjLgCX6s6yvFZGr45C7gOrx/brd1+q2aBzOf2tqPEweNFxyBXt1dUC6cjFMq28yRIaqlPNR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lAEi18MoNJfKk3xcB3Ab5xAJhv8GoXgCJ0rhlGsIho=;
 b=WlzIwmoYXC6/ILiGvGnSqOr81do1nRx+KqJdNt3xEdtPiTBoAFyVK5pbQv9ZYlu0xkQjDYwNbm86+hfs4l21vgsVvD0eSZp641Pt+tMNiOSUAZOlsT/q849w9TvaQbafv+fL2VISAPoGrwwJIAbGzbUWVFB5PP94YbZuxF0+zNg=
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by MN2PR11MB4254.namprd11.prod.outlook.com (2603:10b6:208:18f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 16:36:28 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::4830:43ae:7d53:36d5]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::4830:43ae:7d53:36d5%7]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 16:36:28 +0000
From:   "Fingerhut, John Andy" <john.andy.fingerhut@intel.com>
To:     Pedro Tammela <pctammela@gmail.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: RE: Instructions to enable spin locks?
Thread-Topic: Instructions to enable spin locks?
Thread-Index: AdeIybIxm60qzT1lTzSHh2c6VFed3QAfGAwAAAIlv7A=
Date:   Wed, 4 Aug 2021 16:36:28 +0000
Message-ID: <MN2PR11MB41736042C46731CF18C809FAA6F19@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <MN2PR11MB41739E5557BB1CCA85CC703EA6F19@MN2PR11MB4173.namprd11.prod.outlook.com>
 <CAKY_9u3150wk7uywpfHThXe0Zn-8Edp0T_VVC-tD7uO_RLGY2g@mail.gmail.com>
In-Reply-To: <CAKY_9u3150wk7uywpfHThXe0Zn-8Edp0T_VVC-tD7uO_RLGY2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f38395ac-bf51-4619-4a06-08d957660235
x-ms-traffictypediagnostic: MN2PR11MB4254:
x-microsoft-antispam-prvs: <MN2PR11MB4254B5FE75BEDFE742C87406A6F19@MN2PR11MB4254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brbdooA+Lq65l9NVfilyQEIRIj3lQm+mxe5+ZGKuSFYP6ZToACe+qRci+Qk8qV7Pb2/np0JhKfyTeDy9vXAdP4ugNjkoJ/2Tu3eJiGbpkWvYk6/N36J1dTuCisLx0W/aUgoYhW02B1W7PAH14HcF7qOejeU5fHzpONbwTVuF+mI9R1UO0dSPZ5iq24BGhfm1juYerNQbTmH/C48Gwtq/WoZi+jbsjLe3NTpRsHtCLnkh4CEOL3B1/zoAwcnW5ATUsXQk3EiIu3KCP9cPkdvSnqeYP85EzOkgsPoYJpNkCpFZVh7E96Cgi54o6ts22aSrv6YtKiQRU8GFuZGGyeBMbcF+Fwtq96TYD59TshtXnAsqCavRTaRGGANJIq7nDhLfEVoR7hRDwWpp4kWbvGa75xhhw6qjJzYKh0mc9B8SjRe+TJTyRAHc5bVQ/pinXB2ytkow8QaSbrCjjtfQPn4CeP2E+8sqLTZEruIuaEkmBTeIN+OYSOkV8qcukiUWyDI8umz1kUAuxRlxFBDiSvWMoug+2wK3vEu9xnQSE////kgvdFGmAuUdO3qjf1b6kRFsP+5hFATaZQ1VWWSrjgxF+OmjNDG/OZU2rRQXO5ks14NC7m8kJn7pEgGOBqzqtr3Gl5K0PFR+lCX9rWOEV3oLyEljkYQmrdH+stNXwbkpZw5u1IJHXUBHN5u+7WLcgTS6jWvEo6MN8bnyHNpniPSvnSB2brMzntSJQDrNIvEz1arG3LVTqkH/p6q9EVscUD/pw9AKnBriR+74HoFoplWq8gYKWXw3VNexVOUXMh5kFnwfcC5cNKYWofMZBDj2EeMQlssns+DIYrUJGkg43GJqHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4173.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(5660300002)(8936002)(64756008)(52536014)(966005)(478600001)(8676002)(83380400001)(4326008)(66446008)(71200400001)(76116006)(55016002)(26005)(66946007)(66476007)(66556008)(33656002)(122000001)(186003)(7696005)(2906002)(38100700002)(6916009)(6506007)(316002)(9686003)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHZyRzhHRUlzbVR5djZmSDFmUjduYlh0NWVCVU5lRnJWdmJFKzhBK1VBK3RU?=
 =?utf-8?B?c0pDeXpGQzYwT2cvN1A2cVlKMi9FQkt5YjN1MDRRQ2FGVjNzTlJlVFZrM2RS?=
 =?utf-8?B?VEpMSnJhOUJ5L0ZhTnZ2S2RWOURBQ2NualpUK094MDRNcEVibnhxYzJWd0x3?=
 =?utf-8?B?RElCK004WnNoeEdyK0xWNXZDcVBPWW81SldNL2poR1NRVlFlYzA1cGFlNjAr?=
 =?utf-8?B?RUx5bG1wNHIrOWN3aEJOZTFUcERrK0FxT1ZVbmRTQ3h3Y0dqc0hreEpEY09V?=
 =?utf-8?B?ZmYyVXhWU1AzcjhiZkdNb3FvMXVRTzRzL1c1ZU0rUDU0dll6T0JWTHVWVUEr?=
 =?utf-8?B?d1VqbUVQOWdrUVd6Z1QwRWp2RXZoUFgySHdLWWxSanlUalVESHBhTDhBSHZS?=
 =?utf-8?B?eXE2KzgzZ091OUtpcmsza0xsM2FSQjJsSDdvV04yN1BOWEI0cDU2d2w3a0hl?=
 =?utf-8?B?NjMweUNzVnkySGtYUEp3N2x5NjlVSUZpSytlRTBFTjlISWNCRDBrY0ZrUUZG?=
 =?utf-8?B?YUVWbER3ZGk1cGMzbVVQcjVvZHNpbFZzaEFGSVBad1VDR1ZML1A2NjA4eHpq?=
 =?utf-8?B?cGxRTzBQaWovcE9LbkZsUXd0cldiYW0xdHF2NUxaWkpmYzJZZEQ2U1plU1Q5?=
 =?utf-8?B?TDdGcXVZU05DQ25WY01IN1gxS2ROQUM0cURmazNHNVA2aGs4OGhpV1FiYy9K?=
 =?utf-8?B?WDhtZTJLWWZ0MXBhMHJtQnZRS3ZjaWcxZzZCZVQ5TVd6SWdyRjdlZUNmcFpK?=
 =?utf-8?B?aXA3ODAzL2s4d0pUNzB4aW5yWFU2UHFSMjFNOVA4blR1YVRGSlY5OVhrRDkz?=
 =?utf-8?B?SkNNTHhIdDZaclJkMkR0a3plaDJmS21kLzhtMS8vY0xmdXNmK0ppM2hyaVcy?=
 =?utf-8?B?VzFLVllodEtqV2hnUzVHbkZEYklSK0pMM004NHNCUlZrSmJsMEtUSlhZaXRB?=
 =?utf-8?B?dkdNeXQxbHU2Y25mV0pENndHQ3Z2UTBVZlhJNk1vdDNSdzBubXdOanVya1pl?=
 =?utf-8?B?c0ppSEVucDdpVzY2TERIZWxyUjZqcVptWG1JQm1UV0Q1TFZ4ZFk3cmFDVjdy?=
 =?utf-8?B?eWVjdDNoWXU3WS9md2tFM0hzdVZWQUYxZzFBK3ZacjhZYVh6SW5DY1A0Z1FD?=
 =?utf-8?B?Y2hsa2JYT3pCakpFMU5XOUJSdi9hVW4yT3E0aWFLMFN5ZnJWc1JiVDA1ZFRx?=
 =?utf-8?B?d0RzR1Vxc01wTjdtQS80SVhSazVTYUFlbUVCYjl3UEZ2ckdnRC9NM1hzNDlw?=
 =?utf-8?B?aVBVRlRJS1ZjVGR6Z0YvN3Voay9vcHZKNHgzSXF4MXNhWWRvb3ZaNTVMZitt?=
 =?utf-8?B?MVFvZUhrOVBhQUhCVHRUaXdkYUV1TEdLRVk0ek5YV1ZNcnE1UnBueHAxMDQ5?=
 =?utf-8?B?SkRXbGlaQjh0MnVPZnZ2RWdHV2M0KytsajBFMzFxWHE0WE5MMVR5TTZVZEJI?=
 =?utf-8?B?UlhBRHE3YUp0YlZrRTZBVTJSUmlFZ3ZxUnZGY3R5SWdkMG9scWJKRXY0ZFZH?=
 =?utf-8?B?RDFId2hnZEMrYm5jbUNPcktySkV5UTdSSkdMUnMyVGhaaWtUOG1Ic1pTRVph?=
 =?utf-8?B?VGlPR2MwNHBPNGx0VnFFTzNUZTVuTyttQmsyZWlXcHZ3clhsTlAzRURPdXli?=
 =?utf-8?B?TDdacjJmOFloOHdObngyU09IR1dDK2ZnQWtoWDdEOERmT0VwRHZBd3k0ZnBt?=
 =?utf-8?B?NWdCdTlXRVZXdFJ5M0xQa1lJOExHR2RsYkRvSmNWY1g0RSthaUNvOUF3R01q?=
 =?utf-8?Q?Jow/WMezXx/nhCvVDu7vbvwxHhp6izjeBx7p21M?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38395ac-bf51-4619-4a06-08d957660235
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 16:36:28.3384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFvzK5KtY88btWMbjD60xWsGorNiBgtL9Tza7RumriTVmmxyTGbIwCACP1c8wCILUIDV+iAMo8yBT1Sf/XiVPrXnUTCPTn16Vpp5iRWC65o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4254
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

PiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaG9zdC1pbnQNCj4NCj4gSW4gcGFydGljdWxhciwg
d2Ugc2hvdWxkIHVzZSBzcGluIGxvY2tzIGF0IGxlYXN0IGZvciB0aGlzIG1hcCBpbiB0aGUgDQo+
IHByb2dyYW0gaW50bWRfeGRwX2tzaW5rLmM6IA0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
aG9zdC1pbnQvYmxvYi9tYWluL3NyYy94ZHAvaW50bWRfeGRwX2tzaW5rLmMjDQo+IEwyNy1MMzEN
Cg0KPiBJZiBJIG1heSwgSSB3b3VsZCBzdWdnZXN0IHVzaW5nIHBlcmNwdSBoYXNoIG1hcHMgYW5k
IGFnZ3JlZ2F0aW5nIHRoZQ0KPiBzdGF0cyBmcm9tIHRoZSBzYW1lIGZsb3dfa2V5IGluIHlvdXIg
dXNlcnNwYWNlIGRhZW1vbi4gIFRoYXQgd2F5IHlvdQ0KPiBjYW4gYXZvaWQgc3BpbmxvY2tzIGNv
bXBsZXRlbHkgYXMgaXQgbW9kZWxzIG9uZSBrZXkgdG8gbiB2YWx1ZXMsIHdoZXJlDQo+IG4gaXMg
dGhlIG51bWJlciBvZiBDUFVzLiAgWW91IGNhbiBldmVuIGxldmVyYWdlIGJhdGNoaW5nIGlmIHlv
dXIgbWFwDQo+IGhhcyBhIGNvbnNpZGVyYWJsZSBhbW91bnQgb2Yga2V5c1sxXSwgd2hpY2ggaW4g
bXkgZXhwZXJpZW5jZSBjYW4NCj4gaGFuZGxlIGxhcmdlIG1hcHMgd2l0aG91dCBub3RpY2VhYmxl
IG92ZXJoZWFkLg0KPiANCj4gUGVkcm8NCj4gDQo+IFsxXSBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9tYXBf
dGVzdHMvaHRhYl9tYXBfYmF0Y2hfb3BzLmMNCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwg
UGVkcm8uDQoNCkZvciB0aGUgRUJQRiBwcm9ncmFtcyBJIGhhdmUgaW4gbWluZCwgdGhleSBhcmUg
ZG9pbmcgdGhpbmdzIGxpa2UNCmluc2VydGluZyBhIHBlci1hcHBsaWNhdGlvbi1mbG93IHNlcXVl
bmNlIG51bWJlciBpbnRvIG5ldyBoZWFkZXJzIGluDQplYWNoIHBhY2tldCBpbiBhIHNvdXJjZSBo
b3N0LCBhbmQgdGhlbiBtYWludGFpbmluZyBzdGF0ZSBpbiB0aGUNCnJlY2VpdmVyIGhvc3RzIGZv
ciBwYWNrZXRzIHRoYXQgaGF2ZSB0aG9zZSBzZXF1ZW5jZSBudW1iZXJzIGFkZGVkLCB0bw0KZGV0
ZWN0IHdoZXRoZXIgdGhlcmUgYXJlIHBhY2tldCBkcm9wcyBpbiB0aGUgbmV0d29yaywgaS5lLiBz
b21lDQpzZXF1ZW5jZSBudW1iZXJzIGFyZSBuZXZlciByZWNlaXZlZC4NCg0KSSBrbm93IHRoYXQg
cGVyLWNwdSBtYXBzIGV4aXN0IGluIEVCUEYsIGFuZCB0aGV5IGFyZSBwZXJmZWN0DQp3aGVuIGFs
bCB5b3Ugd2FudCB0byBkbyBpcyB0byBtYWludGFpbiB0aGluZ3MgbGlrZSBwYWNrZXQgb3IgYnl0
ZQ0KY291bnRlcnMsIG9yIGNvdW50ZXJzIGZvciBzb21lIG90aGVyIGV2ZW50cywgYmVjYXVzZSB0
aGUgcGVyLWNwdQ0KZW50cmllcyBjYW4gYmUgY29tYmluZWQgYnkgYWRkaW5nIHRoZWlyIGNvdW50
cyB0b2dldGhlci4NCg0KSG93ZXZlciwgZm9yIG91ciB1c2UgY2FzZSwgSSBkbyBub3Qgc2VlIGFu
eSBlZmZlY3RpdmUgd2F5IHRvIG1ha2UgdXNlDQpvZiBwZXItY3B1IG1hcHMsIGFuZCBzdGlsbCBw
ZXJmb3JtIG91ciBkZXNpcmVkIHBhY2tldCBwcm9jZXNzaW5nDQpmdW5jdGlvbnMuICBIZW5jZSB0
aGUgZGVzaXJlIGZvciB1c2luZyBzcGluIGxvY2tzLg0KDQpUaGFua3MsDQpBbmR5IEZpbmdlcmh1
dA0K
