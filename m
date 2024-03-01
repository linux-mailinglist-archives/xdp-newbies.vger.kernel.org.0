Return-Path: <xdp-newbies+bounces-53-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA586ECB8
	for <lists+xdp-newbies@lfdr.de>; Sat,  2 Mar 2024 00:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0F51C218A1
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 23:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520DA5EE79;
	Fri,  1 Mar 2024 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=aibor.de header.i=@aibor.de header.b="CyV/FvUe"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EBD5EE7F
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Mar 2024 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709334649; cv=none; b=ONoF9+BY1018aMy7ip4S1uF1XWOKz3QZ75eHUlJK0OCrtxGB4B7vQsBo4qokjxqiRw2DuOkPvF0XcmI7Z+5XAHjULbYmPT9vbymECGA63aYESJ18Q5MWPkyh034AZBXTZSIXh334jsqMkW+YqNe5KoPnc4opWf+NsnZnF6dgxDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709334649; c=relaxed/simple;
	bh=8nC/ceW8olJ5iQejJ6JWEamggOAV+xEnrY06hXgr1AM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjVJifqYGB3+UIN/8nGdVdpJny40jF8Bj9TORRIvMJNiiEcOJXS6LDT0g9OCII7xHe3h686o4aQkt/P8mzukrbCd15qU7Ua4B8n52i2kHzjVvcAdbakxE+Za95SlDW0K4Bsa3DGuU5Wom/A3a7rXq4sUk5UlTQqWluE4QpIbYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aibor.de; spf=pass smtp.mailfrom=aibor.de; dkim=fail (0-bit key) header.d=aibor.de header.i=@aibor.de header.b=CyV/FvUe reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aibor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aibor.de
Received: (qmail 14425 invoked by uid 990); 1 Mar 2024 23:04:01 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by boethin.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 02 Mar 2024 00:04:01 +0100
Date: Sat, 2 Mar 2024 00:04:00 +0100
From: Tobias =?utf-8?B?QsO2aG0=?= <tobias@aibor.de>
To: xdp-newbies@vger.kernel.org
Subject: cpumap infinite loop
Message-ID: <xgct6vpbwh6c5zjljdc6ypa5hbmcw4bapebdh4eetxwjama3so@iq3xdtavnq4g>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Bar: +
X-Rspamd-Report: R_MIXED_CHARSET(0.833333) BAYES_HAM(-0.156098) MID_RHS_NOT_FQDN(0.5) MIME_GOOD(-0.1)
X-Rspamd-Score: 1.077234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=aibor.de; s=uberspace;
	h=from:to:subject:date;
	bh=8nC/ceW8olJ5iQejJ6JWEamggOAV+xEnrY06hXgr1AM=;
	b=CyV/FvUerCQO5ZGXltLqiplL1xs5zmD/215jCtttNsH9ncMxooRQecTRGZvCjbRq6fdsac1N8S
	Y3Ro+Y7+UbWgIZCI1wHtBiIYqpw9m0uTpxMzCyEoIFBBnCvpkqLq97oS6ob7N52V+P3HXI17rJki
	UqZ19bH3H+b1jSD1ElgzRi8DBkRRi5BxBIIdSUbEafFIg0dfl9+RfXpeaPMtq0bca2Yl7vM77b3E
	dM8Gp8GIAsmZAy3Vstz0sAEjI/VbkDS6EM0ND0Q8dJDwhwWVtO2ANXt7XfEMFSUSyuz7lw3Lv+2q
	reFcTQ8ZAVq54LYuLgEmxLz/2An8MJsvQNtRqQXinfVrfZStZMSDNycUgSXBZoSPo/uOz9nEVdbk
	SVwBj/gic99JliHjNu7qQxOeeFX2WNwlIEYmXh1B5xE1tgrY2tNnQJ3jN/524657ARm4qQTtGXRl
	R7z+RNgFJ+Lo+J79JhybvIgd6XSV0xAUlgsKL7Vmu4aRkIDyVXOsfrFUgmKD2p3tkY4ZKfL8ryXc
	Rv1vrAoSzCpz7IT6xJMsmeJv6ghkxqQcr6OwacSGpEcAlXPTtYNIlpCcJRLkkWxg1J4OtM7XDxxG
	ofZ9J/BNwfVLBnXmuhQpwHz16qbb92CPr67WCnzLwMiaZYiZ++TBVFeJcBtu94XPzQNlPuTgszp4
	U=

Hello,

I was playing around a bit with cpumaps and wondered what happens when
the attached program just does another CPU redirect to itself.

I ended up having an infinite loop. The working example can be found
here: https://github.com/aibor/cpumap-loop

Now, I wonder if there is a way to detect and break this loop. I took a
look at the xdp_md->rx_queue_index values. When executed by a NIC event,
the value is the NIC ID, so a fairly low number. After CPU redirection
the values I saw were far above the range of NIC queue IDs. I couldn't
figure out if it is just a random memory value or if this value still 
has a (maybe different) meaning after CPU redirection. Maybe somehow
related to the CPU queue?

If the field is set to a meaningful value I can make assumptions about
it and would be able to detect previous CPU redirection, I guess.

I'd appreciate any pointers and tips how I could detect such a loop. Or
maybe there is a way to prevent it in the first place other than "just
being careful"?

Thanks in advance,
Tobias

