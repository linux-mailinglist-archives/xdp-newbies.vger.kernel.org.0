Return-Path: <xdp-newbies+bounces-134-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64757968BAA
	for <lists+xdp-newbies@lfdr.de>; Mon,  2 Sep 2024 18:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD602838D8
	for <lists+xdp-newbies@lfdr.de>; Mon,  2 Sep 2024 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B09F1A2653;
	Mon,  2 Sep 2024 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VvwRkHKx"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03olkn2021.outbound.protection.outlook.com [40.92.59.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B91A265A
	for <xdp-newbies@vger.kernel.org>; Mon,  2 Sep 2024 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.59.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293379; cv=fail; b=IWg7blAJWE2fbKF/P0n0XAqy3Er33FcJPY8g03VieIZkvRYMPp0XDxIr7dncfCcXUkJeTbPGNqMcztl0IfsFQPCg9p4DdvtvbLn+9EQczz/R1I6/wR9UH0sqCc6MHPH5FTrHAkBcYOCVopOHLN/C2ymaRKydQrLYItWYG46tB4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293379; c=relaxed/simple;
	bh=3te3wDrAzCqMMFV8Me4bwCAExHFrP1zxvthMeAkKlVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2s+/i72UMvCGrM5yl4oPpTM5eTDt4ijCjXBQrY2QeLlz4RyVLYPjwz8Q7Vlg9YL6cVOBtSKis/F2jChPN/TPsVgEZ6Ou+YKI63eYbrJfOJBeBSXrwNWttFntYBy165jJFro7W1J7W3j/QMQdmLi3BsZ6ajrtnPuodlYTtJMCl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VvwRkHKx; arc=fail smtp.client-ip=40.92.59.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZU3wsVTigS7XNZl5npWbZTAov/hqcqV1IN9aE54/JpXKVBIEdn9kJoVSbOSeuWKV3G5o+9HSGnHald9bgfSLmqsG7vIA7qqJTOQQ07oeIIEJuWb5j4/IFVZYQ98gxZP2tBNmNqYjS7HiDEObfHQN82sILZvwIurGLcgpeLx9fpX3EKvvrMJb+F+rUAozlU7AjmtMXBWRpoK/fHKLbgqaDkPMXIDgEOm6A10wVF7XZjT0DDTA6ja6+MzSWgim9J4hwEOIKhtfcv1bNyAz6BAbRmvTGTjRwwfGAz8Dy1x/ZdF5BAs4m1zQOrnz0gNaXQ4MjLO4bf6+KhozPprXBNcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djCGbMt9biGCWzlDiCzzVvmiJdkvBRrKexzGZqlMaaA=;
 b=hc/mI1hvpZu2f1bu+Lj6BbWYM3yCdH0BiB99YKsGhzoQi50u39zjKiGexW+0DdMVOD1/cr1ildozG4r+r8s5I1+q4t2moIjImJvqvzlmTzT7mLx2ckwPKbrSx5U6vECNpCTbx9ghAjR9mtb8kpgIqhymh6qCF2UYqhyqjH7UMMjadjfXm5UnDiKkhts8CY5fQ0UckPiFWNjW+xLUP3Z8azeRlThwBg5gwQ68moL2h2PvmSas1Hl89UfETid0gJ8YOS10F2C/kLp7xCYh+3Bl1T1Peeu7CljBoXFZbjHX5SgT44Qp+2XiZjoPgQD8e46kOamoCsiNn2bKSOQFqxmNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djCGbMt9biGCWzlDiCzzVvmiJdkvBRrKexzGZqlMaaA=;
 b=VvwRkHKx2yAyrm7rZWoONNL2DjPyx+6MSVmPaB5AXaJjQdSk9vXYPiIrsjWfCqaWyF853vuGNkwvx+SbWksuz0OvbLFpx1lD/oqfvlON7ESqHy8j5arK0YsQ48Se/vfAFECEHnpZnQMwEzXIBLcnv6v77PeasDq3ufd7l+rqyF35upm+4ctzDsybnTFzC2tS+bkZLEoxBu37czHvFeAh7TGVLaDL8zvd13KyPHSjztMqWc8YL4AjiTiSicT1lXUF9edrkoMtWFHWVyko/W4QUYyigQoeqQf+oG2yy+5TF2LrBVdmKo9DogSqPOJ+UYoPCGXCBqpjSGSx9gpaMwuQHQ==
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::12)
 by DB8P194MB0662.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:09:33 +0000
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865]) by AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 16:09:33 +0000
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson
	<magnus.karlsson@gmail.com>
