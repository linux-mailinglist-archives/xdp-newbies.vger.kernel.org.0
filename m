Return-Path: <xdp-newbies+bounces-197-lists+xdp-newbies=lfdr.de@vger.kernel.org>
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAEQHK/PhGk45QMAu9opvQ
	(envelope-from <xdp-newbies+bounces-197-lists+xdp-newbies=lfdr.de@vger.kernel.org>)
	for <lists+xdp-newbies@lfdr.de>; Thu, 05 Feb 2026 18:13:19 +0100
X-Original-To: lists+xdp-newbies@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE958F5B97
	for <lists+xdp-newbies@lfdr.de>; Thu, 05 Feb 2026 18:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA1DF3003D0F
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Feb 2026 17:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5AA43C05E;
	Thu,  5 Feb 2026 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHTkgegl"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618302727FA
	for <xdp-newbies@vger.kernel.org>; Thu,  5 Feb 2026 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311596; cv=pass; b=mVLgHA69Eo/9q/p9g9qlBoITM7KxbQGf5g2ODrJRplaO/1dU9zxmxvNVTgI513oDbqvPEDNbKnS8zKBzNEcq6yawaj/+OeZtaKvEqd+Gup1dFuKv5XhFTbXUlaPkXGOkZbT8al3CNZSsmKMRGJ18dC8a8vBXZiVDUc/R4Cg/Y94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311596; c=relaxed/simple;
	bh=iCmYGtE1hg2Fe/ghCC9Y5ylBmmirHhiSvF48WAXz/b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tX5LwbeTWlN+CLIwRA8tSVKiKC+fYtKkMXADRmwbRFAVE8DTKeACYvIaQiN9/HzvCRp0rdX56f3VLR7lISdnzT1lSmEIKBZ1nsfRqfBs01fH2+b2VTh4iXwQUjiY4oHFW61Rv3HlIjQtrezE+MgiSQrQNRKchy/i5OpCTh85LuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHTkgegl; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-354a5da7910so451692a91.0
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Feb 2026 09:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770311596; cv=none;
        d=google.com; s=arc-20240605;
        b=aOuEHMEKHFP0SUXbOMUgacSOV2MMUK8JIFtzPZWN+5KqXZ+1dELokkiadQmXcF1S1U
         Sv6hqNPahrt5SsHblKaLR4TcAdYiQ6Q5YB2PKxfSJrY+s/CJXI/ZSscP4FwYrwatZkif
         /c1+Mtuv6Fj7EFLdBYi0I5JdFmJ8Exs31EhQMpkLeaor/zXvQCwCEbECpz2cOGcReb1X
         tCGBXb0b60sjTmw39i3AjW8lZ2pcNaGv92rvuW1Fv+vRx/+kLb+R0ezoJ+wT0atooNei
         KfH3CnaluZmzyWYBz+FFvaEI0y2rtHqQpLTmclzRCIoavetH/yYuqlzOmsbKu6uDBmMB
         7Haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2UtCCJfMDf7evVJJY9kLqBJWfL6aPPtjOhhryNFEQE=;
        fh=iw9gstKzGn5GHzK59z+m58yUkFuAvPSF7jQbslBzd14=;
        b=GX4vDYCMjrHEmnxm2qMWxusXhpoV6gRLpl+l0vGoqqPyAiK1BYsuHsvGabiuvXx+JT
         6t9YjQcSNkXI5e2NY0vPXy55it8HSgE9NwPiTer1I2reWlu13/aDYyaZx6NsypYtkZO0
         F4kMyaKfBWxltEVvcDaF5R8ANKvf05zFhoxo8k41Uk0NbbxiLMyXThBFFDL3beWurlb1
         opLHr26fXcctYxW/Syxak5oRxOyFTV1fwjCt4asRhwuxIXu9knTXqBHw/ABhb1tcX5jh
         S0rONbdJGUobozWtFr9G9eoakLAWJZaQpU/ex3Ts63JRVvhanzKaQfC0s1aNfKYjQtMC
         ODBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770311596; x=1770916396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2UtCCJfMDf7evVJJY9kLqBJWfL6aPPtjOhhryNFEQE=;
        b=EHTkgeglGpOW63UirTAPwUXTMtqIF0TnX3iVt3WG9Mg4xuy+fzcUl06+bHLZ/7T01o
         cnaZoPEehOEyWOdHakA+cLJK2Fmlw7lep9DcYQvFJ+J5z3WW8YeSFrkJvfKIIVXjgE8q
         y9KDV38BBWkZnHLShY2GFeZWpE9cSSyRemiyk/I7lSTMqJ8prXZPRG7N73uikMGR36T/
         yjGR0tDM/8YC7gOy4PZ0g1qFIg/SdA//068ma9Qx5G3396PyghzGLq/BCghwMN4c6vbe
         Al9J8ZMFRxQiGuvR4NdsrJLO0vJJn16feHsflwkEba8clZ7uxuwA/krr/YIEu9FKLSTB
         AYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311596; x=1770916396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2UtCCJfMDf7evVJJY9kLqBJWfL6aPPtjOhhryNFEQE=;
        b=i6qiRk/CR0YS5YG91RoztSBC53iTgZ3b4l6bnGqj11Uo66kdzHWy4Xc7NtPYxv2IxR
         slC7zs6DLfDKm1Z/ryQ18YR30W0s+ezfJxbBvYoGpOUWb+xZ5RtWtZV0X9emQelJMFMl
         x92E3B3bYscQSjpZD78wS7ZucSTNx2Gw+J60K7AYFc9PBmEzn51FbgRvpkSG0Iw1UkGG
         8uZRbSAS/J8tZujRvLGzWHN8v5QhMwhIerlef0QdbVa4GbXPFSVkoETlYA2dYe8wEmGz
         n9nRsOqpl9UMfB6jgN/BqaQdSF8i1EvNIpMH7C0VqRrtQTU6ktL9dH20G1GGSMNIVabV
         wLmQ==
