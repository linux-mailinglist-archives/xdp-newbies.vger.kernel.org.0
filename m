Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A5011344E
	for <lists+xdp-newbies@lfdr.de>; Wed,  4 Dec 2019 19:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbfLDSXe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 4 Dec 2019 13:23:34 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40411 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730101AbfLDSEA (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 4 Dec 2019 13:04:00 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so374205ila.7;
        Wed, 04 Dec 2019 10:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding;
        bh=mNlwmi0u3rgO3+hNeu4RddiFokBbuLskDG4rst0WBbo=;
        b=mz611CTx3wVy/qJagI9rlKyjfezEfRLh/joAsEBNLrGxeokWo3Pjw621XUUEZKTvHT
         Bem6u0DmonrpP3Ckv7vKrjUeUoKH3ZfT5UMCOCzmQAiDChIwiBfXWWGumfaQzE6UsGde
         /R8Zec9zmXCM1LgtvXgUvbJgDlEh4yZn4icDVV4Ueh4OgtUN87qBZmtbjyL8LzslR7bq
         ZI7QuIC+4YGXbpPjyh0iuzZoCVRiEMpgpQgzfH9GuOKz8Ld3xx5KLm4GAzV+Sl2G52qj
         rpgA6ZGFpp0niDAf37pSfmpROK3JlH25xNxirv6eOBxq38RH5d2pV0dZKUZxk4y4oVFs
         EHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding;
        bh=mNlwmi0u3rgO3+hNeu4RddiFokBbuLskDG4rst0WBbo=;
        b=DqL1L9rQv52z9xIUND2W0AWMgM0H127YiagUvKxhJjLA+yBv0vOreKP8rR6TTICLRg
         XExJhAH0oxDIv6OcPaQvsIc34vvXEY0P7Gd79hzKcNmqpwiTU7VnlK+OaqsKC+FFFL+z
         CvM4GE/YLu62wGj2UMqaOBnwWlsnKRkk7qcpSDJ67kMnXQMD5+CMQ6Z0LQAExeyrg2SM
         QoHeq7mxQCkbVCADbdT5tTqWV0T/Y8FYxJ0SP6LiEq40oEd/L5N959KiG5jr+68JkVBM
         fO3qB8ae9aooDCyzaV4/JEOKl1Nal0IvsUCbhTJvYsRP2BpYfxrjS/hd/kU+RPEk5k0V
         7W1w==
X-Gm-Message-State: APjAAAULNgkQKOs+CcZyYqwhxlg8TJ4Ygnewzv2ZaQeiEPOHAYqKVG8n
        EkPo7Dy68T682rEVbNzHIjw=
X-Google-Smtp-Source: APXvYqwFqC6PCmNDcAl0z6VFGwpCamy0JG3JQlIWYoqhN5eipBjC4GKmIj4vhjG9b84QNrFkwD+z6w==
X-Received: by 2002:a92:5c8f:: with SMTP id d15mr5042373ilg.102.1575482639050;
        Wed, 04 Dec 2019 10:03:59 -0800 (PST)
Received: from localhost ([184.63.162.180])
        by smtp.gmail.com with ESMTPSA id o12sm1629996ioh.42.2019.12.04.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 10:03:58 -0800 (PST)
Date:   Wed, 04 Dec 2019 10:03:49 -0800
From:   John Fastabend <john.fastabend@gmail.com>
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Eelco Chaudron <echaudro@redhat.com>
Cc:     Yonghong Song <yhs@fb.com>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Message-ID: <5de7f5057f957_96d2b0feaf1e5bc19@john-XPS-13-9370.notmuch>
In-Reply-To: <CAEf4BzaTRc8dPxZnWhVZe7xpyMwpL1NEgGQyBjeXnsaN_D5CWA@mail.gmail.com>
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
 <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
 <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com>
 <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
 <056E9F5E-4FDD-4636-A43A-EC98A06E84D3@redhat.com>
 <aa59532b-34a9-7887-f550-ef2859f0c9f1@fb.com>
 <B7E0062E-37ED-46E6-AE64-EE3E2A0294EA@redhat.com>
 <CAEf4BzaTRc8dPxZnWhVZe7xpyMwpL1NEgGQyBjeXnsaN_D5CWA@mail.gmail.com>
Subject: Re: Trying the bpf trace a bpf xdp program
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Andrii Nakryiko wrote:
> On Wed, Dec 4, 2019 at 5:20 AM Eelco Chaudron <echaudro@redhat.com> wro=
te:
> >

[...]

> >
> > PS: If I run the latest pahole (v1.15) on the .o files, I get the
> > following libbpf error: =E2=80=9Clibbpf: Cannot find bpf_func_info fo=
r main
> > program sec fexit/xdp_prog_simple. Ignore all bpf_func_info.=E2=80=9D=

> >
> =

> pahole is not supposed to be run on BPF object file. It's needed only
> to do DWARF to BTF conversion for kernel itself. So never mind this
> one. The NULL dereference, though, seems like a bug, I agree with
> Yonghong.

Really? I've been using pahole on BPF object files regularly mostly
to test structures match up with kernel pahole output but its always
worked on my side. Even pahole -j seems to work fine here.=
