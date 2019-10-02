Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AED7C868A
	for <lists+xdp-newbies@lfdr.de>; Wed,  2 Oct 2019 12:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJBKpI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 2 Oct 2019 06:45:08 -0400
Received: from lb.pantheon.sk ([46.229.239.20]:32901 "EHLO lb.pantheon.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbfJBKpI (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 2 Oct 2019 06:45:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by lb.pantheon.sk (Postfix) with ESMTP id 1A6DA1BE49C;
        Wed,  2 Oct 2019 12:45:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at siecit.sk
Received: from lb.pantheon.sk ([127.0.0.1])
        by localhost (lb.pantheon.sk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zPTmoyQnodgK; Wed,  2 Oct 2019 12:45:05 +0200 (CEST)
Received: from mail.pantheon.sk (srvw-ptex1.pantheon.local [10.101.4.5])
        by lb.pantheon.sk (Postfix) with ESMTPS id 3215F1BE488;
        Wed,  2 Oct 2019 12:45:05 +0200 (CEST)
Received: from srvw-ptex1.pantheon.local (10.101.4.5) by
 srvw-ptex1.pantheon.local (10.101.4.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 2 Oct 2019 12:45:04 +0200
Received: from srvw-ptex1.pantheon.local ([::1]) by srvw-ptex1.pantheon.local
 ([fe80::409e:7148:12ab:5c7a%7]) with mapi id 15.01.1779.002; Wed, 2 Oct 2019
 12:45:04 +0200
From:   =?utf-8?B?SsO6bGl1cyBNaWxhbg==?= <Julius.Milan@pantheon.tech>
To:     Xdp <xdp-newbies@vger.kernel.org>
CC:     Magnus Karlsson <magnus.karlsson@gmail.com>,
        =?utf-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>,
        "Eelco Chaudron" <echaudro@redhat.com>
Subject: xdpsock problem testing multiple queues
Thread-Topic: xdpsock problem testing multiple queues
Thread-Index: AdV5DFponigxaU4pTXybWUUY2UuB8g==
Date:   Wed, 2 Oct 2019 10:45:04 +0000
Message-ID: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
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

SGkgYWxsDQoNCldlIGFyZSB0cnlpbmcgdG8gdGVzdCBtdWx0aXBsZSBSWCBxdWV1ZXMgd2l0aCBz
YW1wbGUgcHJvZ3JhbSB4ZHBzb2NrIGZyb20ga2VybmVsIG9uIHZtd2FyZSB2aXJ0dWFsIG1hY2hp
bmUgd2l0aCAyIHF1ZXVlcy4NClRoZSBkcml2ZXIgb24gdGhlIE5JQyBpczoNCiMgZXRodG9vbCAt
aSBlbnMxOTINCmRyaXZlcjogdm14bmV0Mw0KdmVyc2lvbjogMS40LjE2LjAtay1OQVBJDQoNCk5J
QyBoYXMgMiBxdWV1ZXMsIEkgY2FuIGNoZWNrIGl0IGJ5IGV0aHRvb2wgLVMuDQoNCkJ1dCB3aGVu
IEkgdHJ5IHRvIHVzZSBxdWV1ZSAxLCBJIGFtIGdldHRpbmcgZm9sbG93aW5nOg0KIyAuL3hkcHNv
Y2sgLWkgZW5zMTkyIC1xIDENCi9ob21lL2ptaWxhbi93cy9wdC14ZHAvbGludXgvc2FtcGxlcy9i
cGYveGRwc29ja191c2VyLmM6eHNrX2NvbmZpZ3VyZV9zb2NrZXQ6MzE1OiBlcnJubzogMS8iT3Bl
cmF0aW9uIG5vdCBwZXJtaXR0ZWQiDQoNCkFueSBpZGVhcyB3aGF0IHRoZSBwcm9ibGVtIGNvdWxk
IGJlPyBNYXliZSB2bXhuZXQzIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IHNvbWUgbmVjZXNzYXJ5
IG9wZXJhdGlvbnMgcmVsYXRlZCB0byBxdWV1ZXM/DQoNCkJlc3QgUmVnYXJkcw0KSsO6bGl1cw0K
