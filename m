Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4BC3D069
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 17:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404364AbfFKPKH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 11 Jun 2019 11:10:07 -0400
Received: from fm1nodo5.polito.it ([130.192.180.18]:51563 "EHLO
        fm1nodo5.polito.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404326AbfFKPKH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 11:10:07 -0400
X-Greylist: delayed 1621 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jun 2019 11:10:06 EDT
Received: from polito.it (frontmail2.polito.it [130.192.180.42])
        by fm1nodo5.polito.it  with ESMTP id x5BEh3RS026624-x5BEh3RU026624
        (version=TLSv1.0 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=CAFAIL)
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 16:43:04 +0200
X-ExtScanner: Niversoft's FindAttachments (free)
Received: from mail-io1-f41.google.com (account d038154@polito.it [209.85.166.41] verified)
  by polito.it (CommuniGate Pro SMTP 6.2.5)
  with ESMTPSA id 92457403 for xdp-newbies@vger.kernel.org; Tue, 11 Jun 2019 16:43:03 +0200
Received: by mail-io1-f41.google.com with SMTP id r185so10081597iod.6
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 07:43:03 -0700 (PDT)
X-Gm-Message-State: APjAAAWYdFRmJyFUkWxsOO3g8HbywuQVJ23YX2E23QI41FXEz8mUvUrY
        vqJziDFelV7ZgH34VCqFORkpY6rLtuVJpQrvgdI=
X-Google-Smtp-Source: APXvYqwLkleKcMNrzKbkkB0ZC6DncmTVHFAbH7kvLDu02pUL8vSNXuA/Ic8zJA2WKS1UmQ5O3NXCuhqC5AQclLMS2pM=
X-Received: by 2002:a5d:9502:: with SMTP id d2mr31434953iom.2.1560264182269;
 Tue, 11 Jun 2019 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
In-Reply-To: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
From:   Sebastiano Miano <sebastiano.miano@polito.it>
Date:   Tue, 11 Jun 2019 15:42:50 +0100
X-Gmail-Original-Message-ID: <CAMENy5pTvJnij++qLmEpXYsB-3991AZ7pBHDaFKjcVBrJJ664w@mail.gmail.com>
Message-ID: <CAMENy5pTvJnij++qLmEpXYsB-3991AZ7pBHDaFKjcVBrJJ664w@mail.gmail.com>
Subject: Re: Measuring performance of BPF programs
To:     Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Matheus,
starting from kernel 5.1 it is possible to get some statistics of a
specific eBPF program running in the kernel, thanks to this [1] patch.
You can enable it by setting 'kernel.bpf_stats_enabled=1' and show the
result using bpftool [2] ('bpftool prof show id <bpf_prog_id>).
This will print the total time spent on a given eBPF program and the
total number of runs.

If you want to get more information on a running eBPF program you
could use 'perf report + report' as any other kernel function.
In this case, you should see a symbol like
'bpf_prog_<prog_tag>_<func_name>' that refers to a single eBPF
program.

Hope this helps.

[1] https://patchwork.ozlabs.org/patch/1047415/
[2] https://github.com/torvalds/linux/tree/master/tools/bpf/bpftool

Cheers,
--
Sebastiano Miano,
Politecnico di Torino (DAUIN),
https://sebymiano.github.io/


On Tue, Jun 11, 2019 at 2:37 PM Matheus Salgueiro Castanho
<matheus.castanho@dcc.ufmg.br> wrote:
>
> Hi XDP-Newbies,
>
> I've been working with BPF programs on the XDP and TC hooks and wanted
> to understand their overhead on the overall packet processing stack.
> Mainly I'd like to know how many times those programs have run and
> also how long each execution took.
>
> I know that BPF programs can also be used for tracing inside the
> kernel, so I looked up into bpftrace [1] to help me with this task, so
> I could start monitoring my programs faster.
>
> After browsing through the list of available trace hooks (bpftrace -l)
> I found a series of kprobes for xdp- and bpf-related functions. At
> first, however, none of them seem to map directly to an individual
> program execution.
>
> For the TC case, I found the kprobe for cls_bpf_classify(), which
> seems to be the function that actually runs the BPF program on TC and
> handles the output. Although it has extra processing compared to the
> BPF program per se[[, this seemed close enough.
>
> However, I didn't find a similar kprobe for the XDP case. I imagine
> this is so because XDP native runs inside the NIC driver, right?
>
> Is there a kprobe that maps to a single XDP program execution, or at
> least close enough? Or is there a better way to measure and trace TC
> and XDP programs?
>
> Thanks in advance,
> Matheus Castanho
>
> [1] https://github.com/iovisor/bpftrace
