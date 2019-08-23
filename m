Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6505D9B1AC
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 16:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732199AbfHWOM5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Aug 2019 10:12:57 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46051 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbfHWOM5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 10:12:57 -0400
Received: by mail-qk1-f195.google.com with SMTP id m2so8254396qki.12
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2019 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x76IZ/YFQIUb+ZvnrH58p2vk++UE+9CSi3/jmLo/Z8I=;
        b=saUAdOShVWyU1SnW+8nbin7qZ8tS/K6H2Vr4bopYkDhmSxmYkDdkyG1kWmS/4q8lA4
         RNJ3Dzf17rISdKJK7YXDyJ3c49fw5Ser5Uyu8WcUtMSo9tC3ahfH3+6jDx66n6I2monG
         4np0m0OP2Py5ViL/IMnfuNLZEmK0H1zl4wTVpZdOyBnJ09Teajk1SsiTlwZCEx65Rvcb
         lcwQwyha5HyPh4WtJVKt3rLy8Yf8FH+5hnICtHnB8Z7oxI4KssgldLSNG8WyY/72Oc1x
         cgu6RldHUSM/s1zZiJ++uXEmMB76nbKs2Rb7eqSXMbwI1dC7kmzXS+A0KgDz+6CIuZp4
         5Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x76IZ/YFQIUb+ZvnrH58p2vk++UE+9CSi3/jmLo/Z8I=;
        b=Rj+Sp6uDtZ4jfZBKx/kxDK2wGWbJfqvpik2o76TPoRCk37eYMP40bvRvS3uJTM5lrQ
         FtRtB8JcvOmZRo62d6vc+vMNiKVSsYp+PFqOoZyVuSF/Hva/2HDMCYrF3MwLWG9NSAE4
         Tl2SN1vE2B96kA+hHVwWXP8pV3L7Z3I34hltHZDhbl6ciMx54b89Gc8H8LLMiKgFkROB
         IxiIa+NJ6RqnEWLWFLlvilnvTR+yF1LqhCCEoUIu0AbHGuhB8YzvzEYf5qldx3NwDXjI
         Bvs4X2BOzXQQAjelub5SyjeIx8TbnXP+HrHMSeVESTu2XJiPgEGQMB4rLtxAaDLgRNND
         dFrg==
X-Gm-Message-State: APjAAAVd/zXyzTN+ax7eKn9p2+gDhR809WZOpEelk18axk75OFCqWW3c
        f+DiBB3rq90jGTEwW9zNAMl+yAtr/ZbfZ/gY3P4=
X-Google-Smtp-Source: APXvYqyKo4iDi3WpTv5syNspsYNuuF4GZdZOdndwFBXLW1SSseOAMRBEoRzb/cRAXMElI7BDCLi2GIaGeXYHYoCpitU=
X-Received: by 2002:a05:620a:7c8:: with SMTP id 8mr4014918qkb.424.1566569576013;
 Fri, 23 Aug 2019 07:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <CAG0p+L=6YzUkvDzHt8bfpk0u++bBYc7Nur_vZkZMK=ct8pKEHw@mail.gmail.com>
In-Reply-To: <CAG0p+L=6YzUkvDzHt8bfpk0u++bBYc7Nur_vZkZMK=ct8pKEHw@mail.gmail.com>
From:   Marek Zavodsky <marek.zavodsky@gmail.com>
Date:   Fri, 23 Aug 2019 16:12:44 +0200
Message-ID: <CAG0p+LnDgN55TMF7rQ8fz_v_XL7Epxrv_gFsb0+9oNaMWLOYLg@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>,
        William Tu <u9012063@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Guys,

Thanks four your insight.

@William, I'll definitely take a look at
https://github.com/openvswitch/ovs/blob/05629ed271a67c737227a92f35bcff19964=
8d604/lib/netdev-afxdp.c

I'll give a try to latest implementation using libbpf.
Shared umem is not preferred case, but it was only option where I was
able to go past one successful bind so far.