X-Gm-Message-State: AOJu0YwjYzUD/7nm2RVHbtV+QCHEOT87aq7PwgWmChvekAoXOVZYvbVa
	jm1HpfHIGwt5XVljUjlszmmITPfebxYnJZs5rTtv02eoOyHkNaC7BNPR7uv7/pM30AhoVZLevth
	pSXvWrF2oPhAMBTCfu/R3b1XReZvhlKw=
X-Gm-Gg: AZuq6aJhP/hiuo5wBH46d7uxrTudkWUmoQTmJTyiLtEj2vDxjCuNKIzFg41LLs9kZ6h
	dPkyzXyvtV4pDkkujoNEKd3zK8az38XieIjqwy9GxhrRstd1p7lTpSTRM3YpTc4rB2I38oPRxjN
	sD0mTlQOOtiYxb6qHwidfn6UoUJFR9DAQp1y2ylB3PzKSavRlkesezBU7qUqrapjBsw+5ZM0JNI
	VQYhXAXyR0N9kZ9gN4SdufaLGcFSK6FrOg1kE5HZEZDLgi1XTTtkyq6vcu/AGKnDSydR0clRw==
X-Received: by 2002:a17:90b:57cd:b0:354:7be4:a241 with SMTP id
 98e67ed59e1d1-354870f9aebmr6993785a91.15.1770311595505; Thu, 05 Feb 2026
 09:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7A889013-CC4C-4015-9116-658A393CDAE1@darktrace.com>
In-Reply-To: <7A889013-CC4C-4015-9116-658A393CDAE1@darktrace.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Thu, 5 Feb 2026 18:13:04 +0100
X-Gm-Features: AZwV_QiVOp2R6OSO_DdDiAqdWwjS7fr32vG7Mpr_fWEuA0JWGBUWcxKeNiaUq-o
Message-ID: <CAJ8uoz2Nhj27XDDkwTsXnbBOyugMROQD2jsVE7k=C8kcFYVbeQ@mail.gmail.com>
Subject: Re: Xdp multiple sockets over several interfaces
To: Matthew Bannister <matthew.bannister@darktrace.com>
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-197-lists,xdp-newbies=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[magnuskarlsson@gmail.com,xdp-newbies@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[xdp-newbies];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darktrace.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE958F5B97
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 at 17:39, Matthew Bannister
<matthew.bannister@darktrace.com> wrote:
>
>      [DTL0]
>
> Hello,
>
> I am having a problem with creating multiple sockets from several interfa=
ces. I create them all with `xsk_socket__create_shared`, from reading the L=
inux docs, my understanding was that I can create any number of sockets sha=
ring the same umem if each unique interface/queue tuple has their own fill/=
comp rings.
>
> I can create as many sockets as I can if using one interface but then whe=
n I bind my next interface with its own fill/comp rings any subsequent sock=
ets cause the xdp_bind to fail with (22 - invalid arguments). I can see thi=
s is due to us checking against the first netdev device bound to the umem. =
Meaning any subsequent sockets from any other interface are treated as uniq=
ue and therefore fail because either they are duplicates or passed with no =
fill/comp rings.
>
> From briefly reading over `xdp_bind` in net/xdp/xsk.c I=E2=80=99m thinkin=
g there would need to be a list of previously made sockets (not just tx) th=
at can be checked to determine if the new socket is has a unique netdev and=
/or queue.
>
> I stumbled across this gitlab post of someone asking for this functionali=
ty: https://github.com/xdp-project/bpf-examples/issues/85.
> Are there any plans to implement this?

Not from my side, but the feature would be welcome if someone took a stab a=
t it.

> Thanks,
>
> Matt Bannister
>
>
> --
> Matthew Bannister
> Software Engineer, Darktrace Holdings LTD
> matthew.bannister@darktrace.com
>
>
>
>
>
>
>
>      [DTL0]

