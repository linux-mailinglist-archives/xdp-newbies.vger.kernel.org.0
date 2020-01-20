Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01678142537
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jan 2020 09:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgATIYR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jan 2020 03:24:17 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38920 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgATIYR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jan 2020 03:24:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id 77so27934050oty.6
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Jan 2020 00:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W4fcOVDhCKcmNI7y3pf/Woelqlr8yd99XCEdr0lmBVY=;
        b=vVTWQneIVgNgNBlN9QObC2yTenvqmCqNpnViWb711PDg1VQoKngB1F8O+uPOBoEO1b
         WiVbvVCtzNq+i0DJQI9gOPeBa33IUT7sftp1vE9kX5J7vevnl+ysClIAZvbPZMu9H8Lj
         nw6jg8hDCFj0y7S3yaz7Q9uzLxYIN6vQdwh4ZDpp21uQdjN7SMesoxnFenpeI6mLpPE8
         wUuQQmJZqCxQBih97Za1w4HCzKWO6e1KVCLCmEv5+wyGXhax2vehC3pHOZtOQwLYIAcx
         CZ4ijJsI2Lh572Y9iRYnpqS9xioOn9N3heZ3eoGP9rwxQ7EFwHXGM7unyEn7DSMa0CCx
         0MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W4fcOVDhCKcmNI7y3pf/Woelqlr8yd99XCEdr0lmBVY=;
        b=sWMLenrFf1JjfXjeWsTGKdLmC6gVUiHbdMEV0+2VOY89prTOGihmNhkCeK0voEZDw0
         lg2T2J+qi13k+3TalaIWDsuE5U/h519MQsrws1naXgvw9NTy3nbp+NuCKIHUQ+ucWwtz
         LVywsJN2VlB6o/AAfiVXcLNaBu3XZXcIVtuU3zUIwFumnMD5OYzTaxMD1b7m2dS8j8vF
         Dz/70b76cKd41H57bPBUzIdlnPoTvkDWDo4LnG2yEHKtR2U6Z4UTcuk+Y+tI+oWv+SPc
         W5qkio7+wgTjn7SziWUiszTVYjUPbDSDQq0KMvArfk8wVXYuXt2iZHU+SjL98Ne0TOKY
         N+gA==
X-Gm-Message-State: APjAAAUr7t/jwtDKNcf8WUzitnhFM9thQJItDQDVOrXxSKrc3/WVHL+O
        XT+dVESWSFV6PKkiTZ/r0xGGnT35uvuHarmjudw=
X-Google-Smtp-Source: APXvYqyuDSiJDGSFQ4tgZpEWrYNcUgO8TWUY9TTUsTjPWQlXVZoflREfhW82Oifc/2753uWevqPHSrgPYcCWLks2isY=
X-Received: by 2002:a05:6830:10d5:: with SMTP id z21mr15715747oto.30.1579508656389;
 Mon, 20 Jan 2020 00:24:16 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
 <20200117171637.GB69024@smtp.ads.isi.edu>
In-Reply-To: <20200117171637.GB69024@smtp.ads.isi.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 20 Jan 2020 09:24:05 +0100
Message-ID: <CAJ8uoz0i2NVxBty18Cq=kK5_Ysue=pt1psBBahLFiZqN168OiQ@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jan 17, 2020 at 6:16 PM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
> On Fri, Jan 17, 2020 at 01:32:07PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> > On Mon, 13 Jan 2020 at 01:28, Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> > >
> > [...]
> > >
> > > I could not get zero-copy to work with the i40e driver as it would cr=
ash. I've
> > > attached the corresponding traces from dmesg.
> >
> > Thanks Ryan! I had a look at the crash, and it's in the XDP setup:
> >
> > i40e_xdp_setup:
> > ...
> >  for (i =3D 0; i < vsi->num_queue_pairs; i++)
> >      WRITE_ONCE(vsi->rx_rings[i]->xdp_prog, vsi->xdp_prog);
> >
> > and the vsi->rx_ring[0] is NULL. This is clearly broken.
> >
> > It would help with more lines from your dmesg: the cut i40e log hints
> > that something is really broken:
> >
> > [  328.579154] i40e 0000:b7:00.2: failed to get tracking for 256
> > queues for VSI 0 err -12
> > [  328.579280] i40e 0000:b7:00.2: setup of MAIN VSI failed
> > [  328.579367] i40e 0000:b7:00.2: can't remove VEB 162 with 0 VSIs left
> >
> > Is it possible to dig out the complete log?
>
> Hi Bj=C3=B6rn,
>
> I've linked a full dmesg log from an XDP setup crash. Note that there are
> two i40e cards on this machine. The X710 (0000:65:00.0, 0000:65:00.1) wor=
ks
> fine, the X722 (0000:b7:00.0, 0000:b7:00.1, 0000:b7:00.2, 0000:b7:00.3) i=
s the
> one that is crashing on XDP setup.