@VPP vs DPDK
I do not knw details of original project, but there were multiple
layest of VPP running on single node and the performance wasn't as
expected. Therefore we are exploring XDP as lightweigt alternative.

marek

Regards,
marek

On Fri, Aug 23, 2019 at 2:23 PM Marek Zavodsky <marek.zavodsky@gmail.com> w=
rote:
>
> Hi Jesper,
>
> Thanks for your reply.
> I apologize, I'm new to kernel dev, so I may be missing some background.
>
> Let's bring some more light into this. We are using kernel 5.0.0 and
> used samples/bpf/xdpsock as start point.
> I checked master, and example evolved (e.g. by adding cleanup
> mechanisms), but in terms what I need of it, it looks equal (and even
> more complicated, because now XDP attaching to interface is
> interleaved with XSK allocation).
> I built latest kernel, but it refused to boot, so I haven't had chance
> yet to tray the latest.
>
> I took the _user part and split it into two:
> "loader" -  Executed once to setup environment and once to cleanup,
> loads _kern.o, attaches it to interface and pin maps under
> /sys/fs/bpf.
> and
> "worker" - Executed as many as required. Every instance loads maps
> from /sys/fs/bpf, create one AF_XDP sock, update xsks record and start
> listen/process packets from AF_XDP (in test scenario we are using
> l2fwd because of write-back). I had to add missing cleanups there(
> close(fd), munmap()). This should be vpp in final solution.
> So far so good.
> I'm unable to start more than one worker due to previously mentioned
> error. First instance works properly, every other fails on bind
> (lineno may not match due to local changes):
> xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struct
> sockaddr *)&sxdp, sizeof(sxdp)) =3D=3D 0: errno: 16/"Device or resource
> busy"
>
> I modified it to allocate multiple sockets within one process, and I
> was successful with shared umem:
> num_socks =3D 0;
> xsks[num_socks++] =3D xsk_configure(NULL);
> for (; num_socks < opt_alloc; num_socks++)
>         xsks[num_socks] =3D xsk_configure(xsks[0]->umem);
>
>
> but got same behavior (first ok, second failed on bind) when tried non-sh=
ared:
> num_socks =3D 0;
> for (; num_socks < opt_alloc; num_socks++)
>       xsks[num_socks] =3D xsk_configure(NULL);
>
>
>
> And the TX processing... as a workaround we moved VLAN pop/push to
> "worker" and XDP does only xsk-map redirects based on vlan-id, but it
> violates the purpose. It there any estimate when we could expect
> something on XDP TX front?
>
> I guess changing opt_ifindex to xsk->fd in
> bpf_set_link_xdp_fd(opt_ifindex, prog_fd, opt_xdp_flags); won't help,
> as they are 2 different things, right? :)
>
> One side question. I noticed that bpf_trace_printk creates sparse
> entries in /sys/kernel/debug/tracing/trace.
> When I run sample of 100 packets I may get 0 to many entries there.
> It's a bit annoying to run "load test" just to verify I hit the
> correct code path. Is it doing sampling? Can I tweak it somehow?
> Any trick how to use tail -f on /sys/kernel/debug/tracing/trace?
>
> Thanks,
> marek
>
>
> On Fri, Aug 23, 2019 at 12:43 PM Jesper Dangaard Brouer
> <brouer@redhat.com> wrote:
> >
> >
> > Bringing these questions to the xdp-newbies list, where they belong.
> > Answers inlined below.
> >
> > On Tue, 20 Aug 2019 21:17:57 +0200 J=C3=BAlius Milan <Julius.Milan@pant=
heon.tech>
> > >
> > > I am writing AF_XDP driver for FDio VPP. I have 2 questions.
> > >
> >
> > That sounds excellent.  I was hoping someone would do this for FDio VPP=
.
> > Do notice that DPDK now also got AF_XDP support.  IHMO it makes a lot
> > of sense to implement AF_XDP for FDio, and avoid the DPDK dependency.
> > (AFAIK FDio already got other back-ends than DPDK).
> >
> >
> > > 1 - I created a simple driver according to sample in kernel. I load m=
y XDP
> > > program and pin the maps.
> > >
> > >   Then in user application I create a socket, mmap the memory and
> > > push it to xskmap in program. All fine yet.
> > >
> > >   Then I start another instance of user application and do the
> > > same, create socket, mmap the memory and trying to
> > >
> > >   push it somewhere else into the map. But I got  errno: 16
> > > "Device or resource busy" when trying to bind.
> > >
> > >   I guess the memory can=E2=80=99t be mmaped 2 times, but should be
> > > shared, is that correct?
> >
> > I'm cc'ing the AF_XDP experts, as I'm not sure myself.  I mostly deal
> > with the in-kernel XDP path.  (AF_XDP is essentially kernel bypass :-O)
> >
> >
> > >   If so, I am wondering how to solve this nicely.
> > >
> > >   Can I store the value of first socket (that created the mmaped
> > > memory) in some special map in my XDP program to avoid complicated
> > > inter-process communication?
> > >
> > >   And what happens if this first socket is closed while any other
> > > sockets are still alive (using its shared mmaped memory)?
> > >
> > >   What would you recommend? Maybe you have some sample.
> >
> > We just added a sample (by Eelco Cc'ed) into XDP-tutorial:
> >  https://github.com/xdp-project/xdp-tutorial/tree/master/advanced03-AF_=
XDP
> >
> > At-least read the README.org file... to get over the common gotchas.
> >
> > AFAIK the sample doesn't cover your use-case.  I guess, we/someone
> > should extend the sample, to illustrate how how multiple interfaces can
> > share the same UMEM.
> >
> > The official documentation is:
> >  https://www.kernel.org/doc/html/latest/networking/af_xdp.html
> >
> >
> > >   Can I do also atomic operations? (I want it just for such rare
> > > cases as initialization of next socket, to check if there already is
> > > one, that mmaped the memory)
> > >
> > >
> > >
> > > 2 =E2=80=93 We want to do also some decap/encap on XDP layer, before
> > > redirecting it to the socket.
> > >
> >
> > Decap on XDP layer is an excellent use-case, that demonstrate
> > cooperation between XDP and AF_XDP kernel-bypass facility.
> >
> >
> > >   On RX way it is easy, I do what I want and redirect it to the
> > > socket, but can I achieve the same also on TX?
> > >
> >
> > (Yes, RX case is easy)
> >
> > We don't have an XDP TX hook yet... but so many people have requested
> > this, that we should add this.
> >
> > >   Can I catch the packet while TX in XDP and do something with it
> > > (encapsulate it) before sending it out?
> >
> > Usually, we recommend people use the TC egress BPF hook to do the encap
> > in TX.  For the AF_XDP use-case, the TC hook isn't there... so that is
> > not an option.  Again an argument for an XDP-TX hook.  You, could
> > of-cause add the encap header in your AF_XDP userspace program, but I
> > do understand it would make architectural sense that in-kernel XDP
> > would act as a decap/encap layer.
> >
> >
> > >   If so what about performance?
> > >
> >
> > For AF_XDP RX-side is really really fast, even in copy-mode.
> >
> > For AF_XDP TX-side in copy-mode, it is rather slow, as it allocates
> > SKBs etc.  We could optimize this further but we have not.  When
> > enabling AF_XDP zero-copy mode, the TX-side is also super fast.
> >
> > Another hint, for AF_XDP TX-side, remember to "produce" several packets
> > before doing the sendmsg system call.  Thus, effectively doing bulking
> > on the TX-ring.
> >
> >
> > >
> > > By the way, great job with XDP ;)
> >
> > Thanks!
> >
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Principal Kernel Engineer at Red Hat
> >   LinkedIn: http://www.linkedin.com/in/brouer
