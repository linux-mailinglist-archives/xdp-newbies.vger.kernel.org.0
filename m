Return-Path: <xdp-newbies+bounces-130-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9295BBDA
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Aug 2024 18:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687201C230E3
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Aug 2024 16:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC44D1CCEF0;
	Thu, 22 Aug 2024 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="n5unerfq"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2060.outbound.protection.outlook.com [40.92.91.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB01CCEFB
	for <xdp-newbies@vger.kernel.org>; Thu, 22 Aug 2024 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343924; cv=fail; b=grHsdvFgzaPlKBZN/x4DE3p+AU+5resrpGyZv5g8thuyMPGvmZybg9LGcMR439gezr6TGgVTQ4ezSGax8ZemEt1jnks4jU4Qzk2a5Vq0wpKp9vBTgF6ij7lRz90xzNqjFT1S1fy37BSFDSJXp6p/6jNDGV7D2//laoeCXvFxq/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343924; c=relaxed/simple;
	bh=8BurR+SAO4ov1Tn9omxJibYf/se8tvJnjj1JqV0k878=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o4iPjwyibU7b/jJdgtXbmQj5oAimZwZ4kazJHzR3swmSL4C+nJpLgXWtP+h3q4C4CLwi1AZd8DWGyto9p49m1qLxeRsNbzrXDGwyHwpEcmIWMExLPNjftAhLUth+sz77tXd1PB0nll7xSPNigQVRkHJ8Z1yxj86n/7Uw43AarGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=n5unerfq; arc=fail smtp.client-ip=40.92.91.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXN5llaMgNgLhn7qSvjTjjlJucRndu/4ErekFmzDfQJqzbmuHWvyyWJmEuh2V2KjpVptZmALT1QAxb7C5AgxNNZB1eecgQhwcoakCz4PeQRgq7j3oe4PRMtThMSPi5KW7qPq5lRywtDq7Sk0oFLIC8I8h2G4zmQNx7N7V5sO1ZRRoCwBUJO8Nkx1A648FVYA+tfafYpNZssftA2eaWDr3UYWhjtf6WaZbAjEdkTdQZ4DDS1Vt7Ph1kriVynM78TT9Jl3rRHT+NaCkAX9Cy0k6FfpUmKWcM3ihbhgwXnabBYn/e6n58Cc5e0+kVrEx2aNArLJuIxWeq2Bydh+gSp3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLj3NqXe+eCL8GydGBk83zf4dd3amDd6WDkYx0r/2Co=;
 b=cQav3bxSFPs3FDXlhhIWMNcwIfyixmT4T7d02WeyvApCHwZre/ub2dDhP1q1EGu7Tmrt7q5ZkBml/om26dy3UrcaPFPYnF+B0vEGdLfkDpZBiz3wwcNNt2bjc3WEnSU7qrCCoeVTkXXzndvXWe7hdydZ9lO5lb7YZaHODkJ1FO2ddMwwmDnwKBeyvUA68/yTwE69Hu025cITtu77p04N+Cm62umsS4Fx1OSDyzFbyJ3LHVCxL5eI2UxAV4MrPrWvU+tKQCrNQNLqCyDZjrlbfZCHKpb6zh+xLZf4j540QqESSXQv6PDeg/oVIdJh0yaYBeRlBEECUk2+G4VBXQV0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLj3NqXe+eCL8GydGBk83zf4dd3amDd6WDkYx0r/2Co=;
 b=n5unerfqF01SwwhcK/NrhGrcF6pdjk5641Tp9eSaGgZ1GIMM7F25y1yNTe24NZKJcAUEBMC242Ty/HvIEmkKHIDnFzXpu0xdViyMF0tRQvfIImcFk2V2ROkO36Jo2j+wF0F6iILKWdfnOvXevisicoJzRfkm47XwVboBYVW886m/JMeNLyXeNTLyy6icqw9eBfmh/Cpg1Tg+4Q0STufhMzD1d+AoXz2v2izyDVHSVeRThpcH5UhCTOsJaR/2tORkVPjCv6+to5skU9bBlagZHSXSxRRhMDctkcg9UkHZTU8OtzlTLG8YJBufQHLqy6bAAx/l2cUlwQ0FvaZJUWKdZw==
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::12)
 by DB9P194MB1481.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:294::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 16:25:20 +0000
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865]) by AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 16:25:20 +0000
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Thread-Topic: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Thread-Index: AQHa9Kum6G+35KCgHUKyhMMxUcg+pQ==
Date: Thu, 22 Aug 2024 16:25:19 +0000
Message-ID:
 <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [mdJkChsg9P3sxZUr0sw2fvMKdHsM1cay]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P194MB2042:EE_|DB9P194MB1481:EE_