CC: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Thread-Topic: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Thread-Index: AQHa9Kum6G+35KCgHUKyhMMxUcg+pbI0gHmAgABiS4CABjyi54AJmpyQ
Date: Mon, 2 Sep 2024 16:09:33 +0000
Message-ID:
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
References:
 <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
In-Reply-To:
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Ojbu4ttpXjMBgFW0RzURLFneCScsCWWh]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P194MB2042:EE_|DB8P194MB0662:EE_
x-ms-office365-filtering-correlation-id: 7d0e76ab-a292-41d9-ec5e-08dccb69a238
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15030799003|15080799006|8060799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 c3d3JUEDsVRusZ7xeK9UCff0M5pbtZNRJsIdJ0HNyDH/ZXMearkj4K8vQbHi16Io9TPki2LUePpT7ifjlyTwKBO48a/Sq2eTWtH20/wT4IEL1LD0VB2NALLK3D9Tvr1HKQ+Pma9W/bWtG9Jis+7EcgdvOx+kT0cg7H90a03XWrztFkkEaFj39KywiEBpk5esQl6VINS5yk1clhUpxT1lHGmt6SeqQQuptoULcia4vG5gOIscDuMEhovuJLwcHXUi26UuhL0tP+KpEpSslHnv+qUbHh3M6C6ZX1eZJ/Uz4lGlNZjR9Yk6wk3rg3iSI1VA74OvYsR7U2JflG1elxyMY9C2NaQeAE+PVd4xSwCEluBPlsgnjsFh17XtDOBMMc1DH5imL+QuHkdp6unK0IfmrFf31trfA67bZqgGdSYR7uuEtd4q3jJz2pDRx+mb4n5prwOroTrUQOkYA0J1Cxem9BgKdZCoKkLZvHfUZo0rEWypNVCj0/YyYKANI017pzGSP7tth2Y8PO3BU/4P0BwpZ4j8GQLcMzlHutFxHAy9/6Xq1HJDWywTQkoGu44Vj8pSEc+8x+RZhm7wR0Z7DWBFnjzo9A/hpZImcGBme++++WBmI1whO0eaK+7OOYIE17lea3duYhNAq+k0TZd/J5yc2/G8Cq0VwVcn9+k9xtBe8XEX7Cjh7nrtB1s1rMqCgEWS/Np3tcCwCpS3XxfvC/S/Og==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?e76yvIXegXmVFpLEaUnvSKXIuV0T1WYfa0uUrJA9ZOgKR7zqMVXIBeS6?=
 =?Windows-1252?Q?9UqO4nheAKKGTQDFHb7Jn3tay2SUNdidTntdJ2ut5b8/l1M6HAT4kgDK?=
 =?Windows-1252?Q?5fA2a+XzXyRnDOXqWaNCOuc/8RgWS8tCkb+6m2HoDshsjya5wrAKfqyx?=
 =?Windows-1252?Q?xEO3Hk6+YkxOB7jzPcDxpZ0XO2mhJib1PtXYIfs/r0SxtVlwuuuaBrbN?=
 =?Windows-1252?Q?4rkEnWPKBiP3BKBjRxbmBefNvyOAJdsFtZqjgez/Uzhx7bK7aQdueHDs?=
 =?Windows-1252?Q?P41X+t9mXZB+pc2LuY2pc1kfGwo9gnCjxiBhCuIeCchUjNUBnpN/GULC?=
 =?Windows-1252?Q?Ea60uNc6qxdz4VS3kZlTCwXnyQxZ9BuYq5LYKa5n6KnKjX8UZPspo5ky?=
 =?Windows-1252?Q?V5ojySh1XNCUFXY/d0CUcvvaUXRC+gF8KACYkgT12rQ3Dv87yj4iKISE?=
 =?Windows-1252?Q?d90VrvKHgncVqxl6JB7NZbbASBICxTOjDcqzShis5W2C0UboljaxuS65?=
 =?Windows-1252?Q?+NXonMX40vySAszpUdDScXdDQ4Gxmsim8YeVm9JuDlzPfmxl2z5zfSTN?=
 =?Windows-1252?Q?OxUrkDI0ocgB1QR1Zl6Mesw6Y5/bvvXNevjAPY32p+bAYo/eF+yDPHxo?=
 =?Windows-1252?Q?8lRCWoLF/sdrtF4Sde+Pq3sK55x/N/1IAEirzggLFf+jMQKs4aNGhZHM?=
 =?Windows-1252?Q?U71f9i8Rw4x344AejhB2pwWuZmMlawcyqrK0iFHEiondZrYJ3Z9UGuze?=
 =?Windows-1252?Q?fs4lJdWhnAPGug8LSwi50rVY5Qk5XWV1Zik9LMT+XsGcnL3c+WNlcn62?=
 =?Windows-1252?Q?lNS58RBDm3FjUtVvRjdBfYXIufexfyraQfTdG9mitauw/brdjW4Gyb4g?=
 =?Windows-1252?Q?6ezcLhDWifFrchDXOS9rQJ2NEdzz4x59l72FktouQ6BNKGfAXiBLWjSg?=
 =?Windows-1252?Q?76qrwUo4lcxisGHv6hoDmrvobkxr+WVcFWMyoOPRHWDqmO4vmuUt1b1i?=
 =?Windows-1252?Q?w45ArXdS5rATe0MotM6+801Y0ZlZu9tHCWtjU87ZYM6mOzV5Pej/mAjB?=
 =?Windows-1252?Q?mhZptBotz2mP0prihVvrTELwIHGuuyrurtjezgezP4gRKW8E8/rwo7lF?=
 =?Windows-1252?Q?HA1PK1LmJPgu/87LMF3vgsddskSIcL2/Ayz0AOv1X8ycaFnUCthvD9zr?=
 =?Windows-1252?Q?f6j96FnODyaDFwTYcW7s/fWVRw5cz2CBb/tLwExMEi93GNEHZenL6Ep1?=
 =?Windows-1252?Q?+V6HDcUt6YG1YGwm3RV0IgTCiume4uaYe4Mpl3BKYpBNAMcMrSrQM0Jb?=
 =?Windows-1252?Q?Upnje+msXi5V9uQw+/470Hc477BZs2Zql/r1nOYSuZDVlz+w?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0e76ab-a292-41d9-ec5e-08dccb69a238
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 16:09:33.2891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P194MB0662

