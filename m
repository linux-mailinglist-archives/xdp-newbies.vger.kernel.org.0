Return-Path: <xdp-newbies+bounces-132-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904A95CFBE
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2024 16:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32862858CC
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2024 14:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94923188587;
	Fri, 23 Aug 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcvrdmC1"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4179B18453E
	for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2024 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422181; cv=fail; b=FohXFOOzQiwUD5qjQebMRwRuLh/r1dYhGHPRXIHCO8U+L2ZSFqKRw/eodzGCry95mwJHtwlHYIvzYyNk40vAAiM+JDeE4qmbvTWswoNNqLklp/TpKepVPHM6FtSDsUGHDAvlY92VSNmpPQXLwpyv56AZKCVmUh1tRDKRemhmKXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422181; c=relaxed/simple;
	bh=jp7ZKu32GIPKxWQwoh/ywGyVVjzjld05MLVaiqYn0as=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VdMWQA/qZ/l7qrGV6qUeWMFFF0+iiUiKmIOLLgY+2QiKeP/ni8Wl3oTbQp6ZPEJbSYbnJsBzzMINwadL59SW5tJn/sdoov7rTNzuQ2vMOYng6a5Ju4ZOmzhZ87NMD4Tz5L8eiwbMHjgzuHe/mdmi9dlkMq3DCVHH5hwUl+EigNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcvrdmC1; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724422179; x=1755958179;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jp7ZKu32GIPKxWQwoh/ywGyVVjzjld05MLVaiqYn0as=;
  b=mcvrdmC1n6ekpwhcwHCmEFfwT+vqf+atnHoA2S7o7pnGYBRGEdBzg2ez
   lSB0KNbo9xo6rQ8IQVbCrcnfQOW4iZl6RLvYZz8s/wWx24ma2mWVni3/L
   kEKfClX2HKHuh3Ghasi0tWZ0j6AJPxTOyyMZxFWaV2IEK1ensQB0Wktqw
   dL3OE9LMk4mEoR92/IotUXATn92otf0+0BkK8ciLW6Q6DoVTe8P04KgR6
   SgpK4wj3bPKuOmgi+fApsVrt2mrJXiw7t6L7eJJMkrFAnC9jDo4J+S5TK
   DyFpdE4uNh2p9bqwyp3Z4Jnvbs+qAcAfgKA61I59o7N1c6QAzAopNdqg1
   w==;
X-CSE-ConnectionGUID: nLguc8ZrQyWSQ906YsVzUQ==
X-CSE-MsgGUID: y1joqAgwS8OZvzq0D+eYQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33459563"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33459563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:09:36 -0700
X-CSE-ConnectionGUID: xaHwCl+kRp+d6o/fz+0+BQ==
X-CSE-MsgGUID: u85VEH3yQoq5DjmA69R5rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61668082"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Aug 2024 07:09:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 07:09:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 07:09:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 07:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMtgGZQIKck3MPDRwWzFLOOAZEufNg6D4yX1D4rFReEF9Z8o5N++V3XL4E7lVIjYrkfsEiTs6CkWDm1+S+752diuwOrd+Ivz8NF0FPMpV7b8wXJKZhCBfEilsyHzrhKiqhuEI8MtO3DnnJacNTWf0J57Ne1nCO0S761cmWy1yy3JhpLcfAS2TD++LSrRMP0vErd6taEl9ohnWka042EXZxiu5FSbhJjl+TFR4HknkzkrtN3UfHBVPOKrVHLx8HA74ylsHR8tx7mi6wNtW1KX22I7pLjyNzvSl5H32OkaO3c5hwvkcg/5JWb84exG7YLV4R7zcMm2myKXh3NGP2HtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JElMqgygOXCyzYfDKlJ+RCSW+lCcEycgkrvXLzFOpkU=;
 b=lWZLOr12djZHsBjVpP7Lktigfhne5nB466Ykd2eqZ9tkaahvT1Ym31ozFe2064xSmGTXuUyocSZw/2/1dZvZyHcVVitCRRzXi5eHwaattjX7G1IFugLOQnq+Dz10znfpLfDRDt2flazIIBcLDckNMtyOSwJaenR7cXe1Wq7mrgt4M1TLIHbKM0tJw2VfeSIeMS8Gs+VDZwQ34WDnUmmbUoRl3q45WkSAMgwLjG6lxQ7COob9/laI78g7WzmqgqOueoGRMSNRRoQGdWjHHj3G360B6wJxMW2Siitl93kUjT4mDZWPpEQeEWChFhiYoH5ghm+9RQdPsAcVvDZNHW5LwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 14:09:29 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 14:09:29 +0000
