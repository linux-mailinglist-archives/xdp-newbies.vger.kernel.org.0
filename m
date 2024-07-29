Return-Path: <xdp-newbies+bounces-127-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497F93EFE1
	for <lists+xdp-newbies@lfdr.de>; Mon, 29 Jul 2024 10:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 748631C21DA0
	for <lists+xdp-newbies@lfdr.de>; Mon, 29 Jul 2024 08:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3849113B2A2;
	Mon, 29 Jul 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="WBDmEZPV"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3519130A7D;
	Mon, 29 Jul 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722241655; cv=none; b=dmu8nwP2ZL9o91sDDPSKHDEthVE2XiCx4pmIZMJI7n7YgLPaqE3O4AA3oMTyR1J93pxf2PNAoieYYJnjXihDGhODQlqGdzOPeHWRM5vtGHU481aRHROBu57cs9WSgCn9SwbN1ZDr0nGmJKL9aw0MHH079opHN32MOuPvioshZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722241655; c=relaxed/simple;
	bh=oclolw9Fei/y5RKiWWx9yf16qkjPQ57CCd5agdKlw88=;
	h=Subject:References:To:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EKw5YrmCb/Vsn8Q9gXRqP6XpaLlADLa91OGfGd5pkIETxeo1JQdJopf8feUEHcHQ5tbXknfbePlnfuSUx+t6Rrw9q7aGPZJ8v99HBu49BR7aA0oxbhzGjfLM9wNV3jc9/MFWIbbP+RM0+4YMcLkZkVpmJaP4KcDhQFBrH0SEmzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=WBDmEZPV; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:To:References:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I0/7bKmMexC+bzRjZPRSWWJRNLBu3K4mqV+QnbNuiSQ=; b=WBDmEZPVGSf+Ou195EqPtW9ey2
	vheGhvFkbK2VaOslR0OhQv0BFfJzSK498KemeYuxTEI+tCTkzlVIZ8sNtKUse6GyE2TdylxWVRePC
	iEauiDU4VV50R3PUJgxYpshagCa4MMA97/h9TpPZ2s+0Vh48S51LJXPrRuoKV25t3C357vODOLaSn
	wBwJbsRNGSUZ0iQzFQrOq1ztiupRxvXQ+ek8C6t/Abevv5LLmwNQSYjyk7mun4Ld42ixE8LY0kXV0
	aY+aRmTUqcRGFBSMlm+Nufq+W6oDTOdvlZ4X2PJaoy3XIMjijW2x/8T7GOjqq9YT+MCESMclFEQFi
	XDmkJ3rQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1sYLj2-000F4M-Mj; Mon, 29 Jul 2024 10:27:24 +0200
Received: from [178.197.248.41] (helo=linux-1.home)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1sYLj2-0001uO-2a;
	Mon, 29 Jul 2024 10:27:24 +0200
Subject: LPC 2024 BPF Track CFP [Final Reminder]
References: <15a43afb-5ae7-06a9-5817-7cc2126ad8f1@iogearbox.net>
To: bpf@vger.kernel.org
Cc: xdp-newbies@vger.kernel.org
From: Daniel Borkmann <daniel@iogearbox.net>
X-Forwarded-Message-Id: <15a43afb-5ae7-06a9-5817-7cc2126ad8f1@iogearbox.net>
Message-ID: <09aabf76-35f1-d840-d797-4e1252aadec1@iogearbox.net>
Date: Mon, 29 Jul 2024 10:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <15a43afb-5ae7-06a9-5817-7cc2126ad8f1@iogearbox.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27350/Sun Jul 28 10:25:11 2024)

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


