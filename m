Return-Path: <xdp-newbies+bounces-147-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D727798835D
	for <lists+xdp-newbies@lfdr.de>; Fri, 27 Sep 2024 13:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4C0B20D69
	for <lists+xdp-newbies@lfdr.de>; Fri, 27 Sep 2024 11:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D34B1898E6;
	Fri, 27 Sep 2024 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xvTvUzl5"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3C176AD8;
	Fri, 27 Sep 2024 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727436768; cv=none; b=Lg4h228i6JVelNbbGHX5bU/EiexaUY8RLGsxHzkS12zOyvzVWRs507TIh/NuEkjbCwx1A4JlN0DB3WW7eeyKiMHIR94BJQkT/2ppSdnFeMKn/I30p0Rod6dD4Ml4WUpgZRj8xUNB+Op3wIPJHV7FCaLG41k2P/YnsQiJui2fQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727436768; c=relaxed/simple;
	bh=duX57oyLhoKpTyzjAk7vs5MmCQ8Z4jirm8hmOCPp9wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTorU5PLpZAtoSPK33CqidsPFufy151pqKu6kHDzoum4VpIooNFiBI7hqF1JZXePeW49X9/YC2vm1Brc3ujxT3d4pS9ZL4iwhLjW7j5HFvy0cyJGHQPvp73Z0LPADm5HRvtG3j2jTJQs8D7YTKUvon+O6jbNXU9P5gDF81N53hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xvTvUzl5; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Da742LiovLYLPXct+NL2MjHhQA5wMAaOqpb4JUdS7gA=; t=1727436766;
	x=1727868766; b=xvTvUzl55HVcuJBqXOs7APyRe5Nej6TeUr1sXGbiZiTpPno/JETGZW0ZDWdzl
	Ze0dYRamtD9oxm2xlexMtFn0J0FBuYV2Y2hNBvNmg9zRvEiB/xGFuJiW8LENWGP1iNUGEaC82eqBd
	5PgmLl/vVTNnMqPqsyuMNl9vX34lI11U5jYtJREM0Wz/orhx9mlvHu3arBdWaHJa20/8EJc0pF7zf
	W/7rnxh9YrUZTQ/XusorH/S9aBDyZbLrkXHPHdJ80lDG3R8vVnfg3R2TyLXO/iRim1YqQWgQcMojJ
	TmMlnlnbe8zLhmllE0C0J5V7JR1Y+QZD+NWgZQ8s6hHkVdifpQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1su9DH-0003GD-Bn; Fri, 27 Sep 2024 13:32:43 +0200
Message-ID: <30bd4ecb-961b-404a-ac3d-9c25c8269e4d@leemhuis.info>
Date: Fri, 27 Sep 2024 13:32:42 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ICE + XSK ZC - page faults on 6.1 LTS when process exits?
To: Alasdair McWilliam <alasdair.mcwilliam@outlook.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@gmail.com>,
 "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Larysa Zaremba <larysa.zaremba@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev <netdev@vger.kernel.org>
References: <AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <CAJ8uoz0XANzvCwdJYUaY=CcK__AfL7x-FvjQKLCbngZT3_=2gw@mail.gmail.com>
 <ZsiYE9j5DK79h1+/@boxer>
 <AS8P194MB204216F8B886FBE04D1B51FD86942@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB20428CBC955EF3E67DC8535B86922@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <Ztg23DO9q2O7vJ4D@boxer>
 <AS8P194MB20422D0DAF2767F6D3B2E3F7869D2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <AS8P194MB204213A1F56409CBC709B9CD86652@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1727436766;9cedb120;
X-HE-SMSGID: 1su9DH-0003GD-Bn

[CCing a few people that were involved in mainlining the culprit
(8adbf5a42341f6e ("ice: remove af_xdp_zc_qps bitmap") in case they want
to provide advice]

On 13.09.24 17:54, Alasdair McWilliam wrote:
> On 05/09/2024 13:50, Alasdair McWilliam wrote:
> 
>>> We've been working recently on somewhat related issues and it looks like
>>> not every commit from [0] has been backported.
>>>
>>> $ git log --oneline v6.1.103..v6.1.104 drivers/net/ethernet/intel/ice/
>>> 5a80b682e3e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
>>> 8782f0fcb19d ice: replace synchronize_rcu with synchronize_net
>>> 15115033f056 ice: don't busy wait for Rx queue disable in ice_qp_dis()
>>> 3dbc58774e58 ice: respect netif readiness in AF_XDP ZC related ndo's
>>>
>>> can you apply the rest of it on top of 6.1.107 and see the result?
>
>> The first one I've attempted doesn't apply cleanly to 6.1.107.
>>
>> Eg: d59227179949 ("ice: modify error handling when setting XSK pool in
>> ndo_bpf"). The above looks to have been based on code from around 6.8 or
>> 6.9 where the makeup of routines like ice_qp_ena() has changed. Looks
>> like this happened around a292ba981324 ("ice: make ice_vsi_cfg_txq()
>> static").
>>
>> Should I try and apply a292ba981324 as well?
> 
> I just wondered if there was perhaps any further feedback on the above.

Hmmm. No reply afaics -- but that's how it is sometimes with
stable/longterm kernels series, as mainline developers are not required
to participate in their development.

Still it would be good to fix the problem. So unless the developers come
up with plan, it might be best to just revert a62c50545b4d in 6.1.y;
guess asking Greg to do so might be best way ahead unless some solutions
comes into sight within a few days.

Ciao, Thorsten

#regzbot poke

