Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320971164C5
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Dec 2019 02:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLIB30 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 8 Dec 2019 20:29:26 -0500
Received: from alln-iport-3.cisco.com ([173.37.142.90]:28435 "EHLO
        alln-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbfLIB30 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 8 Dec 2019 20:29:26 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Dec 2019 20:29:25 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3150; q=dns/txt; s=iport;
  t=1575854965; x=1577064565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Csf6AbhO7pLSWe6JsBbpdidhP/0E+44c15SRAQp5xfA=;
  b=KNeKn3+qIT5DgNNmPGO1eDzm5UvZVIy14MWEZvQLl+KtftTL+cgXGGlc
   2/sYIsgmfqgxxRR/oI8GYyBd2JT8CkHEdKoq0GrDfARzAPlRribsZcpj9
   NnRjaEQcbd6TgYXfP72FjiXRt4tnv0uW5gc9E9bIdUuBTwLRK2QflLloC
   s=;
X-IPAS-Result: =?us-ascii?q?A0BaAQCLoO1d/4kNJK1lHAEBAQEBBwEBEQEEBAEBgW0EA?=
 =?us-ascii?q?QELAYFKUAWBRCAECyqDdYNGA4sCgl+JW44qglIDVAkBAQEMAQEtAgEBhEACg?=
 =?us-ascii?q?hUkNwYOAgMBAQEDAgMCAQEEAQEBAgEFBG2FNwyFUgEBAQEDBA4OBxkBATcBC?=
 =?us-ascii?q?wQCAQgOAwQBAS8hER0IAQEEDgUIGoVHAy4BAqAZAoE4iGFqCIECM4J+AQEFh?=
 =?us-ascii?q?RsNC4IXCYEMKgGFG4Z8GoFBP4FYgh4uPoIbgggogww0giyNJDuKWJVjQwqCL?=
 =?us-ascii?q?pFIhDmCQpdwLYQSi1CJFo9QAgQCBAUCDgEBBYFoI4FYcBWDJ1ARFIxmDBeDU?=
 =?us-ascii?q?IpTdIEoizGBYV8BAQ?=
IronPort-PHdr: =?us-ascii?q?9a23=3ADhUw6xZIZRhmS+ENd5AYB/D/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el20Q+bRp3VvvRDjeee87vtX2AN+96giDgDa9QNMn?=
 =?us-ascii?q?1NksAKh0olCc+BB1f8KavkdTEmFexJVURu+DewNk0GUMs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.69,164,1571702400"; 
   d="scan'208";a="397438656"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Dec 2019 01:22:18 +0000
Received: from XCH-ALN-013.cisco.com (xch-aln-013.cisco.com [173.36.7.23])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id xB91MIGR000782
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 9 Dec 2019 01:22:18 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-ALN-013.cisco.com
 (173.36.7.23) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 8 Dec
 2019 19:22:17 -0600
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 8 Dec
 2019 19:22:17 -0600
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sun, 8 Dec 2019 20:22:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9riseYqmTQGp7ec52xrFGBpzScc0qoV0OiS6pxmjBJU+unfDBAIpYOKg2DhhBm36LEdN2mrEB8KW1QoQeQkquZc176VIe7LNKrykHtcwmK+TAH7+vEIT5TftZy5hpwEMCUJOLxaZjGzw3Gdv1y/QV0x+QL34VQqkpGpIH1HTuTlKXU0lXkrRefCCS6szpktDXFjFufo5n2xKSQMTLaPZVM82EbBGV1Nzi6XU5F6in3qrsAawA/7pe++gt3TQV8lFajF1W1Tm+KstlqvrcT8kamaZs8hXh32bFQELZ53PUi03kDb7bx0xvZwPqv+hcy6OlI+OuKRpbN/AWhhLEei3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZcOPRxa64WcBMMWpVKirlNCWPUYydJuNlmfKZgvmFA=;
 b=XkjSt3AAbdGAA11EpiusD+8/Un0olKXJtK4Z4KxqwOHCjWg+P/LQEjruV2Q7w8Zraq8k3kriGiJhiaw2U8bnveueRONBafephSuwmXlgNM3v393hVNbJwlqSfeMnX07daiDd0Di3zjYexYQHR4+zVpIE9imHvrqE5QHP0J9fIp4iJHLxeUkrV1FcSZbnsDqjBRD8fsygx1VRQMyj01n2WlKSJ3llO9GOEweqbRRdSGGuEGNkg6KJH7hOKLLTKFCobRBRq3/Jsc6ungvNnssP4e/kiYF6R30lcFKDXL0t5c0PQ7qe7Bc2w0y6xHpxzsw889pNDbfbxbDHXAi/ng1FDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZcOPRxa64WcBMMWpVKirlNCWPUYydJuNlmfKZgvmFA=;
 b=PzPTy/y8Wy3c7hqta+AxUSmq7zG+xeirrfFtF9qzTzynRttHa70QiwSMy/D5aDeO7BTRbuhNSjGHXKEKOL1PGwGAg1JSGiRbXzRi9F7DClUpEbAJApANQcAAqd3uuUnOiIRkPdYj4u5U58UfYdF6+rH1kDSK3pcDf8BlJmk80r8=
Received: from DM6PR11MB2618.namprd11.prod.outlook.com (20.176.96.30) by
 DM6PR11MB3962.namprd11.prod.outlook.com (20.176.124.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Mon, 9 Dec 2019 01:22:16 +0000
Received: from DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::61d7:d0c6:29a8:7278]) by DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::61d7:d0c6:29a8:7278%2]) with mapi id 15.20.2495.014; Mon, 9 Dec 2019
 01:22:16 +0000
