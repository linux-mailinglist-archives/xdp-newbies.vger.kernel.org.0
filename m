Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B357438EE
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Jun 2019 17:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733139AbfFMPJw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Jun 2019 11:09:52 -0400
Received: from fm1nodo5.polito.it ([130.192.180.18]:59628 "EHLO
        fm1nodo5.polito.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732343AbfFMN5G (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Jun 2019 09:57:06 -0400
Received: from polito.it (frontmail1.polito.it [130.192.180.41])
        by fm1nodo5.polito.it  with ESMTP id x5DDv3Jv012022-x5DDv3Jx012022
        (version=TLSv1.0 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Jun 2019 15:57:03 +0200
X-ExtScanner: Niversoft's FindAttachments (free)
Received: from mail-io1-f48.google.com (account d038154@polito.it [209.85.166.48] verified)
  by polito.it (CommuniGate Pro SMTP 6.2.5)
  with ESMTPSA id 157095292 for xdp-newbies@vger.kernel.org; Thu, 13 Jun 2019 15:57:03 +0200
Received: by mail-io1-f48.google.com with SMTP id k13so17050343iop.5
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Jun 2019 06:57:03 -0700 (PDT)
X-Gm-Message-State: APjAAAVhk1ePw+cAbQqz9KN4EY1N3wv6nqml3VS2oQfdSFF69bextnx9
        QxdxCDUKx+ei6l2dkE9Tj47hO5OTOpYf7EY00d4=
X-Google-Smtp-Source: APXvYqwTD2vQ6OZOptEd3tyuTQU/Atlp47Tp/qIHxNnRbDBPa0EMFLiHb0rTq+oT6h+L7V+vx087Fnl71FzaexVJiho=
X-Received: by 2002:a02:22c6:: with SMTP id o189mr45929277jao.35.1560434222180;
 Thu, 13 Jun 2019 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
 <CAMENy5pTvJnij++qLmEpXYsB-3991AZ7pBHDaFKjcVBrJJ664w@mail.gmail.com> <CAPyJoH=5rcpGjX=J+ZSvMydAh4Ygm5hDoKiuEefGayccGgq0GA@mail.gmail.com>
In-Reply-To: <CAPyJoH=5rcpGjX=J+ZSvMydAh4Ygm5hDoKiuEefGayccGgq0GA@mail.gmail.com>
From:   Sebastiano Miano <sebastiano.miano@polito.it>
Date:   Thu, 13 Jun 2019 14:56:49 +0100
X-Gmail-Original-Message-ID: <CAMENy5pkU7EnUph64fvemadMdAcu+n4W6VDZ0Sr=BqkOcmGBCQ@mail.gmail.com>
Message-ID: <CAMENy5pkU7EnUph64fvemadMdAcu+n4W6VDZ0Sr=BqkOcmGBCQ@mail.gmail.com>
Subject: Re: Measuring performance of BPF programs
To:     Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 13, 2019 at 1:56 PM Matheus Salgueiro Castanho
<matheus.castanho@dcc.ufmg.br> wrote:
>
> Hi Sebastiano,
>
> Thanks for the tip. Right now I'm using kernel 5.0, so I tried the
> second option with 'perf record' + 'perf report', and it gave me
> exactly what I needed.
>
> After installing the kernel symbols I'm able to see all function
> calls, including calls to cls_bpf_classify() and
> bpf_xdp_adjust_head(), but I don't see any symbols with the format you
> said.
>
> Am I missing some symbol packages?

Could you please try with a newer kernel (e.g., v5.1)? I guess this
has been added recently, although I am not able to find the
corresponding patch.
Moreover, make sure you first run 'perf record -ag' and then load the
corresponding eBPF program.

Hope this helps.

Cheers,
Sebastiano

>
> Thanks,
> Matheus Castanho