Good evening,=0A=
=0A=
Looks like commit a62c50545b4d is the culprit.=0A=
=0A=
I've produced a production-grade build of kernel 6.1.95 with commit a62c505=
45b4d backed out. Seems I can no longer trigger the fault. I can kill -9 th=
e process while pushing 50Gbps / 14Mpps and the process is just restarted a=
nd resumes like it should.=0A=
=0A=
I'm going to back out the same commit from 6.1.106 for our production build=
s and verify that fixes the issue there too.=0A=
=0A=
Can you advise if this will be reversed in future commits, or if you have a=
n alternate fix in the wings?=0A=
=0A=
Thank you ! :-)=0A=
Alasdair=0A=
=0A=
=0A=
________________________________________=0A=
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>=0A=
Sent: 27 August 2024 14:33=0A=
To: Maciej Fijalkowski; Magnus Karlsson=0A=
Cc: xdp-newbies@vger.kernel.org=0A=
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?=0A=
=0A=
Hi Maciej, Magnus,=0A=
=0A=
Apologies for slow reply =96 bank holiday in the UK yesterday.=0A=
=0A=
Just a quick update =96 it=92s quicker and easier for me to build a release=
d version of code than it is to build a production kernel from a git tree d=
ue to build apparatus.=0A=
=0A=
Based on the suggestion to back out commit a62c50545b4d, I have taken the f=
irst step of identifying that said commit was included in 6.1.95. So, I=92v=
e run both 6.1.95 and 6.1.94 through a build to test both. Some quick and d=
irty testing shows:=0A=
=0A=
  *   I can reproduce the issue on 6.1.95=0A=
  *   I cannot so far reproduce the issue on 6.1.94=0A=
