Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3761F6EF0
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jun 2020 22:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgFKUq0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jun 2020 16:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgFKUqZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jun 2020 16:46:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62A4C08C5C1
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 13:46:25 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id w3so6993132qkb.6
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xPicNUEm+7Hbax3idtjx5ueBk1eAo+43nvQwfzv76cY=;
        b=lFc0HG/7QPBqI/QL+By7Ff3tHNvwTV1P+846T/Hlyz7PDWM41Wj0r1aRD/4SJksSni
         +66ZYP9EDJFatmPERzFyr74QLiB+V5oszMXO/5WiuKI1bkPwnnliLenznBYhAnoOiOW9
         uxxUrB4Ho7lAGMUMiLr35Ml2yHoB+FYBs5gM9OWMJMNUGFofLxBzVDOH5iUUbzXpzFs1
         DhN8MBXmP8lRWr7aQQtz0GXrd01csE+5uufmva3PlB8gRRCvYq3PfEcLCMtwDiMGtgK7
         pkPGrDNwHoVQ2jbVlnK91J/oIbWfWRpC0DMrK/DxXlApRALqKPm2380hG2VZQDXjLBvg
         38lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xPicNUEm+7Hbax3idtjx5ueBk1eAo+43nvQwfzv76cY=;
        b=ON1bZyzz2I5F4GdL1ZcU5VmY81ShN3ibKs/RsLq/N3JN2eV4L9bukzMFz11OWEloZ3
         fFF5N158npjBEezgJlFA2TgoK60V2fSDFsJhrc2Rbdmp0ZYurx3ZH+6QjjPq/cDfTpQ9
         0rHPhsnrmy7a3eYYyDNMLC0OfWibYsNZyNcDi+qFQwZ4KH7baGc+AJM6pPS18KuUmtQu
         pECoEqXd4Z8a/2oryuvX7qZJv/K49MN9Rq+YhI2f91i/9CH0HSAQvhieQL0lfmrB4fVT
         DuvGaQ6+Byb9jpb1hpO54j1sQ2EvtME6PAXsTOeG10JKmUpSO8V52I796NrSujg1ROpB
         V7qw==
X-Gm-Message-State: AOAM532MC2fgnVOvYq2Y7Gbgo+Hzk+xwgxLzrzOxKTF/d0OzoM4ACU3S
        AUoKzeqsK6llBHDlixjhcxEaPHK19N1Aa/hSM1M=
X-Google-Smtp-Source: ABdhPJz6tklBhYUdssQ2Vxqsb/PC0G6Y9IszbUEEsI6kn5CmC1sal7xOfQv6Ve3+P4gfLgn5Jz54Kong22uFi2oNrvk=
X-Received: by 2002:a05:620a:247:: with SMTP id q7mr10474558qkn.36.1591908385010;
 Thu, 11 Jun 2020 13:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk> <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
 <20200611125952.3527dfdb@carbon> <CAEf4BzafLSnjjqdeH9-Wu7J69a=7_3gmqqDBV8ysTOTmnvmtyw@mail.gmail.com>
 <CAMDScmk+vXCwOYkWhwUcdg95EsCsJNBnM0Jj=nHQLcGPJxiAgw@mail.gmail.com>
In-Reply-To: <CAMDScmk+vXCwOYkWhwUcdg95EsCsJNBnM0Jj=nHQLcGPJxiAgw@mail.gmail.com>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Thu, 11 Jun 2020 13:46:13 -0700
Message-ID: <CAEf4BzZRd6HU8XWAdTkGggQtcKY+f_Ha2Oe4oeNGCpESGkpq4g@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     Elerion <elerion1000@gmail.com>
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

On Thu, Jun 11, 2020 at 1:41 PM Elerion <elerion1000@gmail.com> wrote:
>
> I am using libbpf from here https://github.com/libbpf/libbpf I'm not
> using ebpf. I just linked to the ebpf issue because it seems like the
> only thing related to this problem when I googled it.

Ok, that I can help with, then.

What's the kernel version? Where I can find repro? Steps, etc.
Basically, a bit more context would help, as I wasn't part of initial
discussion.


>
> On Thu, Jun 11, 2020 at 9:34 AM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Thu, Jun 11, 2020 at 4:00 AM Jesper Dangaard Brouer
> > <brouer@redhat.com> wrote:
> > >
> > > (Cross-posting to iovisor-dev)
> > >
> > > Seeking input from BPF-llvm developers. How come Clang/LLVM 10+ is
> > > generating incompatible BTF-info in ELF file, and downgrading to LLVM=
-9
> > > fixes the issue ?
> > >
> > >
> > > On Wed, 10 Jun 2020 14:50:27 -0700 Elerion <elerion1000@gmail.com> wr=
ote:
> > >
> > > > Never mind, I fixed it by downgrading to Clang 9.
> > > >
> > > > It appears to be an issue with Clang/LLVM 10+
> > > >
> > > > https://github.com/cilium/ebpf/issues/43
> >
> > This is newer Clang recording that function is global, not static.
> > libbpf is sanitizing BTF to remove this flag, if kernel doesn't
> > support this. But given this is re-implementation of libbpf, that's
> > probably not happening, right?
> >
> > > >
> > > > On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
> > > > >
> > > > > Elerion <elerion1000@gmail.com> writes:
> > > > >
> > > > > > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
> > > > >
> > > > > 'vlen !=3D 0' is the error. Not sure why you hit that; what's the=
 output
> > > > > of 'bpftool btf dump file yourprog.o' ?
> > > > >
> > > > > -Toke
> > > > >
> > >
> > >
> > > --
> > > Best regards,
> > >   Jesper Dangaard Brouer
> > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > >   LinkedIn: http://www.linkedin.com/in/brouer
> > >
