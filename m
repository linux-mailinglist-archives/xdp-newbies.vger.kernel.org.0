Return-Path: <xdp-newbies+bounces-146-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DEE978537
	for <lists+xdp-newbies@lfdr.de>; Fri, 13 Sep 2024 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26D42829C9
	for <lists+xdp-newbies@lfdr.de>; Fri, 13 Sep 2024 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC1755898;
	Fri, 13 Sep 2024 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ECZR+0WH"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2038.outbound.protection.outlook.com [40.92.90.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96234F883
	for <xdp-newbies@vger.kernel.org>; Fri, 13 Sep 2024 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726242869; cv=fail; b=jR469YdDVwe6B0cPzTHmfoUXLMPGIgfL0cpCSBbqEOflK09f5d8M8QDXaDAbFIQm0PI1zKm0ur1o8QRlXT72yxPOPxQU1+r1UbU/rgWyvp8Ly2LwOHnH/Ehgb2ApqvkIcBMnWgGxUOvppSW9u79jhv4uoieErXxZdk2ry396Qgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726242869; c=relaxed/simple;
	bh=634rhlTGrt/GY1yCXjo0xh4k4asxaIraRsgjY0uSS10=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EdinfCVkaxTdPoQThOQ3B1lbJxvfjE0Zp7ZfKgv4iD6BpdJhewYlIw/kH4L9LVGWO7VGogLk1i+tncvjBEozvqH9ulg52PTYZM1e3e6sHqGn0EMYdV1nr92fWSwO8c8zUTxDm+8GcbW1GJuFLV9IQA2UPwz9uKT81RkyjQgDm4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ECZR+0WH; arc=fail smtp.client-ip=40.92.90.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKovKIpqnAbBKDqEfRxBOm4rmG12Bp3OcqtBDiqr2r4PrqkZ/XWjaj5BvolXdyzcgPbq173zuY7i/QNi1iTyiXpkIc2E9z2EycNYB/+zWrQxVWAWHyXuMyK1LP7OJQU9FczQyRxq3QlTQlxK+Ypcrd6GdUOGNTXWydOKb5pEmMYYHbimWPE0z9gHzmIDK9nQMyOk4RmWxdE0MPCjXrzskRbsc2EKuciqHIUAeMwkfXmTooJC2hB7v6uO6P5bjg1qZ32t9vQujaMGUp+gHmIDYtXSzhwlXHX5CFcHLm+2HE9yQiMs2BtbTv5gFqlkslCUFdSdzS+7PeZbrY9/G4i3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtlOQE/MMs88RPp/kxw7lYHL8kjTv03NCgE9IaF3DFA=;
 b=XaRLFD6zd7AP3JN7W6AuNLUPm+kMmvEJij2Sb8yvr7W4HHCWZFSuAbzfoD6fCTl5EsuUqnW8UcX82pHFhMXQE1hwqo/Z99J21ER2ly3wz1UgajQja3FMKLi5lW2AIfKZO6/nKSvdLbtHhOcL1LLSmMo65ST/T1WtpKwu+JFZZd1owuEvKnaBkVAnKB9lNdvhIwZVdFcfod/RykE/xWHoVa6fA+bAQt/9yZsjIPkgLPi7+bkX8iBHRvO/RLUivEOcfFc7H1+Gv/E4UYRgZRdF2dYMGYGtLutaSm5IXhRwW9VbZAl3ipAy195lEOWDcAdkkl0TZDPyCeaeTKuxcgtBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtlOQE/MMs88RPp/kxw7lYHL8kjTv03NCgE9IaF3DFA=;
 b=ECZR+0WHXu2hNx46lGpL3lNrbUTMe/sTBU8WyIVJg0YUXpcUIDO0Jv2p+9zGokVNFe7VizZtg+xXR0+wqPYoEJNjlyU7y08romx1Hew4DtfsMkSy9AtSpH2qfg7vkwYWSfsrdLG1uJeRU3edQp04k9d7tyBA9RW3Z0/RbWPP8FWm3XdVDeIQfIqxkWMkRXcThRo3XKyVMXMRVY8wi4zqBU9ygLhASE7AksZnrog+QFWuluqVc3H18h4W6PZZpwhNEkU3NCXaVTC2Ady2qbPZ0IA1up6dqHc/2ktBh22OUSoCmNjLbTF7EjeiVviXGVgBdPbLrMYmdxVV2cZKQSHVww==
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:5bc::12)
 by DU2P194MB1614.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 15:54:25 +0000
