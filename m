Return-Path: <xdp-newbies+bounces-136-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF196D95C
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Sep 2024 14:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCBB41F299E0
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Sep 2024 12:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096E819CD08;
	Thu,  5 Sep 2024 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SADX6OMB"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02olkn2070.outbound.protection.outlook.com [40.92.49.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38D19DF51
	for <xdp-newbies@vger.kernel.org>; Thu,  5 Sep 2024 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.49.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540612; cv=fail; b=TeniopmQUUw5XGWnliN0cMm7VNsmFYKQaDEDh8pemgAiwoXoh+xQjpQCeN0VUEfX5re7qVphqFxVN/dusMRK3/x/8xuB39DIP6LaViRzj0MZBIOFCBFLuYlG6jTqYdGA9bw62CEa4Nupi2l5bonKu6aGpSk56ka0Y99AYTLEoc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540612; c=relaxed/simple;
	bh=PYdLMiOGEXWTgzrKiNCPqxdxMdxbEB5GPlGVFegDDr8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wmj2DXQ/1V9eXD/HP2Zo/1Ya5Xrs2LXIL2W5VTNW3vR3ILfS2EBb4xLPviMpdofKBa9nmjAjF5hM34bzwQnsxEakxx/HOEB8TiMHZ0jagvxK/oyq4UkKgW5pURE6DBUVNYAiOvawt6KnxJzGNTP2dloKMtVUK9f/NDhzbFxDQlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SADX6OMB; arc=fail smtp.client-ip=40.92.49.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGWsXkVMUR0l6kusZzFooa9PoHfMJBFtuiNcYwLpbqWoIaUqf0AhfEPoSii0tnOuwDN71tRCzL8WTT3M7zdzoPqnFxxjNkNT4QMO6wfK24OLs1VwKgntdGjJTDu4xVOI4+TRiVW3T9hv9AEx9uTFTauhu63V4eedDKTjMx0cTH0jNd6kbqLzE/wvE9ZcL+PebpkcZ5GefOy4EQ1Y/Y6JhmI3qVruM5vlO+nZMdsoxCPaeyVwDfAzwRKVbUkB3dgi08RVuvzedQVAfUiB14ztIt4iDnMTIxIUPmmXtxX8WWRmU8Ge08Aq9sUocOwg9pjdSqUR1WURG2fUfrNh2Jk/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w81XuXEFLVJGE28G2YVIon2rTxStfZb2CY+ugebpwYs=;
 b=v5xe6vV1ZDwsysYlOyeCvOctdQpJeDMIKJhmq2LOQ97Q51n+PrPYEPmL3lpJDN30n/x1LeWl0RQLd+2JXMdNBn9qA2VcpiDWJBAPRQWuboGM67eBTG3qp9hbwh9spsJMg3D5+XHrGabIXAuFfBGV7f/dI+vprdGm6kvMEqvcIRrGA+r8pm/49LLED6FUb+ZDVp5ZqCVlIXLDoI80auaOMjGZ6HHW2X67SrN3QsyEOiaWDZ0UcDL/w7NRnBIZM2fDvhf7KkxaW+XCEZwVYlOPTFKirDZmrfbTnov6cFLTYcjeht6dn7CSJicMPX7edAXg5yPPrUZQab07l5iOMJNONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w81XuXEFLVJGE28G2YVIon2rTxStfZb2CY+ugebpwYs=;
 b=SADX6OMB/U3OCswXX6v3EgUZqgtv5YKA8ZK9x470cbkkN8OesNTH6XGZcBWSoTjj84D9jhYUqRbBYWXG/9i54PtSSJKggFhs+Eo/y/w4SdWXl/9zbbLKATD0A3hWTFJfmNmkW9iyvyV+mqM/nl2u08IB1DUX+mryLMZJH3DUU6Fdcs0exMtvR6rbqDvq1udFnDAA4JBN8uQOjux34n4wN3dyz+gQ97+pzqeIHS/xiHIxHfgfb1bSTcZ/wYPibU0rjEV1PacHisXjXNIBO2InBVsQdYylmKA9zB0f02I0p1nu6FJ6fG9f0EwnbhPtnhLh1sEpkIE5kampFw7a+B07Uw==
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::12)
 by DU2P194MB1693.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 12:50:08 +0000
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865]) by AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 12:50:08 +0000
Message-ID:
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Date: Thu, 5 Sep 2024 13:50:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
Content-Language: en-GB
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@gmail.com>,
 "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
