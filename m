Return-Path: <xdp-newbies+bounces-165-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A409D12EB
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 Nov 2024 15:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F8C2842A7
	for <lists+xdp-newbies@lfdr.de>; Mon, 18 Nov 2024 14:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F3819D899;
	Mon, 18 Nov 2024 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgTxjpB6"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D125DDC1;
	Mon, 18 Nov 2024 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731939898; cv=fail; b=sGvkcT1miSR840JEVTB8+l031/mge3gFuTbslWD80Ws2egtx3LBWGPGP/gTq0uv4kSxZXagcqlbRhclMOALX1vgk/H9D7rQUOKr81uZ4HJnpxAxxtVHn/lOZo1Aa69Ui864l84EhmSvapWqg6wKj0sd0HBTH+kPJYOLXupDPCkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731939898; c=relaxed/simple;
	bh=mX/Tl5xI4WeAokIc47fzLF9XDjhrfxsF2M4CQcabp14=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j2uYZkMkoQxV1vBlLgFgYVfv9augpvUwgKtBKzqvNEj93q8EU7BDqjHgB8OFPCdI08/M261aleQ+UnQS566P3UO3KHKHoE+Pk42mRGFIdMV1ObpZ6iH4hrZcsPDlwTc5lSt55MB71ATMSBWfauSmijCyLBPTJWTldL0CU8eCUsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgTxjpB6; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731939896; x=1763475896;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mX/Tl5xI4WeAokIc47fzLF9XDjhrfxsF2M4CQcabp14=;
  b=fgTxjpB6gMY7DebzylKVrPrE53clb2Eg3fDHzPGD3DZ3KkAD1pFFBkrC
   M/udiJRvZYfiFkRq/+808aYN8IqRCxb9AZDOqlqCGGiNA7XauzLv1+6em
   mv4wOm87Q9DJTUz2F/rtJ01FdkKCJ0IJivvIh8FGt/Oxv6TstBdXr6dRj
   gQLXP7FmILqc+Fi95XX6Q7n9gPW7OJFp+X8ZyquarJl903JQIqtICXb3c
   wNylgySK0l5VrDRPhh+J5ZYpPV5cWXAFrFevORqC/m0A8BlXmIG5+UAAl
   Eyb4upAk09h18rJNhxYuaPSIqEhxTnotrtBlx8M8WqeZHm8jJbvH8KhLQ
   A==;
X-CSE-ConnectionGUID: rzZ2szPlTN2yTd1QuQCiHA==
X-CSE-MsgGUID: igbtKy2ES8GD9XZ5OFRK6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31747558"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31747558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 06:24:55 -0800
X-CSE-ConnectionGUID: C6ylvU41SzObPJhs7Ax3lw==
X-CSE-MsgGUID: Y6h7JJ65TfmlngA5nwS6UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94048182"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Nov 2024 06:24:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 06:24:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 06:24:54 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 06:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qq1PN0xTzUByowcTkiLBVMC/PtuDUNjinSYUZuD4cGqsMc/W57ynEYtRSjHejlxh5m+iRhpm/3FXernNIi/2rFegQHMZc/+CzaGqM4GrY7SLpk2wORleaYmkLUfGP+oNkfefDu28AJ2sUYjYlgVeBEbrcsOrLWu8jy9my/waRZ8/8rsRqE1p6bA3UbuO2NlZQ3lZuGLh/DCpaYIfHiRoN8iI+rFRIrPaFKVHwbXxilWhYgdAhuRWbwRXIUMUr2d52LcVJ8Y+48mUeDQNuWDpc8667grc7+AGE3l5yk8N4DXrPo8LvQ+UIAbhaa05P32o8VFTJhqWA+A+OpCrIjilDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4XD3z+pZNok+9I2mALh83FEFNe7eSi+T2zLZfyK7G8=;
 b=kku9syre6qi4HV4NOhr8NuNrHaiS2PrDm9mm1h/7ZUEzTROUqswaBVPLNzNOAPIEv8eUWDexmkwkOGOoCSrpfufvp+Pra/X1eyIjoLOUm75U9q00e3Ad17vyieiY8TdpMVEbVM4RcTTwX3C8TAugnWtQEEG1fWT7mF3sux1UndnsZpQxdwrV9zsR3m9EwAuLJy7PDKr8GyoX/J7idi/Uwr033kU8JvZRfCanrsBmRFImJh2w5H4jeu+Sdl4HqBN3C7LRXRVehGO4agiqwhJsTfMJPyjwnVSDGa2dRcGq/mi0h0601IqV2D2ygL2MZfMhZ7gYtZ1BdbuEUFXy/+hiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Mon, 18 Nov
 2024 14:24:50 +0000
