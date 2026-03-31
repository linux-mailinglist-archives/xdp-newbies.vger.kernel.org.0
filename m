Return-Path: <xdp-newbies+bounces-198-lists+xdp-newbies=lfdr.de@vger.kernel.org>
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPFcEkDHy2lLLwYAu9opvQ
	(envelope-from <xdp-newbies+bounces-198-lists+xdp-newbies=lfdr.de@vger.kernel.org>)
	for <lists+xdp-newbies@lfdr.de>; Tue, 31 Mar 2026 15:08:16 +0200
X-Original-To: lists+xdp-newbies@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D089369F2F
	for <lists+xdp-newbies@lfdr.de>; Tue, 31 Mar 2026 15:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35D28303AE04
	for <lists+xdp-newbies@lfdr.de>; Tue, 31 Mar 2026 12:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF633E316C;
	Tue, 31 Mar 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="YShCU8gQ"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B13AEF33;
	Tue, 31 Mar 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961837; cv=none; b=oqQNTRdx8zfsPTgXE+cF2MfijW5P+8X0uM4Bh1cZMar4yQGpNcKzHlXh1Kqv++e3rH3ayVDZeWvfWQFw59gPgS8KLRcqlPaT96lBMPvseyhez/tBtjOxzJMygnTEZMVHV085hBug845RfFfPYJTnXYfleombItiJT1Os2GxRTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961837; c=relaxed/simple;
	bh=0U25bYtFjVVWOw0Fyb+E9vbcnPC+AThYCcohTtmdMdk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jKOOfa/E3heUIAD3jL2OjUHXGDUvqMhCUoA4PkYdYDbaCbKB4cHWuwWFNo3IhXYWqZGkA2ceVvbgukELshJsM6gxuFKL4hBsBnVdgDq/Pt7Zkk5h+UjFVTAnDs0Obxe4029SzrfcoBniz2KjeBO0sf/gqDuSNY89EdJJfr2yVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=YShCU8gQ; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=wt6DiEMteCEm1lhgoNFvSLYoFznRlgRcQ6OPddERu2k=; b=YShCU8gQvPDkVEjKYzf3B+jHjU
	RXAJwAU+tJQO3JKFQqadVzLm1K/PW1hSpzdiA0ZwD/5js9IjvA14tyB8E/vUH3ldBbL0Rg/SK5tbQ
	cKzqzylen2SjjOB9WDUd3SczzO3F0MMfD7wRQVi3ONW9DK59+rosVLyAPwSiQKiiRcxYXuMMxeBOV
	1YI03Z8ID2oqD3DOO04P5qFSXQ2v5i2VvgHMTKexSei+eq1DUUY0cHgzFljgPf8XGEHMVq3aZgXS/
	GyXDfKHtdp5+Z7iFKowGFa78L5zrN8jqB1KmVm06SbQI4gCwpAKMLgNV6gP2poiJr0Hetclnr5QW1
	QD858xQA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1w7YeY-000EQY-3B;
	Tue, 31 Mar 2026 14:57:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1w7YeY-000EU1-1U;
	Tue, 31 Mar 2026 14:57:06 +0200
Message-ID: <70b21729-7c07-49a8-ace7-c67ec985ba8c@iogearbox.net>
Date: Tue, 31 Mar 2026 14:57:06 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: bpf@vger.kernel.org
Cc: xdp-newbies@vger.kernel.org
From: Daniel Borkmann <daniel@iogearbox.net>
Subject: [ANNOUNCEMENT] LPC 2026 BPF Track CFP
Autocrypt: addr=daniel@iogearbox.net; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[iogearbox.net,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[iogearbox.net:s=default2302];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iogearbox.net:+];
	TAGGED_FROM(0.00)[bounces-198-lists,xdp-newbies=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@iogearbox.net,xdp-newbies@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.913];
	TAGGED_RCPT(0.00)[xdp-newbies];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lpc.events:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iogearbox.net:dkim,iogearbox.net:email,iogearbox.net:mid]
X-Rspamd-Queue-Id: 3D089369F2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We are pleased to announce the Call for Proposals (CFP) for the BPF track at
the 2026 edition of the Linux Plumbers Conference (LPC), which is taking place
in Prague, Czechia, from October 5th to 7th, 2026.

Note that the conference is planned to be primarily in person. CFP submitters
should be able to give their presentation in person to minimize technical issues,
although presenting remotely will be possible as a last resort.

The BPF track technical committee consists of:

       Alexei Starovoitov <ast@kernel.org>
       Daniel Borkmann <daniel@iogearbox.net>
       Andrii Nakryiko <andrii@kernel.org>

We are seeking proposals of 30 minutes in length (including Q&A discussion).

The gathering is designed to foster collaboration and face to face discussion
of ongoing development topics as well as to encourage bringing new ideas into
the development community for the advancement of the BPF subsystem.

Proposals can cover a wide range of topics related to BPF covering improvements
in areas such as (but not limited to) BPF infrastructure and its use in tracing,
security, networking, scheduling and beyond, as well as non-kernel components
like libraries, compilers, testing infra and tools.

Please submit your proposals through the official LPC website at:

       https://lpc.events/event/20/abstracts/

Make sure to select "eBPF Track" in the track pull-down menu.

Proposals must be submitted by July 24, and submitters will be notified of
acceptance by July 31st. Final slides (as PDF) are due on the first day of
the conference.

We are very much looking forward to a great conference and seeing you all!

