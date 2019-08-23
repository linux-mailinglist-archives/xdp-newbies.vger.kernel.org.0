Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5B19B05A
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 15:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388895AbfHWNIE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Aug 2019 09:08:04 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36674 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbfHWNIE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 09:08:04 -0400
Received: by mail-qk1-f194.google.com with SMTP id d23so8122963qko.3
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2019 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HoahbqRiRh6VXbrHFhZFE0lQcrZLo/UrwYIOVH7H6IY=;
        b=jgmqis9wv/d26LaJvsFXLQM6h2Aj+tV0OSHUvOFZhqJ5QmLWNYjs44WyUpzTdrP7w5
         bDl1VOUqGrwKLiGLtVAOMAldz9SQ+0R/jUb8W+mAuMZD9JMvH4YOxGEm4+jPpDJ3S00j
         nZnWxw22Z1cvJ4rfkcY/Q10ZzpDwWgZFnFj+D1zjrwxCu9/0VrODqbEYe0COSanDnvGD
         FmUJdBGKr1Yv/o9El/aTmhX90Sxk6d7GbcztxJ6AGyIAxfmN9IjC6CIhwDaV4PEieJ1T
         3qTd2p2LZYche+Pcgy8OWx6v/WOuNtZZGiRXGfQgre9S50kE/I0Q7Xp+x8HuL2+mTBgD
         IxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HoahbqRiRh6VXbrHFhZFE0lQcrZLo/UrwYIOVH7H6IY=;
        b=siekB5Gls/zq/JgJIk/KDyDjW3anaPQUS6wgy12yKQFaPc5IYWLqZi9IWkwNVw0Lsn
         pBncV62f0TX+aJ5nP9e2lf4e0b1EJ0mknIQ8T9Y3nOp+xVfpGVdFlkbuN6IbS94G4UAP
         3HxpnDBmfeKb3wz7AZEaToIEILJwmXSm+dTr6EnZj/A/BM5WpiLm/lSEGbUHBEBPrZOU
         xP9CHt9Mkx1wxpK7xvgX8GI7TTzac3DUFxL+g7EYa01j3ACENlfydhmOzMufebY/+vly
         HnbWylO4jpcS/7gdrJRPRzvuKLddp03PVl41LZQt+DqY4zf5WbLp1Bdt0tQe6AY81KkW
         6WXQ==
X-Gm-Message-State: APjAAAV7GCqjAaWfzh61pTDXrethSAvUT9hPOD7T0c2OUYAhOLL8H+0r
        jSRDg9ltdtLOhdTC0qlLbY0WYY2NmSS/FIPlSk4=
X-Google-Smtp-Source: APXvYqwM8j8NiVzniH6df90HwNO+EJzxi7MuMDWjxR08t1y5a3kFTddqkVVMEODOuhiCijx95aV2G1z0gLUP1DX/ZIE=
X-Received: by 2002:a37:a492:: with SMTP id n140mr3602680qke.137.1566565683011;
 Fri, 23 Aug 2019 06:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
In-Reply-To: <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
From:   William Tu <u9012063@gmail.com>
Date:   Fri, 23 Aug 2019 06:07:25 -0700
Message-ID: <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Marek,

Answer some of your questions below, I leave the rest for others.

On Fri, Aug 23, 2019 at 3:38 AM Marek Z=C3=A1vodsk=C3=BD
<marek.zavodsky@pantheon.tech> wrote:
>
> Hi Jasper,
>
>
> Thanks for your reply.
>
> I apologize, I'm new to kernel dev, so I may be missing some background.
>
>
> Let's bring some more light into this. We are using kernel 5.0.0 and samp=
les/bpf/xdpsock as an example.

Do you want to consider using AF_XDP API from libbpf?

The samples/bpf/xdpsock_user.c in 5.0.0 still not uses libbpf
https://elixir.bootlin.com/linux/v5.0/source/samples/bpf/xdpsock_user.c

kernel 5.1 xdpsock uses libbpf
https://elixir.bootlin.com/linux/v5.1/source/samples/bpf/xdpsock_user.c

>
> I checked master, and example evolved (e.g. by adding cleanup mechanisms)=
, but in terms what I need of it, it looks equal (and even more complicated=
, because now XDP attaching to interface is interleaved with XSK allocation=
).
>
> I built latest kernel, but it refused to boot, so I haven't had chance ye=
t to tray the latest.

Recently there are some fixes, I would suggest using the latest one.

>
>
> I took the _user part and split it into two:
>
> "loader" -  Executed once to setup environment and once to cleanup, loads=
 _kern.o, attaches it to interface and pin maps under /sys/fs/bpf.
>
> and
>
> "worker" - Executed as many as required. Every instance loads maps from /=
sys/fs/bpf, create one AF_XDP sock, update xsks record and start listen/pro=
cess packets from AF_XDP (in test scenario we are using l2fwd because of wr=
ite-back). I had to add missing cleanups there( close(fd), munmap()). This =
should be vpp in final solution.
>
> So far so good.
>
> I'm unable to start more than one worker due to previously mentioned erro=
r. First instance works properly, every other fails on bind (lineno may not=
 match due to local changes):
>
> xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struct soc=
kaddr *)&sxdp, sizeof(sxdp)) =3D=3D 0: errno: 16/"Device or resource busy"
>
>
I don't think you can have multiple threads binding one XSK, see
xsk_bind() in kernel source.
For AF_XDP in OVS, we create multiple XSKs, non-shared umem and each
has its thread.

