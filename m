Return-Path: <xdp-newbies+bounces-135-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641196B890
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Sep 2024 12:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8605D1F24F53
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Sep 2024 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F206B1CF2A0;
	Wed,  4 Sep 2024 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0E78fa6"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B053984A40
	for <xdp-newbies@vger.kernel.org>; Wed,  4 Sep 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445864; cv=fail; b=bqKJzbtlxhWxn556bLbbq9iKTHCsboSNG2Ayf1eph8ZDQM+QCMK7eQWWMFWxY0QfThHldEwLFxFywYfpcLPry1JhSN85z+OxJEnxIIjR47Vw00x05YOungVzJdThWZTLOUyaE4loVr6EgSCKxkMAeT6vfB8MirFlny6n+oYBWDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445864; c=relaxed/simple;
	bh=tb2NbsGzlTr0dwxkQ/OCEjV37FokB5TsxQEF+fUnDjQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oYQ0mN7b1DRshSNZi+qYmfMjaEBXnoRK7dxccB2aHxvQw8MFCV1kQuRdT/u8etClLxoDLMClNC+NhAOeS7YZ5mq+4EzzjABdM0bI9DW2agayy1h2sut4PQ58p5Iy5KvtGXVGThjBbHBem5Ml5Zsf195ykuirYa2ZaATdQuXflHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0E78fa6; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725445863; x=1756981863;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tb2NbsGzlTr0dwxkQ/OCEjV37FokB5TsxQEF+fUnDjQ=;
  b=d0E78fa6GvFJT83bgnNbkbwW9FwSx5I8ZOQ+Lxq02nC82kcB06l+RUDX
   uq4F3Tjp84sBbdOwcpTmzxA0Q9CMNDso1ApK4GrJNjCZV6LoeoBUNAcEi
   KkwX1sVaJgGnf7u/hSCOIpwjYpeK+JSam3AWm6Z1BRB2YK++f6XRH2IoR
   4+Vt33pDA/rFN0GHfK+fPuqI0JfEfFYjIKrqZv1fhNSYjANalJ9u/yGfn
   5vRYssc59fKRTXFAA4BoWF9yXf9F346+LXlzHO0KfkFX8GD1hmHD8g7Ut
   VaUjxSBA6xZlsc+ySU6lunvcZ3LPTh9MN+Sz8UCrkKc9dJ13ICIv1Yt73
   w==;
X-CSE-ConnectionGUID: 7dztCrI5RSWEoWOaFAPZig==
X-CSE-MsgGUID: unaahXL8QhyMs4zMMtxGYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41595949"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="41595949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 03:31:02 -0700
X-CSE-ConnectionGUID: ofu5o8dNR+m000+DtO0+uQ==
X-CSE-MsgGUID: BTwTKj/AT+GeV6WOvDoqUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65465890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Sep 2024 03:31:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 03:31:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 03:31:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 03:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9W87DHuB/7yXeGBV8Pmvau5QoJ8qOTlB8tM+XRnNuM60hNj3KyaG9wc79l5pRVHqi2tsfK9usMyZ3bJpPvypsDeVfz2p7v3YNdHEa5lFYlplQSFc2bOaqG3Ui9LEDExnPx4Ogojt409Aq0da6q384Xr0WTkaJoQ+GDLF1hcf1pmtTKGPtB6D+50/58C5NoDwgZ0V268WAJb9xb1ela8CYiU8nQnE3LD9dxaESG7VVX1xIrY0uFCP4Ykwcmomb3dxFLoDLC3ytLXKmiNdHkk9NwOd5RaX7HE/WRtlhm8+u+Nf20zeuYrgJxvr9q4jGe1DT3h6ICXhLMN3FjKf9KAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1xA3oiGDBpmkmEjlVcxqPNJBX/wWllZ4n9OqFNlb9M=;
 b=cRDQeumNPRbJa1pDpws7W4qxjP0H2WqcAsjCvieURbfd4v8pPWk7KM/2/o6QFNiU6EN7D7ZkLqjLdEFeIrLON7/Q5rIno0Rl0bE0YSWRUO5lZsvkWlrx6HglLo40b6KFXQBG7Pb6etCVAgokXG8S3c0FvnSjtgq+n93BYf22zYq4V8jTZtWQU4KMMg64v71IdcwkCBICt72Ob4IL5LRbZ7o/Odok+VUriXd/FV0blcbMyD/mcFr06ZshM2rE++2cgQCz+Wx8zCocoffMX/Moa1bxtzzT6lG8LkAuOtnlMD1LXRfsx3qrbRTed17HdD3orJyE4sYMEiVWf2vIPMzv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.24; Wed, 4 Sep 2024 10:30:58 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 10:30:58 +0000
