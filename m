Return-Path: <xdp-newbies+bounces-3-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3927FEE15
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Nov 2023 12:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD591C20F00
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Nov 2023 11:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C723C6A1;
	Thu, 30 Nov 2023 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3GCq3+W"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B9A93;
	Thu, 30 Nov 2023 03:40:57 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so825127276.1;
        Thu, 30 Nov 2023 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701344456; x=1701949256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvaLHbJCEErHLC/pLfwftE3fhaR2hLQkskuD/aNKmSo=;
        b=j3GCq3+WVJP7hwGqPWw+wtNktR1+Z6z6TEB9Y+LDITHFuIb/zcs9XTRTINOuZqoUxd
         uD3kBNe6VRAGNH8SFBBXCVGe+dEuL/D/KdIPQuRETqF3I3ZEV5q0fE2UO4gdSJoImtiK
         +bWqmeQlYzIwFoim9Gpf34nUl941gYoEkZRPCE48IFNdyApVobYwgYCMNrRSk/2G5/xl
         Gkfqd2MNEzO9R9WNs2p0kbRpkBfnLFAWAKi4qlxtpdMuGgmLyzKG3Xmq86L1sOqb2fQb
         ut68/5cPrThMcB1mFOmQObM7cJI/YGJZrRPmLkraGdSOnqWIHtKa2fs4kXXaZLfi4PEo
         LimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701344456; x=1701949256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvaLHbJCEErHLC/pLfwftE3fhaR2hLQkskuD/aNKmSo=;
        b=soh3znbfrzoDJpY9jFUWODi6KIayQaFltFM6rC0YNQUAUrnea3lEjD6qhH/9gy3clB
         m6juznIg73ZEpWE3UPk/ptK6M/dcMRbdIBPpxanp0VtxqoFzeffIAis2/MM1+Y6nJ4qv
         vjfO+iXolMSSE5uhKnZ/jHmxF9ZIbtHilo/zCB7Dy3Fd5zg4B1n3LxuWowa4jRA1Xesu
         njZkbxL1dhls6cs3thp1R9cMnhxMoWaGPLGtLC5MtLcW4ay2ldaD3cdrfzlLozubRsH0
         RRGn8HOF4ZBuJqM8u1oMPpaSAw+nkU4E7gOrzkgEZqpZsjvcJGm+ijYcdxj4+nz2yuu3
         SFvg==
X-Gm-Message-State: AOJu0Yxu0l9kbMnEixS89RqKU6cgBMC4bWqgUx9xGjTsLrKgs2fki/YG
	utJpvX5/3ZzVRr3ZUUQfdiIr4TY5INupw/6PTkZki+CEQiw=
X-Google-Smtp-Source: AGHT+IHoZ3XEmYfSt0WqaffmK9uZJZcrVjl7tNXx01RNg90Dtlgvd2zARk47OgRUrDP4S/YC+LkkyZs/5/VJ1G8rRek=
X-Received: by 2002:a25:ad1e:0:b0:d9a:485f:5852 with SMTP id
 y30-20020a25ad1e000000b00d9a485f5852mr18783817ybi.13.1701344456349; Thu, 30
 Nov 2023 03:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANzUK5_qwaRm=9c46yH8d_J54PAcNhZB-R5M=wYgXGGaJJaFAA@mail.gmail.com>
 <58e538d6-d1cd-4689-694e-e14d91c47d41@redhat.com>
In-Reply-To: <58e538d6-d1cd-4689-694e-e14d91c47d41@redhat.com>
From: Srivats P <pstavirs@gmail.com>
Date: Thu, 30 Nov 2023 17:10:20 +0530
Message-ID: <CANzUK5-ys2A46MWKjAO7F_aF6cSN8rnPrRAY3eb_nDYRuCNV7A@mail.gmail.com>
Subject: Re: netdev stats for AF_XDP traffic
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc: Xdp <xdp-newbies@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, brouer@redhat.com, 
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

> > Is there any update on the "consistency for XDP statistics" [1]
> > high-prio work item from the xdp-project.net project management page?
>
> Lorenzo (cc) have done cleanups in several drivers, both mvneta and
> veth, but not mlx5. Ahern (cc) also had an interest earlier.
>
>
> > More specifically the fact that the mlx driver (are there others too?)
> > don't update netdev/ifconfig stats for XDP/AF_XDP traffic?
>
> IMHO the drivers MUST update the netdev/ifconfig RX stats, even when an
> XDP action is taken.  XDP-progs are user installed software, and not
> updating netdev RX-stats (for some XDP actions) is very confusing for
> all existing stats collector tools.

Does anyone know if the mlx4/mlx5 driver in recent kernel versions
update the netdev stats for AF_XDP tx/rx traffic?

> The mlx drivers are (sadly) the most inconsistent if I remember correctly.
>
> > The email thread started for that item dates from 2018 and hasn't
> > seen any updates after that.
> I think nobody have really had the time to fix up this inconsistent
> stats mess.
>
> Are you interested in working on this?
>
>
> > I see some recent patch/commit activity about XDP specific stats via
> > netlink but I believe this is different from the standard
> > netdev/ifconfig stats.
>
> Yes, if taking this "task", I recommend focusing on standardizing
> netdev/ifconfig stats behavior for XDP.  Solving the other XDP specific
> stats is a much larger task with much upstream discussions required.
>
> > Srivats
> >
> > [1] https://xdp-project.net/#Consistency-for-statistics-with-XDP
> >
>
> --Jesper
>