Received: from SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29]) by SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 14:24:50 +0000
Date: Mon, 18 Nov 2024 15:24:41 +0100
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC: Thorsten Leemhuis <linux@leemhuis.info>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@gmail.com>,
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>, "Linux kernel
 regressions list" <regressions@lists.linux.dev>, Jacob Keller
	<jacob.e.keller@intel.com>, netdev <netdev@vger.kernel.org>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Message-ID: <ZztOKRQ1ap5weI9E@lzaremba-mobl.ger.corp.intel.com>
References: <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <30bd4ecb-961b-404a-ac3d-9c25c8269e4d@leemhuis.info>
 <PA4P194MB10059D2195A387ACD32CA27E86562@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
 <ZyhznlGIjio3saic@lzaremba-mobl.ger.corp.intel.com>
 <PA4P194MB10056F208AF221D043F57A3D86512@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PA4P194MB10056F208AF221D043F57A3D86512@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To SN7PR11MB7540.namprd11.prod.outlook.com
 (2603:10b6:806:340::7)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7540:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f028e4-06d2-4c4c-320f-08dd07dcc2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QvOrM4JVBWmTTSgzwhpDGHm/1EOyiKTKLcrlnVt6PGNPrNGaO+4ajeswdn5f?=
 =?us-ascii?Q?IKZtpPCsRCF6h4F8iv2CXKO55U91h7+6kgFQDxi8m0hv+CLSfRVRJIkS6Qkl?=
 =?us-ascii?Q?BsqLmxpJJYH7SKTHB4hHfkAKTrs076tsNgCWYZQgHc1lb+b6f02NtR8VsDeq?=
 =?us-ascii?Q?+OKCN4M2vEYHGwvHxPRQAnpQvsGl3uWwL+oYgHzbDmKVPG0Dn9t52HOi0r5I?=
 =?us-ascii?Q?fOLZI/bAHa0gk9G0xWQ47OhaJ3e5Iz9Q+sZ5HAGd/1SnrrqktUenJwShYIPI?=
 =?us-ascii?Q?2uwqIgUeIlnHq/b4Ll7KymDrrRXAMoIDU+Vxf9N+xUXfgHqi2sA1mI+WIusK?=
 =?us-ascii?Q?D0/23XQ5dO8A4xguuHWrSSC+y2bJ71w7veKVpV/qMRgyOSdPPwvNrLdhs9Qj?=
 =?us-ascii?Q?LNbilx0YtRqtW3hdenP4wvl+LRJOKGM1idWLhQ7uAAcz7FsfZ7IXaW4DWZUZ?=
 =?us-ascii?Q?AgNET34VMMsfI56whHKKL0Gfh/76mIegMPSgNkFkGA2f3msXVJQ7de21ASPD?=
 =?us-ascii?Q?JXXyuSqt2lmfsz7e9hRu1IrIIxH6mqCyCibdZ8mNyqVVJN3I6E8UuMPgoXLB?=
 =?us-ascii?Q?IU9zVFs9McD2q36sxxLS9Q74pEV0sydm+6Smz2PiZTQL3BKTWZ8TYXFSWLPB?=
 =?us-ascii?Q?9koa3YvSIesEBYQngqwPSpBkmGMS4ElOLbbV/Hv5SqapoluX0rsUKVP24fOI?=
 =?us-ascii?Q?huwJvHiK8CeMVAvZvLa7C14hWM71JCrwy+h4lSuLqoitZVFOxw45aycESZrE?=
 =?us-ascii?Q?GqmWpEpGTKPw9pLIB4yrH79Zm2y3HsXby6Tf08pMlI/M0EMrnDyQTmwTKbIv?=
 =?us-ascii?Q?eOVguyEUaSCnwZXgDlQT4h0J9xBCcj9GI2gUvNh12Mz4xqhMJqiPsMEkFS66?=
 =?us-ascii?Q?pkuj8MMbwL34yj5XffUqzUUYlcKA2OtMguyupKrhp1mimlOCKjOilc63ypJ7?=
 =?us-ascii?Q?qDV28TBZVUtt6VrpE605Z+vTeU/fCSQJU+mTo7lTjOWjdJOB1tE2oUdfQtXE?=
 =?us-ascii?Q?FSxrUbwwsuNRmEDHu6tG+0pRGLQbp1qJO4Np1uMJlKUU6HReeu2BwS33tvuQ?=
 =?us-ascii?Q?YrDoiMp8LeD5urvVxy9eq/rNjjhfij7rHxYhs55wZJnDHMz2JEYW+JWh0+Vx?=
 =?us-ascii?Q?TM0bDAC2VIQ6PKFSf67c9SEYWNkWPQf2uQqJbLLDHkZb1lXZvjZSOColtD78?=
 =?us-ascii?Q?BgfbZY5ljsYQFgrG/JVkR07FEKKZLRRSIyTk+qOxDTKqMIeV+KMgh30nqg2H?=
 =?us-ascii?Q?95Kcc4H+kOe7TzBXZpcC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aI84CD66Yg/G8beiUl2hiLEXlnpxqc6hy+vdRp9I4NVqb3irMTY75P0da+Jg?=
 =?us-ascii?Q?97Crgr9FYyqCUG5j/5rxMQxrBHO9zCbH7Prj90H4wTviki2dtKpPJyGSZ4pD?=
 =?us-ascii?Q?JIuG/iNeDL6MIfxrLIPNhLbe47rXmSHP6uPh97rbWrkuX8LD1bUH1Vi50ZBG?=
 =?us-ascii?Q?4EdaVrx5EPKtEQRKRsb27Djr6cTQJfI1j1KRr9mzYcg9VEyTpGi2t+U1XQlN?=
 =?us-ascii?Q?wZ2p9uOsDgIWwmb4q+ZdrmDfYiVyVPqckFfb9HEcjTK6hFcurqLlLZkJYvSu?=
 =?us-ascii?Q?ZeJDeJpeE9Ou53h8VP9DwDX7m/z7g+idRPlMH4mm1TmPPxNeFKR/fliPcrV3?=
 =?us-ascii?Q?7Bghz3STx3tr82luo6azCQkDMkAaeHY1mmFs0fcA89xPB81UI0iz45Q4Nhk6?=
 =?us-ascii?Q?Z2ECXUdOKDCI5uctgmVROQ3ceQWipsLYvh5z373NoDiBBglGbVprXAqce1uX?=
 =?us-ascii?Q?YSMa4LuN0eOChuPLU/joB6TPmb7GsytBWGg06pXdhhssLjCIOJuNdTMTjwK4?=
 =?us-ascii?Q?cFQ8iP3v+NITaimbF4CucMQlGMyISE56aCO7pbJsh1FyO2OUiZwMOSVdRTav?=
 =?us-ascii?Q?IUMl8rZaiyUU7D7vW/QfwIWj48X6ahZkHZ0spUqCVylJyStscFDGKgm3n+ob?=
 =?us-ascii?Q?1cxMiBYInNVJzGZzDxjl8P0LqktgzdqP6FunCd4jQmLxyQ/mOanUvvptB1oI?=
 =?us-ascii?Q?vIceY+e8VpQlsjbNvcWVjBJBpcwJ0tWOn+MAe0RdCmUr7yKrd4SB2ycRKONe?=
 =?us-ascii?Q?jxKkMTIuaehgXCRAUVxWmrkyZdmCBKaOo6Eq7iylbRarEo/jTCOWTYwLbNAs?=
 =?us-ascii?Q?Y+5l/esfxMx/OJrrodWnSHfLtckIqsOxRWOtC856MQjRVNH6LDs7yZmAeeBl?=
 =?us-ascii?Q?0zJL2RjQncis6GwKac1oRuDC9bnCeXIqI+0KtAJJKETr4EJpr0BLADkQQIow?=
 =?us-ascii?Q?fG7o8HOeZJqKXuBVPb0e7jLMo2ZOqndx+i3w1aghpbrtbPQKrZjf89Vb8hpE?=
 =?us-ascii?Q?eDHA5wCyfJbTDe/wT6emtHwotIOv0AH/Dx9Jppxbupucoe7k7+SBy6823h05?=
 =?us-ascii?Q?FgM1I31EtgXRVMNsrxp/ZAtd8gPLkWeAWTlnXVce07e5CN6FRyrXOJSMMzyi?=
 =?us-ascii?Q?o6aebv6b7zI920fXc2n4kEZpj8zDQcPJmpXTqocQtiXDOMKNuI8ecD6ZCEHA?=
 =?us-ascii?Q?W0PLILZLvG9SCvFp+P9i1l1QssJM9wJIK5m2KBxuVXyiHbRqcIAzsHsqa6GC?=
 =?us-ascii?Q?XAo2meR6bD8VkIJxvLmZUdDRsKlLL2huOPTcX4xBdcAgxGV+Z2/FIC6ckZ+d?=
 =?us-ascii?Q?zYjyZT99fMyTN8PWdh7n/BiAhvPBgZUNTl0OowT31yx2P+iT/CTTEHE9AXrn?=
 =?us-ascii?Q?Xu0HxP3tyxdY9mEQbinA+TMOU7gViNg2zcCHBqB0cIO2RIZViz6Y1tUdQSTB?=
 =?us-ascii?Q?sNJ5kpZj4AltSaxaplsWq6BWOpp1yv3JoYUfYGBCGSNGu8kywHn/6EjuZegt?=
 =?us-ascii?Q?nbPFgoR+xzMunyeoLS1VVY2cvU+0OnP+E3z/kd0PRHE4G4RkjLkLdHjFxDdu?=
 =?us-ascii?Q?MqFi87l9TWJ/kIa2UBB8baP+xuZaaRi96a5WkBjuELTWkFFD6yCsP++5RcLS?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f028e4-06d2-4c4c-320f-08dd07dcc2a3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 14:24:50.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPxpwCuPV1TXcPIsicXq6sNaR/frA5VurNXDSpcYdTgKbEH+P7aEgmuqx8i7ugBTuaRADchkaJJcZuM7HPWpJSQ+hLf8w3CruqwgR/Jg/w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