Date: Wed, 4 Sep 2024 12:30:52 +0200
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC: Magnus Karlsson <magnus.karlsson@gmail.com>, "xdp-newbies@vger.kernel.org"
	<xdp-newbies@vger.kernel.org>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Message-ID: <Ztg23DO9q2O7vJ4D@boxer>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
X-ClientProxiedBy: ZR0P278CA0216.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::7) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: bb51acfe-8db2-43e6-d1c4-08dcccccaa05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW1TWnBzWHh6R2UwMjFTRTg4aUZlQkdRanFDZEpZTjNOM2w3b2tUZEhKVlRp?=
 =?utf-8?B?RGdhU0g2Y0lFTlFSVjdPRDUwZ0g1QWNrdHFEZGJQWVJjbEczQWhRdm1sQm5J?=
 =?utf-8?B?eEdzZTFuWjMzajdCL3V6UWJsaU1wWTFuVVJ6ZFBEcXcyWlllMngwL2FHMElt?=
 =?utf-8?B?SG9MUVZSUjRRVDdkZTI5d3YzNE9Tck5aVzg2VkxNdUZCeWZFTFVJRjh1OExY?=
 =?utf-8?B?MTlKK3pOVStiNENLbVpCQVo3NG82V0FqMWhZakFicytneCt1aFJFVVVDd21w?=
 =?utf-8?B?dDhVdndleWJxb0JwSitGWGRBS3ROWkV1RzVpV1hZVkx4N0hEcE5vKy9TNVJi?=
 =?utf-8?B?c2ZuMW9UL0RRTGVVUnBHRWNWNTZKdDdmekRiMlFKTzNmQmxqN1lrVE9EcmNv?=
 =?utf-8?B?WWlPam9NUENFaW1IUXliVThaeWlJNFRpek5uMU1LN0NsL2VSVkJDTHVOSUZV?=
 =?utf-8?B?YVVRRFpTOSt0VkZhK2xzekxyOVhRVmswMkxnZVBSU1BPQ2Nad001OFRITjlk?=
 =?utf-8?B?cmEweXZKWDZGV3ZHYUpaZi9mRUtSYjBHdmtHTHNibmQyTXQvaWlhdDFoM1VP?=
 =?utf-8?B?UlhBTmswOFh6WEFma0Y1bXpxaE1xb205RUdvYjNvTUFGdUJUbGZuSVFDdkZv?=
 =?utf-8?B?Zng1eDdWN21aYkpicWVsa3Z2Qm9MTDdVSVVrVGF6WEI2TXRuUXZuM3BqYmF6?=
 =?utf-8?B?ditpSE1VaWNzUnIwSjVxdksydU01K2k4V2Q4Wk1jMHNDMGpNZlN5bzBiWEFJ?=
 =?utf-8?B?ZWtROXRaeHZIVFBFaG1xVkRSMFVSVGpNZHJVMDV3Y3hGQ2pYcEl3S0JnNzlQ?=
 =?utf-8?B?Z0ExajBZSWxXanJFMXJBc25UekR6M01RSWI0enF2NHMvZjFmK1pXVHJmb2Rt?=
 =?utf-8?B?Y1NiL24vbmlOdTVuVWFvdTVDU0d0KzVvNCs3SEdTcnRiTG9WQjluZzJQenlI?=
 =?utf-8?B?Rmh0ZlpsK2gxYzRXZk9tM1prSDVERHZjeXZTSzF4RHlUUUFXa0ZKTTM2WFhB?=
 =?utf-8?B?TXdJYVJBNnlSWVk5Wm1SMEl3YnYwa29XMFNQZnl4dGtEWmdmbmZqM0ZBUzMv?=
 =?utf-8?B?QTcvU2E3bnF5ckJKUURHdTlkOTZUZFY1aWVqMkhBTkFWY1JGRE8wVGJidWdO?=
 =?utf-8?B?RGp6UzFNaHp5NklxdVFxZUhtNEgwQTFSUkNGaVRLTi9UNWM1RG1nZy9EWERI?=
 =?utf-8?B?T1VTUklzZHBDdHh5dW0yLzVEeHBCOXRxZWxYTWpjTHgxcFVQRmFCK2pFZjQ3?=
 =?utf-8?B?djVVWjc5YjJiSlY1ZXdwYWZIa3l6cnF0bURvRE00VUt0eDdsaHFBWnlLL2hF?=
 =?utf-8?B?ZlNsYW5ZODRzWnducnlnZ1AzMEUyQkhQRmdxdlFmWXdFeSs4U2dHNXVDa0ll?=
 =?utf-8?B?dUNMdkF3Q0NJN1hsY1R5TzZIV0RaTTZBQ0RudnkwdUJlMUcrWlhhaXFMUFAv?=
 =?utf-8?B?TC9BUjMrZ0trRGJRTDNPOFFuVFcyUyt3MGxwWEx3R1lwM0IwdVlLbmx1bWI5?=
 =?utf-8?B?dWZLRHRCOFRzMEo0VnhLNG1CWlVBSnJsSjN1bFJ6Zm52REUwTlVncGdVY1ZI?=
 =?utf-8?B?UmZwcElrd3hoUFFrK0JRZ3cyRFh0SFlIalFkSjVEL0xHV2RxK2VCSlU1bXZU?=
 =?utf-8?B?ekNIQzN1UWlJUnlYWG5EZnEzNFBpdlM1cllUY1M5ZEVtZzMxM1JBYXo2dTRD?=
 =?utf-8?B?TnM0Sm5zclBMS2E1TnUxNVEwRU5vWk5GU1huN2ZpV0F6VWdvbUhNMUJCbTkw?=
 =?utf-8?B?TDM3SDNHQ2prQ1gwZmVtOStPcTlPVlM2SXN2d3U1UXFXcStTT2ZHNzZibkRz?=
 =?utf-8?Q?1r0nVsStk6Iy3qERS7HPPr0FSMhz+D3tROAUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVc3S2gwdENFRTc1WkRlRWVFcjJEbklwbkhHNHAxMWdnekh6N0ZxcTNFd2xJ?=
 =?utf-8?B?dE1sWm9XZkpYSmhURG8wOXROcndoZVE2QmV5Mi93dU56ZTZkUEpuTDZyMzFN?=
 =?utf-8?B?RkVwYVlTeFBnY1RPRDFoOXYydWV5SmZwK3kzZFpseStPeFY0RlUwTTlVVGdO?=
 =?utf-8?B?bWRnSFpXMUprQVJOSDAzZ29LYWpwZG94dTZ4dnh1Y09wNjhCOCtKQmEwVHlL?=
 =?utf-8?B?TVNXU3FqOHJRZWpuNk1ZQm5TVmNrTTdKZGd6RE1xYk91Q0I2V1JqTFcyM0lK?=
 =?utf-8?B?cVBqRFMvN0VPdTkyL3ovUEFnaERycUZnUG9vWnJpQ2NQWkg1bDM2Z2pxWGRK?=
 =?utf-8?B?WTFtYXlnRGEzelJxdzlZT0YrSGd2MTZjQ2o3QStqby90WTNjakVPU0M5M3dy?=
 =?utf-8?B?N3BIMENRS3BQcmhVU2t1NlZLT2tOMDEzQW9HYnBIbVFxb0pQVXJnSU14Yno5?=
 =?utf-8?B?dGFVTVdyUzdpMEtBeHNmSnNJZGxxblNTbTVocWNJZEZna1lwdTRwejU4MDZJ?=
 =?utf-8?B?N01IRjc3LzNxL2RlbWdwZS9FQ095UFB3YnlYbFRzLzhYWXdOSUhNT2FOa0pB?=
 =?utf-8?B?ZFQzb3VhaTQ1Nk5YendMdGZNdk5YY0dFWllqdEJiUmZRR3dpdmw3MnY4MW14?=
 =?utf-8?B?TTlLZWtxUkpZOUE2bE1QaktyUjlKTThqb25nQjBGQ2RnUUdFdkV1TmhieVAx?=
 =?utf-8?B?L091T205ZzBHcFo5a0duY3YzRlg5ZGUzWXZ0QWRFZDZSdk5POGJ3TWVBTG8r?=
 =?utf-8?B?cnFBSmQzZDhYbUNnbkJGTXJ3SHc4ZU96YkEyQ085UHB5L1dzY1dCNWNIZ3hx?=
 =?utf-8?B?VFFoWUpYVDY4aXJXOTgxaUlqMXkwVmFHL1pNV2gybnNQM1RtOHNzU2YrL1dk?=
 =?utf-8?B?c3FySFdKWUtuaGR6TlQ3SENweDBzSTlMNWVaS05qWGJHMUZHQXJWcnJidTl3?=
 =?utf-8?B?bXhhaWJOMmRuTTBGQXNXaDdPenAvV1J1UHJBVURqbTNyaUdjWXpBSUlLTy9a?=
 =?utf-8?B?RGpMUERodEFpOWV5NVRIS2E1MkVmYjhyS1E1ZWkwUHdSNjlHc3JkMkFNR0Mz?=
 =?utf-8?B?UFhkQnFwMkQ0NFEwMURtUjAvQStjVXl3MURVcXovMkJkaU9oWElmeCtHY3JM?=
 =?utf-8?B?OUJQT241Z0pyaGhJc1pyaVRLSDhqamZJZHIrMTNURERGVTNDWmNzUEdkSEdp?=
 =?utf-8?B?a1J0K2RtMFRRbXVDTzJ1TXdqNnF6YnIydjdLV0llWHluR0JnYlo2SWx2Zno5?=
 =?utf-8?B?UGNHaURTemRIeGtrcXJWR1ZvVE1zT2F5Q21Qczd2bWRVMkFZMVJXRFFUeEtt?=
 =?utf-8?B?UnRSRURIVjVjTHdTeFFsMFlQM1FaK050TW5FRkdWWmM4L1NlSUVwblVYWG82?=
 =?utf-8?B?Z0U0cWZVS3pFcytraTM0eTNFalVPT3BRVGUrK2ZPcU5jV28vV2s2akhXL3E1?=
 =?utf-8?B?Zmhkb2M0ZUt0cTB2Mmt1VHVNaXl3K0ZPNlRORXRUU2tFNmhXNXhVSkZzSGR1?=
 =?utf-8?B?TERPY1hYY1JFblJYVFZ1N1ZtelJjbXRQVTVCQkVWQStRVXVIUFlLd1UwV1k2?=
 =?utf-8?B?SWx5TDdlUngzWDR1SEdtdVE4RHJDaURUYWJKTUJLdFExTEpNZ0VLOENIRndn?=
 =?utf-8?B?YVZjbWpaemtqeVp5MWtwZnVsa2tOczJGQldNZ0R4ZEduUlRWeFZtK3dBS3Nm?=
 =?utf-8?B?SCtSQ3N3TGJQbkZvN2RmbC8weklnZkNRTW5BMnVHNFVVWnpJT0lYcGhRTmk3?=
 =?utf-8?B?cTB4akJ4TVltMERLdjRrcGtTZHVHWEMrWHk2emRoZWt5eHpxT0NMRkEvSmJW?=
 =?utf-8?B?ZU1uSnpGY2JqRUZ0WEhjcTY5TzYrQTVpck5BaWxHbWJ4Nk1TZlV1bVVMdWIw?=
 =?utf-8?B?eGwvWVY3Q1V1cTM2REFMVlFoQUZVWEg3YzlqajZTNUVmZzlBUWpjVkpkM3dp?=
 =?utf-8?B?THdXZzJGaVhsazdJd2h1ZW5LLzd5NzJDdlNiZ0FscXl2b25KcGxsS3hUS2FM?=
 =?utf-8?B?ZzNtNjNqaG8rZklrTjZVcDN6NHJTMW9veFZaOXFWWXpKa3ZoVkJtRTBUSlFh?=
 =?utf-8?B?VStvNS9DSTBVaUlUc0FBZ1RVd2xHWTcrci9BSitkQU9sWlJpVVBEcERNYUZB?=
 =?utf-8?B?L3BjeTJqWFlzR1pYT3IyNEQzUkU5Y3Viam9sVHNOMVhwV1JyQ3lrbEJJQS91?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb51acfe-8db2-43e6-d1c4-08dcccccaa05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:30:58.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kAtXlANfF7bQOVdBZrOfhHOBBuw/Og2e5lkSIWuY7EJcjBoUIZihSPkhRvsTpN9bYq+nxEEGGgrvtRkwnHarC9ACNHXCsEcTuG3YvhwOMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
