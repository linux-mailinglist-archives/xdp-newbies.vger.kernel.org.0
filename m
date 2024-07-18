Return-Path: <xdp-newbies+bounces-122-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B8934CC2
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 13:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67DD1F229DE
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Jul 2024 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCC3137903;
	Thu, 18 Jul 2024 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="AiR1U3Mj"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBA59164;
	Thu, 18 Jul 2024 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721303305; cv=none; b=YvxjiA9D+Idt/wC4N8zBZGeZkckECbskWyZ7OP7znF0vcnmFz0zV5R91Kd/vDNwxbnFGd16myfjMJJIhqVJhMRqHhahehLLRncSC12a6Ow9/g4jAbcablBClrfTanFF630sZ0Pp3wxMK1n7iQk5arZFYpI9mTpL5wwPPRDEqNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721303305; c=relaxed/simple;
	bh=oclolw9Fei/y5RKiWWx9yf16qkjPQ57CCd5agdKlw88=;
	h=Subject:References:To:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FbZDSmInKLPvr9mDRlVL/uT41yjkcnK6nmCWINrI2bSeNY9Ql2fzRgAYR6TKA5z7JFqNlugEBPHbGzilDHmSbEzN0GrzAiytRBt2MkmOXIqkrB2SvRneVgwVUQh/Y0m1pb5Gsi0pkYY4TaxDiLk0k487coLznuAH28bBWmvtPqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=AiR1U3Mj; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:To:References:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I0/7bKmMexC+bzRjZPRSWWJRNLBu3K4mqV+QnbNuiSQ=; b=AiR1U3MjaVO49JHpLAFi50D1ap
	FMPUlmalOvdwLTF+pfYNh36JpA/+e9FkJl0Lk5jaB3n43rhDzJfhsancl3r2pM/U8buzBEL+6cuZ8
	rJfLje3IWrYfoDzqaxEPgDo1ipLxcAkwDi7Nl6+pJ3B0HjjAKi1qrM5nE48nGN1f+bOsjSx0/a9bZ
	usZdSRPLp5h7lr1wTDCJX64iSJ8zJs3WMurAaZclXyAG7f6XFBOQzrZ8cYPAjbUhyQ0ZxVyj7MSu+
	tLrrCQ1PPb7+Ww9z0K6p2mEW3u0waKmkK/NxUo94/Joqe7swsbANggHMauf6OR9wMiw5SoJ5qW+R8
	5w57A5mQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1sUPcS-0009sF-Ry; Thu, 18 Jul 2024 13:48:20 +0200
Received: from [178.197.248.43] (helo=linux-2.home)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1sUPcS-000Bu0-1p;
	Thu, 18 Jul 2024 13:48:20 +0200
Subject: LPC 2024 BPF Track CFP [Reminder]
References: <63792467-9be4-0d84-8fd1-93f63bcee3d9@iogearbox.net>
To: bpf@vger.kernel.org
Cc: xdp-newbies@vger.kernel.org
From: Daniel Borkmann <daniel@iogearbox.net>
X-Forwarded-Message-Id: <63792467-9be4-0d84-8fd1-93f63bcee3d9@iogearbox.net>
Message-ID: <15a43afb-5ae7-06a9-5817-7cc2126ad8f1@iogearbox.net>
Date: Thu, 18 Jul 2024 13:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <63792467-9be4-0d84-8fd1-93f63bcee3d9@iogearbox.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27340/Thu Jul 18 10:26:40 2024)

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

