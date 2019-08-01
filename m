Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C027E123
	for <lists+xdp-newbies@lfdr.de>; Thu,  1 Aug 2019 19:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbfHARdk (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 1 Aug 2019 13:33:40 -0400
Received: from mail-eopbgr670066.outbound.protection.outlook.com ([40.107.67.66]:9729
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726118AbfHARdk (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 1 Aug 2019 13:33:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQHYXnSZKZct+t3vlT/sjLF9LtrGhQp93jsojeak0IOxzHygMo6TMlZue2JiN0BWrNbKZ2/ACx25qsG/lYaeJLvizT9RaMlO1xLoW/vQH+D9LGOhyttMMJuoHHxrlcsNuDbCLNLvzPT34TE78avpFc+BGCt8gRm/sMf1dllisSg90WHrLTafv3ODg5EcVRbLzrbFoZOCR16c2hvdZHnagleXynFrfng7R/1rUfcybxWjUXTeXRpfToSE5yd4ylFxG9JnGf6gCdt0xEl1GsQDHXMH1JVx42OEuH9eaPaQjj0xOdnhj75N0TnhuWRCHqcVhNQwZFOMiWihfXKzjqSL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnYsR/YUWbtY9sOoVhWUpC1S9+1GZBiJW1/L4NRgKyk=;
 b=ZoL23h1Nwz8ECQuUxkQk6+seIfpCY0/4tJXNkpEMq3bHCaNXjnUKPI9Jnv+AIxZoMh9shrT+I8fYY5X37FqnVcez/T6RaNKXzVIOniDJ2/QrTudFIx3WhM/coh/9XPJiQ3aVybrJ/GXKQ48aXVB8sD2CI795SoMF3myTrRGm1uRomQPhwy2JLQcwytNsr367n2d8Gf3olMgLbazg8XRFuFqZ9G6B1iteUtnN9S1T65NC902NMwm6VJaSs+jP7zFK7DPIpDYmsowLMtl1IfVxJI0bugFORMsqPdYQMMX+11DhnrUMeTZZRuNbjAcBLocC2ey4ctbdCZfZxQrmxPtClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=multapplied.net;dmarc=pass action=none
 header.from=multapplied.net;dkim=pass header.d=multapplied.net;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=multapplied.onmicrosoft.com; s=selector2-multapplied-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnYsR/YUWbtY9sOoVhWUpC1S9+1GZBiJW1/L4NRgKyk=;
 b=bFAG6UDmvu6xaPPUPy1gOjxbPtZN8ONcVBeYNaj7rts83IidSeSb4JnSxMacm7uJvNka9NGi44dkTW/b4KSLlsq1O+dEIv3zEAKIr7EzI5Cg+sNGAjpK76LliW5OkIsvf3kXX1gIl4cbtiuPlCXczVjZH5t1iNpGOjJAyuwtX1A=
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM (52.132.66.146) by
 YQBPR0101MB1796.CANPRD01.PROD.OUTLOOK.COM (52.132.66.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 17:33:37 +0000
Received: from YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6]) by YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bc75:7089:c0da:8fe6%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 17:33:37 +0000
From:   Brandon Cazander <brandon.cazander@multapplied.net>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        David Miller <davem@davemloft.net>
Subject: Re: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Thread-Topic: xdpgeneric, XDP_PASS, and bpf_xdp_adjust_head decapsulation
 dropping packets
Thread-Index: AQHVR+Sm9Bp2XlLyUEehmllejwAWTabl87SAgACa8wA=
Date:   Thu, 1 Aug 2019 17:33:36 +0000
Message-ID: <20190801173324.GA660183@multapplied.net>
References: <20190731211211.GA87084@multapplied.net>
 <20190801101746.702431fc@carbon>
In-Reply-To: <20190801101746.702431fc@carbon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR0201CA0081.namprd02.prod.outlook.com
 (2603:10b6:301:75::22) To YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:5::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brandon.cazander@multapplied.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2602:ff93:11ff:120:44d7:d0ff:fe6d:d20f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37c0c6f4-d1e6-4dc3-7c08-08d716a66265
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:YQBPR0101MB1796;
x-ms-traffictypediagnostic: YQBPR0101MB1796:
x-microsoft-antispam-prvs: <YQBPR0101MB1796B977C7B9206A6471CB109EDE0@YQBPR0101MB1796.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(39840400004)(366004)(346002)(189003)(199004)(11346002)(476003)(2616005)(52116002)(102836004)(54906003)(71190400001)(76176011)(7736002)(33656002)(6246003)(486006)(64756008)(305945005)(316002)(66946007)(66446008)(66556008)(66476007)(68736007)(229853002)(508600001)(46003)(99286004)(446003)(6506007)(86362001)(6116002)(44832011)(386003)(186003)(5660300002)(71200400001)(36756003)(8936002)(8676002)(6916009)(6512007)(14454004)(53936002)(2906002)(14444005)(256004)(25786009)(81156014)(6486002)(81166006)(6436002)(4326008)(1076003)(27376003);DIR:OUT;SFP:1101;SCL:1;SRVR:YQBPR0101MB1796;H:YQBPR0101MB2244.CANPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: multapplied.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZY2+kHTXcXof7hyUErUlu0mIj0HGmYWladS23XiRfkcli5hMCEEIxg78+pWdthXw7k+Jt0nxmLfpdMTfF9bmWRrQxyHqdjC4hsq7P2pHm6Os1wykp59KZVSTpuKvr7TO5Qe+THuipJ1DOMSDOg5pnpduISXCLtbLYwRKnSJcWo+h3amD1dqsGew95UFrWbQJmPk4CjNudTtezUbjsWAWZEh2ijsFZ9yGSCrGBZ1ts3ILRqNqA7xEJhEMqfv6+qrg7jOcVsZZ3N71KDLRxGj2YOUSQ/1+dEosnD72BHijpWwhSAxUBI8+KEtYe30/FDSAa6dypae1pVoysZW8sMqgbnFwBLpX48Ss/rytIrC5o/ByAs5R5SUL2lkQZk4XrwNfI93PJ2lMcyyZKTMDPLO0KnXb2QTtMvI43TsGjtwnqOA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB2932EFD844024F9D964A22DB3F44F2@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: multapplied.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c0c6f4-d1e6-4dc3-7c08-08d716a66265
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 17:33:36.9023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 10c26ea1-9e95-414d-91d0-c44adf533c85
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brandon.cazander@multapplied.net
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB1796
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thank you very much for your prompt and detailed review of my report!
Some of these answers may be moot now that you have found the specific
commit that caused the issue.

On Thu, Aug 01, 2019 at 10:18:49AM +0200, Jesper Dangaard Brouer wrote:

> Are you sure you are using "xdpgeneric" mode?
> As virtio_net do have "native" XDP mode.

The program is loaded with XDP_FLAGS_SKB_MODE in this case. I'm having a
separate issue with "native" XDP on virtio_net that I'm working on but
it is more likely an issue with my code.

> Encapsulated packet starts at a funny offset, making it harder to follow.

Sorry about that. I should have made it easier.

> Looking at the code, I think the packet will be dropped earlier than
> the pskb_trim_rcsum() call, in the check if (skb->len < len).

I had the same suspicion but a probe in the corresponding drop showed no
results, and furthermore, the InTruncatedPkts SNMP counter was not
increasing.

> You only support IPv4 encapsulated packets?
>=20
> Do you handle ARP requests separately?

Sorry, I wanted a minimal example so this is stripped down.

> Can you test an earlier kernel, specifically before: commit
> 458bf2f224f0 ("net: core: support XDP generic on stacked devices.")
> (Author: Stephen Hemminger)
>=20
> $ git describe --contains  458bf2f224f04
> v5.2-rc3~26^2~11^2
>=20
> I fear that this commit, which moved generic-XDP to a later call point,
> might cause this.  Because it could be that the SKB network_header
> update, is now done before calling XDP program (... still looking at
> code details).

You have already confirmed this but I can also confirm that a kernel
before commit 458bf2f224f0 works with no changes to my program.