X-OriginatorOrg: intel.com

On Mon, Sep 02, 2024 at 04:09:33PM +0000, Alasdair McWilliam wrote:
> Good evening,
>=20
> Looks like commit a62c50545b4d is the culprit.
>=20
> I've produced a production-grade build of kernel 6.1.95 with commit
> a62c50545b4d backed out. Seems I can no longer trigger the fault. I can
> kill -9 the process while pushing 50Gbps / 14Mpps and the process is
> just restarted and resumes like it should.
>=20
> I'm going to back out the same commit from 6.1.106 for our production
> builds and verify that fixes the issue there too.
>=20
> Can you advise if this will be reversed in future commits, or if you
> have an alternate fix in the wings?

We've been working recently on somewhat related issues and it looks like
not every commit from [0] has been backported.

$ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_pro=
g
8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's

can you apply the rest of it on top of 6.1.107 and see the result?

[0]: https://lore.kernel.org/all/20240729200716.681496-1-anthony.l.nguyen@i=
ntel.com/

>=20
> Thank you ! :-)
> Alasdair
>=20
>=20
> ________________________________________
> From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
> Sent: 27 August 2024 14:33
> To: Maciej Fijalkowski; Magnus Karlsson
> Cc: xdp-newbies@vger.kernel.org
> Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
>=20
> Hi Maciej, Magnus,
>=20
> Apologies for slow reply =E2=80=93 bank holiday in the UK yesterday.
>=20
> Just a quick update =E2=80=93 it=E2=80=99s quicker and easier for me to b=
uild a released version of code than it is to build a production kernel fro=
m a git tree due to build apparatus.
>=20
> Based on the suggestion to back out commit a62c50545b4d, I have taken the=
 first step of identifying that said commit was included in 6.1.95. So, I=
