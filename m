Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4E014A59F
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Jan 2020 15:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgA0OBy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Jan 2020 09:01:54 -0500
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:55296
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727177AbgA0OBy (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Jan 2020 09:01:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4+GyKIbAfH51Ei9HCNBN9ZVW3PpC/ua/A1zsdvzHudCzKx6RnrMIvC3St3Oz5GWMlZ9+aVvYMRX55T2cre96WEq9w9nDihGkzpncH2AP8xK5HNSTOqEmUYvYU9mPSpJ7R2R5foE50n0xULgnPYWMGo5psF6L0pE7wTN/ib5sTm0s18TrHcnuatg6i+FBy6yBfhZ5p3MdzEI57AUiEcvd676UHd8NgwZ75qI4vAW8FAWM/YVkAyft+rsO0UWeEEEuFZquwxL+k51THMrahOD1suMYcPUt9zxEsRXGDbGtzoYkLo1ra6Iglagm6j7tw41nFWoxzFECKIa1DdfSzl7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H4/cM+pdNOla7g3ZON6fTljlojxJPvp3SdlXcpinp0=;
 b=QwEZrLR2rIYaKNwgSH8Z2qoVdsZIS9SFm/ZAOry7PYHbQVgcpmZBVoXUSqjxx3uKSQjHIk1iDMICYl0eZhlEIkEk4gQnVTH4jY56f2pA2k7XBwgZ2f8c84EAHztHx9U86xRIvpT4IYlL6/2M8KdUzAiVfKnvqNQA21Kd9XcqL41Lkv5aYi1C6lD55dAxgRAJcl3sU6OJqGsNVdEt8ffY4GIxF4JVR/PLbb8ga+xsfQ9XpYPzqhxgU7RcB+9iIhHCv/Yp4gMk07uKxo8dVY7yG+kXt6uly+FWgxNJg5O0nSXgLEml7gKEql/v53bQVicEFEEeg50tlgiHw7J6Xix0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H4/cM+pdNOla7g3ZON6fTljlojxJPvp3SdlXcpinp0=;
 b=DKDHjVV0hyo5GiJd6dGi11phN1F4tht8HOW/JEPyaErt7gjdMctYai2gjXsYBEwBf+XZApk5BYxxvcDiQGcg4q36YWaxeHq3/a/UjQbnSgzJaeX32yznzNegiBAgJsKsRCYXnd0xNEiT2KkwBVO4st8z9i0+LyfJXShlPdoGE2c=
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com (10.168.126.17) by
 HE1PR0501MB2681.eurprd05.prod.outlook.com (10.172.132.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Mon, 27 Jan 2020 14:01:49 +0000
Received: from HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::6131:363b:61b8:680a]) by HE1PR0501MB2570.eurprd05.prod.outlook.com
 ([fe80::6131:363b:61b8:680a%11]) with mapi id 15.20.2665.026; Mon, 27 Jan
 2020 14:01:48 +0000
Received: from [10.112.41.138] (77.75.144.194) by AM0PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:208:be::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend Transport; Mon, 27 Jan 2020 14:01:47 +0000
From:   Maxim Mikityanskiy <maximmi@mellanox.com>
To:     Ryan Goodfellow <rgoodfel@isi.edu>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
Subject: Re: zero-copy between interfaces
Thread-Topic: zero-copy between interfaces
Thread-Index: AQHV0C0x4KTPnFOssUSt5vpHUAzNC6f1IGuAgAIZUYCAB1qIAA==
Date:   Mon, 27 Jan 2020 14:01:48 +0000
Message-ID: <b1b9342b-b9e5-f576-c06c-3a43dcf2b189@mellanox.com>
References: <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu>
 <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu>
 <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
 <20200116020414.GA46831@smtp.ads.isi.edu>
 <CAJ8uoz0yqYTq+OOK8p0XRcWyMkfnJ1ZT7hUew9w3FuHr=4K-QQ@mail.gmail.com>
 <4c03813d-5edf-7e9e-8905-31902b5acb71@mellanox.com>
 <20200122214352.GA13201@smtp.ads.isi.edu>