x-ms-office365-filtering-correlation-id: d0766787-be3c-45c2-057d-08dcc2c703ee
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799003|19110799003|15030799003|8060799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 ABUZ088X4ZDwP0++X3aGX07KJP4P4+KrI9sJ+8eeTyBCymqc2mr0I7WhiBhi6VWrFqhlTVNrdvMEwmiicjNu5OeBtncK76J1iOMlwSn9qXqeuJquxYlCLBdb8scpUwLuYHteIN1zDvteY/sTg2fCgepjAmcuHTqQg+iqtrvKo1esvklxBeW4D1FQOGq2gnb2k+RUvw7+YDIsxOPpG6+84BJLlrISkQsdD+MqkEaAnqLEeq6WUlSM0Nm5d7EH5yBU1fmy9Nm0lNQvsEp43wbafseX9zEBxGl7RDunHMz+RhzmzwdOnfQuI4ZxIKD1EaMJwUq+sfZtO8IMr1PjGzDNQHbaTUD2Q/Wi5GnEPDyzMbupIraZOk+zg7WAIuSPrnLDU9OQvVscMasV4PKRimhwWdliB43cwc8zBtHvm2xLs3AuGwOJsKiYsOcVsZLP2BL1jKu9SXgfGEsmXGrHmtJtjfSjTZOddvzuo/QgajqKeragdF3BDXXx/dnqFjsK0UJTdxGPQsBfV0EmhCVtqo+aGy8r353ci33sPM7bDk0CBfiQn8eDROQFH1QQxM/WBlVAh+rHxuUl/rC5yhTdHQ7cDq/P998rGmlWdyP5/3TR1ChNS2T6KJr99SJWNJ+10et3hGPFqnneFFUqzOuVE3oy5qI/qXnhvGZrBmhs7mMP5aBE5lvlaT042Y1CcVbL6Oud2HJeL7R29/NxGGqkLs35Gg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wLUlSJk4pTjWknBwk/ELV2laFISsuooRLy36OLq9CBWc4QWFxj2F9BfoXq?=
 =?iso-8859-1?Q?jFwvnw5GPvqOalJmPwH3cx3AWrsaK1EU4uKXIGrqbMMjn9c+rKVtsYNnMZ?=
 =?iso-8859-1?Q?z2EjMN7X25P8O1iTaSMdzchVwoQE53KslYK3oiBrqt9kGiWb3KdTbrT0Im?=
 =?iso-8859-1?Q?AezpIDlVUV0rC/9KBVPSwVdB3PRsX3yVDFPqRMncEU/gvpNTDmrS6XEWH6?=
 =?iso-8859-1?Q?q07rFvasQ9XAf8qnECBS5kCqGl/s32ZXLangmHN43a/EOk2y7GzDfLHjrY?=
 =?iso-8859-1?Q?0h4E0wSnnMqsZhuplJDpo17PnT84A0Q26310S01rGb8PsI210adC9haMvJ?=
 =?iso-8859-1?Q?Z8EaSYUvJ1La5F4/LlVFVg/V/SlVYgsJKf321r1aNy01KqEDC8NHFsg7qx?=
 =?iso-8859-1?Q?gjXzKa2wyrBVnDcx5TXiLtZgreWq8LQUElOhbiM66+htY9zgUOFmcjXloh?=
 =?iso-8859-1?Q?WMVkMMOTq8E+IWaBMbGo0wDfPv4tAqpm1goTFlvP76UIMNTUhVuyGYQqQe?=
 =?iso-8859-1?Q?mpzUdidS9A/W45FUnhZVODVePnjZdQSdFdjf5ppJtyhsOW6KDMIq1ADOOf?=
 =?iso-8859-1?Q?T6qRj7bIJc5nALIfQJiLv3gB9KekoH26QMUtrCZpmQB4H2/To/nlSjWW/v?=
 =?iso-8859-1?Q?CqyRf6JVumRHAEKMANLlCWOhuaTrfdq9lMx7jOwUF9lMR1f8JNjgAnUUQA?=
 =?iso-8859-1?Q?xWtmjVJKxEJPIZp7mHqX8kw/7aslu5ojFG5QrVzHaJhjRnyqK1yndrNcbT?=
 =?iso-8859-1?Q?4P3aoiPTsCo/8thvsSsnepzYOs0v/Hh3UQyJG3cLDS7pA2dqzH1Sq4agEb?=
 =?iso-8859-1?Q?2lJ+GSo+sDPdd7oDI0icr5v0t6bCSF3LVRluuw9U0PFGzMXQsNokwfYvQ0?=
 =?iso-8859-1?Q?2aXlL3X3F3JOhTavfOIHFyvx/aiwzqossEL0twFt0PVjdNnskKPWmnN8q8?=
 =?iso-8859-1?Q?LtEAXQuOsFXQvjAxoNZC+bhkcSCtQABpTHvU61QKlcJKDHTbV7magkhY1O?=
 =?iso-8859-1?Q?YMfWvAM1gSTt/i5DBosYpIwqU1JYbXPl2uoFNa/F96S4R0MPHTI3bShxsi?=
 =?iso-8859-1?Q?90/h0Kj4jgS5tgeAZA584gxiLw2qCk6bntKIkry6cQ2pjAMUrIWy5IJT/b?=
 =?iso-8859-1?Q?mUjMWoppFkeCAt0oBGwIEXZ8gbH9A3maddRrjzRwTbZJiSaVKaeSSHYpHV?=
 =?iso-8859-1?Q?N9EP7Aute2SxdG4e+HB02ofPB4PiZJnzdUbu1mCd5mO7NXICn5fN8in+Ew?=
 =?iso-8859-1?Q?HUvUnb7nU995tuGZXFRMA3IusnoG8MLLOc4kHzDvYkXwiVqx2cjNnQbwdZ?=
 =?iso-8859-1?Q?Fl11?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0766787-be3c-45c2-057d-08dcc2c703ee
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 16:25:19.9761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P194MB1481