=0A=
I=92ve only tested the latter version 3-4 times so I=92m going to keep thro=
wing dead processes at it in different ways to just to be sure 6.1.94 is no=
t affected. Then, to validate, I will grab the actual git tree at 6.1.95 an=
d manually back out a62c50545b4d and re-test. But, this will take me a litt=
le longer.=0A=
=0A=
Thanks=0A=
Alasdair=0A=
=0A=
=0A=
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>=0A=
Date: Friday, 23 August 2024 at 15:09=0A=
To: Magnus Karlsson <magnus.karlsson@gmail.com>=0A=
Cc: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>, xdp-newbies@vger.k=
ernel.org <xdp-newbies@vger.kernel.org>=0A=
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?=0A=
On Fri, Aug 23, 2024 at 10:17:35AM +0200, Magnus Karlsson wrote:=0A=
> On Thu, 22 Aug 2024 at 18:25, Alasdair McWilliam=0A=
> <alasdair.mcwilliam@outlook.com> wrote:=0A=
> >=0A=
> > Hi,=0A=
> >=0A=
> > I've been testing apps that use XSK+ZC on ICE with newer builds of the =
6.1 LTS kernel in preparation for some production upgrades, and I've starte=
d to notice some instability on newer versions. I can reproduce the issue e=
asily in the lab.=0A=
> >=0A=
> > Config:=0A=
> > - Known good multi-threaded application (i.e. production grade)=0A=
> > - Uses eBPF and AF_XDP with zero copy to act as 'bump in wire' in netwo=
rk=0A=
> > - Xeon's with Intel E810-CQDA2 (firmware: 3.20 0x8000d83e 1.3146.0)=0A=
> > - Effectively a vanilla rebuild of 6.1 using configs from el-repo proje=
ct=0A=
> >=0A=
> > Scenario:=0A=
> > - Noticing hard kernel faults when shutting down application=0A=
> > - Can happen if the process is shut down via systemctl stop=0A=
> > - Can even happen with a simple kill -9 command to the PID=0A=
> > - Appears in builds after 6.1.87=0A=
> >=0A=
> > Tested kernels:=0A=
> > - 6.1.84: process exits smoothly=0A=
> > - 6.1.87: process exits smoothly=0A=
> > - 6.1.97: BUG: unable to handle page fault for address=0A=
> > - 6.1.106: BUG: unable to handle page fault for address=0A=
> >=0A=
> > Kdump log is below [1] from 6.1.106 but does seem to be the same in the=
 earlier version.=0A=