From:   "Francesco Ruta (fruta)" <fruta@cisco.com>
To:     Anton Protopopov <aspsk2@gmail.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: RE: bpf_csum_diff - R3 offset is outside of the packet
Thread-Topic: bpf_csum_diff - R3 offset is outside of the packet
Thread-Index: AdWsjrc7YtRn7jdqRbqPAB4GKsXcxQAA6avgABuGC4AAPGldQA==
Date:   Mon, 9 Dec 2019 01:22:16 +0000
Message-ID: <DM6PR11MB261860B14521DC3A3B6C91B1B4580@DM6PR11MB2618.namprd11.prod.outlook.com>
References: <BYAPR11MB26157ACA256993F0F15D65E7B45F0@BYAPR11MB2615.namprd11.prod.outlook.com>
 <BYAPR11MB261504C332D91F584F054345B45E0@BYAPR11MB2615.namprd11.prod.outlook.com>
 <CAGn_itw1=3+dH85NL-4NtdKgLnXPgCZe4xrjQRx_Tu3iwySaiQ@mail.gmail.com>
In-Reply-To: <CAGn_itw1=3+dH85NL-4NtdKgLnXPgCZe4xrjQRx_Tu3iwySaiQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fruta@cisco.com; 
x-originating-ip: [2001:420:c0c8:1003::71d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3432a4e-7b89-40da-cbb8-08d77c463a57
x-ms-traffictypediagnostic: DM6PR11MB3962:
x-microsoft-antispam-prvs: <DM6PR11MB396280403DE4108E6ABBF865B4580@DM6PR11MB3962.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(366004)(396003)(346002)(199004)(189003)(13464003)(305945005)(81166006)(66476007)(66556008)(64756008)(81156014)(71200400001)(71190400001)(8936002)(186003)(5660300002)(66446008)(76116006)(53546011)(6506007)(6916009)(66946007)(102836004)(52536014)(86362001)(74316002)(316002)(8676002)(7696005)(76176011)(478600001)(9686003)(99286004)(33656002)(55016002)(4326008)(229853002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3962;H:DM6PR11MB2618.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6tAR619FfWqgZgmC0bzOndhykgFEbMol6UFo+zdn0BKEfjrgJBFxuIoyTsG9dTYgzaY2Ri5gLPJG7wh+nG1OdFc6YnSYbXbdRrJpPFevdpSk94s7UtAtvK5qlLBxNzI/eNNlI+bOW7ux3hXJuMt6uTH4sM9XS3c1nLg53KnLLgFFVZN9ZoiYklo5YO76DQxj74yBL4m4vgvGl0eHdVvFqhBotAI8HqiyyxrgF5tridEasnF/R1q4hJcSPFYU8Sixi9oyjh8VgbeGVqIm1sJsqYeLrZtoMGNInY5LBylyh3XzmIGS+/Z2JK6GHgb3L5Jugik7D2Nu2/l9pJhOdSU+Ft+ZPNzgLC7HkOe2S58fpo6bub07hv/jhLHAucCs9iB7JvBC/PeGIOejiNbZWyYErkudrpFTtHgvQ/y8ik4G+WLWyJ79ve6YNNCwyNfcA8qP+F4Rg1SE0ma14LpiYlXJ78Um1UyviAtMIFabMTwjHA/CRN8SjYkEspr1OqzU3KYj
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3432a4e-7b89-40da-cbb8-08d77c463a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 01:22:16.3052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8U/oMywGCoVQqCsoozAHDKfMlZ+T0/aRK2ILmxMXiJ/2gJwkRc/kr5oWjtiEDDK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3962
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.23, xch-aln-013.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Anton,

Thank you for your suggestion. Albeit that would work for the example, it d=
oesn't seem to work for my original problem where the length of the buffer =
is computed dynamically.

Thank you again
Francesco

-----Original Message-----
From: Anton Protopopov <aspsk2@gmail.com>=20
Sent: Saturday, December 7, 2019 7:16 AM
To: Francesco Ruta (fruta) <fruta@cisco.com>
Cc: xdp-newbies@vger.kernel.org
Subject: Re: bpf_csum_diff - R3 offset is outside of the packet

Hi Francesco,

=D0=D4, 6 =C4=C5=CB. 2019 =C7. =D7 19:12, Francesco Ruta (fruta) <fruta@cis=
co.com>:
> Hello,
>
> I am trying to use bpf_csum_diff() to recompute a corrupted checksum in X=
DP; unfortunately, in this specific case, I am unable to just perform an in=
cremental update.
> I understand that the verifier will reject code that uses dynamic length,=
 but even the stripped-down test shown below is rejected.
> I tried directly in assembly adding extra range checks for the r3 registe=
r to placate the most phobic verifier to no avail.
> Is there any workaround -or any alternative?
> BR
> F.
>
> SEC("test")
> int intercept(struct xdp_md *ctx) {
>     void * data =3D (void*)(long)ctx->data;
>     void * dataEnd =3D (void*)(long)ctx->data_end;
>     void * dataPnt =3D data;
>     if (dataPnt >=3D dataEnd) {
>         return XDP_ABORTED;
>     }
>     __u32 dataLen =3D (__be32 *)dataEnd - (__be32 *)dataPnt;
>     if (dataLen > sizeof(__be32)){
>         (void)bpf_csum_diff(0, 0, (__be32 *)dataPnt, sizeof(__be32), 0);
>    }
>     return XDP_PASS;
> }
> char _license[] SEC("license") =3D "GPL";
>
> Prog section 'test' rejected: Permission denied (13)!
> - Type:         6
> - Instructions: 18 (0 over limit)
> - License:      GPL
>
> Verifier analysis:
>
> 0: (b7) r6 =3D 1
> 1: (61) r2 =3D *(u32 *)(r1 +4)
> 2: (61) r3 =3D *(u32 *)(r1 +0)
> 3: (3d) if r3 >=3D r2 goto pc+12
> R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2=3Dpkt_end(id=3D0,off=3D0,imm=3D0)=20
> R3=3Dpkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv1 R10=3Dfp0,call_-1
> 4: (1f) r2 -=3D r3
> 5: (18) r1 =3D 0x3fffffffc
> 7: (5f) r2 &=3D r1
> 8: (b7) r6 =3D 2
> 9: (b7) r1 =3D 17
> 10: (2d) if r1 > r2 goto pc+5
> R1=3Dinv17=20
> R2=3Dinv(id=3D0,umin_value=3D17,umax_value=3D17179869180,var_off=3D(0x0;=
=20
> 0x3fffffffc)) R3=3Dpkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv2 R10=3Dfp0,=
call_-1
> 11: (b7) r1 =3D 0
> 12: (b7) r2 =3D 0
> 13: (b7) r4 =3D 4
> 14: (b7) r5 =3D 0
> 15: (85) call bpf_csum_diff#28
> invalid access to packet, off=3D0 size=3D4, R3(id=3D0,off=3D0,r=3D0)
> R3 offset is outside of the packet
>
> uname -sr
> Linux 5.0.0-1022-gke

You need to check pointer boundaries, try something like this:

SEC("test")
int intercept(struct xdp_md *ctx) {
    void * data =3D (void*)(long)ctx->data;
    void * data_end =3D (void*)(long)ctx->data_end;
    const int N =3D sizeof(__be32);

    if (data >=3D data_end)
        return XDP_ABORTED;

    if (data + N <=3D data_end) /* lets verifier to know that data[0,...,N-=
1] is valid */
        bpf_csum_diff(0, 0, data, N, 0);

    return XDP_PASS;
}
