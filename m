Return-Path: <xdp-newbies+bounces-161-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E009BACFF
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Nov 2024 08:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01663282181
	for <lists+xdp-newbies@lfdr.de>; Mon,  4 Nov 2024 07:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F35191F6E;
	Mon,  4 Nov 2024 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IerqUXbN"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE316190C;
	Mon,  4 Nov 2024 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730704298; cv=fail; b=SK3aGcma2ZRxbFSB922/FD3bdk6SDXvn8s8mUZTWrgLOif0Guj6H1fLiqsvba3mER1lX0ZoHaUdv31AivYtrgOIIbbrC2wDEzkCKRtMXoaE/q4SIVXy5P8lUyK92dDKw14jnhAUx3li42uZcsI+RtFyg8likGTq6rkYiWg35lP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730704298; c=relaxed/simple;
	bh=eXfh4Hdj8NO2n4TI+AesAUGWovAi8Z590cRhrOcvH6M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PDRjx7lsUdIjdJvNkiuAZOl6mPfSjuUoGoT4LYVZ68Lc2/aDd7YFnaDZAAEcG1hyi454+5lH5dHXPWuodGnCcsYdNvt0v2EzWNrMppmLKrXkCI3Ldimp3Cct6uyE29v3F+eTzvmcGSxIdFZawXMBY6y2tFlLOTc32SKK3a6Balw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IerqUXbN; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730704296; x=1762240296;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eXfh4Hdj8NO2n4TI+AesAUGWovAi8Z590cRhrOcvH6M=;
  b=IerqUXbNqNGApYzKq1L/bIyZRC5a3frlhJclt9/BwFYZj+5YkCWJ7583
   6evZg10+dkvmMi1HRvbMlrO37/uYItz3N26SzSMbkbFKNxY1lcn6JGyZ+
   VecZPDj68cT1lc7Xq5kzmk0JPdSrcxpBPfJK60V1Yz0yogfs1jPs+GAM7
   7mn0TbwMLr1h4cU1rR7PscyM75DOHaR7zhS9RyLJ02wfqOqWIsgtROpBF
   eMMQK2gKAC5lck+K71L/OW4GDwqU74I2TqILqy8YK6rCTQOrApk56IQJf
   3ejgJGnMrnCZPHBR4A650999dD5ZtPDFyFcqIXNUNdyjFRxJXzWfRUdGa
   Q==;
X-CSE-ConnectionGUID: GpZmKTl4SqC0cko6haKEvA==
X-CSE-MsgGUID: lQ6MyqxzQ0ytOYg/ykD5LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="55786544"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="55786544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:11:36 -0800
X-CSE-ConnectionGUID: /QMw92uVT+iBVRt1oLqEEQ==
X-CSE-MsgGUID: +wEc0aRaQk+x+VPNCv1HsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88382203"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Nov 2024 23:11:36 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Nov 2024 23:11:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 3 Nov 2024 23:11:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 23:11:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI1AL0ZgswSHTWJW7dDEkaWU86Wx8BTdOAmOAzQWuaQG38VxM6uBHGIK1uoHtNAryk6kXnTF8ilyRlc/JnWExTiyuJNBbEFL5cw6AhRu0rZkPFWyD1dTrKhuL5uzVcU4pHon9xVe44ZqvFRaB3jcitxwAeQyv0Z8fVKAowWslvKc8hrFoUCIPt0K+Ssseba3QWYDQLgncwVef+PC8pqFn2j8iZuo48wrvg21y3JdLKPbXvEIoIyXTpYvDNhmk5TdYlBPeC5F3fjAlCTK5og/4g5U14ZCAmyRlMjsClmkipDZGJiiebApLaD8VE1xgg67bJtZSLMTeq731tF7UAKlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce3mTJX3zl2tzzsa5lZzSy0GH9b2nF5KfQikUXL/BIg=;
 b=CNbeNxZuyU82AqCE+JgxGex46igL+i1SYtxIwL9k8E8IAi3cJ7V67LTfdoPwQKjTuBHxzoJgaQUpXlALgkR1S5OqIQFlC7mYGmPckx0S/59DApqRAJVfIwqWhFvHckxbxHg9NIwN8I5vsmrQR5fAi3HvIWDSDV22gZc0Ksq8T8dU1iXzRQo+hs3SRmZ+VWCHJfQWcuwKquOboxIHhkQcDCSh7BN7rYyZkTufd8qRLUlQFmVXEqtekuiiaor9obO8kKII1oyPT+C3Z54Eet62da7ut0GY0EHfPYTTWc3koMNN1dyvT8rWqkEM1VyqP1cNCIo10xE09Gj8B0F9QZ3xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 07:11:32 +0000