=E2=80=99ve run both 6.1.95 and 6.1.94 through a build to test both. Some q=
uick and dirty testing shows:
>=20
>   *   I can reproduce the issue on 6.1.95
>   *   I cannot so far reproduce the issue on 6.1.94
>=20
> I=E2=80=99ve only tested the latter version 3-4 times so I=E2=80=99m goin=
g to keep throwing dead processes at it in different ways to just to be sur=
e 6.1.94 is not affected. Then, to validate, I will grab the actual git tre=
e at 6.1.95 and manually back out a62c50545b4d and re-test. But, this will =
take me a little longer.
>=20
> Thanks
> Alasdair
>=20
>=20
> From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> Date: Friday, 23 August 2024 at 15:09
> To: Magnus Karlsson <magnus.karlsson@gmail.com>
> Cc: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>, xdp-newbies@vger=
.kernel.org <xdp-newbies@vger.kernel.org>
> Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
> On Fri, Aug 23, 2024 at 10:17:35AM +0200, Magnus Karlsson wrote:
> > On Thu, 22 Aug 2024 at 18:25, Alasdair McWilliam
> > <alasdair.mcwilliam@outlook.com> wrote:
> > >
> > > Hi,
> > >
> > > I've been testing apps that use XSK+ZC on ICE with newer builds of th=
e 6.1 LTS kernel in preparation for some production upgrades, and I've star=
ted to notice some instability on newer versions. I can reproduce the issue=
 easily in the lab.