Hi,=0A=
=0A=
I've been testing apps that use XSK+ZC on ICE with newer builds of the 6.1 =
LTS kernel in preparation for some production upgrades, and I've started to=
 notice some instability on newer versions. I can reproduce the issue easil=
y in the lab.=0A=
=0A=
Config:=0A=
- Known good multi-threaded application (i.e. production grade)=0A=
- Uses eBPF and AF_XDP with zero copy to act as 'bump in wire' in network=
=0A=
- Xeon's with Intel E810-CQDA2 (firmware: 3.20 0x8000d83e 1.3146.0)=0A=
- Effectively a vanilla rebuild of 6.1 using configs from el-repo project=
=0A=
=0A=
Scenario:=0A=
- Noticing hard kernel faults when shutting down application=0A=
- Can happen if the process is shut down via systemctl stop=0A=
- Can even happen with a simple kill -9 command to the PID=0A=
- Appears in builds after 6.1.87=0A=
=0A=
Tested kernels:=0A=
- 6.1.84: process exits smoothly=0A=
- 6.1.87: process exits smoothly=0A=
- 6.1.97: BUG: unable to handle page fault for address=0A=
- 6.1.106: BUG: unable to handle page fault for address=0A=
=0A=
Kdump log is below [1] from 6.1.106 but does seem to be the same in the ear=
lier version.=0A=
=0A=
Can anyone advise if this is a known issue?=0A=
=0A=
I don't have any builds between 6.1.87 and 6.1.97 but I can spend some time=
 trying to pinpoint the exact version things start to go wrong in, if it wo=