In-Reply-To: <Ztg23DO9q2O7vJ4D@boxer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [INL2nrOf9mVjMKpJrYKTBNKInkuYyJFr]
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:5bc::12)
X-Microsoft-Original-Message-ID:
 <acd9ffbf-e832-4ba9-97d9-4e3350e531dd@outlook.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P194MB2042:EE_|DU2P194MB1693:EE_
X-MS-Office365-Filtering-Correlation-Id: 33886f81-e8ce-4842-2880-08dccda9458b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|5072599009|8060799006|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	apTQw4Jnb2ugrJrjZi0zW7OozgIs76lYR3EAEnA8C/3f05bcCeS68Gg+VbaCh2nCNML7LLLPoIy5iqYmEhOGCRV8RwXI4caoQk271cP9V19BUiHbqPdlqy6rp1CQ5hy7v358HUMTv7daQ5qOOFwy6cTq+OB0M/1tfpfmLrB9DH6s1VYHyJfatujP+JvYLHIVAYA5XVHllNWGTk2aH62bZzRdY2xn0sr8V/lYZVvo9g7FEYeqmyTTkcHrktnlVhdzv3Fl59Z0fgqAD3Zfr343paPBRdCIjtebZZD6NXjfQl2fymFFWz0cCwA8+KD6aJdoEF4CX/J/8ULmC6si8cWhz1pzfBIPvpC7rD1DycK62LVpINX2A7uiWrwFnunNQ7yYzbtmOXgCAsenLMiNTLyxMb9y5Covj0hR5Zpu1LrVrEbTe79ni8lpys3ORG/WjrXUk7vyuE8PY6mfwcb9/FcLUKVZY71cf2uSSdjmoNfgRBGmb7LraG2VZN/VQdRcDeCTtqdzszsWULyQoJmTZP1b7D3f7RffI0RTMuEM966LcGb48nj6+U7KEoXEkwO5wGtfjNC/xizT0vslcOuGXWpSNMCgViP5znRrD6K/htvrFmTK1jIv0vRgaBXjVyItMDMShx6WE0RS2rWzkYa6pTK9sI/1uxamp2dOeDpCPc1eBFmahsioV5mBJWS0uLuXwnXANlqZK338kSkpCtcylt9LHWKBkN1G6cZ74rTXSGY/vuM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3VuWmZ3RTVqRDN5WUZSVEQ2elhaeFJlbWJrK2oybmRobzQrZEt1eFowVUhS?=
 =?utf-8?B?WUM2NW0zTlRud3FhMkJMc1lmWnhTSWlFTkllemRWT3hEMkpEOXBzdHdGaXpu?=
 =?utf-8?B?WmtUWTQ0ODdWSERBWEJlSVdjRThhdXkxbVlVeHpBRWR2ZytUTEovNytHeEFO?=
 =?utf-8?B?VlFHdFhuMUZnV1ROaVhuQjFlTjhUaDZzeDd4UVBpMFJ4elBmYkdpL3NlejY2?=
 =?utf-8?B?MGFmYTNJUW1YenZ0Zklya2gwK0tsN3hWcS9icGJjeUhtWi84UnlSRVNOam5w?=
 =?utf-8?B?ZDBxY2pNS3grY0Y0Y1pTK1NOWXJCQ0xsOFEzQ2VVRlhDUTlPVnpISHR6eDVW?=
 =?utf-8?B?bHA2OWtra0dpcVhwaFR1T1Jqd3RkdWRYaDZOb1A0Vm9EYjhoOXJHbE5QMkg5?=
 =?utf-8?B?RFNBREYvL2UvWG5nbFAvK1cvTWc1VnI2TG15STJldjRpZGRPcnVTblhqbFQz?=
 =?utf-8?B?YmltWTNLeEQwRXFnb1BrS1g2WkdlSUhuV1FTL0Ivd2tCbkkzWjBNU3YwaXVy?=
 =?utf-8?B?OWQxbk00TllkaGhXNGFHRmhTeGYxZExLVVB1ZTJRTkVaUVJ4TTJOSkNJN1ho?=
 =?utf-8?B?WjdGUXlTSnBDYW8ySXhoZVc5b3B3UFFiNFM2MkFrYVRQeXlOdHU0c2NWKzdn?=
 =?utf-8?B?bWlLQlh3L2d5RWZuYTRCM3p2aWtCWEQyc0czOFN6eW5TcXJhVFBYd1ZBWitw?=
 =?utf-8?B?bTdMdGNNR1FCVTFuaGdnU3JOMFc0V3h6U3p3clFsT0UvK3hFeGFjTkpjdDRB?=
 =?utf-8?B?emxsZ0w3Ny95NWF4b3dJTGVsVEFJanhmNXgvNnlkbUo2VE44c0VjNElTbGJN?=
 =?utf-8?B?MVNkYWZYUTNhbnR4RHlWZkNxWlI0eWxnWndhdkJicmU2Ykt4ZGFyUjZuTmdU?=
 =?utf-8?B?UG9QWHY2TVhrbUJFTzFuMTJxVnlqbFl6OTF5cHFqUzVhaDFvT1lWTWRmYUFu?=
 =?utf-8?B?UStqTU8wUEhOc2RyWHIxWDVYbmZJSW1uN2E0eHNlZytvWXArVDBMKzZLUmJV?=
 =?utf-8?B?MmhyQjNTVXM1U1djWUZGbWdJZ0hJbFZSbERtMzNFa1JyWlVIUDAvTTN2NmE0?=
 =?utf-8?B?T1U3bzV4Q0dUZmVzM3BqakVSaStoQUt6dlVFdnc2K2pSVkNGWU9MemZDSFJZ?=
 =?utf-8?B?S3JySkV1TmhIMDJvTmw0cFdqQUgxajV0NmNXT21ITStVYWZ5NjFMYngyYThR?=
 =?utf-8?B?MzVVc0ZkeGxITHFTZWJsQ2JHeS9RWGFKZEhKK1MxYXdneVpQVm1OMXpHL1Ri?=
 =?utf-8?B?TE5CRGVpYS9TRGxCQ1Y5SlZjdG95OWJvOGxvczhKNXBLQVN3RENrUlZwRFk3?=
 =?utf-8?B?WkhpaTIxMzV5NkZpc3o0TjB3eldPZmEzYVA4ejdBbHp6NyszS3dqSTQ0SlFT?=
 =?utf-8?B?NktHQmNXNGFtWk84REwwVEVCOHNsWFpUam85aHRXcHh0L0piOE1mTU9XUFU1?=
 =?utf-8?B?c1ZUNGZlYjNNMEtTVFdua08wMWdMNGdJV1lWSUN3cWJ2a01XZTI4RlVGSGRu?=
 =?utf-8?B?N28yUytWMjhHYU94Wng5MXQzd2hZWm4veXdJc2IxeVJXbGJNeGZTNW84YmVv?=
 =?utf-8?B?Zy80ekFuYzdIRnp5bEhqeU1LRVA3S3Q2RktQak05eGZoRVpoaHJINi8xd21a?=
 =?utf-8?B?L2pJNHRuZ1B0SHU5NkEzMENLbDh2VXJTQUtWYW9rcGNxQXY4SkxvbHg5TW9N?=
 =?utf-8?Q?TVCtu1piim42iHRV3RrH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33886f81-e8ce-4842-2880-08dccda9458b
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 12:50:08.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P194MB1693