Date: Fri, 23 Aug 2024 16:09:23 +0200
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Magnus Karlsson <magnus.karlsson@gmail.com>
CC: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>,
	"xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Message-ID: <ZsiYE9j5DK79h1+/@boxer>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: a0efac08-904b-4a4e-4d69-08dcc37d3437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dfv8BX7oTcxj9r6AL0qrhMFEZJ6nGzqKkepOW+zYigrrtJHqtrXt8SCTvxi4?=
 =?us-ascii?Q?biX4br94ILUixASsIoytGdtPddzbWGxRpOl4N/TczFlg5M1k50r0tu5+PKeR?=
 =?us-ascii?Q?coP1UXTPUVx0+kinStCB4b7VXMnukT2kjN4WS766Ag+AyMb2gp+rKIcxKcHq?=
 =?us-ascii?Q?zeDOmzrOr+ULO3aIzohBrabF5Bie4qJGXi+w/n8detMsXkTT5qwyJuMpI1Ol?=
 =?us-ascii?Q?/RswxL9jUnO14nW5qiOgeEoabxmlkVXRJOQJiMNJQq6VPpLI4U9/FPUXf2Dw?=
 =?us-ascii?Q?2ppo5ZaA7sfuS2MVX85+N2/Vo4DhZ5E2CDO66RYG7wLnRwIjwyr9mxSJZUvj?=
 =?us-ascii?Q?vquYYohjZFyfPuEf/pBXe58cH9KS+DzvL32Rf7CQ12ErqnnOgxz++n7EDGtK?=
 =?us-ascii?Q?/wjbYD0bGb9g8cdUPDRA/jkMIeR8aFFhLiHB6WFj9Iq+UMNL0FgixTveUbpz?=
 =?us-ascii?Q?2JGHDSfDc++A3U6xcctUNNsnSfDRxsimlLW8e6TN9AQJYfhsWncfL6z6xtI8?=
 =?us-ascii?Q?HEC2Wv/nJPc9OpZq/Y4EQNeZO3lPCA/UgcyNZERIK3ACqvY0ckbsfAJ777QA?=
 =?us-ascii?Q?hgreBQvj4R6Vp423EgfkfwSyhcnv7BD2u+9/OIyrglmup9CUQQZx2z86+M+L?=
 =?us-ascii?Q?D3Wv6VulVszHAOH9Gv87rcs0DtxoRsfFDnXLVMQ69QcxHbX8EudHjiH2cY22?=
 =?us-ascii?Q?UWKDJDgSQRFsrMFI/PRrMGq6Cg7oHqLqyveRtki9KSEsVt20oQmzmHwFOfxN?=
 =?us-ascii?Q?lOgIslQ55zbakrKvGz+PsmZjISphq0MMOLPvkKhAYTg5znn3GuqitXRJ6K1X?=
 =?us-ascii?Q?d6CN4DpcWwgxNYGEC31i4EdnWxWPY2gt9tdOP0Abpmk4rSayL2Q+bywZh7d3?=
 =?us-ascii?Q?FcP2aMwVQ3MlrvG9ml5AbeioEHFCANh05PcKJ9fXfGLykHudOcebPX5lS1O8?=
 =?us-ascii?Q?lVc/QiShqDsCL1pBF0o71N62vMwUA1i/u8kGlrT72Y32wv4yqqhHmTa5g0Mi?=
 =?us-ascii?Q?4yZyqLFnxGGImGDeKcarzMWK9TJi23ZUHhJuQhPpIrYweAC3aM5a07ief81B?=
 =?us-ascii?Q?y3ISUkFo/NzQ1tpnyOJ/3fSm2u+JbH8IxteeyystywelKou/XSR6jwLRrFHP?=
 =?us-ascii?Q?I8jJnJiDtRrLlc06NMdWQxrT/iFQy2uzKUzxJGjRZc01JQa0d4L8oslavvle?=
 =?us-ascii?Q?AzQz6nj4Ku7RF7arEGbrPuRCulTHX7wlfC3yz7H70Yl7peyPzp0boH47+LHW?=
 =?us-ascii?Q?aQNs/wfBZY17I+QjPWsTCM7BwFGUJebNcNG7LjUrG4b9P3999rNLoYIrLhKw?=
 =?us-ascii?Q?57z3h35p5iG7wcCWJoWsH1IJCugsM67Ql6+fotAI2WRIXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f1lR7K4qFjQD3u4zQKXNtQB5OVJxzLuH4FvdBxRA5u1PK5kmasMPajX7W1u8?=
 =?us-ascii?Q?2VQVXUl7SPRPY0aris7Hdm55Kbu2vehGZom1M2Racg6ldn5yyxw0Xx3SiP0v?=
 =?us-ascii?Q?IC6uuAxBRvH7kUUO/mMlF19GEKFEt+G5vcL81Is4OEg7taRTylMgCDBcenAs?=
 =?us-ascii?Q?53Rz7znnTDUYx4bsFszhLad+gH+GWJ8IfFLzEq53rQL90YWkgPHZz0boCRyO?=
 =?us-ascii?Q?aCYEBsVmbKaMItPvwXEajsm3IQn2Kgm2VuttkqgMx85m5rm2hixnvCxtUklv?=
 =?us-ascii?Q?HQQwbLP9yuVQ90ivKO8x4Z9hDNSGX/LFTuWYIDUYZD//gMYuxRBHYrsUHnxY?=
 =?us-ascii?Q?KYVRxJI7HBtzA17q8oSrkqmd+K8NZd0NEbihLPa37aJWnCIZa7KjM+S+7qar?=
 =?us-ascii?Q?H2EH1nPvmcnio2L+aZvb/bHO1c4O8eI7aoJ+MMWejlNNzeKxAZWUXKdXAOyC?=
 =?us-ascii?Q?zSVABFOAr3iEd8dPMiRV7JDA+ctWFJnUXDqTB1wWJ+oFErS3Q0ubqVpbLUzI?=
 =?us-ascii?Q?FvjiA/Q5P3jjHF3+ds1gsL65fxs36roMxbUBy8IWjp+ExmnaXCZ+dKcd5avf?=
 =?us-ascii?Q?68TiBFNoCZ2Insq4rDXjEPj6anyD+tacOIHd3Tc42GZHX2ZIIg0oq2tC6WOn?=
 =?us-ascii?Q?VhHEkuOc910MozAFlQE9QolU4TMJqmGtVegzhAZsNdZa37AghHqlUKgTIm2H?=
 =?us-ascii?Q?TSdcetBeYRA9/awY8B8KHJHNuOqo0jXrbIv7oGcc8T8zWlRL1E7lX1a4BOcs?=
 =?us-ascii?Q?1kFunPD7HmWUOwbhr05s3WqIaVZYYnGTBzByhrHYvanHMdsSA/VdVwd8OO3t?=
 =?us-ascii?Q?uMcoNEAfibPRAzaetc+ebfO4PKWmGCXJ7NNKfU/TQj5ebJe8aoAxXMlVcmPP?=
 =?us-ascii?Q?HSl07eWALfeGFYVxVmoiMwNeauXrhB3OG6uWhsBTeCcndwAqUeOSQBfKyKZn?=
 =?us-ascii?Q?P/HHAg0bcm241i4QKxLuQWGfIv+AZK1MKCxsv/tDolJBEEEbQX+JYwdsWUJv?=
 =?us-ascii?Q?bDSGDkNdv1kWhtV5Kkv38U0Zv1f/pz4PhwZRLbJP52H0lcvG4oL/j6n4C6EE?=
 =?us-ascii?Q?+BisJdfZ8s3WlTyWviODCIooypT+1OWFU/+ih7i1RWp+A75kzL8wrngT4g3Z?=
 =?us-ascii?Q?S34oX4iWP1hVJ/0E6IqUE0vuHSBWtzLaXTlE6/XIMBKjHpjh43lhYQTjPLV8?=
 =?us-ascii?Q?T1vt8DafWM375pXwq/5w2PCVM7f45q2H1G8EGmFsZk+fQhUpYl33VQ0UOFLH?=
 =?us-ascii?Q?5IpIz8Z0XV4AFBzH99NO2mdyBc0i0jBa8fELedzZdpZ/cFktdnEXqT5PGB4Y?=
 =?us-ascii?Q?kKlYcoBWZP/lIbdWSzFA2ZPHzP6b7gaOjuRr5r32z1quvxEbrfGmz2eOzGDE?=
 =?us-ascii?Q?MI6usOpLpzWi8V+fHrJeO8Xdqig3ZawkQ/ndPwmzcMiEmdorv9FK/hvPy/4a?=
 =?us-ascii?Q?oLsm/JDs8bMzlvUgO+4+6nPjZduUxdBN0rozF1Q9KoNuwE8wVNThXLoAAlF6?=
 =?us-ascii?Q?x6pejMoFg8tTJ+y+YpNlM/+ltt3xssTrbcWbAEZ5Ibpvg+xjE1E489j5bx9D?=
 =?us-ascii?Q?ZLONnJSy46JcftV4NewH0qdmx+OPMDmLtNS5pDQEV7RBvHOvNvoy8LeDrNgC?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0efac08-904b-4a4e-4d69-08dcc37d3437
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:09:29.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyKhLK9A0VojH4AILoa/TEx/EaDxdifpf+1OZYxHO0P+0LXLEnW6xX3gm2UB2OiwDNWrfsHDBNPd8r+t6cq3719VQtuUagFwoD3SJLBq0vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-OriginatorOrg: intel.com

