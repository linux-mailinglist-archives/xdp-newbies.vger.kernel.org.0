Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 127247E2B3
	for <lists+xdp-newbies@lfdr.de>; Thu,  1 Aug 2019 20:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732853AbfHASx7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Aug 2019 14:53:59 -0400
Received: from mail-eopbgr670047.outbound.protection.outlook.com ([40.107.67.47]:39808
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731751AbfHASx7 (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 1 Aug 2019 14:53:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml5kKvA3D94OpaEDYQ3u2WY9XxMLDLzijgWcuD3vxJ2QO+3YSElfPnd+P8YE3qkcKBLYrbbzZMVHhoOPBRtSFWAXXay7qeAyjjDfgUKK8w4LM5FE/y53BNmDJUB5TsEr/gTAp4NPyCTtfB51ps9ell7MUeJGxRm+3DjJ73EH1TEnEQnPAk+NYoZs5TVkckeoohRBtXI6wwlldlph7yKJDhLQX2M/y+f5Ltnb+9ANYwPvrwgdIr636Z649DsojKpHVnQXyA6mM1wZlsdE5FV+vf8VfWihcYRXfccYIf8V4uWldRTSg1s67GE6I3SY2aQvHB0++JmcAlyKCPM/k42KAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGj2eY+AQ6Aw+nZHDyYMnq7RuWUupptNpg0Fo9PWhoo=;
 b=CMW97M/JPGEQpAaNp5IuskeHmWrFDRma8fByICOjO4BVPzgJKtgaSwebC9Tv6i6Sq70ERES9opa5Z1CQHDfGnvBJdhwr4ZZIuAxhb6xvSQk8tr5891PQMJkWXFHNHtkrZ7+rvw/EGgmrzso2+1ZYDhDaYxEKzwAB33Y/mWW9tR65+dUCqkxie6E1COm61faREQuTcYEAsDOa8rjZlfF0rgD8Hb07IP1a4YV0U0WtcmXUOqRKRGi024OgwhNDQm028HhintTUpogGC7NAxD1SB92rEkHnJansRFz2ka3MjhrcllaHiIYhHJE1Gng9eE7XQG5TUqhXzviArj15OwZ7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=multapplied.net;dmarc=pass action=none
 header.from=multapplied.net;dkim=pass header.d=multapplied.net;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multapplied.onmicrosoft.com; s=selector2-multapplied-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGj2eY+AQ6Aw+nZHDyYMnq7RuWUupptNpg0Fo9PWhoo=;
 b=b4Ypbv5bH82+kx/4O9eY8SlvID+WL2rqCmOua9G6dEOA1fIjtO+0DeRLvSDgrIcolY36HVToQjpwgNOmMWZp0sOFYpEKRipW+f6o+RZZkPErlgwrc/GwJvSmetC16tgS+oriOXqUFqqWsJsUSuXkN8URg0QxAzNmIMf+7ZJbNZ4=
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM (52.132.66.146) by
 YQBPR0101MB2113.CANPRD01.PROD.OUTLOOK.COM (52.132.67.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Thu, 1 Aug 2019 18:53:56 +0000
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6]) by YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 18:53:56 +0000
From:   Brandon Cazander <brandon.cazander@multapplied.net>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        David Miller <davem@davemloft.net>
Subject: Re: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Thread-Topic: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Thread-Index: AQHVR+Sm9Bp2XlLyUEehmllejwAWTabl87SAgAAlqoCAAIFDAIAACnmA
Date:   Thu, 1 Aug 2019 18:53:56 +0000
Message-ID: <20190801185345.GA746463@multapplied.net>
References: <20190731211211.GA87084@multapplied.net>
 <20190801101746.702431fc@carbon> <20190801173324.GA660183@multapplied.net>
 <20190801201612.3aef7783@carbon>
In-Reply-To: <20190801201612.3aef7783@carbon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:104:3::30) To YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:5::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brandon.cazander@multapplied.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2602:ff93:11ff:120:44d7:d0ff:fe6d:d20f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34cb209d-781a-4eea-ced6-08d716b19b03
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);SRVR:YQBPR0101MB2113;
x-ms-traffictypediagnostic: YQBPR0101MB2113:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <YQBPR0101MB21134B2430E5008CDC2AAB279EDE0@YQBPR0101MB2113.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(39830400003)(346002)(199004)(189003)(71200400001)(2616005)(229853002)(966005)(14454004)(68736007)(86362001)(76176011)(36756003)(476003)(508600001)(6486002)(46003)(186003)(6436002)(11346002)(25786009)(71190400001)(99286004)(4326008)(6916009)(52116002)(446003)(81156014)(81166006)(64756008)(66446008)(6506007)(66556008)(8676002)(386003)(66946007)(33656002)(66476007)(53936002)(6246003)(8936002)(102836004)(7736002)(305945005)(5660300002)(6512007)(6306002)(4744005)(54906003)(6116002)(256004)(486006)(1076003)(316002)(44832011)(2906002)(27376003);DIR:OUT;SFP:1101;SCL:1;SRVR:YQBPR0101MB2113;H:YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: multapplied.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bjjtDPQOUeRnS2bjbIK+U/NeIrOul8N2bLSucV20k7Xgn4icPwpkNwR5JicmfNjbkxSaIPumfoGXi+cjL8iYGSvzESLtAdzl3u5BZKCv172fabalZgP+dIeU2VVBBaZaud7p3uf0ScL8j0ckf8jXG4JSmKa/JqU7PKx1XJeX1BNZZs2N5maFX0q8O6Jo8WI1jHSsv/MULBZiG9vs0gnygGwvMR3ZxTafh7SQdr+VogmimrVhTaSdJRixRXjg9EzQ7KoR/5j29SGuqi1vhMXEcUjhwXp7KOqhg7sZt6hKYNMqmd3MR8AXg7zVblfECWSpRMnq4AO2xIO5ny47k1ewD1sADx2cd67j0aWTdvNhLb3TtXCQPpv1/udGd5KthU7Gs0ZcZus3wFwvrltxuQfUiHdOuT2oayKlGQHWeHeZwmo=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D04C43178A4DC48A309C9D94E37DB91@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: multapplied.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cb209d-781a-4eea-ced6-08d716b19b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 18:53:56.2964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 10c26ea1-9e95-414d-91d0-c44adf533c85
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brandon.cazander@multapplied.net
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB2113
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

[...]

> Thanks for also confirming. I've just send a patchset with fixes:
>  https://patchwork.ozlabs.org/project/netdev/list/?series=3D122796&state=
=3D%2a

Thank you for this; I tested this against my environment and it works as
expected again.

> I can recommend that you look at the selftest script test_xdp_vlan.sh:
>  https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bp=
f/test_xdp_vlan.sh
>=20
> Which uses veth and network namespaces for testing.  If you get the
> hint, then you can actually create these small scripts, that can
> function as unit and regression tests for XDP code snippets.
>=20
> Our XDP-tutorial also uses veth as a development environment:
>  https://github.com/xdp-project/xdp-tutorial/tree/master/testenv

Great hint, I will definitely use these going forward!