> > >
> > > Config:
> > > - Known good multi-threaded application (i.e. production grade)
> > > - Uses eBPF and AF_XDP with zero copy to act as 'bump in wire' in net=
work
> > > - Xeon's with Intel E810-CQDA2 (firmware: 3.20 0x8000d83e 1.3146.0)
> > > - Effectively a vanilla rebuild of 6.1 using configs from el-repo pro=
ject
> > >
> > > Scenario:
> > > - Noticing hard kernel faults when shutting down application
> > > - Can happen if the process is shut down via systemctl stop
> > > - Can even happen with a simple kill -9 command to the PID
> > > - Appears in builds after 6.1.87
> > >
> > > Tested kernels:
> > > - 6.1.84: process exits smoothly
> > > - 6.1.87: process exits smoothly
> > > - 6.1.97: BUG: unable to handle page fault for address
> > > - 6.1.106: BUG: unable to handle page fault for address
> > >
> > > Kdump log is below [1] from 6.1.106 but does seem to be the same in t=
he earlier version.
> > >
> > > Can anyone advise if this is a known issue?
> > >
> > > I don't have any builds between 6.1.87 and 6.1.97 but I can spend som=
e time trying to pinpoint the exact version things start to go wrong in, if=
 it would help anyone better equipped than me to debug!
