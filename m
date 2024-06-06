Return-Path: <xdp-newbies+bounces-97-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E45558FF31B
	for <lists+xdp-newbies@lfdr.de>; Thu,  6 Jun 2024 18:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02E17B2E6EB
	for <lists+xdp-newbies@lfdr.de>; Thu,  6 Jun 2024 16:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4233198E71;
	Thu,  6 Jun 2024 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Dl2acUzj"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04olkn2077.outbound.protection.outlook.com [40.92.74.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFBF198A24
	for <xdp-newbies@vger.kernel.org>; Thu,  6 Jun 2024 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.74.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717691949; cv=fail; b=T7SAdwjMWMMn4qSquiuxQm2p6lIvBLdjNwB2fMgXeQN2Iv0e66SDRnvRHT7Kv8ZBp+nzHFe3u/eMQKe9AFKP7dxbbYxeExjP9NcGbXP1bOLKQhxRZLRKymyqksrGjHnX7IxqwVzyGiQPcTtj9/x4rPtA044JmAJm2TQ+L4B3uBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717691949; c=relaxed/simple;
	bh=E5Rnqe6TG2ukPjYb4HGvTTXljoZp5RelqJHJD9SFZA8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iVYuXUO2tHqP9tlpt+QQHkNxtdkVuWmbbB69yGfB7QcQEAMtzGHbesQuUxz8E4yfOyFqtzHqp0VrX1GOvo1EgjsThBup2y6+9qODWEnBXhMJbBzkPVEsXa9XEo73jWbnANIZTCGawF5dbhHoTtsNLRpH7k2qhFokmnp7W9wpo0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Dl2acUzj; arc=fail smtp.client-ip=40.92.74.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqA6W8c5ig7HMC73f4rYTa9UT7tYWyE0ohuUXFdzCyBB5hhecXV0ogHBpACyxlx3HyVT+ltuwKcmmpsSzsrFxw6TfL6iNd0WgCtXhEOWsaHrZBwMKQjtjFM+iMMDUNC7qA45DvvRwSqROM6KMuIzrmUTVIreK5c9QhMhUV7KOp+EMB3N9AdG7sJ3bnASN/iJjgAQ6iCJ8uPU13bw8UKD8bmTP+xb6cQ7pQwfJnNEYppnIjeQi2B05WwJorMZhj2nMLXrh7y/DllEPGKA+oMarLJwlHNEIsebcJla/uaGLHXaFlbn0Kpw+Y/rLDf9tobswjn5HgfvbdoO3FwcPRdPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5Rnqe6TG2ukPjYb4HGvTTXljoZp5RelqJHJD9SFZA8=;
 b=PMokbQuVz8ZgONVYu0d4fhEbE6gyMHNIAJaDak17K49ULUAtK1KHLnKr7mT0FOe9rIuvBt9HOCzJDq0duF8/JD0T4EkcMWBzKpAuRqDfdrOY/0VJIE7FL05+EIhRFtKu18ubCD7uUIbuwNyIiPdVYSeC3s0dD/fusEKrZuCVL7DnW0HEO5rh4exe4a1hBUjUkqJkVMqV3L+AIeHcc3bs2rYsHW13/0KRNFg5Yhgw2022P3iW1eMPZs+g4SvlJ8tZRkCGvwM0bRiAlUcvrD5TBdAhNmvF/IcXeqmfeEfIg1qOF6QKrLTtBif3Yq5s5PLS0fKz15QZm9F06rNcuDRXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5Rnqe6TG2ukPjYb4HGvTTXljoZp5RelqJHJD9SFZA8=;
 b=Dl2acUzjY5l+zZKyRXxzxi+bKtXgd+IkdaQ27IYq3xiZvUl2rzZDFTpmwIYBHKKsRclGfzr4qNem5rBobg23w0ruhrHu7vVlgU2TFfL/+cLLutZJ5BO6yINq1Sh1Wlv6yMKmfemJe3G8YFekdR52iEDTMzfBHElIXkY0J4o4yaqj+pJl7JU7+JGfj+Q3eZzKhy5wZu6k6u4p6UF3GoaM8crOW5gKzjzoW8YDc+xL3tpR19S/cgNhT7TwmmGq4acwb3xZBpoRxnGJF0H0hdmCGVRPtgT1vQGOXsL/EXTYZsoOc4Fhajnh/7byLmOukuNDhf/34bTN1L+knTQSDNFJjg==
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::12)
 by PA1P194MB2281.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:449::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 16:39:05 +0000
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865]) by AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 16:39:05 +0000
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To: Xdp <xdp-newbies@vger.kernel.org>
Subject: XDP - bpf_program__attach_xdp() missing options?
Thread-Topic: XDP - bpf_program__attach_xdp() missing options?
Thread-Index: AQHauC2eNfRdQHuZ1UqfFNZOhW/JFw==
Date: Thu, 6 Jun 2024 16:39:05 +0000
Message-ID:
 <AS8P194MB2042B7542EBB198002E31F7386FA2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [IKEwk7v6OvYw9uCX8ULmTP/gOTbxpIAI]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P194MB2042:EE_|PA1P194MB2281:EE_
