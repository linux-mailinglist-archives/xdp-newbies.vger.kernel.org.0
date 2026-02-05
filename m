Return-Path: <xdp-newbies+bounces-196-lists+xdp-newbies=lfdr.de@vger.kernel.org>
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA7PObjHhGk45QMAu9opvQ
	(envelope-from <xdp-newbies+bounces-196-lists+xdp-newbies=lfdr.de@vger.kernel.org>)
	for <lists+xdp-newbies@lfdr.de>; Thu, 05 Feb 2026 17:39:20 +0100
X-Original-To: lists+xdp-newbies@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBDF5536
	for <lists+xdp-newbies@lfdr.de>; Thu, 05 Feb 2026 17:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9886730515DE
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Feb 2026 16:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A8C439005;
	Thu,  5 Feb 2026 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=darktrace.onmicrosoft.com header.i=@darktrace.onmicrosoft.com header.b="GlyM2/Xp";
	dkim=pass (2048-bit key) header.d=darktrace.com header.i=@darktrace.com header.b="Fkd1Qi7e"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail.darktrace.com (mail.darktrace.com [3.9.102.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4A52C0F91
	for <xdp-newbies@vger.kernel.org>; Thu,  5 Feb 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=3.9.102.188
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309347; cv=fail; b=OYR/IJz4nJuClVXQxx8ay0TUhMh2p/GehHWRcSjMfKO5nyDoFM7Vv1xNpVUPzaNlVV8JGlzwgW9xedsvTwQTriJQNWbai/djT+Z6r4BZosBonDODPnc0sL86NHWTZFF3QX7+wDBHujLxnf0aphr64ZWW0kjuPASMUD41e5I8RYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309347; c=relaxed/simple;
	bh=0oWO/AIuDQIsFvOPPK9o6IJLue5TT4ScBKsXobZmAv4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Et3npcpt+QDPSCS33s1dm9EhNwNOMML/2wP/bYQUku7YH3x4U5w7+naO3Qvc6XPAwnJ8gXYxOciRpjuMeKENiYanceRmoyxgoOoEuXkKMeJO0EJ+LqOdJnnFmMPmrX0hBKxP8mxFFiFkls+8h6npkcir3ST/aTi2Z/FLcdk58bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darktrace.com; spf=pass smtp.mailfrom=darktrace.com; dkim=pass (1024-bit key) header.d=darktrace.onmicrosoft.com header.i=@darktrace.onmicrosoft.com header.b=GlyM2/Xp; dkim=pass (2048-bit key) header.d=darktrace.com header.i=@darktrace.com header.b=Fkd1Qi7e; arc=fail smtp.client-ip=3.9.102.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darktrace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darktrace.com
Authentication-Results: mail.darktrace.com; auth=pass (login); dkim=pass header.i=@darktrace.onmicrosoft.com
Received: from UK-WGC-DT-EXC01.ad.iotrap.com ([212.161.34.85])
	by mail.darktrace.com (DTAG) with ESMTPSA id 8124716A-DD8F-4823-862E-6F0B2B54510E.1
	envelope-from <matthew.bannister@darktrace.com> (authenticated bits=0)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 verify=FAIL);
	Thu, 05 Feb 2026 16:35:38 +0000
Received: from UK-WGC-DT-HYB01.ad.iotrap.com (10.105.67.133) by
 UK-WGC-DT-EXC01.ad.iotrap.com (10.105.67.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 16:35:37 +0000
Received: from LO2P265CU024.outbound.protection.outlook.com (10.105.67.200) by
 UK-WGC-DT-HYB01.ad.iotrap.com (10.105.67.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 16:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQI/3wwlkn/ESJfsNCCHG9noeaKHMDf04sum/KHWcP6XiqBXpnZo77Voj1AtPsDTsiddJlRhinf798XXmLmBB8GMeXO7QM4ThrCEALZNzDpFR56xDl6Cg7o7DGGWxD2Z2BQtC2NCWEpv49fouQhos5DceXJYDooNhGwTlcrZcoBzEdXl3/b7PEnj2B7nGznNNG0WuT5ATTKrNq8vToH/O+cBxIB5du5n8g9y6/1oCLcwuVEBFBkXDXAQx1bC41J5XBSn1sEZ2CHUj1qpH3+LIsokJO/Q0uIAsRqCeI+c3l2Dglc2LB93v+131j+DFdnUmbu10WpIPGpk+9TeD9vnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oWO/AIuDQIsFvOPPK9o6IJLue5TT4ScBKsXobZmAv4=;
 b=O390KIJysDHCiUaXiO0+CW/Q+ufrOMxHUWhJkoMC92PzXXhk0hbx2RdWr7k9w1xPgqtUJpDRBMrtcIo9t5A/l9bT4OsBIKlnLEUfd7xh5ZR7vZ6LUdW96fnKP3JN8gSxvOEjb6tPbvDucOJ3RWQDNCgtrmaOpfLg7SPp96qoHEcgYwjol7hGTQb+7vtxfVT3I0cvsfIThjoX7bUc6BFtTYGIrgmmVAGQRnBqsHP/ZKeqDLVgD6rAYF5UnkoCyKqfGCS8KIUcvQS2b0NkMR4kXHTwpI2EY0tRlHUBhR374kFgYLuuWpNUdv9dVkXo5djdYDZjEGCd7+aeKYiYPLkumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=darktrace.com; dmarc=pass action=none
 header.from=darktrace.com; dkim=pass header.d=darktrace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darktrace.onmicrosoft.com; s=selector2-darktrace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oWO/AIuDQIsFvOPPK9o6IJLue5TT4ScBKsXobZmAv4=;
 b=GlyM2/XpDvMaZeC21QzlbapxJmw7PKjKenqFn2qOApCxbc9F3ID3dzGDa3JopE9FsMFyLCEckTN1JVYyeRzgt2Zi9PHBiVetdchs6I8AP4Z4/N1fHEZnN1oFyfrRHHiEUB1+gvdndSiNsyvCiPPjH3V7gFoHL4W9U3lGDDYE6no=
Received: from CWLP265MB2052.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:70::8) by
 CWLP265MB6371.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.14; Thu, 5 Feb 2026 16:35:29 +0000
Received: from CWLP265MB2052.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3a5b:6c24:545c:4047]) by CWLP265MB2052.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3a5b:6c24:545c:4047%3]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:35:29 +0000
From: Matthew Bannister <matthew.bannister@darktrace.com>
To: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Xdp multiple sockets over several interfaces
Thread-Topic: Xdp multiple sockets over several interfaces
Thread-Index: AQHclr1wCQz+cTXnB0exBEQj/f60mw==
Date: Thu, 5 Feb 2026 16:35:29 +0000
Message-ID: <7A889013-CC4C-4015-9116-658A393CDAE1@darktrace.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_9fe6b0ea-16dd-42c5-bdb0-3f3fcbf51b77_Enabled=True;MSIP_Label_9fe6b0ea-16dd-42c5-bdb0-3f3fcbf51b77_SiteId=e9073424-4718-4f72-b0c0-5ee6489f462c;MSIP_Label_9fe6b0ea-16dd-42c5-bdb0-3f3fcbf51b77_SetDate=2026-02-05T16:33:45.0000000Z;MSIP_Label_9fe6b0ea-16dd-42c5-bdb0-3f3fcbf51b77_ContentBits=3;MSIP_Label_9fe6b0ea-16dd-42c5-bdb0-3f3fcbf51b77_Method=Privileged
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB2052:EE_|CWLP265MB6371:EE_
x-ms-office365-filtering-correlation-id: a49d4df1-f6e8-405a-3a66-08de64d49334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SVZ6aldVT2cwTzBocGVCVmZWWUhZNnRaQjNWKy9ONXZmdmtpd1d5WjJsbFho?=
 =?utf-8?B?NjVXTVdXKzVPRDc3ZDNuczVENGpzai9iUU5pbUxCUWR0d0FXSVNlK2JXOHEy?=
 =?utf-8?B?cEt3RGJoNDdZOW4zNXN5TUdPRytFZzBWbmhmb2JVSDlRYU1LYUx3UnRCVC80?=
 =?utf-8?B?Nk55bWVWQ3BNelhlVnA5NXVGcnI2RVE2SmlUU1UwTTViKzMvMERRcTROZXI2?=
 =?utf-8?B?SiswMlNoMU0vYTVDWUZET1lzV2RiRnFMR3pEVjBWREdYNEZmTDVYRjVSL2FO?=
 =?utf-8?B?ajZvZHpHQU1CS25HeVdSVFBiL3M5Tk92ZENEOFR5SC9TMWNSdkI4SGdlQWdR?=
 =?utf-8?B?ejZoMnhFcUtxYnFYTHZGdVFEMGZpc3gyN244U0lpTTRRUDcvdDdKRzhNK1Zm?=
 =?utf-8?B?YW1EbThVSk1KNlZ2TnBPRDV1eStBQWRweVhvMUoyeW9laGkzRWQxdDlVZnFT?=
 =?utf-8?B?dmsvOVFQenNpQjA4QS9JSXNvczlHRnhvcysxSnJtd2lrKy9MQXVHTXR0ZklX?=
 =?utf-8?B?U2M2THNsVzZ1L0dlbXhXaVFZK3NBMlMreUNEWmRrbXdQQkFrcEhLSHIwVTVU?=
 =?utf-8?B?dUMraUtQQy9kSlBLNFRwRlIrM0l0U0Fnc1p5RFluNFQxWjhOczA5VGxhYnFM?=
 =?utf-8?B?STNXQTdzMXN1Ty93cERuUW1xS2dQVHFDRFZXLzA3VGlkQ2VjeU9zWVl2K0kz?=
 =?utf-8?B?SVZMcU5YMG9QVVVXVmhsdzdBWjNEZ2s3ZWRRNzh5b2JaWDhwR2hEY1p6TjVw?=
 =?utf-8?B?MkZiNStjNGlGcGd3am4yRHZZSERyb2FrUUpUa3Ria2RKR1pOS3UzVldjRzc5?=
 =?utf-8?B?ZDJ6UUtxY0FVUGVRYjFKYXBwOC9FNGYyWGl0MW9Ybm40UGJoN1JhU2hSNy9p?=
 =?utf-8?B?MFBvL3hlYVFyWFRud3FiOHpKTXhoMGFUb2w3ZDZ1bk5jdXlEWXZaL0xkSjRx?=
 =?utf-8?B?NldLYm83U0E1bkRkVjZVcWJiTkVWekQxNjY1M2pabzk0S2ZBSmRqV0ZtdlY2?=
 =?utf-8?B?aFpZZG5GSGRWTmEvWnBhU3ZNQk9hNk03Q0JiUmZ1NTJ0M1Zubnd3WExZMDhq?=
 =?utf-8?B?WXVYSzhTdWgwNThjYzVPbEJZNHhzWWExNUFzMHFvYis1eFF0T3hNcExIWFh6?=
 =?utf-8?B?MDFOSGYyNTlBUVRkS3dDazFUZVVyaE93TlRrK28wWWFzcmJ0OWpFa0gwTUtm?=
 =?utf-8?B?TVhWaFI2d0s2dmhrb2l6RzVjS09LRVBZWi9pejU5bThCcjlqVXJXb2szVmRS?=
 =?utf-8?B?TDE4SXlNcGVnV3VuRWxPMDZKSHBoWG9jUC9pbkVQd09Kb3Q1NnBxajdyaFdw?=
 =?utf-8?B?OWFnUVd3T3Zxb2tyRXh1d1l1cGJZUi9qVkY2REU4dHI1UTZ3dk9lOEREYjJ1?=
 =?utf-8?B?azZoVzhaR2VLdzNDTXkyU0tLMXRNcWdkRjl2b3lhZVlqRUV5YmxJRFZ1Q041?=
 =?utf-8?B?SmlkdFl2VWg5Vko3M21lM3EvRDdNQjdrbWxwOEVTL3hXU3RRMVZ5enR4Z1BG?=
 =?utf-8?B?RGNtMmpkQUQ0WWMwdWZpNXZaUlpKLytTUXRQaXp6WkZ5MnpTVklnNS9QUHFD?=
 =?utf-8?B?cXFRV282VzB1a3E4ZGV4cFVydEdvV2ErOStMOUZDTWp4Vi9GajFBaDFlYm5x?=
 =?utf-8?B?TVZ3SHZJSy9VYm93a1k3REVsMVkvQVUrWWIrSG41NG5LZzhnM21ZZ3RCa01P?=
 =?utf-8?B?MEJ0ejF6MTRZK09sLzBtRytmU3FPaTdFTmYyQmdacE5MNUxEcFJBOFRMSHRs?=
 =?utf-8?B?aWdtZVFpSG5yQUE4VVBmdjQ4L1RRVU16ZENtWlhyYkV0clcrNmZQd01YRlQz?=
 =?utf-8?B?Tk9GZTcxSE9EZFFqY0c5Uno3ZFVHUXU4ZVZDNTBSV3hoWTdoY2dqZjFhSlFG?=
 =?utf-8?B?eXVTSE5OL0RESllPaVQycEdRamNJa2JBY2V4bm93dTh0cEdkeVFBRGVlR0tr?=
 =?utf-8?B?SHlPVitSWkREOExvd0RRT0VMM0pNSWhoZ3FjVU9kRkh0QmRlZittK014dStw?=
 =?utf-8?B?VlgvbHBrR3o2Zjd2UWtENmQ4YkV0OHBiZTI0ZnlPUEhCdC8rdzhRc1VOekE3?=
 =?utf-8?B?VWRVRjFyRWU2NGliMGh4bHZMai8vQk1jNjQ5Y09NSXVlMFh2RktUVG9jU0NV?=
 =?utf-8?B?WG5CNXdvSlFycjRiUlJ5Tis4OEFJSWRnR2thSVQyNEdaS2t6VTZKNmVtN01n?=
 =?utf-8?Q?gGMSFV1Arx8QajBPfXdCbzI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB2052.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjFBV0J4SjRGRC9sbHYzZG9lcVl6RXhWWE9JcWZsV1ArZEZIaG1pd0dvV1ht?=
 =?utf-8?B?ZVp4U3ZyUUVENkhkTlpxSGFLLzA4bnBJYXFOb1NEMHFQRnNwWThIcTBoQnRI?=
 =?utf-8?B?OCtGNUgxMlZrNzJueXB0ZVdldnh6NUpSZ05JbE9xeDhCV2x6ZUJjZ2JlRzlh?=
 =?utf-8?B?QUd4QUZ2bVpwSE0vbGhiYkQ2SS9wcEJnemZZWXg2V0lZUG45MnRlUjVrMFBS?=
 =?utf-8?B?citUa25qN1BJN3ZkRDlYQStZN0tUcFU3MFpoMUNDY0s2TWlqdEpncTYvQU5L?=
 =?utf-8?B?Tk9sNzBNdDJwTXJOVFNndUpXdlRSMG9PZmxkNlRXZzhkM0xXZVdKMG90cmI4?=
 =?utf-8?B?SUdxckVJSnVHNkl6ejcxdXd2N210V1JuT2Fod1B5Z0FiaEVac2NjTXQ2WW1m?=
 =?utf-8?B?TTdhWkNUUjRlZFU5cURIeTd1RHA1NXdCc1BaRmxRQ0lXNzVGRTRDcWwyZlND?=
 =?utf-8?B?dDd1QzBPYUthclAxSGNLazg3L3BLYWtmcVF1bnZ2NFpFSjlWTTF3Z1Z0Nkc3?=
 =?utf-8?B?OEZNSW9kNzBGMStNTW1lak9TclJROTBYbzJaSkdJRnlwemZ4S3kvVFZZbi8y?=
 =?utf-8?B?RGxpbjJCU0g4WmVMZ3V0elZTc1p1YTRidmJnVmNtNitoYi9RaEsyU3Z5dWgw?=
 =?utf-8?B?VGErWDlOZk1sWXZIUnlRZjNscWlMY1Bid0Y2RzN4RkFha2VOM09PMlY2MkJm?=
 =?utf-8?B?V1RhMlR4K1ptNnkzNnBoZlZBdE5PcEVacFdvZWdBaDRpaDF4YlY5OElKU0NH?=
 =?utf-8?B?dFpZUm9lMUIrNzhIb3VaLzU5ZHB5WGdZQTNBZ3BnL3VvczhLVVhjcmlaU210?=
 =?utf-8?B?Z1RoNzV3VndiL3NaTTlqTThMdVl4NWtrUnhPWk5iVWlwdEdCd1FkN28yNU82?=
 =?utf-8?B?K3krMzlXT0ZoM280NzlRZlo2dkRGd0IzcnoyWDZ5eFkvRExSS2xSK1Z5MzN5?=
 =?utf-8?B?S21heUx4TC95YlJqL1lYUHA3NUdJajM5UUFzRGZRTVhZODZ5cXNnaHplbFlT?=
 =?utf-8?B?YzBKNWRtaHlNdUVYRDhtbktRWS9ncVFyeFZwSHE2enY3QWJjbmNTWlQ3WW9W?=
 =?utf-8?B?cEY0NjBiZmIxK3BNYjdDZWg2RFY1K29ha2xrYXRFa2UyWkhvSHBERForTWZ3?=
 =?utf-8?B?Z2VxQ05nSytsaE9hMFl3ZGR5ZnhYYzF2VlNPMFJCdlA0ZCtRWTQveHpjZTdZ?=
 =?utf-8?B?Q1JqY3VXdHhvb1VKblp4dWJyUWtUWm5MSHJzNXRwU1hJdGMzZm1qeVZZbHRj?=
 =?utf-8?B?YzdXWllmNDQ1REZPNWFwUnN0SWlMQk5OblV3MGZxdUtyT0ZLdmliMUVFcHow?=
 =?utf-8?B?QUtpSVZrUkI0a2tYNG9tcUhBb0tIbTR0SWFwU3BWb1JjYUFtc1NJaW5ZUDBK?=
 =?utf-8?B?c2hEVzBjdnNDMEU5RVBNdnNMVjRyQVBEZm5wcW4zTm1BWHFMRlFlNUVZWERu?=
 =?utf-8?B?Q0tPVGYxRXlrTURvZTBhN3d5bmhvYnN3TkVxd2l4eHZ4c1JoTVp3akd6bkJO?=
 =?utf-8?B?ZGRSU2hqa0cvR3djbUhCK1Q3ZjlhSDJ3V2JIbm5ENTVoRExRUHFta2dBZ1RJ?=
 =?utf-8?B?OTc4MFpuSlIvcllaSnFheXAxRkxuQjRPRDErTG1BdTZsKzF2TUNNTUpPZkRt?=
 =?utf-8?B?dGZtbmxqQjZkOFZlbW5Vbnd1RDhwTk5tb0N1T0dnSVhMM3c2ZzROVWdGaGc2?=
 =?utf-8?B?R0FEZ21qb0lxaVkwLzNweThrbnI2U0YwbVl5NnpiZVowYUZPSkNEUFpnMFRp?=
 =?utf-8?B?MHVyME1EOTJzUWRheU1ENDh1SUJjbFMyM21ZMlUyWTdTOHNmbTVCOGI2VXJS?=
 =?utf-8?B?Z2xITE41VVRpdVBBU0x3R1lDTVltQUcxVHFTY21wRW9ydmZtaGFuUlloRC9J?=
 =?utf-8?B?dkNESDZ3Q2xob1d4aHEwZHZWeGQ3eDlvekJ4bnp2aTVMV1RmQzg3U0Y2b2l1?=
 =?utf-8?B?b2hIejVOOE5IampXbm1RUnpiVUNLS3dxd1F4TGNIdFJjV25xQWpCUkQwbkRD?=
 =?utf-8?B?WStBdUpDVVVTRnlvV2FKSjVIZU0xazVxZXVFeFVYbWdHcDJGbDJVWmFJUmgr?=
 =?utf-8?B?SnJDTDdvMlBKVWtadWQvcUdGREdyck9EMjlwWWd4M29vTmZ1WFBPT011eHQz?=
 =?utf-8?B?ZEFaMXRWSW1OMHRxTVhNY3N4c0crYmw1SE9FenJEZkFTSG1sckFYazdnY09X?=
 =?utf-8?B?NVdWdk1qM1B1YktOelB6Vm1jbDNvRlRwdHF3RXczTWNGT254TWVxMXphTlBk?=
 =?utf-8?B?NFgzaG0yY3BiUlJIS3p1SXRtWStFdkdWOHJBZXVjbGlxblI3MkVFTXcrMjFz?=
 =?utf-8?B?WmlGekk5c3VHQStURzllTkRHRnhBY2ZZRlJybUl0WDVZYnkwNUdOZU1GUFRB?=
 =?utf-8?Q?WIMOSAMoHkTUc/tdOOBWktDDr9bjbwOwFkfFw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56675682A0FAD644B0FCD6FA8C970A68@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB2052.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a49d4df1-f6e8-405a-3a66-08de64d49334
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 16:35:29.8314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e9073424-4718-4f72-b0c0-5ee6489f462c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7ZMimbKesbvqi5wRJlvr7bgltA5ecAKpKdAN6wxZ2bdlbk7WFLq7e1/C3t505pPuS1dF1ZW8SU6p8yB2+lvX+BXkDDWFR+DOXMqhPhyp9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6371
X-OriginatorOrg: darktrace.com
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=darktrace.com;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=darktrace.com;
	bh=0oWO/AIuDQIsFvOPPK9o6IJLue5TT4ScBKsXobZmAv4=;
	h=from:subject:date:message-id:to:mime-version; s=dt1;
	b=Fkd1Qi7e/sza2d4Q+FDgt2GDOQVDeEdw6CwBtQru5aEGKlaqMlp6IZHLAX0XyNM+SrWD1QBGna
	dJ+WS3YrH3Rpd/RsijozwnBWgYJQx/qfSjfij7N9CElBd/ErBn4WZVZQZOXo/4O75OMZqR8zabIO+
	yt6Dxlq9Sz24AkJpmhQwkVAMd1yCU8bcnLF6YT+wi9UJu13bV/PXkQduO10mx7DdBn8MCZ0CZh7k1
	MskSu7QrO825YKQaBWcnlt2jVFQXpib5ah1PFwbaRlJvwHxJBpt07yKvlnjfXzIDjTc/nwl4lQZfE
	1/6z4nPxSUbLmOfoyxhaO70Dz/xBy0bTbOwdQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[darktrace.com,reject];
	R_DKIM_ALLOW(-0.20)[darktrace.onmicrosoft.com:s=selector2-darktrace-onmicrosoft-com,darktrace.com:s=dt1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-196-lists,xdp-newbies=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,darktrace.com:email,darktrace.com:dkim,darktrace.com:mid];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[darktrace.onmicrosoft.com:+,darktrace.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.bannister@darktrace.com,xdp-newbies@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xdp-newbies];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5ACBDF5536
