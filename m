Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E124C1C65A5
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 May 2020 03:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbgEFBqN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 5 May 2020 21:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728069AbgEFBqM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 5 May 2020 21:46:12 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D9CC061A0F
        for <xdp-newbies@vger.kernel.org>; Tue,  5 May 2020 18:46:12 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h26so50420lfg.6
        for <xdp-newbies@vger.kernel.org>; Tue, 05 May 2020 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMQ9I9Pv6Tb/2GEWOxAbP1UEdUWDPrlGBVxaTUDY2eU=;
        b=dcQ72KSQ6TYb9rRPMA1KIjd6X/LmiqlTyRn/+gJcYGk/PxTcfTJ4ZjlhPxuEAHlCiC
         uzSrUvbLHd8B3/O2upJMINE3/27B4FvuGm5Dx0IGi7ZJm+AxbYY/IoiyLE2iPMr6D/mR
         wIKCajOl+MI+pyjGHwW2wRVpWI78saHSat9YfAcKXawqYSrqw85/TomXhmK2lWsdKldM
         EqnMjt7NkmSIZ0UaeazPqWQUl/C4E1QO6N2aPe494XEGx4kxDxGMlut21JEEefjF+N53
         f8h8agMGDwpMG28q/jFZsamV+0dpm/CuWp5KGQ8OK6jzpNnzQ/mMZaVQPHzMPe5fKQwK
         DIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMQ9I9Pv6Tb/2GEWOxAbP1UEdUWDPrlGBVxaTUDY2eU=;
        b=NXY6FuLW/rCMjzDVKV3K8gDNQIWqzb3l/n0+uHo0F9LCNRCu3IgtSSBKU5735duJVr
         EKPTtS1RF4BGrpsxVtJwLDyKWaFds8/Wl7OLmd+3hj5gwSWBcIEKsKTYdAsTfZwK2V9M
         sCyr5htvNIecF7jmW1W3D7suheEXjxXcHr54dtXBqOg8HQj7DyHD0Zv8WdGx1QoE7eEv
         ng+GpRPJp1t0eJTs/gN+SFNP2w/soW+c5aDb9fPRVLVoLRvuingYyhUB+3DWUy5X8nyd
         qn3nPcpZ88FEKmm2WL+4zzaI/zy1udQMjsopxW8xt9dEHHFDFfnVHY0EVt58v+TbbjrO
         ET7w==
X-Gm-Message-State: AGi0PubW6wYuKWUivuIFWfz4bfxCqKtAslLQMER94n4oyPGNK3i78ezf
        ClmwbQwkwAVl0o8xayAU0yPFb4zI2iI0rok4H4s=
X-Google-Smtp-Source: APiQypLwDdP/e+qOopR6Fhx6SwqPzq/SdtMMQZt+KOYZc6Gh3tbQ+WUwIAfYYxNsAN7VWWqiyaZFYK0wqAc+652JJeQ=
X-Received: by 2002:a05:6512:304e:: with SMTP id b14mr3311570lfb.119.1588729570455;
 Tue, 05 May 2020 18:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <666CF27B-18B4-420B-A0FC-29947DB1682D@redhat.com>
In-Reply-To: <666CF27B-18B4-420B-A0FC-29947DB1682D@redhat.com>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Tue, 5 May 2020 18:45:59 -0700
Message-ID: <CAADnVQJGdEJaW6oQbFOQYJWJxhjY-P=jawYYedb_qDN4zZufQg@mail.gmail.com>
Subject: Re: fentry/fexit trace to BPF_PROG_TYPE_EXT BPF program not working
To:     Eelco Chaudron <echaudro@redhat.com>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Apr 29, 2020 at 4:51 AM Eelco Chaudron <echaudro@redhat.com> wrote:
>
> Hi Alexie at al.
>
> I was trying to attach a fentry/fexit trace to BPF_PROG_TYPE_EXT BPF
> program but I'm getting a verifier error, and not sure why. Is this
> supported?

The intent was to make it possible.
The verifier comment says:
                        /* Cannot fentry/fexit another fentry/fexit program.
                         * Cannot attach program extension to another extension.
                         * It's ok to attach fentry/fexit to extension program.
                         */

> This is the error:
>
> libbpf: -- BEGIN DUMP LOG ---
> libbpf:
> arg#0 type is not a struct
> Unrecognized arg#0 type PTR

looks like verifier got confused here.
It should have detected correct btf_id from freplace prog.
not sure what's going on.

> ; int BPF_PROG(trace_on_entry, struct xdp_md *xdp)
> 0: (79) r1 = *(u64 *)(r1 +0)
> invalid bpf_context access off=0 size=8
> processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0
> peak_states 0 mark_read 0
> libbpf: -- END LOG --
>
> This is the actual fentry code using the BPF_PROG macro from
> tools/lib/bpf/bpf_tracing.h:
>
> SEC("fentry/func")
> int BPF_PROG(trace_on_entry, struct xdp_md *xdp)
> {
>      trace_to_perf_buffer(xdp, false, 0);
>      return 0;
> }
>
> And some more details from bpftool on the program I try to attach to:
>
> # bpftool prog show id 165
> 165: ext  name xdp_test_I  tag b5a46c6e9935298c  gpl
>      loaded_at 2020-04-28T13:41:00+0000  uid 0
>      xlated 136B  jited 108B  memlock 4096B
>      btf_id 432
>
> # bpftool prog dump xlated id 165
> int xdp_test_I(struct xdp_md * ctx):
> ; int xdp_test_I(struct xdp_md *ctx)
>     0: (b7) r2 = 10
> ; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
>     1: (6b) *(u16 *)(r10 -8) = r2
>     2: (18) r2 = 0x752520676f727020
>     4: (7b) *(u64 *)(r10 -16) = r2
>     5: (18) r2 = 0x3a5d315b53534150
>     7: (7b) *(u64 *)(r10 -24) = r2
>     8: (79) r3 = *(u64 *)(r1 +40)
>     9: (79) r3 = *(u64 *)(r3 +0)
>    10: (61) r3 = *(u32 *)(r3 +256)
>    11: (bf) r1 = r10
> ;
>    12: (07) r1 += -24
> ; bpf_debug("PASS[1]: prog %u\n", ctx->ingress_ifindex);
>    13: (b7) r2 = 18
>    14: (85) call bpf_trace_printk#-54752
> ; return XDP_PASS;
>    15: (b7) r0 = 2
>    16: (95) exit
>
> Thanks in advance...
>
> //Eelco
>
