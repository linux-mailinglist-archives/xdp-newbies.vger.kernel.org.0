Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6C6EA3C0
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Oct 2019 20:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfJ3TEF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Oct 2019 15:04:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33597 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3TEF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Oct 2019 15:04:05 -0400
Received: by mail-pg1-f194.google.com with SMTP id u23so2106610pgo.0
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Oct 2019 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Tizzc17PZN+J9HIf23k/3wOKwsnUQuXF8B8p4UAVj5c=;
        b=BMyc6Tlk0XG8jdxYDvUc9K4Jg8lFlYs79wMbm7NW3k5dF9SOMJQB+SD1DxzqYEXNfw
         JNC3SUZ2+cLA6qOD6jOhGTsDhIT63UL7pjob5QCorHF4KggQBzhXaTqCfGXST3ay9Eg0
         0Gd8OxOTH6R4rRMifD41n17kT7XFUHIA+NTA/ARFHniPXcFdlv1g08WUY4ivF6hopOpD
         vxZ/clb+Yq6DQjfUsWRfMFiMw4x7V76xmNMKtFmkQrBCTH115vxYAtXrQ8JDIGHIiLrR
         kF4ddlTU7hF55M8wvcD4+e3cTO++UTMkm4XO17/ZkwXhp8y72p880CnD8miRyl6jQJLq
         3wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Tizzc17PZN+J9HIf23k/3wOKwsnUQuXF8B8p4UAVj5c=;
        b=NvR3N/zH5sTcO2XFBZ/Mh+FqGP8lUH7AvvTNHtDNBZaAHHN5T+3+uqrVqVvBe814QP
         FnUjAyhJihk5LgzR+xdu3sTBq7H7iBKhSNB1yDr2GnLYccu7tfmMSItQM2SdQ5N2Bwmv
         XoMo7AaFnDzIdgmZbSd1VVzgG2QtNyFnlDXLhy9yLkiQLoNW4S2z91FdY++i8yRKuD/d
         5Eie+3mu71vPD3IGzaUgiNmjqeqqG1uXhlDC3QesnE4b+pNoEN6bh++diTLeGvuv+o9g
         30BSNhmXYXep/T03g9xT0TwAfMk8VRVLy/xcGWivPx3ZQKDh6ol+yyfB86plWSYekMKJ
         Ae1Q==
X-Gm-Message-State: APjAAAUTd5E5n2uth2T7Pu06cISIKWUIIBw7tGVx9hpIMXPbLk9ujyKz
        yEzbMhL6XpVyYP8t1+ED+xvzcv6FtJwhjIud/ZYNww1V
X-Google-Smtp-Source: APXvYqzIa6Mqd1d3WRp/ESuYqEHKLZUPnXxksf6YpxgrnGqcbqDCL24izmK6cCKS2kiltFv/jT5HLWpe+xQx20XgisE=
X-Received: by 2002:a62:83c6:: with SMTP id h189mr901275pfe.213.1572462244383;
 Wed, 30 Oct 2019 12:04:04 -0700 (PDT)
MIME-Version: 1.0
From:   Farid Zakaria <farid.m.zakaria@gmail.com>
Date:   Wed, 30 Oct 2019 12:03:53 -0700
Message-ID: <CACCo2j=TJYZ68ur53vNYxaS2qQgPv6ouij3P=tmrno-SJFTw0Q@mail.gmail.com>
Subject: bpf_helpers and you... some more...
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

This is my attempt of a continuation of David's prior e-mail
https://www.spinics.net/lists/xdp-newbies/msg00179.html

I was curious how ebpf filters are wired and work. The heavy use of C
macros makes the source code difficult for me to comprehend (maybe
there's an online pre-processed version?).
I'm hoping others may find this exploratory-dive insightful (hopefully
it's accurate enough).

Let's write a very trivial ebpf filter (hello_world_kern.c) and have
it print "hello world"

    #include <linux/bpf.h>

    #define __section(NAME) __attribute__((section(NAME), used))

    static char _license[] __section("license") = "GPL";

    /* helper functions called from eBPF programs written in C */
    static int (*bpf_trace_printk)(const char *fmt, int fmt_size,
                                ...) = (void *)BPF_FUNC_trace_printk;

    __section("hello_world") int hello_world_filter(struct __sk_buff *skb) {
        char msg[] = "hello world";
        bpf_debug_printk(msg, sizeof(msg));
        return 0;
    }

If we compile the above using the below we can inspect the LLVM IR.
    clang -c -o hello_world_kern.ll -x c -S -emit-llvm hello_world_kern.c

The few lines that standout are:

    @bpf_trace_printk = internal global i32 (i8*, i32, ...)* inttoptr
(i64 6 to i32 (i8*, i32, ...)*), align 8
    ....
    %6 = load i32 (i8*, i32, ...)*, i32 (i8*, i32, ...)**
@bpf_trace_printk, align 8
    %7 = getelementptr inbounds [13 x i8], [13 x i8]* %3, i32 0, i32 0
    %8 = call i32 (i8*, i32, ...) %6(i8* %7, i32 13)

The above demonstrates that the value of BPF_FUNC_trace_printk is
simply the integer 6 and it is being casted to a function pointer.
Sure enough, we can confirm that `bpf_trace_printk` is the 6th value
in the enumeration of known bpf bpf_helpers.
(https://elixir.bootlin.com/linux/v5.3.7/source/include/uapi/linux/bpf.h#L2724)

We can go even further and take this LLVM IR and generate human
readable eBPF assembly using `llc`

    llc hello_world_kern.ll -march=bpf

Depending on the optimization level of the earlier `clang` call you
may see different results however using `-O3` we can see

    call 6

Great! so we know that the call to `bpf_trace_printk` gets translated
into a call instruction with immediate value of 6.

How does it end up calling code within the kernel though?
Once the Verifier verifies the bytecode it calls `fixup_bpf_calls`
(https://elixir.bootlin.com/linux/v5.3.8/source/kernel/bpf/verifier.c#L8869)
which goes through all the instructions and makes the necessary
adjustment to the immediate value

    fixup_bpf_calls(...) {
        ...
        patch_call_imm:
            fn = env->ops->get_func_proto(insn->imm, env->prog);
            /* all functions that have prototype and verifier allowed
            * programs to call them, must be real in-kernel functions
            */
            if (!fn->func) {
                verbose(env,
                    "kernel subsystem misconfigured func %s#%d\n",
                    func_id_name(insn->imm), insn->imm);
                return -EFAULT;
            }
            insn->imm = fn->func - __bpf_call_base;

N.B. I haven't deciphered how __bpf_call_base is used / works

The `get_func_proto` will return the function prototypes registered by
every subsystem such as in net.
(https://elixir.bootlin.com/linux/v5.3.8/source/net/core/filter.c#L5991)
At this point in the method it's a simple switch statement to get the
matching function prototype given the numeric value.

I'd love to see more on the code path of how the non-JIT vs JIT
instructions get handled.
For the net subsystem, I can see where the ebpf prog is invoked
(https://elixir.bootlin.com/linux/v5.3.8/source/net/core/filter.c#L119),
but it's difficult to work out how the choice of executing the
function directly (in the case of JIT) vs running it through the
interpreter is handled.
