Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47DC2590F71
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 Aug 2022 12:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbiHLK3d (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 Aug 2022 06:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbiHLK3c (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 Aug 2022 06:29:32 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2018.outbound.protection.outlook.com [40.92.91.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07D3A6C01
        for <xdp-newbies@vger.kernel.org>; Fri, 12 Aug 2022 03:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axjalxLYx8JBbqhmcyTxfcdqB2SUrq70j75roD0E+OdnzeI2P7kxdPAtA0BSgeMkvTvfll3LNY5eOu2Wc1h4O39voeLl9EuqOfB6UUukwpf5L3l3OTh1yZTYAv/nG381S9DfI47HH+7Cor2OR5gR1dJgwxOuj+vNv7jON6o9DXLqLCBISvsuNvNFoPoDVJERCIHMaXeWzpt20a83nW0+35lvcVQBBUJa/uERI1eRaeLRsDZ4zokiCrG0Ivj7B2caXvXjgNYluVfjcB8zPr1ZlqZWvr8326yc0FUtCUp2ZCCLHwo0/6wUUXNbcEf91j1u2LYYz2I4TmvBwF2g52Jj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5p+JEMAVsI4zEyH2X40w0yYje9hTB4NdUgz7TaEG2Y=;
 b=WHCfv8v0v0v4ZedngGYsYMpCCjTi7E/BCwC8RZ0piG2dv2G/c2Hetg5in+W4bvw48q6TR0k19OiS3tltSYOG4SHtC3qPyfE8qhvhk/FHziUL94SP1l91eCuqJUB3BrhAbEesJ4Ue3hxJu4AsQfUHoVagZwL8sxe2Dr305LFigtLv5HTAg2nQcqy1FWtB9QpstFO9B9TYgTu4pvV4uc/SpaPXETMYED1i3jdOzUIau1e3tVhM0YEBcRL7ZBf38xzpVBlkoRvoMh2tJXmmWfS0zhIEholUiRlNXNSzgFFADkqirDtfFS3HwzgdgXw4T2XR7+zUafFv8fg9sD+ZxqWGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5p+JEMAVsI4zEyH2X40w0yYje9hTB4NdUgz7TaEG2Y=;
 b=sBD+sX/UaUkFuFyxrj2rrvr4LBZbSUmlHBcq0Z3NhZ7BipemK0csisV9GOW4Dlmkby0s25ta6Nwp4PeNN3GvF2OT2eGpmtDw/07D1grz6Se9vmj5oI5/QDkKsQOSYJhxV1Jaz85UT/C3i+KiHUC8Z19Y5l9nSsap3DvIDUTBDxwBQjEzJNYBwyF5k3HqXT4O0DAYngHrMoiQOEf5WyIwGlM54v8qD/IeaRmj2eANXLMmsez6FJxQhLDvXFtEJjaOwxaiEeETnskNTChcv/cREIlg/8T6n5mY4Ewon705oAK1tPDsPlDPsNKV0MmoDxf7PEG7lKUql6rv1NAhitDz+g==
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com (2603:10a6:20b:361::18)
 by HE1PR06MB3083.eurprd06.prod.outlook.com (2603:10a6:7:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 10:29:28 +0000
Received: from AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972]) by AM8PR06MB7684.eurprd06.prod.outlook.com
 ([fe80::e8ae:4899:d804:1972%9]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 10:29:28 +0000
From:   Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC:     "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Thread-Topic: [PATCH bpf] xsk: fix corrupted packets for XDP_SHARED_UMEM
Thread-Index: AQHYrXlMrW99hv0taUWEHF7nsHFR4a2p8loAgAARSQCAAMLSgIAAS2SA
Date:   Fri, 12 Aug 2022 10:29:28 +0000
Message-ID: <B97FAE5B-BFF0-4433-AEE5-47DF87711783@outlook.com>
References: <20220811115523.30742-1-magnus.karlsson@gmail.com>
 <657EB4B7-31EC-40B9-AED0-7761A77463BA@outlook.com> <YvVI3BKjmXUBhd8N@boxer>
 <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
In-Reply-To: <CAJ8uoz0tFG0bpFFpWymyPOJ7Nfmw2Ns5dLLki+NDQHeUWtwS0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [5+B/qf7uaYB+DoIsyDGYR1lFnewTgaDN]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ed3e70a-e1f0-43a8-8666-08da7c4d8974
x-ms-traffictypediagnostic: HE1PR06MB3083:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ACWr2J80rJp4oWdmhVNIj0x0gjkpe0BNcsptuiZoGKSuvyYJXMcrSIcdFJQMitkEF/VSBUeEEhUZ4ro5Yrxz3Y4uaQ8GpQCcscIvMeiW2MlMiTNZzXh9wnRBZ49K83pg75H0MXHlpAC/amC42uIv84+bznZMKl/+UGJZJhDHXMBMEQ9wYfzE6UdwPlthMpNooJjoU1N8gYpuoubvvaDSxoJ4pCwn1PK1VpGL4DD1RN9NydIbvJgnZQHjFAZeWyn9Ryj1AQkIk56HSwsuvhN5PJZyjC9PnLkNrAvW1a9SZYVldoCKfSOk81t85K7HBA3wn6pLeZMd8Ji8K39FPLsVYapoBYQwLaFyFuMNBkxPUw4JOEv2bVJdiUWcJlUQUe7Qt1JNuCAJRJZU7UfE4R5d9VFTriJ3i+a0Emg7498fgQOi1hS/nBNaDI1Bam3htd/YCJgSAXw3Ih1UDXeuU8RNs1h/Xpq2tufVQIudUkt79ds1YWenWUDDe20RRAPFNlz8YsvRbUdpVUbC+l+POX0AUNPKrpndVRiOYPCrNoaYSy/XuzmCAe98nqqu97JPKvc67gK9lOS50k6OmIyeOPI2p3gNlql8YZNA62G7EQeRSchcrvJNUGj0gZX7hB7e4lsoz5Gl7ZKK5duieqlNpIae/60dgpUhyMEyFoH/9hQVTSgjnDL5heeCJ3S+J1j0nbtF
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUc5dms4QWNHSHNtcWE2eVM2SGpCdmRwSnB0S0FZdnh5NjgxZVVqMitVa3E3?=
 =?utf-8?B?ckozMFQ1eVV4UWdwOERZRFdER3FUWll1SWVjMk5ob0Urc0RuUVY5YVk0TGgx?=
 =?utf-8?B?T1YwOGpNSEkxcGxIeUZKT1pyOVdoVlA5YlFpUFF0Ui9LYW1yV2xTM0cwd1Jw?=
 =?utf-8?B?bzlsNW43TzdZOEczV2lJREp3QXhuYU5Ybm55WDZSSy9qWUMrckJvVTVhdFBy?=
 =?utf-8?B?aTFTenBmVTFEZk80SkxNM1UveFdFR3h1R25hNGtDaitzV3N6OVhyR25hcis3?=
 =?utf-8?B?by9XV3Y0dGRWcnd2YytMWkxKT0pWUVYrNUZqUCtYRFVxM2p1a2E3WjNQUTBt?=
 =?utf-8?B?L3BBREJiWm5MVFJRTFM2cTBKNXZoYm9GbUFEa0dxUlVwZW5hbEZaQ1dEM28z?=
 =?utf-8?B?cWNtNDA5b3Z0NllWenhVeHlPaWRmVlZsWWV1Y1BUdmtWYmJEQW5KS3V1ZzBr?=
 =?utf-8?B?K1ltYWQ4cEJjZ21JQnkrWExNN1FNTnpIR1M0T2ZHQXRXa2R5YjliY25Mdzd1?=
 =?utf-8?B?NXZpS2xUVUZIajliU21IMlQrN0lwdDA4THlCaVo5OTZ1QWxyQmJyVkEvTEt3?=
 =?utf-8?B?anJSOVptWi9UQXVnaHRYclRsSFNJei9TZTRsZVhlTGljS0FCY1RBcWw2eVdQ?=
 =?utf-8?B?cHk1UmF3bWZvakN4ZkxRdGdyUzd2U1AvRzBOMmRudjlpN0pMMVVhNERBT1Ix?=
 =?utf-8?B?S1BvRnJHYjgra0dmSURXWWhmM2pySHo0a3QyRkxpTkk5OTgvQ0NsWFhVczBQ?=
 =?utf-8?B?OEVZY2xjYU9XeWdCbGxQc3R1M1BXK3ZEYndVNm54UVNQMVFBYW9mU2JDVndC?=
 =?utf-8?B?akFpSlFzN2psZFdYTHpzdGZ3SVAxOVdhRlVoMWxDUW00Qkt2SE5xYVh1eHhU?=
 =?utf-8?B?YUlPamIvN3lwU0I4c1Y1M2ZwSEhtMWJoUHMyNjFGZU1QQ2NLcElXNTlESExz?=
 =?utf-8?B?T2xxRDI0bHkwN2gzM2NCOU9oc1pZRllDb3ZMUGVhSEVOdUM3S2JGdHNVaUI4?=
 =?utf-8?B?K3F0Y1RmL3JIYzhKOW1TZ0F2Y1ozY0JNa2FNTFEycnpKUGJVUXFRUWdjSWIz?=
 =?utf-8?B?QUNRMGVGWjBJNUtyOGJSMWNWYzdpTm5uWVNsNG1WSlc5RmoxWnNxN25NVmdu?=
 =?utf-8?B?ZG82ZTh2eWo0T0RHeXhNS2Q3T3lybVRLMlBEcStwRkkzSlF4a2hnYUVmRFZS?=
 =?utf-8?B?RlZGVDBLaThJeXluRHREaUQ0Z2U4OG5BRUVORmpVQWxRSVNYWVh1TmhUcWls?=
 =?utf-8?B?UndYRzlVYjU4WFZjaHlGaUZhd3pDRnA5ZFpMRHJrZ28wSGVXUWpsUlZQWCtw?=
 =?utf-8?B?TWpNbTZZQ2xlUXVpdmdVMTFNSWpwSnBUUnc5NUM3R0V1MXRacU5WWWRZdlB6?=
 =?utf-8?B?allkMVlOT1BjQzdDS0dDUWdKQ0FoRlUwakpoMWNrR1RGdVFjb3pLSjhPMTVR?=
 =?utf-8?B?Sy9xMFY0dmRMRU9lbS9MYndna0gzMzc2STJlWHd5WEkwc3BzSW51MXpsdkhZ?=
 =?utf-8?B?aVFmVE9QK1cxREJDemNSaXJKZ05HK2lUZGVzcmZlQVJaeW9CbjFJRGRYUHpT?=
 =?utf-8?B?eHZ4SmZEMjZRK3dnbWY4ZWJadjFhVXdZNmZjNTMvRFp1bTcwdFdOdEppa3Jr?=
 =?utf-8?B?Q1N6b1dweHZVdERKazU1dlQ1YWh0a3Y5TUIxaVErU1lYazkyOGx5RHcxTFFh?=
 =?utf-8?B?KzRuczUrU25xb05NK2hsTWZEWWNuVk5lZE1DcG1JVDlTczJhei8vR2tXdVBV?=
 =?utf-8?Q?38ost9REtQtnb63RHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CDC30B831431949B5289BE32311265C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7684.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed3e70a-e1f0-43a8-8666-08da7c4d8974
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 10:29:28.6632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB3083
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

TWFjaWVqLCBNYWdudXMsDQoNCj4+IEkgaGF2ZSBqdXN0IHNlbnQgcGF0Y2hlcyBhbmQgQ0NlZCB5
b3Ugb24gdGhlbSB3aGljaCBzaG91bGQgYWRkcmVzcyB0aGUNCj4+IGlzc3VlIHlvdSBhcmUgb2Jz
ZXJ2aW5nLiBJIHdpbGwgYmUgZ3JhdGVmdWwgaWYgeW91IGNvdWxkIHRlc3QgdGhlbSBvbiB5b3Vy
DQo+PiBzaWRlIGFuZCBnZXQgYmFjayB0byB1cyB3aXRoIHJlc3VsdHMuIElmIHRoaXMgd29uJ3Qg
aGVscCB0aGVuIHdlJ2xsIG5lZWQNCj4+IHRvIGRpZyB0aGlzIG1vcmUuDQoNCj4+IFdoYXQgcmlu
ZyBzaXplIHlvdSdyZSB1c2luZz8NCg0KSeKAmXZlIGFwcGxpZWQgYm90aCBvZiB0aG9zZSBwYXRj
aGVzIG9uIHRvcCBvZiB0aGUgcGF0Y2ggZnJvbSBNYWdudXMgdGhlIG90aGVyIGRheSAoaW5jbHVk
aW5nIHRoZSBpZiAoIXBvb2wtPnVuYWxpZ25lZCkgdHdlYWsgYmVsb3cpLg0KDQpXaXRoIGJvdGgg
TklDIHR4IGFuZCByeCByaW5ncyBhdCA0MDk2LCB1c2luZyB4ZHBzb2NrX211bHRpLCBhbGwgcXVl
dWVzIG5vdyBzZWVtIHRvIHNlZSBwcm9jZXNzIHBhY2tldHMsIHdoaWNoIGlzIGdvb2QsIGJ1dCBv
bmx5IHVwIHRvIH40MDk2IHBhY2tldHMgYmVmb3JlIHN0YWxsaW5nLg0KDQpIb3dldmVyLCB5b3Vy
IGFkZGl0aW9uYWwgcXVlc3Rpb24gYWJvdXQgcmluZyBzaXplIGdvdCBtZSB0byB0cnkgYSB0eC9y
eCByaW5nIHNpemUgb2YgMjA0OCBlYWNoLCBhbmQgaXQgc3ByaW5ncyB0byBsaWZlISAyTXBwcyBs
MmZ3ZCBwZXIgcXVldWUgb24gOCBxdWV1ZXMgd2l0aCB4ZHBzb2NrX211bHRpLiBSZXBlYXRlZCB3
aXRoIDQgcXVldWVzLCAyIHF1ZXVlcyBldGMgYW5kIGFsbCBsb29raW5nIGdvb2QuDQoNClNlZW1z
IElDRSBkb2VzbuKAmXQgbGlrZSBhIDQwOTYgcmluZyBzaXplIGF0bS4gOi0pDQoNCg0KPiBUaGFu
ayB5b3Ugc28gbXVjaCBmb3IgdGVzdGluZyBBbGFzZGFpci4gSSBiZWxpZXZlIHlvdXIgdGVzdHMg
YXJlDQo+IHN1Y2Nlc3NmdWwgaW4gdGVybXMgb2Ygbm90IGdldHRpbmcgY29ycnVwdGVkIHBhY2tl
dHMgYW55bW9yZSwgd2hpY2ggaXMNCj4gdGhlIG9ubHkgdGhpbmcgdGhlIHBhdGNoIEkgc2VudCB3
aWxsIGZpeC4gU28gd2Ugc3RpbGwgaGF2ZSB0d28NCj4gcHJvYmxlbXMgdG8gZml4IGZvciB5b3U6
DQo+IA0KPiAxOiBSU1Mgbm90IHdvcmtpbmcgY29ycmVjdGx5IGZvciBFODEwLCB3aGljaCBpcyB3
aGF0IE1hY2llaiBpcw0KPiBhZGRyZXNzaW5nIGluIGhpcyBwYXRjaCBzZXQNCj4gMjogVGhlIHF1
ZXVlIHN0YWxscyBhZnRlciA0SyBwYWNrZXRzLg0KPiANCj4gSSBjYW4gdGFrZSBhIGxvb2sgYXQg
IzIgdXNpbmcgdGhlIGFwcGxpY2F0aW9uIHlvdSBzZW50LCBidXQgYWZ0ZXINCj4gYXBwbHlpbmcg
bXkgcGF0Y2ggYW5kIE1hY2llaidzLg0KDQoNCj4+Pj4gc3RhdGljIGludCB4cF9pbml0X2RtYV9p
bmZvKHN0cnVjdCB4c2tfYnVmZl9wb29sICpwb29sLCBzdHJ1Y3QgeHNrX2RtYV9tYXAgKmRtYV9t
YXApDQo+Pj4+IHsNCj4+Pj4gKyAgIHUzMiBpOw0KPj4+PiArDQo+Pj4+ICsgICBmb3IgKGkgPSAw
OyBpIDwgcG9vbC0+aGVhZHNfY250OyBpKyspIHsNCj4+Pj4gKyAgICAgICAgICAgc3RydWN0IHhk
cF9idWZmX3hzayAqeHNrYiA9ICZwb29sLT5oZWFkc1tpXTsNCj4+Pj4gKw0KPj4+PiArICAgICAg
ICAgICB4cF9pbml0X3hza2JfZG1hKHhza2IsIHBvb2wsIGRtYV9tYXAtPmRtYV9wYWdlcywgeHNr
Yi0+b3JpZ19hZGRyKTsNCj4+Pj4gKyAgIH0NCj4+Pj4gKw0KPiANCj4gVGhpcyBmb3IgbG9vcCBu
ZWVkcyB0byBiZSBwcm90ZWN0ZWQgd2l0aCBhbiBpZiAoIXBvb2wtPnVuYWxpZ25lZCksIGJ1dA0K
PiBJIHdpbGwgbm90IHNlbmQgb3V0IGEgbmV3IHZlcnNpb24gaGVyZS4gSXQgd2lsbCBiZSBpbiB0
aGUgdmVyc2lvbiBzZW50DQo+IHRvIHRoZSBuZXRkZXYgbWFpbGluZyBsaXN0Lg0KDQpUbyBjb25m
aXJtIEkgYXBwbGllZCB0aGlzIGFzIHdlbGwgYmVmb3JlIGFwcGx5aW5nIE1hY2llauKAmXMgcGF0
Y2hlcy4NCg0KTm93IHdlIGNhbiBub3cgcnVuIHhkcHNvY2tfbXVsdGkgd2l0aCByaW5nIHNpemVz
IGF0IDIwNDggb2theSwgSeKAmWxsIHNwaW4gdXAgb3VyIHNvZnR3YXJlIHN0YWNrIG9uIHRoaXMg
cGF0Y2hlZCBrZXJuZWwgdG8gdmFsaWRhdGUgdGhhdCBzaWRlIG9mIHRoaW5ncyB0b28uDQoNClRo
YW5rIHlvdSBib3RoISENCkFsYXNkYWlyDQoNCg==
