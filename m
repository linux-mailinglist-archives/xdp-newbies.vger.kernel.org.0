Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85042473DF6
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Dec 2021 09:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhLNIHK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Dec 2021 03:07:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:16369 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhLNIHJ (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Dec 2021 03:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639469229; x=1671005229;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wkp8tX+511GBk8aRgI7WQzdvbPHO/vhQ1Y5/z+/Nu64=;
  b=D+UiZEYmT3CnX8a3XCkYRHNDq+HlCaEszQL3QtR10/KQu7+ynEf4BCZO
   xq0bMJYi3ssq0IuYM2HaSFXacLWZV3Rol6dsMvvrkkSgPs2vQbXXbDvU9
   HHT2hzotUQjNooBVb3UJHbAilha2bqro4sX3JWPqKqMb4CW8HzdNjB3C/
   AqI74kOS6v0FCo6VFOFXN6fJRUu6OBp/q5RF9gwDlgOAVVKq+4hmfaQvs
   4gnmaG73bC+zvlFJBuvldpUZ39qAuMjj/ErIq+lNI0a8xCtbcJFYEEN2x
   BOR9ngfG81oo6KtPPbEVhMUAadkaHL4weysJF5azxCrwaDRAORzAVCr1y
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238735295"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="238735295"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 00:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="604155522"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2021 00:07:09 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 00:07:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 14 Dec 2021 00:07:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 14 Dec 2021 00:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEyS/0v7UwOqDMbbCV6stcuiE9x1JSR+y1IAwoZybfSi0VAF/7yrnuOyfqcFmnhyUhsHsNi4Eg3PrzJYc8KGzAF5kmwsHTj6beCzWDu+fGmA6BaDRYo8NwI4VQc664Zd8yIcS+RPKA8eG6ArhHBEgBt+AUtP+U5g6NsaJ3+TM9yqCnblJGYxX+svZTNsOr77v77gWK9faBQCy9SM3i+KHBcu3PO4bbli5ePEe6dnwdd7+Iu+VhQTdn+rLBDK0+wrN5wQynI2IT07TVTCV2+rSTG6xfnyY3lkucjABdL/uzpGqj0CNMUB5/tPuDh7S9ZcUlUGy8JgAG48Vi0byQUk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkp8tX+511GBk8aRgI7WQzdvbPHO/vhQ1Y5/z+/Nu64=;
 b=EkQlhy2ZjaIVqnMPrxNTNx7KdKMJQohyKMAgeH+KW23TMAto7PjHDeBNVbMhPmPmfp/3xI+56sM5wcUp/yla+UErUAMRsW7pR5zygZ+IqbmKId9GDvO2ynh03hAaFwN62jJ0kL/mqCJugsIoJV/Pb/ZunWKlw5kuUyYCfhb0BnaH7AgTQBAQxBcp5X3fEbW3WzfzvXl+ntVoX1YckdbdusIUcy7iUo6SAoDdM9Z08R8qlf6xVW2GYbRip/OVTAnlIXE/s8jo1yNHZT3p/a/iRzRONyMKcPagijEMr70tIwFj8IakwSqJhAbyuIMisNe+se2viD3Gn7n8Y7f+Hd07Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkp8tX+511GBk8aRgI7WQzdvbPHO/vhQ1Y5/z+/Nu64=;
 b=V7/DcnY/nWa4n3VPZA7xeeUZFh6d0c+sENNlfcfj+5JRX6jDcTEBJZH7I+ivffOtToeua535KcKfcyoikQkFKDlLddcF97QaMvjvzPf0rNWYdIXUZukSs3RHpaqwXlOOdYqoMmpKc5K1V0W5YGFVxZ8YlHx0a6Ed2tu/bDN8oeY=
Received: from MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 by MWHPR11MB1630.namprd11.prod.outlook.com (2603:10b6:301:e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:07:06 +0000
Received: from MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e]) by MW3PR11MB4602.namprd11.prod.outlook.com
 ([fe80::21eb:b61c:3aa8:f9e%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 08:07:06 +0000
From:   "Karlsson, Magnus" <magnus.karlsson@intel.com>
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
CC:     "Brouer, Jesper" <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "Ong, Boon Leong" <boon.leong.ong@intel.com>,
        Joao Pedro Barros Silva <jopbs@vestas.com>,
        Diogo Alexandre Da Silva Lima <dioli@vestas.com>
Subject: RE: AF_XDP not transmitting frames immediately
Thread-Topic: AF_XDP not transmitting frames immediately
Thread-Index: AQHX8GUHNSZY1C3+jUCqvu6qhHX+16wxn+nQ
Date:   Tue, 14 Dec 2021 08:07:05 +0000
Message-ID: <MW3PR11MB46022F959CBD59B5FFF1D299F7759@MW3PR11MB4602.namprd11.prod.outlook.com>
References: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
In-Reply-To: <d1d29113-622c-f245-c4cd-b1bf690d2dc2@redhat.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjQ1OTczYjQtM2YyNy00YzA2LWEyZTYtY2QxMjI1NzhlOTg2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieDYzREFZVXNqTmNOUnR1Tk9WUGFYNEh0cjBnWXA2NWY3Y09RTktvTWJqQTJYSU9xNUQ5V1d1dFZjRWN4XC83Q0EifQ==
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-ctpclassification: CTP_NT
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28818426-5594-4651-5387-08d9bed8b81a
x-ms-traffictypediagnostic: MWHPR11MB1630:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB163008CEFD9C0C9733FF8539F7759@MWHPR11MB1630.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BqjeckQ73ni0XvesBw6Oi9TYjrc4Xylf6WXaWZczEbGHgR1OScmbmrNHFFpG/ktp2HJrm0qfNnF+583LZuWUtX7TkKJVitOiBbTdRThg2FLODcNtwhQZtbg/2SYwfhk5EiW5HkF08rzNLPR5BAGJheLmN8YEHT+llfeTMLckxnF+DKyKmZjsH7WikbmFjk3uF44MqowcXDvbjV6jIFyIbh7JcRD9mff7Rw7sc2X3Lm0vGEsnG/YZafFn4kka+C/W088M4xQms81DV4VTDM1e4kNRborT+Boq5sLHeUXs/NI9yMa9gXYmLLmnbJC6tKGSDnINZ2D4WtYFARyK2Tphvp5KL+r9GI5jvyPSG0y9Y6kwHwkL/TNyzZtBElozGQaew61iCL7BWv6eimRFYHfpeymM+2By0nZx2qcZnVgBMDQQ/GITkxbrJi7ph1QXC9oZKh3thxgLqGujUFM5F8xnDE6qvHdadkqcD+PsswYbqJ9VvnY1SIQOr+ENdgY9SDG/7Xxme2BzYF9zFov3tq+o/opy/q+ASD3EtEpIOtc+2bsp9seWDLS8jjY1BTiuNVPhqZWeItNDesB+IlXtp3VCur8Der+SikN2nqtNOI4xqOsl84tD1ybMwqDce79YIFdnALEN8GPwLOCt6bW7+RiPN3Pvi7hfRAfdpHUa2vBuL1ZpKJVbZNYOVpuRp0AcRtm+lD275ulPYbNug6leUcoKL5nzbxwOT9G6zZr+V2gdWMxUnQBD0j2mWW7foRnqQv1Sc/kQ2tEvbNezoi6L8aD7qHWAcSe++iZ8BdVBm5A6oLVczRZsyDagr0gR9iCA7PeA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(33656002)(8936002)(966005)(82960400001)(9686003)(4326008)(8676002)(38100700002)(122000001)(53546011)(6506007)(86362001)(186003)(2906002)(508600001)(26005)(83380400001)(71200400001)(76116006)(66556008)(66476007)(66446008)(64756008)(38070700005)(66574015)(7696005)(54906003)(316002)(55016003)(52536014)(110136005)(66946007)(14773001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW5oVExFWmlWOURZVHBRaTdvTlQ0V1JUTUUzMzJ3OGNlVXpEUVJtMDRNc09X?=
 =?utf-8?B?WUVZeU9rTmd2RWh1d1V3MFRrV1J1Rjl3MDZQTWJtUmhKcTE2WFphZldrU0Nh?=
 =?utf-8?B?a2tVOFBRRVdIcW15SjNob0JOSGcrYkJhT243UW5lWVhJNzdNK1Exa3dzdllE?=
 =?utf-8?B?N0NjRFZGMHFRTGJpWC9Rc09xRGR1a2N6cWJyQU9LWFZaVC9XTWJPVG5DL2RE?=
 =?utf-8?B?SDdHTUJlVlFGdGJsZGRZZS9wUFlHNk9rNGZMTVFxUzFyYUtjaU52NTZqUU1p?=
 =?utf-8?B?Sk93YWIxZTlKeUFvWjNKWGF5cDR5Sll3R2x0VkNXcjRQRVlOcjFiK3JRNXJU?=
 =?utf-8?B?TzdFWmRnYnFKRkdTNTNmUjQxZjg4T1N1bkNJR1JaZUljRngwaDRHSk9kVXhh?=
 =?utf-8?B?OWFCd2dqclhPNVJTT3k1RWpZb2RXWGl3M3B6UlM1MmtBVWs1K3FZVUpwYlE5?=
 =?utf-8?B?a0s2UEoxNGJhVlhMUHFQSXE1dzI2WGtYWENFZGZWNThUdit5YUJkODBSYXcx?=
 =?utf-8?B?RCtGaEFJV0wrWkQ5QXJ1VDFTWDZMT2tITW1leklqdzk4UHBOU3Q1ZU54ZFpI?=
 =?utf-8?B?T0UvMFhZeUtyaGR2bndwaCs3OGtlY0Znd3lkREkvdUl6YUI5dUJEM3Y4MEZY?=
 =?utf-8?B?OWRUKzJ0bmZ0MFNGKzF3VHdRdXV0UjVFa29VZ1ppaUpldEZlK1c0VDEzUVNl?=
 =?utf-8?B?MlkzODBDM3BiVHZFc3JocEhLZUNhejA1eFJYOHhGNmNSdEJTcXNoUUhkSUJZ?=
 =?utf-8?B?MFpiSEMvUTRQNFQvOHVwQ24yUHhBSDRxS3VtZkZmZ2ljUEJOUEIwQlFPLzZR?=
 =?utf-8?B?dXk0TFNvdFA5dWVCRS9vNlZHMUpOd1Ridkh2ak54TGgxTks0VFRwYmtBZ3Z5?=
 =?utf-8?B?eEJIcmhPaHgzRGZ2Z3FvN2hDNStzN2ZXODFyRVlvbEdJMDVXT0JXK1pQS1Z4?=
 =?utf-8?B?UEJRM3RIYTkrcVZvUGRWRkJQbjdiTTgxV0E5NWhOa0NISVhGcE4ycVhUUXF3?=
 =?utf-8?B?bTI1YWRFS0NpUzBDc0xhTUdEM1RvZ3dnZnVPb2l4NEVxMkMydW00RDZrRytR?=
 =?utf-8?B?ZURIUFd1aWpJVDg0eW5qTkEwcUJhL0ZqNldTcklVL1U0QUdjMlc0eGhGTnVq?=
 =?utf-8?B?MEwvUUhlR0xnOHdtajc0VGVxZzl1MHJjTnc4MllocTdNcDJiZjJkMHJwZXVY?=
 =?utf-8?B?UkhNUTRCbXl0R1hyNnRsd0tYNlJDNDEzdXA1aGIraXFNV3VIeFpZeVZvNjdi?=
 =?utf-8?B?SER1eTJTZGtiWVVHN3dmbG5pdThjYkFVeVFzZDRZUHdUVERKSHRGT2JaMGdh?=
 =?utf-8?B?MDhzQ2FOOGhNbmVjTEZvY0dvdGNwVGgrb2hncHU1Q01xTmZhVHhaajZNSVd0?=
 =?utf-8?B?VXVtMVFwVDZ0Q0JSU0grRmY4MkthZm1Jb2lYaVg0S05XZXUvYmR6bnlNeldX?=
 =?utf-8?B?VDhNL3FGRDl2MU5DZ3R2RGJsUkRHVnhiUnRrTVE0UnI1NFEzeDMwS25yOUx1?=
 =?utf-8?B?RWRKRlRlSDR6aml3ejV3blNTR0VqNlpLNXFFQ1UwTnhpamt4dk1UTU1mNE1I?=
 =?utf-8?B?dzcrM04yOEZCV3VZQldZazF6RHlBZzRkNjdUS0RPUzYyV0tIZHFPU29tUVZG?=
 =?utf-8?B?aTF0RHBXclpvNVZvUVdXcDVzQzM4RUN4ZXFMZEh5Q2xYdTRXL1ZMVGVYVWc5?=
 =?utf-8?B?Y282ZjdiY0UzWEc1SmpyZkJ6eUtJc0pJa3lnQUQyMjMrQXlHendCVmdoMTB4?=
 =?utf-8?B?SmF3MklYVlRDLzdFQnlZdDlvM1c3NVBlVkpqbmxDSHRheks3TVVUTmpsTGRl?=
 =?utf-8?B?Y244RkdsTUdZRHJjOWNhYWRhRkNYWnAvUVFuMkVjWW9sTGRIb2VrWG9OajVT?=
 =?utf-8?B?aDlYekMwSkVGTnpDcVMvbDY4Tmcyd2oxRXZBTHZvQU05Mk5vZnhWR0MrQnlL?=
 =?utf-8?B?aW5HU29oODIrOE1NVDVDZkV5bWdmUmdYUEVCYzU1M09LUXN6RTIzdThNTTc0?=
 =?utf-8?B?Vmw1aDdua1QvVlZPYVdGOEFzVCticitWTGJPRDZ6S0lrVlVWTWRxMDR6RnNY?=
 =?utf-8?B?MnJidTQ3K1QzWUNGTjRiUFR4M3dVcGU5aDI0eVBLSlhqazBlRmt5RVY0UTR0?=
 =?utf-8?B?bDI3NnBlelkrQlR4MnBVQVR3ZUdQVWpCNXFHT1kveHhQT1pQQlZZSXF6R00x?=
 =?utf-8?B?TGhlRnpJbE0xT1J3Ujc3Y3B3RHVXUDkrYXhEZEV1aXdud2JXeGF5bXplZFRi?=
 =?utf-8?B?UEtsbHB1M2NmeGFNd2g3S0hxclFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28818426-5594-4651-5387-08d9bed8b81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 08:07:05.8750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WO3Z4Pno36F7eFROCkZNTrs33sMmhMpmIfcvZ/ipm6RYKdQFYhwCuWtWZ7/lHcBgKvOsXg7ZHlGp/g+QvdcfGnJoKIWqS6Z5wHLVfGmu4IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1630
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVzcGVyIERhbmdhYXJk
IEJyb3VlciA8amJyb3VlckByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEz
LCAyMDIxIDEwOjA0IFBNDQo+IFRvOiBLYXJsc3NvbiwgTWFnbnVzIDxtYWdudXMua2FybHNzb25A
aW50ZWwuY29tPjsgQmrDtnJuIFTDtnBlbA0KPiA8Ympvcm5Aa2VybmVsLm9yZz4NCj4gQ2M6IEJy
b3VlciwgSmVzcGVyIDxicm91ZXJAcmVkaGF0LmNvbT47IFhkcCA8eGRwLQ0KPiBuZXdiaWVzQHZn
ZXIua2VybmVsLm9yZz47IE9uZywgQm9vbiBMZW9uZyA8Ym9vbi5sZW9uZy5vbmdAaW50ZWwuY29t
PjsNCj4gSm9hbyBQZWRybyBCYXJyb3MgU2lsdmEgPGpvcGJzQHZlc3Rhcy5jb20+OyBEaW9nbyBB
bGV4YW5kcmUgRGEgU2lsdmEgTGltYQ0KPiA8ZGlvbGlAdmVzdGFzLmNvbT4NCj4gU3ViamVjdDog
QUZfWERQIG5vdCB0cmFuc21pdHRpbmcgZnJhbWVzIGltbWVkaWF0ZWx5DQo+IA0KPiBIaSBNYWdu
dXMgYW5kIEJqw7hybiwNCj4gDQo+IEknbSBjb2Rpbmcgb24gYW4gQUZfWERQIHByb2dyYW1bMV0g
dGhhdCBuZWVkIHRvIHNlbmQgKGEgYnVsayBvZiBwYWNrZXRzKSBpbg0KPiBhIHNob3J0IHRpbWUt
d2luZG93IChyZWxhdGVkIHRvIFRpbWUtVHJpZ2dlcmVkIEV0aGVybmV0KS4NCj4gDQo+IE15IG9i
c2VydmF0aW9ucyBhcmUgdGhhdCBBRl9YRFAgZG9lc24ndCBzZW5kIHRoZSBmcmFtZXMgaW1tZWRp
YXRlbHkuDQo+IEFuZCB5ZXMsIEkgZG8gY2FsbCBzZW5kdG8oKSB0byB0cmlnZ2VyIGEgVFgga2lj
ay4NCj4gSW4gemVyby1jb3B5IG1vZGUgdGhpcyBpcyBwYXJ0aWN1bGFyIGJhZC4gIE15IHByb2dy
YW0gd2FudCB0byBzZW5kIDQgcGFja2V0cw0KPiBpbiBhIGJ1cnN0LCBidXQgSSdtIG9ic2Vydmlu
ZyA4IHBhY2tldHMgZ3JvdXBlZCB0b2dldGhlciBvbiB0aGUgcmVjZWl2aW5nDQo+IGhvc3QuDQo+
IA0KPiBJcyB0aGUgYSBrbm93biBwcm9wZXJ0eSBvZiBBRl9YRFA/DQoNCk5vcGUhIEl0IGlzIHN1
cHBvc2VkIHRvIGJlIGFibGUgdG8gc2VuZCBvbmUgcGFja2V0IGF0IGEgdGltZSwgdGhvdWdoIEkg
aGF2ZSBzZXZlcmFsIHRpbWVzIHNlZW4gYnVncyBpbiB0aGUgZHJpdmVycyB3aGVyZSB0aGUgYmF0
Y2hpbmcgYmVoYXZpb3Igc2hpbmVzIHRocm91Z2ggbGlrZSB0aGlzLCBhbmQgb25jZSBhIGJ1ZyBp
biB0aGUgY29yZSBjb2RlLiBUaGVyZSBpcyBldmVuIGEgdGVzdCB0aGVzZSBkYXlzIGZvciBqdXN0
IHNlbmRpbmcgYSBzaW5nbGUgcGFja2V0LCBzaW5jZSB3ZSBoYXZlIGhhZCBpc3N1ZXMgd2l0aCB0
aGlzIGluIHRoZSBwYXN0LiBUaGF0IHRlc3QgZG9lcyBwYXNzIGluIGJwZi1uZXh0LCBidXQgaXQg
aXMgb25seSBydW4gd2l0aCB0aGUgdmV0aCBkcml2ZXIgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHpl
cm8tY29weSBzbyBjb3VsZCBzdGlsbCBiZSBhbiBpc3N1ZS4gV2hhdCBkcml2ZXIgYXJlIHlvdSB1
c2luZyBpbiB6ZXJvLWNvcHkgbW9kZSBhbmQgd2hhdCBrZXJuZWwgdmVyc2lvbiBhcmUgeW91IG9u
Pw0KDQo+IEhvdyBjYW4gSSBnZXQgQUZfWERQIHRvICJmbHVzaCIgVFggcGFja2V0cyB3aGVuIGNh
bGxpbmcgc2VuZHRvKCk/DQo+IFNob3VsZCB3ZSBhZGQgYW5vdGhlciBmbGFnIHRoYW4gdGhlIGN1
cnJlbnQgTVNHX0RPTlRXQUlUPw0KDQpJbiB6ZXJvLWNvcHkgbW9kZSB3aXRoIHNvZnRpcnEgZHJp
dmVyIHByb2Nlc3NpbmcgKG5vdCBidXN5IHBvbGwpLCBhIHNlbmR0byB3aWxsIGp1c3QgdHJpZ2dl
ciB0aGUgeHNrX3dha2V1cCBuZG8gdGhhdCBzY2hlZHVsZXMgbmFwaSB1bmxlc3MgaXQgaXMgYWxy
ZWFkeSBleGVjdXRpbmcuIEl0IGlzIHVwIHRvIHRoZSBkcml2ZXIgdG8gdGhlbiBnZXQgcGFja2V0
cyBmcm9tIHRoZSBUeCByaW5nIGFuZCBwdXQgdGhlbSBvbiB0aGUgSFcgYW5kIG1ha2Ugc3VyZSB0
aGV5IGFyZSBzZW50LiBCYXJyaW5nIGFueSBIVyBxdWlya3MsIHNlbmRpbmcgb25lIHBhY2tldHMg
c2hvdWxkIGJlIHBlcmZlY3RseSBmaW5lLg0KDQovTWFnbnVzDQoNCj4gLS1KZXNwZXINCj4gDQo+
IEhpbnQsIEknbSB1c2luZyB0Y3BkdW1wIGhhcmR3YXJlIHRpbWVzdGFtcGluZyBvbiByZWNlaXZp
bmcgaGlzdCB2aWEgY21kbGluZToNCj4gDQo+ICAgdGNwZHVtcCAtdnYgLXMwIC1uaSBldGgxIC1q
IGFkYXB0ZXJfdW5zeW5jZWQgLS10aW1lLXN0YW1wLXByZWNpc2lvbj1uYW5vDQo+IC13IGFmX3hk
cF90eF9jeWNsaWMuZHVtcDQyDQo+IA0KPiBOb3RpY2VbMV0gb24gc3BlY2lmaWMgYnJhbmNoOg0K
PiAgIFsxXQ0KPiBodHRwczovL2dpdGh1Yi5jb20veGRwLXByb2plY3QvYnBmLQ0KPiBleGFtcGxl
cy90cmVlL3Zlc3RhczAzX0FGX1hEUF9leGFtcGxlL0FGX1hEUC1pbnRlcmFjdGlvbg0KDQo=