> >=0A=
> > Can anyone advise if this is a known issue?=0A=
> >=0A=
> > I don't have any builds between 6.1.87 and 6.1.97 but I can spend some =
time trying to pinpoint the exact version things start to go wrong in, if i=
t would help anyone better equipped than me to debug!=0A=
>=0A=
> Hi Alasdair,=0A=
>=0A=
> It would be of great help if you could pinpoint the exact version for=0A=
> this breakage. Hopefully we could then find the commit in the ice=0A=
> driver that breaks your app, since there should be just a handful of=0A=
> commits in the ice driver for any stable release.=0A=
=0A=
$ git log --oneline v6.1.87..v6.1.97 drivers/net/ethernet/intel/ice/=0A=
dd37b86999fd ice: Fix VSI list rule with ICE_SW_LKUP_LAST type=0A=
224b69e8751c ice: avoid IRQ collision to fix init failure on ACPI S3 resume=
=0A=
531d85b4fb66 ice: move RDMA init to ice_idc.c=0A=
a62c50545b4d ice: remove af_xdp_zc_qps bitmap=0A=
447a5433bd1e ice: remove null checks before devm_kfree() calls=0A=
a388961be5ed ice: Introduce new parameters in ice_sched_node=0A=
17ccdebe5ac7 ice: fix iteration of TLVs in Preserved Fields Area=0A=
07cbc5512023 ice: fix accounting if a VLAN already exists=0A=
5ef3a27c6142 ice: Interpret .set_channels() input differently=0A=
90cbd4c081bb ice: remove unnecessary duplicate checks for VF VSI ID=0A=
59161a21cae0 ice: pass VSI pointer into ice_vc_isvalid_q_id=0A=
6a6ebec40820 ice: tc: allow zero flags in parsing tc flower=0A=
=0A=
can you revert a62c50545b4d and see if the issue persists?=0A=
=0A=
>=0A=
> > Kind regards=0A=
> > Alasdair=0A=
> >=0A=
> > [1] kdump log=0A=
> >=0A=
> > [  158.666867] BUG: unable to handle page fault for address: ffffa6510e=
5580c0=0A=
> > [  158.666887] #PF: supervisor read access in kernel mode=0A=
> > [  158.666896] #PF: error_code(0x0000) - not-present page=0A=
> > [  158.666903] PGD 100000067 P4D 100000067 PUD 106dc4067 PMD 0=0A=
> > [  158.666914] Oops: 0000 [#1] PREEMPT SMP PTI=0A=
> > [  158.666922] CPU: 7 PID: 1808 Comm: tlndd.bin Kdump: loaded Tainted: =
G            E      6.1.106-1.X.el9.x86_64 #1=0A=
> > [  158.666940] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS 3=
.2 12/16/2019=0A=
> > [  158.666950] RIP: 0010:xp_free+0x11/0x80=0A=
> > [  158.666962] Code: 8b 04 d0 48 83 e0 fe 48 01 f0 c3 cc cc cc cc 66 2e=
 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d 6f 58 53=
 <48> 8b 47 58 48 39 c5 74 0d 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc=0A=
> > [  158.666985] RSP: 0018:ffffa65089e8b760 EFLAGS: 00010202=0A=
> > [  158.666993] RAX: ffff8fcf077c0000 RBX: 0000000000000001 RCX: 0000000=
000000000=0A=
> > [  158.667003] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa65=
10e558068=0A=
> > [  158.667012] RBP: ffffa6510e5580c0 R08: fffff8c50415a108 R09: ffff8fc=
7cac60000=0A=
> > [  158.667022] R10: 0000000000000219 R11: ffffffffffffffff R12: 0000000=
000000fff=0A=
> > [  158.667031] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8fc=
7c139d340=0A=
> > [  158.667040] FS:  00007f8504996880(0000) GS:ffff8fcedfdc0000(0000) kn=
lGS:0000000000000000=0A=
> > [  158.667050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
> > [  158.667058] CR2: ffffa6510e5580c0 CR3: 00000001448e2002 CR4: 0000000=
0001706e0=0A=
> > [  158.667068] Call Trace:=0A=
> > [  158.667075]  <TASK>=0A=
> > [  158.667082]  ? show_trace_log_lvl+0x1c4/0x2df=0A=
> > [  158.667094]  ? show_trace_log_lvl+0x1c4/0x2df=0A=
> > [  158.667103]  ? ice_xsk_clean_rx_ring+0x39/0x60 [ice]=0A=
> > [  158.667157]  ? __die_body.cold+0x8/0xd=0A=
> > [  158.667166]  ? page_fault_oops+0xac/0x150=0A=
> > [  158.667176]  ? fixup_exception+0x22/0x340=0A=
> > [  158.667185]  ? exc_page_fault+0xb2/0x150=0A=
> > [  158.667195]  ? asm_exc_page_fault+0x22/0x30=0A=
> > [  158.667206]  ? xp_free+0x11/0x80=0A=
> > [  158.667215]  ice_xsk_clean_rx_ring+0x39/0x60 [ice]=0A=
> > [  158.667250]  ice_clean_rx_ring+0x157/0x180 [ice]=0A=
> > [  158.667284]  ice_down+0x172/0x2b0 [ice]=0A=
> > [  158.667311]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]=0A=
> > [  158.667337]  ice_xdp_setup_prog+0xe3/0x3b0 [ice]=0A=
> > [  158.667364]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]=0A=
> > [  158.667391]  dev_xdp_install+0xc7/0x100=0A=
> > [  158.667402]  dev_xdp_attach+0x1e0/0x560=0A=
> > [  158.667412]  do_setlink+0x7a8/0xc10=0A=
> > [  158.667422]  ? __nla_validate_parse+0x12b/0x1b0=0A=
> > [  158.667436]  __rtnl_newlink+0x540/0x650=0A=
> > [  158.667446]  rtnl_newlink+0x44/0x70=0A=
> > [  158.667454]  rtnetlink_rcv_msg+0x15c/0x3d0=0A=
> > [  158.667477]  ? rtnl_calcit.isra.0+0x140/0x140=0A=
> > [  158.667485]  netlink_rcv_skb+0x51/0x100=0A=
> > [  158.667727]  netlink_unicast+0x246/0x360=0A=
> > [  158.667953]  netlink_sendmsg+0x24e/0x4b0=0A=
> > [  158.668173]  __sock_sendmsg+0x62/0x70=0A=
> > [  158.668389]  ____sys_sendmsg+0x247/0x2d0=0A=
> > [  158.668602]  ? copy_msghdr_from_user+0x6d/0xa0=0A=
> > [  158.668815]  ___sys_sendmsg+0x88/0xd0=0A=
> > [  158.669028]  ? __sk_destruct+0x156/0x230=0A=
> > [  158.669234]  ? kmem_cache_free+0x134/0x300=0A=
> > [  158.669437]  ? rcu_nocb_try_bypass+0x4a/0x440=0A=
> > [  158.669634]  ? __sk_destruct+0x156/0x230=0A=
> > [  158.669825]  ? _raw_spin_unlock_irqrestore+0x23/0x40=0A=
> > [  158.670010]  ? mod_objcg_state+0xc9/0x2f0=0A=
> > [  158.670186]  ? refill_obj_stock+0xae/0x160=0A=
> > [  158.670359]  ? rseq_get_rseq_cs.isra.0+0x16/0x220=0A=
> > [  158.670529]  ? rcu_nocb_try_bypass+0x4a/0x440=0A=
> > [  158.670696]  ? rseq_ip_fixup+0x72/0x1e0=0A=
> > [  158.670860]  __sys_sendmsg+0x59/0xa0=0A=
> > [  158.671021]  ? syscall_trace_enter.constprop.0+0x11e/0x190=0A=
> > [  158.671185]  do_syscall_64+0x35/0x80=0A=
> > [  158.671345]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8=0A=
> > [  158.671503] RIP: 0033:0x7f850510f917=0A=
> > [  158.671658] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f=
 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10=0A=
