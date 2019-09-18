Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4441B6A4E
	for <lists+xdp-newbies@lfdr.de>; Wed, 18 Sep 2019 20:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbfIRSN3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 18 Sep 2019 14:13:29 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:55221 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbfIRSN2 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 18 Sep 2019 14:13:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id EA60D186E8F;
        Wed, 18 Sep 2019 20:13:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Vitzp8Dq8qdj; Wed, 18 Sep 2019 20:13:23 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id 6869C186834;
        Wed, 18 Sep 2019 20:13:23 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 18 Sep 2019 20:13:23 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Wed, 18 Sep 2019
 20:13:23 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     William Tu <u9012063@gmail.com>
CC:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        "Thomas F Herbert" <therbert@redhat.com>
Subject: RE: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Topic: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Index: AQHVWYvsn8R7cjoUHky0EqUKkC+pt6cIfGjTgAAWY4CAAAnOgIAAMhfwgAsdPkCAC0qWgIASqpAQ
Date:   Wed, 18 Sep 2019 18:13:22 +0000
Message-ID: <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon>
 <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com>
 <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
In-Reply-To: <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.4.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGkNCg0KPiBPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCA5OjM3IEFNIErDumxpdXMgTWlsYW4gPEp1
bGl1cy5NaWxhbkBwYW50aGVvbi50ZWNoPiB3cm90ZToNCj4+DQo+PiBIaSBhbGwNCj4+DQo+PiBS
ZWdhcmRpbmcgNEsgZnJhbWUgc2l6ZSBjb25zdHJhaW50IG9mIEFGX1hEUCwgd2hhdCBkb2VzIEFG
X1hEUCB3aGVuIHJlY2VpdmVzIGZyYW1lIGJpZ2dlciB0aGFuIDRLPyBEcm9wcyBpdCBvciBjdXQg
aXQgb3Igc3BsaXQgaXQgYmV0d2VlbiBtb3JlIGZyYW1lcz8NCj4+IFRoaW5raW5nIGFib3V0IHdo
YXQgdG8gZG8gd2l0aCB0aGVtIG9uIFRYIHNpZGUuDQo+Pg0KPj4gSWYgeW91IGFyZSBpbnRlcmVz
dGVkIGluIG1lbnRpb25lZCBBRl9YRFAgZHJpdmVyIGZvciB2cHAsIGhlcmUgeW91IGNhbiANCj4+
IGZpbmQgaXQ6IGh0dHBzOi8vZ2Vycml0LmZkLmlvL3IvYy92cHAvKy8yMTYwNg0KPg0KPiBIaSBK
w7psaXVzLA0KPg0KPiBJIHRvb2sgYSBsb29rIGF0IHRoZSBwYXRjaCwgSSBjYW4gcGFzc2VkIGNv
bXBpbGUgYnV0IEkgaGF2ZW4ndCBydW4gaXQuDQo+IEluIHRoZSBzcmMvcGx1Z2lucy9hZl94ZHAv
ZGV2aWNlLmMgYW5kIHNyYy9wbHVnaW5zL2FmX3hkcC94c2tfZGVmcy5oLCBzaW5jZSB5b3UgYWxy
ZWFkeSBsaW5rIGxpYmJwZiwgeW91IGNhbiByZW1vdmUgYSBsb3Qgb2YgZXhpc3RpbmcgY29kZSBi
eSB1c2luZyBBRl9YRFAgQVBJcyBpbiBsaWJicGYgKHNlZSB4c2tfcmluZ18qLCB4c2tfdW1lbV8q
KQ0KPg0KPiBJZiB5b3Ugd2FudCB0byBsb2FkIHlvdXIgY3VzdG9tIFhEUCBwcm9ncmFtLCB5b3Ug
Y2FuIGVuYWJsZSBYU0tfTElCQlBGX0ZMQUdTX19JTkhJQklUX1BST0dfTE9BRCBhbmQgbG9hZCBY
RFAgcHJvZ3JhbQ0KDQpUaGFuayB5b3UgV2lsbGlhbSwgSSB1cGRhdGVkIGl0LCBidXQgaXRzIHN0
aWxsIHdvcmsgaW4gcHJvZ3Jlc3MsIEkgaW5zcGlyZWQgYnkgT1ZTIGltcGxlbWVudGF0aW9uIGFz
IHdlbGwuDQoNCj4NCj4gUmVnYXJkcywNCj4gV2lsbGlhbQ0KDQpJIGhhdmUgbmV4dCAyIHF1ZXN0
aW9uczoNCg0KMV0gV2hlbiBJIHVzZSB4c2tfcmluZ19wcm9kX19yZXNlcnZlIGFuZCBzdWNjZXNz
aXZlIHhza19yaW5nX3Byb2RfX3N1Ym1pdC4gSXMgaXQgY29ycmVjdCB0byBzdWJtaXQgYWxzbyBs
ZXNzIHRoYW4gSSByZXNlcnZlZD8NCiAgICBJbiBzb21lIGNhc2VzIEkgY2FuJ3QgZXhhY3RseSBk
ZXRlcm1pbmUgaG93IG11Y2ggdG8gcmVzZXJ2ZSBpbiBhZHZhbmNlLCBzaW5jZSB2cHAgYnVmZmVy
cyBoYXZlIGRpZmZlcmVudCBzaXplIHRoYW4geGRwIGZyYW1lcy4NCg0KMl0gQ2FuIEkgdXNlIGh1
Z2VwYWdlIGJhY2tlZCBtZW1vcnkgZm9yIHVtZW0/IElmIG5vdCwgaXMgaXQgcGxhbm5lZCBmb3Ig
ZnV0dXJlPw0KICAgIFlldCBpdCBkb2VzIGNvcHkgcGFrZXRzIGZyb20gcnggcmluZ3MgdG8gdnBw
IGJ1ZmZlcnMsIGJ1dCBzcGVjdWxhdGluZyBhYm91dCBzdHJhaWdodCB6ZXJvY29weSB3YXkuDQoN
Ck1hbnkgdGhhbmtzDQpKw7psaXVzDQo=
