Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC0D1136FA
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Dec 2019 22:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbfLDVTe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 4 Dec 2019 16:19:34 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37829 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfLDVTd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 4 Dec 2019 16:19:33 -0500
Received: by mail-qt1-f194.google.com with SMTP id w47so1289669qtk.4;
        Wed, 04 Dec 2019 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TXDlPbz4DYKOgW5gi+ZPB5eSq/GCChHHgm1cEar4NCI=;
        b=ksBR3DY65GSzp1nsjFPtjvY1Ic1xERRqlfk+UA1eC61LjlpN/sxOngoJeOEkqff5S6
         zXCctHj3brrUEPqedYjS8AQuKGrG1cZEIPSZXLtjWmMAEImSWwXTlfE1OD0THfRDvaXq
         /+SLUe7ozwX7VH5QJYVwEvKhrWTa/cLbOsw7mNqlFRoeK0BKC7Ua6qpT1d3p0PyT21qC
         xFuz9WfrxSz7GOikls2woeJ3hSJ6tcA2/buJJnL6fsK76ZfJXJ7iFcmNUXlUI0KAuior
         O9bSkrExSug6MTIJXwY+UCjzG+LeCRWjcc0vXOiZ4OEACGQnFc8iOSMeH29tADW8lvl8
         e1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TXDlPbz4DYKOgW5gi+ZPB5eSq/GCChHHgm1cEar4NCI=;
        b=E9HNZN6zP7lFexbD1jIxW92+lVgESGPcgVYKq7NPS43dMLZhzrysRxbskbs2UtG+9v
         GnoIpIXKKZvg0AFIFcPyAgFSOShuT5ih93FxuXNje7cOMLTf2u2QOvps17TdzXUjfsWR
         8YZho6Jd9cuooivbpioUjjsD5IBbgWkMcKmYXOg39XLARhzlDvJSA9SrmpbA+WAg1VNA
         2uCIjHQKXHrIv5g5LHU6Su/cFkoOdrmyfIFb4KjU4E8TbOs6t+ZJXNcgZoYJB75wpVwd
         UGahHU48IbmzbIq5S4iFGjEowvklldu8HuguZ0+4LAOWuqFGzPYYruh5pKGeM3Sezgve
         +mSg==
X-Gm-Message-State: APjAAAU0JTosp/9PuUjkV9aJnFr366eWzYLgnoH1RMli8jO4QjDvCGGJ
        W2LvEWen1n398UmwAT2hWQIQE26vyjBEbZJatkE=
X-Google-Smtp-Source: APXvYqyYvznJh6VnPxFVWBdf2UL8cd4ZIhH2B9CT9OkJ1fXppxrnN7lNde/DnAreFWNqMRipL6T5DjYD2kgaz7Lo7sI=
X-Received: by 2002:ac8:7b29:: with SMTP id l9mr4727594qtu.141.1575494372691;
 Wed, 04 Dec 2019 13:19:32 -0800 (PST)
MIME-Version: 1.0
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com> <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
 <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com> <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
 <056E9F5E-4FDD-4636-A43A-EC98A06E84D3@redhat.com> <aa59532b-34a9-7887-f550-ef2859f0c9f1@fb.com>
 <B7E0062E-37ED-46E6-AE64-EE3E2A0294EA@redhat.com> <CAEf4BzaTRc8dPxZnWhVZe7xpyMwpL1NEgGQyBjeXnsaN_D5CWA@mail.gmail.com>
 <5de7f5057f957_96d2b0feaf1e5bc19@john-XPS-13-9370.notmuch>
In-Reply-To: <5de7f5057f957_96d2b0feaf1e5bc19@john-XPS-13-9370.notmuch>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Wed, 4 Dec 2019 13:19:21 -0800
Message-ID: <CAEf4BzaorvXOcunEg7CPYmeFhWzAg14dOaj10kVxzc9pnoXiLw@mail.gmail.com>
Subject: Re: Trying the bpf trace a bpf xdp program
To:     John Fastabend <john.fastabend@gmail.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>, Yonghong Song <yhs@fb.com>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Dec 4, 2019 at 10:03 AM John Fastabend <john.fastabend@gmail.com> w=
rote:
>
> Andrii Nakryiko wrote:
> > On Wed, Dec 4, 2019 at 5:20 AM Eelco Chaudron <echaudro@redhat.com> wro=
te:
> > >
>
> [...]
>
> > >
> > > PS: If I run the latest pahole (v1.15) on the .o files, I get the
> > > following libbpf error: =E2=80=9Clibbpf: Cannot find bpf_func_info fo=
r main
> > > program sec fexit/xdp_prog_simple. Ignore all bpf_func_info.=E2=80=9D
> > >
> >
> > pahole is not supposed to be run on BPF object file. It's needed only
> > to do DWARF to BTF conversion for kernel itself. So never mind this
> > one. The NULL dereference, though, seems like a bug, I agree with
> > Yonghong.
>
> Really? I've been using pahole on BPF object files regularly mostly
> to test structures match up with kernel pahole output but its always
> worked on my side. Even pahole -j seems to work fine here.

Well, it still works for simpler stuff, but it certainly won't emit
global variables type info, CO-RE relocations, etc. BTF for BPF object
files should get produced by Clang,  which is perfectly capable of
doing this (provided you have recent enough version of it, of course).