X-OriginatorOrg: intel.com

On Mon, Nov 04, 2024 at 12:18:07PM +0000, Alasdair McWilliam wrote:
> On 04/11/2024 07:11, Larysa Zaremba wrote:
> 
> >> It's been a minute since I've looked at this due to other commitments
> >> but accidentally bumped into the fault again when testing the latest 6.6
> >> LTS for a new feature of our software. (I forgot to revert the commit
> >> for "ice: remove af_xdp_zc_qps bitmap" in our build system.)
> >>
> >> This led me to wonder about the current version, and can trigger the
> >> same crash on 6.11.5 [3].
> >>
> >> Reverting "ice: remove af_xdp_zc_qps bitmap" [1] in the current mainline
> >> is a little more complicated as commit ebc33a3f8d0a ("ice: improve
> >> updating ice_{t,r}x_ring::xsk_pool") also changes things a little so the
> >> reversion doesn't work cleanly.
> >>
> >> I have tweaked everything a little the below patch [2] applies cleanly
> >> to 6.11.5 and 6.12-rc5 and seems to fix the fault.
> >>
> >> Thought I'd bubble this up as it's definitely still an issue in the
> >> mainline kernel as of now.
> >>
> >> Thanks
> >> Alasdair
> >>
> > 
> > Hello,
> > Could you please share the reproduction steps? I will look into this.
> 
> Hello,
> 
> I should probably have provided better steps to reproduce - apologies.
> 
> Our stack uses AF_XDP in zero copy mode with shared UMEM between XSK
> sockets.

Thanks! Just letting you and anyone interested know that I was able to reliably 
reproduce the issue and have found the root cause. Hopefully, will be able to 
send the exact fix soon.

> 
> To isolate other bugs in the past we've used a modified xdpsock app
> based on code previously in kernel samples. The original sample has
> since been taken out the kernel repo, but we maintained the modified
> version in our public repos here [1].
> 
> There's lots in the readme but suffice to say if you run the build.sh
> with bash, it will compile xdpsock_multi user-space app and accompanying
> xdpsock_multi.bpf eBPF app. You'll also need to necessary dependencies
> libxdp/libbpf et al.
> 
> I can reproduce the issue with this app using 8 channels. It can fault
> in two ways (step C or D) below.
> 
> Terminal 1:
> 
> A# ethtool -L <nic> combined 8
> B# ./xdpsock_multi --l2fwd --interface ice1_1 --zero-copy --channels 8
> 
> Terminal 2:
> 
> C# kill -9 $(pidof xdpsock_multi)
> D# ip link set dev <nic> xdp off
> 
> Sometimes the act of killing the process (step C) causes a kernel crash [2].
> 
> Other times, it may survive, leaving an orphaned XDP program attached to
> the NIC. Unloading this manually (step D) causes a kernel crash [3].
> 
> Stack traces are actually different so hence I've provided both.
> 
> Affects:
> 6.1.x
> 6.6.x
> 6.11.x
> 
> Hardware is E810-CQDA2
> Firmware is 3.20 0x8000d83e 1.3146.0
> 
> Let me know if you need anything further.
> 
> Thanks!
> Alasdair
> 
> 
> [1] https://github.com/OpenSource-THG/xdpsock-sample
> 
> [2] Kernel crash triggered by step C
> 
> [  220.921136] BUG: unable to handle page fault for address:
> ffffa3eee1637f14
> [  220.921175] #PF: supervisor write access in kernel mode
> [  220.921196] #PF: error_code(0x0002) - not-present page
> [  220.921217] PGD 100000067 P4D 100000067 PUD 100238067 PMD 0
> [  220.921244] Oops: Oops: 0002 [#1] PREEMPT SMP PTI
> [  220.921267] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Kdump: loaded
> Tainted: G            E
> 6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
> [  220.921315] Tainted: [E]=UNSIGNED_MODULE
> [  220.921331] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
> 3.2 12/16/2019
> [  220.921357] RIP: 0010:ice_clean_rx_irq_zc+0xde/0x7d0 [ice]
> [  220.921489] Code: 0f 84 d0 01 00 00 44 3b 7c 24 08 0f 84 a1 02 00 00
> 48 8b 53 38 41 0f b7 4d 04 4c 8b 24 c2 89 c8 81 e1 ff 3f 00 00 66 25 ff
> 3f <41> c7 44 24 34 00 00 00 00 49 8b 74 24 18 48 8d 96 00 01 00 00 49
> [  220.921518] RSP: 0018:ffffa3eec64d0d88 EFLAGS: 00010206
> [  220.921529] RAX: 000000000000014d RBX: ffff89bbc2aa2a00 RCX:
> 000000000000014d
> [  220.921542] RDX: ffff89b408830000 RSI: 0000000000000040 RDI:
> ffff89bbc2aa2a00
> [  220.921554] RBP: 0000000000000000 R08: 0000000000000000 R09:
> ffff89b407655000
> [  220.921566] R10: 0000ffffffffffff R11: ffffa3eec64d0ff8 R12:
> ffffa3eee1637ee0
> [  220.921578] R13: ffff89b414710000 R14: ffff89bbc7919500 R15:
> 0000000000000000
> [  220.921591] FS:  0000000000000000(0000) GS:ffff89bb5fc80000(0000)
> knlGS:0000000000000000
> [  220.921605] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  220.921616] CR2: ffffa3eee1637f14 CR3: 00000001d9820006 CR4:
> 00000000001706f0
> [  220.921628] Call Trace:
> [  220.921639]  <IRQ>
> [  220.921647]  ? __die+0x20/0x70
> [  220.921663]  ? page_fault_oops+0x80/0x150
> [  220.921676]  ? exc_page_fault+0xcd/0x170
> [  220.921690]  ? asm_exc_page_fault+0x22/0x30
> [  220.921707]  ? ice_clean_rx_irq_zc+0xde/0x7d0 [ice]
> [  220.921759]  ? ice_clean_tx_irq+0x166/0x3c0 [ice]
> [  220.921808]  ice_napi_poll+0xb2/0x2a0 [ice]
> [  220.921858]  __napi_poll+0x2c/0x1b0
> [  220.921870]  net_rx_action+0x30d/0x3e0
> [  220.921881]  ? __raise_softirq_irqoff+0x18/0x80
> [  220.921896]  ? __napi_schedule+0xa6/0xc0
> [  220.921907]  ? ice_msix_clean_rings+0x4f/0x60 [ice]
> [  220.921959]  handle_softirqs+0xf0/0x2e0
> [  220.921972]  __irq_exit_rcu+0x80/0xe0
> [  220.921983]  common_interrupt+0xb7/0xd0
> [  220.921995]  </IRQ>
> [  220.922001]  <TASK>
> [  220.922008]  asm_common_interrupt+0x22/0x40
> [  220.922022] RIP: 0010:cpuidle_enter_state+0xc8/0x420
> [  220.922034] Code: 0e b6 3e ff e8 09 ee ff ff 8b 55 04 49 89 c5 0f 1f
> 44 00 00 31 ff e8 97 69 3d ff 45 84 ff 0f 85 38 02 00 00 fb 0f 1f 44 00
> 00 <45> 85 f6 0f 88 6a 01 00 00 49 63 d6 4c 2b 2c 24 48 8d 04 52 48 8d
> [  220.922061] RSP: 0018:ffffa3eec4377e78 EFLAGS: 00000246
> [  220.922072] RAX: ffff89bb5fc80000 RBX: 0000000000000004 RCX:
> 000000000000001f
> [  220.922085] RDX: 0000000000000005 RSI: ffffffffb255a8a3 RDI:
> ffffffffb2533173
> [  220.922098] RBP: ffff89bb5fcc0cc8 R08: 000000336fecb8ce R09:
> 0000000000000018
> [  220.922109] R10: 000000000000453f R11: ffff89bb5fcb47e4 R12:
> ffffffffb32bdce0
> [  220.922121] R13: 000000336fecb8ce R14: 0000000000000004 R15:
> 0000000000000000
> [  220.922135]  ? cpuidle_enter_state+0xb9/0x420
> [  220.922147]  cpuidle_enter+0x29/0x40
> [  220.922161]  cpuidle_idle_call+0x100/0x170
> [  220.922175]  do_idle+0x7d/0xd0
> [  220.922185]  cpu_startup_entry+0x25/0x30
> [  220.922195]  start_secondary+0x116/0x140
> [  220.922206]  common_startup_64+0x13e/0x141
> [  220.922222]  </TASK>
> [  220.922229] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
> nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
> nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
> nft_chain_nat(E) nf_nat(E) nf_conntr
> ack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E)
> nf_tables(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
> intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
> intel_powerclamp(E) coretemp(E) kvm
> _intel(E) ipmi_ssif(E) kvm(E) iTCO_wdt(E) intel_pmc_bxt(E)
> iTCO_vendor_support(E) rapl(E) intel_cstate(E) ast(E) intel_uncore(E)
> drm_shmem_helper(E) pcspkr(E) drm_kms_helper(E) i2c_i801(E) mei_me(E)
> i2c_mux(E) mxm_wmi(E) mei(E
> ) i2c_smbus(E) lpc_ich(E) ioatdma(E) acpi_power_meter(E) ipmi_si(E)
> acpi_ipmi(E) ipmi_devintf(E) ipmi_msghandler(E) joydev(E) acpi_pad(E)
> drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E)
> crct10dif_pclmu
> l(E) crc32_pclmul(E) libahci(E) crc32c_intel(E) polyval_clmulni(E)
> polyval_generic(E) igb(E) libata(E) ghash_clmulni_intel(E)
> [  220.922280]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
> dm_region_hash(E) dm_log(E) dm_mod(E)
> [  220.922416] CR2: ffffa3eee1637f14
> 
> [3] Kernel crash triggered by step D
> 
> [  894.619896] BUG: unable to handle page fault for address:
> ffffb5818c2d7f14
> [  894.619921] #PF: supervisor read access in kernel mode
> [  894.619932] #PF: error_code(0x0000) - not-present page
> [  894.619942] PGD 100000067 P4D 100000067 PUD 100237067 PMD 0
> [  894.619957] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> [  894.619970] CPU: 5 UID: 0 PID: 2540 Comm: ip Kdump: loaded Tainted: G
>            E      6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
> [  894.619994] Tainted: [E]=UNSIGNED_MODULE
> [  894.620002] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
> 3.2 12/16/2019
> [  894.620014] RIP: 0010:ice_xsk_clean_rx_ring+0x37/0x110 [ice]
> [  894.620086] Code: 55 53 48 83 ec 08 44 0f b7 af a4 00 00 00 0f b7 af
> a2 00 00 00 66 41 39 ed 74 33 48 89 fb 48 8b 4b 38 41 0f b7 c5 4c 8b 34
> c1 <41> f6 46 34 01 75 30 4c 89 f7 41 83 c5 01 e8 f6 5c c6 da 31 c0 66
> [  894.620113] RSP: 0018:ffffb58189c376d8 EFLAGS: 00010293
> [  894.620124] RAX: 0000000000000000 RBX: ffff92f681f6b800 RCX:
> ffff9302f2860000
> [  894.620136] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> ffff92f681f6b800
> [  894.620148] RBP: 00000000000007ff R08: 000000000000081f R09:
> 0000000000000000
> [  894.620159] R10: ffff92f684dc0000 R11: 0000000000000020 R12:
> 0000000000000010
> [  894.620171] R13: 0000000000000000 R14: ffffb5818c2d7ee0 R15:
> ffff92f681fcd740
> [  894.620183] FS:  00007f7ee9e27740(0000) GS:ffff92fd9fc80000(0000)
> knlGS:0000000000000000
> [  894.620196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  894.620206] CR2: ffffb5818c2d7f14 CR3: 000000010e25e003 CR4:
> 00000000001706f0
> [  894.620218] Call Trace:
> [  894.620228]  <TASK>
> [  894.620236]  ? __die+0x20/0x70
> [  894.620254]  ? page_fault_oops+0x80/0x150
> [  894.620268]  ? exc_page_fault+0xcd/0x170
> [  894.620283]  ? asm_exc_page_fault+0x22/0x30
> [  894.620298]  ? ice_xsk_clean_rx_ring+0x37/0x110 [ice]
> [  894.620350]  ice_clean_rx_ring+0x16e/0x190 [ice]
> [  894.620401]  ice_down+0x2f8/0x3c0 [ice]
> [  894.620443]  ice_xdp_setup_prog+0x193/0x460 [ice]
> [  894.620485]  ice_xdp+0x7a/0xb0 [ice]
> [  894.620527]  ? __pfx_ice_xdp+0x10/0x10 [ice]
> [  894.620567]  dev_xdp_install+0xc7/0x100
> [  894.620584]  dev_xdp_attach+0x205/0x5d0
> [  894.620597]  do_setlink+0x7d3/0xc20
> [  894.620611]  ? __nla_validate_parse+0x125/0x1d0
> [  894.620626]  __rtnl_newlink+0x4f7/0x630
> [  894.620639]  ? __kmalloc_cache_noprof+0x225/0x2b0
> [  894.620652]  rtnl_newlink+0x44/0x70
> [  894.620662]  rtnetlink_rcv_msg+0x15c/0x410
> [  894.620676]  ? __rmqueue_pcplist+0x5f/0x2c0
> [  894.620686]  ? __rmqueue_pcplist+0x5f/0x2c0
> [  894.620695]  ? avc_has_perm_noaudit+0x67/0xf0
> [  894.620708]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
> [  894.620721]  netlink_rcv_skb+0x57/0x100
> [  894.620735]  netlink_unicast+0x246/0x370
> [  894.620747]  netlink_sendmsg+0x1f6/0x430
> [  894.620758]  ____sys_sendmsg+0x3be/0x3f0
> [  894.620771]  ? import_iovec+0x16/0x20
> [  894.620783]  ? copy_msghdr_from_user+0x6d/0xa0
> [  894.620795]  ___sys_sendmsg+0x88/0xd0
> [  894.620807]  ? __mod_memcg_lruvec_state+0xce/0x1c0
> [  894.620822]  ? mod_objcg_state+0xc9/0x2f0
> [  894.620833]  __sys_sendmsg+0x59/0xa0
> [  894.620844]  ? syscall_trace_enter+0xfb/0x190
> [  894.620856]  do_syscall_64+0x60/0x180
> [  894.620867]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  894.620881] RIP: 0033:0x7f7ee9d0f917
> [  894.620891] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f
> 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f
> 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> [  894.620920] RSP: 002b:00007ffd0b9a9e58 EFLAGS: 00000246 ORIG_RAX:
> 000000000000002e
> [  894.620935] RAX: ffffffffffffffda RBX: 000000006728b03b RCX:
> 00007f7ee9d0f917
> [  894.620948] RDX: 0000000000000000 RSI: 00007ffd0b9a9ec0 RDI:
> 0000000000000003
> [  894.620959] RBP: 0000000000000000 R08: 0000000000000001 R09:
> 0000000000000078
> [  894.620971] R10: 000000000000009b R11: 0000000000000246 R12:
> 0000000000000001
> [  894.620983] R13: 00007ffd0b9a9f70 R14: 0000000000000000 R15:
> 000055784e873040
> [  894.620997]  </TASK>
> [  894.621004] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
> nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
> nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
> nft_chain_nat(E) nf_nat(E) nf_conntr
> ack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E)
> nf_tables(E) libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
> intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
> intel_powerclamp(E) coretemp(E) kvm
> _intel(E) ipmi_ssif(E) iTCO_wdt(E) intel_pmc_bxt(E) kvm(E)
> iTCO_vendor_support(E) rapl(E) ast(E) mei_me(E) intel_cstate(E)
> intel_uncore(E) drm_shmem_helper(E) pcspkr(E) i2c_i801(E) i2c_mux(E)
> drm_kms_helper(E) mei(E) mxm_wmi(E
> ) lpc_ich(E) i2c_smbus(E) ioatdma(E) acpi_power_meter(E) ipmi_si(E)
> acpi_ipmi(E) ipmi_devintf(E) ipmi_msghandler(E) joydev(E) acpi_pad(E)
> drm(E) fuse(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E)
> crct10dif_pclmu
> l(E) crc32_pclmul(E) crc32c_intel(E) libahci(E) polyval_clmulni(E)
> polyval_generic(E) igb(E) libata(E) ghash_clmulni_intel(E)
> [  894.621056]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
> dm_region_hash(E) dm_log(E) dm_mod(E)
> [  894.621193] CR2: ffffb5818c2d7f14