> >
> > Hi Alasdair,
> >
> > It would be of great help if you could pinpoint the exact version for
> > this breakage. Hopefully we could then find the commit in the ice
> > driver that breaks your app, since there should be just a handful of
> > commits in the ice driver for any stable release.
>=20
> $ git log --oneline v6.1.87..v6.1.97 drivers/net/ethernet/intel/ice/
> dd37b86999fd ice: Fix VSI list rule with ICE_SW_LKUP_LAST type
> 224b69e8751c ice: avoid IRQ collision to fix init failure on ACPI S3 resu=
me
> 531d85b4fb66 ice: move RDMA init to ice_idc.c
> a62c50545b4d ice: remove af_xdp_zc_qps bitmap
> 447a5433bd1e ice: remove null checks before devm_kfree() calls
> a388961be5ed ice: Introduce new parameters in ice_sched_node
> 17ccdebe5ac7 ice: fix iteration of TLVs in Preserved Fields Area
> 07cbc5512023 ice: fix accounting if a VLAN already exists
> 5ef3a27c6142 ice: Interpret .set_channels() input differently
> 90cbd4c081bb ice: remove unnecessary duplicate checks for VF VSI ID
> 59161a21cae0 ice: pass VSI pointer into ice_vc_isvalid_q_id
> 6a6ebec40820 ice: tc: allow zero flags in parsing tc flower
>=20
> can you revert a62c50545b4d and see if the issue persists?
>=20
> >
> > > Kind regards
> > > Alasdair
> > >
> > > [1] kdump log
> > >
> > > [  158.666867] BUG: unable to handle page fault for address: ffffa651=
0e5580c0
> > > [  158.666887] #PF: supervisor read access in kernel mode
> > > [  158.666896] #PF: error_code(0x0000) - not-present page
> > > [  158.666903] PGD 100000067 P4D 100000067 PUD 106dc4067 PMD 0
> > > [  158.666914] Oops: 0000 [#1] PREEMPT SMP PTI
> > > [  158.666922] CPU: 7 PID: 1808 Comm: tlndd.bin Kdump: loaded Tainted=
: G            E      6.1.106-1.X.el9.x86_64 #1
> > > [  158.666940] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS=
 3.2 12/16/2019
> > > [  158.666950] RIP: 0010:xp_free+0x11/0x80
> > > [  158.666962] Code: 8b 04 d0 48 83 e0 fe 48 01 f0 c3 cc cc cc cc 66 =
2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d 6f 58 =
53 <48> 8b 47 58 48 39 c5 74 0d 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc
> > > [  158.666985] RSP: 0018:ffffa65089e8b760 EFLAGS: 00010202
> > > [  158.666993] RAX: ffff8fcf077c0000 RBX: 0000000000000001 RCX: 00000=
00000000000
> > > [  158.667003] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa=
6510e558068
> > > [  158.667012] RBP: ffffa6510e5580c0 R08: fffff8c50415a108 R09: ffff8=
fc7cac60000
> > > [  158.667022] R10: 0000000000000219 R11: ffffffffffffffff R12: 00000=
00000000fff
> > > [  158.667031] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8=
fc7c139d340
> > > [  158.667040] FS:  00007f8504996880(0000) GS:ffff8fcedfdc0000(0000) =
knlGS:0000000000000000
> > > [  158.667050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  158.667058] CR2: ffffa6510e5580c0 CR3: 00000001448e2002 CR4: 00000=
000001706e0
> > > [  158.667068] Call Trace:
> > > [  158.667075]  <TASK>
> > > [  158.667082]  ? show_trace_log_lvl+0x1c4/0x2df
> > > [  158.667094]  ? show_trace_log_lvl+0x1c4/0x2df
> > > [  158.667103]  ? ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> > > [  158.667157]  ? __die_body.cold+0x8/0xd
> > > [  158.667166]  ? page_fault_oops+0xac/0x150
> > > [  158.667176]  ? fixup_exception+0x22/0x340
> > > [  158.667185]  ? exc_page_fault+0xb2/0x150
> > > [  158.667195]  ? asm_exc_page_fault+0x22/0x30
> > > [  158.667206]  ? xp_free+0x11/0x80
> > > [  158.667215]  ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> > > [  158.667250]  ice_clean_rx_ring+0x157/0x180 [ice]
> > > [  158.667284]  ice_down+0x172/0x2b0 [ice]
> > > [  158.667311]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> > > [  158.667337]  ice_xdp_setup_prog+0xe3/0x3b0 [ice]
> > > [  158.667364]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> > > [  158.667391]  dev_xdp_install+0xc7/0x100
> > > [  158.667402]  dev_xdp_attach+0x1e0/0x560
> > > [  158.667412]  do_setlink+0x7a8/0xc10
> > > [  158.667422]  ? __nla_validate_parse+0x12b/0x1b0
> > > [  158.667436]  __rtnl_newlink+0x540/0x650
> > > [  158.667446]  rtnl_newlink+0x44/0x70
> > > [  158.667454]  rtnetlink_rcv_msg+0x15c/0x3d0
> > > [  158.667477]  ? rtnl_calcit.isra.0+0x140/0x140
> > > [  158.667485]  netlink_rcv_skb+0x51/0x100
> > > [  158.667727]  netlink_unicast+0x246/0x360
> > > [  158.667953]  netlink_sendmsg+0x24e/0x4b0
> > > [  158.668173]  __sock_sendmsg+0x62/0x70
> > > [  158.668389]  ____sys_sendmsg+0x247/0x2d0
> > > [  158.668602]  ? copy_msghdr_from_user+0x6d/0xa0
> > > [  158.668815]  ___sys_sendmsg+0x88/0xd0
> > > [  158.669028]  ? __sk_destruct+0x156/0x230
> > > [  158.669234]  ? kmem_cache_free+0x134/0x300
> > > [  158.669437]  ? rcu_nocb_try_bypass+0x4a/0x440
> > > [  158.669634]  ? __sk_destruct+0x156/0x230
> > > [  158.669825]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> > > [  158.670010]  ? mod_objcg_state+0xc9/0x2f0
> > > [  158.670186]  ? refill_obj_stock+0xae/0x160
> > > [  158.670359]  ? rseq_get_rseq_cs.isra.0+0x16/0x220
> > > [  158.670529]  ? rcu_nocb_try_bypass+0x4a/0x440
> > > [  158.670696]  ? rseq_ip_fixup+0x72/0x1e0
> > > [  158.670860]  __sys_sendmsg+0x59/0xa0
> > > [  158.671021]  ? syscall_trace_enter.constprop.0+0x11e/0x190
> > > [  158.671185]  do_syscall_64+0x35/0x80
> > > [  158.671345]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > > [  158.671503] RIP: 0033:0x7f850510f917
> > > [  158.671658] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 =
0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f =
05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> > > [  158.671993] RSP: 002b:00007ffcc805f238 EFLAGS: 00000246 ORIG_RAX: =
000000000000002e
> > > [  158.672171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007=
f850510f917
> > > [  158.672352] RDX: 0000000000000000 RSI: 000000000198e9e8 RDI: 00000=
00000000009
> > > [  158.672534] RBP: 0000000001933c00 R08: 0000000001935980 R09: 00000=
00000460e48
> > > [  158.672716] R10: 0000000000000011 R11: 0000000000000246 R12: 00000=
00001933c30
> > > [  158.672899] R13: 0000000000515fd8 R14: 000000000198e9d0 R15: 00000=
00000513690
> > > [  158.673086]  </TASK>
> > > [  158.673269] Modules linked in: bonding(E) tls(E) nft_fib_inet(E) n=
ft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4=
(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf=
_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_ta=
bles(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) ipmi_ssif(E) intel_rapl_ms=
r(E) intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E) intel_powercla=
mp(E) coretemp(E) kvm_intel(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_sup=
port(E) kvm(E) irqbypass(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E) =
drm_vram_helper(E) drm_ttm_helper(E) ttm(E) pcspkr(E) mei_me(E) drm_kms_hel=
per(E) i2c_i801(E) lpc_ich(E) mei(E) i2c_smbus(E) mxm_wmi(E) ioatdma(E) acp=
i_ipmi(E) ipmi_si(E) ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) acpi_po=
wer_meter(E) joydev(E) drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) =
t10_pi(E) sg(E) ahci(E) crct10dif_pclmul(E) crc32_pclmul(E) libahci(E) crc3=
2c_intel(E) ice(E)
> > > [  158.673314]  polyval_clmulni(E) polyval_generic(E) igb(E) libata(E=
) ghash_clmulni_intel(E) i2c_algo_bit(E) dca(E) wmi(E) dm_mirror(E) dm_regi=
on_hash(E) dm_log(E) dm_mod(E)
> > > [  158.675578] CR2: ffffa6510e5580c0