Received: from SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29]) by SN7PR11MB7540.namprd11.prod.outlook.com
 ([fe80::399f:ff7c:adb2:8d29%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:11:32 +0000
Date: Mon, 4 Nov 2024 08:11:26 +0100
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
CC: Thorsten Leemhuis <linux@leemhuis.info>, Maciej Fijalkowski
	<maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@gmail.com>,
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>, "Linux kernel
 regressions list" <regressions@lists.linux.dev>, Jacob Keller
	<jacob.e.keller@intel.com>, netdev <netdev@vger.kernel.org>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Message-ID: <ZyhznlGIjio3saic@lzaremba-mobl.ger.corp.intel.com>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <30bd4ecb-961b-404a-ac3d-9c25c8269e4d@leemhuis.info>
 <PA4P194MB10059D2195A387ACD32CA27E86562@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PA4P194MB10059D2195A387ACD32CA27E86562@PA4P194MB1005.EURP194.PROD.OUTLOOK.COM>
X-ClientProxiedBy: ZR2P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::16) To SN7PR11MB7540.namprd11.prod.outlook.com
 (2603:10b6:806:340::7)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7540:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: ba70db0f-61c3-4b6f-955d-08dcfc9fe93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w556EiTJlDHJkMGTsIDHjIBZnO0YspfTsKZNys9TMphln1aKZBnzugahCXzm?=
 =?us-ascii?Q?t8aPFLTN4/syvf+kWn/qAOy5YrIsKVttji35GSNSbFmCfbOP0BCo7NDeDAvA?=
 =?us-ascii?Q?HEHHTYfkPLhNbYmzUzkmO6wFRKO5ADxcHZpq6YNq5yntq3aju/fLjbpssbxw?=
 =?us-ascii?Q?iXGFySAE+6pkCu5vrBzHsltik/OZ3RPSXKqu2G2r5pv/QEnSx34BWXNCJ2pe?=
 =?us-ascii?Q?4f834Iq3v/5dX7eKTJ1TZD7hA433lli1DMvcjjLokA9vEkSHjU2Covrm0pgB?=
 =?us-ascii?Q?shLpUASL25veApiOMdQIu5/QycmqZVs95C5luJZESqnGuCDPuEdM6bxi5POV?=
 =?us-ascii?Q?+b2Ct9nBp+k4XbsEtAfNoD/z3vZGQh4535eYk8tT6C5aUT89juyuPYjWnTXc?=
 =?us-ascii?Q?qeAzxtg8u0UapEHE3Onm0vK5lGly9BHnhSgZkya2IbMtRe1FpH6cxmMWSIuc?=
 =?us-ascii?Q?uywIxaLiOhorN7lFQ/bvWJhVmC2WjL3UYdzwFf1Had3K/nnjTrcn6WX5EiAs?=
 =?us-ascii?Q?r0KbWc4FF7eL0hTkSvYk9nTkI8XDSSwnnCRi2F00kGCbxUMFrTdbulwMTBep?=
 =?us-ascii?Q?Ip6x/lf4wGjhzJeE6DvvGJTIQMXrHYUeNA1hxMxZL15itUZdgWHgsG2SYr34?=
 =?us-ascii?Q?cvRhHe4FNi/6EV7YKr/xQwUJcsoHI2SsBWQgQ/Q9ndUCgUUkBevVlz2dox1N?=
 =?us-ascii?Q?fvE06/pyNngxzirXJE07pmuzps3YvFM4DDKoGJ9tf5bWYQg8pa3a4QQMdCeT?=
 =?us-ascii?Q?376Ay0gszd/8jLpC1uDx5gxpCrzL95mwv/1bsb43ZpRxGeIx9wrgalRZwfHq?=
 =?us-ascii?Q?oG1d6M8FTW0D9GHQRHSEsyUaZ+NZR6NanwyDyZEIj33yT130ckZfXaB/Tzv3?=
 =?us-ascii?Q?Kx4iUMxZN3qRV+0M1vIqkEsCEwoLswz13ivjiQa6JYJhdFo4VZ6l51yf1RU0?=
 =?us-ascii?Q?Wfhbi7JoNZkSOJB4Iu18AdYqm8NUlnHGUKepctTTjGx6ObSssgabH8g5OKiW?=
 =?us-ascii?Q?TeFR+XDlwX0LPKWdKqwvIxdGSHLo5GiCpBrzSpHFyIB4Y6N+iTHiVjAeHrdK?=
 =?us-ascii?Q?o+mfRuRHHvKI62HhhjMC3sCwzhRa+AQP9SQRBjx9nkgiGl22SO3DO6/H1zhu?=
 =?us-ascii?Q?R++WuHYb1LIrLKQ848Y/WsKsA/CMhm4TIo1vluaptvJ+ecdq/sB/DVASN6t3?=
 =?us-ascii?Q?ycaJ6ATrFppQw5NR94IkQjg9eTkLV2b3EnNSh6zBWxlq26C5QTNSdbp4Djzw?=
 =?us-ascii?Q?uTSA3VumYNWsOq7+/1WK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7540.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUWSyloMNTpkWe++8bKSt2YPWreVFtZLzY297n5TX+iWk2HPRtwDcI9QkNOr?=
 =?us-ascii?Q?uhYlWUpEcxrNGUMJDkKG/wLQJ5sB20XfIx1/Ngr5hpPLjXYiVKqIvM++vwZC?=
 =?us-ascii?Q?H4C40hk5gvpDoA+ug3wrgg080nEzLAQijjFN18aQJgfZE0JTp5myVkvP1I9W?=
 =?us-ascii?Q?A1Y+MFIPnAk9dgyE3TFn6RAfS0UVkd0MGrMyhXi0PaBvukJrRG1AyyY6T8FB?=
 =?us-ascii?Q?QOgFAAwdaFV31cggxqm1xTHdALQ7f+RS+giaZW1zGe2ower4prKp77ws9uoD?=
 =?us-ascii?Q?HU/kar2tjJ4jwAWkP62buko293BwhrJ1W5mQx5Yt3KP0ZSVvgzwDAS9b0yfn?=
 =?us-ascii?Q?4p59tge/ZM0Iq+suPacKW4+po/hRU1LpYWJ3hWAjtI263SmSUwZM32Hh1BIH?=
 =?us-ascii?Q?X9Di7kWCEJnJ4tyrVgWHq3IofdaJTJmQWRARU2ugfG56oy8gEsOe6oaY3VB3?=
 =?us-ascii?Q?/PlLipXW/p/7j8Tbq0nN6TzRDvF3xXGhLjo/Qwi7aVXBubIn1wKZNLgDZ2Z1?=
 =?us-ascii?Q?MLsArDlXYnR23TEH4xPFf/QLhcdzJ2qMfv236eRnRdsaq6Z8Ueuvltv7B0EF?=
 =?us-ascii?Q?hwsscMd04zSESEpcp7ltpcHcvNbr4kwjOqJFhSebPTeuO6vDz0BLPyxwu52Q?=
 =?us-ascii?Q?MmfdhKkY14HTNcKMR+9JAZ9cvQncT4FpWcZr7RRDjhTJCm+xveAhLIPQB6es?=
 =?us-ascii?Q?X7uhvs5QKAjar1XUhCTX96XZqaynpCU6XtQmbbGUVKDMlx3osOtIcIuw8hfG?=
 =?us-ascii?Q?kVcewhpk6tCpwCj37kj7ZLTI/VryjJ/Cso3EDBj53q0lJ+5hUSw3qvHzfglc?=
 =?us-ascii?Q?Xh4CD1mr3Y12bK6isQH6S2dYD3US+d2MGaBNcuGRSt0S8T+BV9cvl3YvuxGG?=
 =?us-ascii?Q?Q0HbhtSogMSZg9O7T+Uxb/cmu4TreGkrz8oklmMcPsYLobY4jkuHVd5K6n6s?=
 =?us-ascii?Q?U+xfqWx5AsfG4+kb57D7goQp70pt8OzLg0Qmi4OWt1KjTJc/WhWSAnr/7SOb?=
 =?us-ascii?Q?nN2sAuIElotcck9JgPI1l1BjyUDEr7jeptOj/NDJ4AooqZMQMqqOQcHhJyKh?=
 =?us-ascii?Q?BSUpIORdeAyFFR2Z54RDao3/FG5pCeDggMymbERw8khf1GjVXpKrkL341xTL?=
 =?us-ascii?Q?5LSeoY5z1ssnOGXS59XHPHJtXJs6msfFaU+2H5bL0Fkcfi5G96v5D1WtT+KY?=
 =?us-ascii?Q?eDVAQ/6JttY+3mJMCPpfu734Ee59ZjOyxN/Gx/y6kXNw4dISRsMqKBY4FsDX?=
 =?us-ascii?Q?6Bw2X5+e/CwOWO/4YSqNYiWCJ3SDNat4I/EOYu4sZUJfGl82zvBUKQKtmwO/?=
 =?us-ascii?Q?gpzseorZeDXSLIDguk0VCefZVkCWfr3OJQ5B4GMnzY/gfV5e2j57z9LC7/B7?=
 =?us-ascii?Q?/KqSYbWWUQ1N8oLUw0heUKx4AL6V0Cq8xsQJRGgqiuLTv6lSGDrOlxLdngI/?=
 =?us-ascii?Q?5Csv+X6zLXATf3TZSy9gRfNgU/kmiqiNJzryZnDZ/jxalcONJln/OSn3bbV8?=
 =?us-ascii?Q?EKR2bhEghbrM/V6MHmbT1r1vLk2uraYmkA/C6d8BLH7ickNWKc9Cj6WtVv9f?=
 =?us-ascii?Q?u7MeyoDnD0X2X8fHlrZcjs7fuE4eeHi8n0xdVM2hW26wKsAIHTX3xC+qb4Bj?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba70db0f-61c3-4b6f-955d-08dcfc9fe93b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7540.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 07:11:32.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2Pkku23gl91U/gmE8Y4rTY6izYCHx3Otz3ygCccOvRPE53EEOpmegeHJlzkwFdUOKSz3BS6IYtpAT/wWwTQeFdV2hFGNr2u5LegAZQpXJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-OriginatorOrg: intel.com

On Fri, Nov 01, 2024 at 12:37:41PM +0000, Alasdair McWilliam wrote:
> Good day,
> 
> On 27/09/2024 12:32, Thorsten Leemhuis wrote:
> 
> > [CCing a few people that were involved in mainlining the culprit
> > (8adbf5a42341f6e ("ice: remove af_xdp_zc_qps bitmap") in case they want
> > to provide advice]
> > 
> > On 13.09.24 17:54, Alasdair McWilliam wrote:
> >> On 05/09/2024 13:50, Alasdair McWilliam wrote:
> >>
> >>>> We've been working recently on somewhat related issues and it looks like
> >>>> not every commit from [0] has been backported.
> >>>>
> >>>> $ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
> >>>> 5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
> >>>> 8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
> >>>> 15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
> >>>> 3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's
> >>>>
> >>>> can you apply the rest of it on top of 6.1.107 and see the result?
> >>
> >>> The first one I've attempted doesn't apply cleanly to 6.1.107.
> >>>
> >>> Eg: d59227179949 ("ice: modify error handling when setting XSK pool in
> >>> ndo_bpf"). The above looks to have been based on code from around 6.8 or
> >>> 6.9 where the makeup of routines like ice_qp_ena() has changed. Looks
> >>> like this happened around a292ba981324 ("ice: make ice_vsi_cfg_txq()
> >>> static").
> >>>
> >>> Should I try and apply a292ba981324 as well?
> >>
> >> I just wondered if there was perhaps any further feedback on the above.
> > 
> > Hmmm. No reply afaics -- but that's how it is sometimes with
> > stable/longterm kernels series, as mainline developers are not required
> > to participate in their development.
> > 
> > Still it would be good to fix the problem. So unless the developers come
> > up with plan, it might be best to just revert a62c50545b4d in 6.1.y;
> > guess asking Greg to do so might be best way ahead unless some solutions
> > comes into sight within a few days.
> >
> 
> It's been a minute since I've looked at this due to other commitments
> but accidentally bumped into the fault again when testing the latest 6.6
> LTS for a new feature of our software. (I forgot to revert the commit
> for "ice: remove af_xdp_zc_qps bitmap" in our build system.)
> 
> This led me to wonder about the current version, and can trigger the
> same crash on 6.11.5 [3].
> 
> Reverting "ice: remove af_xdp_zc_qps bitmap" [1] in the current mainline
> is a little more complicated as commit ebc33a3f8d0a ("ice: improve
> updating ice_{t,r}x_ring::xsk_pool") also changes things a little so the
> reversion doesn't work cleanly.
> 
> I have tweaked everything a little the below patch [2] applies cleanly
> to 6.11.5 and 6.12-rc5 and seems to fix the fault.
> 
> Thought I'd bubble this up as it's definitely still an issue in the
> mainline kernel as of now.
> 
> Thanks
> Alasdair
> 

Hello,
Could you please share the reproduction steps? I will look into this.

Larysa

> [1] Commit adbf5a42341f6ea038d3626cd4437d9f0ad0b2dd
> 
> [2]
> https://github.com/OpenSource-THG/kernel-patches/tree/main/2024-11-ice-xskzc-page-fault
> 
> [3] 6.11.5 ooops
> 
> [  565.069120] BUG: unable to handle page fault for address:
> ffffa566707380c4
> [  565.069144] #PF: supervisor read access in kernel mode
> [  565.069155] #PF: error_code(0x0000) - not-present page
> [  565.069167] PGD 100000067 P4D 100000067 PUD 20ef17067 PMD 0
> [  565.069183] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> [  565.069195] CPU: 7 UID: 0 PID: 6967 Comm: tlndd.bin Kdump: loaded
> Tainted: G            E
> 6.11.5-1.thg.836e8867d7.241031.135507.el9.x86_64 #1
> [  565.069220] Tainted: [E]=UNSIGNED_MODULE
> [  565.069228] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS
> 3.2 12/16/2019
> [  565.069241] RIP: 0010:ice_xsk_clean_rx_ring+0x37/0x110 [ice]
> [  565.069338] Code: 55 53 48 83 ec 08 44 0f b7 af a4 00 00 00 0f b7 af
> a2 00 00 00 66 41 39 ed 74 33 48 89 fb 48 8b 4b 38 41 0f b7 c5 4c 8b 34
> c1 <41> f6 46 34 01 75 30 4c 89 f7 41 83 c5 01 e8 f6 0c 7e ce 31 c0 66
> [  565.069365] RSP: 0018:ffffa5660f8f36d8 EFLAGS: 00010293
> [  565.069375] RAX: 0000000000000000 RBX: ffff8bb105d38600 RCX:
> ffff8bb184930000
> [  565.069387] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> ffff8bb105d38600
> [  565.069400] RBP: 00000000000007ff R08: 000000000000050b R09:
> 0000000000000000
> [  565.069411] R10: ffff8bb10f910000 R11: 0000000000000020 R12:
> 0000000000000004
> [  565.069422] R13: 0000000000000000 R14: ffffa56670738090 R15:
> ffff8bb1116b5740
> [  565.069434] FS:  00007f677a5d1dc0(0000) GS:ffff8bb85fd80000(0000)
> knlGS:0000000000000000
> [  565.069447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  565.069457] CR2: ffffa566707380c4 CR3: 0000000120164005 CR4:
> 00000000001706f0
> [  565.069470] Call Trace:
> [  565.069480]  <TASK>
> [  565.069489]  ? __die+0x20/0x70
> [  565.069504]  ? page_fault_oops+0x80/0x150
> [  565.069517]  ? exc_page_fault+0xcd/0x170
> [  565.069531]  ? asm_exc_page_fault+0x22/0x30
> [  565.069546]  ? ice_xsk_clean_rx_ring+0x37/0x110 [ice]
> [  565.069598]  ice_clean_rx_ring+0x16e/0x190 [ice]
> [  565.069650]  ice_down+0x2f8/0x3c0 [ice]
> [  565.069692]  ice_xdp_setup_prog+0x193/0x460 [ice]
> [  565.069734]  ice_xdp+0x7a/0xb0 [ice]
> [  565.069774]  ? __pfx_ice_xdp+0x10/0x10 [ice]
> [  565.069813]  dev_xdp_install+0xc7/0x100
> [  565.069829]  dev_xdp_attach+0x205/0x5d0
> [  565.069841]  do_setlink+0x7d3/0xc20
> [  565.069853]  ? dequeue_skb+0x80/0x4f0
> [  565.069866]  ? __nla_validate_parse+0x125/0x1d0
> [  565.069880]  __rtnl_newlink+0x4f7/0x630
> [  565.069892]  ? __kmalloc_cache_noprof+0x225/0x2b0
> [  565.069905]  rtnl_newlink+0x44/0x70
> [  565.069915]  rtnetlink_rcv_msg+0x15c/0x410
> [  565.069928]  ? avc_has_perm_noaudit+0x67/0xf0
> [  565.069943]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
> [  565.069956]  netlink_rcv_skb+0x57/0x100
> [  565.069969]  netlink_unicast+0x246/0x370
> [  565.069980]  netlink_sendmsg+0x1f6/0x430
> [  565.069991]  ____sys_sendmsg+0x3be/0x3f0
> [  565.070003]  ? import_iovec+0x16/0x20
> [  565.070015]  ? copy_msghdr_from_user+0x6d/0xa0
> [  565.070028]  ___sys_sendmsg+0x88/0xd0
> [  565.070038]  ? __memcg_slab_free_hook+0xd5/0x120
> [  565.070050]  ? __inode_wait_for_writeback+0x7d/0xf0
> [  565.070065]  ? mod_objcg_state+0xc9/0x2f0
> [  565.070076]  __sys_sendmsg+0x59/0xa0
> [  565.070086]  ? syscall_trace_enter+0xfb/0x190
> [  565.070098]  do_syscall_64+0x60/0x180
> [  565.070111]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  565.070126] RIP: 0033:0x7f677ab0f94d
> [  565.070136] Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 0a 67
> f7 ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f
> 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 5e 67 f7 ff 48
> [  565.070164] RSP: 002b:00007ffd1e4f7a60 EFLAGS: 00000293 ORIG_RAX:
> 000000000000002e
> [  565.070178] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
> 00007f677ab0f94d
> [  565.070191] RDX: 0000000000000000 RSI: 000000001d698848 RDI:
> 000000000000000a
> [  565.070203] RBP: 000000001d5350e0 R08: 0000000000000000 R09:
> 0000000000465f98
> [  565.070215] R10: 0000000000200000 R11: 0000000000000293 R12:
> 000000001d535110
> [  565.070227] R13: 000000000051d798 R14: 000000001d698830 R15:
> 000000001d5384b0
> [  565.070240]  </TASK>
> [  565.070248] Modules linked in: bonding(E) tls(E) nft_fib_inet(E)
> nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
> nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E)
> nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_
> defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) nf_tables(E)
> libcrc32c(E) nfnetlink(E) vfat(E) fat(E) intel_rapl_msr(E)
> intel_rapl_common(E) sb_edac(E) x86_pkg_temp_thermal(E)
> intel_powerclamp(E) coretemp(E) kvm_intel(E) ipmi_ssif(
> E) kvm(E) iTCO_wdt(E) intel_pmc_bxt(E) iTCO_vendor_support(E) rapl(E)
> intel_cstate(E) intel_uncore(E) ast(E) i2c_i801(E) pcspkr(E) mei_me(E)
> drm_shmem_helper(E) mxm_wmi(E) drm_kms_helper(E) i2c_mux(E) mei(E)
> i2c_smbus(E) lpc_ich(E) ioat
> dma(E) acpi_power_meter(E) ipmi_si(E) acpi_ipmi(E) joydev(E)
> ipmi_devintf(E) ipmi_msghandler(E) acpi_pad(E) drm(E) fuse(E) ext4(E)
> mbcache(E) jbd2(E) sd_mod(E) sg(E) ice(E) ahci(E) crct10dif_pclmul(E)
> crc32_pclmul(E) crc32c_intel(E) lib
> ahci(E) polyval_clmulni(E) igb(E) polyval_generic(E) libata(E)
> ghash_clmulni_intel(E)
> [  565.070304]  i2c_algo_bit(E) dca(E) libie(E) wmi(E) dm_mirror(E)
> dm_region_hash(E) dm_log(E) dm_mod(E)
> [  565.071430] CR2: ffffa566707380c4
> 

