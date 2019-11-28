Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663F810CEF6
	for <lists+xdp-newbies@lfdr.de>; Thu, 28 Nov 2019 20:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfK1Tr1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 28 Nov 2019 14:47:27 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39228 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfK1Tr1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 28 Nov 2019 14:47:27 -0500
Received: by mail-lj1-f195.google.com with SMTP id e10so20410587ljj.6;
        Thu, 28 Nov 2019 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s77eYlZ/p/bPovxs5rADoT3NOYKiFQxNz6LJTwjNEQU=;
        b=dgjBtj+1WReT+Jr3JpKpsPvV2HxPG/FNmgtJfNpk0aD0TLZUvLNLN7sgqcsd5vf4VO
         aEkv8aBcfCfGtgMERxbR9RzgmEVZ7fO9MwCPyaAoYITXMU76I3FpjAK06gqkf1sON/F5
         iN4+33VmJRtb6qyXJe3JtQwaxO/mS7XUHIVMEmtWnmNfp+8RhtimDgGXl8b+d54+pv8r
         1tNXyK9BSQzfYHz+Qkw3lFGg3xyOhLnKmWDX24WLWfB0/0B7Pdf8a8H01r/Edfv0F77M
         kkEr0/xQBbDMwTVnX10a5GM7y1bcIgqehHbsh1vLqOi1UTd0rxj2CjXuszy8rPbwjizy
         /QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s77eYlZ/p/bPovxs5rADoT3NOYKiFQxNz6LJTwjNEQU=;
        b=BQ/+zJLj0droidGXZoAY0zdTqmhIN7KEImbsCZgGr32YfehFlHG+B2Dbvjxj6xKCZJ
         cOMcANS+4RxQeisLBjEWFWR9y9nTBMo7ujoSl/VFLSVcClzJv+BlKshhMeLgpt88Sf2Q
         A/RnpIMRJxfwAZRLqQurvio3mbaKfZbPK1Put+fBejuNx9ROe713iyTwBj7cO/hEa1Ya
         eBBwUQao4ABVSa04d2lCXE2pJHEC5ul85QMq88gEu7aCvg3WHbuRyz4sD8VIFiQTn9S5
         NzVrgyhdNfOs1WV+CpiNJmr2OyTAEEK4GIXoBD/PeyQbf7jn+XKBntv3IEHKd5ruoM8T
         p0lw==
X-Gm-Message-State: APjAAAVlc7LohG461TQUcE5n0JoOlteabjTa/T10qBsr734S7JI1Cu8J
        VuF20tQbOwWq5XK7D2m3WQynqr40bHIggG+1WJSOeQ==
X-Google-Smtp-Source: APXvYqxZtkdwxnD4/n804idAad+zXjWAtzsLl/mqgKhzViVAc9qmBrAegervq84Kvw4AjKRhjGVfsqXJUNYlRYxeoeE=
X-Received: by 2002:a2e:9181:: with SMTP id f1mr5541803ljg.51.1574970445108;
 Thu, 28 Nov 2019 11:47:25 -0800 (PST)
MIME-Version: 1.0
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com> <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
In-Reply-To: <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Thu, 28 Nov 2019 11:47:13 -0800
Message-ID: <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
Subject: Re: Trying the bpf trace a bpf xdp program
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Nov 28, 2019 at 11:16 AM Eelco Chaudron <echaudro@redhat.com> wrote=
:
>
>
>
> On 28 Nov 2019, at 19:18, Alexei Starovoitov wrote:
>
> > On Thu, Nov 28, 2019 at 9:20 AM Eelco Chaudron <echaudro@redhat.com>
> > wrote:
> >>
> >> Trying out the BPF trace to trace a BPF program, but I=E2=80=99m alrea=
dy
> >> getting stuck loading the object with the fexit  :(
> >
> > I can take a look after holidays.
>
> Enjoy the Holidays!! I figured out my auto kernel install script failed
> whiteout me noticing, and I was running an old kernel :(
>
> I will try tomorrow with the correct kernel=E2=80=A6

Please also check that you have the latest llvm and pahole.
pahole version should be >=3D 1.13.
clang ideally from master.
If all that is working then downgrade one by one and bisect whether the bug=
 is.

>
> >> libbpf: load bpf program failed: Argument list too long
> >> libbpf: failed to load program 'fexit/xdp_prog_simple'
> >> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
> >> ERROR: Failed to load object file: Operation not permitted
> >
> > please add -vvv and share full output.
>
