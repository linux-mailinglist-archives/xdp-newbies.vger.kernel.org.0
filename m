Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC17EACEC
	for <lists+xdp-newbies@lfdr.de>; Thu, 31 Oct 2019 10:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfJaJ60 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 31 Oct 2019 05:58:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24862 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726864AbfJaJ60 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 31 Oct 2019 05:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572515904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mTopAne+0NvLsb3TfH45v9xaywGFEyGRcD3n0sY6t00=;
        b=dFvbosH1FZswyXH0RooA/XzMx/gZNoJXVEtG/pne9MIvHMJogdkAiFIPX42LnlvlyueQBh
        6fTcdDOpyyzNWPQBvvORD6uha/ThHJjo62v0K7DjOEGb6J3ss34u4sszIyE+X55i2eowHF
        AEgZz6CFmu1FvhQcBdERGnkTTvag2xg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-m5sVWuqxNPiGBAdQdbNghw-1; Thu, 31 Oct 2019 05:58:22 -0400
Received: by mail-lf1-f71.google.com with SMTP id t27so1191006lfk.21
        for <xdp-newbies@vger.kernel.org>; Thu, 31 Oct 2019 02:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=BuzjRm6zOCYR4nLIQX8SEQLrj2Mjq963TOTKfCJIxFY=;
        b=AQ9ed80hCKVhs0JCBEsXUVlTnmtgfnTg64c0/3B2j6O8C+B+grIAkCNjm3UND/hUI+
         RGf3ahQJd1K/Vam1I7ws5DvuZCySxkpGkmpeSEd/ukKk4rb1VvES1s6gMW6gTU0P5xWF
         pxiLiAX79/xcI0+IVV5qMwDnTtK6bDYDYE+kLArukLWVKHKFmhzk/1SKw0HiCS/EWeI8
         YYZ6Wyr5xTeWrD387Ke4SEGoZ02XBD+EIcr1dft6BKrqLZG1G6BgXSwaaLDoSgxsVS+2
         SAM45FhauZMJWjslc5bhLN3MypEvR/fNbDQz/3cBviFxxN865bcgNrUg7SvKD9opn9RL
         Mrxg==
X-Gm-Message-State: APjAAAU2ixU6v6FbqyJSqJtV/1k9kO3+4iVdhuahKJ+SAm2vEuLurPQb
        P7XGBfPkoLU5awirEt78IRuo/q2tpo+1xKRzSE6wHhTBUpJ1w2HgldXu0TPwn+M2US2nZ4rwZgR
        0Yq6Yk1HRbeeQHwyM+j4E8mA=
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr3532804ljk.103.1572515900872;
        Thu, 31 Oct 2019 02:58:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbY/rFocilhCu8CGUNI2Ik8fwa3SHZdtRS63Jdp7cLk2iE6pA0G0rjOCDOI6LZlL7rODDnvQ==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr3532770ljk.103.1572515900320;
        Thu, 31 Oct 2019 02:58:20 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id t135sm1228816lff.70.2019.10.31.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 02:58:19 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id AAE221818B5; Thu, 31 Oct 2019 10:58:18 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Farid Zakaria <farid.m.zakaria@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Subject: Re: bpf_helpers and you... some more...
In-Reply-To: <CACCo2j=TJYZ68ur53vNYxaS2qQgPv6ouij3P=tmrno-SJFTw0Q@mail.gmail.com>
References: <CACCo2j=TJYZ68ur53vNYxaS2qQgPv6ouij3P=tmrno-SJFTw0Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 31 Oct 2019 10:58:18 +0100
Message-ID: <87bltxp77p.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: m5sVWuqxNPiGBAdQdbNghw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Farid Zakaria <farid.m.zakaria@gmail.com> writes:

