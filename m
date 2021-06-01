Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D1A396C91
	for <lists+xdp-newbies@lfdr.de>; Tue,  1 Jun 2021 07:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhFAFBz (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 1 Jun 2021 01:01:55 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:33422 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhFAFBv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 1 Jun 2021 01:01:51 -0400
Received: by mail-io1-f70.google.com with SMTP id g12-20020a056602248cb029049182acfe4fso6917006ioe.0
        for <xdp-newbies@vger.kernel.org>; Mon, 31 May 2021 22:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HZoCrhifvFqebweO5oM8sTQXrnYAq0UL7ZIrots2vSc=;
        b=Ymkf6KdC+DVSNerUUfmiMDW5evhMCK7IlhmNjHM/rDwJ4S9BkRbspdTAjXIca7DlpD
         5Xu0jtKDUJEahsSeun38JHr5VToFWvyW1Ok1Pgq3aJAme5VfUr+oTxYHf7e5okkmRxf4
         oaxQpapQtDrjbZxK+49AwcGdTYjuuEPvLP/9OmSvE29XmPZuQgBGhU7LX4EQ/zyLRt7+
         obJHvhqNRcQFvmIZXbW9YHTgCkLw21fMnZ7G/e3c3UJOHgWuqGDbbIhYNi+Jm0voX1X1
         c1G7NqXk8ujuTD9R2muKb0Ob1dNDdfdTMY97vtJQMNBOpSAr7jvbKMBtQjrKv9d4QEtO
         A+gw==
X-Gm-Message-State: AOAM531vWKgferMzrj/eTsQ6WgvzeZZDWYRoGQMoz6S5qUuqlw9Li+CY
        v3BicMOU7vwMkMkiCICHgAVk7k/nEmMziFlp2ichFBUXcHFQ
X-Google-Smtp-Source: ABdhPJyDPqVeQwFPYxvwDFNm5lVzsEmrtB9fOyxrUNzo2mPUK0UzLNL7BZ0jpoGpdR7H0zY1Wl5YoHHlpd3CmiPaYpmOLCQaOLqA
MIME-Version: 1.0
X-Received: by 2002:a92:d201:: with SMTP id y1mr19795884ily.103.1622523610124;
 Mon, 31 May 2021 22:00:10 -0700 (PDT)
Date:   Mon, 31 May 2021 22:00:10 -0700
In-Reply-To: <000000000000f32b3c05958ed0eb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006bd5ff05c3ad37da@google.com>
Subject: Re: [syzbot] INFO: task hung in register_netdevice_notifier (2)
From:   syzbot <syzbot+355f8edb2ff45d5f95fa@syzkaller.appspotmail.com>
To:     a@unstable.cc, ast@kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
        bpf@vger.kernel.org, brouer@redhat.com, daniel@iogearbox.net,
        davem@davemloft.net, hawk@kernel.org, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com, kafai@fb.com, kuba@kernel.org,
        linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
        mareklindner@neomailbox.ch, mkl@pengutronix.de,
        netdev@vger.kernel.org, socketcan@hartkopp.net,
        songliubraving@fb.com, sw@simonwunderlich.de,
        syzkaller-bugs@googlegroups.com, xdp-newbies@vger.kernel.org,
        yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

syzbot has bisected this issue to:

commit 6bf071bf09d4b2ff3ee8783531e2ce814f0870cb
Author: Jesper Dangaard Brouer <brouer@redhat.com>
Date:   Tue Jun 18 13:05:27 2019 +0000

    xdp: page_pool related fix to cpumap

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1397c4a7d00000
start commit:   7ac3a1c1 Merge tag 'mtd/fixes-for-5.13-rc4' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1057c4a7d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1797c4a7d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=266cda122a0b56c
dashboard link: https://syzkaller.appspot.com/bug?extid=355f8edb2ff45d5f95fa
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16cc630fd00000

Reported-by: syzbot+355f8edb2ff45d5f95fa@syzkaller.appspotmail.com
Fixes: 6bf071bf09d4 ("xdp: page_pool related fix to cpumap")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
