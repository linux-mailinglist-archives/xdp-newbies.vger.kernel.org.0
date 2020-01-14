Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D37813A242
	for <lists+xdp-newbies@lfdr.de>; Tue, 14 Jan 2020 08:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgANHsG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 14 Jan 2020 02:48:06 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34201 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgANHsG (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 14 Jan 2020 02:48:06 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so10972431oig.1
        for <xdp-newbies@vger.kernel.org>; Mon, 13 Jan 2020 23:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l5cXMx8tbWX6T6r8VqngrvVZQ59bjnj9kmpie4LIqE0=;
        b=W9KeNluweQJb78PADQf4SJx3RrcAA2H4v5hF47MWR07HtpjrOz7b490qAssQY0MHGy
         dHzFNUSqN+5iBlokBY/I8MZh+YOGR49d7f/C2HRNghC0X8xxOqtUi3uw5dFFgMFaApLA
         YegGc3LS6DmSF4MfJzyLbIXyshGVwUGL8ZWRU/k83r+iPXqHcXi/Jfj0M2mY/ROblk37
         LtNsu0eRN2khUI9odPpDCW5iSbeBIYuF5algpoGAt+XV2bZPNYzDnXuCDnOpkk2a62pm
         p0s+ioBo3UmCuAe5bJRhqwAKP7+XEW//Wc7L1/GJy+iBlwaHOh85rXrmmaY4qhB7WZNZ
         Bwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l5cXMx8tbWX6T6r8VqngrvVZQ59bjnj9kmpie4LIqE0=;
        b=hMVZK8Ao5FQnpm76mb93/QqiUg3hNIxb8/T+HbXQ1EgnwcZxYp7qBtDG80pGzf6hcJ
         e3U04JSswroNHjca+n5usOYIMovcb1AEnHj2/Ocp40uk/ujaVsokf5mKEghk1XPByWYr
         DCZF4UBX6IXCTMpYxCkyWUM9xDJD6xrPyjdvkFZxyWIFZUKUpcFK4NwdURsyf7y2QFp5
         cuURZKGqMAxIqnxnlOj8Ovpx1uXypD4Z+uj1P6+GrZTXAdr6F7uag9Ax5ShwUFwKwkj5
         +d/7zHKSk/zws52GU0sUt4E5yEPK8DE6KczZTGeWMZjotklTWd1jJosyj0iDK5gfj/9W
         QsvQ==
X-Gm-Message-State: APjAAAVLalkqC+n5sbassb2C0zhFjH9wqdMBzlpHAU6BUBq02dxUZTRI
        vLeH7vDEB2LiauZmdCYka8lMKJosWYMg2SV1YEPjDs7T
X-Google-Smtp-Source: APXvYqyUwwxFemM+d4g2Bo8xc5w1n1q+N6yzMixDA7xyJe6yEW2vEk4Sdjkr8DtGRAW0FTehgFpaftDL3BBENIAIhUc=
X-Received: by 2002:aca:2207:: with SMTP id b7mr16145163oic.109.1578988085889;
 Mon, 13 Jan 2020 23:48:05 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <87k15vwsax.fsf@toke.dk> <20200113152530.GC68570@smtp.ads.isi.edu> <877e1vwaep.fsf@toke.dk>
In-Reply-To: <877e1vwaep.fsf@toke.dk>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 14 Jan 2020 08:47:54 +0100
Message-ID: <CAJ8uoz2o0gQJOFjSsw3NEJ4vdyKfoLgj=vF3ZTj0v3bbA993qw@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Ryan Goodfellow <rgoodfel@isi.edu>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Jan 13, 2020 at 6:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Ryan Goodfellow <rgoodfel@isi.edu> writes:
>
> > On Mon, Jan 13, 2020 at 11:43:02AM +0100, Toke H=C3=B8iland-J=C3=B8rgen=
sen wrote:
> >>> Magnus Karlsson <magnus.karlsson@gmail.com> writes:
> >>>> On Mon, Jan 13, 2020 at 1:28 AM Ryan Goodfellow <rgoodfel@isi.edu> w=
rote:
> >>>>  The reason for wanting large memory maps is that our use case for X=
DP is network
> >>>>  emulation - and sometimes that means introducing delay factors that=
 can require
> >>>>  a rather large in-memory packet buffers.
> >>>>
> >>>>  If there is interest in including this program in the official BPF =
samples I'm happy to
> >>>>  submit a patch. Any comments on the program are also much appreciat=
ed.
> >>>
> >>>  More examples are always useful, but the question is if it should
> >>>  reside in samples or outside the kernel in some other repo? Is there
> >>>  some good place in xdp-project github that could be used for this
> >>>  purpose?
> >>
> >> We could certainly create something; either a new xdp-samples
> >> repository, or an example-programs/ subdir of the xdp-tutorial? Which =
of
> >> those makes the most sense depends on the size of the program I think.=
..
> >>
> >> -Toke
> >>
> >
> > I'm happy to provide patches or pull-requests in either case. The users=
pace
> > program is 1 file with 555 lines and the BPF program is 28 lines. I've
> > tested the userspace program with the 5.5 kernel. The BPF program requi=
res
> > clang-9 to work properly (due to BTF features IIRC).
> >
> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-mo=
a/samples/bpf/xdpsock_multidev.c
> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-mo=
a/samples/bpf/xdpsock_multidev_kern.c
> >
> > The primary usefulness of this program relative to what's out there is
> > that it pushes packets between interfaces using a common memory map.
>
> Hmm, yeah, this could live in either samples or as standalone. IDK,
> Magnus what do you think?

Let us try the kernel samples first. Then and if the folks on the
mailing list do not want more samples in there, we fall back on the
xdp-tutorial repo.

/Magnus

> -Toke
>
