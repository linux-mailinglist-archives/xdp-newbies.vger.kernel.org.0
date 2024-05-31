Return-Path: <xdp-newbies+bounces-88-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B58D6AFA
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 May 2024 22:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6281C2507D
	for <lists+xdp-newbies@lfdr.de>; Fri, 31 May 2024 20:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECF917D889;
	Fri, 31 May 2024 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="TtXj1Fn+"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAE97D06E;
	Fri, 31 May 2024 20:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717188182; cv=none; b=eXMKsurp+Rqwl0gyDCif4Q32zD9ZYFeiQpx/4HVGAoJa/7Ds7aPYb7FzSjKp77K2hwE/kzinI9lPLBDCwX4SF7YTkPrT36Nb1pILFLwXeBqhS0mXCB4vso6My6+aJhky44BlDjEsBe5+h8E6BGxb2uDL7Fd1MxJJ0HOi23oukhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717188182; c=relaxed/simple;
	bh=oclolw9Fei/y5RKiWWx9yf16qkjPQ57CCd5agdKlw88=;
	h=To:Cc:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=iAhVfpYk0ITY1ycR7wrlvR9uOQjBAoxwgRRzDvubAUyp1D8ADg3+uhrdkvamnY76kogEkju3Lv1tJzewPF/CgfOoR9UM6u7cbSGoV2c9jsam4lh3ZjmCxn3FyjIk310v8QKQgPjJhdMxFzMOjYuHiLRhdbxcDGTrsq5bteMz52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=TtXj1Fn+; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=I0/7bKmMexC+bzRjZPRSWWJRNLBu3K4mqV+QnbNuiSQ=; b=TtXj1Fn+t3HG9v6ZnU4pZ1CCeN
	wWLex3gs9IepN2Ws/GZd+lK8Z4+x//mb6niRCdFJBmt46u/tapPAyqYY714H2TR4Kpo9Syl+XX4/g
	d9rmhwa2sPdi2eknZu9L5p33WqqRtHmgfKKH/+2wzfZJo0Ts6Lpp2w9luNq3npnMBgQq9r/v9jCtj
	Rlp/wtHtTFteMSjrFg+wIju+3DTfSKdU5E/MdfTOHZTXqoj/7DgbUwmwQJq3FHjyHAubZExB4DxXu
	kBP6RaHqUzzFvUDkWJbnSkUc5SbgzYxOBFMi948ICCPQjqj/Ss9NbSpbarj7wsjo68ei3DcFT4NmZ
	TYdnm3CA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1sD95U-000P09-Qt; Fri, 31 May 2024 22:42:56 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1sD95V-0006SF-0q;
	Fri, 31 May 2024 22:42:56 +0200
To: bpf@vger.kernel.org
Cc: xdp-newbies@vger.kernel.org
From: Daniel Borkmann <daniel@iogearbox.net>
Subject: LPC 2024 BPF Track CFP
Message-ID: <63792467-9be4-0d84-8fd1-93f63bcee3d9@iogearbox.net>
Date: Fri, 31 May 2024 22:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27292/Fri May 31 10:31:14 2024)

We are pleased to announce the Call for Proposals (CFP) for the BPF track at
the 2024 edition of the Linux Plumbers Conference (LPC) which is taking place
in Vienna, Austria, on September 18th - 20th, 2024. After four years in a row
of co-locating BPF & Networking Track, this year, we separated the two in
order to allow for both to grow further individually.

Note that the conference is planned to be both in person and remote (hybrid).
CFP submitters should ideally be able to give their presentation in person to
minimize technical issues, although presenting remotely will also be possible.

The BPF track technical committee consists of:

     Alexei Starovoitov <ast@kernel.org>
     Daniel Borkmann <daniel@iogearbox.net>
     Andrii Nakryiko <andrii@kernel.org>
     Martin Lau <martin.lau@linux.dev>

We are seeking proposals of 30 minutes in length (including Q&A discussion).

The gathering is designed to foster collaboration and face to face discussion
of ongoing development topics as well as to encourage bringing new ideas into
the development community for the advancement of the BPF subsystem.

Proposals can cover a wide range of topics related to BPF covering improvements
in areas such as (but not limited to) BPF infrastructure and its use in tracing,
security, networking, scheduling and beyond, as well as non-kernel components
like libraries, compilers, testing infra and tools.

Please submit your proposals through the official LPC website at:

     https://lpc.events/event/18/abstracts/

Make sure to select "eBPF Track" in the track pull-down menu.

Proposals must be submitted by August 1st, and submitters will be notified of
acceptance by August 5th. Final slides (as PDF) are due on the first day of the
conference.

We are very much looking forward to a great conference and seeing you all!