On Fri, Aug 23, 2024 at 10:17:35AM +0200, Magnus Karlsson wrote:
> On Thu, 22 Aug 2024 at 18:25, Alasdair McWilliam
> <alasdair.mcwilliam@outlook.com> wrote:
> >
> > Hi,
> >
> > I've been testing apps that use XSK+ZC on ICE with newer builds of the =
6.1 LTS kernel in preparation for some production upgrades, and I've starte=
d to notice some instability on newer versions. I can reproduce the issue e=
asily in the lab.
> >
> > Config:
> > - Known good multi-threaded application (i.e. production grade)
> > - Uses eBPF and AF_XDP with zero copy to act as 'bump in wire' in netwo=
rk
> > - Xeon's with Intel E810-CQDA2 (firmware: 3.20 0x8000d83e 1.3146.0)
> > - Effectively a vanilla rebuild of 6.1 using configs from el-repo proje=
ct
> >
> > Scenario:
> > - Noticing hard kernel faults when shutting down application
> > - Can happen if the process is shut down via systemctl stop
> > - Can even happen with a simple kill -9 command to the PID
> > - Appears in builds after 6.1.87
> >
> > Tested kernels:
> > - 6.1.84: process exits smoothly
> > - 6.1.87: process exits smoothly
> > - 6.1.97: BUG: unable to handle page fault for address
> > - 6.1.106: BUG: unable to handle page fault for address
> >
> > Kdump log is below [1] from 6.1.106 but does seem to be the same in the=
 earlier version.
