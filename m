Return-Path: <xdp-newbies+bounces-128-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE694615C
	for <lists+xdp-newbies@lfdr.de>; Fri,  2 Aug 2024 18:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1B21F21D5B
	for <lists+xdp-newbies@lfdr.de>; Fri,  2 Aug 2024 16:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129F11A34AB;
	Fri,  2 Aug 2024 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3Apd8te"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD06E1A34A0
	for <xdp-newbies@vger.kernel.org>; Fri,  2 Aug 2024 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614786; cv=fail; b=iSp4qSZnYZ25MOxE1AGltOzVbHgQRDEutf54uHHkBeX5aa3QJH466v23ftu7QOdRVncbmnX3pO7MB1pGrh2iTrZ/jXvA3yTnEqyzdgkhkAiZFHZPj5JA8JdmJOaqgRzWLiBDpa4kherdvLh0GwEqLul6LWqySmtqGw2NXaEDiFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614786; c=relaxed/simple;
	bh=/Cf48tzVaPTo/RFTKb21EZj4IoeQrjJ0XlDfOhPcVsA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SXQTUkZVoQt0SzCdDLJOwS1T1kXpOZOJ23phvuGp7nDvaLrVlyTXMap3oR+Xm5KnWjlySHA5hY0hhGBOYaDZNjWpAoIYi4nsKPcY1bLAqibdSsuI5A7dLjOCSBSGuv+nqeWMsWU5EHa8QxQQXtBCrCyQ4kjGbP5H+aIPL90fq7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3Apd8te; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722614785; x=1754150785;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/Cf48tzVaPTo/RFTKb21EZj4IoeQrjJ0XlDfOhPcVsA=;
  b=V3Apd8tezXHQDo6TUnVO5VAZvw8Vuq5io9AX8XyzN5L95T18iTF4lxjC
   0uF/PNKgV6yi3z6ymlwK+Guw5PbQ+7G8xUy0dhD7NueYDO9KRWVsGxLcr
   crsZLMxgenQxkola3b836Ww029SDHB1HzVr11eLj27D+CryPz3uNE4qaH
   +Honaog19jGA6/7T1OdMmIBWHqGA3efsPYbGgynunJdUjYXdhOX1yX9nC
   PWRE2K+GjTE5UM5R8rK96nTTARn3/66V2G2Adef6CMC3Mqs/K0kcGHNFW
   zq7GNO6S4AMHjesFaZGzsQHrQSQf0bTaq0IFIBtLLeefRWWnamvWxj1vp
   g==;
X-CSE-ConnectionGUID: D0ws+KDlQ3WzPzIB2ny9yg==
X-CSE-MsgGUID: zsDbmeI1T8qddJQedVfKoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20759354"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20759354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 09:06:24 -0700
X-CSE-ConnectionGUID: NjJyG/sxR8qxCHHhoADJTA==
X-CSE-MsgGUID: KUztL+ESR3e9AwW3IPu0pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55533281"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Aug 2024 09:06:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 09:06:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 09:06:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 09:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSvjFLU8qFgo9WJVnJ880+mJ01AJ9PbHuAgHsz8woKIaoYnUBkYccq32Skzn3B+DQn5d2/waZwswOd3oWiMbmQSVSskg6LsscZJVKTFQ+eTP6Mr/5uycYUZDNEz2wdjD6BRln1SJl8cqpfK738ZxR3iMsa15MNvKMGIfrDcY1ur09LsGzB1O/zy9U7wPLfdwbBSvF1aWF57qnKugzhO9KcIEnvcc/BH17PK9s02frfBcA9pxiECltgry+umpdlcTlZxqv81URvascUw+WbTfQR8nOAMSH8ehIOC4JXB76xnsluiyAit4n2gML6lREtb53Yloymag2jcIA7oWCc+5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SNelAMWizZYE1hKPTPKks/EXJZZrllYU/q4fd6caYg=;
 b=O6vxbkbK4PPIlBriwYGfKTfLG+8NhLN4la322NuI8weG2G6m9q6ZPk0Uc6b1f3Vk/AhIB3BNfXMa6GK8nfzmjM8Q/2GilkHW0SVGYrRdOiRWPJ5bE5HHeJE/vYTD3Iu8ud7SZVRYVH1Q2pR6o1bVSpxBI2Pe8br+z2WE2IiX8ILJY8e89PAfYxfKid6Dt9m78q+Yix94WAczGuRHgaliiYKAb56eHfWjFIZtC7p3ts9UqcsZxizntxS9WQLylR1+GYTRwpQgTMdropFjhrPltafi4rL4o7hyQCmrpowAjnSS7GiZwAhEKOiXtcglVLyizOlKC0BlVjCelNVsrZEvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.24; Fri, 2 Aug 2024 16:06:15 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::d19:56fe:5841:77ca%4]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 16:06:15 +0000
