Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC1D4745B5
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 15:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhLNO51 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 09:57:27 -0500
Received: from mga01.intel.com ([192.55.52.88]:24753 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235104AbhLNO50 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 09:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639493846; x=1671029846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q3QCoI1CXFRdAYSOPUw2ile1psoz8d+5/IfI248WHYc=;
  b=BR9OZUqPioO8XKwKOzjQlZm1yn6+vkZmScrHw4ZjmOTvrvU5uXjwGMPd
   gg/GYELXoC96RMJJbsN5gzh3xx0hvzox5HGxBQRwFfVFaUmk2Zot7C/df
   QFHof2ftbCYpY3qFoMfn5wq1oleXc7wdKuz+ojZXAbRECB+x2ngaWSr1X
   oaFEDRk/mMRybONuQ3K6q7ipqWqzp8fFMBq5WsVXFQ1roA9pv9lsv6qF4
   iYmfmkD3uBJelSUdJObPL5A9kZu96rJ3OGOFGPbvU+OOgQo8POr5mBhOR
   E5EjvwSRgXIYftytpJGTQ53nMjX6sFF/Ya4Dn71C13dgrN+FeRjB435+N
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="263133189"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="263133189"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 06:57:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="505383544"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 06:57:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 06:57:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 06:57:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 06:57:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 06:57:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOQHnKBmV2MHFMvbenYPh4iUMINsCarx5gd9rxDntAMmk/W7Ds6v83baDrgHmYcuxIOoLaL4TDyiSBYyQKhsvGv3cSkvzniBmDv6ur+P+hkBQDwFiD7A2ynWyHE7ThLihzXe3K8IKIxtwo3rknb1+rqDe12pNySwfltci2fCXQwQPd/eM6UWhoUmnBuuSkGsHlO/XufBUbdh415FjoF5RLE/I7DKrdnGbge84C4JwiXnZQxN+NrCaPb116qO5tvvANqqdqRTSzttZMvTUypWSKYm2zkAhWpRe3ioGHal8Up/9B7QQVe4s7HosutUEBKo8qKa+6k0fHXvw7vn0/e/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3QCoI1CXFRdAYSOPUw2ile1psoz8d+5/IfI248WHYc=;
 b=mUwh0+67ANTg1HGa4yHirJB26FQuFe6p5ahzkRvvHsLCf8Wng8JsAfUb4vt9UaGsBjHgBhwHB1V0KNGBlUHCQWJaxgjucC+1I+XYeWul53N5vs2oXnuOU21ASDeL9PGem34zxOA+dzpHQeeSwHCP9TX8ldlAkAawFsyHnifWl2YiItyluApfQhHtP1ox9xRHB5lGDhtYgGEiX+y9ZMVU1xxmXDKf9yLM0C2KOztEchsEa12ToK7exSzuGICQoX4Qm0guSPPtCoukyQhLvDXmIXXyHs8kXeg7p3LEVdbd+4rAuUxsAcXEDwHope1QQ1tD0Ux5qtjcWgVU7rMjl/3vFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3QCoI1CXFRdAYSOPUw2ile1psoz8d+5/IfI248WHYc=;
 b=rw+9hbnXqQPgL3ZP8IUQ3+cFuPUY1GAhpEGrLYO9VvSjwB4BlEtbn7gRtOy0M9bsK1zQ1pXINnovZiQQ/V4pLIQTz11KmeWvJN/YerO76W9IOfO/Bu0XOn/+kYN24fi1ar2iHo3yj9zuvv/1CWvK/uF+pV5qsCMX1tgF0XTblLA=
Received: from DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) by
 DM5PR11MB1611.namprd11.prod.outlook.com (2603:10b6:4:9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 14:57:21 +0000
Received: from DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::e08d:fd5a:f208:566d]) by DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::e08d:fd5a:f208:566d%4]) with mapi id 15.20.4755.026; Tue, 14 Dec 2021
 14:57:21 +0000
