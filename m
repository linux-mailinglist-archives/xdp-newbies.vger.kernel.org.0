Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F0ED265B
	for <lists+xdp-newbies@lfdr.de>; Thu, 10 Oct 2019 11:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387920AbfJJJaf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 10 Oct 2019 05:30:35 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:48448 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727320AbfJJJaf (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 10 Oct 2019 05:30:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 845F51B8A82;
        Thu, 10 Oct 2019 11:30:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZelxYj4STpiP; Thu, 10 Oct 2019 11:30:30 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id 217291B1F43;
        Thu, 10 Oct 2019 11:30:30 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 10 Oct 2019 11:30:29 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Thu, 10 Oct 2019
 11:30:29 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
CC:     William Tu <u9012063@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Subject: RE: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Topic: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Thread-Index: AQHVWYvsn8R7cjoUHky0EqUKkC+pt6cIfGjTgAAWY4CAAAnOgIAAMhfwgAsdPkCAC0qWgIASqpAQgADANICABoW/4IAAImUAgALaJZD///LsgIABCC6AgAIPoACAALpagIAD+cEAgAAruACAABpJgIAPvlWQ
Date:   Thu, 10 Oct 2019 09:30:29 +0000
Message-ID: <0fd1717d5050400ca20241d858a196e4@pantheon.tech>
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
 <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech>
 <565AE8A9-8A0D-4582-A3C5-D317F4DA0C9F@redhat.com>
 <CALDO+SbC-64-78Fxv4u3p8RHG9n9jqcEHE3rRK5QjqF_KH+bmQ@mail.gmail.com>
 <CAJ8uoz1p4rL2TQ-4kXNDzd2dmJ3DCgvzPFUiJjPHRUYaBbUYZQ@mail.gmail.com>
 <CALDO+SZNbFfqN=os_m3B15XN=pJ1TguPBQSV-GxetucmDDvrnQ@mail.gmail.com>
 <CAJ8uoz3KVH8TNA86YUiMoMS43gtSL1GTwGEg5yqwoZApLETVTQ@mail.gmail.com>
 <A80A2A07-D33A-4AB4-B71B-537A8D6651D7@redhat.com>
 <CAJ8uoz3MisB3zCtXM8Wd5vkBAohJs0=UVur+NyC1BAOMjTNuag@mail.gmail.com>
In-Reply-To: <CAJ8uoz3MisB3zCtXM8Wd5vkBAohJs0=UVur+NyC1BAOMjTNuag@mail.gmail.com>
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

T24gMzAgU2VwIDIwMTksIGF0IDEzOjAyLCBNYWdudXMgS2FybHNzb24gd3JvdGU6DQoNCj4gT24g
TW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MjggQU0gRWVsY28gQ2hhdWRyb24gPGVjaGF1ZHJvQHJl
ZGhhdC5jb20+DQo+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gT24gMzAgU2VwIDIwMTksIGF0IDg6
NTEsIE1hZ251cyBLYXJsc3NvbiB3cm90ZToNCj4+DQo+Pj4gT24gRnJpLCBTZXAgMjcsIDIwMTkg
YXQgODowOSBQTSBXaWxsaWFtIFR1IDx1OTAxMjA2M0BnbWFpbC5jb20+DQo+Pj4gd3JvdGU6DQo+
Pj4+DQo+Pj4+IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDEyOjAyIEFNIE1hZ251cyBLYXJsc3Nv
biANCj4+Pj4gPG1hZ251cy5rYXJsc3NvbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+
IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDE6MzQgQU0gV2lsbGlhbSBUdSA8dTkwMTIwNjNAZ21h
aWwuY29tPg0KPj4+Pj4gd3JvdGU6DQo+Pj4+Pj4NCj4+Pj4+PiBPbiBXZWQsIFNlcCAyNSwgMjAx
OSBhdCAxMjo0OCBBTSBFZWxjbyBDaGF1ZHJvbiANCj4+Pj4+PiA8ZWNoYXVkcm9AcmVkaGF0LmNv
bT4gd3JvdGU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDI1IFNlcCAy
MDE5LCBhdCA4OjQ2LCBKw7psaXVzIE1pbGFuIHdyb3RlOg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gSGkg
RWVsY28NCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gQ3VycmVudGx5LCBPVlMgdXNlcyB0aGUgbW1hcGVk
IG1lbW9yeSBkaXJlY3RseSwgaG93ZXZlciBvbiANCj4+Pj4+Pj4+PiBlZ3Jlc3MsIGl0IGlzIGNv
cHlpbmcgdGhlIG1lbW9yeSB0byB0aGUgZWdyZXNzIGludGVyZmFjZSBpdOKAmXMgDQo+Pj4+Pj4+
Pj4gbW1hcGVkIG1lbW9yeS4NCj4+Pj4+Pj4+IEdyZWF0LCB0aGFua3MgZm9yIG1ha2luZyB0aGlz
IGNsZWFyIHRvIG1lLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBDdXJyZW50bHksIE9WUyB1c2VzIGFu
IEFGX1hEUCBtZW1vcnkgcG9vbCBwZXIgaW50ZXJmYWNlLCBzbyBhIA0KPj4+Pj4+Pj4+IGZ1cnRo
ZXIgb3B0aW1pemF0aW9uIGNvdWxkIGJlIHRvIHVzZSBhIGdsb2JhbCBtZW1vcnkgcG9vbCBzbyAN
Cj4+Pj4+Pj4+PiB0aGlzIGV4dHJhIGNvcHkgaXMgbm90IG5lZWRlZC4NCj4+Pj4+Pj4+IElzIGl0
IGV2ZW4gcG9zc2libGUgdG8gbWFrZSB0aGlzIGZ1cnRoZXIgb3B0aW1pemF0aW9uPyBTaW5jZSAN
Cj4+Pj4+Pj4+IGV2ZXJ5IGludGVyZmFjZSBoYXMgaXQncyBvd24gbm9uLXNoYXJlZCB1bWVtLCBz
byBmcm9tIG15IHBvaW50IA0KPj4+Pj4+Pj4gb2YgdmlldywgYXQgbGVhc3Qgb25lIGNvcHkgZm9y
IGNhc2UgYXMgeW91IGRlc2NyaWJlZCBhYm92ZSANCj4+Pj4+Pj4+ICh3aGVuIFJYIGludGVyZmFj
ZSBpcyBkaWZmZXJlbnQgdGhlbiBUWCBpbnRlcmZhY2UpIGlzIA0KPj4+Pj4+Pj4gbmVjZXNzZXJ5
LiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPj4+Pj4+Pg0KPj4+Pj4+PiBTb21lIG9uZSBA
SW50ZWwgdG9sZCBtZSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBoYXZlIG9uZSBodWdlIA0KPj4+
Pj4+PiBtZW1wb29sIHRoYXQgY2FuIGJlIHNoYXJlZCBiZXR3ZWVuIGludGVyZmFjZXMuIEhvd2V2
ZXIgSSBoYXZlIA0KPj4+Pj4+PiBub3QgcmVzZWFyY2hlZC90cmllZCBpdC4NCj4+Pj4+Pg0KPj4+
Pj4+IEkgdGhvdWdodCBhYm91dCBpdCBiZWZvcmUsIGJ1dCB0aGUgcHJvYmxlbSBpcyBjcSBhbmQg
ZnEgYXJlIA0KPj4+Pj4+IHBlci11bWVtLg0KPj4+Pj4+IFNvIHdoZW4gaGF2aW5nIG9ubHkgb25l
IHVtZW0gc2hhcmVkIHdpdGggbWFueSBxdWV1ZXMgb3IgZGV2aWNlcywgDQo+Pj4+Pj4gZWFjaCBv
bmUgaGFzIHRvIGFjcXVpcmUgYSBsb2NrLCB0aGVuIHRoZXkgY2FuIGFjY2VzcyBjcSBvciBmcS4g
SSANCj4+Pj4+PiB0aGluayB0aGF0IG1pZ2h0IGJlY29tZSBtdWNoIHNsb3dlci4NCj4+Pj4+DQo+
Pj4+PiBZb3UgYmFzaWNhbGx5IGhhdmUgdG8gaW1wbGVtZW50IGEgbWVtcG9vbCB0aGF0IGNhbiBi
ZSB1c2VkIGJ5IA0KPj4+Pj4gbXVsdGlwbGUgcHJvY2Vzc2VzLiBVbmZvcnR1bmF0ZWx5LCB0aGVy
ZSBpcyBubyBsZWFuIGFuZCBtZWFuIA0KPj4+Pj4gc3RhbmRhbG9uZSBpbXBsZW1lbnRhdGlvbiBv
ZiBhIG1lbXBvb2wuIFRoZXJlIGlzIGEgZ29vZCBvbmUgaW4gDQo+Pj4+PiBEUERLLCBidXQgdGhl
biB5b3UgZ2V0IHRoZSB3aG9sZSBEUERLIHBhY2thZ2UgaW50byB5b3VyIA0KPj4+Pj4gYXBwbGlj
YXRpb24gd2hpY2ggaXMgbGlrZWx5IHdoYXQgeW91IHdhbnRlZCB0byBhdm9pZCBpbiB0aGUgZmly
c3QgDQo+Pj4+PiBwbGFjZS4gQW55b25lIGZvciB3cml0aW5nIGxpYm1lbXBvb2w/DQo+Pj4+Pg0K
Pj4+Pj4gL01hZ251cw0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVGhhdCdzIGludGVyZXN0aW5nLg0KPj4+
PiBEbyB5b3UgbWVhbiB0aGUgRFBESydzIHJ0ZV9tZW1wb29sIHdoaWNoIHN1cHBvcnRzIA0KPj4+
PiBtdWx0aXBsZS1wcm9kdWNlcj8NCj4+Pg0KPj4+IFllcy4NCj4+Pg0KPj4+PiBJZiBJIGNyZWF0
ZSBhIHNoYXJlZCB1bWVtIGZvciBxdWV1ZTEgIGFuZCBxdWV1ZTIsIHRoZW4gZWFjaCBxdWV1ZSAN
Cj4+Pj4gaGFzIGl0cyBvd24gdHgvcnggcmluZyBzbyB0aGV5IGNhbiBwcm9jZXNzIGluIHBhcmFs
bGVsLiBCdXQgZm9yIA0KPj4+PiBoYW5kbGluZyB0aGUgcGVyLXVtZW0gY3EvZnEsIEkgY2FuIGNy
ZWF0ZSBhIGRlZGljYXRlZCB0aHJlYWQgdG8gDQo+Pj4+IHByb2Nlc3MgY3EvZnEuDQo+Pj4+IFNv
IGZvciBleGFtcGxlOg0KPj4+PiBUaHJlYWQgMSBmb3IgaGFuZGxpbmcgY3EvZnENCj4+Pj4gVGhy
ZWFkIDIgZm9yIHByb2Nlc3NpbmcgcXVldWUxIHR4L3J4IHF1ZXVlIFRocmVhZCAzIGZvciBwcm9j
ZXNzaW5nIA0KPj4+PiBxdWV1ZTIgdHgvcnggcXVldWUgYW5kIHRoZSBtZW1wb29sIHNob3VsZCBh
bGxvdyBtdWx0aXBsZSBwcm9kdWNlciANCj4+Pj4gYW5kIGNvbnN1bWVyLg0KPj4+Pg0KPj4+PiBE
b2VzIHRoaXMgc291bmQgY29ycmVjdD8NCj4+Pg0KPj4+IFlvdSBkbyBub3QgbmVlZCBhIGRlZGlj
YXRlZCBwcm9jZXNzLiBKdXN0IHNvbWV0aGluZyBpbiB0aGUgbWVtcG9vbCANCj4+PiBjb2RlIHRo
YXQgZW5mb3JjZXMgbXV0dWFsIGV4Y2x1c2lvbiAoYSBtdXRleCBvciB3aGF0ZXZlcikgYmV0d2Vl
biANCj4+PiB0aHJlYWQgMiBhbmQgMyB3aGVuIHRoZXkgYXJlIHBlcmZvcm1pbmcgb3BlcmF0aW9u
cyBvbiB0aGUgbWVtcG9vbC4NCj4+PiBHb2luZyB3aXRoIGEgZGVkaWNhdGVkIHByb2Nlc3Mgc291
bmRzIGNvbXBsaWNhdGVkLg0KPj4NCj4+IEkgd2FzIHRyeWluZyB0byBzZWUgaG93IHRvIGV4cGVy
aW1lbnQgd2l0aCB0aGlzIHVzaW5nIGxpYmJwZiwgYnV0IA0KPj4gbG9va3MgbGlrZSBpdOKAmXMg
bm90IHlldCBzdXBwb3J0ZWQ/DQo+Pg0KPj4gSXMgc2VlIHRoZSBmb2xsb3dpbmcgaW4geHNrX3Nv
Y2tldF9fY3JlYXRlKCk6DQo+Pg0KPj4gNDc1ICAgICAgICAgaWYgKHVtZW0tPnJlZmNvdW50KSB7
DQo+PiA0NzYgICAgICAgICAgICAgICAgIHByX3dhcm5pbmcoIkVycm9yOiBzaGFyZWQgdW1lbXMg
bm90IHN1cHBvcnRlZCBieQ0KPj4gbGliYnBmLlxuIik7DQo+PiA0NzcgICAgICAgICAgICAgICAg
IHJldHVybiAtRUJVU1k7DQo+PiA0NzggICAgICAgICB9DQo+Pg0KPg0KPiBVc2luZyB0aGUgWERQ
X1NIQVJFRF9VTUVNIG9wdGlvbiBpcyBub3Qgc3VwcG9ydGVkIGluIGxpYmJwZiBhdCB0aGlzIA0K
PiBwb2ludCBpbiB0aW1lLiBJbiB0aGlzIG1vZGUgeW91IHNoYXJlIGEgc2luZ2xlIHVtZW0gd2l0
aCBhIHNpbmdsZSANCj4gY29tcGxldGlvbiBxdWV1ZSBhbmQgYSBzaW5nbGUgZmlsbCBxdWV1ZSBh
bW9uZyBtYW55IHhzayBzb2NrZXRzIHRpZWQgDQo+IHRvIHRoZSBzYW1lIHF1ZXVlIGlkLiBCdXQg
bm90ZSB0aGF0IHlvdSBjYW4gcmVnaXN0ZXIgdGhlIHNhbWUgdW1lbSANCj4gYXJlYSBtdWx0aXBs
ZSB0aW1lcyAoY3JlYXRpbmcgbXVsdGlwbGUgdW1lbSBoYW5kbGVzIGFuZCBtdWx0aXBsZSBmcXMg
DQo+IGFuZCBjcXMpIHRvIGJlIGFibGUgdG8gc3VwcG9ydCB4c2sgc29ja2V0cyB0aGF0IGhhdmUg
ZGlmZmVyZW50IHF1ZXVlIA0KPiBpZHMsIGJ1dCB0aGUgc2FtZSB1bWVtIGFyZWEuIEluIGJvdGgg
Y2FzZXMgeW91IG5lZWQgYSBtZW1wb29sIHRoYXQgY2FuIA0KPiBoYW5kbGUgbXVsdGlwbGUgdGhy
ZWFkcy4NCg0KVGhpbmtpbmcgYWJvdXQgbGlibWVtcG9vbCB3aXRoIHVtZW0gc2hhcmVkIGFtb25n
IHZhcmlvdXMgaW5kZXBlbmRlbnQgcHJvY2Vzc2VzLCB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0KU28g
dGhhdCBtdWx0aXBsZSBwcm9jZXNzZXMgY291bGQgc2hhcmUgc2FtZSBOSUMgb3IgZXZlbiBxdWV1
ZSBpZiByZWdpc3RlcmVkIHdpdGggYWxsIG5lY2Vzc2FyeSBsb2NraW5nIGluIGxpYm1lbXBvb2wu
DQpCdXQgd2hhdCBpZiBvbmUgcHJvY2VzcyBjcmFzaGVzPyBXb25kZXJpbmcgaG93IHRvIGFjaGll
dmUgcHJvcGVyIGNsZWFudXAgYW5kIGlmIGl0IGlzIGV2ZW4gcG9zc2libGUgd2l0aCBhcmNoaXRl
Y3R1cmUgSSBtZW50aW9uZWQuDQpNYXliZSB3aXRoIHNvbWUgbW9uaXRvcmluZyB0aHJlYWQsIGJ1
dCB0aGF0J3MgY29tcGxpY2F0ZWQuIEFueSBpZGVhcz8NCg0KPiBUaGUgb2xkIHhkcHNvY2sgYXBw
bGljYXRpb24gcHJpb3IgdG8gbGliYnBmIGhhZCBzdXBwb3J0IGZvciB0aGUgDQo+IFhEUF9TSEFS
RURfVU1FTSBvcHRpb24uIFRha2UgYSBsb29rIGF0IHRoYXQgb25lIGlmIHlvdSB3b3VsZCBsaWtl
IHRvIA0KPiBleHBlcmltZW50IHdpdGggaXQuDQo+DQo+IC9NYWdudXMNCg0KSsO6bGl1cw0K
