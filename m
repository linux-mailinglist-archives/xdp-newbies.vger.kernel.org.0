Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539D434FE5
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Jun 2019 20:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfFDSgA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Jun 2019 14:36:00 -0400
Received: from mail-eopbgr10068.outbound.protection.outlook.com ([40.107.1.68]:28418
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726317AbfFDSgA (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 4 Jun 2019 14:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtokH8Z8nplWY+iDUJzPh+go8si1/NFzQXyyiOTAkXE=;
 b=j2mTNxe6wze1JhhxtSGfGR3/MWidFsYktowyGYAwOy35BZ6cT8ZTMsrecNcf5UdOw0L4Y1r3WJxyZ7QqT1WIvlkP0nX9r3eiq5Md0lKKiY6UuoLRKLtxGeOYXXQ3Aa24IK8uOHzyj9EqROfteXLmFVdx3eJf30ncorYJmQxYElI=
Received: from DB8PR05MB5898.eurprd05.prod.outlook.com (20.179.9.32) by
 DB8PR05MB6123.eurprd05.prod.outlook.com (20.179.11.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 18:35:55 +0000
Received: from DB8PR05MB5898.eurprd05.prod.outlook.com
 ([fe80::4008:6417:32d4:6031]) by DB8PR05MB5898.eurprd05.prod.outlook.com
 ([fe80::4008:6417:32d4:6031%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 18:35:55 +0000
From:   Saeed Mahameed <saeedm@mellanox.com>
To:     "barbette@kth.se" <barbette@kth.se>,
        Eran Ben Elisha <eranbe@mellanox.com>,
        Maxim Mikityanskiy <maximmi@mellanox.com>,
        "brouer@redhat.com" <brouer@redhat.com>
CC:     "toke@redhat.com" <toke@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Leon Romanovsky <leonro@mellanox.com>,
        Tariq Toukan <tariqt@mellanox.com>
Subject: Re: Bad XDP performance with mlx5
Thread-Topic: Bad XDP performance with mlx5
Thread-Index: AQHVF31SvxJdkDKYhE6W4OKABWlB96aFae6AgAAeF4CABZctAIAAuoGA
Date:   Tue, 4 Jun 2019 18:35:55 +0000
Message-ID: <822346c51bd76ec2ea5344bd669a9bfbe6bf7719.camel@mellanox.com>
References: <d7968b89-7218-1e76-86bf-c452b2f8d0c2@kth.se>
         <20190529191602.71eb6c87@carbon>
         <0836bd30-828a-9126-5d99-1d35b931e3ab@kth.se>
         <20190530094053.364b1147@carbon>
         <d695d08a-9ee1-0228-2cbb-4b2538a1d2f8@kth.se>
         <2218141a-7026-1cb8-c594-37e38eef7b15@kth.se>
         <20190531181817.34039c9f@carbon>
         <19ca7cd9a878b2ecc593cd2838b8ae0412463593.camel@mellanox.com>
         <9f116335-0fad-079b-4070-89f24af4ab55@kth.se>
In-Reply-To: <9f116335-0fad-079b-4070-89f24af4ab55@kth.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.2 (3.32.2-1.fc30) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saeedm@mellanox.com; 
x-originating-ip: [209.116.155.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4acdf266-0501-4126-1fe0-08d6e91b7b01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB8PR05MB6123;
x-ms-traffictypediagnostic: DB8PR05MB6123:
x-microsoft-antispam-prvs: <DB8PR05MB6123460EA4F42617BA35AFAEBE150@DB8PR05MB6123.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(366004)(346002)(39860400002)(199004)(189003)(118296001)(91956017)(8676002)(6246003)(107886003)(86362001)(305945005)(6506007)(7736002)(71190400001)(3846002)(71200400001)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(53936002)(81166006)(2501003)(25786009)(4326008)(81156014)(8936002)(76176011)(66066001)(110136005)(66574012)(316002)(54906003)(68736007)(476003)(73956011)(6116002)(99286004)(508600001)(6512007)(58126008)(2906002)(6486002)(102836004)(256004)(11346002)(26005)(2616005)(446003)(5660300002)(6436002)(14454004)(229853002)(36756003)(486006)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR05MB6123;H:DB8PR05MB5898.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JLhwbCRq8/V0/+Lts8n6CMEIrnelMGjbZ18KmIKmCsw6Dg+iToh3poA4+yaGZy99PEGPvPWZ7gMKxcnFLlr2DcQm3mmKzAPg7wmhDnlSSRkoff8ix7s1wW20XYcQELysLyIW7+yJ4GLRN5SeAeuMa3dizm22TiGHQOOD9azcCrbjVySZ8HTjL/J39Xzu/m1Gx0LbAXLayIwooknEOvymtQH6RJIRls4gZireYTOPEeDnDVCVW2mbuOCpsVdofeGgJ1SRT+Nt2u2GBIaS2ze38rALb7UQN4vHvPl5Sqz4mzVIc9Br5+9qfZ5+MLEpAXjAoVsJtWBAyRyE49G+T4drgrREyyfnDogd6E2vtynVwbvH5s5/J+J6DyQgemFJw6Xz0XbLwmPapXu7lPQ2OvOjP7G7NzRrXUOXZztcsMaCoHk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3D9AEA1EECD4944BABA5A37798A13CD@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acdf266-0501-4126-1fe0-08d6e91b7b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 18:35:55.4735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: saeedm@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR05MB6123
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDA5OjI4ICswMjAwLCBUb20gQmFyYmV0dGUgd3JvdGU6DQo+
IExlIDMxLzA1LzIwMTkgw6AgMjA6MDYsIFNhZWVkIE1haGFtZWVkIGEgw6ljcml0IDoNCj4gPiBU
aGUgcXVlc3Rpb24gaXMsIE9uIHRoZSBzYW1lIHBhY2tldCByYXRlL2JhbmR3aWR0aCBkbyB5b3Ug
c2VlDQo+ID4gaGlnaGVyDQo+ID4gY3B1IHV0aWxpemF0aW9uIG9uIG1seDUgY29tcGFyZWQgdG8g
b3RoZXIgZHJpdmVycz8geW91IGhhdmUgdG8NCj4gPiBjb21wYXJlDQo+ID4gYXBwbGVzIHRvIGFw
cGxlcy4NCj4gPiANCj4gSSBtZWFudCByZWxhdGl2ZSBpbmNyZWFzZS4gT2YgY291cnNlIGF0IDQw
RyB0aGUgWEw3MTAgaXMgdXNpbmcgbGVzcw0KPiBDUFUsIA0KPiBidXQgYWN0aXZhdGluZyBYRFAg
aXMgbmVhcmx5IGZyZWUuIEFzIFhEUCBpcyBwdXJlbHkgcGVyIHBhY2tldCBJDQo+IHdvdWxkIA0K
PiBleHBlY3QgdGhlIGNvc3Qgb2YgaXQgdG8gYmUgc2ltaWxhci4gRWcsIGEgZmV3IGluc3RydWN0
aW9ucyBwZXINCj4gcGFja2V0Lg0KPiANCj4gDQo+IFRoYW5rcyBKZXNwZXIgZm9yIGxvb2tpbmcg
aW50byB0aGlzIQ0KPiANCj4gSSBkb24ndCB0aGluayBJIHdpbGwgYmUgb2YgbXVjaCBoZWxwIGZ1
cnRoZXIgb24gdGhpcyBtYXR0ZXIuIE15IHRha2UNCj4gb3V0IA0KPiB3b3VsZCBiZTogYXMgYSBm
aXJzdC10aW1lIHVzZXIgbG9va2luZyBpbnRvIFhEUCBhZnRlciB3YXRjaGluZyBhDQo+IGRvemVu
IA0KPiBvZiBYRFAgdGFsa3MsIEkgd291bGQgaGF2ZSBleHBlY3RlZCBYRFAgZGVmYXVsdCBzZXR0
aW5ncyB0byBiZQ0KPiBpZGVudGljYWwgDQo+IHRvIFNLQiwgc28gSSBkb24ndCBoYXZlIHRvIHdh
dGNoIG91dCBmb3IgYSBzZXQgb2YgcGVyLWRyaXZlcg0KPiBwYXJhbWV0ZXIgDQo+IGNoZWNrbGlz
dCB0byBhdm9pZCBpbmNyZWFzaW5nIG15IENQVSBjb25zdW1wdGlvbiBieSAxNSUgd2hlbg0KPiBp
bnNlcnRpbmcgDQo+ICJhIHN1cGVyIGVmZmljaWVudCBhbmQgbGlnaHQgQlBGIHByb2dyYW0iLiBC
dXQgSSB1bmRlcnN0YW5kIGl0J3Mgbm90IA0KPiB0aGF0IGVhc3kuLi4NCj4gDQoNCkhpIFRvbSwN
Cg0KRG9uJ3QgZ2l2ZSB1cCBzbyBlYXN5IG9uIFhEUCA6KQ0KbGV0IG1lIGRvIGEgcXVpY2sgdGVz
dCBhbmQgc2VlIGhvdyB3ZSBjYW4gaGVscCBoZXJlLiANCg0KPiBUb20NCg==