Date: Fri, 2 Aug 2024 18:06:03 +0200
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Ben LaGreca <benlagreca02@gmail.com>
CC: <xdp-newbies@vger.kernel.org>
Subject: Re: recvmsg on AF_XDP
Message-ID: <Zq0D6+Nt58dNPmx2@boxer>
References: <CAB6C9b_vR171Jwx=CT_-PVLy9Gt-tuy6P3_UZK1Pm_487uwJeQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAB6C9b_vR171Jwx=CT_-PVLy9Gt-tuy6P3_UZK1Pm_487uwJeQ@mail.gmail.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb5af62-2b46-42a3-c464-08dcb30d0924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9EQ3ZEbh4xGKCIEwHZuvoXCuY8cdB2Q928Z7CevTphr96KKsbt4M5ZVk0qaT?=
 =?us-ascii?Q?bSjmB+272fz/T81awRK+gVsb+QqinrjK0HagQhBvp9tyjZoVJ5n+WA8KXcBC?=
 =?us-ascii?Q?TMv7bsee9FXrrecRWYTWTt/maTwNkSymRwnW/ptxQByEl1DZzj4lNaGeFjGH?=
 =?us-ascii?Q?VvnpHhif4X5zDtgOMkHOpvYBxvv6WBDQhsb82APlVCASRzSP9bz9CgcWtx8Y?=
 =?us-ascii?Q?sVZEYzE/3v4ryHL9Y/vWe2rzFaHTwzsqMrusmy5hncHzcunwldN/jhShwHUt?=
 =?us-ascii?Q?C/wDv3dE2ItzlcDrQBqv9Z3JRdl503tL5pCo8etXMSMvF38FvxoZOlaVk5vr?=
 =?us-ascii?Q?Bqe9qlwRbo+l2Nlm5WKsmWe6Ztjqo5fBV9C/ASRr5rOFw9pvDoN400s/x6SI?=
 =?us-ascii?Q?CtMrZErZjZ/VZ3uksgXAgEWPFvdxojeUwzMSkNknkslcu7sXA3WcFaQN/k9N?=
 =?us-ascii?Q?7SBzl5IPSxkFYy5DI/z3IUAIZ+H6ut/XTCABOX9HRh9EbPKoz+dA/FaizCmI?=
 =?us-ascii?Q?QspHCp2mkE9HjpTTJI6JuG8Q5jbp1jEQKiQ4krpkL6P1hs6bl4BOkpaSWK+k?=
 =?us-ascii?Q?YKYtPpBiwrzS35W+Fihj+lcRmcwdXsz3GLkSKN70aKkAXoMGIsDkUrHfvg6j?=
 =?us-ascii?Q?YKv2UENak0xf+3CrID9g1HBcm1jsV3Xm536W8egcS7ZmHGQdKuagSM22Kxg+?=
 =?us-ascii?Q?mecPoD9W8QITmawqunNJIl+06Gor9T/okxx6Qv1AeaPHkauZC8iEKsi0RhUk?=
 =?us-ascii?Q?4C/9JwKZV12MuJyzhkgPQT7SiuqDOrjWpUBn0tjp4fYAJpwgpBMUbgBOAxXp?=
 =?us-ascii?Q?7zbjK73xuiDt5k/Z9v6BqlJd5zC+Lr1DQXlRj3DuUK2NAtCxNszPtE2idgB3?=
 =?us-ascii?Q?MKD9EMCYHxIEc2YPSs+6EBKopOYbHjBWsnQLE2Kil419GlEoXt5dZZPuzwxU?=
 =?us-ascii?Q?qcG/Pcsk5oMG9QWrgICdiaa3ci1zQTOoLvfnDFBGCcEPJTQ+lEPkngm+SZHz?=
 =?us-ascii?Q?6PHzP0jiLPWmnPFCEJMkFsF0JXN0cKetkaA663UbkawdCffgkMxv1agDN6nu?=
 =?us-ascii?Q?DVbVVKcDdBmpLPMu6+0013gflcvGtON+BcKUqckG3+9/W0gsZ+/g8cKYxJQr?=
 =?us-ascii?Q?2PrvAuLmWljhsk+1mY1OswJXhQcjxBKyk6KVV+Bt9p/Eo651pWanciwXuetq?=
 =?us-ascii?Q?yy93a2HKwgGp05uI3Hhm4Vo1auzgHqBFFzIuBxhyOC8UXv1e5MTDtFBswf/n?=
 =?us-ascii?Q?yIscSLKHAmiTchgXjRNmXNoV4TFenPRMZqC5By6wGcA9D83992h8YV1x5la/?=
 =?us-ascii?Q?ebc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9X6ANtw0GDR7c5YGcTS350d/BawTU2SY1TxnoSqpONLt586+nCxNXZCrYlf?=
 =?us-ascii?Q?7vDiRJ0HliU48DoxFqIJOjMXrADLoWfn4y47VrmhGCSVcO5fhdHun6hpJNi3?=
 =?us-ascii?Q?gkLzQWXgd+q93lc6aGu2Ex4KVmCbMdCr+TZmvYCDugEzV17AXCLOTQLDCHkj?=
 =?us-ascii?Q?JvQuiv05kGX0bUSHk5wQxE5ClhH6yQbSMK0xqEvx4LETn6R03DiWQiwTiioT?=
 =?us-ascii?Q?JiOIrVBxQosrv5/CRkd0UFI5FTW4IoIFuwXLt8tP+VT0BjuY1ct8ahY84Qw7?=
 =?us-ascii?Q?gHWyMXa+eTq5EPomYVbGJu6Xt964DjS48K3Y8yR+2wgzhF3k5ftSIF/t+YSK?=
 =?us-ascii?Q?wXE9nxC2bg2Mjq6dzVCufUUWN+VwCmsaJGYV2MRHhsLibjKGEyftGNgX06W+?=
 =?us-ascii?Q?uPbuVPW4gtNsTyoq6YiLke9rJn8qv06DyzGb+ZDjyLU/sPrERB2w1s7OSj42?=
 =?us-ascii?Q?Qm2P0S7qglzFz2Ej6pZG3f2jdNnvX6JaqHsDjjP52SR592FO70DRG9qMfDmk?=
 =?us-ascii?Q?pKrc/n3LMNZ+mF3tlGublVVxcyYRHPzvZMg9lcf2w894m+lO8Ecx+1TyMRHM?=
 =?us-ascii?Q?SZ68fARld+ly+qbpWBYlhbSJpKT7xQtx/r8kAG6iWcJGgmTTputsp+hbYZrK?=
 =?us-ascii?Q?9rQsGe//NwPrORhAim4LyNJn0hA4N+qCv0oOUwrZlWZPpohkP9DLGGjjjQqz?=
 =?us-ascii?Q?ScFBOWZzDiEViSMPtO9yZGaX5WNp+xFR8rAekDpZH7tq889tMFo1s+tKumCu?=
 =?us-ascii?Q?cr+xSCZP2cO9jOBJZXGcvozE2qxITMGeD+JsWoa9OM7UZZa15A6j/8uNeZiL?=
 =?us-ascii?Q?tYzYvIVnyqpS0hD0bhKnGtfDPutS4Y5lOmqyGQaA3C0JEXVwnKqWigyaD+OH?=
 =?us-ascii?Q?NEFQQmNj5Xs6k085wS2bETz7II3fkynqwSEensA9Bga15shmurpwQG3pamcr?=
 =?us-ascii?Q?gWz6NVTZfZkn84Vxz2yn/b5qb2zT3NVhathTJnTFB3bn9PVbV7uGTuwLQR7c?=
 =?us-ascii?Q?qKbljgg5uvB/TU9IlFtgvneRNv8M1Qk+Zu06Bykcdv2jfiQvWG0c/buBNWrz?=
 =?us-ascii?Q?KLGZcUB0IXIKlkefPDNDQavM3qLzyA0KhA/GF4ag5KC6+KuBIBUnW+ryfKno?=
 =?us-ascii?Q?BmOi/yzstsF4dPU3v8zW2HDaiDNtUkVWSdd6BTVFFy13GjvAs0wxNZR3EPyG?=
 =?us-ascii?Q?G9mCWee9+LUtZRwkxIzci1bqwukp3+jd64Hda2bG59kImHS1z4Gnb4UCMayO?=
 =?us-ascii?Q?pj+SuiY/W126jGQgAyqs/VEe7qy/cd1mkVLLOjE29SoA6EFGa6KQLm/xh4DK?=
 =?us-ascii?Q?lrirVyoIe/npWOOrloAUjx6e+7SKV1PQV8EZU4XQy2zKb7PSb0Y84Tl79ulc?=
 =?us-ascii?Q?jGyH+iSWDkrbN/pXJlihIWN2RoK2T3j5h9qzSeSkbqUXSX+pvxzLVyc4fcxD?=
 =?us-ascii?Q?8S65GcOUtpSwYQLYy6Q+InbR2BxSuA7jNGf5YyqbkI4uMCRyGiLv7uymmJ+O?=
 =?us-ascii?Q?Rp/5qqJYrwbhg5raTMmyVxytRUuUcC+Vc4X20JSdhLSO18g0n3l/DU18bcAg?=
 =?us-ascii?Q?hP8ebTCnF6MlfEp4KV9q07R5RAR/utjkTZq0K/6po7B9pNBk73iacfN/nGwz?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb5af62-2b46-42a3-c464-08dcb30d0924
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 16:06:15.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yul+5VTdy056sGImaqW/TIdfa1MR9fwYidQleuNTEd+LPWDxQySGaYHCibfrOLQJYnFjpepvl0LZWRAWckKFKhcZts0p1Khf8BSwUmPQqq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-OriginatorOrg: intel.com

On Tue, Jul 23, 2024 at 07:28:12PM -0400, Ben LaGreca wrote:
> Is it possible to use recvmsg/read on an AF_XDP socket? I've been able
> to set up a socket, write an XDP program, and properly receive frames
> in UMEM with the RX and Fill rings, but am more interested in using
> standard linux C functions. Some libxdp documentation mentions the use
> of poll and sendto/recvmsg, and I have successfully polled the socket
> (as one would a normal AF_INET socket), but can't find documentation
> on clearing the revents status after a poll. Any help or redirection
> to documentation would be appreciated.

Are you aware of
https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example

?

> 
> -- Ben LaGreca
> 