> This is my attempt of a continuation of David's prior e-mail
> https://www.spinics.net/lists/xdp-newbies/msg00179.html
>
> I was curious how ebpf filters are wired and work. The heavy use of C
> macros makes the source code difficult for me to comprehend (maybe
> there's an online pre-processed version?).
> I'm hoping others may find this exploratory-dive insightful (hopefully
> it's accurate enough).
>
> Let's write a very trivial ebpf filter (hello_world_kern.c) and have
> it print "hello world"
>
>     #include <linux/bpf.h>
>
>     #define __section(NAME) __attribute__((section(NAME), used))
>
>     static char _license[] __section("license") =3D "GPL";
>
>     /* helper functions called from eBPF programs written in C */
>     static int (*bpf_trace_printk)(const char *fmt, int fmt_size,
>                                 ...) =3D (void *)BPF_FUNC_trace_printk;
>
>     __section("hello_world") int hello_world_filter(struct __sk_buff *skb=
) {
>         char msg[] =3D "hello world";
>         bpf_debug_printk(msg, sizeof(msg));
>         return 0;
>     }
>
> If we compile the above using the below we can inspect the LLVM IR.
>     clang -c -o hello_world_kern.ll -x c -S -emit-llvm hello_world_kern.c
>
> The few lines that standout are:
>
>     @bpf_trace_printk =3D internal global i32 (i8*, i32, ...)* inttoptr
> (i64 6 to i32 (i8*, i32, ...)*), align 8
>     ....
>     %6 =3D load i32 (i8*, i32, ...)*, i32 (i8*, i32, ...)**
> @bpf_trace_printk, align 8
>     %7 =3D getelementptr inbounds [13 x i8], [13 x i8]* %3, i32 0, i32 0
>     %8 =3D call i32 (i8*, i32, ...) %6(i8* %7, i32 13)
>
> The above demonstrates that the value of BPF_FUNC_trace_printk is
> simply the integer 6 and it is being casted to a function pointer.
> Sure enough, we can confirm that `bpf_trace_printk` is the 6th value
> in the enumeration of known bpf bpf_helpers.
> (https://elixir.bootlin.com/linux/v5.3.7/source/include/uapi/linux/bpf.h#=
L2724)
>
> We can go even further and take this LLVM IR and generate human
> readable eBPF assembly using `llc`
>
>     llc hello_world_kern.ll -march=3Dbpf
>
> Depending on the optimization level of the earlier `clang` call you
> may see different results however using `-O3` we can see
>
>     call 6
>
> Great! so we know that the call to `bpf_trace_printk` gets translated
> into a call instruction with immediate value of 6.
>
> How does it end up calling code within the kernel though?
> Once the Verifier verifies the bytecode it calls `fixup_bpf_calls`
> (https://elixir.bootlin.com/linux/v5.3.8/source/kernel/bpf/verifier.c#L88=
69)
> which goes through all the instructions and makes the necessary
> adjustment to the immediate value
>
>     fixup_bpf_calls(...) {
>         ...
>         patch_call_imm:
>             fn =3D env->ops->get_func_proto(insn->imm, env->prog);
>             /* all functions that have prototype and verifier allowed
>             * programs to call them, must be real in-kernel functions
>             */
>             if (!fn->func) {
>                 verbose(env,
>                     "kernel subsystem misconfigured func %s#%d\n",
>                     func_id_name(insn->imm), insn->imm);
>                 return -EFAULT;
>             }
>             insn->imm =3D fn->func - __bpf_call_base;
>
> N.B. I haven't deciphered how __bpf_call_base is used / works
>
> The `get_func_proto` will return the function prototypes registered by
> every subsystem such as in net.
> (https://elixir.bootlin.com/linux/v5.3.8/source/net/core/filter.c#L5991)
> At this point in the method it's a simple switch statement to get the
> matching function prototype given the numeric value.
>
> I'd love to see more on the code path of how the non-JIT vs JIT
> instructions get handled.
> For the net subsystem, I can see where the ebpf prog is invoked
> (https://elixir.bootlin.com/linux/v5.3.8/source/net/core/filter.c#L119),
> but it's difficult to work out how the choice of executing the
> function directly (in the case of JIT) vs running it through the
> interpreter is handled.

When a program is jit'ed, the function pointer in struct
bpf_prog->bpf_func is replaced with a pointer to the machine code
generated by the jit. The jit does this for calls:
https://elixir.bootlin.com/linux/v5.3.8/source/arch/x86/net/bpf_jit_comp.c#=
L828

-Toke

