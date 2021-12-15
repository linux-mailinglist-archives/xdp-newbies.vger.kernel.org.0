Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF4F475050
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Dec 2021 02:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhLOBIb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 20:08:31 -0500
Received: from mga03.intel.com ([134.134.136.65]:38091 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhLOBIa (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 20:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639530510; x=1671066510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/4izfQ8tSyjONqdEDlthjq4+P4CGvHprn6KA1JNG5Fo=;
  b=WriTrAAzXLjOIOoCRLCDcNCDm+WuYV+0MyWr0olS9MdvxKbdNkJl+OQh
   e0qT/4m6aG4tBuwNd0b0mgkZ4mIFOxt+8GWqOXiXZVD30lnM7FjbEcPwm
   ZCZp3e/mVk7j353HGXJUiJ/z1j9r95IURkQ7nBQzq02HWmyj9We/TD5OH
   dqEHWcRfBSxNMZZeMW1LUwvut4FVf3AG2LZwQTVguqgce6Q3HkuEsYQyl
   GoNFidZcZWO65/lmOS5ISNMYS09TsUNALsjRyRZEr2rc1HmnBmbEMBgcp
   oM40A/KUHlI+856+0kiVmy9Q9NIlYkHB5h+NVf1vH7FXaWZ5OFRcxX3Fp
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239067874"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="239067874"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 17:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="482196337"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2021 17:08:29 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 17:08:29 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 17:08:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 17:08:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 17:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK4Dgl9MTG6SmbP6PdMsdUoFPaggCwaLFmaku8hdb5JTUbjsYXVrwDEECZzvi8IYUhg43KoJibK+wy6NAHYGH3tpppsHlFCzwe+yjS2pRG5TulFO6bUBwHPYk8SWNejCDilBXGkjmiGvg2Ec7yHMMN9vRo/kp7B/cwLXqaEtBvaW7xnV4hKdNHYs2+f7nAQ+TXYm7posRJSuD+NdCbjm5bLN+mTsF1nzVdodV+DKw3saM51dLEZy4wK71uBWXXoV6Mq3jzMHVny4gYULJyAVTavZsmqKq07eA10U2lfe5lawUhOFNoLNlCpZUHPg1Tqr1lIXcF9zbWEmrToBVQDLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4izfQ8tSyjONqdEDlthjq4+P4CGvHprn6KA1JNG5Fo=;
 b=Kzep66W5bhTGh+1wBajPXMSdD7jvpodnkWCCTiUYKtnsjWc6mayKyy362R+Pk0SnDiWFH8faq26godqFuCeyxDE5riGfszrL6MGWEwd/7IU77FKE0b1VxUCzxXQ+Cq+/t0UVUCFFWYYwGuyyTPHe0RCSHOCSYszSYt3kq2DNwmjd5Unqq4gt7iQk+CdRYYJ04/KGn5thUWXS0/qTU81RD2DxaSgu6r5T1XC6HKuEdrlp8+lSIpctF4fuEbXTpOq0oNraepNlxte7wc4dASHD5+RaPl83wG6H9q4XGv+Aeh6aM2J7AMB0PNvWqK+bLirQGxiGgfVyOetmOhJ+sroG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4izfQ8tSyjONqdEDlthjq4+P4CGvHprn6KA1JNG5Fo=;
 b=kud88CBg76NzrfQSOtFcI8TXPeDPW3D9YAxSpO+K+aX0U1XmLAThdfZnEsC++n6QM9/M4aosyTQVlgXOom0uA4pTFDPdBwmLH3eEs3IpOyjgrGdW/PIA+Otl7OIsTNie6ybbB8JN38PXHgOvT5NEJtma/g2Em75CVI1yoqthVJE=
Received: from DM5PR11MB1625.namprd11.prod.outlook.com (2603:10b6:4:b::22) by
 DM5PR11MB1819.namprd11.prod.outlook.com (2603:10b6:3:10a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.14; Wed, 15 Dec 2021 01:08:22 +0000
Received: from DM5PR11MB1625.namprd11.prod.outlook.com
 ([fe80::9844:edc:608c:f658]) by DM5PR11MB1625.namprd11.prod.outlook.com
 ([fe80::9844:edc:608c:f658%9]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 01:08:22 +0000
From:   "Desouza, Ederson" <ederson.desouza@intel.com>
To:     "bjorn@kernel.org" <bjorn@kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        "jbrouer@redhat.com" <jbrouer@redhat.com>
CC:     "jopbs@vestas.com" <jopbs@vestas.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "dioli@vestas.com" <dioli@vestas.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Gomes, Vinicius" <vinicius.gomes@intel.com>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        "Brouer, Jesper" <brouer@redhat.com>
Subject: Re: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUJKzCwekHBwEmrpw/arlXCiKwxol+AgAAokwCAAAItgIAA8ruA
Date:   Wed, 15 Dec 2021 01:08:22 +0000
Message-ID: <006e9428370706633aec10e2d438b4354008cdb2.camel@intel.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
         <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
         <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
         <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ed3d355-3a3a-47a0-c48d-08d9bf6763a0
x-ms-traffictypediagnostic: DM5PR11MB1819:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB181961AD80560F13F82DBC4CF6769@DM5PR11MB1819.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 826QhqDsI3ozpEqH2X3UCI1uO14jtYzQotI7lqeRkwubLlsUAHmNnAy4xW3L/rHOrSK+GAhU/df3ga983/pyJbnl96TEKrhyQ2yKNqjJ4X/bJZzf38pQrYGqtcosTeO+/hpzivPp9X+av6IBiNZ3GpX0ZpFR4ttYQBAX5pvP7/NqOoMjbh36S/RYXc3h6v+NuJHp8x0v8B0eQiteWmf6I7iF3nq52RMuSOsiYv7y/Lmo4F+5mgbyPsVJGdQ222szIMnkBQJXNlTOlBzfdbPD2k9cdrY+HPViAMpidLsqOm94XHbrLjxmfl15kwaaBJiYlMR4ssSp1KeYja6Vpcr1ioKfMuD4S4c4de7GfqCoXXuWE9Bq4+SKZfjEd0srL6ZgZpPKi0UFnNhSwWXUGuS6Ntc9P3mHOJFsdLFe2djSx5JVcwiGVvgm5Px7vacOxxDqKaiJBzWRud2oxUYMdBjDJVQ4En9PtuBJe33e5eTFHUjgnNLsmzJ21Dw0aDhTCgWJKr4IP6ah+I50o8OsrvvRBg6w28d5VhIIACtk6TBdnQIbrAWAFXoR0FnycCX+1UMXyNoZREUmc6FBYXwMCRDv9Ly/cty2rLPZcLelHXopM67L6OTjdOf4z8+vM7QXX8JZ8pHG2OLLrZiKeRu4U7cHlUsiiQ2Sq6Urst4kD4FjsAL08zwjbJGTPLXpk7P0DMCg9RUYzzy9zx+mIyEMlcujYD6OSU4h7aH9LcMtp4kgq9Ryreohso8iWWHzxO0LgtEBEtS+Ifl4Tom6e1NUYyXqteTpF4SP1htAaBSaRgVLidAS6uDYC9bgOOuoK1YAIiJA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(36756003)(76116006)(86362001)(64756008)(53546011)(66446008)(6506007)(5660300002)(66946007)(66476007)(91956017)(66556008)(8936002)(54906003)(38070700005)(122000001)(4326008)(2616005)(66574015)(82960400001)(8676002)(110136005)(38100700002)(26005)(71200400001)(508600001)(186003)(6512007)(83380400001)(2906002)(966005)(4001150100001)(316002)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlRmZncwOFdGS3Q0anpvZlVHcUhYVTVSWjE3SjdNU2FsOWRPaFpyZkxjaW9m?=
 =?utf-8?B?VDJVa1lDQkNweHJ3bHR4S3lmbFlwRFVleEZLdGgxbE5MVGFiR3AzRnNTT3dB?=
 =?utf-8?B?N2FBRFVpNFNwRGtyMWxpMGxiNzBoSWtJakdMUlpia2hMTVZ6eEk1d05YOFM1?=
 =?utf-8?B?ekxZQWg3SVBySGQzai9TR1RWaXNDWkhUUWphTzdtTzJnTWFQb3lKU1JDWllI?=
 =?utf-8?B?OUIwdnJpUzBkRnFpQXliLzl2eEtUL21tbnNwMUFxVk9rUU0xRHVrQURucktG?=
 =?utf-8?B?c1Z5TEdzdjdaUU4zNjhaeXBQUXMwN1NESC9wUjBMcTVMQkJHSTFQaFNpZTlB?=
 =?utf-8?B?U0x5NEE2OG5QbVdFbGlhanhTaTNWcml6eDhjUWRUQ1FkRy9LMy95YmVCNzdZ?=
 =?utf-8?B?UHR4bHpIbldaQk94aFVuV0JjeGs4bDJHSHJ5Q015NjgyYmNTaGYvdlRCUFVQ?=
 =?utf-8?B?dXViQzNMWkV1bFN3MkxmLzh3SjdFYVRQRTJaYTF3ZXZBdnZVamh2WVFXWEs2?=
 =?utf-8?B?S0MvRDZheXdpV1pUM25jV3VXVlg5UkhZT0tRQWd3b3V3ZXE0OHJ3anNQWTI2?=
 =?utf-8?B?VHlvK3JBS1JJaDdZTTBVeHdPZldmMjhNckV5b0tmOFF0aFNZbGhqd2NLTUR1?=
 =?utf-8?B?WUtaSG1TZXg3ZEhOZ1NqK0RFRU9VRmFQc2ZqQmhnaWtzbm1zc2NJb2VkUFFF?=
 =?utf-8?B?dDVQc1l3cTFIYnZvRWhYWXVpTzhqWmJndjYyVDZacHFITUhwMC9oUjQwc3JP?=
 =?utf-8?B?aGwvUWxGdllEU2lPLzNpakZORlB0emFvUmVrN09aaDBsclhwNWlReDh5SW1m?=
 =?utf-8?B?QzZOSFNoMWtyVFoyVnNqdHl3V3BVU0VPNFZFODRUdmJZSnl0SWlQdmE0UmdH?=
 =?utf-8?B?eENmRjZ5SVpWclNXdHM4TGZIR2doemMxS1hReU51d2VsYWpvSHAwS3FOeWZE?=
 =?utf-8?B?UGN2dUlPUXhYY1VlTXh6K0lKbUcrZjlFcDRxc2x1QlVYa0pLTlQycUpMVWtM?=
 =?utf-8?B?WWQ3cGtxZTByNTArSzZibTREU2QyVW8zeWh3NUg5L25vVVVCZUFLRnB1dy9X?=
 =?utf-8?B?cVpMQnhSL0VkaUtIRFRFY2tQUnhiRldYckZ1eGlRQklxZ0VKRVQ0bVZPc09E?=
 =?utf-8?B?dXBnSDgyNnp4MUdXNnNrdmNTcVpCenJxYzVSdnhYV3NRUzUzaHNoWGFicUQ5?=
 =?utf-8?B?Yjk4YTlyNXVCOVB1TWZpWXFBWHdkY3RQazAvZmxNYWRTY1VudFI0UlF1SGcv?=
 =?utf-8?B?dkNYd0ZHMmMzeGJZRDllb3dVaW9IRlo5ZjV0WVBCSmxxWVhFT0h1dng1dm9T?=
 =?utf-8?B?TDZ2b1QzRDFOS0xNR0RrVUcyYUFtUXNxZWFCcEZ4U2pSWk12WDg2bmVqR2pV?=
 =?utf-8?B?RXkrejBMTmI3cW1RZGgxelBDeFlxOWhCZVd2S3c1dm1Kb0V0M2ZOTmpwekR4?=
 =?utf-8?B?Y2F5d3RDS0xmUVJuTFM3eFNDZmc2aXVlZ200ck9JNGRCOTlnU1ZXZTE2RFhq?=
 =?utf-8?B?OEVEZ09kQjgwaHh1Tm0wMkNremVaU1dQQkFqSjkySkI1R3JtYUNBRWtyVFpG?=
 =?utf-8?B?c2c3a0UwaXdvaE1halBQZnZsTDBSYkEyTm0wN3BYQlAxWHRVanRQTU1wL1I0?=
 =?utf-8?B?Q05ENm1wdWVyblBHTDVaN1N3dWJYVnBmNmF4cUU2SStLY2N6Y2dQQTlwM2RC?=
 =?utf-8?B?YzB5RGZrb29HQTV3bGplRW56Z2pWdEhFc1R1SWZZV01UWEVYeURsSWxjd3RF?=
 =?utf-8?B?MURiU1hEc0dQTEpkNForM3NQTkNPNzBGRUg5dTQvZEE0bjhOY0sxU3FIdHlK?=
 =?utf-8?B?SXhua1BlY1l2ZVdiMmgxdlEyc3hDOGRad2pMSjlqalNwbE5CRXZQUFhSL3F5?=
 =?utf-8?B?bUt0b2twRTgzN3NtNWkwaTNVNGw4c1ZBbE9GazIvdEVaejdCUmdFVmVYREti?=
 =?utf-8?B?amMrc3A4d0F6d0NxR3JMNlNlZXJueG4wMTBKMVQ3S0ZSRDZudE9xcG12YUZN?=
 =?utf-8?B?T1FYMG5zZXNyc0d0RWh3K05kczQvNVBDZE9lQzd5alRBREJJWTFwdU9HNFlk?=
 =?utf-8?B?OVZqNEtwamltZ0hNRkFjNWdIQWlMdVUwUmJYb3BTNHFZK2hFVk82RXh5WU9q?=
 =?utf-8?B?dzJTNXVENndCLzlraFRNY1FhSkloT2FqUWlCN2hWNHVLSmozNVZPcStSRXph?=
 =?utf-8?B?eEVrbEoyZVRsL2pQY0hSUjlVRHVUMkZKazJNdVQ2bjIxaHZVMkgzZEFnVDVF?=
 =?utf-8?Q?AQpFnNWcnNUqS4DM0R2KyaXkHi3RiG5SymBTwBksGI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A19A8D603433DD408932D38A78079951@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed3d355-3a3a-47a0-c48d-08d9bf6763a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 01:08:22.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +G/EgEg2atem+TCPgxysM4T8lOGf9XbzC/GH4e12cxGFDzh24+NfzQSdav7jzzwpS8v2uzzOp5K1PLZtBy+G9cQIhHB+8qY2XV6ypTk9vfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1819
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

K1ZpbmljaXVzDQoNCk9uIFR1ZSwgMjAyMS0xMi0xNCBhdCAxMDo0MCArMDAwMCwgS2FybHNzb24s
IE1hZ251cyB3cm90ZToNCj4gQWRkaW5nIEVkZXJzb24gYW5kIE1hY2llai4NCj4gDQo+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVy
IDxqYnJvdWVyQHJlZGhhdC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTQsIDIw
MjEgMTE6MzIgQU0NCj4gPiBUbzogS2FybHNzb24sIE1hZ251cyA8bWFnbnVzLmthcmxzc29uQGlu
dGVsLmNvbT47IEJqw7ZybiBUw7ZwZWwNCj4gPiA8Ympvcm5Aa2VybmVsLm9yZz4NCj4gPiBDYzog
QnJvdWVyLCBKZXNwZXIgPGJyb3VlckByZWRoYXQuY29tPjsgWGRwIDx4ZHAtDQo+ID4gbmV3Ymll
c0B2Z2VyLmtlcm5lbC5vcmc+OyBPbmcsIEJvb24gTGVvbmcNCj4gPiA8Ym9vbi5sZW9uZy5vbmdA
aW50ZWwuY29tPjsNCj4gPiBKb2FvIFBlZHJvIEJhcnJvcyBTaWx2YSA8am9wYnNAdmVzdGFzLmNv
bT47IERpb2dvIEFsZXhhbmRyZSBEYQ0KPiA+IFNpbHZhIExpbWENCj4gPiA8ZGlvbGlAdmVzdGFz
LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogQUZfWERQIG5vdCB0cmFuc21pdHRpbmcgZnJhbWVzIGlt
bWVkaWF0ZWx5DQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gT24gMTQvMTIvMjAyMSAwOS4wNywgS2Fy
bHNzb24sIE1hZ251cyB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tIEZyb206IEplc3BlciBEYW5nYWFyZCBCcm91ZXINCj4gPiA+ID4gPGpi
cm91ZXJAcmVkaGF0LmNvbT4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAxMywgMjAyMSAxMDowNCBQ
TQ0KPiA+ID4gPiBUbzoNCj4gPiA+ID4gS2FybHNzb24sIE1hZ251cyA8bWFnbnVzLmthcmxzc29u
QGludGVsLmNvbT47IEJqw7ZybiBUw7ZwZWwNCj4gPiA+ID4gPGJqb3JuQGtlcm5lbC5vcmc+IENj
OiBCcm91ZXIsIEplc3BlciA8YnJvdWVyQHJlZGhhdC5jb20+OyBYZHANCj4gPiA+ID4gPHhkcC0g
bmV3Ymllc0B2Z2VyLmtlcm5lbC5vcmc+OyBPbmcsIEJvb24gTGVvbmcNCj4gPiA+ID4gPGJvb24u
bGVvbmcub25nQGludGVsLmNvbT47IEpvYW8gUGVkcm8gQmFycm9zIFNpbHZhDQo+ID4gPiA+IDxq
b3Bic0B2ZXN0YXMuY29tPjsgRGlvZ28gQWxleGFuZHJlIERhIFNpbHZhIExpbWENCj4gPiA+ID4g
PGRpb2xpQHZlc3Rhcy5jb20+DQo+ID4gPiA+IFN1YmplY3Q6IEFGX1hEUCBub3QgdHJhbnNtaXR0
aW5nIGZyYW1lcyBpbW1lZGlhdGVseQ0KPiA+ID4gPiANCj4gPiA+ID4gSGkgTWFnbnVzIGFuZCBC
asO4cm4sDQo+ID4gPiA+IA0KPiA+ID4gPiBJJ20gY29kaW5nIG9uIGFuIEFGX1hEUCBwcm9ncmFt
WzFdIHRoYXQgbmVlZCB0byBzZW5kIChhIGJ1bGsgb2YNCj4gPiA+ID4gcGFja2V0cykgaW4gYSBz
aG9ydCB0aW1lLXdpbmRvdyAocmVsYXRlZCB0byBUaW1lLVRyaWdnZXJlZA0KPiA+ID4gPiBFdGhl
cm5ldCkuDQo+ID4gPiA+IA0KPiA+ID4gPiBNeSBvYnNlcnZhdGlvbnMgYXJlIHRoYXQgQUZfWERQ
IGRvZXNuJ3Qgc2VuZCB0aGUgZnJhbWVzDQo+ID4gPiA+IGltbWVkaWF0ZWx5Lg0KPiA+ID4gPiBB
bmQgeWVzLCBJIGRvIGNhbGwgc2VuZHRvKCkgdG8gdHJpZ2dlciBhIFRYIGtpY2suIEluIHplcm8t
Y29weQ0KPiA+ID4gPiBtb2RlDQo+ID4gPiA+IHRoaXMgaXMgcGFydGljdWxhciBiYWQuwqAgTXkg
cHJvZ3JhbSB3YW50IHRvIHNlbmQgNCBwYWNrZXRzIGluIGENCj4gPiA+ID4gYnVyc3QsIGJ1dCBJ
J20gb2JzZXJ2aW5nIDggcGFja2V0cyBncm91cGVkIHRvZ2V0aGVyIG9uIHRoZQ0KPiA+ID4gPiBy
ZWNlaXZpbmcNCj4gPiA+ID4gaG9zdC4NCj4gPiA+ID4gDQo+ID4gPiA+IElzIHRoZSBhIGtub3du
IHByb3BlcnR5IG9mIEFGX1hEUD8NCj4gPiA+IA0KPiA+ID4gTm9wZSEgSXQgaXMgc3VwcG9zZWQg
dG8gYmUgYWJsZSB0byBzZW5kIG9uZSBwYWNrZXQgYXQgYSB0aW1lLA0KPiA+ID4gdGhvdWdoIEkN
Cj4gPiA+IGhhdmUgc2V2ZXJhbCB0aW1lcyBzZWVuIGJ1Z3MgaW4gdGhlIGRyaXZlcnMgd2hlcmUg
dGhlIGJhdGNoaW5nDQo+ID4gPiBiZWhhdmlvciBzaGluZXMgdGhyb3VnaCBsaWtlIHRoaXMsIGFu
ZCBvbmNlIGEgYnVnIGluIHRoZSBjb3JlDQo+ID4gPiBjb2RlLg0KPiA+ID4gVGhlcmUgaXMgZXZl
biBhIHRlc3QgdGhlc2UgZGF5cyBmb3IganVzdCBzZW5kaW5nIGEgc2luZ2xlIHBhY2tldCwNCj4g
PiANCj4gPiBXaGVyZSBpcyB0aGF0IHRlc3QgaW4gdGhlIGtlcm5lbCB0cmVlPw0KPiANCj4gSW4g
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3hkcHhjZWl2ZXIuYy4gSXQgaXMgdGhlDQo+IFJV
Tl9UT19DT01QTEVUSU9OX1NJTkdMRV9QS1QgdGVzdC4gQnV0IHRoZSBmcmFtZXdvcmsgb25seSBv
cGVyYXRlcyBvbg0KPiB2ZXRoIGN1cnJlbnRseS4NCj4gDQo+ID4gPiBzaW5jZSB3ZSBoYXZlIGhh
ZCBpc3N1ZXMgd2l0aCB0aGlzIGluIHRoZSBwYXN0LiBUaGF0IHRlc3QgZG9lcw0KPiA+ID4gcGFz
cyBpbg0KPiA+ID4gYnBmLW5leHQsIGJ1dCBpdCBpcyBvbmx5IHJ1biB3aXRoIHRoZSB2ZXRoIGRy
aXZlciB0aGF0IGRvZXMgbm90DQo+ID4gPiBzdXBwb3J0IHplcm8tY29weSBzbyBjb3VsZCBzdGls
bCBiZSBhbiBpc3N1ZS4gV2hhdCBkcml2ZXIgYXJlIHlvdQ0KPiA+ID4gdXNpbmcgaW4gemVyby1j
b3B5IG1vZGUgYW5kIHdoYXQga2VybmVsIHZlcnNpb24gYXJlIHlvdSBvbj8NCj4gPiANCj4gPiBE
cml2ZXI6IGlnYyB3aXRoIEludGVsIGNoaXAgaTIyNQ0KPiANCj4gSGF2ZSBuZXZlciB0cmllZCB0
aGlzIG9uZSBwZXJzb25hbGx5LiBEbyBub3Qga25vdyBpZiBJIGhhdmUgb25lIGluDQo+IHRoZSBs
YWIgYnV0IGxldCBtZSBjaGVjay4NCj4gDQo+IEVkZXJzb24sIGRvIHlvdSBoYXZlIGFueSBleHBl
cmllbmNlIHdpdGggdGhpcyBjYXJkIGFuZCBpZiBzbywgaGF2ZQ0KPiB5b3Ugc2VlbiBzb21ldGhp
bmcgc2ltaWxhcj8NCg0KTm90IHN1cmUuIEkgd29uZGVyIGhvdyBzbWFsbCBpcyB0aGUgaW50ZXJ2
YWwgSmVzcGVyIGlzIHVzaW5nLiBJIGltYWdpbmUNCnRoYXQgaWYgaXQncyB0b28gc21hbGwsIHRo
ZSBpbnRlcnJ1cHQgZ2VuZXJhdGVkIHRvIHRyaWdnZXIgdGhlIHR4IGNvdWxkDQplbmQgdXAgc2Vy
dmluZyBtb3JlIHRoYW4gb25lIHBhY2tldC4NCg0KVmluaWNpdXMgc2hvdWxkIGhhdmUgbW9yZSBw
cm9tcHQgYWNjZXNzIHRvIGkyMjUgLSBjb3VsZCB5b3UgcGxlYXNlIGhlbHANCm9uIHRoaXM/DQo+
IA0KPiA+IEtlcm5lbCB2ZXJzaW9uOiA1LjE1LjAtbmV0LW5leHQrICM2MTggU01QIFBSRUVNUFQN
Cj4gPiDCoMKgIC0gRGV2ZWwgYnJhbmNoIGF0IGNvbW1pdCA2ZDNiMWIwNjk5NDYgKHY1LjE1LTEy
ODAyLQ0KPiA+IGc2ZDNiMWIwNjk5NDYpDQo+ID4gDQo+ID4gPiA+IEhvdyBjYW4gSSBnZXQgQUZf
WERQIHRvICJmbHVzaCIgVFggcGFja2V0cyB3aGVuIGNhbGxpbmcNCj4gPiA+ID4gc2VuZHRvKCk/
DQo+ID4gPiA+IFNob3VsZCB3ZSBhZGQgYW5vdGhlciBmbGFnIHRoYW4gdGhlIGN1cnJlbnQgTVNH
X0RPTlRXQUlUPw0KPiA+ID4gDQo+ID4gPiBJbiB6ZXJvLWNvcHkgbW9kZSB3aXRoIHNvZnRpcnEg
ZHJpdmVyIHByb2Nlc3NpbmcgKG5vdCBidXN5IHBvbGwpLA0KPiA+ID4gYQ0KPiA+ID4gc2VuZHRv
IHdpbGwganVzdCB0cmlnZ2VyIHRoZSB4c2tfd2FrZXVwIG5kbyB0aGF0IHNjaGVkdWxlcyBuYXBp
DQo+ID4gPiB1bmxlc3MNCj4gPiA+IGl0IGlzIGFscmVhZHkgZXhlY3V0aW5nLiBJdCBpcyB1cCB0
byB0aGUgZHJpdmVyIHRvIHRoZW4gZ2V0DQo+ID4gPiBwYWNrZXRzDQo+ID4gPiBmcm9tIHRoZSBU
eCByaW5nIGFuZCBwdXQgdGhlbSBvbiB0aGUgSFcgYW5kIG1ha2Ugc3VyZSB0aGV5IGFyZQ0KPiA+
ID4gc2VudC4NCj4gPiA+IEJhcnJpbmcgYW55IEhXIHF1aXJrcywgc2VuZGluZyBvbmUgcGFja2V0
cyBzaG91bGQgYmUgcGVyZmVjdGx5DQo+ID4gPiBmaW5lLg0KPiA+IA0KPiA+IEkgd2lsbCBpbnZl
c3RpZ2F0ZSBkcml2ZXIgbGV2ZWwgaXNzdWVzLg0KPiA+IA0KPiA+IEkgaGF2ZSBvdGhlciAoMTAw
RykgTklDcyBpbiBteSB0ZXN0bGFiLCBidXQgSSdtIHVzaW5nIHRoZXNlIDFHIE5JQ3MNCj4gPiBi
ZWNhdXNlDQo+ID4gdGhleSBzdXBwb3J0IGhhcmR3YXJlIHRpbWVzdGFtcGluZywgd2hpY2ggYWxs
b3dzIG1lIHRvIGludmVzdGlnYXRlDQo+ID4gdGhlc2UNCj4gPiB0aW1pbmcgaXNzdWVzLg0KPiA+
IEknbGwgZmluZCBhIHdheSB0byBzZWUgb2Ygb3RoZXIgZHJpdmVycyBiZWhhdmUgZGlmZmVyZW50
bHkuDQo+IA0KPiBXb3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgY2hlY2sgaWYgdGhlIHByb2Js
ZW0gYWxzbyBleGlzdHMgb24gZS5nLg0KPiBpY2UuIA0KPiANCj4gPiA+ID4gSGludCwgSSdtIHVz
aW5nIHRjcGR1bXAgaGFyZHdhcmUgdGltZXN0YW1waW5nIG9uIHJlY2VpdmluZyBoaXN0DQo+ID4g
PiA+IHZpYQ0KPiA+ID4gPiBjbWRsaW5lOg0KPiA+ID4gPiANCj4gPiA+ID4gdGNwZHVtcCAtdnYg
LXMwIC1uaSBldGgxIC1qIGFkYXB0ZXJfdW5zeW5jZWQNCj4gPiA+ID4gLS10aW1lLXN0YW1wLXBy
ZWNpc2lvbj1uYW5vIC13IGFmX3hkcF90eF9jeWNsaWMuZHVtcDQyDQo+ID4gPiA+IA0KPiA+ID4g
PiBOb3RpY2VbMV0gb24gc3BlY2lmaWMgYnJhbmNoOiBbMV0NCj4gPiA+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3hkcC1wcm9qZWN0L2JwZi0NCj4gPiBleGFtcGxlcy90cmVlL3Zlc3RhczAzX0FGX1hE
UF9leGFtDQo+ID4gPiA+IHBsZS9BRl9YRFAtaW50ZXJhY3Rpb24NCj4gPiA+IA0KPiA+IA0KPiA+
IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywNCj4gPiAtLUplc3Blcg0KPiANCg0K
