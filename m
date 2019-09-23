Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A303BB01E
	for <lists+xdp-newbies@lfdr.de>; Mon, 23 Sep 2019 11:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406494AbfIWJAl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 23 Sep 2019 05:00:41 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:59807 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbfIWJAl (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 23 Sep 2019 05:00:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 39B201D7098;
        Mon, 23 Sep 2019 11:00:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MeZWTHZtK6QW; Mon, 23 Sep 2019 11:00:36 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id C72F61D7085;
        Mon, 23 Sep 2019 11:00:35 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 23 Sep 2019 11:00:35 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Mon, 23 Sep 2019
 11:00:35 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
CC:     William Tu <u9012063@gmail.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Subject: RE: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Topic: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Index: AQHVWYvsn8R7cjoUHky0EqUKkC+pt6cIfGjTgAAWY4CAAAnOgIAAMhfwgAsdPkCAC0qWgIASqpAQgADANICABoW/4A==
Date:   Mon, 23 Sep 2019 09:00:35 +0000
Message-ID: <966e40dda4654444a420b935ad970d18@pantheon.tech>
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
In-Reply-To: <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
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

TWFueSBUaGFua3MgTWFnbnVzDQoNCj4+IEkgaGF2ZSBuZXh0IDIgcXVlc3Rpb25zOg0KPj4NCj4+
IDFdIFdoZW4gSSB1c2UgeHNrX3JpbmdfcHJvZF9fcmVzZXJ2ZSBhbmQgc3VjY2Vzc2l2ZSB4c2tf
cmluZ19wcm9kX19zdWJtaXQuIElzIGl0IGNvcnJlY3QgdG8gc3VibWl0IGFsc28gbGVzcyB0aGFu
IEkgcmVzZXJ2ZWQ/DQo+PiAgICAgSW4gc29tZSBjYXNlcyBJIGNhbid0IGV4YWN0bHkgZGV0ZXJt
aW5lIGhvdyBtdWNoIHRvIHJlc2VydmUgaW4gYWR2YW5jZSwgc2luY2UgdnBwIGJ1ZmZlcnMgaGF2
ZSBkaWZmZXJlbnQgc2l6ZSB0aGFuIHhkcCBmcmFtZXMuDQo+DQo+IExldCBtZSBzZWUgc28gSSB1
bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LiBQb25kZXIgeW91IHJlc2VydmUgMTAgc2xvdHMgYW5k
IGxhdGVyIHN1Ym1pdCA0LiBUaGlzIG1lYW5zIHlvdSBoYXZlIHJlc2VydmVkIDYgbW9yZSB0aGFu
IHlvdSBuZWVkLg0KPiBEbyB5b3Ugd2FudCB0byAidW5yZXNlcnZlIiB0aGVzZSBhbmQgZ2l2ZSB0
aGVtIGJhY2sgdG8gdGhlIHJpbmc/IFRoaXMgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgaW50ZXJm
YWNlIHRvZGF5LiBBbm90aGVyIHdheSBvZiBzb2x2aW5nIHRoaXMgKGlmIHRoaXMgaXMgeW91ciBw
cm9ibGVtIGFuZCBJIGFtIHVuZGVyc3RhbmRpbmcgaXQgY29ycmVjdGx5LCB0aGF0IGlzKSBpcyB0
aGF0IHlvdSBpbiB0aGUgbmV4dCBpdGVyYXRpb24gb25seSByZXNlcnZlIDEwIC0gNiA9IDQgc2xv
dHMgYmVjYXVzZSB5b3UgYWxyZWFkeSBoYXZlIDYgc2xvdHMgYXZhaWxhYmxlIGZyb20gdGhlIGxh
c3QgaXRlcmF0aW9uLg0KPiBZb3UgY291bGQgc3RpbGwgc3VibWl0IDEwIGFmdGVyIHRoaXMuIEJ1
dCBhZGRpbmcgc29tZXRoaW5nIGxpa2UgYW4gdW5yZXNlcnZlIG9wdGlvbiB3b3VsZCBiZSBlYXN5
IGFzIGxvbmcgYXMgd2UgbWFkZSBzdXJlIGl0IG9ubHkgYWZmZWN0ZWQgbG9jYWwgcmluZyBzdGF0
ZS4gVGhlIGdsb2JhbCBzdGF0ZSBzZWVuIGluIHRoZSBzaGFyZWQgdmFyaWFibGVzIGJldHdlZW4g
dXNlciBzcGFjZSBhbmQga2VybmVsIHdvdWxkIG5vdCBiZSB0b3VjaGVkLCBhcyB0aGlzIHdvdWxk
IGFmZmVjdCBwZXJmb3JtYW5jZSBuZWdhdGl2ZWx5LiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5
b3UgdGhpbmsuDQo+DQpZZXMsIFlvdSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseSwgSSBpbXBsZW1l
bnRlZCBpdCB0aGUgd2F5IHlvdSBzdWdnZXN0ZWQsIGkuZS4gYnkgbWFya2luZyBpbmRleCBhbmQg
Y291bnQgb2YgcmVzZXJ2ZWQgc2xvdHMgKG5vdCBjb21taXR0ZWQgeWV0LCBidXQgd29ya3Mgd2Vs
bCksIHRoYW5rcyBhZ2Fpbi4NCg0KPj4gMl0gQ2FuIEkgdXNlIGh1Z2VwYWdlIGJhY2tlZCBtZW1v
cnkgZm9yIHVtZW0/IElmIG5vdCwgaXMgaXQgcGxhbm5lZCBmb3IgZnV0dXJlPw0KPj4gICAgIFll
dCBpdCBkb2VzIGNvcHkgcGFrZXRzIGZyb20gcnggcmluZ3MgdG8gdnBwIGJ1ZmZlcnMsIGJ1dCBz
cGVjdWxhdGluZyBhYm91dCBzdHJhaWdodCB6ZXJvY29weSB3YXkuDQo+DQo+IFllcyB5b3UgY2Fu
IHVzZSBodWdlIHBhZ2VzIHRvZGF5LCBidXQgdGhlIGludGVybmFsIEFGX1hEUCBjb2RlIGhhcyBu
b3QgYmVlbiBvcHRpbWl6ZWQgdG8gdXNlIGh1Z2UgcGFnZXMsIHNvIHlvdSB3aWxsIG5vdCBnZXQg
dGhlIGZ1bGwgYmVuZWZpdCBmcm9tIHRoZW0gdG9kYXkuIEtldmluIExhYXR6LCBhZGRlZCB0byB0
aGlzIG1haWwsIGlzIHdvcmtpbmcgb24gb3B0aW1pemluZyB0aGUgQUZfWERQIGNvZGUgZm9yIGh1
Z2UgcGFnZXMuIElmIHlvdSB3YW50IHRvIGtub3cgbW9yZSBvciBoYXZlIHNvbWUgcmVxdWlyZW1l
bnRzLCBkbyBub3QgaGVzaXRhdGUgdG8gY29udGFjdCBoaW0uDQo+DQpLZXZpbiB3aWxsIHRoZSBB
UEkgZm9yIHVzaW5nIGh1Z2VwYWdlcyBjaGFuZ2Ugd2hpbGUgb3B0aW1pemF0aW9uIHByb2Nlc3Mg
c2lnbmlmaWNhbnRseSBvciBjYW4gSSBhbHJlYWR5IHN0YXJ0IHRvIHJld3JpdGUgbXkgdnBwIGRy
aXZlciB0byB1c2UgaHVnZXBhZ2VzIGJhY2tlZCBtZW1vcnk/DQpBbHNvIHBsZWFzZSBsZXQgbWUg
a25vdywgd2hlbiB5b3UgY29uc2lkZXIgQUZfWERQIGNvZGUgb3B0aW1pemVkIHRvIHVzZSBodWdl
IHBhZ2VzLg0KDQpXaWxsaWFtLCBpZiBJIG1heSBhc2sgbmV4dCBxdWVzdGlvbi4NCkRvZXMgT1ZT
IGltcGxlbWVudGF0aW9uIG9mIGFmX3hkcCBkcml2ZXIgY29weSBwYWtldCBkYXRhIGZyb20gYWZf
eGRwIG1tYXBlZCByaW5nIGJ1ZmZlcnMgaW50byBPVlMgImJ1ZmZlcnMiIChzb21lIHN0cnVjdHVy
ZSB0byByZXByZXNlbnQgdGhlIHBhY2tldCBpbiBPVlMpIG9yIGlzIGl0IHplcm9jb3B5DQppbiB0
aGlzIG1hbm5lciwgaS5lLiBPVlMgImJ1ZmZlcnMiIG1lbXBvb2wgaXMgZGlyZWN0bHkgbW1hcGVk
IGFzIHJpbmcgYW5kIHNvIG5vIGNvcHkgb24gUlggaXMgbmVlZGVkLiBTaW5jZSBpbiAybmQgY2Fz
ZSBpdCB3b3VsZCBiZSB2ZXJ5IHZhbHVhYmxlIGZvciBtZSBhcyBpbnNwaXJhdGlvbi4NCg0KPiAv
TWFnbnVzDQo+DQoNClRoYW5rcyBhIGxvdCwNCg0KSsO6bGl1cw0K
