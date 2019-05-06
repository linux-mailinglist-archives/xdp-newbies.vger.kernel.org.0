Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD15155E0
	for <lists+xdp-newbies@lfdr.de>; Tue,  7 May 2019 00:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEFWBJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 May 2019 18:01:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50523 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEFWBJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 May 2019 18:01:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id p21so17666336wmc.0
        for <xdp-newbies@vger.kernel.org>; Mon, 06 May 2019 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=S4Twu03W52bharsa28deUvAOBFbVqsnVCRBal8T2tGY=;
        b=oQfAPhS9wEp2Hx/ijqq21cAV95YxIUG1647G9PtYOSSleuxp5mZrScRa0zZvp5VU5a
         MKpOxUKUJ7zc0ntu3c3cyDm+S2AyISixmVGEwzG8+712WgunfQdFhpi+PrGqToLcXv9M
         GEx2/yukVtl9b3MFysNmAE062B+zlYL3tnRlYu60m76PPeVPmnvBxvYGPqOEOcVKldQD
         O6c/oR9fPpE35S2TTRjoS87gDt1zR04cFNPUwmbnsY7WSNlD+V2B5Ui9PoXDS8mRqM/z
         w5GQuIEiH4OXDjZEq/qdJL6Qiqm/6SyMIUeVrXMglBGS+NSd7sChSMvfyS3tV9q0st7z
         exUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=S4Twu03W52bharsa28deUvAOBFbVqsnVCRBal8T2tGY=;
        b=kGz/0sxvIMaFEOZltiZbkzZrhas2D0ItzA8+I4a+FDLLfpU9m/hYcT2eVT5j8kXZQm
         fCTJ1VqVbY/71op5GkafgFc2QT/lgUm662qBa1PNmM2sJJZRvZg0ybuUqMyGtw4CuPm9
         QcMDB7ylc2usOjCSprlxLy87QwD1fRMPovvyQ12Ktpo+10SQ1Mu5ybmdoV8J3cRK6Gy8
         GgKk8T/MZhHo4KwGAz9V0H2AgXMsDskczsXel3nX8oAN7Z7dYNuUov8sFS2oIS/grBhC
         s+1f3CsvCNI1bD6bn82Gt29TZoI/tZy2fl2L4m/S7oWoPkzDQ7irUVwwWTEoVqCt2hfM
         d6sA==
X-Gm-Message-State: APjAAAWqv5Ssa3OP7k88BrCx9IwZnIZW/Vel6W0WZemH0aM0n1bCA7fK
        W06Rv4JCvhKs/pnzruU9tD6fSg==
X-Google-Smtp-Source: APXvYqy5MXXJj5NCf5sMcy/cSoD/6qHnzdqSqPsgxOtiPAMAiNdH/g9i6I8ljAUKBnOc3rJYLLw3uw==
X-Received: by 2002:a1c:9ad8:: with SMTP id c207mr18282602wme.109.1557180066808;
        Mon, 06 May 2019 15:01:06 -0700 (PDT)
Received: from LAPTOP-V3S7NLPL (cpc1-cmbg19-2-0-cust104.5-4.cable.virginm.net. [82.27.180.105])
        by smtp.gmail.com with ESMTPSA id r2sm27752186wrr.65.2019.05.06.15.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 15:01:05 -0700 (PDT)
References: <673b885183fb64f1cbb3ed2387524077@natalenko.name>
User-agent: mu4e 0.9.18; emacs 25.2.2
From:   Jiong Wang <jiong.wang@netronome.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     Jakub Kicinski <jakub.kicinski@netronome.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        oss-drivers@netronome.com, linux-kernel@vger.kernel.org,
        xdp-newbies@vger.kernel.org, valdis@vt.edu
Subject: Re: [oss-drivers] netronome/nfp/bpf/jit.c cannot be build with -O3
In-reply-to: <673b885183fb64f1cbb3ed2387524077@natalenko.name>
Date:   Mon, 06 May 2019 23:01:03 +0100
Message-ID: <87mujzutsw.fsf@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


