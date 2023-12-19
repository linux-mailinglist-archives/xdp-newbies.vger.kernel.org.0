Return-Path: <xdp-newbies+bounces-16-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A08185D4
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 11:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9481F25D57
	for <lists+xdp-newbies@lfdr.de>; Tue, 19 Dec 2023 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97E718022;
	Tue, 19 Dec 2023 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2iBUde0"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490B17757
	for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbcdec51ed9so3123251276.0
        for <xdp-newbies@vger.kernel.org>; Tue, 19 Dec 2023 02:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702983502; x=1703588302; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXIflnuq82C5C9Ij1BnXR3Li7iZIVtjXLHz1biClpQo=;
        b=Z2iBUde0FqU8bnLAtM8HM+xHwvPzSQA+lQHYtbrJx+Piaq+oMcUqkApuYG10O9ldHz
         mHXonG0wTZghCxz+nR4v6lNvM5qDmwWDnSrlMakrX01TCaDK/FQXYqPPio/DeDJDeKgV
         WnhvX25yP54mx4NtYWhx/7q5FeXEVKyVcbHis7yzFyHkmOKybnHO3zgElQ4+HHE/fnKQ
         Gm/Chszhz/PkYx5hej//AXe9FP6TAhgl9bAaJ62rIqpna8sMNH7dbTbO+2G69t+77cbK
         r7XNT6kUIhGhdq89rk3rEiKpU4vgA6LZaE9GrbK3j2a0OTLHDdA+p5Dem9pxjL2XJzwM
         OstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702983502; x=1703588302;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXIflnuq82C5C9Ij1BnXR3Li7iZIVtjXLHz1biClpQo=;
        b=Bpv4qchciVkNdO66ebFWHwK5LZog65Rw6+2Yhi4cl/l4yvcCZ1/fBabt+zPEc3GXRh
         LIDS7Me/tK7KPxS98o1g+JAjrrjiRYA15no2bb1sZaNlNE4fjxs3pBWX+OQMonY+s7ES
         Bj1y11RzKcvpFSolTzqjQT3X3AwngqPLvGxfr9W9xkdyRE9QxvVthY+tFtovELlyafWc
         IXw2zSm+YCRa4mzJCln4nv31gYA3eFGy2VWPBoS+/H1HyzZXcmQWNyXIS+4Qyi2rPXAM
         E2RRZQLNrt9Ix05kY+Hb8QrBufgaMkiLXpRzkOukqO2AdCfvNCATakWl2767r86AZA0G
         PfxQ==
X-Gm-Message-State: AOJu0YyAJh7Sleh4nKZ1jN6NSoU86HJfA4bZ3NJWw+2qL57uScO50urN
	1RxmEittdtDnxCLANn3RgHPFEFnvbYcCPNHRc8kiUGK9JLI=
X-Google-Smtp-Source: AGHT+IFtgcyHnxnvj6PunoWWQzvifZTFGJcWT6l9WO/haWA6z9YWBaiopepQ91YNo0A09cTymJNI0kQZ7c6t8TdWqqg=
X-Received: by 2002:a05:6902:28a:b0:dbd:56ee:84f8 with SMTP id
 v10-20020a056902028a00b00dbd56ee84f8mr256324ybh.36.1702983501908; Tue, 19 Dec
 2023 02:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
In-Reply-To: <CAAAYKZPF8BiBy_aPnJA2z1n+2M8Xj6ZdETCm5+dQd3U+A_mMTA@mail.gmail.com>
From: Prashant Batra <prbatra.mail@gmail.com>
Date: Tue, 19 Dec 2023 16:28:10 +0530
Message-ID: <CAAAYKZMssCHs9rjk_XPUqdGqRPkpTQdyDUKy9KVhc0dCnmYQww@mail.gmail.com>
Subject: Re: Redirect to AF_XDP socket not working with bond interface in
 native mode
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies. The kernel I am testing this on is-

5.14.0-5.14.0-162.18.1.el9_1

On Tue, Dec 19, 2023 at 4:15=E2=80=AFPM Prashant Batra <prbatra.mail@gmail.=
com> wrote:
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
>
> Another thing I notice is that other XDP programs attached to bond
> interface with targets like DROP, REDIRECT to other interface works
> and perform better than AF_XDP (skb) based. Does this mean that these
> are not allocating skb?
>
> Kindly share your thoughts and advice.
>
> Thanks,
> Prashant

