Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBBB1F6C3B
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jun 2020 18:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgFKQe6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jun 2020 12:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgFKQe5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jun 2020 12:34:57 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC2CC08C5C1
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 09:34:57 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c14so6127352qka.11
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jun 2020 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rvXxPaXDjTrTAiCQnX1e7ScOOXsxUqYIpLNCrBudLHk=;
        b=u/gScNn6B0sIL52jIoWg3YIXHaLBL5cOcNAg3t0IGG9ScqtBEwozq19L+fNncD8Wcv
         Thcu/UQv6jjSbJ2W8XlF+kYHArI242AV55UmloVq3ShkwsL6wTpSGej64s17/vUSw7J/
         UDe83wTsGhkcrYOTo6N8UDUr6y+7ixSKJ6x6PPr0DMA469axZshoac+gf8fNXPFftxGm
         9IBfKHYcI4j12pAZp9rJ+DOCz0oDs1+AUpZMqHN0/zHJLEG90vEusuFR07JGPKRXmQuP
         0AqAOOBR3vFlgYLDVmetCmJrbH08VDRgNT4ztMbjVJ0uMMFu751ziXDDGmJW8d0BU7wg
         UNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rvXxPaXDjTrTAiCQnX1e7ScOOXsxUqYIpLNCrBudLHk=;
        b=uBWUZwZRnG4gLNsH17T1VZjBmW1kF7yYqyTkdZGL16qodjI1ttpee7+5o1FLTupBLj
         VMCsAg1DugDhiOYd2u+pzhy3zzqFiMhiz1X60YApDAOYqgWi9L8ayB7Lu4YGSyHExnVF
         bJqPoIPSp6BlzR23Z1qjfr4QwDpoua77uX1fZ/6EuU6voNXZHraFES4bqx64i/GoQnZw
         t7n4HqFKPz1iJh7FbnoGetNVceac80mu1uXVNDvRlNBHJgQGo55zxzPa+L1/AVTWtGQV
         PV3JZd++xyX8ZhaXhb8MPowwnRYVV++37XeWBvQqlibMlo3k1XWxM0RbaBiO03/CCbD3
         iW4Q==
X-Gm-Message-State: AOAM531OBTxs/wD9PRQLa8UPp2fB/1NgQADdgvJhOgwah2EOt5AM6zgw
        26EPOvOm3eBYYZBgcsfu2kEfyCzstyqk1DdpsKg=
X-Google-Smtp-Source: ABdhPJyCPNl7sr/GnxtUpO2MfHq9QVPg9QDSI0WGmBEEDFOyjHDE+1tBiQOg223iFe1cUDsNFBSwLT7D8RUkDEejB5Q=
X-Received: by 2002:a05:620a:12d2:: with SMTP id e18mr9630824qkl.437.1591893296672;
 Thu, 11 Jun 2020 09:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
 <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
 <87a71a7gay.fsf@toke.dk> <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
 <20200611125952.3527dfdb@carbon>
In-Reply-To: <20200611125952.3527dfdb@carbon>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Thu, 11 Jun 2020 09:34:45 -0700
Message-ID: <CAEf4BzafLSnjjqdeH9-Wu7J69a=7_3gmqqDBV8ysTOTmnvmtyw@mail.gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Elerion <elerion1000@gmail.com>,
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

On Thu, Jun 11, 2020 at 4:00 AM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
> (Cross-posting to iovisor-dev)
>
> Seeking input from BPF-llvm developers. How come Clang/LLVM 10+ is
> generating incompatible BTF-info in ELF file, and downgrading to LLVM-9
> fixes the issue ?
>
>
> On Wed, 10 Jun 2020 14:50:27 -0700 Elerion <elerion1000@gmail.com> wrote:
>
> > Never mind, I fixed it by downgrading to Clang 9.
> >
> > It appears to be an issue with Clang/LLVM 10+
> >
> > https://github.com/cilium/ebpf/issues/43

This is newer Clang recording that function is global, not static.
libbpf is sanitizing BTF to remove this flag, if kernel doesn't
support this. But given this is re-implementation of libbpf, that's
probably not happening, right?

> >
> > On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> > >
> > > Elerion <elerion1000@gmail.com> writes:
> > >
> > > > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0
> > >
> > > 'vlen !=3D 0' is the error. Not sure why you hit that; what's the out=
put
> > > of 'bpftool btf dump file yourprog.o' ?
> > >
> > > -Toke
> > >
>
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
>
