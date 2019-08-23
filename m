Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6100A9AF39
	for <lists+xdp-newbies@lfdr.de>; Fri, 23 Aug 2019 14:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732331AbfHWMXp (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 23 Aug 2019 08:23:45 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39659 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731856AbfHWMXo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 23 Aug 2019 08:23:44 -0400
Received: by mail-qt1-f194.google.com with SMTP id l9so10953395qtu.6
        for <xdp-newbies@vger.kernel.org>; Fri, 23 Aug 2019 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NK5lRkMLt5KFl8ShqZ28CUaDllaICERWPRioBt24SVE=;
        b=fv4M4Wl3aq85I+pXyuq0GbLCBWHZUnHhhp7Qz5BqUzgYFa9zxjcgX+vk5radfiXBLQ
         TlphJx/uSvb6GS1lmtCbQ0cwW5oNXenH5Od9LOCUXIJdKbj/EXiNwpzk21FBgNcKGfCU
         Voj9o9J71doYSN0p2wi5YXN2hAobOltsYTmbgxDTBXPpi1hjvl3uLwpTtuxYKLmntfWo
         v47KHVtowd2F4+T1Q+1tBec5XEaYdSruxKr/GIQAZ9six10fWvheluqUoEM8gHBPN+Ez
         LYcIEL2mJ1FhxkcDsrT6uagiFrucKp4+3ckW4Rl1I8LA1Y20Dy3pux/XbEhz9JhBsNd9
         G4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NK5lRkMLt5KFl8ShqZ28CUaDllaICERWPRioBt24SVE=;
        b=gpcxGO5947m9LJCMXwqZ2fiGf1Ub0YFIsaSzhm5MxxtZv2PX+DdlL5bjT7Sl8keuqL
         edN+R8k/z2VI98VvtW+ZovENREzK6oDxmbgUPDBO0+tXx3V0AYHv0c4i4PpYdt4Ja71j
         uZGHgky3Ng0zpM79UMHBOuVx4zmpMXpXh5SHg+9xIShemg0zUDOY7ye2d//LyCTgHncc
         gkOTGe7ttHTTpEJzz5iFkkCjyyiG+0BDlQrplSdmGRPO5vJN/xAbxaIxwa3uqqhciZzS
         notn91DWVD1axDkqqAFYwDmZzbMATZzJ41X/DLe62nxm4HDZmvYhKRv/kIVLp2v+tg5j
         d1lw==
X-Gm-Message-State: APjAAAWOWBRNQhGWE/vi0WhrfoHrORMAwmG9iEM1dey4ydOeAVBZxp7L
        YmY25rlcAWHDVI2/5rtN3bA1KSdSnVUq2zF5DVw=
X-Google-Smtp-Source: APXvYqxftUKGK6XHzgcsb3oVYEbPScPjLC5SspvIJnryGTPZKXJ+/qLoDwXEeIJHSqRSWRPKtYUt3/iM4cSnEzqpeK0=
X-Received: by 2002:ac8:6b8f:: with SMTP id z15mr4524397qts.62.1566563023556;
 Fri, 23 Aug 2019 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com> <20190823102224.16141c87@carbon>
In-Reply-To: <20190823102224.16141c87@carbon>
From:   Marek Zavodsky <marek.zavodsky@gmail.com>
Date:   Fri, 23 Aug 2019 14:23:32 +0200
Message-ID: <CAG0p+L=6YzUkvDzHt8bfpk0u++bBYc7Nur_vZkZMK=ct8pKEHw@mail.gmail.com>
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

Hi Jesper,

Thanks for your reply.
I apologize, I'm new to kernel dev, so I may be missing some background.

Let's bring some more light into this. We are using kernel 5.0.0 and
used samples/bpf/xdpsock as start point.
I checked master, and example evolved (e.g. by adding cleanup
mechanisms), but in terms what I need of it, it looks equal (and even
more complicated, because now XDP attaching to interface is
interleaved with XSK allocation).
I built latest kernel, but it refused to boot, so I haven't had chance
yet to tray the latest.

I took the _user part and split it into two:
"loader" -  Executed once to setup environment and once to cleanup,
loads _kern.o, attaches it to interface and pin maps under
/sys/fs/bpf.
and
"worker" - Executed as many as required. Every instance loads maps
from /sys/fs/bpf, create one AF_XDP sock, update xsks record and start
listen/process packets from AF_XDP (in test scenario we are using
l2fwd because of write-back). I had to add missing cleanups there(
close(fd), munmap()). This should be vpp in final solution.
So far so good.
I'm unable to start more than one worker due to previously mentioned
error. First instance works properly, every other fails on bind
(lineno may not match due to local changes):
xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struct
sockaddr *)&sxdp, sizeof(sxdp)) =3D=3D 0: errno: 16/"Device or resource
busy"

I modified it to allocate multiple sockets within one process, and I
was successful with shared umem:
num_socks =3D 0;
xsks[num_socks++] =3D xsk_configure(NULL);
for (; num_socks < opt_alloc; num_socks++)
        xsks[num_socks] =3D xsk_configure(xsks[0]->umem);


but got same behavior (first ok, second failed on bind) when tried non-shar=
ed:
num_socks =3D 0;
for (; num_socks < opt_alloc; num_socks++)
      xsks[num_socks] =3D xsk_configure(NULL);



And the TX processing... as a workaround we moved VLAN pop/push to
"worker" and XDP does only xsk-map redirects based on vlan-id, but it
violates the purpose. It there any estimate when we could expect
something on XDP TX front?

I guess changing opt_ifindex to xsk->fd in
bpf_set_link_xdp_fd(opt_ifindex, prog_fd, opt_xdp_flags); won't help,
as they are 2 different things, right? :)

One side question. I noticed that bpf_trace_printk creates sparse
entries in /sys/kernel/debug/tracing/trace.
When I run sample of 100 packets I may get 0 to many entries there.
It's a bit annoying to run "load test" just to verify I hit the
correct code path. Is it doing sampling? Can I tweak it somehow?
Any trick how to use tail -f on /sys/kernel/debug/tracing/trace?

Thanks,
marek


On Fri, Aug 23, 2019 at 12:43 PM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
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
