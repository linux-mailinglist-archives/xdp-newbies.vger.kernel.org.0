Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B19ECBBDE
	for <lists+xdp-newbies@lfdr.de>; Fri,  4 Oct 2019 15:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388289AbfJDNfy (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 4 Oct 2019 09:35:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43108 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388244AbfJDNfy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 4 Oct 2019 09:35:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id a2so3908960pfo.10
        for <xdp-newbies@vger.kernel.org>; Fri, 04 Oct 2019 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lc4Ccpqjq3ib+KCgQ53oVFyWP5ZFj0RIqWUTgzgiGFI=;
        b=QsM3+KdPMWKY45CbSBdkba3XYYOuL3Lw1axG3/RgzuAJL4QAJ0WupbyLEsp0gwm5Zk
         Bm8ZDODoW5dV9SiPqyYz9n06S7A4AW7Y90hOsPAckU7ZiJI936LIleBGLUCdHVyjvVdh
         5AG5HfJ9T3Q/pYM1W5ww629v77czK2z8OmpyeDARNT+DaDWi2bDQE8bkG0cpHAocoxDZ
         UVkilblB9+UgpU7g4T/hXa1/fQ3nlMP6oDD80kRySx8JEAl/fluSwsTUGP4F1BMpehyJ
         iWDA8rbuQWMzm1IYp+wtEj9cYqvN9pDcBIWFneGcBPkQx3Fut3Gw44YX0ikiv1pKd92y
         shdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lc4Ccpqjq3ib+KCgQ53oVFyWP5ZFj0RIqWUTgzgiGFI=;
        b=m3sMX3cEnlQsXUIkF0yl+jQUNXC9JEYWXloubSRQZ9i2stH7XSxBFu2zHhFI3+Oawz
         XOkwDLAq22gE4nE8uds2LsOV5tuAHRbmaGeRj6GDdAt/T9VRNL2TPF+55PSOWCl1QlAW
         xy7Oe8Oaa8EexKRJ6vSlK1pijMknMs8jh9Xvbh+U/uIEq6AED7K6n2uw7C8LGihbqZH5
         uVBaJO8i+nPF3FsZnFdSnnImyUmYdFLkIFDhlqBuL32LjqFOBLojMIJVVDaBa4afaOlZ
         5J0fvojiGbfUgAuQq6b0oIgqoV0tgXb+3fBJfEwCCG73mUTdfskwJNSvamtM9o3RcETO
         txvg==
X-Gm-Message-State: APjAAAXc0xxxYssSl595zku4R+tdf6O5w4gl/pYobVmrKj0TjCZ0uoRo
        1BH+yKzSlrk35jpdrepzA24=
X-Google-Smtp-Source: APXvYqyur1NR+XXv7jS7BOgdf9x8x5VZWjwCHbgkDC16P8JSFgt48N5oFiI4qfc3FYOz55v+9mG6pQ==
X-Received: by 2002:a63:2447:: with SMTP id k68mr1841642pgk.214.1570196152406;
        Fri, 04 Oct 2019 06:35:52 -0700 (PDT)
Received: from localhost ([192.55.55.45])
        by smtp.gmail.com with ESMTPSA id v19sm7144552pff.46.2019.10.04.06.35.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 06:35:52 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:35:35 +0200
From:   Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>
To:     =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Cc:     =?ISO-8859-1?Q?J=FAlius?= Milan <Julius.Milan@pantheon.tech>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>,
        Marek =?ISO-8859-1?Q?Z=E1vodsk=FD?= 
        <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Subject: Re: xdpsock problem testing multiple queues
Message-ID: <20191004153535.00002fe7@gmail.com>
In-Reply-To: <20191002182755.00000657@gmail.com>
References: <ccfd36d0372547099b96ea494e2c6369@pantheon.tech>
        <CAJ+HfNh58fN=BU5ADzTs=vbCD1j5fs0i1EKhAQQdByjiVHz4BQ@mail.gmail.com>
        <20191002182755.00000657@gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 2 Oct 2019 18:28:57 +0200
Maciej Fijalkowski <maciejromanfijalkowski@gmail.com> wrote:

> On Wed, 2 Oct 2019 15:52:04 +0200
> Bj=F6rn T=F6pel <bjorn.topel@gmail.com> wrote:
>=20
> > On Wed, 2 Oct 2019 at 14:11, J=FAlius Milan <Julius.Milan@pantheon.tech=
> wrote:
> > >
> > > Hi all
> > >
> > > We are trying to test multiple RX queues with sample program xdpsock =
from kernel on vmware virtual machine with 2 queues.
> > > The driver on the NIC is:
> > > # ethtool -i ens192
> > > driver: vmxnet3
> > > version: 1.4.16.0-k-NAPI
> > >
> > > NIC has 2 queues, I can check it by ethtool -S.
> > >
> > > But when I try to use queue 1, I am getting following:
> > > # ./xdpsock -i ens192 -q 1
> > > /home/jmilan/ws/pt-xdp/linux/samples/bpf/xdpsock_user.c:xsk_configure=
_socket:315: errno: 1/"Operation not permitted"
> > >
> > > Any ideas what the problem could be? Maybe vmxnet3 driver does not su=
pport some necessary operations related to queues?
> > > =20
> >=20
> > XDP support is missing for that driver, but the XDP_SKB/generic mode
> > is available, and should work.
> >=20
> > Can you run the xdp1 application in the samples directory, to rule out
> > that you can run XDP.
>=20
> xdp1 should work fine but I think the reason for a reported failure is be=
cause
> vmxnet3 driver doesn't expose the {set,get}_channels ethtool API (at leas=
t I
> don't see it?) which is used by libbpf's xsk part for querying the underl=
ying
> driver how many queues does it has and use that info for creating that ma=
ny
> entries in XSKMAP.
>=20
> So in that case you're limited to use queue 0 because the XSKMAP map has
> only single entry.

After putting some thoughts into it, I am wondering whether we really need =
to
query the driver for its max queue count via ethtool during the XSKMAP crea=
tion.

eBPF resources are being created *after* the bind() syscall, so at that tim=
e if
it succeeded we are sure that the queue id provided by user is valid, no?
Network drivers are usually allocating queues per each CPU on the system, so
IMO using the libbpf_num_possible_cpus() for XSKMAP entries would be just f=
ine.
Obviously, mlx5 is a special case here, but we can double the value we got =
in
case the xsk->queue_id is higher than the cpu count.

Thoughts?

>=20
> Maciej
>=20
> >=20
> >=20
> > Bj=F6rn
> >=20
> > > Best Regards
> > > J=FAlius =20
>=20