From:   "Ong, Boon Leong" <boon.leong.ong@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        "Desouza, Ederson" <ederson.desouza@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: RE: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUSKErDy6ZQlE+wEpF+ixCssqwxol+AgAAokwCAAAItgIAADLMAgAAshYCAAAq+cA==
Date:   Tue, 14 Dec 2021 14:57:21 +0000
Message-ID: <DM6PR11MB2780612AEAC3C18A3ED4F653CA759@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <d8f4fe35-0bc0-5fc0-0cb6-34d2340512f4@redhat.com>
 <MW3PR11MB46021F4F552DC0C982C22AFEF7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <Ybh/LIiS8ZHSXRDw@boxer> <65b16496-1b4e-55d9-ea17-610cfd923792@redhat.com>
In-Reply-To: <65b16496-1b4e-55d9-ea17-610cfd923792@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6736ea2e-fd23-4570-92e9-08d9bf120851
x-ms-traffictypediagnostic: DM5PR11MB1611:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB16119DF390A98BE578B35BCECA759@DM5PR11MB1611.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J1wgIkyf2KZM/+k+bn5t7QCzb075c68LZVTwU8IuDrRNio8WXCrlwZoWXS4JI3zCNtRWF7T3E6OQFAOkzodt3o/PBSRLCI00WldibjK8Kzudi+L+nqoMqBHjpb9M72ajWJvgogqOWYZJftICgXJGT8kHx+hN4HUm8MmKhd3JUUY2zeXbXHZlU6yfNdT5kWHfqVOFG/NKhBYhScP2az1+DbAnNZEB2gCrLWVsLpI6+IGmMw/eIV4LEeKaBbK7Amy745qqhJTcqY3Z1miGJT5PtR6k7TBlUt6/oDSxTg8RNafvWLEeEq/IooPlNEAccseUGdQkKvgHrVo8LQ7Ie/JzHA5d26aWeGzQXsoVsrWsRf6R7fySuOk0/xD1QIk4Z3Nx64jMmIhSPa14hx9DzwesFJiQgHj7CGepVkzgLqx4s+qusjfJAxUJbEdSQKo9B0rMRNU2cVYUumd2vkWXeTw0RKDzG2RnqNeGoN8OEYDFAkgOkgN69FPIR3MFz4u6qUQBhMQHjgIfU5jej7sVm3SmzHhw0CHPN+GPAXnWBLjNDX2+AsrY931RDXVd7j1FKIkFkjZzM01pbvoHMaWu9xRyS4SFfB9chZeoFP70IGnisU5if+q3IgfMUkd4rW5BRAM2TDgRqfU8vRHilxd1lENQB/O1SrY/VhMuYX4wz/nOBotE3dwv6aPRXLxtp3nm3Y/uvbO88m+gpgQU4X4a85uw4qpAeWEc/H1IEI6MO5+LttONaA2Pk798G76YzT69LUeYlCE3cO+qE3MFvarJV4GZgB7//7zMPa06vEJGYmvkc1kPNtYk50Mtf9KDiIexi108Vl6mkfP2ARfeuyI0qJ/SZszRo+aBIZ18yb7RgVA/q24=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2780.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(38100700002)(64756008)(66556008)(55016003)(66476007)(122000001)(5660300002)(38070700005)(66946007)(316002)(26005)(83380400001)(110136005)(186003)(66574015)(52536014)(6636002)(2906002)(76116006)(66446008)(86362001)(508600001)(966005)(9686003)(82960400001)(54906003)(6506007)(53546011)(7696005)(8936002)(71200400001)(4326008)(33656002)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHlEYXltallTUXBTQnV5Y3BRcU1JcTdnMUh3TzIrL0E5c0VNeFJzUGdKY3h3?=
 =?utf-8?B?V3pxUEZ4QWV5M05DLzN2T2xBVzZWOWxDQnN3eWhqZlJJOGt4bFdJNFhJc1Vr?=
 =?utf-8?B?cWxia0J4NFpiS3BwU1U1cS9RZFphOXVrOHlSZjJWQStENXFPOExqR09IRmJY?=
 =?utf-8?B?U1R2cEt6TWhLcEZpQWdPS1JZVTY5UXpKcnF0NU5OYnhDQ0pvMC83TytITDR2?=
 =?utf-8?B?c2VyTkszMVVTVWxwUE1yd0pSQ2tLZklvV0FwNVFVY3JZalNvZXptS3JiZW5G?=
 =?utf-8?B?bDBRSDRNdGFGaTVHeFFSUmhhaUc2clN6Kzc3Ly9Kc1lEUC9zREltb0xlL2hU?=
 =?utf-8?B?SEV4eDV3eFM3WGppZGYzNEozOXZDVUxDcHQ2SVRPcTFCQmwvMk52NS9uRjIv?=
 =?utf-8?B?d09maHQzemhFN2ZJendPNDRFSmRIaktSeCszWE1ndHE2WkxoWVJSVHJBNGtS?=
 =?utf-8?B?SFNqRElxaDQ4NXhHUW5MRDB5YW1WaFQ3cWYvZ29TcDhMRFZXa1ZqbTYrR3pY?=
 =?utf-8?B?UnRNZGY4ODJHMWtUS0tZdHFNY0ZYSFhaT0lOQnpuZnl1ajZrdEkxUDNseXRY?=
 =?utf-8?B?Q2lhTTRhNjNZVzIwRHZ4WjFRbFhmVkRQQXZXK2RaVkxreDBPcDdSelJhYTRk?=
 =?utf-8?B?QldKMzU2cUExdlFHTTBGWkV1STF0NUQ3b1V6M0lOeWRNMStJQkw0MEhpaGE5?=
 =?utf-8?B?cGkvTGZpNVJsSDFFZExVUjVNOHNZd1U4TElnQWZ4WDl5aTNSUDdSL0c1cUdp?=
 =?utf-8?B?Y2Vod1NuNW95c3ROeG8raVp4OXAxL0NJYTNRN0hRdHp6cTBzYWlzNXE3cFg0?=
 =?utf-8?B?bjViY3FlQ2NDZnRDKytiV2I3NGoxbUNtNVNubXBNYVBkWmpmNE1xdzJneTl4?=
 =?utf-8?B?c2NkUmcxTUY3eEhIdE1qZ2xFaVBJdlFZMFpVUjQ3d2Vpbmd0UldCemZlVnp4?=
 =?utf-8?B?SEh0TVRCblF5ekUzRm43WjhjUUdMaG9RZXVNYTFsRnZrTDViZlVpL1dJVHhG?=
 =?utf-8?B?M25SY0ZkM2FRbnZmVE1Ha0FnTVR5WndyL01scVV2dnM5SGErSytYbENwZFYv?=
 =?utf-8?B?ZjNSVEdWSC84QnZ1dVNFbGhzb0Q2cXJYc3A3Z1VwRGxDSHk4djJpWkJ4RDRS?=
 =?utf-8?B?elpJVEhrZkVFSWJKalpJWlN6LytibEQ4K2Q4V0wrS2d5RElHMkNMRXl2Y0gy?=
 =?utf-8?B?S04zcmZEVUZZV3hHSEV4YWs1WWptSkJTdlQ4dWVzMUZaa2IvcjVGREY0NC90?=
 =?utf-8?B?b2xtZ05GSmhveDhrWVE0dXZwcVgxVTFrWnZLRWxJZHE3a1hWU3p0VTRMKzN4?=
 =?utf-8?B?bEg4bEFxbWJXWk9oTllzc1FUYUR4bEwwTTFycmlPaTArNkFIUEZyVWEybUFX?=
 =?utf-8?B?RXlIMEpMaWcrL0ZXeDArWHpLd01CN2NMcndMeGZGeVVlSzRTdis2WjE2MFVl?=
 =?utf-8?B?eUlRZVo5T1V1TEJLS2tVanpYTjNSaXFLM3FtUU5pTWppWWxneEp1aWhlaU5K?=
 =?utf-8?B?K0tNVzBBUzdMWnJqOU5iejIzbjV2UVVRNXJ0alVEZVpUcUkwajNsZXgyWDMv?=
 =?utf-8?B?K05hamZtbVZSMlpJZmp2Ym1oaDZhYnRxYW1aTFNTU3VuWGZsVTJFYXZPZ2pP?=
 =?utf-8?B?dzl4ait2dUN0YjIrYXpjL2NqVE9XZzg1dmkzQ3pJa0xxZS96RzFxTGFobXpE?=
 =?utf-8?B?MDNMaG5DejcwV1c5YnVuaVRRWXRySEZqQ3cyTHFDZHR1Rlk4aGJOWk9PcFZ2?=
 =?utf-8?B?T0RibGIrQXZPZGxwMVM1cmN3aDlnUVFzdXkrYTBKaUx5QjZET1pMcUZYeXBa?=
 =?utf-8?B?K1l5b1l4Vlc0VCtHbVE4eTBQMWVlZ3AxMjloeTZmSHdDenBwSU9OR3JwWldN?=
 =?utf-8?B?KzVvdzljc005RFJhc3B2enN4MkN1Y2xPZFFwVEVFNkxqcEIrZ3VYVS9zQ3FF?=
 =?utf-8?B?S1dERlY3SUpxcWU1dzk1VXp4anBlQTJDYTVLamJielhyTUUwdndEL2psaDVw?=
 =?utf-8?B?aHlQUHlxNlNiNlNoYjNIVHIvWXQzOU1pZ3dLa1NpNEpKQldGZEtzcWYrU2Fi?=
 =?utf-8?B?S1I2bitaNmgyZURhdHk4ajZLamFmQ0M3dFJBTm5lc1cvdVkrVmtnSXh4M1ZQ?=
 =?utf-8?B?ZXBqNng5ZmJNZkhZU1lHOUZBcFBRdzI0QnV0c2FKUkJLWVFYSzZINGVwdnNj?=
 =?utf-8?B?dFdtTzFObXcvK2xFNDdwUmVKd2NSNE1iUHhYdTNIVm1hUGswYUM3T3pXalVp?=
 =?utf-8?B?cDY2cjA4SnR6OE02c3pITlE4VXVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6736ea2e-fd23-4570-92e9-08d9bf120851
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 14:57:21.8110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRMdEFVYkVrpOcksCHS/rJr8cUKwH22G/bRHR85dLqMc/pGDb0gN4PVd+7sqlLTf70PMLNAUSb/QMyFbYKb71q9kF49TXr7s2J1I8lk7BzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1611
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Pk9uIDE0LzEyLzIwMjEgMTIuMjUsIE1hY2llaiBGaWphbGtvd3NraSB3cm90ZToNCj4+IE9uIFR1
ZSwgRGVjIDE0LCAyMDIxIGF0IDEwOjQwOjA1QU0gKzAwMDAsIEthcmxzc29uLCBNYWdudXMgd3Jv
dGU6DQo+Pj4gQWRkaW5nIEVkZXJzb24gYW5kIE1hY2llai4NCj4+Pg0KPj4+PiBPbiAxNC8xMi8y
MDIxIDA5LjA3LCBLYXJsc3NvbiwgTWFnbnVzIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+DQo+Pj4+Pj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0gRnJvbTogSmVzcGVyIERhbmdhYXJkIEJyb3Vlcg0K
Pj4+Pj4+IDxqYnJvdWVyQHJlZGhhdC5jb20+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTMsIDIw
MjEgMTA6MDQgUE0gVG86DQo+Pj4+Pj4gS2FybHNzb24sIE1hZ251cyA8bWFnbnVzLmthcmxzc29u
QGludGVsLmNvbT47IEJqw7ZybiBUw7ZwZWwNCj4+Pj4+PiA8Ympvcm5Aa2VybmVsLm9yZz4gQ2M6
IEJyb3VlciwgSmVzcGVyIDxicm91ZXJAcmVkaGF0LmNvbT47IFhkcA0KPj4+Pj4+IDx4ZHAtIG5l
d2JpZXNAdmdlci5rZXJuZWwub3JnPjsgT25nLCBCb29uIExlb25nDQo+Pj4+Pj4gPGJvb24ubGVv
bmcub25nQGludGVsLmNvbT47IEpvYW8gUGVkcm8gQmFycm9zIFNpbHZhDQo+Pj4+Pj4gPGpvcGJz
QHZlc3Rhcy5jb20+OyBEaW9nbyBBbGV4YW5kcmUgRGEgU2lsdmEgTGltYSA8ZGlvbGlAdmVzdGFz
LmNvbT4NCj4+Pj4+PiBTdWJqZWN0OiBBRl9YRFAgbm90IHRyYW5zbWl0dGluZyBmcmFtZXMgaW1t
ZWRpYXRlbHkNCj4+Pj4+Pg0KPj4+Pj4+IEhpIE1hZ251cyBhbmQgQmrDuHJuLA0KPj4+Pj4+DQo+
Pj4+Pj4gSSdtIGNvZGluZyBvbiBhbiBBRl9YRFAgcHJvZ3JhbVsxXSB0aGF0IG5lZWQgdG8gc2Vu
ZCAoYSBidWxrIG9mDQo+Pj4+Pj4gcGFja2V0cykgaW4gYSBzaG9ydCB0aW1lLXdpbmRvdyAocmVs
YXRlZCB0byBUaW1lLVRyaWdnZXJlZCBFdGhlcm5ldCkuDQo+Pj4+Pj4NCj4+Pj4+PiBNeSBvYnNl
cnZhdGlvbnMgYXJlIHRoYXQgQUZfWERQIGRvZXNuJ3Qgc2VuZCB0aGUgZnJhbWVzIGltbWVkaWF0
ZWx5Lg0KPj4+Pj4+IEFuZCB5ZXMsIEkgZG8gY2FsbCBzZW5kdG8oKSB0byB0cmlnZ2VyIGEgVFgg
a2ljay4gSW4gemVyby1jb3B5IG1vZGUNCj4+Pj4+PiB0aGlzIGlzIHBhcnRpY3VsYXIgYmFkLiAg
TXkgcHJvZ3JhbSB3YW50IHRvIHNlbmQgNCBwYWNrZXRzIGluIGENCj4+Pj4+PiBidXJzdCwgYnV0
IEknbSBvYnNlcnZpbmcgOCBwYWNrZXRzIGdyb3VwZWQgdG9nZXRoZXIgb24gdGhlIHJlY2Vpdmlu
Zw0KPj4+Pj4+IGhvc3QuDQo+Pj4+Pj4NCj4+Pj4+PiBJcyB0aGUgYSBrbm93biBwcm9wZXJ0eSBv
ZiBBRl9YRFA/DQo+Pj4+Pg0KPj4+Pj4gTm9wZSEgSXQgaXMgc3VwcG9zZWQgdG8gYmUgYWJsZSB0
byBzZW5kIG9uZSBwYWNrZXQgYXQgYSB0aW1lLCB0aG91Z2ggSQ0KPj4+Pj4gaGF2ZSBzZXZlcmFs
IHRpbWVzIHNlZW4gYnVncyBpbiB0aGUgZHJpdmVycyB3aGVyZSB0aGUgYmF0Y2hpbmcNCj4+Pj4+
IGJlaGF2aW9yIHNoaW5lcyB0aHJvdWdoIGxpa2UgdGhpcywgYW5kIG9uY2UgYSBidWcgaW4gdGhl
IGNvcmUgY29kZS4NCj4+Pj4+IFRoZXJlIGlzIGV2ZW4gYSB0ZXN0IHRoZXNlIGRheXMgZm9yIGp1
c3Qgc2VuZGluZyBhIHNpbmdsZSBwYWNrZXQsDQo+Pj4+DQo+Pj4+IFdoZXJlIGlzIHRoYXQgdGVz
dCBpbiB0aGUga2VybmVsIHRyZWU/DQo+Pj4NCj4+PiBJbiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9icGYveGRweGNlaXZlci5jLiBJdCBpcyB0aGUNCj5SVU5fVE9fQ09NUExFVElPTl9TSU5HTEVf
UEtUIHRlc3QuIEJ1dCB0aGUgZnJhbWV3b3JrIG9ubHkgb3BlcmF0ZXMgb24NCj52ZXRoIGN1cnJl
bnRseS4NCj4+DQo+PiBJJ2Qgc2F5IGl0J3MgZHJpdmVyJ3MgZmF1bHQuIE1hZ251cyBmaXhlZCBz
b21ldGhpbmcgc2ltaWxhciBmb3IgaTQwZToNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25l
dGRldi8yMDIxMDQwMTE3MjEwNy4xMTkxNjE4LTMtDQo+YW50aG9ueS5sLm5ndXllbkBpbnRlbC5j
b20vDQo+DQo+VGhhbmtzIGZvciB0aGF0IGhpbnQuDQo+DQo+Pg0KPj4gV2UgZG9uJ3QgaGF2ZSBj
dXJyZW50bHkgaWdjIEhXIG9uIG91ciBzaWRlIHRvIGRpZyB0aGlzIDo8DQo+DQo+SSBzdXNwZWN0
ZWQgQm9vbiBMZW9uZyAoY2MpIHdvdWxkIGhhdmUgdGhpcyBoYXJkd2FyZS4NCg0KVW5mb3J0dW5h
dGVseSwgbXkgY3VycmVudCBzZXR1cCBpbiBsYWIgZG9lcyBub3QgaGF2ZSBJMjI1IGhvb2tlZC11
cA0KYW5kIEkgYW0gd29ya2luZyByZW1vdGVseSBkdWUgdG8gY29udHJvbCBhY2Nlc3MgdG8gaW50
ZWwgZmFjaWxpdHkuIA0KUGVyaGFwcywgRWRlcnNvbiBtYXkgaGF2ZSByZWFkeSBzeXN0ZW0gdG8g
dGVzdD8NCg0KRm9yIFpDIG1vZGUsIHRoZSBpZ2MgZHJpdmVyIChhbHNvIHRydWUgdG8gc3RtbWFj
KSBkZXBlbmRzIG9uIHRoZSBYU0sgd2FrZXVwDQp0byB0cmlnZ2VyIHRoZSBOQVBJIHBvbGwgKGln
Y19wb2xsKSB0byBmaXJzdCBjbGVhbi11cCBUeCByaW5nIGFuZCBldmVudHVhbGx5IGNhbGwNCmln
Y194ZHBfeG1pdF96YygpIHRvIHN0YXJ0IHN1Ym1pdHRpbmcgVHggZnJhbWUgaW50byBETUEgZW5n
aW5lLiBXZSBoYXZlDQp1c2VkIGJ1c3ktcG9sbCB0byBlbnN1cmUgaW4gc21hbGxlciBUeCBmcmFt
ZSBsYXRlbmN5L2ppdHRlci4NCg0KVGhlcmUgd2FzIGFub3RoZXIgaXNzdWUgaW4gc3RtbWFjIHRo
YXQgd2FzIHBhdGNoZWQgWzFdIHJlY2VudGx5IHRvIGVuc3VyZQ0KdGhlIGRyaXZlciBkb2VzIG5v
dCBwZXJmb3JtIE1BQyByZXNldCB3aGVuZXZlciBYRFAgcHJvZ3JhbSBpcyBhZGRlZA0Kc28gdGhh
dCBiZXR3ZWVuIFhEUCBzb2NrZXQgY3JlYXRpb24sIHRoZSBUeCB0cmFuc21pdCBkb2VzIG5vdCB0
YWtlIGV4dHJhDQoyLTNzIGR1ZSB0byBsaW5rIGRvd24vdXAuIEplc3BlciwgYXJlIHlvdSBzZWVp
bmcgc29tZXRoaW5nIHNpbWlsYXIgaW4geW91cg0KYXBwPw0KDQpJZiB5ZXMsIHRoZW4gaXQgaXMg
bGlrZWx5IGJlY2F1c2Ugb2YgdGhlIGltcGxlbWVudGF0aW9uIG9mIGlnYyBkcml2ZXIgaW4gbWFp
bmxpbmUNCnRoYXQgaXMgZG9pbmcgaWdjX2Rvd24oKSwgYSBsaXR0bGUgYml0IHRvbyBhZ2dyZXNz
aXZlIGluIHJlc2V0aW5nIE1BQyBjb21wbGV0ZWx5LiANCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9uZXRkZXZicGYvcGF0Y2gvMjAyMTExMTExNDM5NDkuMjgwNjA0
OS0xLWJvb24ubGVvbmcub25nQGludGVsLmNvbS8gDQoNCj4NCj4+Pg0KPj4+Pj4gc2luY2Ugd2Ug
aGF2ZSBoYWQgaXNzdWVzIHdpdGggdGhpcyBpbiB0aGUgcGFzdC4gVGhhdCB0ZXN0IGRvZXMgcGFz
cyBpbg0KPj4+Pj4gYnBmLW5leHQsIGJ1dCBpdCBpcyBvbmx5IHJ1biB3aXRoIHRoZSB2ZXRoIGRy
aXZlciB0aGF0IGRvZXMgbm90DQo+Pj4+PiBzdXBwb3J0IHplcm8tY29weSBzbyBjb3VsZCBzdGls
bCBiZSBhbiBpc3N1ZS4gV2hhdCBkcml2ZXIgYXJlIHlvdQ0KPj4+Pj4gdXNpbmcgaW4gemVyby1j
b3B5IG1vZGUgYW5kIHdoYXQga2VybmVsIHZlcnNpb24gYXJlIHlvdSBvbj8NCj4+Pj4NCj4+Pj4g
RHJpdmVyOiBpZ2Mgd2l0aCBJbnRlbCBjaGlwIGkyMjUNCj4+Pg0KPj4+IEhhdmUgbmV2ZXIgdHJp
ZWQgdGhpcyBvbmUgcGVyc29uYWxseS4gRG8gbm90IGtub3cgaWYgSSBoYXZlIG9uZSBpbiB0aGUg
bGFiDQo+YnV0IGxldCBtZSBjaGVjay4NCj4+Pg0KPj4+IEVkZXJzb24sIGRvIHlvdSBoYXZlIGFu
eSBleHBlcmllbmNlIHdpdGggdGhpcyBjYXJkIGFuZCBpZiBzbywgaGF2ZSB5b3Ugc2Vlbg0KPnNv
bWV0aGluZyBzaW1pbGFyPw0KPj4+DQo+Pj4+IEtlcm5lbCB2ZXJzaW9uOiA1LjE1LjAtbmV0LW5l
eHQrICM2MTggU01QIFBSRUVNUFQNCj4+Pj4gICAgLSBEZXZlbCBicmFuY2ggYXQgY29tbWl0IDZk
M2IxYjA2OTk0NiAodjUuMTUtMTI4MDItZzZkM2IxYjA2OTk0NikNCj4+Pj4NCj4+Pj4+PiBIb3cg
Y2FuIEkgZ2V0IEFGX1hEUCB0byAiZmx1c2giIFRYIHBhY2tldHMgd2hlbiBjYWxsaW5nIHNlbmR0
bygpPw0KPj4+Pj4+IFNob3VsZCB3ZSBhZGQgYW5vdGhlciBmbGFnIHRoYW4gdGhlIGN1cnJlbnQg
TVNHX0RPTlRXQUlUPw0KPj4+Pj4NCj4+Pj4+IEluIHplcm8tY29weSBtb2RlIHdpdGggc29mdGly
cSBkcml2ZXIgcHJvY2Vzc2luZyAobm90IGJ1c3kgcG9sbCksIGENCj4+Pj4+IHNlbmR0byB3aWxs
IGp1c3QgdHJpZ2dlciB0aGUgeHNrX3dha2V1cCBuZG8gdGhhdCBzY2hlZHVsZXMgbmFwaSB1bmxl
c3MNCj4+Pj4+IGl0IGlzIGFscmVhZHkgZXhlY3V0aW5nLiBJdCBpcyB1cCB0byB0aGUgZHJpdmVy
IHRvIHRoZW4gZ2V0IHBhY2tldHMNCj4+Pj4+IGZyb20gdGhlIFR4IHJpbmcgYW5kIHB1dCB0aGVt
IG9uIHRoZSBIVyBhbmQgbWFrZSBzdXJlIHRoZXkgYXJlIHNlbnQuDQo+Pj4+PiBCYXJyaW5nIGFu
eSBIVyBxdWlya3MsIHNlbmRpbmcgb25lIHBhY2tldHMgc2hvdWxkIGJlIHBlcmZlY3RseSBmaW5l
Lg0KPj4+Pg0KPj4+PiBJIHdpbGwgaW52ZXN0aWdhdGUgZHJpdmVyIGxldmVsIGlzc3Vlcy4NCj4+
Pj4NCj4+Pj4gSSBoYXZlIG90aGVyICgxMDBHKSBOSUNzIGluIG15IHRlc3RsYWIsIGJ1dCBJJ20g
dXNpbmcgdGhlc2UgMUcgTklDcyBiZWNhdXNlDQo+Pj4+IHRoZXkgc3VwcG9ydCBoYXJkd2FyZSB0
aW1lc3RhbXBpbmcsIHdoaWNoIGFsbG93cyBtZSB0byBpbnZlc3RpZ2F0ZQ0KPnRoZXNlDQo+Pj4+
IHRpbWluZyBpc3N1ZXMuDQo+Pj4+IEknbGwgZmluZCBhIHdheSB0byBzZWUgb2Ygb3RoZXIgZHJp
dmVycyBiZWhhdmUgZGlmZmVyZW50bHkuDQo+Pj4NCj4+PiBXb3VsZCBiZSBncmVhdCBpZiB5b3Ug
Y291bGQgY2hlY2sgaWYgdGhlIHByb2JsZW0gYWxzbyBleGlzdHMgb24gZS5nLiBpY2UuDQo+Pj4N
Cj4NCj5IYXZpbmcgaXNzdWVzIGdldHRpbmcgbXkgSUNFIGhhcmR3YXJlIHRvIGxpbmsgdXAuDQo+
DQo+SSB0ZXN0ZWQgdGhhdCBkcml2ZXIgaTQwZSB3b3JrcyBhcyBleHBlY3RlZC4gVGh1cywgdGhp
cyBpcyBsaWtlbHkgYW4NCj5pc3N1ZSB3aXRoIHRoZSBkcml2ZXIuICBJIHdpbGwgZGlnZyBzb21l
IG1vcmUuDQo+DQo+DQo+Pj4+Pj4gSGludCwgSSdtIHVzaW5nIHRjcGR1bXAgaGFyZHdhcmUgdGlt
ZXN0YW1waW5nIG9uIHJlY2VpdmluZyBoaXN0IHZpYQ0KPj4+Pj4+IGNtZGxpbmU6DQo+Pj4+Pj4N
Cj4+Pj4+PiB0Y3BkdW1wIC12diAtczAgLW5pIGV0aDEgLWogYWRhcHRlcl91bnN5bmNlZA0KPj4+
Pj4+IC0tdGltZS1zdGFtcC1wcmVjaXNpb249bmFubyAtdyBhZl94ZHBfdHhfY3ljbGljLmR1bXA0
Mg0KPj4+Pj4+DQo+Pj4+Pj4gTm90aWNlWzFdIG9uIHNwZWNpZmljIGJyYW5jaDoNCj4NCj5bMV0N
Cj5odHRwczovL2dpdGh1Yi5jb20veGRwLXByb2plY3QvYnBmLQ0KPmV4YW1wbGVzL3RyZWUvdmVz
dGFzMDNfQUZfWERQX2V4YW1wbGUvQUZfWERQLWludGVyYWN0aW9uDQo+DQo+SW4gWzFdIEkgdHJp
ZWQgdG8gcGxheSB3aXRoIFNPX1BSRUZFUl9CVVNZX1BPTEwsIGJ1dCBpdCBkaWRuJ3QgbWFrZSBh
DQo+ZGlmZmVyZW5jZS4NCj4NCj5bMl0gaHR0cHM6Ly9naXRodWIuY29tL3hkcC1wcm9qZWN0L2Jw
Zi1leGFtcGxlcy9jb21taXQvMzY4NWQ1ZWE5M2ZjZWQNCj4NCj4tLUplc3Blcg0KDQo=
