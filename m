Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E17115A02
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Dec 2019 01:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLGALc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Dec 2019 19:11:32 -0500
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:3246 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfLGALc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Dec 2019 19:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2073; q=dns/txt; s=iport;
  t=1575677491; x=1576887091;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mJ7IGLDmTNuy/DdNRqbvK605CdimtowEOvCDC2yrThg=;
  b=Y4R4Yc2SaJJyBJ8jaPK1dIZmJqCRhtkPqwfVhGNt42csdRtYjGixKLdv
   6MuUoVfjUKWUyWCkWSNMs8DL/sxcjP1Sq+JL06Ig5AzyEMlf/na9/Z4t4
   ZbA4SmENFL0ci5Oi1IdqR1aIGttMh27HaXwshmLDaAEPnVSOqUzjvwv91
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3Ahn25qB/3wLkDdf9uRHGN82YQeigqvan1NQcJ65?=
 =?us-ascii?q?0hzqhDabmn44+/bB7E/fs4iljPUM2b8P9Ch+fM+4HYEW0bqdfk0jgZdYBUER?=
 =?us-ascii?q?oMiMEYhQslVcCfFFHyBPXrdCc9Ws9FUQwt8g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AiEAA57epd/5JdJa1lHgELHIFzC4F?=
 =?us-ascii?q?LUAWBRCAECyqHcgOLAE6aFoEugSQDVAkBAQEMAQEtAgEBhEACghUkNgcOAgM?=
 =?us-ascii?q?NAQEEAQEBAgEFBG2FNwELhVMCAQMSFRkBATgPAgFOMiUBAQQbGoVHAy4BAqB?=
 =?us-ascii?q?/AoE4iGGBdDOCfgEBBYUVGIIXCYE2hRyGfBqBQT+BWIIehQ8og0CCLI0kHh2?=
 =?us-ascii?q?JHIE8liQKgi6GPo9CgkKXby2EEooLgUWYZQIEAgQFAg4BAQWBWQ0lgVhwFYM?=
 =?us-ascii?q?nUBEUjGYMF4NQilN0gSiLJ4FhXwEB?=
X-IronPort-AV: E=Sophos;i="5.69,286,1571702400"; 
   d="scan'208";a="678621334"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Dec 2019 00:11:31 +0000
Received: from XCH-RCD-015.cisco.com (xch-rcd-015.cisco.com [173.37.102.25])
        by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id xB70BVpl017878
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
        for <xdp-newbies@vger.kernel.org>; Sat, 7 Dec 2019 00:11:31 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-015.cisco.com
 (173.37.102.25) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 18:11:30 -0600
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 18:11:30 -0600
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 6 Dec 2019 19:11:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jim0bjDbx2uCAYL7tvTXSPOQ4pcD4pKNVvf9mCOEPa912Qb7qAbnUdIso0Tc46+7oMMkfJAXoJSaWjqMzkuJ3iCGqx+Nut6fR0OOflfKRPOVpq+OY0u9SNMQP34Lsr16jJSgcFrmBQrQ1C8RkWQZADLm7ZTlqlsVhaHh7dLJKz9xkBlr5AmdswukSPmMtarAqr8tcQsoq3ctKNl+2kGjaGlQx0qYncQOKqUDGJ4MQM9Ra9FVsOwh6haWfNHlBZzJ2aojkbWSBq1qJ5dX2pOCgI6+E5FICR4jTgpBIOzv4y/+BDrxBa1orzDTgy5yd4FRlw+Gb/udlkIjBDKnH//YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ7IGLDmTNuy/DdNRqbvK605CdimtowEOvCDC2yrThg=;
 b=O+SHE5Wp/LrTSIeCOA96zz1n4FPnYc8q4v4qHjWP7OkUamPSaKtX5RvVmYj78tWii6YR6IsDd/2IgiEL3uLCGA7TaFuP3lKe+zhSJDg9N9vHzQiNVWzNBTSV/hNkkbvro5fzQEqmZMXUeIuy2L06Q2MrtqDmOXyVnK16kqHAT2m5jbYkSOVKZ8vh7xfNbqQHL+LPTipCecMZ7yZNxoUWov/dJnKnH7k+sn43bChGy53QgCKluUiX4XEaWmG1yAr1pkDgeWh3Gzp4Wo9LPokoVy4Ol6FlQSliLXcouyDGqCwDl6mNUFnHUw0+qQ3RGR0OyTh1pyNmW5RlFfRZoNG4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ7IGLDmTNuy/DdNRqbvK605CdimtowEOvCDC2yrThg=;
 b=m9WDT2Qmpqw3XPR6XhYY4LTSzNCnaiFelokjcXYx/Oah8MhVEWkVLZCFM816pTwRxiygx+k80VD1OtNTtF69zugCtZ9L086ObWiQHP/K9H6VhufibyZyHxH/ZYlZC33rWh3rPnJhWkhqVDizni0lwgU+BvP6sFuQcYXmfGnXl6c=
