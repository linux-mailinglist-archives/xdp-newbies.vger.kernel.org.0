Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23382DBBF8
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Dec 2020 08:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgLPHaE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Dec 2020 02:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLPHaD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Dec 2020 02:30:03 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8BDC0613D6;
        Tue, 15 Dec 2020 23:29:23 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id p5so21675969iln.8;
        Tue, 15 Dec 2020 23:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Mf51/0hO3Vc2LKMTU2Ibr25UaXIyUb896HSFIW5Rh1k=;
        b=rRPba7GnS+IsJ7u653aPODP0MpppaPO1DNgW2TTDLsMHh0IVyqavA+Dljqe/WIlHEn
         BdOt+VvLzDbxtbQw5tK9AMo5wh1azehCII/bxXkNtlMAndPnTm3zsPt7S9Nhj2dt3BJQ
         UlbwartfE/urhhx0+RncFuZk8To2YRkdocfN5cZnwwCPXYYWY2VMzaTmRz5TDvlBgEVW
         LgzJKJuZDhWnA+tlwuqQj9GXbH4sXN5C8h9Redv+wq8bgTO1pQ+wuTrb9/RUn0gCyB8S
         YJ0TtUlYnJ+GHWhuCq9jn9bIlNemTHxIxEbGdL4r6ZgCC3JI+stEqWpOZOZjqHn41EX/
         Q3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Mf51/0hO3Vc2LKMTU2Ibr25UaXIyUb896HSFIW5Rh1k=;
        b=CgKp5DeWGQ3+ojhTYCjQUCR5bwPRsOQ8sYL5KuXDlS1qHl/eN633SAWsnTwzkor4+/
         Bvgv7SRDevCmJZyoHno6nYZSxqMLz0rH4JremwviPi853ZGnjwFYaqzj1tz9jMEsXqOt
         heraSUGCBnqFwLvh9FkASmgVBlfDdED5R4xSGa5EohprtH1d8pL4sqR2TOPkGVu4xcAH
         EvHiqQ/aAo7PKpr7Jw/t1tLRuap6LBhj1Fo3fFaNAN/t6Xz6BRvNQAjtKeg5dweH7oP5
         m1kjyfK57Jyu2yF9gCevx1aSIOtv/kT8rIr3r29or0OhhimpSq0zJPQFbpl98l6gbG0O
         G2wg==
X-Gm-Message-State: AOAM531mG1qT9usvhSv+cOQtAEbGOG1tTihykYR10zDAj7j8ahkFdH7E
        ZCwmNHHXRBscSNrjGpH7DAw=
X-Google-Smtp-Source: ABdhPJyV2koamg8M6Hyt3qfdDMsEOXezEB5q6kguGaWnQOOCpjbJ3+xjjfR809M64f332hf+/FEk9A==
X-Received: by 2002:a92:2912:: with SMTP id l18mr33564907ilg.173.1608103762786;
        Tue, 15 Dec 2020 23:29:22 -0800 (PST)
Received: from localhost (c-71-199-46-190.hsd1.ut.comcast.net. [71.199.46.190])
        by smtp.gmail.com with ESMTPSA id h70sm11979449iof.31.2020.12.15.23.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 23:29:21 -0800 (PST)
Date:   Wed, 16 Dec 2020 00:29:20 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20201216072920.hh42kxb5voom4aau@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878sah3f0n.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 20/12/01 01:08PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> > Hi all,
> >
> > tl;dr: What does the future look like for Go programs orchestrating
> > multiple, chained eBPF network functions? Is it worth considering doing
> > the orchestration from C++ (or Rust) instead of Go? I'm hoping the
> > Cilium and/or Katran folks (and any other interested people) can weigh
> > in!
> 
> Thank you for bringing this up! Adding a few people (and bpf@vger) to Cc
> to widen the discussion a bit.
> 

[snip]

> 
> As I see it there are basically four paths to widen the language support
> for libxdp/multiprog:

Thanks for enumerating these paths; I think they are all feasible. It's
just a matter of weighing trade-offs, naturally.

> 
> 1. Regular language bindings for the C libxdp. I gather this is somewhat
>    cumbersome in Go, though, as evidenced by the existence of a
>    native-go BPF library.

"Cumbersome" is a nice, succinct way to put it. While we could hack
something together for POC code (if we get to that point before a better
option is available), I don't think this is the right answer for Go
applications in general (based on personal experience, documented
experiences from other projects, and apparently lack of interest in cgo
from the Go team--anyone curious about details need only search the
web).

> 
> 2. Reimplement the libxdp functionality in each language. Libxdp really
>    implements a "protocol" for how to cooperatively build a multiprog
>    dispatcher from component programs, including atomic replace etc.
>    This could be re-implemented by other libraries / in other languages
>    as well, and if people want to go this route I'm happy to write up a
>    formal specification if that's helpful. I'm not aware of any efforts
>    in this direction thus far, though.

With a small edge over option #4, I think this is the best of the
options. The downside is that it is not part of the xdp project, so the
developers of the Go implementation will obviously be responsible for
all of the initial and continuing overhead of a full reimplementation.
Toke, you probably see that as an upside :). Regardless, I think that
libxdp is not so large to make this overly burdensome.

Could you please write up that format specification and we will start
running with it?

> 
> 3. Make xdp-loader explicitly support the fork/exec use case you're
>    describing above. Nothing says this has to lose any information
>    compared to the library, we just have to design for it (JSON output
>    and the ability to pass a BPF object file as an fd on exit would be
>    the main things missing here, I think). I certainly wouldn't object
>    to including this in xdp-loader.

There is some temptation in asking for this approach because it becomes
part of the xdp project. I just can't help but think it will be a
constant struggle to keep the same level of flexibility and control with
this approach versus access to a full library. I will admit that I am
moderately ignorant about exactly what challenges we might face because
I'm still learning more about bpf, xdp, and libxdp every day; I am
definitely open to being convinced that my concerns are wrong.

> 
> 4. Implement an "xdpd" daemon that exposes an IPC interface (say, a
>    socket) and does all the stuff libxdp currently does in application
>    context. Each language then just has to talk to the daemon which is
>    less complex than the full libxdp re-implementation.

This option very tempting. I understand your hesitancy to add another
dependency for running XDP--if it wasn't for that, I may have pushed
harder for this approach. I do like the idea of the xdpd daemon being
part of the xdp project and providing a language agnostic interface to
the library.

There will still need to be a new Go project written to interface with the
daemon. This seems like quite a bit less work than a reimplementation,
but combined with the downside of adding another dependency, I think we
can pass on this option--unless you really have a change of heart :)

> 
> I've been resisting the daemon approach because I don't like introducing
> another dependency for running XDP. But my main concern is that we end
> up with something that is compatible across environments and
> implementations, so applications that use XDP don't have to deal with
> multiple incompatible ways of loading their programs.
> 
> So any feedback anyone has as to which approach(es) would/would not work
> for you would be welcome (speaking to everyone here)!

Yes, please, if anyone has additional thoughts please weigh in, but I
think my team is ready to commit to option #2.

Any concerns about my assessment and request?

Thanks,
Brian