Ryan,

I was wondering if you could run two small experiments since I cannot
reproduce this?

1: Run your program using the two ports on your X710 card. Does it
work? This is my setup and works for me.
2: On your Mellanox setup, insert a kick_tx() call for each of your
two sockets before the poll() call in your forward() function. Just to
see if it works when we explicitly wake up the driver.

Thanks: Magnus

> https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1931080
>
> Some info that may be useful:
>
> ry@turbine:~$ sudo ethtool -i eno7
> driver: i40e
> version: 2.8.20-k
> firmware-version: 3.33 0x80001006 1.1747.0
> expansion-rom-version:
> bus-info: 0000:b7:00.2
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
>
> The firmware version 3.33 was the latest I could find as of a few weeks a=
go.
>
> ry@turbine:~$ sudo lspci -vvv | grep 722
> b7:00.0 Ethernet controller: Intel Corporation Ethernet Connection X722 f=
or 10GBASE-T (rev 04)
>         DeviceName: Intel LAN X722 #1
>         Subsystem: Super Micro Computer Inc Ethernet Connection X722 for =
10GBASE-T
> b7:00.1 Ethernet controller: Intel Corporation Ethernet Connection X722 f=
or 10GBASE-T (rev 04)
>         DeviceName: Intel LAN X722 #2
>         Subsystem: Super Micro Computer Inc Ethernet Connection X722 for =
10GBASE-T
> b7:00.2 Ethernet controller: Intel Corporation Ethernet Connection X722 f=
or 10GbE SFP+ (rev 04)
>         DeviceName: Intel LAN X722 #3
>         Subsystem: Super Micro Computer Inc Ethernet Connection X722 for =
10GbE SFP+
> b7:00.3 Ethernet controller: Intel Corporation Ethernet Connection X722 f=
or 10GbE SFP+ (rev 04)
>         DeviceName: Intel LAN X722 #4
>         Subsystem: Super Micro Computer Inc Ethernet Connection X722 for =
10GbE SFP+
>
> ry@ryzen:~$ uname -a
> Linux ryzen 4.19.0-6-amd64 #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11) x=
86_64 GNU/Linux
>
> ry@turbine:~/kmoa/bpf-next$ git log -2
> commit 60d71397d27e7859fdaaaaab6594e4d977ae46e2 (HEAD -> master)
> Author: Ryan Goodfellow <rgoodfel@isi.edu>
> Date:   Wed Jan 15 16:54:39 2020 -0500
>
>     add xdpsock_multidev sample program
>
>     This is a simple program that uses AF_XDP sockets to forward packets
>     between two interfaces using a common memory region and no copying of
>     packets.
>
>     Signed-off-by: Ryan Goodfellow <rgoodfel@isi.edu>
>
> commit 9173cac3b64e6785dd604f5075e6035b045a0026 (origin/master, origin/HE=
AD)
> Author: Andrii Nakryiko <andriin@fb.com>
> Date:   Wed Jan 15 11:08:56 2020 -0800
>
>     libbpf: Support .text sub-calls relocations
>
>     The LLVM patch https://reviews.llvm.org/D72197 makes LLVM emit functi=
on call
>     relocations within the same section. This includes a default .text se=
ction,
>     which contains any BPF sub-programs. This wasn't the case before and =
so libbpf
>     was able to get a way with slightly simpler handling of subprogram ca=
ll
>     relocations.
>
>     This patch adds support for .text section relocations. It needs to en=
sure
>     correct order of relocations, so does two passes:
>     - first, relocate .text instructions, if there are any relocations in=
 it;
>     - then process all the other programs and copy over patched .text ins=
tructions
>     for all sub-program calls.
>
>     v1->v2:
>     - break early once .text program is processed.
>
>     Signed-off-by: Andrii Nakryiko <andriin@fb.com>
>     Signed-off-by: Alexei Starovoitov <ast@kernel.org>
>     Acked-by: Yonghong Song <yhs@fb.com>
>     Cc: Alexei Starovoitov <ast@kernel.org>
>     Link: https://lore.kernel.org/bpf/20200115190856.2391325-1-andriin@fb=
.com
>
> --
> ~ ry
