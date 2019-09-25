Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949B5BD87A
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Sep 2019 08:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442332AbfIYGqk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Sep 2019 02:46:40 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:57783 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442331AbfIYGqk (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Sep 2019 02:46:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 5AA9F179935;
        Wed, 25 Sep 2019 08:46:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ee7NeOhEioic; Wed, 25 Sep 2019 08:46:33 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex2.pantheon.local [10.101.4.6])
        by lb.pantheon.sk (Postfix) with ESMTPS id 09E8469C28;
        Wed, 25 Sep 2019 08:46:32 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex2.pantheon.local (10.101.4.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 25 Sep 2019 08:46:32 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Wed, 25 Sep 2019
 08:46:32 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     Eelco Chaudron <echaudro@redhat.com>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        William Tu <u9012063@gmail.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Subject: RE: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Topic: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Index: AQHVWYvsn8R7cjoUHky0EqUKkC+pt6cIfGjTgAAWY4CAAAnOgIAAMhfwgAsdPkCAC0qWgIASqpAQgADANICABoW/4IAAImUAgALaJZA=
Date:   Wed, 25 Sep 2019 06:46:32 +0000
Message-ID: <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon>
 <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com>
 <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
 <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech>
 <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
 <966e40dda4654444a420b935ad970d18@pantheon.tech>
 <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
In-Reply-To: <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
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

SGkgRWVsY28NCg0KPiBDdXJyZW50bHksIE9WUyB1c2VzIHRoZSBtbWFwZWQgbWVtb3J5IGRpcmVj
dGx5LCBob3dldmVyIG9uIGVncmVzcywgaXQgaXMgY29weWluZyB0aGUgbWVtb3J5IHRvIHRoZSBl
Z3Jlc3MgaW50ZXJmYWNlIGl04oCZcyBtbWFwZWQgbWVtb3J5LiANCkdyZWF0LCB0aGFua3MgZm9y
IG1ha2luZyB0aGlzIGNsZWFyIHRvIG1lLg0KDQo+IEN1cnJlbnRseSwgT1ZTIHVzZXMgYW4gQUZf
WERQIG1lbW9yeSBwb29sIHBlciBpbnRlcmZhY2UsIHNvIGEgZnVydGhlciBvcHRpbWl6YXRpb24g
Y291bGQgYmUgdG8gdXNlIGEgZ2xvYmFsIG1lbW9yeSBwb29sIHNvIHRoaXMgZXh0cmEgY29weSBp
cyBub3QgbmVlZGVkLg0KSXMgaXQgZXZlbiBwb3NzaWJsZSB0byBtYWtlIHRoaXMgZnVydGhlciBv
cHRpbWl6YXRpb24/IFNpbmNlIGV2ZXJ5IGludGVyZmFjZSBoYXMgaXQncyBvd24gbm9uLXNoYXJl
ZCB1bWVtLCBzbyBmcm9tIG15IHBvaW50IG9mIHZpZXcsIGF0IGxlYXN0IG9uZQ0KY29weSBmb3Ig
Y2FzZSBhcyB5b3UgZGVzY3JpYmVkIGFib3ZlICh3aGVuIFJYIGludGVyZmFjZSBpcyBkaWZmZXJl
bnQgdGhlbiBUWCBpbnRlcmZhY2UpIGlzIG5lY2Vzc2VyeS4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8NCg0KSsO6bGl1cw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRWVs
Y28gQ2hhdWRyb24gW21haWx0bzplY2hhdWRyb0ByZWRoYXQuY29tXSANClNlbnQ6IE1vbmRheSwg
U2VwdGVtYmVyIDIzLCAyMDE5IDM6MDIgUE0NClRvOiBKw7psaXVzIE1pbGFuIDxKdWxpdXMuTWls
YW5AcGFudGhlb24udGVjaD4NCkNjOiBNYWdudXMgS2FybHNzb24gPG1hZ251cy5rYXJsc3NvbkBn
bWFpbC5jb20+OyBXaWxsaWFtIFR1IDx1OTAxMjA2M0BnbWFpbC5jb20+OyBCasO2cm4gVMO2cGVs
IDxiam9ybi50b3BlbEBpbnRlbC5jb20+OyBNYXJlayBaw6F2b2Rza8O9IDxtYXJlay56YXZvZHNr
eUBwYW50aGVvbi50ZWNoPjsgSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8YnJvdWVyQHJlZGhhdC5j
b20+OyB4ZHAtbmV3Ymllc0B2Z2VyLmtlcm5lbC5vcmc7IEthcmxzc29uLCBNYWdudXMgPG1hZ251
cy5rYXJsc3NvbkBpbnRlbC5jb20+OyBUaG9tYXMgRiBIZXJiZXJ0IDx0aGVyYmVydEByZWRoYXQu
Y29tPjsgS2V2aW4gTGFhdHogPGtldmluLmxhYXR6QGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBB
Rl9YRFAgaW50ZWdyYXRpb24gd2l0aCBGRGlvIFZQUD8gKFdhczogUXVlc3Rpb25zIGFib3V0IFhE
UCkNCg0KDQoNCk9uIDIzIFNlcCAyMDE5LCBhdCAxMTowMCwgSsO6bGl1cyBNaWxhbiB3cm90ZToN
Cg0KPiBNYW55IFRoYW5rcyBNYWdudXMNCj4NCj4+PiBJIGhhdmUgbmV4dCAyIHF1ZXN0aW9uczoN
Cj4+Pg0KPj4+IDFdIFdoZW4gSSB1c2UgeHNrX3JpbmdfcHJvZF9fcmVzZXJ2ZSBhbmQgc3VjY2Vz
c2l2ZSANCj4+PiB4c2tfcmluZ19wcm9kX19zdWJtaXQuIElzIGl0IGNvcnJlY3QgdG8gc3VibWl0
IGFsc28gbGVzcyB0aGFuIEkgDQo+Pj4gcmVzZXJ2ZWQ/DQo+Pj4gICAgIEluIHNvbWUgY2FzZXMg
SSBjYW4ndCBleGFjdGx5IGRldGVybWluZSBob3cgbXVjaCB0byByZXNlcnZlIGluIA0KPj4+IGFk
dmFuY2UsIHNpbmNlIHZwcCBidWZmZXJzIGhhdmUgZGlmZmVyZW50IHNpemUgdGhhbiB4ZHAgZnJh
bWVzLg0KPj4NCj4+IExldCBtZSBzZWUgc28gSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LiBQ
b25kZXIgeW91IHJlc2VydmUgMTAgDQo+PiBzbG90cyBhbmQgbGF0ZXIgc3VibWl0IDQuIFRoaXMg
bWVhbnMgeW91IGhhdmUgcmVzZXJ2ZWQgNiBtb3JlIHRoYW4gDQo+PiB5b3UgbmVlZC4NCj4+IERv
IHlvdSB3YW50IHRvICJ1bnJlc2VydmUiIHRoZXNlIGFuZCBnaXZlIHRoZW0gYmFjayB0byB0aGUg
cmluZz8gVGhpcyANCj4+IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGludGVyZmFjZSB0b2RheS4g
QW5vdGhlciB3YXkgb2Ygc29sdmluZyB0aGlzIA0KPj4gKGlmIHRoaXMgaXMgeW91ciBwcm9ibGVt
IGFuZCBJIGFtIHVuZGVyc3RhbmRpbmcgaXQgY29ycmVjdGx5LCB0aGF0DQo+PiBpcykgaXMgdGhh
dCB5b3UgaW4gdGhlIG5leHQgaXRlcmF0aW9uIG9ubHkgcmVzZXJ2ZSAxMCAtIDYgPSA0IHNsb3Rz
IA0KPj4gYmVjYXVzZSB5b3UgYWxyZWFkeSBoYXZlIDYgc2xvdHMgYXZhaWxhYmxlIGZyb20gdGhl
IGxhc3QgaXRlcmF0aW9uLg0KPj4gWW91IGNvdWxkIHN0aWxsIHN1Ym1pdCAxMCBhZnRlciB0aGlz
LiBCdXQgYWRkaW5nIHNvbWV0aGluZyBsaWtlIGFuIA0KPj4gdW5yZXNlcnZlIG9wdGlvbiB3b3Vs
ZCBiZSBlYXN5IGFzIGxvbmcgYXMgd2UgbWFkZSBzdXJlIGl0IG9ubHkgDQo+PiBhZmZlY3RlZCBs
b2NhbCByaW5nIHN0YXRlLiBUaGUgZ2xvYmFsIHN0YXRlIHNlZW4gaW4gdGhlIHNoYXJlZCANCj4+
IHZhcmlhYmxlcyBiZXR3ZWVuIHVzZXIgc3BhY2UgYW5kIGtlcm5lbCB3b3VsZCBub3QgYmUgdG91
Y2hlZCwgYXMgdGhpcyANCj4+IHdvdWxkIGFmZmVjdCBwZXJmb3JtYW5jZSBuZWdhdGl2ZWx5LiBQ
bGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UgDQo+PiB0aGluay4NCj4+DQo+IFllcywgWW91IHVu
ZGVyc3RhbmQgaXQgY29ycmVjdGx5LCBJIGltcGxlbWVudGVkIGl0IHRoZSB3YXkgeW91IA0KPiBz
dWdnZXN0ZWQsIGkuZS4gYnkgbWFya2luZyBpbmRleCBhbmQgY291bnQgb2YgcmVzZXJ2ZWQgc2xv
dHMgKG5vdCANCj4gY29tbWl0dGVkIHlldCwgYnV0IHdvcmtzIHdlbGwpLCB0aGFua3MgYWdhaW4u
DQo+DQo+Pj4gMl0gQ2FuIEkgdXNlIGh1Z2VwYWdlIGJhY2tlZCBtZW1vcnkgZm9yIHVtZW0/IElm
IG5vdCwgaXMgaXQgcGxhbm5lZCANCj4+PiBmb3IgZnV0dXJlPw0KPj4+ICAgICBZZXQgaXQgZG9l
cyBjb3B5IHBha2V0cyBmcm9tIHJ4IHJpbmdzIHRvIHZwcCBidWZmZXJzLCBidXQgDQo+Pj4gc3Bl
Y3VsYXRpbmcgYWJvdXQgc3RyYWlnaHQgemVyb2NvcHkgd2F5Lg0KPj4NCj4+IFllcyB5b3UgY2Fu
IHVzZSBodWdlIHBhZ2VzIHRvZGF5LCBidXQgdGhlIGludGVybmFsIEFGX1hEUCBjb2RlIGhhcyAN
Cj4+IG5vdCBiZWVuIG9wdGltaXplZCB0byB1c2UgaHVnZSBwYWdlcywgc28geW91IHdpbGwgbm90
IGdldCB0aGUgZnVsbCANCj4+IGJlbmVmaXQgZnJvbSB0aGVtIHRvZGF5LiBLZXZpbiBMYWF0eiwg
YWRkZWQgdG8gdGhpcyBtYWlsLCBpcyB3b3JraW5nIA0KPj4gb24gb3B0aW1pemluZyB0aGUgQUZf
WERQIGNvZGUgZm9yIGh1Z2UgcGFnZXMuIElmIHlvdSB3YW50IHRvIGtub3cgDQo+PiBtb3JlIG9y
IGhhdmUgc29tZSByZXF1aXJlbWVudHMsIGRvIG5vdCBoZXNpdGF0ZSB0byBjb250YWN0IGhpbS4N
Cj4+DQo+IEtldmluIHdpbGwgdGhlIEFQSSBmb3IgdXNpbmcgaHVnZXBhZ2VzIGNoYW5nZSB3aGls
ZSBvcHRpbWl6YXRpb24gDQo+IHByb2Nlc3Mgc2lnbmlmaWNhbnRseSBvciBjYW4gSSBhbHJlYWR5
IHN0YXJ0IHRvIHJld3JpdGUgbXkgdnBwIGRyaXZlciANCj4gdG8gdXNlIGh1Z2VwYWdlcyBiYWNr
ZWQgbWVtb3J5Pw0KPiBBbHNvIHBsZWFzZSBsZXQgbWUga25vdywgd2hlbiB5b3UgY29uc2lkZXIg
QUZfWERQIGNvZGUgb3B0aW1pemVkIHRvIA0KPiB1c2UgaHVnZSBwYWdlcy4NCj4NCj4gV2lsbGlh
bSwgaWYgSSBtYXkgYXNrIG5leHQgcXVlc3Rpb24uDQo+IERvZXMgT1ZTIGltcGxlbWVudGF0aW9u
IG9mIGFmX3hkcCBkcml2ZXIgY29weSBwYWtldCBkYXRhIGZyb20gYWZfeGRwIA0KPiBtbWFwZWQg
cmluZyBidWZmZXJzIGludG8gT1ZTICJidWZmZXJzIiAoc29tZSBzdHJ1Y3R1cmUgdG8gcmVwcmVz
ZW50IA0KPiB0aGUgcGFja2V0IGluIE9WUykgb3IgaXMgaXQgemVyb2NvcHkgaW4gdGhpcyBtYW5u
ZXIsIGkuZS4gT1ZTIA0KPiAiYnVmZmVycyIgbWVtcG9vbCBpcyBkaXJlY3RseSBtbWFwZWQgYXMg
cmluZyBhbmQgc28gbm8gY29weSBvbiBSWCBpcyANCj4gbmVlZGVkLiBTaW5jZSBpbiAybmQgY2Fz
ZSBpdCB3b3VsZCBiZSB2ZXJ5IHZhbHVhYmxlIGZvciBtZSBhcyANCj4gaW5zcGlyYXRpb24uDQoN
CkN1cnJlbnRseSwgT1ZTIHVzZXMgdGhlIG1tYXBlZCBtZW1vcnkgZGlyZWN0bHksIGhvd2V2ZXIg
b24gZWdyZXNzLCBpdCBpcyBjb3B5aW5nIHRoZSBtZW1vcnkgdG8gdGhlIGVncmVzcyBpbnRlcmZh
Y2UgaXTigJlzIG1tYXBlZCBtZW1vcnkuIA0KQ3VycmVudGx5LCBPVlMgdXNlcyBhbiBBRl9YRFAg
bWVtb3J5IHBvb2wgcGVyIGludGVyZmFjZSwgc28gYSBmdXJ0aGVyIG9wdGltaXphdGlvbiBjb3Vs
ZCBiZSB0byB1c2UgYSBnbG9iYWwgbWVtb3J5IHBvb2wgc28gdGhpcyBleHRyYSBjb3B5IGlzIG5v
dCBuZWVkZWQuDQoNCj4NCj4+IC9NYWdudXMNCj4+DQo+DQo+IFRoYW5rcyBhIGxvdCwNCj4NCj4g
SsO6bGl1cw0K
