Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB9A1F6F2E
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jun 2020 23:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgFKVLe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jun 2020 17:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgFKVLe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jun 2020 17:11:34 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C22CC08C5C1
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 14:11:34 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id q2so4189256vsr.1
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Amg5K8UZYf/pcSH63NuYfHfKRPGqy4q/vtDKKGe9kJQ=;
        b=T1adjEREHNcsSWH0bKvEiDdmS6rVQbG6lLjPK+Q2RxPqmieT/1w0MdwDkw3L1SkgSz
         Kee1xf+XougsLhRuml0inSYLSkEq2nPy3hTzsv8RN7c3JiQp12IcoFvOx7ppKS5oxFjy
         8A6ouj4pnboWOBnLW2KgNyMIRA+fm1s2GjqjToL18si0Bl8XDn7Px4bt0TVa7Z+jE2iR
         qwQc5f5jQeu7Honrxsqz5Ow1u558OsIeTm5N55iMU1+N5k0GAMA69epIbKHXCc2OrgfC
         4JTnjmVFjiFTo3AWmOejMFBk+BKEwuqixqz+C/HxJPsLFBFduh765DRWjIUvXTixZMh1
         Jw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Amg5K8UZYf/pcSH63NuYfHfKRPGqy4q/vtDKKGe9kJQ=;
        b=IU7MVz766SCvhCrEmRAPS0gP1tLqy4uRjOe7eaupKD0ce3I85jWXL/B0efdZeO23L3
         g6BAABgSqj4EJcRIcXoYJtiPEJyYY7Cda00HeNGAkApN5nhqMZqHQOEISwwJKCOxLlEm
         JyJpC0qAAfDyy/OS2Oidx79TEO06S/tHX52jEmzHQ0di+K/ZDfrXNV1kb/wlOjSsJcbw
         Oj/0xIztdkcFZywybfZt5VuGQeHZRUGa3QLyH2q4Q1XzTjDT8rfciA0ZAr2iHIT4V860
         8QxBANFeYtM3vbV1FriU1RgH6d1sdMLs3tQumRXuOqBcZyo7yDn2PcGzkqumIO9KsHm/
         Q7dQ==
X-Gm-Message-State: AOAM5311t7Tx8rSaxUbl35K5e6aMEHFyxyKT7ldsnx/qId9i6r1nCPWK
        GU9jqEdylAT127LRuUIEzvo4l1oNa2Q2YkPlHjI=
X-Google-Smtp-Source: ABdhPJyFXZ26rG+jfXrA3HFViWpTS5ftqZVrJxx4THgT+21tkKWYguurE9NdFJyc+PdGpkJubRtPJ/Tf42A5Zc2ED6I=
X-Received: by 2002:a67:ee0d:: with SMTP id f13mr8281953vsp.147.1591909892433;
 Thu, 11 Jun 2020 14:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk> <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
 <20200611125952.3527dfdb@carbon> <CAEf4BzafLSnjjqdeH9-Wu7J69a=7_3gmqqDBV8ysTOTmnvmtyw@mail.gmail.com>
 <CAMDScmk+vXCwOYkWhwUcdg95EsCsJNBnM0Jj=nHQLcGPJxiAgw@mail.gmail.com> <CAEf4BzZRd6HU8XWAdTkGggQtcKY+f_Ha2Oe4oeNGCpESGkpq4g@mail.gmail.com>
In-Reply-To: <CAEf4BzZRd6HU8XWAdTkGggQtcKY+f_Ha2Oe4oeNGCpESGkpq4g@mail.gmail.com>
From:   Elerion <elerion1000@gmail.com>
Date:   Thu, 11 Jun 2020 14:11:21 -0700
Message-ID: <CAMDScm=+UWLw-o1QJj5q2D0EFtdF4hRDzmCgmnzzho_ppJ7cjg@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "iovisor-dev@lists.iovisor.org" <iovisor-dev@lists.iovisor.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Yonghong Song <ys114321@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello here's some of the basic information, I don't have a minimum
code sample to reproduce the error and I don't really feel inclined to
spend the time to make one since I have already found a solution. I'm
not able to release the production code we are using.

5.3.0-53-generic #47~18.04.1-Ubuntu SMP Thu May 7 13:10:50 UTC 2020
x86_64 x86_64 x86_64 GNU/Linux
Ubuntu clang version
10.0.1-++20200529024103+a634a80615b-1~exp1~20200529124721.169
Target: x86_64-pc-linux-gnu

You can find the discussion here:

https://www.spinics.net/lists/xdp-newbies/msg01730.html

On Thu, Jun 11, 2020 at 1:46 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Jun 11, 2020 at 1:41 PM Elerion <elerion1000@gmail.com> wrote:
> >
> > I am using libbpf from here https://github.com/libbpf/libbpf I'm not
> > using ebpf. I just linked to the ebpf issue because it seems like the
> > only thing related to this problem when I googled it.
>
> Ok, that I can help with, then.
>
> What's the kernel version? Where I can find repro? Steps, etc.
> Basically, a bit more context would help, as I wasn't part of initial
> discussion.
>
>
> >
> > On Thu, Jun 11, 2020 at 9:34 AM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > >
> > > On Thu, Jun 11, 2020 at 4:00 AM Jesper Dangaard Brouer
> > > <brouer@redhat.com> wrote:
> > > >
> > > > (Cross-posting to iovisor-dev)
> > > >
> > > > Seeking input from BPF-llvm developers. How come Clang/LLVM 10+ is
> > > > generating incompatible BTF-info in ELF file, and downgrading to LL=
VM-9
> > > > fixes the issue ?
> > > >
> > > >
> > > > On Wed, 10 Jun 2020 14:50:27 -0700 Elerion <elerion1000@gmail.com> =
wrote:
> > > >
> > > > > Never mind, I fixed it by downgrading to Clang 9.
> > > > >
> > > > > It appears to be an issue with Clang/LLVM 10+
> > > > >
> > > > > https://github.com/cilium/ebpf/issues/43
> > >
> > > This is newer Clang recording that function is global, not static.
> > > libbpf is sanitizing BTF to remove this flag, if kernel doesn't
> > > support this. But given this is re-implementation of libbpf, that's
> > > probably not happening, right?
> > >
> > > > >
> > > > > On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@redhat.com> wrote:
> > > > > >
> > > > > > Elerion <elerion1000@gmail.com> writes:
> > > > > >
> > > > > > > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
> > > > > >
> > > > > > 'vlen !=3D 0' is the error. Not sure why you hit that; what's t=
he output
> > > > > > of 'bpftool btf dump file yourprog.o' ?
> > > > > >
> > > > > > -Toke
> > > > > >
> > > >
> > > >
> > > > --
> > > > Best regards,
> > > >   Jesper Dangaard Brouer
> > > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > > >   LinkedIn: http://www.linkedin.com/in/brouer
> > > >