X-Rspamd-Action: no action

ICAgICBbRFRMMF0NCg0KSGVsbG8sDQoNCkkgYW0gaGF2aW5nIGEgcHJvYmxlbSB3aXRoIGNyZWF0
aW5nIG11bHRpcGxlIHNvY2tldHMgZnJvbSBzZXZlcmFsIGludGVyZmFjZXMuIEkgY3JlYXRlIHRo
ZW0gYWxsIHdpdGggYHhza19zb2NrZXRfX2NyZWF0ZV9zaGFyZWRgLCBmcm9tIHJlYWRpbmcgdGhl
IExpbnV4IGRvY3MsIG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgSSBjYW4gY3JlYXRlIGFueSBu
dW1iZXIgb2Ygc29ja2V0cyBzaGFyaW5nIHRoZSBzYW1lIHVtZW0gaWYgZWFjaCB1bmlxdWUgaW50
ZXJmYWNlL3F1ZXVlIHR1cGxlIGhhcyB0aGVpciBvd24gZmlsbC9jb21wIHJpbmdzLg0KDQpJIGNh
biBjcmVhdGUgYXMgbWFueSBzb2NrZXRzIGFzIEkgY2FuIGlmIHVzaW5nIG9uZSBpbnRlcmZhY2Ug
YnV0IHRoZW4gd2hlbiBJIGJpbmQgbXkgbmV4dCBpbnRlcmZhY2Ugd2l0aCBpdHMgb3duIGZpbGwv
Y29tcCByaW5ncyBhbnkgc3Vic2VxdWVudCBzb2NrZXRzIGNhdXNlIHRoZSB4ZHBfYmluZCB0byBm
YWlsIHdpdGggKDIyIC0gaW52YWxpZCBhcmd1bWVudHMpLiBJIGNhbiBzZWUgdGhpcyBpcyBkdWUg
dG8gdXMgY2hlY2tpbmcgYWdhaW5zdCB0aGUgZmlyc3QgbmV0ZGV2IGRldmljZSBib3VuZCB0byB0
aGUgdW1lbS4gTWVhbmluZyBhbnkgc3Vic2VxdWVudCBzb2NrZXRzIGZyb20gYW55IG90aGVyIGlu
dGVyZmFjZSBhcmUgdHJlYXRlZCBhcyB1bmlxdWUgYW5kIHRoZXJlZm9yZSBmYWlsIGJlY2F1c2Ug
ZWl0aGVyIHRoZXkgYXJlIGR1cGxpY2F0ZXMgb3IgcGFzc2VkIHdpdGggbm8gZmlsbC9jb21wIHJp
bmdzLg0KDQpGcm9tIGJyaWVmbHkgcmVhZGluZyBvdmVyIGB4ZHBfYmluZGAgaW4gbmV0L3hkcC94
c2suYyBJ4oCZbSB0aGlua2luZyB0aGVyZSB3b3VsZCBuZWVkIHRvIGJlIGEgbGlzdCBvZiBwcmV2
aW91c2x5IG1hZGUgc29ja2V0cyAobm90IGp1c3QgdHgpIHRoYXQgY2FuIGJlIGNoZWNrZWQgdG8g
ZGV0ZXJtaW5lIGlmIHRoZSBuZXcgc29ja2V0IGlzIGhhcyBhIHVuaXF1ZSBuZXRkZXYgYW5kL29y
IHF1ZXVlLg0KDQpJIHN0dW1ibGVkIGFjcm9zcyB0aGlzIGdpdGxhYiBwb3N0IG9mIHNvbWVvbmUg
YXNraW5nIGZvciB0aGlzIGZ1bmN0aW9uYWxpdHk6IGh0dHBzOi8vZ2l0aHViLmNvbS94ZHAtcHJv
amVjdC9icGYtZXhhbXBsZXMvaXNzdWVzLzg1Lg0KQXJlIHRoZXJlIGFueSBwbGFucyB0byBpbXBs
ZW1lbnQgdGhpcz8NCg0KVGhhbmtzLA0KDQpNYXR0IEJhbm5pc3Rlcg0KDQoNCi0tDQpNYXR0aGV3
IEJhbm5pc3Rlcg0KU29mdHdhcmUgRW5naW5lZXIsIERhcmt0cmFjZSBIb2xkaW5ncyBMVEQNCm1h
dHRoZXcuYmFubmlzdGVyQGRhcmt0cmFjZS5jb20NCg0KDQoNCg0KDQoNCg0KICAgICBbRFRMMF0N
Cg==