Received: from AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865]) by AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 ([fe80::3644:f8b7:ee68:3865%4]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 15:54:25 +0000
Message-ID:
 <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Date: Fri, 13 Sep 2024 16:54:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
From: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@gmail.com>,
 "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Content-Language: en-GB
In-Reply-To: <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:5bc::12)
X-Microsoft-Original-Message-ID:
 <db821541-775a-44f3-9f0b-91487dac85db@outlook.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P194MB2042:EE_|DU2P194MB1614:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbe4601-6daf-441c-5845-08dcd40c574c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|6090799003|19110799003|7092599003|461199028|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	gisOSUNSP7uVO1AkJ62FJBKpCEgt0nFKYiBlfdLbQNIJnLkUXtmvj6MaROcBelPS4nqnt+4+3JjkOzY1kqrbPUstyd/f6/1I4/3FsokHsxEa6UVVAuxuwC21+GL60iFneLkDaN+s2gQm7DyfoLjFm3lrNdPyHpTZfrJ1R1A5nJzLp4pFrFc4jEbDmyRZg76pH8MQ1UF2AjJUU6JNfXpdDDaDzyH+qpjk6lCbNJ9QvwYmH/3nQctBx2vokIYnbrtTLJeSweFRvvzxpC6UDzUKBEcLr5RZkyusxSag9L40e+TxW4RSUrCUr0vss4MwkRr9/gu1LrbBYc4bhkzGoxV2K5miImJfQQpEheEylW7+yK6Phuq0FmQaGiMG8pobUEktxkJyThGXIGD/Ml9Ucp9p3MT1lxSDFgb3ne1viOkGlPdEdaU16VxJhzq8BcwmRQNmloUvjvhRPfjEMXyHl9lRqKmjY20gu+0zIjAQlYC9/mqkb4gm2kXOO+DRXNbu3f6rrJZ71VGNMF3zY22OcVXnevaLJJ/Bgbe6zJtuNjf9X9AQjQ4rpkMrhxHPg88mZt7LH8Y0AB9/FrgfWUNm56DaFTr92iD4mixUDsnhzqUtlIFWI/iJ1YsS64s0wXI/n8/a+6gXNWRjgROtKOBejI5KVuR2TMni4VYQQBy6PsoxJV6rB92l3Mjckh83cM6lv1+3S4eRkUiRCwZJZxo8W+mEWs8v6LyWpZgYUTs8N/e6seBJ2hPPP6/74nth0Shz7chpSjH+O9cEfiY6qH/gXVnEow==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXc1bUpZYStacDQ5Mmc3MkRRUEdFOHJ0eTNWckE0QWNLRFJKM2F2LzZpS21q?=
 =?utf-8?B?ekpTc3JSaDZwNmlHZWg2UGFhSUFnQVRKVnFxMVhtL2Z4dmRzbnFKTENidTNz?=
 =?utf-8?B?MzAvM0srV1ljSE1TaERkTytBMUgreTJYVTFzL2lLR1NPcXdSZElBV0Jza1NU?=
 =?utf-8?B?ZlQ0aTZhUjNCZVlTRG5kL2pFUENlN05TM3hqNk1KWlByN0RaMVhYWmIyd25E?=
 =?utf-8?B?cVVEOE1NeHpERzR3Ump0dzlVUmxOWUhnVVRMbXJjNzZ0ZHMzcVY1STMyOTg0?=
 =?utf-8?B?Uk5HNDM1YTRLcUZqc1UwSDFBNFZUQkdNYlZpdHdZSTJ0RDFsTG5zOXlPdWlR?=
 =?utf-8?B?dHFURGVLV0Z1WlR2b3lMWThzQ0kwdVhUTTRCWVpFMWJYTlk0elRockloRkNv?=
 =?utf-8?B?REFoejF6dGVpMGROS1A2UFdlNkhXM21OYWw3eWwxREdlODNTYzcrcnZkQWhp?=
 =?utf-8?B?Rnlvb0NQOVpWcDNwcFVoVVFzd0JDVGhLbkQ1bG8yb0FjcXpnb0kxaDNlZlhr?=
 =?utf-8?B?MnZsK0gvbDhhMStTUGwyNVhBM09BYjNwZkg1V01XM0hxL0pWUHhiYnRMd2hS?=
 =?utf-8?B?cUlzQ0JRVHlVbldQMkJyeXdEbEJDb1daUkc4UkcyZU5nQ2ZhZ29QUWlpOVYx?=
 =?utf-8?B?dVNhTUdYTml6N1ZEbzMyK2NxbURIWGd5elZjeERUWW1XZVpqU1ZMZEowaXFR?=
 =?utf-8?B?R2RSSnFCLzE2SHV6R0tCa01vc0MycGptWk5xcDRGNU9BQVpUL2ZIamFYeFBJ?=
 =?utf-8?B?MnI5Qkdic2VleXRxaXoxbFBCTXkrVkdXTmVPWWtmSEx2Unk2TWpSRGljTmps?=
 =?utf-8?B?WUVsbUhKQStYOXhRMTJBRFFqWVNQQTZEcXVpRVJQZXVhTzZVQmlQaStwNVMy?=
 =?utf-8?B?RFBIdFloK0JJZlY5UEpHQ1BDd2NBK0UzN0laclgxRkVCK0FaMFpqU3hGWkp0?=
 =?utf-8?B?WGJUdEZMZVdaOFc4eDVGUFpaMUR1Y3FjeGUvWm53Vlp5ZEJINFpBQnNnYU1Y?=
 =?utf-8?B?YnZkRzYzNU5GYWpIWWJIWUZSNk84a3p0YXpCT0dGVjd4c01nc3ZNeWxKbWY1?=
 =?utf-8?B?ZXZkeHJkanF2ZDZoRXB3d01ad0pIZDA3dXFJWTg4bERkeEtUOFBiU2N6MDNR?=
 =?utf-8?B?dlk2N1hldFJYb1dzekt1VHpZYWlBZnJmUDBxSk9QZysvbGdwK1Z5YnVCSnpr?=
 =?utf-8?B?NWR5NzNTYzRnRmh1cnZCSnp2SktRUmNuOVBlV3plMmlYN05IbHlEUlJGdFlK?=
 =?utf-8?B?aEdGZllJelZnL2hrZkx2NWVFbGdrR3U2WHpLd3RBWVVjVkkxallWRDNHWHE2?=
 =?utf-8?B?RkFHU3llUStnaEkvdUNBZGZYT0UvS1ZHODFvTk9PaURtckJVZ2E0LzhlYzFm?=
 =?utf-8?B?RVlwRWRLeGROWlo4VWF0Znc4emNTZEw0TSszOUNKNG5uelpkL1F6eGZINHNh?=
 =?utf-8?B?c0M2VFJyVEpZcU40ZGhvbys5aW02bWhMMG9ZK1dHd3dUbUF2eHRLM0I3YS9D?=
 =?utf-8?B?VmlvMGFvMjR4RHF3TmJHMm9CdGIwODBOcnd3OHQrWkJsenRrNkhBNFluNytk?=
 =?utf-8?B?MUszNE50QndxZ2RyOVNodFBmTDJLT0lTOUdQdUp6aVdGOVVSRjIxTWRNUG9U?=
 =?utf-8?B?QjJ0NGorclowbUZKK3ladmJHbWhuQWEzWFIrN1RRdnVzeDFEWDVGcWtvSVRV?=
 =?utf-8?Q?skrKvNLgM7eGIBtxDxT4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbe4601-6daf-441c-5845-08dcd40c574c
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB2042.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 15:54:25.1658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P194MB1614

On 05/09/2024 13:50, Alasdair McWilliam wrote:


>> We've been working recently on somewhat related issues and it looks like
>> not every commit from [0] has been backported.
>>
>> $ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
>> 5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
>> 8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
>> 15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
>> 3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's
>>
>> can you apply the rest of it on top of 6.1.107 and see the result?


> 
> The first one I've attempted doesn't apply cleanly to 6.1.107.
> 
> Eg: d59227179949 ("ice: modify error handling when setting XSK pool in
> ndo_bpf"). The above looks to have been based on code from around 6.8 or
> 6.9 where the makeup of routines like ice_qp_ena() has changed. Looks
> like this happened around a292ba981324 ("ice: make ice_vsi_cfg_txq()
> static").
> 
> Should I try and apply a292ba981324 as well?
> 

Good evening,

I just wondered if there was perhaps any further feedback on the above.

Thanks in advance!
Alasdair.