uld help anyone better equipped than me to debug!=0A=
=0A=
Kind regards=0A=
Alasdair=0A=
=0A=
[1] kdump log=0A=
=0A=
[  158.666867] BUG: unable to handle page fault for address: ffffa6510e5580=
c0=0A=
[  158.666887] #PF: supervisor read access in kernel mode=0A=
[  158.666896] #PF: error_code(0x0000) - not-present page=0A=
[  158.666903] PGD 100000067 P4D 100000067 PUD 106dc4067 PMD 0=0A=
[  158.666914] Oops: 0000 [#1] PREEMPT SMP PTI=0A=
[  158.666922] CPU: 7 PID: 1808 Comm: tlndd.bin Kdump: loaded Tainted: G   =
         E      6.1.106-1.X.el9.x86_64 #1=0A=
[  158.666940] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS 3.2 1=
2/16/2019=0A=
[  158.666950] RIP: 0010:xp_free+0x11/0x80=0A=
[  158.666962] Code: 8b 04 d0 48 83 e0 fe 48 01 f0 c3 cc cc cc cc 66 2e 0f =
1f 84 00 00 00 00 00 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d 6f 58 53 <48=
> 8b 47 58 48 39 c5 74 0d 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc=0A=
[  158.666985] RSP: 0018:ffffa65089e8b760 EFLAGS: 00010202=0A=
[  158.666993] RAX: ffff8fcf077c0000 RBX: 0000000000000001 RCX: 00000000000=
00000=0A=
[  158.667003] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa6510e5=
58068=0A=
[  158.667012] RBP: ffffa6510e5580c0 R08: fffff8c50415a108 R09: ffff8fc7cac=
60000=0A=
[  158.667022] R10: 0000000000000219 R11: ffffffffffffffff R12: 00000000000=
00fff=0A=
[  158.667031] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8fc7c13=
9d340=0A=
[  158.667040] FS:  00007f8504996880(0000) GS:ffff8fcedfdc0000(0000) knlGS:=
0000000000000000=0A=
[  158.667050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  158.667058] CR2: ffffa6510e5580c0 CR3: 00000001448e2002 CR4: 00000000001=
706e0=0A=
[  158.667068] Call Trace:=0A=
[  158.667075]  <TASK>=0A=
[  158.667082]  ? show_trace_log_lvl+0x1c4/0x2df=0A=
[  158.667094]  ? show_trace_log_lvl+0x1c4/0x2df=0A=
[  158.667103]  ? ice_xsk_clean_rx_ring+0x39/0x60 [ice]=0A=
[  158.667157]  ? __die_body.cold+0x8/0xd=0A=
[  158.667166]  ? page_fault_oops+0xac/0x150=0A=
[  158.667176]  ? fixup_exception+0x22/0x340=0A=
[  158.667185]  ? exc_page_fault+0xb2/0x150=0A=
[  158.667195]  ? asm_exc_page_fault+0x22/0x30=0A=
[  158.667206]  ? xp_free+0x11/0x80=0A=
[  158.667215]  ice_xsk_clean_rx_ring+0x39/0x60 [ice]=0A=
[  158.667250]  ice_clean_rx_ring+0x157/0x180 [ice]=0A=
[  158.667284]  ice_down+0x172/0x2b0 [ice]=0A=
[  158.667311]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]=0A=
[  158.667337]  ice_xdp_setup_prog+0xe3/0x3b0 [ice]=0A=
[  158.667364]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]=0A=
[  158.667391]  dev_xdp_install+0xc7/0x100=0A=
[  158.667402]  dev_xdp_attach+0x1e0/0x560=0A=
[  158.667412]  do_setlink+0x7a8/0xc10=0A=
[  158.667422]  ? __nla_validate_parse+0x12b/0x1b0=0A=
[  158.667436]  __rtnl_newlink+0x540/0x650=0A=
[  158.667446]  rtnl_newlink+0x44/0x70=0A=
[  158.667454]  rtnetlink_rcv_msg+0x15c/0x3d0=0A=
[  158.667477]  ? rtnl_calcit.isra.0+0x140/0x140=0A=
[  158.667485]  netlink_rcv_skb+0x51/0x100=0A=
[  158.667727]  netlink_unicast+0x246/0x360=0A=
[  158.667953]  netlink_sendmsg+0x24e/0x4b0=0A=
[  158.668173]  __sock_sendmsg+0x62/0x70=0A=
[  158.668389]  ____sys_sendmsg+0x247/0x2d0=0A=
[  158.668602]  ? copy_msghdr_from_user+0x6d/0xa0=0A=
[  158.668815]  ___sys_sendmsg+0x88/0xd0=0A=
[  158.669028]  ? __sk_destruct+0x156/0x230=0A=
[  158.669234]  ? kmem_cache_free+0x134/0x300=0A=
[  158.669437]  ? rcu_nocb_try_bypass+0x4a/0x440=0A=
[  158.669634]  ? __sk_destruct+0x156/0x230=0A=
[  158.669825]  ? _raw_spin_unlock_irqrestore+0x23/0x40=0A=
[  158.670010]  ? mod_objcg_state+0xc9/0x2f0=0A=
[  158.670186]  ? refill_obj_stock+0xae/0x160=0A=
[  158.670359]  ? rseq_get_rseq_cs.isra.0+0x16/0x220=0A=
[  158.670529]  ? rcu_nocb_try_bypass+0x4a/0x440=0A=
[  158.670696]  ? rseq_ip_fixup+0x72/0x1e0=0A=
[  158.670860]  __sys_sendmsg+0x59/0xa0=0A=
[  158.671021]  ? syscall_trace_enter.constprop.0+0x11e/0x190=0A=
[  158.671185]  do_syscall_64+0x35/0x80=0A=
[  158.671345]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8=0A=
[  158.671503] RIP: 0033:0x7f850510f917=0A=
[  158.671658] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f 1f =
00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10=0A=
[  158.671993] RSP: 002b:00007ffcc805f238 EFLAGS: 00000246 ORIG_RAX: 000000=
000000002e=0A=
[  158.672171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f85051=
0f917=0A=
[  158.672352] RDX: 0000000000000000 RSI: 000000000198e9e8 RDI: 00000000000=
00009=0A=
[  158.672534] RBP: 0000000001933c00 R08: 0000000001935980 R09: 00000000004=
60e48=0A=
[  158.672716] R10: 0000000000000011 R11: 0000000000000246 R12: 00000000019=
33c30=0A=
[  158.672899] R13: 0000000000515fd8 R14: 000000000198e9d0 R15: 00000000005=
13690=0A=
[  158.673086]  </TASK>=0A=
[  158.673269] Modules linked in: bonding(E) tls(E) nft_fib_inet(E) nft_fib=
_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf=
_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_connt=
rack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_tables(E=
) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) ipmi_ssif(E) intel_rapl_msr(E) i=
ntel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) =
coretemp(E) kvm_intel(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_support(E=
) kvm(E) irqbypass(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E) drm_vr=
am_helper(E) drm_ttm_helper(E) ttm(E) pcspkr(E) mei_me(E) drm_kms_helper(E)=
 i2c_i801(E) lpc_ich(E) mei(E) i2c_smbus(E) mxm_wmi(E) ioatdma(E) acpi_ipmi=
(E) ipmi_si(E) ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) acpi_power_me=
ter(E) joydev(E) drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi=
(E) sg(E) ahci(E) crct10dif_pclmul(E) crc32_pclmul(E) libahci(E) crc32c_int=
el(E) ice(E)=0A=
[  158.673314]  polyval_clmulni(E) polyval_generic(E) igb(E) libata(E) ghas=
h_clmulni_intel(E) i2c_algo_bit(E) dca(E) wmi(E) dm_mirror(E) dm_region_has=
h(E) dm_log(E) dm_mod(E)=0A=
[  158.675578] CR2: ffffa6510e5580c0=

