Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE0723CD1F
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 15:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404076AbfFKNhT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 11 Jun 2019 09:37:19 -0400
Received: from turquesa.dcc.ufmg.br ([150.164.0.150]:27608 "EHLO
        smtp.dcc.ufmg.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403885AbfFKNhT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 09:37:19 -0400
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jun 2019 09:37:18 EDT
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by smtp.dcc.ufmg.br (Postfix) with ESMTPSA id F1CBD7F6B5
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 10:30:12 -0300 (-03)
Received: by mail-qt1-f181.google.com with SMTP id d23so14495676qto.2
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 06:30:12 -0700 (PDT)
X-Gm-Message-State: APjAAAUSnAokC4jvJGDfe0PAMnlid9ylFmC2Xy3ytzwHz8C0zYvNcuZe
        IM9SaK0T4TtjVzrmIXWFeVQv494Nhq/tLd9Vyhg=
X-Google-Smtp-Source: APXvYqy9dA2QtrPb2SKU7OSXAJ8TyDD2/lHwFetRL3OtZTrom/5i4+cW2hSUti1RdDXcV8oIAluri7eZuRtT9jKxMow=
X-Received: by 2002:a0c:8069:: with SMTP id 96mr26221448qva.242.1560259810522;
 Tue, 11 Jun 2019 06:30:10 -0700 (PDT)
MIME-Version: 1.0
From:   Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br>
Date:   Tue, 11 Jun 2019 10:29:59 -0300
X-Gmail-Original-Message-ID: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
Message-ID: <CAPyJoHm0i1g_F8qcZWCifFtSEv10PFS4du_Nx35g+ztFvPwkgw@mail.gmail.com>
Subject: Measuring performance of BPF programs
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi XDP-Newbies,

I've been working with BPF programs on the XDP and TC hooks and wanted
to understand their overhead on the overall packet processing stack.
Mainly I'd like to know how many times those programs have run and
also how long each execution took.

I know that BPF programs can also be used for tracing inside the
kernel, so I looked up into bpftrace [1] to help me with this task, so
I could start monitoring my programs faster.

After browsing through the list of available trace hooks (bpftrace -l)
I found a series of kprobes for xdp- and bpf-related functions. At
first, however, none of them seem to map directly to an individual
program execution.

For the TC case, I found the kprobe for cls_bpf_classify(), which
seems to be the function that actually runs the BPF program on TC and
handles the output. Although it has extra processing compared to the
BPF program per se[[, this seemed close enough.

However, I didn't find a similar kprobe for the XDP case. I imagine
this is so because XDP native runs inside the NIC driver, right?

Is there a kprobe that maps to a single XDP program execution, or at
least close enough? Or is there a better way to measure and trace TC
and XDP programs?

Thanks in advance,
Matheus Castanho

[1] https://github.com/iovisor/bpftrace
