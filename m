Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B7865661
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jul 2019 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbfGKMHl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jul 2019 08:07:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43021 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbfGKMHh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jul 2019 08:07:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so5491751ljv.10
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Jul 2019 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kinvolk.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/GkyJO/XzCdLnefrckS27eNcOWh/ymnRvDaUSAxjqU8=;
        b=ektyVvNoHno+vGzdhSyNvexrE2XG1HdIQjty5SZHH7PS1BFMLEd9bZ81vw7XjKeA4d
         UapLshT+pX16Xoyw5FdEWffeXedaspH6Q5KXdfoJfSBzRQQbVXsHKOs/NrzEDeCvzSIy
         YQdagHOcmHKLQ2NAJx6GwCW8s9RwY9K0qshog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/GkyJO/XzCdLnefrckS27eNcOWh/ymnRvDaUSAxjqU8=;
        b=olYiJqL7TPb2jAfDf8ObJpAFm14JQUtLwtvo+CYzeYgEyX6LezbuP8aCxOWpghUbIh
         n8EIRAtKcRt8UOiOAtGi97Gu/A56rwrDTaaivNw9ojW7hxsq6E9HxL13xZcenro1DuRz
         dGO+C9ZRrcnaSvD2QGOFb4zF5z/CzrNAcTHQ27Cg0SyB9bHtyzzEZwO/0I1btdF3co1w
         00Rtzf0DxlGksRmBJch3TiVME/CDr3UimUZcluOZlMUf9i4vNYEDJ2KNWHvA9r2Amtc2
         ju7wZB5R2d4+6tJ/Q4z1vKmgBRw8YO+5CAQ4dQ7cjOOAm/zTit17y03MMheTMcAQ3uFc
         rj8A==
X-Gm-Message-State: APjAAAUBUmo4ct70qEF1FIdkraMDdY/3HGeDzwxXicFfvUu+PR8KPtBo
        DlEHnqjWA+VdgGcY79mv1tA8zhsTP+kwgfEIhCqsRw==
X-Google-Smtp-Source: APXvYqzP22RRcZcUhDujyqUU5IP2zXoX9fJ3k2M6/GT1tQ3bZzzFR2TqUW6TndXcmnVlqSvHUPDoPdHjVwPeutIGhko=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr2293534ljj.151.1562846855331;
 Thu, 11 Jul 2019 05:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190708163121.18477-1-krzesimir@kinvolk.io> <20190708163121.18477-5-krzesimir@kinvolk.io>
 <CAEf4BzZoOw=1B8vV53iAxz8LDULOPVF-he4C_usoUQSdXU+oSg@mail.gmail.com>
In-Reply-To: <CAEf4BzZoOw=1B8vV53iAxz8LDULOPVF-he4C_usoUQSdXU+oSg@mail.gmail.com>
From:   Krzesimir Nowak <krzesimir@kinvolk.io>
Date:   Thu, 11 Jul 2019 14:07:24 +0200
Message-ID: <CAGGp+cGUYbdEeHJxVCk0VZvOMSoR6Fz5aUJD0Ye71w5dxETXMA@mail.gmail.com>
Subject: Re: [bpf-next v3 04/12] selftests/bpf: Use bpf_prog_test_run_xattr
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Alban Crequy <alban@kinvolk.io>,
        =?UTF-8?Q?Iago_L=C3=B3pez_Galeiras?= <iago@kinvolk.io>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@google.com>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jul 11, 2019 at 2:03 AM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Jul 8, 2019 at 3:43 PM Krzesimir Nowak <krzesimir@kinvolk.io> wro=
te:
> >
> > The bpf_prog_test_run_xattr function gives more options to set up a
> > test run of a BPF program than the bpf_prog_test_run function.
> >
> > We will need this extra flexibility to pass ctx data later.
> >
> > Signed-off-by: Krzesimir Nowak <krzesimir@kinvolk.io>
> > ---
>
> lgtm, with some nits below
>
> Acked-by: Andrii Nakryiko <andriin@fb.com>
>
> >  tools/testing/selftests/bpf/test_verifier.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testin=
g/selftests/bpf/test_verifier.c
> > index c7541f572932..1640ba9f12c1 100644
> > --- a/tools/testing/selftests/bpf/test_verifier.c
> > +++ b/tools/testing/selftests/bpf/test_verifier.c
> > @@ -822,14 +822,20 @@ static int do_prog_test_run(int fd_prog, bool unp=
riv, uint32_t expected_val,
> >  {
> >         __u8 tmp[TEST_DATA_LEN << 2];
> >         __u32 size_tmp =3D sizeof(tmp);
>
> nit: this is now is not needed as a separate local variable, inline?

I think I'm using this variable in a followup commit, but I'll look closely=
.

>
> > -       uint32_t retval;
> >         int saved_errno;
> >         int err;
> > +       struct bpf_prog_test_run_attr attr =3D {
> > +               .prog_fd =3D fd_prog,
> > +               .repeat =3D 1,
> > +               .data_in =3D data,
> > +               .data_size_in =3D size_data,
> > +               .data_out =3D tmp,
> > +               .data_size_out =3D size_tmp,
> > +       };
> >
> >         if (unpriv)
> >                 set_admin(true);
> > -       err =3D bpf_prog_test_run(fd_prog, 1, data, size_data,
> > -                               tmp, &size_tmp, &retval, NULL);
> > +       err =3D bpf_prog_test_run_xattr(&attr);
> >         saved_errno =3D errno;
> >         if (unpriv)
> >                 set_admin(false);
> > @@ -846,9 +852,9 @@ static int do_prog_test_run(int fd_prog, bool unpri=
v, uint32_t expected_val,
> >                         return err;
> >                 }
> >         }
> > -       if (retval !=3D expected_val &&
> > +       if (attr.retval !=3D expected_val &&
> >             expected_val !=3D POINTER_VALUE) {
>
> this if condition now fits one line, can you please combine? thanks!

Sure.

>
> > -               printf("FAIL retval %d !=3D %d ", retval, expected_val)=
;
> > +               printf("FAIL retval %d !=3D %d ", attr.retval, expected=
_val);
> >                 return 1;
> >         }
> >
> > --
> > 2.20.1
> >



--=20
Kinvolk GmbH | Adalbertstr.6a, 10999 Berlin | tel: +491755589364
Gesch=C3=A4ftsf=C3=BChrer/Directors: Alban Crequy, Chris K=C3=BChl, Iago L=
=C3=B3pez Galeiras
Registergericht/Court of registration: Amtsgericht Charlottenburg
Registernummer/Registration number: HRB 171414 B
Ust-ID-Nummer/VAT ID number: DE302207000
