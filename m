Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395512FE399
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Jan 2021 08:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbhAUHQb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Jan 2021 02:16:31 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:46841 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbhAUHOw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Jan 2021 02:14:52 -0500
Received: by mail-io1-f69.google.com with SMTP id m14so1835142ioc.13
        for <xdp-newbies@vger.kernel.org>; Wed, 20 Jan 2021 23:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=xo9ghie0HmQTCVFE6esqYP8OmOHWlrtIq/GxNkUwj5U=;
        b=HPjYYg0gEIBQQy5dNEuFJUWxvBk3riExc4bF5jIOnNh82kjbmOekXmjnDg+BoG2O61
         Ogn2LcPvl+OuJy0sdL3VTQLiETuwuBKakkLAUVWVivl4ePM9ePAOTdTJS5I4JAFmUQ7b
         zMIMW8n5BaUt4x7+t9tsaPzWxG8e/jII3VrhlHrbkLhlk9NKk6s4x+ZQr8mGl/bPdfKM
         JH25/Rulq9JNPhPfVUcW4Qh6osqe28+7eH52Exxt16lT+wJBsV1ZsWcKSs9MEINLOGm1
         bbSBHRkUQI1kaaB082MJIVnIW5g/VzhDvtulMsLRgfX6E+4ZGYN1TKvbTcXHwAODStqA
         1K8Q==
X-Gm-Message-State: AOAM533jYF4wTLHpPyrAsAkxBdoznNiz51XPAa9ywZCP09O1YRx6mdev
        yu6FMgj7gDAAsCHPdFZDsXL51AGXgUjdxDnxcCPr19z5t3+8
X-Google-Smtp-Source: ABdhPJzDLnqdQook2ZXZb3CUnas5dN6lgKAj1/BZrrphe7tOta2u+ZsyZ5hzlDABjpjcMMegIBs85pqV27tUbqqi6hEb5rGPe9sv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1985:: with SMTP id g5mr10839151ilf.257.1611213251877;
 Wed, 20 Jan 2021 23:14:11 -0800 (PST)
Date:   Wed, 20 Jan 2021 23:14:11 -0800
In-Reply-To: <000000000000c8dd4a05b828d04c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000891f4605b963d113@google.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Read in bpf_trace_run7
From:   syzbot <syzbot+fad5d91c7158ce568634@syzkaller.appspotmail.com>
To:     andrii@kernel.org, andriin@fb.com, ast@kernel.org,
        bpf@vger.kernel.org, daniel@iogearbox.net, davem@davemloft.net,
        hawk@kernel.org, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com, kafai@fb.com, kpsingh@kernel.org,
        kuba@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
        netdev@vger.kernel.org, rostedt@goodmis.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, xdp-newbies@vger.kernel.org,
        yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

syzbot has bisected this issue to:

commit 8b401f9ed2441ad9e219953927a842d24ed051fc
Author: Yonghong Song <yhs@fb.com>
Date:   Thu May 23 21:47:45 2019 +0000

    bpf: implement bpf_send_signal() helper

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=123408e7500000
start commit:   7d68e382 bpf: Permit size-0 datasec
git tree:       bpf-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=113408e7500000
console output: https://syzkaller.appspot.com/x/log.txt?x=163408e7500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0c7843b8af99dff
dashboard link: https://syzkaller.appspot.com/bug?extid=fad5d91c7158ce568634
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1224daa4d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dfabd0d00000

Reported-by: syzbot+fad5d91c7158ce568634@syzkaller.appspotmail.com
Fixes: 8b401f9ed244 ("bpf: implement bpf_send_signal() helper")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
