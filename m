Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D371BB234
	for <lists+xdp-newbies@lfdr.de>; Tue, 28 Apr 2020 01:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgD0Xx6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Apr 2020 19:53:58 -0400
Received: from mail-dm6nam10on2095.outbound.protection.outlook.com ([40.107.93.95]:28848
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726259AbgD0Xx6 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Apr 2020 19:53:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALdFNug/gyGxSBTJ/C0OEYhlb0HGmrdgxtLs5qBtPDYqR62gs/rdh+BOjL+hjCzlPjoaVTqtWxuexNDAL07qO++e8w6zPj/bUnzGDKzqsPCIh1IA2aAKzMHT6H700lMf05ZtK2k552yBWBPUFl1Taju4C0ypBRM1wJF9zHT4pUPk5EfeNWuq4rm3uxL2vVOxX3JIYgXb8Lbt73QIhW7UVCdrS03MKu8wf5PGS4osMhgC/p3Kdcch3qsePT4b9blcZO9PaXzWFiU46+n1bKvagr1PkX+HBB9Il9YpYC08VfL7sCAR4WOC4Tc2uanJI6R1RMiZG5K1E7OZm/dfBDvYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW1SuU7knEGN4NdEKM609r7XRYy1znUBsY6DnX5ANY8=;
 b=ZFzitnXh1v/GqgQKk70d3O5BkkVaQmNKHbu7lWA76XQSRqR435A5QKQkN/CiORCQ5ERDNwtPjKJpcF5VMXEKQmI+kJScCsJgITnbgp3FtvpVukjjZzVtYArpEGLeHCLrFOwybCwYAlixpsrVtWNyHVSuIorjd35cyfstP6elVQdp5WGp9HT1pWHpqK1r6Z9Im8fh817h450zcTB4yCx0ymKmtkSAb2YIGxTWKbMtqHNKxvrH6JySE1bgjkwRV5Hap1FSS+yL16ZTvA5pQvyvpBSDcAKXep+W2x7HuzFHtI2Kna1Ajb1/z008P8o7EnKSFOqhwgeoGnHC44nedL340g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=futurewei.com; dmarc=pass action=none
 header.from=futurewei.com; dkim=pass header.d=futurewei.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Futurewei.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW1SuU7knEGN4NdEKM609r7XRYy1znUBsY6DnX5ANY8=;
 b=K1cHrxFXv+QLfVZ2BkWOdjWSZ3jJ+pQv6Zdz1GWr/jXNGHAwnnl7Y+pCbXEG5IiTfTrrBm+fbeRqyG/rbo7VwM2bZvYxuMP0F1LEGTBdB2IKnPlY9dhmuijA5eBz8g/gCt3jTUJs51LZg0J9CcV8e253RCBcHUijjISeXdSN/j8=
Received: from MWHPR1301MB2128.namprd13.prod.outlook.com
 (2603:10b6:301:2b::28) by MWHPR1301MB2141.namprd13.prod.outlook.com
 (2603:10b6:301:30::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.14; Mon, 27 Apr
 2020 23:53:56 +0000
Received: from MWHPR1301MB2128.namprd13.prod.outlook.com
 ([fe80::30ba:7d90:a6ba:7e2e]) by MWHPR1301MB2128.namprd13.prod.outlook.com
 ([fe80::30ba:7d90:a6ba:7e2e%7]) with mapi id 15.20.2958.014; Mon, 27 Apr 2020
 23:53:56 +0000
From:   Phu Tran <phu.tran@futurewei.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Difference in TCP throughput in comparison to OVS
Thread-Topic: Difference in TCP throughput in comparison to OVS
Thread-Index: AQHWHO8cT/UJqIrS/kuzExAfvUVThQ==
Date:   Mon, 27 Apr 2020 23:53:56 +0000
Message-ID: <BF562847-15D5-471F-8A50-FC38BE92D505@futurewei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=phu.tran@futurewei.com; 
x-originating-ip: [216.243.34.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d53030ac-e1a8-41dd-cca0-08d7eb063f75
x-ms-traffictypediagnostic: MWHPR1301MB2141:
x-microsoft-antispam-prvs: <MWHPR1301MB2141A302AD97F4E3473D815D81AF0@MWHPR1301MB2141.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1301MB2128.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(5660300002)(478600001)(66574012)(966005)(6506007)(186003)(71200400001)(44832011)(2906002)(76116006)(66476007)(8936002)(6486002)(2616005)(6512007)(66946007)(26005)(6916009)(86362001)(36756003)(316002)(8676002)(81156014)(66556008)(64756008)(66446008)(33656002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: futurewei.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UdM/t3QpOF0SGnnUQGOlPaQNQy4P4CjCmWAaxTfCwckYhUa++TveXUSgI0lktRjYUtlxnECmal+w7133sc+pZP69x6kC/nAH1eUPhNR0xVUCQMXnYoXUiXl7zG9/69me1R72Hfi4KfFr7bHMm1ykmHtnZgOPB7vR4XsMVZ+qUD7cBny/Zj7bWtY+bWE7+m1gy+EG96HeLhRZjbz28eIf1T2yoD2tg/VREhX5CkfwPOCZgGzxc0XmhnZYSmsNdnCT0NZpaHXsMafOoOqXKoQJ1xSOmvhSOqRSsPhaEnalQGiQ4lzg7CqZFzXHtZ+pnQg3wfJ978EoMoFrWtmgoRtfDMcyBJT1ebXDQLGDZ1IBdMkFL+fCG6K4aiOYiu3je7q3XkZIM6p2XTYknX9QU5TOLUr6CxPG6nByKEG7cNovH/fT+RsU4Ssl8f1nLjhPiECWQmeWeVO6SfoSe5xru3yop4yuBdpy6UjrCE9UxdKnRUp+TBKol/XIJsjF3QInpZx88lY1Z1ArBo/djiHGmDAt6w==
x-ms-exchange-antispam-messagedata: nM/vfo8ndPiUlAUI6WpZBbK3181rDNELiTXbFJXqWFXe45h+YGlYCBS68sONBC/d/BtdOswPzjpmD+2/EZj4YUJwsvodpsZBO08jmVeiF2QDstq6eiXBqxod0vqKv5GW4UMdv3i9g2kSYeLwv8W+tbJFDUpTBIZmwyM2Sj4KbqLL3YWa393v0WYYtKyjn3YZe1z31lDjI1q9S9yDEhzLWLG9jgCV8/m9OnMkoUrkLpoWXQ6kUtBvH9C91Fw6zvd7w9hqG97YgGWfj26VMDVy1NZK/mO8nr1Ecv8vGCRZ13cM+slY2AY0mvl+/LFiROvGcgOFM8c9Ltkd0Bxl1DAx/Fd6ZqBjZOe3IkH8MM5IzgQxXvI2HDqrhqVpIuIhmnYYLH9rewAfihxdrm65y65njIAgyA4jSBSKzTSEYqM2ZCP1MVQV34+tp+3kTaSJFC+FcFGW2QF49INidYrHeIdXWFGrxkuBAiDCUShpGZcZ6jfZdvRQTQnZ9/Sb44z4NR9JV41vjqCCyTR04yCjXJmWePIS3DHk7W2eBQWGCGzNJ3623zQxwzlVtcGgLMvr/80NQXAYoe9B3TlwfT9tXnyDjHwM+sgCRmcAef6nfvoSPHdLE0ED19BdV2LfDmJTPSCzE77WzOZwj6bWEJfk448o5/KPAlvSVI2aWZzeppFw37vtavn9udu/VbywaFIXvYzPDUjHXDKCQwie0hfx0MGixp/llbO3OI3EcVavIQoD+3v5PIp9CwMetJPOE1Xs+E40YIzZMqkiVRo/wV/geeV5D7X/DHH/ZdcjLBSgzMJVVA0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FB4F1432187334492254FA30FD6D96A@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Futurewei.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53030ac-e1a8-41dd-cca0-08d7eb063f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 23:53:56.1261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fee8ff2-a3b2-4018-9c75-3a1d5591fedc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLM7sEvqeBnLOmQdbrj+LehCVPN2qrGn24KI+yzvBoueNb4RDl/0+JPst9ORRHcpZEbyPYcwtukJay0F8A1eag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1301MB2141
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

SGksDQoNCkZvbGxvd2luZyB0aGUgWERQIHR1dG9yaWFsIG9uIEdpdEh1Yiwgd2UgcmFuIHNvbWUg
dGVzdHMgY29tcGFyaW5nIHRoZSBzZXR1cCBmcm9tDQp0aGUg4oCccmVkaXJlY3RpbmcgcGFja2V0
c+KAnSBzZWN0aW9uIGFuZCBhIGJhc2ljIE9WUyBzZXR1cC4NCihTcGVjaWZpY2FsbHkgcGFja2V0
MDMtcmVkaXJlY3RpbmcvQXNzaWdubWVudDM6IEV4dGVuZCB0byBhIGJpZGlyZWN0aW9uYWwgcm91
dGVyKQ0KDQpJbiBvdXIgdGVzdCwgd2UgY29sbGVjdGVkIHRoZSBudW1iZXJzIGJlbG93Lg0KRm9y
IHRoZSBPVlMgc2V0dXAuIHdlIHNhdyBUQ1AgdGhyb3VnaHB1dCBhdCBhcm91bmQgOTAgR2JpdHMv
c2VjLg0KRm9yIHRoZSBYRFAgc2V0dXAsIHdlIHNhdyBUQ1AgdGhyb3VnaHB1dCBhdCBhcm91bmQg
OSBHYml0cy9zZWMuDQoNCk9uIHRoZSBPVlMgc2lkZSB3ZSBoYWQgdGhlIGZvbGxvd2luZw0KLSBU
d28gdmV0aCBkZXZpY2VzIGVhY2ggYXNzaWduZWQgdG8gdGhlaXIgb3duIHVuaXF1ZSBuZXR3b3Jr
IG5hbWVzcGFjZS4NCi0gQm90aCB2ZXRoIGRldmljZXMgYWRkZWQgdG8gYW4gb3ZzLWJyaWRnZS4N
Ci0gaXBlcmYyIGJldHdlZW4gdGhlIHR3byB2ZXRoIGRldmljZXMuDQoNClNpbWlsYXJseSwgZm9y
IHRoZSBYRFAgc2V0dXAsIHdlIGZvbGxvd2VkIHRoZSBpbnN0cnVjdGlvbnMgZnJvbSBwYWNrZXQw
My1yZWRpcmVjdGluZy9Bc3NpZ25tZW50My4NCkRpZmZlcmVuY2VzIGhpZ2hsaWdodGVkIGJlbG93
Og0KLSBXZSBoYWQgdG8gZGlzYWJsZSByeCBhbmQgdHggY2hlY2tzdW1taW5nIHRvIGdldCBUQ1Ag
dG8gd29yay4NCi0gZXRodG9vbCAtLW9mZmxvYWQgdmV0aDAgcnggb2ZmIHR4IG9mZg0KLSBXZSBk
aXNhYmxlZCBCUEYgdHJhY2luZy4NCi0gaXBlcmYyIGJldHdlZW4gdGhlIHR3byB2ZXRoIGRldmlj
ZXMuDQoNClF1ZXN0aW9uczoNCjEuIFdoeSBpcyB0aGVyZSBhIFRDUCB0aHJvdWdocHV0IGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGVzZSB0d28gc2V0dXBzPw0KMi4gV2h5IGRvIHdlIG5lZWQgdG8gZGlz
YWJsZSByeCBhbmQgdHggY2hlY2tzdW1taW5nPw0KYS4gRGlzYWJsaW5nIHJ4IGFuZCB0eCBjaGVj
a3N1bW1pbmcgYnJvdWdodCBPVlMgdGhyb3VnaHB1dCBkb3duIHRvIDIyIEdiaXRzL3NlYy4NCmIu
IElzIHRoZXJlIGFueXRoaW5nIGluIHRoZSB2ZXRoIGRyaXZlciB0aGF0IG5lZWRzIHRvIGJlIGlt
cHJvdmVkIHRvIGVuYWJsZSB0aGlzPw0KDQpTZXR1cDoNCkJvdGggdGVzdHMgd2VyZSByYW4gb24g
YSBzaW5nbGUgQVdTIGluc3RhbmNlLg0KQVdTIGluc3RhbmNlOiB0Mi4yeGxhcmdlLg0KT1M6IFVi
dW50dSAxOC4wNCwga2VybmVsIHZlcnNpb24gNS42LXJjMg0KDQpDb2RlDQpXZSBoYXZlIGluY2x1
ZGVkIHRoZSBzY3JpcHRzIHdlIHVzZWQgZm9yIG91ciBzZXR1cCBpbiB0aGUgR2l0SHViIGZvcmsg
YmVsb3cuDQotIHNldHVwX3hkcC5zaA0KLSBzZXR1cF9vdnMuc2gNCkNoYW5nZXM6DQotIERpc2Fi
bGUgQlBGIHRyYWNpbmcuDQotIEFkZGVkIHNvbHV0aW9uIGZvciBwYWNrZXQwMy1yZWRpcmVjdGlu
Zy9Bc3NpZ25tZW50My4NCi0gQWRkZWQgc2NyaXB0cyB0byBydW4gT1ZTLCBhbmQgWERQIHJlZGly
ZWN0IG1hcCBiZW5jaG1hcmtzIHdpdGggaXBlcmYuDQpodHRwczovL2dpdGh1Yi5jb20vemFzaGVy
aWYveGRwLXR1dG9yaWFsL3RyZWUvcmVkaXJlY3QtYmVuY2gvcGFja2V0MDMtcmVkaXJlY3RpbmcN
Cg0KVGhhbmsgeW91LCBQaHU=