> >
> > Can anyone advise if this is a known issue?
> >
> > I don't have any builds between 6.1.87 and 6.1.97 but I can spend some =
time trying to pinpoint the exact version things start to go wrong in, if i=
t would help anyone better equipped than me to debug!
>=20
> Hi Alasdair,
>=20
> It would be of great help if you could pinpoint the exact version for
> this breakage. Hopefully we could then find the commit in the ice
> driver that breaks your app, since there should be just a handful of
> commits in the ice driver for any stable release.

$ git log --oneline v6.1.87..v6.1.97 drivers/net/ethernet/intel/ice/
dd37b86999fd ice: Fix VSI list rule with ICE_SW_LKUP_LAST type
224b69e8751c ice: avoid IRQ collision to fix init failure on ACPI S3 resume
531d85b4fb66 ice: move RDMA init to ice_idc.c
a62c50545b4d ice: remove af_xdp_zc_qps bitmap
447a5433bd1e ice: remove null checks before devm_kfree() calls
a388961be5ed ice: Introduce new parameters in ice_sched_node
17ccdebe5ac7 ice: fix iteration of TLVs in Preserved Fields Area
07cbc5512023 ice: fix accounting if a VLAN already exists
5ef3a27c6142 ice: Interpret .set_channels() input differently
90cbd4c081bb ice: remove unnecessary duplicate checks for VF VSI ID
59161a21cae0 ice: pass VSI pointer into ice_vc_isvalid_q_id
6a6ebec40820 ice: tc: allow zero flags in parsing tc flower