x-ms-office365-filtering-correlation-id: 2f99e3f6-c187-499f-29cb-08dc86472df9
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199019|102099023|3412199016|440099019;
x-microsoft-antispam-message-info:
 f3Gd3TXiNbY4IKhV6AgFY8enE/DxbvYM3ygBzqBWzSIHYJrxtVnSTqoEyMqjSa4Yv5inHOa3rp2+TVADol1L7+GX0jXQkjjdT4xPPX74O97J4Sm1EEWpzPeg9XwY6cxyuiKmRQdJaZa3DF36LMoXegz40dNMosrDyPg7PuCaNRLVCiczbXhiiF41Vpe1/KGxZWlQyL41X0eEPZTrWS6Xp2noK6M1xv9QT/WE4QrGecmubePGtgyRUq/pP4JOB/Zlc1fTR9LasWohvGr1JYXkrypRinjzmZV4fPg3TtsOjvkyholIDm7rYq5Txc3IGNBAE0suwRTVssRxoew94SEdXyWkz7IdGzIXdTYSWP/KhTy2tt9C7Sg1Si/4vVUomE8cXuB3OYwoqJgfi9DDv5YogtcU1VrY2xdOSQN9I6qQTKoFC28BPchgjMIU2vmslRFgGfZV51T/gnawdg2n18B8NdDlGo39vfHDRlM7gNr9ue2K8A7wmMXOBuCTzpsW2KWRr6f2Sp2/G1TtyqA9g1c2QSTRD/5gnEKZauGuwEWkbp8VRChTNAnXb5K12LMRdiM0
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QW2OPg7ha2RpENZ+UkU1DL7ZtYnvH/qUtLx5X2IBq2z7vC954VNNoelDO9?=
 =?iso-8859-1?Q?nKWTuq6PZsrKXKYVhIKCT6cRpVIutB7X6VxRedxN37iGhAN4aD1SGr3CJT?=
 =?iso-8859-1?Q?WEfE363/uW2RnsUWwVrcKLGnmbeNyOMuIN7vXR5S9EAVq/i9ZY9nEdTLyh?=
 =?iso-8859-1?Q?ggMxVNDjTK3QCRIBkVTaS9XReavRlGKcTizn9qS2ZHn8IJONwMGuQjz0zo?=
 =?iso-8859-1?Q?RWRdRJrL2n4kZfgXa2yqY4UkikvGIqtuPqSI+5WCnbNMj9Qjer83Q+H7ug?=
 =?iso-8859-1?Q?Fif1PX08so6USW2AHvGZHYNX1ioDmBvCRCedYXAPe71Wi1B8ifybO4e2/i?=
 =?iso-8859-1?Q?vKqUvmbI5jDZ4MiJNVWQW2tf691HKKP6DedAMbJKEWKGXpiOPIwFKzmeGp?=
 =?iso-8859-1?Q?w+D7zrP+s13SuxKM8gNoL2q4ogjDX5WUkiaLkxszbtbsLVz2EUk/42wrH/?=
 =?iso-8859-1?Q?NHTLwzh5iNwLFjDSKSj3NtUVDYgH3F34JpGVOkn27nP+uKc95j4KlVrvTc?=
 =?iso-8859-1?Q?fVGYWL27TqVLXYA+7ph99VWVSKZrQZZAtpgSmP2cphMY8ccFOnZtPJjAWJ?=
 =?iso-8859-1?Q?OyUI9px/BHlJVHXPMyG+83UJ/mOHD7KfAfY7z2APrgw02pqL8IwWEhDIeJ?=
 =?iso-8859-1?Q?QfIYkyKtTfiVoRMc41WmXHIIvfRizt329SE6Mzj4eZYWaDY6ZsmdXBbatr?=
 =?iso-8859-1?Q?YgfjeS7pWcu5x5KbBvOLy3WFPAVIIcOqs44Q6jzokIFY93/p/0/oI3Jtja?=
 =?iso-8859-1?Q?Ea1OqYnbfcR9D0ERCMU63AS9joZA7tVfMX0gyhYY7B8/uL8UFOggLAIU5F?=
 =?iso-8859-1?Q?MOPyuBRrzs3U02M0LDGqjYkhN/3hLF7V57rt4NXqPhhGUHmMXF3WsGvkso?=
 =?iso-8859-1?Q?9xZF4fzjLoh7t9Z21u/LVbbVqaorMcp7KvD5odJWmUegZVQlRdMbFfLaZe?=
 =?iso-8859-1?Q?RlamllHxpbu5+V+ywSrzfsZy4JUl+9gWkFO2ty0c3XMeiXmrohHy/DG4OZ?=
 =?iso-8859-1?Q?8ofG188EiBg3w5eVGsDyx5DcY0SiSBeylcSicbXngOyMLhKVp7lu5T351f?=
 =?iso-8859-1?Q?LCgybV0gvyFk08puNsvE/UN86jwV4faLOcmEM9e8rNPQE/4ih9osU0ugoa?=
 =?iso-8859-1?Q?dwr2joJqFbx3WrZznNbhkMzIjLoKWarDFiw9wXGB/tKylbaKOkPVSTGW2D?=
 =?iso-8859-1?Q?726fwq1gIcZzUq7ZMTnnv5BVvWdxhpSgeM2To5clJBU4TqaliQslaGm86g?=
 =?iso-8859-1?Q?eptK+CRvjpq/XyFhCEU5f0Sn4D9YqScfTliLEkHdF/wK/twAhXoBukRUnh?=
 =?iso-8859-1?Q?7309?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f99e3f6-c187-499f-29cb-08dc86472df9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 16:39:05.1433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P194MB2281

Hello,=0A=
=0A=
I am in the process of refactoring/refreshing an internal system that heavi=
ly uses libbpf/libxdp - and taking the time to refresh API usage.=0A=
=0A=
Previously we've used the bpf_xdp_attach() API to attach an XDP program to =
a device, and in doing so we can specify XDP mode flags etc.=0A=
=0A=
I've noticed a general shift towards use of bpf_link infrastructure, and be=
hold there is an API to link XDP programs to a NIC: bpf_program__attach_xdp=
(), which looks to just proxy to the internal bpf_program_attach_fd() routi=
ne.=0A=
=0A=
While the internal implementation looks to support passing of link options =
via flags, the higher level XDP API simply passes NULL into the opts parame=
ter, so the link creation flags will default to zero. But then, when chasin=
g through the syscall into the kernel, it does look like link mode flags ar=
e supported within the kernel and it would do the right thing.=0A=
=0A=
I'm wondering if the lack of flags/options in bpf_program__attach_xdp() API=
 is just an oversight, or if I'm missing something - would someone be able =
to confirm my thoughts?=0A=
=0A=
If so I'll stick to bpf_xdp_attach() for now!=0A=
=0A=
Thanks=0A=
Alasdair=