'Oleksandr Natalenko' via OSS Drivers writes:

> Hi.
>
> Obligatory disclaimer: building the kernel with -O3 is a non-standard 
> thing done via this patch [1], but I've asked people in #kernelnewbies, 
> and it was suggested that the issue should be still investigated.
>
> So, with v5.1 kernel release I cannot build the kernel with -O3 anymore. 
> It fails as shown below:

I guess it's because constant prop. Could you try the following change to
__emit_shift?

drivers/net/ethernet/netronome/nfp/bpf/jit.c
__emit_shift:331
-       if (sc == SHF_SC_L_SHF)
+       if (sc == SHF_SC_L_SHF && shift)
                shift = 32 - shift;

emit_shf_indir is passing "0" as shift to __emit_shift which will
eventually be turned into 32 and it was OK because we truncate to 5-bit,
but before truncation, it will overflow the shift mask.

Regards,
Jiong

>
> ===
>    CC      drivers/net/ethernet/netronome/nfp/bpf/jit.o
> In file included from ./include/asm-generic/bug.h:5,
>                   from ./arch/x86/include/asm/bug.h:83,
>                   from ./include/linux/bug.h:5,
>                   from drivers/net/ethernet/netronome/nfp/bpf/jit.c:6:
> In function ‘__emit_shf’,
>      inlined from ‘emit_shf.constprop’ at 
> drivers/net/ethernet/netronome/nfp/bpf/jit.c:364:2,
>      inlined from ‘shl_reg64_lt32_low’ at 
> drivers/net/ethernet/netronome/nfp/bpf/jit.c:379:2,
>      inlined from ‘shl_reg’ at 
> drivers/net/ethernet/netronome/nfp/bpf/jit.c:2506:2:
> ./include/linux/compiler.h:344:38: error: call to 
> ‘__compiletime_assert_341’ declared with attribute error: BUILD_BUG_ON 
> failed: (((0x001f0000000ULL) + (1ULL << 
> (__builtin_ffsll(0x001f0000000ULL) - 1))) & (((0x001f0000000ULL) + (1ULL 
> << (__builtin_ffsll(0x001f0000000ULL) - 1))) - 1)) != 0
>    _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                        ^
> ./include/linux/compiler.h:325:4: note: in definition of macro 
> ‘__compiletime_assert’
>      prefix ## suffix();    \
>      ^~~~~~
> ./include/linux/compiler.h:344:2: note: in expansion of macro 
> ‘_compiletime_assert’
>    _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>    ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro 
> ‘compiletime_assert’
>   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                       ^~~~~~~~~~~~~~~~~~
> ./include/linux/bitfield.h:57:3: note: in expansion of macro 
> ‘BUILD_BUG_ON_MSG’
>     BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>     ^~~~~~~~~~~~~~~~
> ./include/linux/bitfield.h:89:3: note: in expansion of macro 
> ‘__BF_FIELD_CHECK’
>     __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>     ^~~~~~~~~~~~~~~~
> drivers/net/ethernet/netronome/nfp/bpf/jit.c:341:3: note: in expansion 
> of macro ‘FIELD_PREP’
>     FIELD_PREP(OP_SHF_SHIFT, shift) |
>     ^~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:276: 
> drivers/net/ethernet/netronome/nfp/bpf/jit.o] Error 1
> make: *** [Makefile:1726: drivers/net/ethernet/netronome/nfp/bpf/jit.o] 
> Error 2
> ===
>
> Needless to say, with -O2 this file is built just fine. My compiler is:
>
> ===
> $ gcc --version
> gcc (GCC) 8.3.0
> Copyright (C) 2018 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is 
> NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR 
> PURPOSE.
> ===
>
> I had no issues with -O3 before, so, maybe, this deserves a peek.
>
> I'm open to testing patches and providing more info if needed.
>
> Thanks.
>
> [1] 
> https://gitlab.com/post-factum/pf-kernel/commit/7fef93015ff1776d08119ef3d057a9e9433954a9

