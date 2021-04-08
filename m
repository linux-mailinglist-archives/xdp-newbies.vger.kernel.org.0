Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1D7357A41
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Apr 2021 04:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhDHCUS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 7 Apr 2021 22:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhDHCUS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 7 Apr 2021 22:20:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9787FC061760
        for <xdp-newbies@vger.kernel.org>; Wed,  7 Apr 2021 19:20:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 184so373052ljf.9
        for <xdp-newbies@vger.kernel.org>; Wed, 07 Apr 2021 19:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=RfRePQ88tYwM/vvcYrOxZeyCGMJQqz0zaZVUsluMcpM=;
        b=WmtYVfh0VPROgyl2Q79ag3qgcagdlcMLfq6IZIfOQtBHxe81Wb4NEpRsv2UDmXW84s
         cmaPC64yyZE6kdVs18JHw7wCkNLHhayvxYWci2h8cmY0acMTq/HGAFJBnj6un2SatMxt
         FY+L13yEBPKKYuOJODhwt+Ck4XjWwbdbXE320=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=RfRePQ88tYwM/vvcYrOxZeyCGMJQqz0zaZVUsluMcpM=;
        b=M/9J7XZ3H1PUivRMjW/1WK+MDtChre9658fCy2rCePSx3SPQW5T2p76xlF/eG7B00R
         vYL3uZzj9nTtFuYqBApIH3Bah8d2V5+EmnBIDsSH8UcUPf155GLDXPHYLe+VTX82e49B
         0jmtItHhgi/GDVDw5kvUkriJOGlg9hjEUfuWGwjThV10mckrpucVV4AVayBK2C0Wbpgf
         mcSvvjaci7ppSvyom2rGPok+sKMzgcKmfGvgne8GWVrpPdhLy+en8CahbF+R1uhZgtNr
         EBq0SAkV1F+KDifEDvPyNNtPNE73iQkV2ug8760ITq0cd0461umX0cZBz5N9CQnrGJZZ
         Rqkg==
X-Gm-Message-State: AOAM5328iLFWP2dsvuszNSoRRNo6FQ/5EFhUZjWc/3al1yPHfrJEf5pJ
        bs6eMvRepN3ZABlego210b75H/uSOOSNdp946h5/J2eIkkOR4Q==
X-Google-Smtp-Source: ABdhPJz5p/eukdae1UWUOTZJFNInM5m3oSLbZgkdyIdlZ+8oeH6YQ/Q7nCjPG+kS0aZ5Fz8rNnz9vjDqX1jEn/BZ+Sc=
X-Received: by 2002:a2e:9cd5:: with SMTP id g21mr3820241ljj.367.1617848404952;
 Wed, 07 Apr 2021 19:20:04 -0700 (PDT)
MIME-Version: 1.0
From:   Neal Shukla <nshukla@riotgames.com>
Date:   Wed, 7 Apr 2021 19:19:54 -0700
Message-ID: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
Subject: Profiling XDP programs for performance issues
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

We=E2=80=99ve been introducing bpf_tail_call=E2=80=99s into our XDP program=
s and have run into
packet loss and latency increases when performing load tests. After profili=
ng
our code we=E2=80=99ve come to the conclusion that this is the problem area=
 in our code:
`int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`

This is the first time we read from the packet in the first XDP program. We=
 have
yet to make a tail call at this point. However, we do write into the metada=
ta
section prior to this line.

How We Profiled Our Code:
To profile our code, we used https://github.com/iovisor/bpftrace. We ran th=
is
command while sending traffic to our machine:
`sudo bpftrace bpftrace -e 'profile:hz:99 { @[kstack] =3D count(); }' >
/tmp/stack_samples.out`

From there we got a kernel stack trace with the most frequently counted spo=
ts at
the bottom of the output file. The most commonly hit spot asides from the C=
PU
idle look like:
```
@[
    bpf_prog_986b0b3beb6f0873_some_program+290
    i40e_napi_poll+1897
    net_rx_action+309
    __softirqentry_text_start+202
    run_ksoftirqd+38
    smpboot_thread_fn+197
    kthread+283
    ret_from_fork+34
]: 8748
```

We then took the program id and ran this command to retrieve the jited code=
:
`sudo bpftool prog dump jited tag 986b0b3beb6f0873`

By converting the decimal offset (290) from the stack trace to hex format (=
122)
we found the line which it=E2=80=99s referring to in the jited code:
```
11d:   movzbq 0xc(%r15),%rsi
122:   movzbq 0xd(%r15),%rdi
127:   shl         $0x8,%rdi
12b:   or          %rsi,%rdi
12e:   ror         $0x8,%di
132:   movzwl %di,%edi
```
We've mapped this portion to refer to the line mentioned earlier:
`int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`

1) Are we correctly profiling our XDP programs?

2) Is there a reason why our first read into the packet would cause this is=
sue?
And what would be the best way to solve the issue?
We've theorized it may have to do with cache or TLB misses as we've added a=
 lot
more instructions to our programs.

Thanks for your time!