> > [  158.671993] RSP: 002b:00007ffcc805f238 EFLAGS: 00000246 ORIG_RAX: 00=
0000000000002e=0A=
> > [  158.672171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8=
50510f917=0A=
> > [  158.672352] RDX: 0000000000000000 RSI: 000000000198e9e8 RDI: 0000000=
000000009=0A=
> > [  158.672534] RBP: 0000000001933c00 R08: 0000000001935980 R09: 0000000=
000460e48=0A=
> > [  158.672716] R10: 0000000000000011 R11: 0000000000000246 R12: 0000000=
001933c30=0A=
> > [  158.672899] R13: 0000000000515fd8 R14: 000000000198e9d0 R15: 0000000=
000513690=0A=
> > [  158.673086]  </TASK>=0A=
> > [  158.673269] Modules linked in: bonding(E) tls(E) nft_fib_inet(E) nft=
_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E=
) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_c=
onntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_tabl=
es(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) ipmi_ssif(E) intel_rapl_msr(=
E) intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E) intel_powerclamp=
(E) coretemp(E) kvm_intel(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_suppo=
rt(E) kvm(E) irqbypass(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E) dr=
m_vram_helper(E) drm_ttm_helper(E) ttm(E) pcspkr(E) mei_me(E) drm_kms_helpe=
r(E) i2c_i801(E) lpc_ich(E) mei(E) i2c_smbus(E) mxm_wmi(E) ioatdma(E) acpi_=
ipmi(E) ipmi_si(E) ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) acpi_powe=
r_meter(E) joydev(E) drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t1=
0_pi(E) sg(E) ahci(E) crct10dif_pclmul(E) crc32_pclmul(E) libahci(E) crc32c=
_intel(E) ice(E)=0A=
> > [  158.673314]  polyval_clmulni(E) polyval_generic(E) igb(E) libata(E) =
ghash_clmulni_intel(E) i2c_algo_bit(E) dca(E) wmi(E) dm_mirror(E) dm_region=
_hash(E) dm_log(E) dm_mod(E)=0A=
> > [  158.675578] CR2: ffffa6510e5580c0=0A=

