Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A0359C81
	for <lists+xdp-newbies@lfdr.de>; Fri, 28 Jun 2019 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfF1NFD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 28 Jun 2019 09:05:03 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:36319 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfF1NFB (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 28 Jun 2019 09:05:01 -0400
Received: by mail-io1-f71.google.com with SMTP id k21so6591233ioj.3
        for <xdp-newbies@vger.kernel.org>; Fri, 28 Jun 2019 06:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=YCxs/qt8Mwv3z7mR64kHU2i7RhK2QfF8Lu/zZDPEtsk=;
        b=dX1lFdF9IBxEWZQO2t8kM6lR0hFc6SSckGMKEHrISBlNcgu3VlMZhyOffu7R/hGLKC
         HlI8a5hT38Q5jrwRE2e5K9FUkX263B6qyvvjD5Oxquy/vp5QghrNwiN9Tk3KhHb6TEqQ
         YEytMlX4sVJAUY4lyuQtVIxBGLKEnKMUlymVyZQ29oruquXvboAXo/L65BJFlA43A6oM
         ItTVfDB5uXf2g41f7xKWWyOieMwRmJq6Iw0mS/kg48dFz8SdGW1ivq0TjHrr9o5zMzXh
         Ch3vGAxsj8p3f7Ru6Dyo6D83Ev8mIFjN8mm6hEgMfoaX7E0AJdfHrJcyYyPgDCcHszBm
         KTUQ==
X-Gm-Message-State: APjAAAXftV8JdFz0/bOJx9d1A2ipP3vOdQtqGIfjYSY7f35c921wYuKe
        dh8vloh4qB8Qjj04cLNkxsrASCINi181HWRIiJ7WO4Fjmb4g
X-Google-Smtp-Source: APXvYqx8GKh0Tz0N6JPHNRL9IOslCQEy3zMhF+Ww6SA10ngn8dacBYWiHU7ErPZ6cdknibLtC5lh5DRaS2I+orgfp5ZsyEQIgEVu
MIME-Version: 1.0
X-Received: by 2002:a6b:8d92:: with SMTP id p140mr10485891iod.144.1561727100535;
 Fri, 28 Jun 2019 06:05:00 -0700 (PDT)
Date:   Fri, 28 Jun 2019 06:05:00 -0700
In-Reply-To: <00000000000000ac4f058bd50039@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000104b00058c61eda4@google.com>
Subject: Re: WARNING in is_bpf_text_address
From:   syzbot <syzbot+bd3bba6ff3fcea7a6ec6@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, ast@kernel.org, bpf@vger.kernel.org,
        bvanassche@acm.org, daniel@iogearbox.net, davem@davemloft.net,
        hawk@kernel.org, jakub.kicinski@netronome.com,
        johannes.berg@intel.com, johannes@sipsolutions.net,
        john.fastabend@gmail.com, kafai@fb.com,
        linux-kernel@vger.kernel.org, longman@redhat.com, mingo@kernel.org,
        netdev@vger.kernel.org, paulmck@linux.vnet.ibm.com,
        peterz@infradead.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tj@kernel.org,
        torvalds@linux-foundation.org, will.deacon@arm.com,
        xdp-newbies@vger.kernel.org, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

syzbot has bisected this bug to:

commit a0b0fd53e1e67639b303b15939b9c653dbe7a8c4
Author: Bart Van Assche <bvanassche@acm.org>
Date:   Thu Feb 14 23:00:46 2019 +0000

     locking/lockdep: Free lock classes that are no longer in use

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152f6a9da00000
start commit:   abf02e29 Merge tag 'pm-5.2-rc6' of git://git.kernel.org/pu..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=172f6a9da00000
console output: https://syzkaller.appspot.com/x/log.txt?x=132f6a9da00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28ec3437a5394ee0
dashboard link: https://syzkaller.appspot.com/bug?extid=bd3bba6ff3fcea7a6ec6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ae828aa00000

Reported-by: syzbot+bd3bba6ff3fcea7a6ec6@syzkaller.appspotmail.com
Fixes: a0b0fd53e1e6 ("locking/lockdep: Free lock classes that are no longer  
in use")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
