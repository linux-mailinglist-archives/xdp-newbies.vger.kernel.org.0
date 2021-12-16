Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB5B476C06
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Dec 2021 09:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbhLPIec (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Dec 2021 03:34:32 -0500
Received: from mga03.intel.com ([134.134.136.65]:56436 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232474AbhLPIeb (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Dec 2021 03:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639643671; x=1671179671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zlMZADJ5qzJrxyRoD+fWJ3yY9WJ/4SKfDHoFjKrSOoI=;
  b=b3aJJUDBHEmsPA3zpoemo7r2RftwGEocUAttzwXKKmbt87qq45S+PrT+
   BySbqw54DBjQcIMDiPsF2IdKNJ9TIdQKTWxFYmUc3GmwUPy2KANLAxSbu
   MhChKnU9PW1tuwOHg0ph7TL4VjZAbR4PHpkmP24sxJ6vLxMtGX5RaI/1V
   SJH0bmfvG2us5NynGT8iXHPYJVkeIG0wBX14v+dtOSm+ZZfBWMABQGmbH
   FNT9CYPTWMyPB3N1/49NeBZanwEWmpHO4WPfj0GfCx99pTBoBShPZLM6v
   Z3HrrxglwzY4JzBpTtHw7DwEWQLlIMYq7shyL9zRFwg5DZPvOu4X4Rm93
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239388499"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="239388499"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 00:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="755774691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2021 00:34:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 00:34:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 00:34:30 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 00:34:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRUzbkwGUFw8+s2FqsbM5Axk92iMqG+HzjF2aloJo5eRN4JpIJlvMYCRy4mtxnr3czFpQ3nZANRiBw5uBbqgygQW9gWSzxhWL6eYh8jWHldJkR6pP6Lg3nzkfgWBA3Z0GYCyvl/JvrdmhmSTOljeKZTnThkIPtfOOHAqF5fM5f7I8IVAJbuJqLjuuxJJEJgShK82i3oPCvLe6mlk+ZCtuiaaYXitAopCElInHuh/HDYDjAU/3Sd4C0HGr7cUKGq6XanyF1bqe9/Eb+4sW0jwf8n1x+USxutyU4stV/Vo43zW+5I13hLV9rcbIs09BjnF3oPihjAb06V2IbvhGXwf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlMZADJ5qzJrxyRoD+fWJ3yY9WJ/4SKfDHoFjKrSOoI=;
 b=Fpjd7jrdwNgiqyz1wsT09MRIvf2L060mgGVprrFX1qpjBITkr31iUi2c1gKOtyM6FB4Nze48P0iS7wdxhzoMd1sXu7bjKf0IPZ/eF/Ai+ncDzwisPjWUB66dn0/xGXOdSW5y4JDAivIVrCUH7kgx4Yr00ATJeYhA+XT0rUhMJgniuywIorK2pjrovEHgC/2pJXY6I4nl0wTWByz2DWmhQfbdsy9TwbandROtzQcGpmP7h6+aDXXOgrb+N53jZEbT05VuTS/mTqY60vZ8sU7eAZNPTgTM8to5Kqh2ORCOlOo/UbxHeHWbKmL2kYvi6rCJ3IL/ljlwFOqFRt/l9b/VSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 08:34:23 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e%3]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 08:34:23 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Subject: RE: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUHNSZY1C3+jUCqvu6qhHX+16wxn+nQgAG5WACAAAyfYIAAZuGAgAD+2PA=
Date:   Thu, 16 Dec 2021 08:34:23 +0000
Message-ID: <MW3PR11MB4602206699A28A59038D21E5F7779@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
 <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
 <9e18a444-e30f-4ae8-4e3b-af5e9393e971@redhat.com>
 <MW3PR11MB460208C3A86CF7D4B9B2E1C3F7769@MW3PR11MB4602.namprd11.prod.outlook.com>
 <2eeb6d48-09b6-993b-d324-d2fc14cbb12b@redhat.com>
In-Reply-To: <2eeb6d48-09b6-993b-d324-d2fc14cbb12b@redhat.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjIzMTY4ZDItOWFlNy00YjQ1LTlmYWItN2FlYTQ2ZDMxOTlkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWVk0WnJ1YjVBN2Frc2FoTmozOURMT28rMnd5ZXcxRWRzbUZ6VnBLcmpNM1RTaXc4emRNNkVySDE3RGNyeGtkRCJ9
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-ctpclassification: CTP_NT
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91cc6c11-e6ab-4b20-31b1-08d9c06edd1d
x-ms-traffictypediagnostic: CO1PR11MB5169:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB51699F8A86E2DBA4A0793CEEF7779@CO1PR11MB5169.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPkW/6rAUfJblldlyE/6JriK5E+aso+nF2kKFIYgvGYde7SUOCfa+TvDwXMS80A4oOZSQ4HRLanIW1SrgOObV7nKeYM3RJbbFqSWa5jItvsZkKrDPO+Zmdv5o7BI493BGDCX0WaB17YNtBxM16LZss1fC2xiT+k21kGBG+iBGKfLbf5jM/56kRhkyhxved/wFi5DBclzSVqlWsjqoJQoywaLYL74ngmyqCAR76nC4tiC5S46pyIvV/Go+Rs2ZbUsgUwszuTLtioqFs8H2x9Mu9X2ImuZXXavkTsOQOGDCNRqyDyGORw76wj6SMdXwV2N0gUJDaiSfnY1GvtnT3TY6J+770kEcpcUGpI5nXvBgojLskjY7R3PJE99S1P0NGkMrUkQ0WPwVLhKfsomeiLbFcMhFBenKlpjIl4dOps9fjkOoVTf4ph6stRrOAVWjiFz5QB4MLF6Qwacz20SNj1IriIam9SOVpKI3RyWpFYTjUUXXpWTNntjFHySq6DgOS4t3cge0BuKVufaIqG3oFlHLOZr8Daudd7WywYNp533W8KYxha+GLJZno/mg97zrZBoXjxUGnwhPB5PyFDDYeE+5xCG+FBoUkjnMnRAc+MlsS4EyA8J+eAFiwO4p8dNH9kJm5XV7F8BzRvk3KM+hu+20ljrio05iQElK8WDu3yyRGMaa+hGQDRQ9uCOjycrrdNI7+kqTw6tig9/DrUzQYLfX+RgfOJJrJCEGfb2Emx6oFw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(66556008)(107886003)(5660300002)(26005)(55016003)(6506007)(9686003)(52536014)(53546011)(66946007)(66476007)(76116006)(86362001)(508600001)(4326008)(33656002)(82960400001)(2906002)(7696005)(186003)(38100700002)(8676002)(8936002)(110136005)(66446008)(54906003)(64756008)(71200400001)(122000001)(38070700005)(66574015)(316002)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE5zR01TV3FOS1JBVG9Wek1UNTl0bjc1eHhDSUM3WVZINkFXN3pudXV1clUz?=
 =?utf-8?B?TjgwT1M2L2lCeHBqLzVlRTlMWGJlbHpEUVNSQ3FDNmNJOHVTbFUweGpXYnQw?=
 =?utf-8?B?eFZYcWN3Sk1IMlZHdEVGQ28xdTRwbHF3cDJuUVpxSnJDTVBuRitiUWt5UlNx?=
 =?utf-8?B?bXJQUlFRaENCVjV6M29xWGpUT2IySk5YMXFCRC9qQU4vckJXWldiWFRxRURv?=
 =?utf-8?B?SjArNFUyNDVJTVpzV3FQS0ZMOVk5M3d5SjVGU3R3OHltSWN0VjluWFFrUUZo?=
 =?utf-8?B?V0QwcElLQ2RDUWlrVm5UNnI5QS9mSWhuRTFUNllkRGJsQXhzb2l0UXZKdmV4?=
 =?utf-8?B?bFRXQWlPcTcvS3VqUEQ4b21ud1RqWWgwanNRbSsrZkpTQUZBVUs0eWtZMm5W?=
 =?utf-8?B?dmh5TE9vUUJ6Z2NjVGVtYjFraTJWeTFHbDRGU1RFdHpNUTgyYnNuVVdwTEhz?=
 =?utf-8?B?bXZVZHBiUm9EeDBuVmtuRVF1azVUeHhna0lSdERYWmpxblJpQ2Nsc1l6aVRt?=
 =?utf-8?B?UzEyZnIwcmwzcmNmMU94cjVkU2lVVDZLQ21XRG5md2ZMbUJwTWlVZE5TTHBm?=
 =?utf-8?B?RzcyUCt4bGRIT3RSRmxRaEZGVCt0YmdaWVY0MndxNmNmUjEyYWpZV3lVQ1Fp?=
 =?utf-8?B?VVNyUGZTZWp3TEtIQWtyUkxjZjhBRlYxVW5wc1krd3pkSWNXcjVwMVVuZ2Nl?=
 =?utf-8?B?dWphV1dhR1dBcWppS1ZVWWdScVl0YXV6cTBlbldDd09odjI5bmEwaFFBWTJ0?=
 =?utf-8?B?UzFKSzE0SG9iTW5aYmRIczhPTVUyaVlja3N4cmZwa1NNMExKYU0zcm0rWnBM?=
 =?utf-8?B?cldBVXdoelo5eVV4amUwUXF3NjdwUTUrN0dEdUljZWFjemRxd1ZkRDduRVF2?=
 =?utf-8?B?dmUvY2xOWk16bWZscmhreTB0S1RKc1UzOGhHb3Fudmo0dENxTVRGdERFdElD?=
 =?utf-8?B?VEV5cGNGVWtzZjVJc0VIWmpLQVlSTzY3RVVLTjVtRUw0bDJEZEdOSE9GSUxX?=
 =?utf-8?B?ZWE1RUMyTUl4Ly8rK2ovRS9qNDU0VEEyWWlqR25kYXJIM21vcnlZaDBoa0tz?=
 =?utf-8?B?ajhNeFEraVRseXp1ejdNNm5yUEt4dmNGeUs2M0NpMUlUMmVxRHEwOW1yaWhr?=
 =?utf-8?B?a2lQcWJPeDdvdjc4UGU3VUxPelZxOFFKUDRrL2NvQW8ybWkvcHI1S3k1d2Z6?=
 =?utf-8?B?dy9JNzE1WGVTNStsZVNHa29pOGhJeDFsVjRSUGR2SkRSbTZ1Z3VPd096cDJk?=
 =?utf-8?B?SjBGRnRRalJPYWR4MHRMWkUwRm43QUI3YXBFTXZ3Z0EwWGJTYkVOZXFLWjN2?=
 =?utf-8?B?STVqN3Jmb1dEUTI1NGtEeklkWCtCbEoxcW1xZURkZmVGYlpxWGlJSmlHdFdo?=
 =?utf-8?B?a0M5NDlxQkRpV0ZoRXZ6NHBSU3lSYzdTa0ozdncya2dDZmpMUTBmYzQxdlJh?=
 =?utf-8?B?K0NTNjE0d0dBblFaUzRXdUNJQ1NSVitBLzBONjZ5bUpVVmZoSVZsMnV0TkNJ?=
 =?utf-8?B?Mm1jTTZsRTkwdStldzVrUlVKcjhUZVlKN0tVa05KVVlXQTRZelJyQkM5OFdD?=
 =?utf-8?B?aDI3eDNlSXRwQjdKS3pIUWRJcFduYzdIMVk5a25JUmhtSXRFYnlFOGFCNE9H?=
 =?utf-8?B?ek5hRitWRGNUNEhRblZUM0hZQW9RaFc5S2dheXV4eDVUMk5YMVRueGNHdFpq?=
 =?utf-8?B?VU00cFl5SkdNbkl6RmpiazZwZktrTlNaUzFzY3VrSXFpK2pCcFpwQ0Rjb0lp?=
 =?utf-8?B?VDQ4YTRHMjNscTE5Umh1RDlHRDg2bE1tVXVSNkRzTkZBZGp3Qmh0c0Y1aUxT?=
 =?utf-8?B?b1lDeXdrUTR0QjB3TW0wYnlSd1VmKzl2R3laL0YyaDM2cytORWhZb2ZtdUxL?=
 =?utf-8?B?VVFoRUJ6aUIrOEV0bVkxQnFpdURDRjVETElRckxHQlgzN3VIU1RrMEdZRHVU?=
 =?utf-8?B?Qi9XMDZpQU5ZVlV1TTRUdXFEbjJoK3pGS0xlNXRGdDBKZU1RUStLL2VvY2Y2?=
 =?utf-8?B?c3J3OUxiNEg4RkwxM3hYNmVxTVpCYjZqT2lVejFyTVNZQmlkS1V5LzJ4VWJ2?=
 =?utf-8?B?Nk5GQVAvSlBEdnlZejBuVWlvTERHcUJ6VEwxQTNyMzhRL1FOcnhwVE5ZMm1Z?=
 =?utf-8?B?UXE0MGVaUStYK3VJbGNmVHc1S1ZxNVp2SklBRTFvNjBMelFHTUx5YklnRUgx?=
 =?utf-8?B?T1psRFUwWmMxZm9rdjB4b2xQajUzNWJrNk9weFlsbWVWUkVFdWkxZFBBQ3FT?=
 =?utf-8?B?QlBuMlNjUkpyUjYzQWR6NjMxSkxnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cc6c11-e6ab-4b20-31b1-08d9c06edd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 08:34:23.6795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwhAK0neHM9M95IOcwLFnEeFuGs/1yrfitWvRzaxX0ki9Yjssk5j2FVw8BkOnSH9vNqzQIWxnkARHw7QjgcUYJArQhrUvwGNTSUbck785dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVzcGVyIERhbmdhYXJk
IEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVy
IDE1LCAyMDIxIDY6MTEgUE0NCj4gVG86IEthcmxzc29uLCBNYWdudXMgPG1hZ251cy5rYXJsc3Nv
bkBpbnRlbC5jb20+OyBKZXNwZXIgRGFuZ2FhcmQNCj4gQnJvdWVyIDxqYnJvdWVyQHJlZGhhdC5j
b20+OyBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPg0KPiBDYzogQnJvdWVyLCBKZXNw
ZXIgPGJyb3VlckByZWRoYXQuY29tPjsgWGRwIDx4ZHAtDQo+IG5ld2JpZXNAdmdlci5rZXJuZWwu
b3JnPjsgT25nLCBCb29uIExlb25nIDxib29uLmxlb25nLm9uZ0BpbnRlbC5jb20+Ow0KPiBKb2Fv
IFBlZHJvIEJhcnJvcyBTaWx2YSA8am9wYnNAdmVzdGFzLmNvbT47IERpb2dvIEFsZXhhbmRyZSBE
YSBTaWx2YSBMaW1hDQo+IDxkaW9saUB2ZXN0YXMuY29tPg0KPiBTdWJqZWN0OiBSZTogQUZfWERQ
IG5vdCB0cmFuc21pdHRpbmcgZnJhbWVzIGltbWVkaWF0ZWx5DQo+IA0KPiANCj4gDQo+IE9uIDE1
LzEyLzIwMjEgMTIuMDcsIEthcmxzc29uLCBNYWdudXMgd3JvdGU6DQo+ID4NCj4gPj4gRnJvbTog
SmVzcGVyIERhbmdhYXJkIEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPiBPbiAxNC8xMi8yMDIx
DQo+ID4+IDA5LjA3LCBLYXJsc3NvbiwgTWFnbnVzIHdyb3RlOg0KPiA+Pj4NCj4gPj4+Pg0KPiA+
Pj4+IEknbSBjb2Rpbmcgb24gYW4gQUZfWERQIHByb2dyYW1bMV0gdGhhdCBuZWVkIHRvIHNlbmQg
KGEgYnVsayBvZg0KPiA+Pj4+IHBhY2tldHMpIGluIGEgc2hvcnQgdGltZS13aW5kb3cgKHJlbGF0
ZWQgdG8gVGltZS1UcmlnZ2VyZWQNCj4gPj4+PiBFdGhlcm5ldCkuDQo+ID4+Pj4NCj4gPj4gWy4u
Ll0NCj4gPj4+DQo+ID4+Pj4gSG93IGNhbiBJIGdldCBBRl9YRFAgdG8gImZsdXNoIiBUWCBwYWNr
ZXRzIHdoZW4gY2FsbGluZyBzZW5kdG8oKT8NCj4gPj4+PiBTaG91bGQgd2UgYWRkIGFub3RoZXIg
ZmxhZyB0aGFuIHRoZSBjdXJyZW50IE1TR19ET05UV0FJVD8NCj4gPj4+DQo+ID4+PiBJbiB6ZXJv
LWNvcHkgbW9kZSB3aXRoIHNvZnRpcnEgZHJpdmVyIHByb2Nlc3NpbmcgKG5vdCBidXN5IHBvbGwp
LCBhDQo+ID4+PiBzZW5kdG8gd2lsbCBqdXN0IHRyaWdnZXIgdGhlIHhza193YWtldXAgbmRvIHRo
YXQgc2NoZWR1bGVzIG5hcGkNCj4gPj4+IHVubGVzcyBpdCBpcyBhbHJlYWR5IGV4ZWN1dGluZy4g
SXQgaXMgdXAgdG8gdGhlIGRyaXZlciB0byB0aGVuIGdldA0KPiA+Pj4gcGFja2V0cyBmcm9tIHRo
ZSBUeCByaW5nIGFuZCBwdXQgdGhlbSBvbiB0aGUgSFcgYW5kIG1ha2Ugc3VyZSB0aGV5DQo+ID4+
PiBhcmUgc2VudC4gQmFycmluZyBhbnkgSFcgcXVpcmtzLCBzZW5kaW5nIG9uZSBwYWNrZXRzIHNo
b3VsZCBiZQ0KPiA+Pj4gcGVyZmVjdGx5IGZpbmUuDQo+ID4+DQo+ID4+IFRoaXMgYWN0dWFsbHkg
ZG9lc24ndCBzb3VuZCBzbyBnb29kIGZyb20gbXkgY3VzdG9tZXJzIHVzZS1jYXNlIFBvVi4NCj4g
Pj4gVGhhdCB3ZSBvbmx5IHRyaWdnZXIgYSBuZG9feHNrX3dha2V1cCB0aGF0IHNjaGVkdWxlcyBu
YXBpLg0KPiA+Pg0KPiA+PiBXZSB3YW50IHRvIHRyaWdnZXIgSFcgdHJhbnNtaXNzaW9uIGltbWVk
aWF0ZWx5LiBDYW4gd2UgYWNoaWV2ZSB0aGlzDQo+ID4+IHZpYSB1c2luZyBidXN5LXBvbGwgbW9k
ZT8NCj4gPg0KPiA+IFllcywgYnV0IG5vdCB3aXRob3V0IG5hcGkuIFRoZSBuYXBpIGNvbnRleHQg
d2lsbCBpbiB0aGlzIGNhc2UgYmUNCj4gPiBleGVjdXRlZCBpbiBwcm9jZXNzIGNvbnRleHQgcmln
aHQgYXdheSwgdW5sZXNzIGl0IGlzIGFscmVhZHkgcnVubmluZw0KPiA+IHNvbWV3aGVyZSBlbHNl
IGJ1dCB0aGF0IHNob3VsZCBub3QgYmUgdGhlIGNhc2UuIFdpbGwgdGhpcyBiZSBnb29kDQo+ID4g
ZW5vdWdoPw0KPiANCj4gIlRpbWUiIHdpbGwgdGVsbCBpZiBpdCBpcyBnb29kIGVub3VnaCAocHVu
IGludGVuZGVkKS4NCj4gTWVhbmluZyBJIHdpbGwgaW1wbGVtZW50IGFuZCBtZWFzdXJlIGl0Lg0K
PiBUaGUgYnVzeS1wb2xsIG1vZGUgZG9lcyBzb3VuZCBsaWtlIGEgd2F5IGZvcndhcmQuDQo+IA0K
PiBMb29raW5nIGF0IGtlcm5lbCBjb2RlLCBJIGNhbiBzZWUgdGhhdCBkcml2ZXJzIFRYIE5BUEkg
dXN1YWxseSBkb2VzIERNQS1UWA0KPiBjb21wbGV0aW9uICpiZWZvcmUqIHRyYW5zbWl0dGluZyBu
ZXcgZnJhbWVzLiAgVGhpcyB1c3VhbGx5IG1ha2VzIHNlbnNlLA0KPiBidXQgZm9yIG91ciB1c2Ut
Y2FzZSBvZiBoaXR0aW5nIGEgbmFycm93IHRpbWUtc2xvdCwgSSB3b3JyeSBhYm91dCB0aGUgaml0
dGVyIHRoaXMNCj4gaW50cm9kdWNlcy4gIEkgd291bGQgbGlrZSB0byBzZWUgYSBtb2RlL2ZsYWcg
dGhhdCB3b3VsZCBhbGxvdyB0cmFuc21pdHRpbmcNCj4gbmV3IGZyYW1lcyAoYW5kIGFmdGVyd2Fy
ZHMgaW52b2tpbmcvc2NoZWR1bGluZyBUWC1jb21wbGV0aW9uLCBlLmcuIHZpYQ0KPiByYWlzaW5n
IHRoZSBzb2Z0aXJxL05BUEkpLg0KPiBXZWxsIHRoaXMgaXMgZnV0dXJlIHdvcmssIGZpcnN0IEkg
d2lsbCBtZWFzdXJlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uDQoNCk1hY2llaiBoYXMgYmVlbiBl
eHBlcmltZW50aW5nIHdpdGggdGhlIGljZSBkcml2ZXIgdG8gZG8gc2VuZGluZyBmaXJzdC4gQ29t
cGxldGlvbnMgYXJlIG9ubHkgZG9uZSBsYXppbHkgd2hlbiBuZWVkZWQgdG8gbWFrZSBzdXJlIHRo
YXQgdGhlcmUgYXJlIGFsd2F5cyBhIG51bWJlciBvZiBkZXNjcmlwdG9ycyBhdmFpbGFibGUgZm9y
IHNlbmRpbmcuIFRoaXMgeWllbGRzIG11Y2ggYmV0dGVyIHRocm91Z2hwdXQgYW5kIGlzIHRoZSBz
dHlsZSB0aGF0IERQREsgdXNlcyBmb3IgaXRzIGRyaXZlcnMuIEhvcGVmdWxseSwgdGhpcyB3aWxs
IGFsc28gaW1wcm92ZSBsYXRlbmN5LCB0aG91Z2ggd2UgaGF2ZSBub3QgbWVhc3VyZWQgdGhhdC4g
Q291bGQgYmUgYWRvcHRlZCBmb3IgdGhlIGlnYyBkcml2ZXIgdG9vIGlmIHRoYXQgaXMgdGhlIGNh
c2UuDQoNCj4gLS1KZXNwZXINCg0K
