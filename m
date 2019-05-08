Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8EF16F7F
	for <lists+xdp-newbies@lfdr.de>; Wed,  8 May 2019 05:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfEHDgI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 7 May 2019 23:36:08 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:59343 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfEHDgI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 7 May 2019 23:36:08 -0400
Received: by mail-it1-f200.google.com with SMTP id h136so1026935ita.8
        for <xdp-newbies@vger.kernel.org>; Tue, 07 May 2019 20:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=KR7SjWeKIVJSZZfugT4Rrs+wlNSn+k9qrHxo14q1uCU=;
        b=U73WgL01wSilOL4heyluL/5FzdDTI7FwQZQhHwoBtswwrEkpcqxKcF0+7eWQqOphis
         nuL5hUP6PBSgR9ZUDTsSq2Vn2oieN0+hqE/c38yAXGg9c8fJ/wksV1ES7LIm2o+Fg/zU
         0T2lj3ycnyp2WSfDxa+tIynGgsZmNt5Q9MYnfBt//2nKWXeEAN1M06vFlMx0cMpO5s+e
         nqbrhca+44uhrNiv+3Fh9YQVfflBtSm4jIfXcrhjDwDtFC99hnn3Y+Ed7iz5lww19HFh
         8YOzf/rbSDDrp+pIg0z3qsJTnFjDvMChCyn2UsOXeHHnr1Rg4d0rRqO0JQEVznNOgAM1
         oxGg==
X-Gm-Message-State: APjAAAUQ9X92z586KuidjI0rZUJn/ygffGXLZtzASr2Wrhu+/yGV9rex
        C4VPp2QhuGplFpfguwQm/PGIHtwX6XNSqcqMTwN+5cBXDJ1r
X-Google-Smtp-Source: APXvYqz0fzEBcXbXDCY8ir4qdX8oRihjfUlzyeiFA0YPlKTCLDt/j2AGvjwVFFXjpYyWi+TtiVwSZE8itFTggDQNy84vs8HI3E4+
MIME-Version: 1.0
X-Received: by 2002:a02:1384:: with SMTP id 126mr24318806jaz.72.1557286567342;
 Tue, 07 May 2019 20:36:07 -0700 (PDT)
Date:   Tue, 07 May 2019 20:36:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8fa360588580820@google.com>
Subject: WARNING in bpf_prog_kallsyms_find
From:   syzbot <syzbot+89d1ce6e80218a6192d8@syzkaller.appspotmail.com>
To:     ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        davem@davemloft.net, hawk@kernel.org, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com, kafai@fb.com,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        songliubraving@fb.com, syzkaller-bugs@googlegroups.com,
        xdp-newbies@vger.kernel.org, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    8ff468c2 Merge branch 'x86-fpu-for-linus' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e51ef0a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d0ca84763a42813
dashboard link: https://syzkaller.appspot.com/bug?extid=89d1ce6e80218a6192d8
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1723cef0a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+89d1ce6e80218a6192d8@syzkaller.appspotmail.com

WARNING: CPU: 0 PID: 7933 at kernel/bpf/core.c:853 bpf_jit_free+0x157/0x1b0
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 7933 Comm: kworker/0:4 Not tainted 5.1.0+ #2
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events bpf_prog_free_deferred
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  panic+0x2cb/0x65c kernel/panic.c:214
BUG: unable to handle page fault for address: fffffbfff4007000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 21ffee067 P4D 21ffee067 PUD 21ffed067 PMD 95fcc067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 7933 Comm: kworker/0:4 Not tainted 5.1.0+ #2
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events bpf_prog_free_deferred
RIP: 0010:bpf_get_prog_addr_region kernel/bpf/core.c:539 [inline]
RIP: 0010:bpf_tree_comp kernel/bpf/core.c:602 [inline]
RIP: 0010:__lt_find include/linux/rbtree_latch.h:115 [inline]
RIP: 0010:latch_tree_find include/linux/rbtree_latch.h:208 [inline]
RIP: 0010:bpf_prog_kallsyms_find kernel/bpf/core.c:676 [inline]
RIP: 0010:bpf_prog_kallsyms_find+0x1a0/0x2c0 kernel/bpf/core.c:669
Code: 75 07 e8 03 16 f5 ff 0f 0b e8 fc 15 f5 ff 48 89 de 4c 89 f7 e8 11 17  
f5 ff 49 39 de 72 71 e8 e7 15 f5 ff 48 89 d8 48 c1 e8 03 <42> 0f b6 04 28  
84 c0 74 08 3c 03 0f 8e e6 00 00 00 8b 33 4c 89 f7
RSP: 0018:ffff888098ef7850 EFLAGS: 00010806
RAX: 1ffffffff4007000 RBX: ffffffffa0038000 RCX: ffffffff817b5f0f
RDX: 0000000000000000 RSI: ffffffff817b5f19 RDI: 0000000000000006
RBP: ffff888098ef7890 R08: ffff88808fda0040 R09: ffffed1015d06be0
R10: ffffed1015d06bdf R11: ffff8880ae835efb R12: ffff88808f9be878
R13: dffffc0000000000 R14: ffffffffffffffff R15: ffff88808f9be878
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffbfff4007000 CR3: 0000000096d4c000 CR4: 00000000001406f0
Call Trace:
BUG: unable to handle page fault for address: fffffbfff4007000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 21ffee067 P4D 21ffee067 PUD 21ffed067 PMD 95fcc067 PTE 0
Oops: 0000 [#2] PREEMPT SMP KASAN


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