can you revert a62c50545b4d and see if the issue persists?

>=20
> > Kind regards
> > Alasdair
> >
> > [1] kdump log
> >
> > [  158.666867] BUG: unable to handle page fault for address: ffffa6510e=
5580c0
> > [  158.666887] #PF: supervisor read access in kernel mode
> > [  158.666896] #PF: error_code(0x0000) - not-present page
> > [  158.666903] PGD 100000067 P4D 100000067 PUD 106dc4067 PMD 0
> > [  158.666914] Oops: 0000 [#1] PREEMPT SMP PTI
> > [  158.666922] CPU: 7 PID: 1808 Comm: tlndd.bin Kdump: loaded Tainted: =
G            E      6.1.106-1.X.el9.x86_64 #1
> > [  158.666940] Hardware name: Supermicro SYS-1028R-TDW/X10DDW-i, BIOS 3=
.2 12/16/2019
> > [  158.666950] RIP: 0010:xp_free+0x11/0x80
> > [  158.666962] Code: 8b 04 d0 48 83 e0 fe 48 01 f0 c3 cc cc cc cc 66 2e=
 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 56 41 55 41 54 55 48 8d 6f 58 53=
 <48> 8b 47 58 48 39 c5 74 0d 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc
> > [  158.666985] RSP: 0018:ffffa65089e8b760 EFLAGS: 00010202
> > [  158.666993] RAX: ffff8fcf077c0000 RBX: 0000000000000001 RCX: 0000000=
000000000
> > [  158.667003] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa65=
10e558068
> > [  158.667012] RBP: ffffa6510e5580c0 R08: fffff8c50415a108 R09: ffff8fc=
7cac60000
> > [  158.667022] R10: 0000000000000219 R11: ffffffffffffffff R12: 0000000=
000000fff
> > [  158.667031] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8fc=
7c139d340
> > [  158.667040] FS:  00007f8504996880(0000) GS:ffff8fcedfdc0000(0000) kn=
lGS:0000000000000000
> > [  158.667050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  158.667058] CR2: ffffa6510e5580c0 CR3: 00000001448e2002 CR4: 0000000=
0001706e0
> > [  158.667068] Call Trace:
> > [  158.667075]  <TASK>
> > [  158.667082]  ? show_trace_log_lvl+0x1c4/0x2df
> > [  158.667094]  ? show_trace_log_lvl+0x1c4/0x2df
> > [  158.667103]  ? ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> > [  158.667157]  ? __die_body.cold+0x8/0xd
> > [  158.667166]  ? page_fault_oops+0xac/0x150
> > [  158.667176]  ? fixup_exception+0x22/0x340
> > [  158.667185]  ? exc_page_fault+0xb2/0x150
> > [  158.667195]  ? asm_exc_page_fault+0x22/0x30
> > [  158.667206]  ? xp_free+0x11/0x80
> > [  158.667215]  ice_xsk_clean_rx_ring+0x39/0x60 [ice]
> > [  158.667250]  ice_clean_rx_ring+0x157/0x180 [ice]
> > [  158.667284]  ice_down+0x172/0x2b0 [ice]
> > [  158.667311]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> > [  158.667337]  ice_xdp_setup_prog+0xe3/0x3b0 [ice]
> > [  158.667364]  ? ice_xdp_setup_prog+0x3b0/0x3b0 [ice]
> > [  158.667391]  dev_xdp_install+0xc7/0x100
> > [  158.667402]  dev_xdp_attach+0x1e0/0x560
> > [  158.667412]  do_setlink+0x7a8/0xc10
> > [  158.667422]  ? __nla_validate_parse+0x12b/0x1b0
> > [  158.667436]  __rtnl_newlink+0x540/0x650
> > [  158.667446]  rtnl_newlink+0x44/0x70
> > [  158.667454]  rtnetlink_rcv_msg+0x15c/0x3d0
> > [  158.667477]  ? rtnl_calcit.isra.0+0x140/0x140
> > [  158.667485]  netlink_rcv_skb+0x51/0x100
> > [  158.667727]  netlink_unicast+0x246/0x360
> > [  158.667953]  netlink_sendmsg+0x24e/0x4b0
> > [  158.668173]  __sock_sendmsg+0x62/0x70
> > [  158.668389]  ____sys_sendmsg+0x247/0x2d0
> > [  158.668602]  ? copy_msghdr_from_user+0x6d/0xa0
> > [  158.668815]  ___sys_sendmsg+0x88/0xd0
> > [  158.669028]  ? __sk_destruct+0x156/0x230
> > [  158.669234]  ? kmem_cache_free+0x134/0x300
> > [  158.669437]  ? rcu_nocb_try_bypass+0x4a/0x440
> > [  158.669634]  ? __sk_destruct+0x156/0x230
> > [  158.669825]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> > [  158.670010]  ? mod_objcg_state+0xc9/0x2f0
> > [  158.670186]  ? refill_obj_stock+0xae/0x160
> > [  158.670359]  ? rseq_get_rseq_cs.isra.0+0x16/0x220
> > [  158.670529]  ? rcu_nocb_try_bypass+0x4a/0x440
> > [  158.670696]  ? rseq_ip_fixup+0x72/0x1e0
> > [  158.670860]  __sys_sendmsg+0x59/0xa0
> > [  158.671021]  ? syscall_trace_enter.constprop.0+0x11e/0x190
> > [  158.671185]  do_syscall_64+0x35/0x80
> > [  158.671345]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> > [  158.671503] RIP: 0033:0x7f850510f917
> > [  158.671658] Code: 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b9 0f=
 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
> > [  158.671993] RSP: 002b:00007ffcc805f238 EFLAGS: 00000246 ORIG_RAX: 00=
0000000000002e
> > [  158.672171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f8=
50510f917
> > [  158.672352] RDX: 0000000000000000 RSI: 000000000198e9e8 RDI: 0000000=
000000009
> > [  158.672534] RBP: 0000000001933c00 R08: 0000000001935980 R09: 0000000=
000460e48
> > [  158.672716] R10: 0000000000000011 R11: 0000000000000246 R12: 0000000=
001933c30
> > [  158.672899] R13: 0000000000515fd8 R14: 000000000198e9d0 R15: 0000000=
000513690
> > [  158.673086]  </TASK>
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
_intel(E) ice(E)
> > [  158.673314]  polyval_clmulni(E) polyval_generic(E) igb(E) libata(E) =
ghash_clmulni_intel(E) i2c_algo_bit(E) dca(E) wmi(E) dm_mirror(E) dm_region=
_hash(E) dm_log(E) dm_mod(E)
> > [  158.675578] CR2: ffffa6510e5580c0

