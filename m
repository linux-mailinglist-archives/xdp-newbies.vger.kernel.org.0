Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6931F6EE4
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jun 2020 22:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgFKUlF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jun 2020 16:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgFKUlE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jun 2020 16:41:04 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8065BC08C5C1
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 13:41:03 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id m23so1775688vko.2
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/r+maaO9EX7KWn+8dmhoxfaDK32f2BpDin34cs6Lncc=;
        b=Cb5ar0kC4O+vV9uF5J7zeDH+mwWoMG/S7Xvwc4ScLhu3R0xhq/DSto2B4KhpRK014B
         4IdmruRvVmyc5JdQu44wr7Vzh53nlLR0WznbW+tpgElSxhMBscZmtifV/t0n3pW/djPQ
         Vt8gJiV7czisdyJcbBUcwMZSnbvXW/opUBfyUDLGGrtT45z84NmZUF/Kq0RpDW+O0NH+
         jqUXqhVqMImeAWbPC3SWf8cS4TDbRu6GDxfJ/BwOKUuU/Frf0Xfve2ErYf8IPbqwTI9R
         AULiCiR5lnyOhK6NJ16GRW6r9RBUmKADNGMJey2LEv1l/xF4DAwhBkdvkOBVi3aF5DVb
         o5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/r+maaO9EX7KWn+8dmhoxfaDK32f2BpDin34cs6Lncc=;
        b=DGSJsqy9aDyT9088gZfe8ClMTvD29EPSEv6x6EXvDAUgrLpdo4wsRfjDk5ov/i2/pH
         hSgn8HoXFrSYj2R8PBTqi05iQxqa9QHx4DLOg0AtlC05n+LJPxuaunsgMvcOnYlmcj85
         BQUegbY5z3M1isq5SxmPAxaszjzWFkUklqOAvRSSCBekCjFC7KKVSXtsljeoINuMBae2
         oZHR+hFcj8ANQYkVL2gV9uu84PnHZJpqTexe7uEjEWq7Xufq8CUWIFfZ/GZlYfrnkuDt
         q1BAtsXT78Ifjhzz/EatKXXFcLimRwnUX51ZDhblQQcSsh2qmDTdOokya2tuOjjBW25R
         lh0w==
X-Gm-Message-State: AOAM533ADDpBFyJ81MfWzm2/iGFeZ8WsZ/u+XC/LsTWuMJNJLJGylonc
        HcfHTMU9s7lwQHmkrc9K/3PGOgLBmzr6gbMfB+dgZNmf
X-Google-Smtp-Source: ABdhPJyEcTZj8uC1436ZjPbJmKuwE+bcX+SKmOZf5ts6Lt35gA+2XHxa4uOPJ0+2Kp4365hKEnMptdr7HsBX+LmciVw=
X-Received: by 2002:a1f:2949:: with SMTP id p70mr7677411vkp.96.1591908062524;
 Thu, 11 Jun 2020 13:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk> <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
 <20200611125952.3527dfdb@carbon> <CAEf4BzafLSnjjqdeH9-Wu7J69a=7_3gmqqDBV8ysTOTmnvmtyw@mail.gmail.com>
In-Reply-To: <CAEf4BzafLSnjjqdeH9-Wu7J69a=7_3gmqqDBV8ysTOTmnvmtyw@mail.gmail.com>
From:   Elerion <elerion1000@gmail.com>
Date:   Thu, 11 Jun 2020 13:40:51 -0700
Message-ID: <CAMDScmk+vXCwOYkWhwUcdg95EsCsJNBnM0Jj=nHQLcGPJxiAgw@mail.gmail.com>
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

I am using libbpf from here https://github.com/libbpf/libbpf I'm not
using ebpf. I just linked to the ebpf issue because it seems like the
only thing related to this problem when I googled it.

On Thu, Jun 11, 2020 at 9:34 AM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Jun 11, 2020 at 4:00 AM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> >
> > (Cross-posting to iovisor-dev)
> >
> > Seeking input from BPF-llvm developers. How come Clang/LLVM 10+ is
> > generating incompatible BTF-info in ELF file, and downgrading to LLVM-9
> > fixes the issue ?
> >
> >
> > On Wed, 10 Jun 2020 14:50:27 -0700 Elerion <elerion1000@gmail.com> wrot=
e:
> >
> > > Never mind, I fixed it by downgrading to Clang 9.
> > >
> > > It appears to be an issue with Clang/LLVM 10+
> > >
> > > https://github.com/cilium/ebpf/issues/43
>
> This is newer Clang recording that function is global, not static.
> libbpf is sanitizing BTF to remove this flag, if kernel doesn't
> support this. But given this is re-implementation of libbpf, that's
> probably not happening, right?
>
> > >
> > > On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <tok=
e@redhat.com> wrote:
> > > >
> > > > Elerion <elerion1000@gmail.com> writes:
> > > >
> > > > > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
> > > >
> > > > 'vlen !=3D 0' is the error. Not sure why you hit that; what's the o=
utput
> > > > of 'bpftool btf dump file yourprog.o' ?
> > > >
> > > > -Toke
> > > >
> >
> >
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Principal Kernel Engineer at Red Hat
> >   LinkedIn: http://www.linkedin.com/in/brouer
> >