> I modified it to allocate multiple sockets within one process, and I was =
successful with shared umem:
>
> num_socks =3D 0;
>
> xsks[num_socks++] =3D xsk_configure(NULL);
> for (; num_socks < opt_alloc; num_socks++)
>         xsks[num_socks] =3D xsk_configure(xsks[0]->umem);
>
>
> but got same behavior (first ok, second failed on bind) when tried non-sh=
ared:
>
> num_socks =3D 0;
>
> for (; num_socks < opt_alloc; num_socks++)
>
>       xsks[num_socks] =3D xsk_configure(NULL);
>
I never try shared-umem, I would suggest start with non-shared case.

Regards,
William
>
> And the TX processing... as a workaround we moved VLAN pop/push to "worke=
r" and XDP does only xsk-map redirects based on vlan-id, but it violates th=
e design. It there any estimate when we could expect something on XDP TX fr=
ont? I can try BPF TC TX meantime.
>
>
> I guess changing opt_ifindex to xsk->fd in bpf_set_link_xdp_fd(opt_ifinde=
x, prog_fd, opt_xdp_flags);
>
> won't help :)
>
>
> One side question. I noticed that bpf_trace_printk creates sparse entries=
 in /sys/kernel/debug/tracing/trace.
>
> When I run sample of 100 packets I may get 0 to many entries there. I't a=
 bit annoying to run "load test" just to verify I hit the correct code path=
. Is it doing sampling? Can I tweak it somehow?
>
>
> Thanks,
>
> marek
>
> ________________________________
> From: Jesper Dangaard Brouer <brouer@redhat.com>
> Sent: Friday, August 23, 2019 10:22:24 AM
> To: brouer@redhat.com; J=C3=BAlius Milan; Marek Z=C3=A1vodsk=C3=BD
> Cc: xdp-newbies@vger.kernel.org; Karlsson, Magnus; Bj=C3=B6rn T=C3=B6pel;=
 Eelco Chaudron; Thomas F Herbert; William Tu
> Subject: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
>
>
> Bringing these questions to the xdp-newbies list, where they belong.
> Answers inlined below.
>
> On Tue, 20 Aug 2019 21:17:57 +0200 J=C3=BAlius Milan <Julius.Milan@panthe=
on.tech>
> >
> > I am writing AF_XDP driver for FDio VPP. I have 2 questions.
> >
>
> That sounds excellent.  I was hoping someone would do this for FDio VPP.
> Do notice that DPDK now also got AF_XDP support.  IHMO it makes a lot
> of sense to implement AF_XDP for FDio, and avoid the DPDK dependency.
> (AFAIK FDio already got other back-ends than DPDK).
>
>
> > 1 - I created a simple driver according to sample in kernel. I load my =
XDP
> > program and pin the maps.
> >
> >   Then in user application I create a socket, mmap the memory and
> > push it to xskmap in program. All fine yet.
> >
> >   Then I start another instance of user application and do the
> > same, create socket, mmap the memory and trying to
> >
> >   push it somewhere else into the map. But I got  errno: 16
> > "Device or resource busy" when trying to bind.
> >
> >   I guess the memory can=E2=80=99t be mmaped 2 times, but should be
> > shared, is that correct?
>
> I'm cc'ing the AF_XDP experts, as I'm not sure myself.  I mostly deal
> with the in-kernel XDP path.  (AF_XDP is essentially kernel bypass :-O)
>
>
> >   If so, I am wondering how to solve this nicely.
> >
> >   Can I store the value of first socket (that created the mmaped
> > memory) in some special map in my XDP program to avoid complicated
> > inter-process communication?
> >
> >   And what happens if this first socket is closed while any other
> > sockets are still alive (using its shared mmaped memory)?
> >
> >   What would you recommend? Maybe you have some sample.
>
> We just added a sample (by Eelco Cc'ed) into XDP-tutorial:
>  https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_XD=
P
>
> At-least read the README.org file... to get over the common gotchas.
>
> AFAIK the sample doesn't cover your use-case.  I guess, we/someone
> should extend the sample, to illustrate how how multiple interfaces can
> share the same UMEM.
>
> The official documentation is:
>  https://www.kernel.org/doc/html/latest/networking/af_xdp.html
>
>
> >   Can I do also atomic operations? (I want it just for such rare
> > cases as initialization of next socket, to check if there already is
> > one, that mmaped the memory)
> >
> >
> >
> > 2 =E2=80=93 We want to do also some decap/encap on XDP layer, before
> > redirecting it to the socket.
> >
>
> Decap on XDP layer is an excellent use-case, that demonstrate
> cooperation between XDP and AF_XDP kernel-bypass facility.
>
>
> >   On RX way it is easy, I do what I want and redirect it to the
> > socket, but can I achieve the same also on TX?
> >
>
> (Yes, RX case is easy)
>
> We don't have an XDP TX hook yet... but so many people have requested
> this, that we should add this.
>
> >   Can I catch the packet while TX in XDP and do something with it
> > (encapsulate it) before sending it out?
>
> Usually, we recommend people use the TC egress BPF hook to do the encap
> in TX.  For the AF_XDP use-case, the TC hook isn't there... so that is
> not an option.  Again an argument for an XDP-TX hook.  You, could
> of-cause add the encap header in your AF_XDP userspace program, but I
> do understand it would make architectural sense that in-kernel XDP
> would act as a decap/encap layer.
>
>
> >   If so what about performance?
> >
>
> For AF_XDP RX-side is really really fast, even in copy-mode.
>
> For AF_XDP TX-side in copy-mode, it is rather slow, as it allocates
> SKBs etc.  We could optimize this further but we have not.  When
> enabling AF_XDP zero-copy mode, the TX-side is also super fast.
>
> Another hint, for AF_XDP TX-side, remember to "produce" several packets
> before doing the sendmsg system call.  Thus, effectively doing bulking
> on the TX-ring.
>
>
> >
> > By the way, great job with XDP ;)
>
> Thanks!
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
