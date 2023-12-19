Return-Path: <xdp-newbies+bounces-17-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88F8188D7
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 14:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C119282CA7
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 13:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027BE1BDC0;
	Tue, 19 Dec 2023 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOflbHw5"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B261BDC3
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67acc0c1a35so2074356d6.0
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702993635; x=1703598435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qkp5m0uFTxF33hCXG9ttQFj0w9+6nypLoLGqB4wbzR4=;
        b=iOflbHw5864en6GUBKeCRtk/Gfn2xnf2ZXLm3EaCS9eYjp/2X/ToH4c8AnuW5P2Eb5
         oUyxXuxHKdI6l0Gdd0Yfpg5KrSei5RZAa61bTPETn36nAZjaLWCli3rpY5RCXKELGCTa
         K9eIfltWWxScD1FgwShtVRF/RjO04QOhzUlu8bEdBF0yGYVxXFgUfkoOFGCO3h8/j24m
         XRA8Ci8DwNTcJ/hFubSt+bdBIGdeAQW0uKzSG5CoOzpiLjfNIDYQgXsyK+hLy9w/c/iW
         K6kejTPZspIaGPLg841So1bvAqxeSDnbW0gGQymN2MfLwg4oRVKIF5DNVHrkNvUPZwYZ
         IMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993635; x=1703598435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qkp5m0uFTxF33hCXG9ttQFj0w9+6nypLoLGqB4wbzR4=;
        b=BtnupAxrmkodTg1ruM1UUTcANmNShQxg6/LIWo1m+TuoHRkThvevnxP3zkQ3ba3Jay
         qhuushLaGePedFfQXE3iOWem/QwUK4IGVAAl8/D6MAcQWVJfpsbo0NJezgpytJeUUgaz
         jrbJAjYaaD3QncTvIaZLboMO1MBLPWk8d05R+bFMrRb2OBito4H6kHNdEdMKppxj/0Kc
         28fzdsryblDNdtSI+VzylQvvvCS10nOBfIPwVVJ/WGuZFIcCcXyZSiXuRp3N0vweC01u
         7Wc70I82uzqxGvZio+0tGCtdigKc6PmotS7SfAD/kHVP8I3uE7P3bGegM9RLOkRsmcCU
         fbEQ==
X-Gm-Message-State: AOJu0YwoRkwsOPMJ58bvTe9983isPZfoN0r+TH05k3uJ0KrRW6Yqgddz
	IMPDBs3qoJXjxCcqOUGjRKn7luKA4WPH+aiBnrt1dl5d7zo=
X-Google-Smtp-Source: AGHT+IHJ/yhbTNLSxozvgeGpqh4FpXxyh6GH3gfrxUvmFIpuRNUWZwrcz++cRji5cGHocjx2pskn+xOHr9qXkD1fBQg=
X-Received: by 2002:a05:6214:dab:b0:67f:2ab2:d8b7 with SMTP id
 h11-20020a0562140dab00b0067f2ab2d8b7mr10779099qvh.0.1702993635210; Tue, 19
 Dec 2023 05:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
In-Reply-To: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 19 Dec 2023 14:47:03 +0100
Message-ID: <CAJ8uoz2ieZCopgqTvQ9ZY6xQgTbujmC6XkMTamhp68O-h_-rLg@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: Prashant Batra <prbatra.mail@gmail.com>
Cc: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 11:46, Prashant Batra <prbatra.mail@gmail.com> wrote:
>
> Hi,
>
> I am new to XDP and exploring it's working with different interface
> types supported in linux. One of my use cases is to be able to receive
> packets from the bond interface.
> I used xdpsock sample program specifying the bond interface as the
> input interface. However the packets received on the bond interface
> are not handed over to the socket by the kernel if the socket is bound
> in native mode. The packets are neither being passed to the kernel.
> Note that the socket creation does succeed.
> In skb mode this works and I am able to receive packets in the
> userspace. But in skb mode as expected the performance is not that
> great.
>
> Is AF_XDP sockets on bond not supported in native mode? Or since the
> packet has be to be handed over to the bond driver post reception on
> the phy port, a skb allocation and copy to it is indeed a must?

I have never tried a bonding interface with AF_XDP, so it might not
work. Can you trace the packet to see where it is being dropped in
native mode? There are no modifications needed to an XDP_REDIRECT
enabled driver to support AF_XDP in XDP_DRV / copy mode. What NICs are
you using?

> Another thing I notice is that other XDP programs attached to bond
> interface with targets like DROP, REDIRECT to other interface works
> and perform better than AF_XDP (skb) based. Does this mean that these
> are not allocating skb?

I am not surprised that AF_XDP in copy is slower than XDP_REDIRECT.
The packet has to be copied out to user-space then copied into the
kernel again, something that is not needed in the XDP_REDIRECT case.
If you were using zero-copy, on the other hand, it would be faster
with AF_XDP. But the bonding interface does not support zero-copy, so
not an option.

> Kindly share your thoughts and advice.
>
> Thanks,
> Prashant
>