Received: from BYAPR11MB2615.namprd11.prod.outlook.com (52.135.225.143) by
 BYAPR11MB2774.namprd11.prod.outlook.com (52.135.224.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Sat, 7 Dec 2019 00:11:29 +0000
Received: from BYAPR11MB2615.namprd11.prod.outlook.com
 ([fe80::2835:9c5c:d15:7274]) by BYAPR11MB2615.namprd11.prod.outlook.com
 ([fe80::2835:9c5c:d15:7274%7]) with mapi id 15.20.2516.014; Sat, 7 Dec 2019
 00:11:29 +0000
From:   "Francesco Ruta (fruta)" <fruta@cisco.com>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: bpf_csum_diff - R3 offset is outside of the packet
Thread-Topic: bpf_csum_diff - R3 offset is outside of the packet
Thread-Index: AdWsjrc7YtRn7jdqRbqPAB4GKsXcxQAA6avg
Date:   Sat, 7 Dec 2019 00:11:29 +0000
Message-ID: <BYAPR11MB261504C332D91F584F054345B45E0@BYAPR11MB2615.namprd11.prod.outlook.com>
References: <BYAPR11MB26157ACA256993F0F15D65E7B45F0@BYAPR11MB2615.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB26157ACA256993F0F15D65E7B45F0@BYAPR11MB2615.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fruta@cisco.com; 
x-originating-ip: [2001:420:c0c8:1003::71d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04cf4c9f-d064-4ded-e4ee-08d77aaa0209
x-ms-traffictypediagnostic: BYAPR11MB2774:
x-microsoft-antispam-prvs: <BYAPR11MB2774301FFF8A18BFED078EC5B45E0@BYAPR11MB2774.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0244637DEA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(366004)(376002)(39860400002)(396003)(199004)(189003)(6506007)(5640700003)(7696005)(81156014)(102836004)(81166006)(8936002)(9686003)(478600001)(55016002)(8676002)(74316002)(76176011)(99286004)(305945005)(6916009)(186003)(66556008)(52536014)(2906002)(64756008)(66446008)(86362001)(5660300002)(76116006)(66946007)(71190400001)(66476007)(33656002)(71200400001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR11MB2774;H:BYAPR11MB2615.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0VsWRbmZr9O4LSZQJfLycxg26I/K2CN+76G8RN8RHpB2kj/AIDio7eQrFY/rP214WJmTXTRASkgIG1pXxCVYsAffLTnZ0oTvA2L3CCd2XMWRoiAj1fs1jzL9D6c4v7yjf+AwlfK+XLKnA7ok3ltc0tAPV1BqOLYIWcWKoNRov8LleU1eAUtS55dHirLMeapPdSNk/ObhvPwwVxFqOmh+KK+tH9U/Y9WwfcMJAieYaF4t3LaPxo9P0GuiM8b3kfVM+hmnTgDJrOnb8P8WrulIqUd1a0Nk7Vi11Q5fWFsYIX9a1lrsN2Z/6bVzZL8DVxbocn7DBwMOMCarUTTMYw/Khl2U2Hnrs97LZOUfpFR7S69X5eDIJYxvJzqWkprH+iHzhcok/g5wJ7Ld54+V3eOb5idvLOtzgEoWMP65NH5+ue+7p23WuT6J7v/OWX/kyFcO
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf4c9f-d064-4ded-e4ee-08d77aaa0209
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2019 00:11:29.2616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35dOucMK3jVWJlhRNY0nmVF/nGAljLory1YNcrMYdlSwShcLSKEp5sL0SeXhVq41
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2774
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.25, xch-rcd-015.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

I am trying to use bpf_csum_diff() to recompute a corrupted checksum in XDP=
; unfortunately, in this specific case, I am unable to just perform an incr=
emental update.
I understand that the verifier will reject code that uses dynamic length, b=
ut even the stripped-down test shown below is rejected.
I tried directly in assembly adding extra range checks for the r3 register =
to placate the most phobic verifier to no avail.
Is there any workaround -or any alternative?
BR
F.

SEC("test")
int intercept(struct xdp_md *ctx) {
=A0=A0=A0 void * data =3D (void*)(long)ctx->data;
=A0=A0=A0 void * dataEnd =3D (void*)(long)ctx->data_end;
=A0=A0=A0 void * dataPnt =3D data;
=A0=A0=A0 if (dataPnt >=3D dataEnd) {
=A0=A0=A0=A0=A0=A0=A0 return XDP_ABORTED;
=A0=A0=A0 }
=A0=A0=A0 __u32 dataLen =3D (__be32 *)dataEnd - (__be32 *)dataPnt;
=A0=A0=A0 if (dataLen > sizeof(__be32)){
=A0=A0=A0=A0=A0=A0=A0 (void)bpf_csum_diff(0, 0, (__be32 *)dataPnt, sizeof(_=
_be32), 0);
=A0=A0 }
=A0=A0=A0 return XDP_PASS;
}
char _license[] SEC("license") =3D "GPL";

Prog section 'test' rejected: Permission denied (13)!
- Type:=A0=A0=A0=A0=A0=A0=A0=A0 6
- Instructions: 18 (0 over limit)
- License:=A0=A0=A0=A0=A0 GPL

Verifier analysis:

0: (b7) r6 =3D 1
1: (61) r2 =3D *(u32 *)(r1 +4)
2: (61) r3 =3D *(u32 *)(r1 +0)
3: (3d) if r3 >=3D r2 goto pc+12
R1=3Dctx(id=3D0,off=3D0,imm=3D0) R2=3Dpkt_end(id=3D0,off=3D0,imm=3D0) R3=3D=
pkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv1 R10=3Dfp0,call_-1
4: (1f) r2 -=3D r3
5: (18) r1 =3D 0x3fffffffc
7: (5f) r2 &=3D r1
8: (b7) r6 =3D 2
9: (b7) r1 =3D 17
10: (2d) if r1 > r2 goto pc+5
R1=3Dinv17 R2=3Dinv(id=3D0,umin_value=3D17,umax_value=3D17179869180,var_off=
=3D(0x0; 0x3fffffffc)) R3=3Dpkt(id=3D0,off=3D0,r=3D0,imm=3D0) R6=3Dinv2 R10=
=3Dfp0,call_-1
11: (b7) r1 =3D 0
12: (b7) r2 =3D 0
13: (b7) r4 =3D 4
14: (b7) r5 =3D 0
15: (85) call bpf_csum_diff#28
invalid access to packet, off=3D0 size=3D4, R3(id=3D0,off=3D0,r=3D0)
R3 offset is outside of the packet

uname -sr
Linux 5.0.0-1022-gke
