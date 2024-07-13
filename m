Return-Path: <xdp-newbies+bounces-118-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A985930647
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 18:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA381C20DC5
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 Jul 2024 16:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D2131BDD;
	Sat, 13 Jul 2024 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/jvxZYW"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66518C38
	for <xdp-newbies@vger.kernel.org>; Sat, 13 Jul 2024 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720886679; cv=none; b=Hr6Sr24/+sP1zSk3jTpZIScn7gBCJKqGNuQEVN2HmxoepQw6HpGR4yM5bkxAtw97xiYfw207QLdyQomPg6XHM3eOdgR81DN8hxtGqjiH17XO5kQ6ddlyyjSdhxNxVS/RdX7O+fuMtGp4z/hV5IG+FBj04sHoOnxq1/1+ZpSkLgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720886679; c=relaxed/simple;
	bh=FN99jXgkrMRh9Zl1TsmJonsDr6bUCdO6DvDGcsY60KU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKvqBSHHPDVEpHo5C3uEdi1TElVTM3PL/pnKY5MPKjZmEn6F3ce0kGWRQxqy9W5xCPY82+A4Gwu8HxbzOUhwO7DMw+Iqc1xWKvCqnUPjVlhI2YAuFDUnkOGVfdC/W18Kj6ckVS/tJXIAmj4En1P07KyM/9vPRdU001oNJy375jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/jvxZYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43844C32781;
	Sat, 13 Jul 2024 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720886679;
	bh=FN99jXgkrMRh9Zl1TsmJonsDr6bUCdO6DvDGcsY60KU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k/jvxZYWptpVIzDxszdrLjNQwdW23TAoitNRmJVvwAPVIN436CUDZTookrYn9XVrs
	 6RkBT8yUwdpocEk0ctq1Hk7BfxxSiZM3fiMO4Z/DEXuHmjvGs0u64lz7vh07tWPFg/
	 +bXd9/5BBOzMrqtHP1ZEziIszcm0rqlTrPu4vTJcBWVsh9rHGNbHMeGmAf43q6EDrn
	 avSJ3PUm0fVx7nhmxRRrVJkzGlOHflKZNlVK0ck4KUKxIwRy1dZGe9oONLQv/xLIg7
	 y89EQDfInFw5Dh6Skh6KjCkozAKvmkUkcQJjjwcuc1I4QzYzTRZGZIykT4SBlgo63s
	 hRzTUrqjLIduA==
Date: Sat, 13 Jul 2024 09:04:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Srivats P <pstavirs@gmail.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: mlx5 AF_XDP zero-copy queues
Message-ID: <20240713090438.37e19696@kernel.org>
In-Reply-To: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
References: <CANzUK58QbpEgQGY-O1ixwZp=6VM92_ZZZcr83o3nomi=S0VArw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Jul 2024 12:23:31 +0530 Srivats P wrote:
> I'm seeing a behaviour difference between kernel 5.4 and 5.15 wrt the
> AF_XDP queues used for zero copy. This is specific to the mlx5.
> 
> Assume you have 'n' queues configured on the interface.
> 
> In 5.4, you had to use n to 2*n -1 queue numbers for AF_XDP zc. Using
> 0 to n-1 queues would use copy mode.
> 
> In 5.15, you have to use 0 to n-1 for zero copy also. Socket creation
> fails if you use queue >=n.
> 
> Also, with 5.4 netdev stats would not be incremented for AF_XDP
> packets whereas with 5.15 they do get incremented?
> 
> Can someone confirm this behaviour change or point me to relevant
> mailing list discussions or some other information on the same? My
> google-fu is failing me.
> 
> When did this change go into the kernel? I can't find anything in the
> kernelnewbies.org changelog between 5.4 and 5.15.

Hm, can't find the relevant commit quickly either now. But it's
intentional. The new behavior is how all other drivers work.
Hopefully this change isn't a deal breaker for anyone because
long term the lack of uniformity among drivers is a PITA.

