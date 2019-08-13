Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB918B015
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Aug 2019 08:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfHMGpp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 13 Aug 2019 02:45:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37229 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfHMGpp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 13 Aug 2019 02:45:45 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so33182488otq.4
        for <xdp-newbies@vger.kernel.org>; Mon, 12 Aug 2019 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2VYnxr0D2W544LHW/AN7z1br49PgEUXi7DBBLLyhcc=;
        b=sp9acFbiScrqbXs+XWqL9e8seKTKBbWhWw+ENhAvec/y42gwAWxa6oqmNST4u1yfTK
         /2cNy8B+wijw42r5r+c+otWOa5zyAvN01hwRJevnnrY1fsQ8KNvOMLdPd2ic1GQRS4b7
         Qt9XjXMxsJyPvi2AI9MJlaPcBSJ3+++duVysOy0d4fQFNbAvgNwVBtG4aZ875R3VmQAH
         1ZJcAom9KH3fcmE+bedaxNzHZopa4wdm5QqvxVOtbRfOLSJAZrlILFQVSbmC7CT3jW4y
         Qtrb1yU0AgL39rP3h9D9aZ5VSuD/74dFHngi7VAfJf0OnprQoY3sxRQaRI0uZNQbHrPm
         579Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2VYnxr0D2W544LHW/AN7z1br49PgEUXi7DBBLLyhcc=;
        b=Xk6c1Ma1uNHmtX7mL5sQsLrXhvjSwWf0hiiKwQ6hbnhIvvKsCtPYN350d3ZNwG3y+7
         PbZsQ3RZ+E4vcxMbLOGo/fMI8sOmH6zOkmxv/vFLtd1/iCYpmK8PIFH/B3xiQ/Cy4wJf
         9xTuImAjwnOmeeMhCoEgnu5Ja69mDl9JpHL5/LtbzB2mdg2ekJKhkcAflmipiMGSm1ck
         VR/1mT4gBB0fYtF4Tf1IY9zKSJKqDFaYWn5qvSa2aO+7ablK4MWrN4VkJrC683RO+Cuw
         NLDmXb7Vnp9PlUvk6L/qct68UDePrMUkwzXdnls/KFx4hbFm/yCHg2blfx8dHres0XkW
         1a1g==
X-Gm-Message-State: APjAAAU9FVpsvysTBgwLdB6+ZgElRR1CtJHzwW4lQt/WldnM/DV51Nct
        s4OLYsLHW8Y/jqb0IzB4U1557U9vucgco/DWvvw=
X-Google-Smtp-Source: APXvYqwRDv5UXnHkUCdgYBbywPoIOMyWzPpbw4PGdl9JvXI1FPWlcNiZFgTVxJZqiuRuESHdeECuUkJ5GplJNx13AL0=
X-Received: by 2002:a9d:6256:: with SMTP id i22mr3566199otk.139.1565678744223;
 Mon, 12 Aug 2019 23:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaYocZ3awg1aW=7Z7Ut_G64Ov9ZdyOAeYWNMdTBTf7scJM6EQ@mail.gmail.com>
 <CAH3MdRXcFtxi1mPq2KXUbDLhzHLtm3W=e6XTpFvsgFKH8hjogA@mail.gmail.com>
In-Reply-To: <CAH3MdRXcFtxi1mPq2KXUbDLhzHLtm3W=e6XTpFvsgFKH8hjogA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 13 Aug 2019 08:45:33 +0200
Message-ID: <CAJ8uoz1+8s3x28jVfLey=qaYa6KdyKN5WgRtBnPckV=bHN0uHw@mail.gmail.com>
Subject: Re: libbpf expected backward compatibility
To:     Y Song <ys114321@gmail.com>
Cc:     Rafael Vargas <vargas@khomp.com>, Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Aug 12, 2019 at 10:52 PM Y Song <ys114321@gmail.com> wrote:
>
> On Mon, Aug 12, 2019 at 11:13 AM Rafael Vargas <vargas@khomp.com> wrote:
> >
> > Hi,
> > Reading the tools/lib/bpf/README.rst file, I could find what should be
> > the expected backward compatibility of the library with older kernels.
>
> Now, libbpf tries to maintain backward compatibility with itself.
> That is, APIs introduced in older versions are expected to work
> in new versions.
>
> This has nothing to do with old or new kernels.
>
> >
> > Should I be able to use a libbpf compiled from a kernel newer than the
> > one I will be running or vice-versa?
>
> On the other hand, when libbpf is able to able to load a program or map,
> it tries to reload by resetting some debug/info fields. But depending on
> which API you are using, you may not be able to retry successfully
> on old kernels.
>
> >
> > I've noticed that the following diff (part of
> > 421ecf02c8e73e1d95e16e5e12aa19146561edba) makes the xsk_socket__create
> > function return errno 95 'Operation not supported' on older kernels
> > (5.1.0 in this particular case).
> >
> >
> > diff --git a/src/xsk.c b/src/xsk.c
> > index 7ef6293..bf15a80 100644
> > @@ -597,6 +599,16 @@ int xsk_socket__create(struct xsk_socket
> > **xsk_ptr, const char *ifname,
> >         }
> >
> >         xsk->prog_fd = -1;
> > +
> > +       optlen = sizeof(opts);
> > +       err = getsockopt(xsk->fd, SOL_XDP, XDP_OPTIONS, &opts, &optlen);
> > +       if (err) {
> > +               err = -errno;
> > +               goto out_mmap_tx;
> > +       }
> > +
> > +       xsk->zc = opts.flags & XDP_OPTIONS_ZEROCOPY;
> >
> > Should this really return Operation not supported or should it handle
> > this particular error and set the zc flag as false?
>
> maybe xdp expert can commit on this.
> From my understanding of the code, XDP_OPTIONS_ZEROCOPY
> does not involve any user parameters, so it is totally okay
> to test whether kernel has XDP_OPTIONS or not.
> If not, xdk->zc = 0. Also seems xdk->zc is not really used?

Thanks for spotting this. We should remove the zc field from the
struct as it is not used anymore. Not good to have dead code in there.
Who wants to produce a patch?

/Magnus

> >
> > --
> > Rafael Vargas
