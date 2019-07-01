Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702545B67A
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Jul 2019 10:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfGAINH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Jul 2019 04:13:07 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38859 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbfGAINB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 1 Jul 2019 04:13:01 -0400
Received: by mail-io1-f65.google.com with SMTP id j6so26768302ioa.5
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Jul 2019 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qUhbyX1RWTd4BfNEHYNkuKcG+9XJwpPPUwcbHUdRQbQ=;
        b=KwX1NONxfvEPzDdkK5Bzp5BRlXWzo93HEESKS/fCuSwv0Q6FyuhW39XEv6dh/ZEv8f
         eg/nS+03AUFwBQ+AivQgXBuizDrb/aPWvIxH8mMhj218FmFanFkeHTXvghrKyPpHymy/
         JNTE7tHyhseRsaihn0Mlx39rHyiobCzDj0zEIKPsCgIO+531jO1muLekNm4QB76Mbjpp
         NBcVVHJY0ghpKR5VfJaqe5nGeCFLBlK4ZSaGAA0opfna7mORpsYF9DrFIWGbn5qmkzii
         74iofXW8j7JQ4Dy8GTH9UTj/eSIZ58h4bmQJk32vXt5HahVTsJsxFf/c84aZbpju6hUR
         4MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUhbyX1RWTd4BfNEHYNkuKcG+9XJwpPPUwcbHUdRQbQ=;
        b=pTBRsPtVzjGu8ZTQm/EubqbAZBTfF2idHbVHGc6CN4gu4pKPg0OJiGBK/dou6XZD65
         FMMwcsKxvM8bSzqouKHfJmL//mBYY32TTFlzvWC/voFFrkabGouI41iIE2WHCEoCALXn
         Pr+C/V6xcqADRKsKcLtAe5xOztSl/GlJZ/mrKt5dpWy0UBg8nq8nSmtCbE/GOemDaXOh
         zXPWXzmkk8JEgGcQHjk6QFhnpb+CNqiwjsDdYxRRCB/F5ebfrD0Nv6LoKxH1pkzULkVN
         nhyFvTGCo0FqoXEgWGWHg4BNfhRXPTVbVntoRBbVubJWmI5OhF/rxKhHXBpfVFZP9Rab
         SQ8Q==
X-Gm-Message-State: APjAAAXuUiVO8V0i3DbjRhdJkRZusu+M9eCHDFsbVmZEeXe4zuLru+Wk
        +4JzXLoHEBXAnK+WdRwO+yxssFxFFZT0DUiG3ksK4A==
X-Google-Smtp-Source: APXvYqzPzjlcALbL4I70FsM2fBv6D4ctBuoWiE4Qql9ljDR2Q+ye9ZqIJeQeDoFuZM8G9v1SfYOt9IFN+/YYzRu1UQk=
X-Received: by 2002:a6b:b556:: with SMTP id e83mr16045211iof.94.1561968780377;
 Mon, 01 Jul 2019 01:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000104b00058c61eda4@google.com> <c0e440a1-30aa-a636-fe5c-44f71705857b@acm.org>
In-Reply-To: <c0e440a1-30aa-a636-fe5c-44f71705857b@acm.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 1 Jul 2019 10:12:49 +0200
Message-ID: <CACT4Y+Yb0mXOz=szuZ6P8X5bPzkgiDJ7+w0yb8ZG+hyRKSgN0g@mail.gmail.com>
Subject: Re: WARNING in is_bpf_text_address
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     syzbot <syzbot+bd3bba6ff3fcea7a6ec6@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>, hawk@kernel.org,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Fastabend <john.fastabend@gmail.com>,
        Martin KaFai Lau <kafai@fb.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Waiman Long <longman@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Song Liu <songliubraving@fb.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Will Deacon <will.deacon@arm.com>, xdp-newbies@vger.kernel.org,
        Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jun 28, 2019 at 5:17 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 6/28/19 6:05 AM, syzbot wrote:
> > syzbot has bisected this bug to:
> >
> > commit a0b0fd53e1e67639b303b15939b9c653dbe7a8c4
> > Author: Bart Van Assche <bvanassche@acm.org>
> > Date:   Thu Feb 14 23:00:46 2019 +0000
> >
> >      locking/lockdep: Free lock classes that are no longer in use
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152f6a9da00000
> > start commit:   abf02e29 Merge tag 'pm-5.2-rc6' of
> > git://git.kernel.org/pu..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=172f6a9da00000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=132f6a9da00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=28ec3437a5394ee0
> > dashboard link:
> > https://syzkaller.appspot.com/bug?extid=bd3bba6ff3fcea7a6ec6
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ae828aa00000
> >
> > Reported-by: syzbot+bd3bba6ff3fcea7a6ec6@syzkaller.appspotmail.com
> > Fixes: a0b0fd53e1e6 ("locking/lockdep: Free lock classes that are no
> > longer in use")
> >
> > For information about bisection process see:
> > https://goo.gl/tpsmEJ#bisection
>
> Dmitry, this bisection result does not make any sense to me. Can I mark
> this bisection result myself as invalid?

Hi Bart,

syzbot does not use such bit of info for anything at the moment. So
just saying that it is invalid in this thread is enough to "mark it is
invalid" for all practical purposes. Let's consider it marked.