In-Reply-To: <20200122214352.GA13201@smtp.ads.isi.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0044.eurprd05.prod.outlook.com
 (2603:10a6:208:be::21) To HE1PR0501MB2570.eurprd05.prod.outlook.com
 (2603:10a6:3:6c::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maximmi@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [77.75.144.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 125607cc-bdb6-45ef-2022-08d7a33173a2
x-ms-traffictypediagnostic: HE1PR0501MB2681:|HE1PR0501MB2681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0501MB268101DE5B27F65FF427F11FD10B0@HE1PR0501MB2681.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(189003)(199004)(66446008)(64756008)(66556008)(66476007)(66946007)(478600001)(31686004)(2906002)(3480700007)(956004)(2616005)(53546011)(186003)(16526019)(26005)(4326008)(36756003)(86362001)(110136005)(71200400001)(8936002)(31696002)(316002)(966005)(81156014)(8676002)(16576012)(5660300002)(6486002)(81166006)(52116002)(107886003)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0501MB2681;H:HE1PR0501MB2570.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqz6BwfBh0jifY9CtMqrLCFSW+xxPW8BlVfio3BpHUauWmDhmfSKzjTgqnqqN1jrVkjAohJiPtWbtdf4vJXLzIOSGgIOK/G7H3xcMZBLkUSaR/OfydzLVTBN7IHLhwbqembl8a5cl1atG9/lzhMX5NsW+5SbNIDuVYON2fyuTzkfKVJIpMJitmpw7EbMmFr6RLd/o7R7NaGcQTiSxIHVCIr/efJqvnrBvZEBaX9+H4mVHe8rjQgzvr0Ta80pv64HKxRyE8eKY8z3vXXrdYbbN69gJV+OHGYHyxfK2nX0Jvk6bKW8adKUltJ+N7rsC0Hd4k7WPrivZHT0Lg4Kniwp6en8x0tDynhRqsYYbyV/rCMMEi7N6uS6MgxmqRMZjnDUSvDjL2FbwAqIPy/8l1aHexe0w41FXvzHmiSkImYssyWmGLqJ/FvqFTEzj3MH4X/9AhytuY1FVhlsaZFIEy503Tz13eZtLfZnnvOb0R/Mp90=
x-ms-exchange-antispam-messagedata: LQ2moVpOcyP7Kf10Y+5hDV1Rx1B2Yepr07Nr3uJNwbKBMoZDJRE7i9WHy89noaDyRJsk2TG0bRP+tN9Q6UTGAlZgsuWtJTww2eUr1ojMpLdDVF5IcZHujNQuQCeE78zH9tko0ejcN+RgG30unw/u7g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <76DB147DA480B2469873E6881616CA63@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125607cc-bdb6-45ef-2022-08d7a33173a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 14:01:48.8612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjvctdcyMBR1Rx4dnmzNL9TVvX+lMMajix6+IuSQPzOvLsejAcX+dfrjWAqGpgSk4MTWbodQ+8Otcvd1MxqsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0501MB2681
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

T24gMjAyMC0wMS0yMiAyMzo0MywgUnlhbiBHb29kZmVsbG93IHdyb3RlOg0KPiBPbiBUdWUsIEph
biAyMSwgMjAyMCBhdCAwMTo0MDo1MFBNICswMDAwLCBNYXhpbSBNaWtpdHlhbnNraXkgd3JvdGU6
DQo+Pj4+IEkndmUgcG9zdGVkIG91dHB1dCBmcm9tIHRoZSBwcm9ncmFtIGluIGRlYnVnZ2luZyBt
b2RlIGhlcmUNCj4+Pj4NCj4+Pj4gLSBodHRwczovL2dpdGxhYi5jb20vbWVyZ2V0Yi90ZWNoL25l
dHdvcmstZW11bGF0aW9uL2tlcm5lbC9zbmlwcGV0cy8xOTMwMzc1DQo+Pj4+DQo+Pj4+IFllcywg
eW91IGFyZSBjb3JyZWN0IGluIHRoYXQgZm9yd2FyZGluZyB3b3JrcyBmb3IgYSBicmllZiBwZXJp
b2QgYW5kIHRoZW4gc3RvcHMuDQo+Pj4+IEkndmUgbm90aWNlZCB0aGF0IHRoZSBudW1iZXIgb2Yg
cGFja2V0cyB0aGF0IGFyZSBmb3J3YXJkZWQgaXMgZXF1YWwgdG8gdGhlIHNpemUNCj4+Pj4gb2Yg
dGhlIHByb2R1Y2VyL2NvbnN1bWVyIGRlc2NyaXB0b3IgcmluZ3MuIEkndmUgcG9zdGVkIHR3byBw
aW5nIHRyYWNlcyBmcm9tIGENCj4+Pj4gY2xpZW50IHBpbmcgdGhhdCBzaG93cyB0aGlzLg0KPj4+
Pg0KPj4+PiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9tZXJnZXRiL3RlY2gvbmV0d29yay1lbXVsYXRp
b24va2VybmVsL3NuaXBwZXRzLzE5MzAzNzYNCj4+Pj4gLSBodHRwczovL2dpdGxhYi5jb20vbWVy
Z2V0Yi90ZWNoL25ldHdvcmstZW11bGF0aW9uL2tlcm5lbC9zbmlwcGV0cy8xOTMwMzc3DQo+Pg0K
Pj4gVGhlc2Ugc25pcHBldHMgYXJlIG5vdCBhdmFpbGFibGUuDQo+IA0KPiBBcG9sb2dpZXMsIEkg
aGFkIHRoZSB3cm9uZyBwZXJtaXNzaW9ucyBzZXQuIFRoZXkgc2hvdWxkIGJlIGF2YWlsYWJsZSBu
b3cuDQo+IA0KPj4NCj4+Pj4NCj4+Pj4gSSd2ZSBhbHNvIG5vdGljZWQgdGhhdCB3aGVuIHRoZSBm
b3J3YXJkaW5nIHN0b3BzLCB0aGUgQ1BVIHVzYWdlIGZvciB0aGUgcHJvYw0KPj4+PiBydW5uaW5n
IHRoZSBwcm9ncmFtIGlzIHBlZ2dlZCwgd2hpY2ggaXMgbm90IHRoZSBub3JtIGZvciB0aGlzIHBy
b2dyYW0gYXMgaXQgdXNlcw0KPj4+PiBhIHBvbGwgY2FsbCB3aXRoIGEgdGltZW91dCBvbiB0aGUg
eHNrIGZkLg0KPj4NCj4+IFRoaXMgaW5mb3JtYXRpb24gbGVkIG1lIHRvIGEgZ3Vlc3Mgd2hhdCBt
YXkgYmUgaGFwcGVuaW5nLiBPbiB0aGUgUlgNCj4+IHNpZGUsIG1seDVlIGFsbG9jYXRlcyBwYWdl
cyBpbiBidWxrcyBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucyBhbmQgdG8NCj4+IGxldmVyYWdlIGhh
cmR3YXJlIGZlYXR1cmVzIHRhcmdldGVkIHRvIHBlcmZvcm1hbmNlLiBJbiBBRl9YRFAgbW9kZSwN
Cj4+IGJ1bGtpbmcgb2YgZnJhbWVzIGlzIGFsc28gdXNlZCAob24geDg2LCB0aGUgYnVsayBzaXpl
IGlzIDY0IHdpdGgNCj4+IHN0cmlkaW5nIFJRIGVuYWJsZWQsIGFuZCA4IG90aGVyd2lzZSwgaG93
ZXZlciwgaXQncyBpbXBsZW1lbnRhdGlvbg0KPj4gZGV0YWlscyB0aGF0IG1pZ2h0IGNoYW5nZSBs
YXRlcikuIElmIHlvdSBkb24ndCBwdXQgZW5vdWdoIGZyYW1lcyB0byBYU0sNCj4+IEZpbGwgUmlu
ZywgdGhlIGRyaXZlciB3aWxsIGJlIGRlbWFuZGluZyBtb3JlIGZyYW1lcyBhbmQgcmV0dXJuIGZy
b20NCj4+IHBvbGwoKSBpbW1lZGlhdGVseS4gQmFzaWNhbGx5LCBpbiB0aGUgYXBwbGljYXRpb24s
IHlvdSBzaG91bGQgcHV0IGFzDQo+PiBtYW55IGZyYW1lcyB0byB0aGUgRmlsbCBSaW5nIGFzIHlv
dSBjYW4uIFBsZWFzZSBjaGVjayBpZiB0aGF0IGNvdWxkIGJlDQo+PiB0aGUgcm9vdCBjYXVzZSBv
ZiB5b3VyIGlzc3VlLg0KPiANCj4gVGhlIGNvZGUgaW4gdGhpcyBhcHBsaWNhdGlvbiBtYWtlcyBh
biBlZmZvcnQgdG8gcmVsZW5pc2ggdGhlIGZpbGwgcmluZyBhcyBmYXN0DQo+IGFzIHBvc3NpYmxl
LiBUaGUgYmFzaWMgbG9vcCBvZiB0aGUgYXBwbGljYXRpb24gaXMgdG8gZmlyc3QgY2hlY2sgaWYg
dGhlcmUgYXJlDQo+IGFueSBkZXNjcmlwdG9ycyB0byBiZSBjb25zdW1lZCBmcm9tIHRoZSBjb21w
bGV0aW9uIHF1ZXVlIG9yIGFueSBkZXNjcmlwdG9ycyB0aGF0DQo+IGNhbiBiZSBhZGRlZCB0byB0
aGUgZmlsbCBxdWV1ZSwgYW5kIG9ubHkgdGhlbiB0byBtb3ZlIG9uIHRvIG1vdmluZyBwYWNrZXRz
DQo+IHRocm91Z2ggdGhlIHJ4IGFuZCB0eCByaW5ncy4NCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9tZXJnZXRiL3RlY2gvbmV0d29yay1lbXVsYXRpb24va2VybmVsL2Jsb2IvdjUuNS1tb2Evc2Ft
cGxlcy9icGYveGRwc29ja19tdWx0aWRldi5jI0w0NTItNDc0DQoNCkkgcmVwcm9kdWNlZCB5b3Vy
IGlzc3VlIGFuZCBkaWQgbXkgaW52ZXN0aWdhdGlvbiwgYW5kIGhlcmUgaXMgd2hhdCBJIGZvdW5k
Og0KDQoxLiBDb21taXQgZGYwYWU2Zjc4YTQ1ICh0aGF0IHlvdSBmb3VuZCBkdXJpbmcgYmlzZWN0
KSBpbnRyb2R1Y2VzIGFuIA0KaW1wb3J0YW50IGJlaGF2aW9yYWwgY2hhbmdlICh3aGljaCBJIHRo
b3VnaHQgd2FzIG5vdCB0aGF0IGltcG9ydGFudCkuIA0KeHNrcV9uYl9hdmFpbCB1c2VkIHRvIHJl
dHVybiBtaW4oZW50cmllcywgZGNudCksIGJ1dCBhZnRlciB0aGUgY2hhbmdlIGl0IA0KanVzdCBy
ZXR1cm5zIGVudHJpZXMsIHdoaWNoIG1heSBiZSBhcyBiaWcgYXMgdGhlIHJpbmcgc2l6ZS4NCg0K
Mi4geHNrcV9wZWVrX2FkZHIgdXBkYXRlcyBxLT5yaW5nLT5jb25zdW1lciBvbmx5IHdoZW4gcS0+
Y29uc190YWlsIA0KY2F0Y2hlcyB1cCB3aXRoIHEtPmNvbnNfaGVhZC4gU28sIGJlZm9yZSB0aGF0
IHBhdGNoIGFuZCBvbmUgcHJldmlvdXMgDQpwYXRjaCwgY29uc19oZWFkIC0gY29uc190YWlsIHdh
cyBub3QgbW9yZSB0aGFuIDE2LCBzbyB0aGUgY29uc3VtZXIgaW5kZXggDQp3YXMgdXBkYXRlZCBw
ZXJpb2RpY2FsbHkuIE5vdyBjb25zdW1lciBpcyB1cGRhdGVkIG9ubHkgd2hlbiB0aGUgd2hvbGUg
DQpyaW5nIGlzIGV4aGF1c3RlZC4NCg0KMy4gVGhlIGFwcGxpY2F0aW9uIGNhbid0IHJlcGxlbmlz
aCB0aGUgZmlsbCByaW5nIGlmIHRoZSBjb25zdW1lciBpbmRleCANCmRvZXNuJ3QgbW92ZS4gQXMg
YSBjb25zZXF1ZW5jZSwgcmVmaWxsaW5nIHRoZSBkZXNjcmlwdG9ycyBieSB0aGUgDQphcHBsaWNh
dGlvbiBjYW4ndCBoYXBwZW4gaW4gcGFyYWxsZWwgd2l0aCB1c2luZyB0aGVtIGJ5IHRoZSBkcml2
ZXIuIEl0IA0Kc2hvdWxkIGhhdmUgc29tZSBwZXJmb3JtYW5jZSBwZW5hbHR5IGFuZCBwb3NzaWJs
eSBldmVuIGxlYWQgdG8gcGFja2V0IA0KZHJvcHMsIGJlY2F1c2UgdGhlIGRyaXZlciB1c2VzIGFs
bCB0aGUgZGVzY3JpcHRvcnMgYW5kIG9ubHkgdGhlbiANCmFkdmFuY2VzIHRoZSBjb25zdW1lciBp
bmRleCwgYW5kIHRoZW4gaXQgaGFzIHRvIHdhaXQgdW50aWwgdGhlIA0KYXBwbGljYXRpb24gcmVm
aWxscyB0aGUgcmluZywgYnVzeS1sb29waW5nIGFuZCBsb3NpbmcgcGFja2V0cy4NCg0KNC4gQXMg
bWx4NWUgYWxsb2NhdGVzIGZyYW1lcyBpbiBiYXRjaGVzLCB0aGUgY29uc2VxdWVuY2VzIGFyZSBl
dmVuIG1vcmUgDQpzZXZlcmU6IGl0J3MgYSBkZWFkbG9jayB3aGVyZSB0aGUgZHJpdmVyIHdhaXRz
IGZvciB0aGUgYXBwbGljYXRpb24sIGFuZCANCnZpY2UgdmVyc2EuIFRoZSBkcml2ZXIgbmV2ZXIg
cmVhY2hlcyB0aGUgcG9pbnQgd2hlcmUgY29uc190YWlsIGdldHMgDQplcXVhbCB0byBjb25zX2hl
YWQuIEUuZy4sIGlmIGNvbnNfdGFpbCArIDMgPT0gY29uc19oZWFkLCBhbmQgdGhlIGJhdGNoIA0K
c2l6ZSByZXF1ZXN0ZWQgYnkgdGhlIGRyaXZlciBpcyA4LCB0aGUgZHJpdmVyIHdvbid0IHBlZWsg
YW55dGhpbmcgZnJvbSANCnRoZSBmaWxsIHJpbmcgd2FpdGluZyBmb3IgZGlmZmVyZW5jZSBiZXR3
ZWVuIGNvbnNfdGFpbCBhbmQgY29uc19oZWFkIHRvIA0KaW5jcmVhc2UgdG8gYmUgYXQgbGVhc3Qg
OC4gT24gdGhlIG90aGVyIGhhbmQsIHRoZSBhcHBsaWNhdGlvbiBjYW4ndCBwdXQgDQphbnl0aGlu
ZyB0byB0aGUgcmluZywgYmVjYXVzZSBpdCBzdGlsbCB0aGlua3MgdGhhdCB0aGUgY29uc3VtZXIg
aW5kZXggaXMgDQowLiBBcyBjb25zX3RhaWwgbmV2ZXIgcmVhY2hlcyBjb25zX2hlYWQsIHRoZSBj
b25zdW1lciBpbmRleCBkb2Vzbid0IGdldCANCnVwZGF0ZWQsIGhlbmNlIHRoZSBkZWFkbG9jay4N
Cg0KU28sIGluIG15IHZpc2lvbiwgdGhlIGRlY2lzaW9uIHRvIHJlbW92ZSBSWF9CQVRDSF9TSVpF
IGFuZCBwZXJpb2RpYyANCnVwZGF0ZXMgb2YgdGhlIGNvbnN1bWVyIGluZGV4IHdhcyB3cm9uZy4g
SXQgdG90YWxseSBicmVha3MgbWx4NWUsIHRoYXQgDQpkb2VzIGJhdGNoaW5nLCBhbmQgaXQgd2ls
bCBhZmZlY3QgdGhlIHBlcmZvcm1hbmNlIG9mIGFueSBkcml2ZXIsIGJlY2F1c2UgDQp0aGUgYXBw
bGljYXRpb24gY2FuJ3QgcmVmaWxsIHRoZSByaW5nIHVudGlsIGl0IGdldHMgY29tcGxldGVseSBl
bXB0eSBhbmQgDQp0aGUgZHJpdmVyIHN0YXJ0cyB3YWl0aW5nIGZvciBmcmFtZXMuIEkgc3VnZ2Vz
dCB0aGF0IHBlcmlvZGljIHVwZGF0ZXMgb2YgDQp0aGUgY29uc3VtZXIgaW5kZXggc2hvdWxkIGJl
IHJlYWRkZWQgdG8geHNrcV9jb25zX3BlZWtfYWRkci4NCg0KTWFnbnVzLCB3aGF0IGRvIHlvdSB0
aGluayBvZiB0aGUgc3VnZ2VzdGlvbiBhYm92ZT8NCg0KVGhhbmtzLA0KTWF4DQoNCj4+DQo+PiBJ
IHRyYWNrZWQgdGhpcyBpc3N1ZSBpbiBvdXIgaW50ZXJuYWwgYnVnIHRyYWNrZXIgaW4gY2FzZSB3
ZSBuZWVkIHRvDQo+PiBwZXJmb3JtIGFjdHVhbCBkZWJ1Z2dpbmcgb2YgbWx4NWUuIEknbSBsb29r
aW5nIGZvcndhcmQgdG8geW91ciBmZWVkYmFjaw0KPj4gb24gbXkgYXNzdW1wdGlvbiBhYm92ZS4N
Cj4+DQo+Pj4+IFRoZSBoYXJkd2FyZSBJIGFtIHVzaW5nIGlzIGEgTWVsbGFub3ggQ29ubmVjdFg0
IDJ4MTAwRyBjYXJkIChNQ1g0MTZBLUNDQVQpDQo+Pj4+IHJ1bm5pbmcgdGhlIG1seDUgZHJpdmVy
Lg0KPj4NCj4+IFRoaXMgb25lIHNob3VsZCBydW4gd2l0aG91dCBzdHJpZGluZyBSUSwgcGxlYXNl
IHZlcmlmeSBpdCB3aXRoIGV0aHRvb2wNCj4+IC0tc2hvdy1wcml2LWZsYWdzICh0aGUgZmxhZyBu
YW1lIGlzIHJ4X3N0cmlkaW5nX3JxKS4NCj4gDQo+IEkgZG8gbm90IHJlbWVtYmVyIGNoYW5naW5n
IHRoaXMgb3B0aW9uLCBzbyB3aGF0ZXZlciB0aGUgZGVmYXVsdCBpcywgaXMgd2hhdCBpdA0KPiB3
YXMgcnVubmluZyB3aXRoLiBJIGFtIHRyYXZlbGluZyB0aGlzIHdlZWsgYW5kIGRvIG5vdCBoYXZl
IGFjY2VzcyB0byB0aGVzZQ0KPiBzeXN0ZW1zLCBidXQgd2lsbCBlbnN1cmUgdGhhdCB0aGlzIGZs
YWcgaXMgc2V0IHByb3Blcmx5IHdoZW4gSSBnZXQgYmFjay4NCj4gDQoNCg==
