Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0D927B42D
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 20:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgI1SNf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 14:13:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:60582 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgI1SNe (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 14:13:34 -0400
IronPort-SDR: A1NrpmGBSHIQqMgVVlPMQxAY9bJXhyZeTmameeM7UZs8cnO1xGVsMG7pU12LZTudB9Lqu4hf6L
 svK3UuzQAA+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="141443629"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="141443629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 11:04:23 -0700
IronPort-SDR: 1N9k8ovZh50wPJL8pSpNfZpUY4C2hgf5i2nrLe93aYFIAzoGigte/4Pr2eWVn0U7+GBRoPhPFD
 t4EghvsVvewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="384498016"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2020 11:04:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 11:04:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Sep 2020 11:04:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 28 Sep 2020 11:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2fqvGLvBuOv96x1q7ocEgHh0GUJxFl+FVpP+uaghz7NZter6uUYFoVWghpGZUvIekT6YOmlpFA6V7rFYmkRAYr97vAB07aRp2kXCLJD7/T+czOElDUWtc5BaV6wvaGekwceFIJqibrdXl+emM7K9tWMij9Ncw5dwZNZUCflPueEG0OCvrmKf9l4e2Z2EEcQrPOH0VRq+bp/PO0qV9xLAy966Efxo3V9/HTCZ2MsZ7OENtu4sxVgS8NGu/crhSbq8k3wlJjyBoY8ENNkrsiRTA0dRJUmVHpmK03eRpBOMsWR7rBeMUodPQD5OVaW+M/ALhFXOytaMg/EkefyFLTimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqGTM3b490tlAbBsVXaP3i0aGu9orWd/nzrdPBNW6vE=;
 b=h6GyyxDo827zGQWoam3vI3U498jYr1NCjGI94Q4C1YBvf3z6UsGn9JSWgGT966o+GKeLHNrziQ2cEMPpEU21XfgM3TW550Flxiurtl3hPxmA77ISWw20PRirndO16bWmzYK8UYJ0VZhWCVgulQvCWynkxO7NaXogWD8/n/xp3WoVAOF7vwfScw5DerU7cv19rjIJS+rKotEMS+vbBjG+p50ZfdieqrnspGA7b+syB0OZOYuEyUMgQHnMb3YSgtxTADfG24EmW7etNvHKwomeVasoQhSAltG6NviszjuM0cNybbC9ZN0qd85gNLuXSljHZkJaTEGlb6XaUZ9/7t1ZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqGTM3b490tlAbBsVXaP3i0aGu9orWd/nzrdPBNW6vE=;
 b=kxiogR9ZfIpdYZezQLeLz6CU5opxxSKZ7jP8+Z9VIP0MG1Uu0nmwO5DByI+v6WIqHMix2dZGXcO3cRz0bbE9oDQSnaGvTeb50nJYoZVA1+zIH8Jdc4xPnimecERvMc0W6p4yJsTnTz5SragYkfK74hQ40u3iDIsOgmZnaDx4qSk=
Received: from SN6PR11MB3229.namprd11.prod.outlook.com (2603:10b6:805:ba::28)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 18:04:14 +0000
Received: from SN6PR11MB3229.namprd11.prod.outlook.com
 ([fe80::acc4:9465:7e88:506e]) by SN6PR11MB3229.namprd11.prod.outlook.com
 ([fe80::acc4:9465:7e88:506e%7]) with mapi id 15.20.3412.026; Mon, 28 Sep 2020
 18:04:14 +0000
From:   "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>
To:     "sven.auhagen@voleatech.de" <sven.auhagen@voleatech.de>,
        "brouer@redhat.com" <brouer@redhat.com>
CC:     "toke@redhat.com" <toke@redhat.com>,
        "dsahern@gmail.com" <dsahern@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "ThomasPtacek@gmail.com" <ThomasPtacek@gmail.com>
Subject: Re: [Intel-wired-lan] bpf_redirect and xdpgeneric
Thread-Topic: [Intel-wired-lan] bpf_redirect and xdpgeneric
Thread-Index: AQHWlautwx7HOxyUlU60IEBtWc0SXql+OyEAgAAdEoA=
Date:   Mon, 28 Sep 2020 18:04:14 +0000
Message-ID: <f1a1a7c89fce4ba5c78da65700e02d353bb9e5d4.camel@intel.com>
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
         <87lfh7fkqs.fsf@toke.dk>
         <CANDGNvbY=8XEJP=S3e+5V2RU6u0zjRE3YDo62bhV-Qaje=++2A@mail.gmail.com>
         <5f7f5056-d1de-737b-2d76-cd37e4a4db8e@gmail.com>
         <20200928172449.50a3e755@carbon>
         <20200928162010.wpv6ukqscuxaxtnj@svensmacbookair.sven.lan>
In-Reply-To: <20200928162010.wpv6ukqscuxaxtnj@svensmacbookair.sven.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
authentication-results: voleatech.de; dkim=none (message not signed)
 header.d=none;voleatech.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7494c5-5ce6-4200-7362-08d863d8e8cf
x-ms-traffictypediagnostic: SA0PR11MB4560:
x-microsoft-antispam-prvs: <SA0PR11MB45603446C7BE2E70B4BC6470C6350@SA0PR11MB4560.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uFUxtOolvNj8jn2D8WeBDVHrX5cV+g/LO0NGA8fMqJXVaUOpsqXyNwmfdCtjywtpPe85sTwJ5abTBbrKnUOf9MNFfMdwMrHiSbZxfU4UQyXqbgZ58fruA6QGtHQQugwX+kjmryNcVuerATOFuX3RZDOVkrowsW1NoVTcn5EjcDJ7iWk0CKdqDAYTuW9UvJKmES7XKhIJc+SaSzyAK01m4lgD/9Usn0fvx/t2B5zKrRpD0a5MtjS08HH9kyQeeq/vnzQP/eYm+toXAL9COuJXWlWIF2P//QBF4oPYjIexIH1W752jRwUsZfEIxTuBp8y8H5LNa5ggoiDH6jcUFbXWhjAUR1BNM4f6ssC+D6QeNL8m4Su0oyJ32n3L3uJ9DmoSBmyXDqeq8MW6RmVwcmrbWvk2LmTqglr1BE2Hs7jDI04+uXDSAoMm9dj+mULT13fGcjlrGt6oS+icU+YoxEMBj3D1sgaVnennQS5T9RcnsbhsFCYWr7YKkpT0pWB9BiOH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3229.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(6486002)(26005)(186003)(86362001)(36756003)(316002)(478600001)(110136005)(71200400001)(54906003)(2616005)(66574015)(45080400002)(2906002)(91956017)(76116006)(6512007)(66946007)(4326008)(5660300002)(966005)(53546011)(66446008)(8936002)(6506007)(66476007)(8676002)(66556008)(64756008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Vn2l6+nvYNS+7jYf+CbqidxhmNQI5ZHtUl1mEZJhbNg6DbvuyhnQYvuXy8DDYOLeWHV0yrgNzCzInysoNcwqaHZ5rhRKNg9j/9XitF8B0ugGPkbDXjVXiEhuNbU4ZoYZNNkpM91KnMpPerG0BBj3uyrJOUPIw6SKoy9fShiK9q5+/q5iq1w2pfZ0zTpaRLeOtbUJb8QDGJ/2fR231pwplVcjKnYS8LXA1s7mlcvnz0BVlXvLSCPPpMhBaFBwhJgCwi5TsSKQ5Dz9LkoWmrm07akExBkYWf1fUvrygc9rJQ75IKPDTZxJZJ5ckdAZ7l5DbtvVJSV09z400V9v+jqE23giAwDzRJy8sW+IPBLlUZRTpbVcwKDnKB9N/RZE+11xRFSvvJWqCD3oIp3tYquP/Gor5oyu4SkcPLXrOV69Gbk5NGDzegXRVBfqPz63smUmmyZTGZKIEoLnOREqa/WMdR+XCO3Tp0M6GRFCMM0AFz7SbftFT+AsxW/1sF9Fa24TSevON3YntFehIPm5wMsB3J4mWvgDOc5qu7G0C0JwbDCvFv9xB1NRWLYcRmQ4jMP3WZ/I12R4ZDRlVYE9A9sGr58se4Ca8Y5nEn1m2RoQru+2n1nrcdnot/M9YDfekmYKSi4BkEcqvSVxU65qtTpCAg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DDCDB3E6EADCA41BDD5503307BB68C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3229.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7494c5-5ce6-4200-7362-08d863d8e8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 18:04:14.1491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMH7XSgThhVIKGu47VOMfTVuyMb3soHuAZ1tA4CSDnQU0cV+Xflp4douYN7H3h1iRgQxaljXCEMCoyIvLpK2W/MHjmzXNLmdEVhBaCCwTNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

T24gTW9uLCAyMDIwLTA5LTI4IGF0IDE4OjIwICswMjAwLCBTdmVuIEF1aGFnZW4gd3JvdGU6DQo+
IE9uIE1vbiwgU2VwIDI4LCAyMDIwIGF0IDA1OjI0OjQ5UE0gKzAyMDAsIEplc3BlciBEYW5nYWFy
ZCBCcm91ZXINCj4gd3JvdGU6DQo+ID4gT24gRnJpLCAxOCBTZXAgMjAyMCAxNDoyNzo0NSAtMDYw
MA0KPiA+IERhdmlkIEFoZXJuIDxkc2FoZXJuQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
PiBPbiA5LzE4LzIwIDEyOjQyIFBNLCBUaG9tYXMgUHRhY2VrIHdyb3RlOg0KPiA+ID4gPiBUaGUg
c2V0dXAgaXMgcHJldHR5IHNpbXBsZS4gVGhlcmUncyBhbiBlbm8xIChpZ2IgZHJpdmVyKSwgdG8N
Cj4gPiA+ID4gd2hpY2ggb3VyDQo+ID4gPiA+IGRlZmF1bHQgcm91dGUgcG9pbnRzLiBPbiB0aGUg
c2FtZSBib3ggYXJlIHNldmVyYWwgVk1zLiBUaGVyZSdzDQo+ID4gPiA+IGEgdGFwDQo+ID4gPiA+
IGludGVyZmFjZSAoZm9yIGVhY2ggVk0sIGNhbGwgaXQgdGFwWCkuIFRyYWZmaWMgZm9yIGEgVk0g
Zmxvd3MNCj4gPiA+ID4gaW4gZnJvbQ0KPiA+ID4gPiB0aGUgSW50ZXJuZXQgb24gZW5vMSBhbmQg
aXMgZGlyZWN0ZWQgdG8gdGFwWDsgdGhlIHJlc3BvbnNlDQo+ID4gPiA+IHRyYWZmaWMNCj4gPiA+
ID4gZmxvd3MgaW4gdGhlIG90aGVyIGRpcmVjdGlvbi4NCj4gPiA+ID4gDQo+ID4gPiA+IEknbSBk
ZWxpYmVyYXRlbHkgc2ltcGxpZnlpbmcgaGVyZToNCj4gPiA+ID4gDQo+ID4gPiA+IGVubzEgcnVu
cyBhbiBYRFAgcHJvZ3JhbSB0aGF0IGRvZXMgc29tZSBsaWdodHdlaWdodCBJUA0KPiA+ID4gPiBy
ZXdyaXRpbmcgZnJvbQ0KPiA+ID4gPiBhbnljYXN0IGFkZHJlc3NlcyB0byBpbnRlcm5hbCBWTSBh
ZGRyZXNzZXMgb24gaW5ncmVzcy4gZW5vMSdzDQo+ID4gPiA+IFhEUA0KPiA+ID4gPiBwcm9ncmFt
IGN1cnJlbnRseSBYRFBfUEFTUydzIHJld3JpdHRlbiBwYWNrZXRzIHRvIHRoZSBJUCBzdGFjaywN
Cj4gPiA+ID4gd2hlcmUNCj4gPiA+ID4gdGhleSdyZSByb3V0ZWQgdG8gdGhlIFZNJ3MgdGFwLiBU
aGlzIHdvcmtzIGZpbmUuDQo+ID4gPiA+IA0KPiA+ID4gPiB0YXBYIHJ1bnMgYW4gWERQIHByb2dy
YW0gdGhhdCBkb2VzIHRoZSBzYW1lIHJld3JpdGluZyBpbg0KPiA+ID4gPiByZXZlcnNlLg0KPiA+
ID4gPiBSaWdodCBub3csIGl0IGFsc28gWERQX1BBU1MncyBwYWNrZXRzIHRvIHRoZSBzdGFjaywg
d2hpY2ggYWxzbw0KPiA+ID4gPiB3b3Jrcw0KPiA+ID4gPiAtLS0gdGhlIHN0YWNrIHJvdXRlcyBy
ZXNwb25zZSB0cmFmZmljIG91dCBlbm8xLg0KPiA+ID4gPiANCj4gPiA+ID4gSSdtIHBsYXlpbmcg
d2l0aCBYRFBfUkVESVJFQ1QnaW5nIGluc3RlYWQgb2YgWERQX1BBU1MnaW5nLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gSSBoYXZlIHRoZSBpZmluZGV4ZXMgYW5kIE1BQyBhZGRyZXNzZXMgKGFuZCB0aG9z
ZSBvZiBJUA0KPiA+ID4gPiBuZWlnaGJvcnMpIGluDQo+ID4gPiA+IGEgbWFwIC0tLSBhIG5vcm1h
bCBIQVNIIG1hcCwgbm90IGEgREVWTUFQLiBVc2luZyB0aGF0IG1hcCwgSQ0KPiA+ID4gPiBjYW4N
Cj4gPiA+ID4gc3VjY2Vzc2Z1bGx5IHJlZGlyZWN0IHRyYWZmaWMgZnJvbSB0YXBYIHRvIGFyYml0
cmFyeSBvdGhlciB0YXANCj4gPiA+ID4gaW50ZXJmYWNlcy4gV2hhdCBJIGNhbid0IGRvIGlzIHJl
ZGlyZWN0IHBhY2tldHMgZnJvbSB0YXBYIHRvDQo+ID4gPiA+IGVubzEsDQo+ID4gPiA+IHdoaWNo
IGlzIHdoYXQgdGhlIHN5c3RlbSBhY3R1YWxseSBuZWVkcyB0byBkby4NCj4gPiA+ID4gICANCj4g
PiA+IA0KPiA+ID4gWERQX1JFRElSRUNUIHNlbmRzIHRoZSBwYWNrZXQgdG8gYSBkZXZpY2VzIG5k
b194ZHBfeG1pdCBmdW5jdGlvbi4NCj4gPiA+IHRhcA0KPiA+ID4gaW1wbGVtZW50cyBpdCBoZW5j
ZSBlbm8xIC0+IHRhcCB3b3JrczsgaWdiIGRvZXMgbm90IG1lYW5pbmcgdGFwDQo+ID4gPiAtPiBl
bm8xDQo+ID4gPiBmYWlscy4NCj4gPiANCj4gPiBUaGVyZSBpcyBjbGVhcmx5IGEgcmVhbC1saWZl
IHVzZS1jYXNlIGZvciBhZGRpbmcgbmF0aXZlLVhEUCBzdXBwb3J0DQo+ID4gZm9yDQo+ID4gaWdi
IGRyaXZlci4gIFN2ZW4gKGNjKSBoYXZlIGltcGxlbWVudGVkIHRoaXMgKHY2WzFdKSwgYnV0IHNv
bWV0aGluZw0KPiA+IGlzDQo+ID4gY2F1c2luZyB0aGlzIHBhdGNoIHRvIG5vdCBtb3ZlIGZvcndh
cmQsIHdoYXQgaXMgc3RhbGxpbmcgSW50ZWwNCj4gPiBtYWludGFpbmVycz8NCj4gDQo+IFRoZSBo
b2xkdXAgaXMgZnJvbSB0aGUgSW50ZWwgZ3V5cy4NCj4gVGhlcmUgaXMgYSB2NyB3aXRoIHRoZSBj
aGFuZ2VzIGZvciBLZXJuZWwgNS45IGJ1dCBpdCB3YXMgb25seSBwb3N0ZWQNCj4gb24NCj4gdGhl
IEludGVsIGxpc3Q6DQo+IA0KPiANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9pbnRlbC13aXJlZC1sYW4vcGF0Y2gvMjAyMDA5MDIyMDMyMjIuMTg1MTQxLTEtYW50aG9ueS5s
Lm5ndXllbkBpbnRlbC5jb20vDQo+IA0KPiBUaGV5IHRlc3RlZCBpdCBsYXN0IHdlZWsgc28gaXQg
c2hvdWxkIGhvcGVmdWxseSBiZSBtZXJnZWQgaW4gdGhlIG5leHQNCj4gd2luZG93Lg0KDQpUaGVy
ZSB3ZXJlIHNvbWUgZW1haWwgaXNzdWVzIHdoaWNoIHByZXZlbnRlZCB1cyBmcm9tIHNlbmRpbmcg
aXQgb3V0DQpzb29uZXIgKGFmdGVyIGl0IHdhcyB0ZXN0ZWQpLiBUaGUgaXNzdWUgd2FzIHJlc29s
dmVkIEZyaWRheSwgSSBqdXN0DQpzZW50IHRoZSBwYXRjaCB0byBuZXRkZXY6DQoNCg0KaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L25ldGRldi9wYXRjaC8yMDIwMDkyODE3NTkw
OC4zMTg1MDItMi1hbnRob255Lmwubmd1eWVuQGludGVsLmNvbS8NCg0KVGhhbmtzLA0KVG9ueQ0K
DQo+ID4gDQo+ID4gVG8gVGhvbWFzLCB5b3UgY291bGQgdHJ5IG91dCB0aGUgcGF0Y2hbMl0gYW5k
IHJlcG9ydCBiYWNrIGlmIGl0DQo+ID4gd29ya3MNCj4gPiBmb3IgeW91PyAgKEkgdGhpbmsgaXQg
d2lsbCBoZWxwIG1vdmluZyBwYXRjaCBmb3J3YXJkLi4uKQ0KPiA+IA0KPiANCj4gSSB3b3VsZCBi
ZSBpbnRlcmVzdGVkIGlmIGl0IHdvcmtzIGZvciB5b3UgYXMgd2VsbC4NCj4gDQo+IEJlc3QNCj4g
U3Zlbg0KPiANCj4gPiBbMV0gDQo+ID4gaHR0cHM6Ly9ldXIwMy5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbmV0ZGV2
JTJGMjAyMDA5MDIwNTQ1MDkuMjNqYnY1ZnlqM290emlxMiU0MHN2ZW5zbWFjYm9va2Fpci5zdmVu
LmxhbiUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDc3Zlbi5hdWhhZ2VuJTQwdm9sZWF0ZWNoLmRlJTdD
Y2JkNzYyZTVhMDI0NDg4ZjQ5MWIwOGQ4NjNjMmI2Y2IlN0NiODJhOTlmNjc5ODE0YTcyOTUzNDRk
MzUyOThmODQ3YiU3QzAlN0MwJTdDNjM3MzY5MDM1MjI5MjkwODAxJmFtcDtzZGF0YT1QdiUyQlRF
UWVZNGxjUG5JcHJnMG42SzBuSE9NTWxNbzJxbHJjbXhxV051TFklM0QmYW1wO3Jlc2VydmVkPTAN
Cj4gPiBbMl0gDQo+ID4gaHR0cHM6Ly9ldXIwMy5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZwYXRjaHdvcmsub3psYWJzLm9yZyUyRnByb2plY3QlMkZu
ZXRkZXYlMkZwYXRjaCUyRjIwMjAwOTAyMDU0NTA5LjIzamJ2NWZ5ajNvdHppcTIlNDBzdmVuc21h
Y2Jvb2thaXIuc3Zlbi5sYW4lMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q3N2ZW4uYXVoYWdlbiU0MHZv
bGVhdGVjaC5kZSU3Q2NiZDc2MmU1YTAyNDQ4OGY0OTFiMDhkODYzYzJiNmNiJTdDYjgyYTk5ZjY3
OTgxNGE3Mjk1MzQ0ZDM1Mjk4Zjg0N2IlN0MwJTdDMCU3QzYzNzM2OTAzNTIyOTI5MDgwMSZhbXA7
c2RhdGE9Q21sRXJhbUwlMkZIR3o3NDVONkhQJTJGV1J6UHdaczBFUmgza1E4JTJCaiUyRklVenR3
JTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gLS0gDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+ICAgSmVz
cGVyIERhbmdhYXJkIEJyb3Vlcg0KPiA+ICAgTVNjLkNTLCBQcmluY2lwYWwgS2VybmVsIEVuZ2lu
ZWVyIGF0IFJlZCBIYXQNCj4gPiAgIExpbmtlZEluOiANCj4gPiBodHRwczovL2V1cjAzLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRnd3dy5saW5rZWRp
bi5jb20lMkZpbiUyRmJyb3VlciZhbXA7ZGF0YT0wMiU3QzAxJTdDc3Zlbi5hdWhhZ2VuJTQwdm9s
ZWF0ZWNoLmRlJTdDY2JkNzYyZTVhMDI0NDg4ZjQ5MWIwOGQ4NjNjMmI2Y2IlN0NiODJhOTlmNjc5
ODE0YTcyOTUzNDRkMzUyOThmODQ3YiU3QzAlN0MwJTdDNjM3MzY5MDM1MjI5MjkwODAxJmFtcDtz
ZGF0YT1MSlV0MzhHQWtkWFMyclc3V0clMkJVUzBkNmVWeFpmbDNWSnF5SHZOc3FMbVklM0QmYW1w
O3Jlc2VydmVkPTANCj4gPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IEludGVsLXdpcmVkLWxhbiBtYWlsaW5nIGxpc3QNCj4gSW50ZWwt
d2lyZWQtbGFuQG9zdW9zbC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5vc3Vvc2wub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtd2lyZWQtbGFuDQo=
