Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA42A3C28
	for <lists+xdp-newbies@lfdr.de>; Fri, 30 Aug 2019 18:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfH3Qh6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 30 Aug 2019 12:37:58 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:60619 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727914AbfH3Qh6 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 30 Aug 2019 12:37:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 4897C1C28CF;
        Fri, 30 Aug 2019 18:37:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5jE00pBMvl5D; Fri, 30 Aug 2019 18:37:54 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id A86521C28C8;
        Fri, 30 Aug 2019 18:37:53 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 30 Aug 2019 18:37:53 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Fri, 30 Aug 2019
 18:37:53 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        William Tu <u9012063@gmail.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>
CC:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        "Thomas F Herbert" <therbert@redhat.com>
Subject: RE: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Topic: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Index: AQHVWYvsn8R7cjoUHky0EqUKkC+pt6cIfGjTgAAWY4CAAAnOgIAAMhfwgAsdPkA=
Date:   Fri, 30 Aug 2019 16:37:52 +0000
Message-ID: <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon>
 <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> 
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

SGkgYWxsDQoNClJlZ2FyZGluZyA0SyBmcmFtZSBzaXplIGNvbnN0cmFpbnQgb2YgQUZfWERQLCB3
aGF0IGRvZXMgQUZfWERQIHdoZW4gcmVjZWl2ZXMgZnJhbWUgYmlnZ2VyIHRoYW4gNEs/IERyb3Bz
IGl0IG9yIGN1dCBpdCBvciBzcGxpdCBpdCBiZXR3ZWVuIG1vcmUgZnJhbWVzPw0KVGhpbmtpbmcg
YWJvdXQgd2hhdCB0byBkbyB3aXRoIHRoZW0gb24gVFggc2lkZS4NCg0KSWYgeW91IGFyZSBpbnRl
cmVzdGVkIGluIG1lbnRpb25lZCBBRl9YRFAgZHJpdmVyIGZvciB2cHAsIGhlcmUgeW91IGNhbiBm
aW5kIGl0OiBodHRwczovL2dlcnJpdC5mZC5pby9yL2MvdnBwLysvMjE2MDYNCkl0IGlzIHN0aWxs
IHdvcmsgaW4gcHJvZ3Jlc3MsIEkgc3VibWl0dGVkIGl0IGZvciByZXZpZXcganVzdCB5ZXN0ZXJk
YXkgYW5kIHJlYmFzZWQgaXQgb24gcmVjZW50bHkgZm91bmQgY29kZSBpbiByZXZpZXcgb2YgRGFt
amFuLg0KDQpUbyBydW4gaXQsIHlvdSBuZWVkIHRvIGhhdmUgY29tcGF0aWJsZSBYRFAgcHJvZ3Jh
bSBsb2FkZWQgb24gaW50ZXJmYWNlIHlvdSB3YW50IHRvIGF0dGFjaCB0by4NClRoaXMgc2VwYXJh
dGlvbiBpcyBoZXJlIGJlY2F1c2Ugd2Ugd2FudCB1c2VyIHRvIGJlIGFibGUgdG8gY3JlYXRlIGN1
c3RvbSBYRFAgcHJvZ3JhbXMgaW5kZXBlbmRlbnRseS4NCldlIGFsc28gY29uc2lkZXIgYXV0b21h
dGljIGxvYWRpbmcgb2Ygc29tZSBkZWZhdWx0IFhEUCBwcm9ncmFtICh0aGF0IGp1c3QgcmVkaXJl
Y3RzKSBpZiBub25lIGlzIGxvYWRlZCBpbiB0aW1lIG9mIGludGVyZmFjZSBjcmVhdGlvbiwgYnV0
IHRoYXQgaXMgb2YgbWlub3IgcHJpb3JpdHkgZm9yIHVzIHlldC4NCkZvciBsb2FkaW5nIHlvdSBj
YW4gdXNlIGF0dGFjaGVkIGxvYWRlciAoaXQgd2lsbCBiZSBhZGRlZCBmb3IgcmV2aWV3IHNvb24g
YXMgd2VsbCkuIEl0IGp1c3QgbG9hZHMgdGhlIHByb2dyYW0gYW5kIHBpbnMgaXRzIG1hcHMuDQpB
cyBYRFAgcHJvZ3JhbSwgd2UgdXNlIHlldCB4ZHBzb2NrX2tlcm4uYyBmcm9tIGtlcm5lbCB2NS4w
LjAgc291cmNlcyAoYXR0YWNoZWQpLg0KWERQIHByb2dyYW0gY29tcGF0aWJpbGl0eSByZXF1aXJl
bWVudHMgKGZyb20gdnBwIHBvaW50IG9mIHZpZXcpIGFyZToNCmhhdmluZyB4c2ttYXAgY2FsbGVk
ICJ4c2tzX21hcCIgYW5kIHBpbm5lZCBhdCAvc3lzL2ZzL2JwZi88aWZuYW1lPi8NCg0KSSBhZGRl
ZCBzdXBwb3J0IGZvciBtdWx0aXBsZSBxdWV1ZXMgaW50byBteSBwYXRjaCBmb3IgdnBwLCBhcyB3
ZSBkaXNjdXNzZWQgKDEgTklDLCBuIHNvY2tldHMgb24gZGlmZmVyZW50IHF1ZXVlcyksIGJ1dCBJ
IGRpZG4ndCB0ZXN0IGl0IHlldC4gT3RoZXIgdGhpbmdzIHNob3VsZCB3b3JrIGZpbmUuDQpUZXN0
ZWQgb24ga2VybmVsIDUuMC4wLg0KDQpKw7psaXVzDQoNCj4gTWFueSB0aGFua3MgZ3V5cywgdmVy
eSBhcHByZXRpYXRlZC4NCj4NCj4gR29pbmcgdG8gdGFrZSBhIGxvb2sgYXQgT1ZTIGltcGxlbWVu
dGF0aW9uLCBidXQgSSB3b3VsZCBsaWtlIHRvIGVuc3VyZSBzb21ldGhpbmcgYmVmb3JlLg0KPg0K
Pj4+IEkgdG9vayB0aGUgX3VzZXIgcGFydCBhbmQgc3BsaXQgaXQgaW50byB0d286DQo+Pj4NCj4+
PiAibG9hZGVyIiAtICBFeGVjdXRlZCBvbmNlIHRvIHNldHVwIGVudmlyb25tZW50IGFuZCBvbmNl
IHRvIGNsZWFudXAsIGxvYWRzIF9rZXJuLm8sIGF0dGFjaGVzIGl0IHRvIGludGVyZmFjZSBhbmQg
cGluIG1hcHMgdW5kZXIgL3N5cy9mcy9icGYuDQo+Pj4NCj4+PiBhbmQNCj4+Pg0KPj4+ICJ3b3Jr
ZXIiIC0gRXhlY3V0ZWQgYXMgbWFueSBhcyByZXF1aXJlZC4gRXZlcnkgaW5zdGFuY2UgbG9hZHMg
bWFwcyBmcm9tIC9zeXMvZnMvYnBmLCBjcmVhdGUgb25lIEFGX1hEUCBzb2NrLCB1cGRhdGUgeHNr
cyByZWNvcmQgYW5kIHN0YXJ0IGxpc3Rlbi9wcm9jZXNzIHBhY2tldHMgZnJvbSBBRl9YRFAgKGlu
IHRlc3Qgc2NlbmFyaW8gd2UgYXJlIHVzaW5nIGwyZndkIGJlY2F1c2Ugb2Ygd3JpdGUtYmFjayku
IEkgaGFkIHRvIGFkZCBtaXNzaW5nIGNsZWFudXBzIHRoZXJlKCBjbG9zZShmZCksIG11bm1hcCgp
KS4gVGhpcyBzaG91bGQgYmUgdnBwIGluIGZpbmFsIHNvbHV0aW9uLg0KPj4+DQo+Pj4gU28gZmFy
IHNvIGdvb2QuDQo+Pj4NCj4+PiBJJ20gdW5hYmxlIHRvIHN0YXJ0IG1vcmUgdGhhbiBvbmUgd29y
a2VyIGR1ZSB0byBwcmV2aW91c2x5IG1lbnRpb25lZCBlcnJvci4gRmlyc3QgaW5zdGFuY2Ugd29y
a3MgcHJvcGVybHksIGV2ZXJ5IG90aGVyIGZhaWxzIG9uIGJpbmQgKGxpbmVubyBtYXkgbm90IG1h
dGNoIGR1ZSB0byBsb2NhbCBjaGFuZ2VzKToNCj4+Pg0KPj4+IHhkcHNvY2tfdXNlci5jOnhza19j
b25maWd1cmU6NTk1OiBBc3NlcnRpb24gZmFpbGVkOiBiaW5kKHNmZCwgKHN0cnVjdCBzb2NrYWRk
ciAqKSZzeGRwLCBzaXplb2Yoc3hkcCkpID09IDA6IGVycm5vOiAxNi8iRGV2aWNlIG9yIHJlc291
cmNlIGJ1c3kiDQo+Pj4NCj4+Pg0KPj4gSSBkb24ndCB0aGluayB5b3UgY2FuIGhhdmUgbXVsdGlw
bGUgdGhyZWFkcyBiaW5kaW5nIG9uZSBYU0ssIHNlZQ0KPj4geHNrX2JpbmQoKSBpbiBrZXJuZWwg
c291cmNlLg0KPj4gRm9yIEFGX1hEUCBpbiBPVlMsIHdlIGNyZWF0ZSBtdWx0aXBsZSBYU0tzLCBu
b24tc2hhcmVkIHVtZW0gYW5kIGVhY2ggDQo+PiBoYXMgaXRzIHRocmVhZC4NCj4NCj4gSW4gT1ZT
LCBjYW4geW91IGJpbmQgdHdvIHNvY2tldHMgd2l0aCBub24tc2hhcmVkIHVtZW0gdG8gdGhlIHNh
bWUgaW50ZXJmYWNlPw0KPiBPdXIgZ29hbCBpcyB0byBoYXZlIDIgb3IgbW9yZSBwcm9jZXNzZXMg
KFZQUHMpIGxpc3RlbmluZyBvbiB0aGUgc2FtZSBpbnRlcmZhY2UgdmlhIFhEUCBzb2NrZXQsIHdo
aWxlIFhEUCBwcm9ncmFtIGRlY2lkZXMgd2hlcmUgdG8gcmVkaXJlY3QgdGhlIHBhY2tldHMgYXQg
dGhlIG1vbWVudC4NCj4NCj4gQmVzdCBSZWdhcmRzDQo+IEp1bGl1cw0KDQo=
