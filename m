Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB482CA223
	for <lists+xdp-newbies@lfdr.de>; Tue,  1 Dec 2020 13:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbgLAMJ4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 1 Dec 2020 07:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgLAMJz (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 1 Dec 2020 07:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606824508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M96sj/0NEyiliy23g1fJPrhmQr93rY5xBzH1Udcuxd8=;
        b=ejbyVdSJvkIKUSrSnNGJqyuwx7t/snK7I3BagTvXBGrmjCyjFkcq2h32k7ubvMhqs0SagE
        IR9i9IO7YZG69NcjTopECX9yMI9kwgpJ/tVy4STYRwXMwl1G47YHij7YdHTWfFBs+Tsd19
        S3WZ5zMlz/J4fvU/MOfwJx6m+Z8/9o4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-LDj200HAOCGtSNVglHWv4Q-1; Tue, 01 Dec 2020 07:08:27 -0500
X-MC-Unique: LDj200HAOCGtSNVglHWv4Q-1
Received: by mail-ed1-f71.google.com with SMTP id i1so1188759edt.19
        for <xdp-newbies@vger.kernel.org>; Tue, 01 Dec 2020 04:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=M96sj/0NEyiliy23g1fJPrhmQr93rY5xBzH1Udcuxd8=;
        b=JUj+PFpNVFnVHe5aakNeLlac1lSq7UT5op4r87DKtj9o6Wfi9B+7ZkBakFV0eNgTOq
         4ihm2rT1zIfFLBzohTfUP3qC1N5Ap3h9OHKFPIJ4HA/dzWCsVw0SjmRt/ETa1Y1swlLJ
         ZbMuMvHp0NiERL5nwUdKv3GhA6XpdhbvzSzsQxc2AC2zMvPOBOilgmATNUAjlrHJWkS3
         WSVHCk2ofa9fNfjojBcitLvuT6my0dPSvETjmQGDI9cytgAL90w1dxO4EkWJ/WHgYJIX
         F8cyO5G6Xqs+Z0O9YkfQoZO3D0XBGVgGK7oXPQwNuzoKbbIdDMZljNmAwgDzXg1aHPIm
         Xadg==
X-Gm-Message-State: AOAM532ayEzhZt9uCL9Yke3HhkJyvkYicjDyAcoKZlDoeiR7VXBLOAUA
        bW4XvSGG1lcAcQXTwK4NpEwObWcL1vTlVjptOrurrZW/2ZZ/mI4mEA6JGVMQrbNGZDuON8+56v3
        HE5C0wvIGPI8ONagLsWx5kfw=
X-Received: by 2002:a17:906:1758:: with SMTP id d24mr2762949eje.287.1606824505698;
        Tue, 01 Dec 2020 04:08:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAZgmV/fId0/vdhxWwUD1lTcbKwglR/5rK+nzIQqC5cvXu99XUVpFH11RfHiIJQglwooI4Lw==
X-Received: by 2002:a17:906:1758:: with SMTP id d24mr2762916eje.287.1606824505384;
        Tue, 01 Dec 2020 04:08:25 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id mb15sm741958ejb.9.2020.12.01.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 04:08:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 681D6182EF0; Tue,  1 Dec 2020 13:08:24 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>,
        xdp-newbies@vger.kernel.org
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenc?= =?utf-8?Q?zykowski?= 
        <maze@google.com>, Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 01 Dec 2020 13:08:24 +0100
Message-ID: <878sah3f0n.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> Hi all,
>
> tl;dr: What does the future look like for Go programs orchestrating
> multiple, chained eBPF network functions? Is it worth considering doing
> the orchestration from C++ (or Rust) instead of Go? I'm hoping the
> Cilium and/or Katran folks (and any other interested people) can weigh
> in!

Thank you for bringing this up! Adding a few people (and bpf@vger) to Cc
to widen the discussion a bit.

> --
>
> I just joined a team working with the orchestration of multiple XDP (and
> TC) programs. By "orchestration" I mean that various eBPF programs can
> be written by multiple teams for different systems and we have logic to
> decide how to run, update, and chain them together. This seems to be a
> fast-moving topic right now and I'm trying to get my bearings as well as
> prepare for the future. Feel free to just point me to relevant docs or
> code
>
> This is essentially what we do today: We have a top level Golang
> orchestration program that has access to a database that contains all
> the business logic (e.g., variable values for the bpf programs depending
> on datacenter), the latest build of the C BPF userspace, and kernel
> programs. Basically, like this:
>
>                   +--> [userspace prog 1] --> [kern prog 1]
>                   |
> [Go orchestrator] +--> [userspace prog 2] --> [kern prog 2]
>                   |
>                   +--> [userspace prog 3] --> [kern prog 3]
>
> The Go program simply executes (fork+exec) the userspace programs with
> the appropriate command-line arguments for their environment. The
> userspace program loads the kernel programs, which need to do a
> bpf_tail_call to the next program, which is exposed with some bpf map
> mojo[1].
>
> I think it's not too dissimilar from what the Cilium and Katran folks
> have been doing. I think our current approach is actually pretty cool
> considering that the project started a couple of years ago, but I'm
> trying to plot a course for the future.
>
> I have a couple of concerns about the current design:
>
> 1. The kernel programs need to make the bpf_tail_call. I'd prefer our
>    internal teams can write network functions without needing to be
>    aware of other network functions.
> 2. The Go orchestrator simply doing a fork+exec feels naughty. I'm
>    assuming there's potentially important error state information that
>    we might be missing out on by not working with an library API.
>
> Regarding #1, Toke H=C3=83=C6=92=C3=82=C2=B8iland-J=C3=83=C6=92=C3=82=C2=
=B8rgensen was kind enough to point me to his
> recent work for the Linux 5.10 kernel and xdp-loader (backed by xdplib)
> that I think addresses the underlying concern. However, I'm not so sure
> how to handle my concern #2.
>
> I think ideally, our new flow would look something like this:
>
>                                +--> [kern prog 1]
>                                |
> [Go orchestrator] --> [xdplib] +--> [kern prog 2]
>                                |
>                                +--> [kern prog 3]
>
> Assuming that make sense, I have a few questions:
>     * is there any work being done for a Go interface for xdplib?
>     * interface for xdplib? Any ideas on the level of effort to do that?=
=20
>
> Alternatively, we could probably just execute the xdp-loader binary from
> Go, but that that goes back to my concern #2 above.

As I see it there are basically four paths to widen the language support
for libxdp/multiprog:

1. Regular language bindings for the C libxdp. I gather this is somewhat
   cumbersome in Go, though, as evidenced by the existence of a
   native-go BPF library.

2. Reimplement the libxdp functionality in each language. Libxdp really
   implements a "protocol" for how to cooperatively build a multiprog
   dispatcher from component programs, including atomic replace etc.
   This could be re-implemented by other libraries / in other languages
   as well, and if people want to go this route I'm happy to write up a
   formal specification if that's helpful. I'm not aware of any efforts
   in this direction thus far, though.

3. Make xdp-loader explicitly support the fork/exec use case you're
   describing above. Nothing says this has to lose any information
   compared to the library, we just have to design for it (JSON output
   and the ability to pass a BPF object file as an fd on exit would be
   the main things missing here, I think). I certainly wouldn't object
   to including this in xdp-loader.

4. Implement an "xdpd" daemon that exposes an IPC interface (say, a
   socket) and does all the stuff libxdp currently does in application
   context. Each language then just has to talk to the daemon which is
   less complex than the full libxdp re-implementation.


I've been resisting the daemon approach because I don't like introducing
another dependency for running XDP. But my main concern is that we end
up with something that is compatible across environments and
implementations, so applications that use XDP don't have to deal with
multiple incompatible ways of loading their programs.

So any feedback anyone has as to which approach(es) would/would not work
for you would be welcome (speaking to everyone here)!

-Toke

