Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34DD43A53
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Jun 2019 17:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFMPUX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Jun 2019 11:20:23 -0400
Received: from turquesa.dcc.ufmg.br ([150.164.0.150]:27136 "EHLO
        smtp.dcc.ufmg.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732113AbfFMM4m (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Jun 2019 08:56:42 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by smtp.dcc.ufmg.br (Postfix) with ESMTPSA id 456887F845
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Jun 2019 09:56:38 -0300 (-03)
Received: by mail-qt1-f177.google.com with SMTP id i34so22349517qta.6
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Jun 2019 05:56:38 -0700 (PDT)
X-Gm-Message-State: APjAAAV6gQpS2bEi5oz7d9P0+99XXrRd6Br6ExKg8PNkOgi6Q7wkdQI+
        Nj3PLUWB1zfWsXrbW8TBmJ3Ool/81k9arUGr0B4=
X-Google-Smtp-Source: APXvYqw3zqeLbvN6ti3h24xvAdmBxiyCMh9shAFs1px+SdtOHpz4H9vpCQiLgX63zSX4Zl+mZqi6pSNPHvMwQPpwrqo=
X-Received: by 2002:a0c:b5dd:: with SMTP id o29mr3425718qvf.85.1560430596249;
 Thu, 13 Jun 2019 05:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
 <CAMENy5pTvJnij++qLmEpXYsB-3991AZ7pBHDaFKjcVBrJJ664w@mail.gmail.com>
In-Reply-To: <CAMENy5pTvJnij++qLmEpXYsB-3991AZ7pBHDaFKjcVBrJJ664w@mail.gmail.com>
From:   Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>
Date:   Thu, 13 Jun 2019 09:56:25 -0300
X-Gmail-Original-Message-ID: <CAPyJoH=5rcpGjX=J+ZSvMydAh4Ygm5hDoKiuEefGayccGgq0GA@mail.gmail.com>
Message-ID: <CAPyJoH=5rcpGjX=J+ZSvMydAh4Ygm5hDoKiuEefGayccGgq0GA@mail.gmail.com>
Subject: Re: Measuring performance of BPF programs
To:     Sebastiano Miano <sebastiano.miano@polito.it>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Sebastiano,

Thanks for the tip. Right now I'm using kernel 5.0, so I tried the
second option with 'perf record' + 'perf report', and it gave me
exactly what I needed.

After installing the kernel symbols I'm able to see all function
calls, including calls to cls_bpf_classify() and
bpf_xdp_adjust_head(), but I don't see any symbols with the format you
said.

Am I missing some symbol packages?

Thanks,
Matheus Castanho

On Tue, Jun 11, 2019 at 11:43 AM Sebastiano Miano
<sebastiano.miano@polito.it> wrote:
>
> Hello Matheus,
> starting from kernel 5.1 it is possible to get some statistics of a
> specific eBPF program running in the kernel, thanks to this [1] patch.
> You can enable it by setting 'kernel.bpf_stats_enabled=1' and show the
> result using bpftool [2] ('bpftool prof show id <bpf_prog_id>).
> This will print the total time spent on a given eBPF program and the
> total number of runs.
>
> If you want to get more information on a running eBPF program you
> could use 'perf report + report' as any other kernel function.
> In this case, you should see a symbol like
> 'bpf_prog_<prog_tag>_<func_name>' that refers to a single eBPF
> program.
>
> Hope this helps.
>
> [1] https://patchwork.ozlabs.org/patch/1047415/
> [2] https://github.com/torvalds/linux/tree/master/tools/bpf/bpftool
>
> Cheers,
> --
> Sebastiano Miano,
> Politecnico di Torino (DAUIN),
> https://sebymiano.github.io/
>
>
> On Tue, Jun 11, 2019 at 2:37 PM Matheus Salgueiro Castanho
> <matheus.castanho@dcc.ufmg.br> wrote:
> >
> > Hi XDP-Newbies,
> >
> > I've been working with BPF programs on the XDP and TC hooks and wanted
> > to understand their overhead on the overall packet processing stack.
> > Mainly I'd like to know how many times those programs have run and
> > also how long each execution took.
> >
> > I know that BPF programs can also be used for tracing inside the
> > kernel, so I looked up into bpftrace [1] to help me with this task, so
> > I could start monitoring my programs faster.
> >
> > After browsing through the list of available trace hooks (bpftrace -l)
> > I found a series of kprobes for xdp- and bpf-related functions. At
> > first, however, none of them seem to map directly to an individual
> > program execution.
> >
> > For the TC case, I found the kprobe for cls_bpf_classify(), which
> > seems to be the function that actually runs the BPF program on TC and
> > handles the output. Although it has extra processing compared to the
> > BPF program per se[[, this seemed close enough.
> >
> > However, I didn't find a similar kprobe for the XDP case. I imagine
> > this is so because XDP native runs inside the NIC driver, right?
> >
> > Is there a kprobe that maps to a single XDP program execution, or at
> > least close enough? Or is there a better way to measure and trace TC
> > and XDP programs?
> >
> > Thanks in advance,
> > Matheus Castanho
> >
> > [1] https://github.com/iovisor/bpftrace