On 04/09/2024 11:30, Maciej Fijalkowski wrote:
> On Mon, Sep 02, 2024 at 04:09:33PM +0000, Alasdair McWilliam wrote:
>> Good evening,
>>
>> Looks like commit a62c50545b4d is the culprit.
>>
>> I've produced a production-grade build of kernel 6.1.95 with commit
>> a62c50545b4d backed out. Seems I can no longer trigger the fault. I can
>> kill -9 the process while pushing 50Gbps / 14Mpps and the process is
>> just restarted and resumes like it should.
>>
>> I'm going to back out the same commit from 6.1.106 for our production
>> builds and verify that fixes the issue there too.
>>
>> Can you advise if this will be reversed in future commits, or if you
>> have an alternate fix in the wings?
> 
> We've been working recently on somewhat related issues and it looks like
> not every commit from [0] has been backported.
> 
> $ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
> 5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
> 8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
> 15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
> 3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's
> 
> can you apply the rest of it on top of 6.1.107 and see the result?

The first one I've attempted doesn't apply cleanly to 6.1.107.

Eg: d59227179949 ("ice: modify error handling when setting XSK pool in
ndo_bpf"). The above looks to have been based on code from around 6.8 or
6.9 where the makeup of routines like ice_qp_ena() has changed. Looks
like this happened around a292ba981324 ("ice: make ice_vsi_cfg_txq()
static").

Should I try and apply a292ba981324 as well?



