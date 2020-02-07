Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A72155429
	for <lists+xdp-newbies@lfdr.de>; Fri,  7 Feb 2020 10:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgBGJBt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 7 Feb 2020 04:01:49 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46812 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgBGJBt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 7 Feb 2020 04:01:49 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so1447681otb.13
        for <xdp-newbies@vger.kernel.org>; Fri, 07 Feb 2020 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LFJpGnQs9cUKPsbamu4mMQxtMP40xPtskeWTInb3azs=;
        b=cj4CyfZ29P1eVfzW6WH3Hwmz78rTOeTLP0qXUWblq4Hpvhvx2+sEpETkQN4MuOAHW0
         g2zDkP/dSE8hQqZkwkZX0uO7kk3VgG2iCkLHrD0E1dmM1qyAOORdxCvZp0S7tKQNzinT
         w2WOHZKx/UKVGbR6WRbUF27Q8dKtlYrm8CSQ6/pWdduMQFzzkeQQOTelOTu0FUZX+Nj2
         /7LzCsPc0LTI5Hz2Ff4q2cEkhmOO865CYnmvqyV8mMprHZMcH5z/Fa46bHPAGgrLIVhm
         xBSj052wy7AxCPzETUtN2LC1xb30Tj5bnmkmux2QAohvU2vkJR8StDZhQp0UAm+gNhmF
         TMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LFJpGnQs9cUKPsbamu4mMQxtMP40xPtskeWTInb3azs=;
        b=K0tZ2Fqk/vmExg6XoOGDDMOETGin6XzMExQ0rG+wU99yuhm9yQoNc/PsUHz5kri3uA
         kldFiAsGFCOcfc9oYsKzb0omKMUP9ZjIUt1+EL5mZkq+OfIHs5Y2QPPqOEhhygUgGOR6
         KGpt+F2WG62TaTxPmaqoCPrmCPrquK37dYMvtrf7ZNfIw1a57i1+rqcTBG0ux8xUf47/
         arLWcQJN/ScPEapcPhkayq0Ysdr6JjrBqf3Ugv4BVuNuhMHl/kXw4BMZ+Xa3m1801OAc
         Ct90USJ6Y6pTKBtZQNSGMx5yspj15QuYIIBmCGzCPuqfDJ6XcYDhGPchCihbwksJ/BXr
         iYAA==
X-Gm-Message-State: APjAAAXujD3RtuBp9gP962txzNY5YRJs7lQ1s6tg0KxTOybKG5bNMBZ7
        oHQB/X7/Rd9OfvnSGmBzY7Ph05MXjzRvW7+VGBAnMuFK
X-Google-Smtp-Source: APXvYqyX2BGUBNngogrVfFKA4lPJR/wMRXWIO6jsvgxQULiwsonUeHDhXw079h3fkHQj+mjxefHk+HnMPjcJLctSi7Y=
X-Received: by 2002:a9d:5607:: with SMTP id e7mr1989887oti.196.1581066106619;
 Fri, 07 Feb 2020 01:01:46 -0800 (PST)
MIME-Version: 1.0
References: <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
 <20200116020414.GA46831@smtp.ads.isi.edu> <CAJ8uoz0yqYTq+OOK8p0XRcWyMkfnJ1ZT7hUew9w3FuHr=4K-QQ@mail.gmail.com>
 <4c03813d-5edf-7e9e-8905-31902b5acb71@mellanox.com> <20200122214352.GA13201@smtp.ads.isi.edu>
 <b1b9342b-b9e5-f576-c06c-3a43dcf2b189@mellanox.com> <CAJ8uoz1wuCmPehXNX2_OddF2YC=2mNaFZC4f+6j9VkmSTSPaQQ@mail.gmail.com>
 <HE1PR0501MB2570108E0E186FEE0A09D668D1040@HE1PR0501MB2570.eurprd05.prod.outlook.com>
 <CAJ8uoz1kkj8Fb+dg4RFDO+CpXhDs=70fb1DrTubgO+tKg0zTpg@mail.gmail.com>
 <CAJ8uoz2FsPY=Q2ab6wqHhpaaEFmsi3F8gga2OfLUUSQuRZvuHw@mail.gmail.com>
 <CAJ8uoz0Ucw82B1Cq9KCTVu_=O5p6ETxqwL=awmkcG1A=XF=irw@mail.gmail.com>
 <CAJ8uoz2PDcTNghzcWOcst0yDpuOEEW5P21LH1=+wF2xDo7TpWQ@mail.gmail.com> <9600c57c-fe7a-0520-9b67-af521947cc79@mellanox.com>
In-Reply-To: <9600c57c-fe7a-0520-9b67-af521947cc79@mellanox.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 7 Feb 2020 10:01:34 +0100
Message-ID: <CAJ8uoz2yiewJs5NrcDX9io9ccFUtmovfOmAUKb_DCq5=kOzwaw@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Maxim Mikityanskiy <maximmi@mellanox.com>
Cc:     Ryan Goodfellow <rgoodfel@isi.edu>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Tariq Toukan <tariqt@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Moshe Shemesh <moshe@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Feb 6, 2020 at 3:56 PM Maxim Mikityanskiy <maximmi@mellanox.com> wr=
ote:
>
> On 2020-02-05 15:31, Magnus Karlsson wrote:
> > On Tue, Feb 4, 2020 at 5:10 PM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> >>
> >> On Thu, Jan 30, 2020 at 12:40 PM Magnus Karlsson
> >> <magnus.karlsson@gmail.com> wrote:
> >>>
> >>> On Thu, Jan 30, 2020 at 10:59 AM Magnus Karlsson
> >>> <magnus.karlsson@gmail.com> wrote:
> >>>>
> >>>> On Thu, Jan 30, 2020 at 10:37 AM Maxim Mikityanskiy
> >>>> <maximmi@mellanox.com> wrote:
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Magnus Karlsson <magnus.karlsson@gmail.com>
> >>>>>> Sent: 27 January, 2020 17:55
> >>>>>> To: Maxim Mikityanskiy <maximmi@mellanox.com>
> >>>>>> Cc: Ryan Goodfellow <rgoodfel@isi.edu>; xdp-newbies@vger.kernel.or=
g; Tariq
> >>>>>> Toukan <tariqt@mellanox.com>; Saeed Mahameed <saeedm@mellanox.com>=
; Moshe
> >>>>>> Shemesh <moshe@mellanox.com>
> >>>>>> Subject: Re: zero-copy between interfaces
> >>>>>>
> >>>>>> On Mon, Jan 27, 2020 at 3:01 PM Maxim Mikityanskiy <maximmi@mellan=
ox.com>
> >>>>>> wrote:
> >>>>>>>
> >>>>>>> On 2020-01-22 23:43, Ryan Goodfellow wrote:
> >>>>>>>> On Tue, Jan 21, 2020 at 01:40:50PM +0000, Maxim Mikityanskiy wro=
te:
> >>>>>>>>>>> I've posted output from the program in debugging mode here
> >>>>>>>>>>>
> >>>>>>>>>>> - https://gitlab.com/mergetb/tech/network-
> >>>>>> emulation/kernel/snippets/1930375
> >>>>>>>>>>>
> >>>>>>>>>>> Yes, you are correct in that forwarding works for a brief per=
iod and
> >>>>>> then stops.
> >>>>>>>>>>> I've noticed that the number of packets that are forwarded is=
 equal
> >>>>>> to the size
> >>>>>>>>>>> of the producer/consumer descriptor rings. I've posted two pi=
ng
> >>>>>> traces from a
> >>>>>>>>>>> client ping that shows this.
> >>>>>>>>>>>
> >>>>>>>>>>> - https://gitlab.com/mergetb/tech/network-
> >>>>>> emulation/kernel/snippets/1930376
> >>>>>>>>>>> - https://gitlab.com/mergetb/tech/network-
> >>>>>> emulation/kernel/snippets/1930377
> >>>>>>>>>
> >>>>>>>>> These snippets are not available.
> >>>>>>>>
> >>>>>>>> Apologies, I had the wrong permissions set. They should be avail=
able
> >>>>>> now.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> I've also noticed that when the forwarding stops, the CPU usa=
ge for
> >>>>>> the proc
> >>>>>>>>>>> running the program is pegged, which is not the norm for this=
 program
> >>>>>> as it uses
> >>>>>>>>>>> a poll call with a timeout on the xsk fd.
> >>>>>>>>>
> >>>>>>>>> This information led me to a guess what may be happening. On th=
e RX
> >>>>>>>>> side, mlx5e allocates pages in bulks for performance reasons an=
d to
> >>>>>>>>> leverage hardware features targeted to performance. In AF_XDP m=
ode,
> >>>>>>>>> bulking of frames is also used (on x86, the bulk size is 64 wit=
h
> >>>>>>>>> striding RQ enabled, and 8 otherwise, however, it's implementat=
ion
> >>>>>>>>> details that might change later). If you don't put enough frame=
s to XSK
> >>>>>>>>> Fill Ring, the driver will be demanding more frames and return =
from
> >>>>>>>>> poll() immediately. Basically, in the application, you should p=
ut as
> >>>>>>>>> many frames to the Fill Ring as you can. Please check if that c=
ould be
> >>>>>>>>> the root cause of your issue.
> >>>>>>>>
> >>>>>>>> The code in this application makes an effort to relenish the fil=
l ring
> >>>>>> as fast
> >>>>>>>> as possible. The basic loop of the application is to first check=
 if
> >>>>>> there are
> >>>>>>>> any descriptors to be consumed from the completion queue or any
> >>>>>> descriptors that
> >>>>>>>> can be added to the fill queue, and only then to move on to movi=
ng
> >>>>>> packets
> >>>>>>>> through the rx and tx rings.
> >>>>>>>>
> >>>>>>>> https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5=
.5-
> >>>>>> moa/samples/bpf/xdpsock_multidev.c#L452-474
> >>>>>>>
> >>>>>>> I reproduced your issue and did my investigation, and here is wha=
t I
> >>>>>> found:
> >>>>>>>
> >>>>>>> 1. Commit df0ae6f78a45 (that you found during bisect) introduces =
an
> >>>>>>> important behavioral change (which I thought was not that importa=
nt).
> >>>>>>> xskq_nb_avail used to return min(entries, dcnt), but after the ch=
ange it
> >>>>>>> just returns entries, which may be as big as the ring size.
> >>>>>>>
> >>>>>>> 2. xskq_peek_addr updates q->ring->consumer only when q->cons_tai=
l
> >>>>>>> catches up with q->cons_head. So, before that patch and one previ=
ous
> >>>>>>> patch, cons_head - cons_tail was not more than 16, so the consume=
r index
> >>>>>>> was updated periodically. Now consumer is updated only when the w=
hole
> >>>>>>> ring is exhausted.
> >>>>>>>
> >>>>>>> 3. The application can't replenish the fill ring if the consumer =
index
> >>>>>>> doesn't move. As a consequence, refilling the descriptors by the
> >>>>>>> application can't happen in parallel with using them by the drive=
r. It
> >>>>>>> should have some performance penalty and possibly even lead to pa=
cket
> >>>>>>> drops, because the driver uses all the descriptors and only then
> >>>>>>> advances the consumer index, and then it has to wait until the
> >>>>>>> application refills the ring, busy-looping and losing packets.
> >>>>>>
> >>>>>> This will happen if user space always fills up the whole ring, whi=
ch
> >>>>>> might or might not happen all depending on the app.
> >>>>>
> >>>>> Yes, that's right, and as far as I know, it's common to fill as man=
y
> >>>>> frames as the application can (there was no reason to do it other w=
ay
> >>>>> till now).
> >>>>>
> >>>>>> With that said, it
> >>>>>> might provide better performance to update it once in a while. It
> >>>>>> might also be the case that we will get better performance with th=
e
> >>>>>> new scheme if we only fill half the fill ring.
> >>>>>
> >>>>> Yes, it may improve performance. However, I don't think it's correc=
t to
> >>>>> set such a limitation on the app.
> >>>
> >>> Actually, a much worse limitation to put on an application is to say
> >>> that you have to have a certain amount of buffers on some ring for th=
e
> >>> zero-copy feature to work. For example that we need at least 64
> >>> buffers on the fill ring for all the NIC cards to work in zero-copy
> >>> mode. That would be a bad thing to have to put in the documentation.
> >>> An OS is supposed to abstract away HW differences, and with this
> >>> current limitation in your driver, it shines through for sure. What w=
e
> >>> would like to put in the documentation is a statement along the lines
> >>> of: "for best performance, make sure you have plenty of buffers on th=
e
> >>> fill ring so that the NIC can work as efficiently as possible". Not a
> >>> statement that it does not work on Mellanox unless you put enough
> >>> buffers on the fill ring. So my advice (and wish) is that you fix thi=
s
> >>> in your driver. With that said, I will still look into what is the
> >>> best way to get at least the sample to work for you. But there is no
> >>> way to make sure every single app works for you in zero-copy mode,
> >>> unless you support arbitrary amount of buffers on the fill ring. I
> >>> guess that sooner or later, a customer of yours will get into this
> >>> situation one way or the other, so why not fix it now.
>
> Hi Magnus,
>
> We made an internal discussion about batching and AF_XDP in mlx5e.
>
> There are two types of RX queues supported by mlx5e: striding RQ and
> legacy RQ. Which type of RQ is used, depends on the configuration,
> hardware support and defaults for different NICs, but basically in cases
> when striding RQ is enabled by default, it's faster than legacy RQ, and
> this is the case for modern NICs. All RX queues created in the driver
> are of the same type. Striding RQ has a requirement of allocating in
> batches, and the batch size is specified on queue creation, so there is
> no fallback possible for this case. Legacy RQ, on the other hand, does
> not require batching in XDP use cases, but now we do it anyway for
> performance reasons and for code unification with non-XDP queues.

Thanks. I understand why this is a problem now. Let see how we can
work around it in the best way.

> I understand your concern that the current API doesn't provide a
> completely opaque abstraction over the driver. However, we can't just
> throw away an important performance feature (striding RQ) to support
> some exotic case of a fill ring with a single frame only. AF_XDP is a
> framework for high-performance applications, so it's extremely unlikely
> that an AF_XDP application will only need to receive a single packet.
> Such applications just won't need AF_XDP. So, given that the issue can't
> be fixed without disabling striding RQ, and disabling striding RQ will
> just reduce the performance of all real-world applications, we decided
> to keep things as is for now, and if a customer complains about it, we
> will suggest them to disable striding RQ in their configuration, and
> we'll consider an option of disabling batching in legacy RQ for AF_XDP.
>
> BTW, if the current API can't provide a good enough abstraction over
> advanced features of mlx5e, maybe we should extend the API somehow?
> E.g., when need_wakeup for RX goes to "yes", also tell how many frames
> need to be refilled?

Yes, let us set need_wakeup for Rx, unless you are not already doing
that. The Intel drivers do this when there are no entries at all on
the fill ring and none on the HW Rx ring. You can set it when there
are less than 64 on the fill ring (or whatever striding size that you
have) and no entries on the HW Rx ring. But I prefer not to return a
number. Why not just document that if the user gets a need_wakeup on
the fill ring it needs to put entries on the fill ring and wake up the
kernel. We do recommend putting as many entries in the fill ring as
possible since this is good for performance (for all NICs). Putting
too few might trigger another need_wakeup event on NICs that prefer to
work on batches of packets. Or something like that.

> >>> /Magnus
> >>>
> >>>> I will examine what provides the best performance. On one hand it is
> >>>> the number of updates to shared ring state (minimized by current
> >>>> scheme) and the ability for the user app to but buffers on the fill
> >>>> ring. Stating that putting e.g. half the packets on the fill ring
> >>>> provides better performance (for some application) is not a
> >>>> limitation. It is performance tuning advise :-).
> >>
> >> I have now made a set of measurements. First I just made a variation
> >> study using the xdpsock app, varying the amount of packets the kernel
> >> can withdraw from a consumer ring (fill and Tx) before updating global
> >> state. For the 1 core case (app and driver on the same core) the more
> >> frequent you do this update, the better. The reason for this is that
> >> it costs very little to update the state since the application is not
> >> running. And it is beneficial for the app to have a freshly updated
> >> state when it starts to execute as it can operate on more packets. For
> >> the 2 core case (app on one core, driver on another) it is the
> >> complete opposite: the fewer updates to global state, the better. The
> >> reason for this is that it costs a lot to update global state as it
> >> triggers cache coherency actions between the two cores.
> >>
> >> What I did then was to compare the current scheme, update only when
> >> grabbing new packets, to a new scheme were we also update the global
> >> consumer pointer when we are exiting Rx or Tx processing in the NAPI
> >> context. On two cores the current scheme gets 0.5 to 1 Mpps more in
> >> throughput than also updating the pointer at the end of NAPI. But for
> >> 1 core case, the new scheme is the best and generates between 0.2 and
> >> 0.3 Mpps more in throughput than the current one. But all in all, the
> >> current scheme is more beneficial than the proposed one if we say that
> >> both the 1 core and the 2 core case is equally important.
> >>
> >> Something to note is that the xdpsock application only puts batch size
> >> (64) of packets in the fill ring in every iteration, and this might
> >> lead to some good pacing for the current scheme and the 2 core case.
> >> I.e., we do not get into the case of the fill ring only being full or
> >> empty. But I will run this on some real apps to get some more results,
> >> and I know that Bj=C3=B6rn has an optimized xdpsock application that p=
uts
> >> many more packets into the fill queue than 64. This optimization might
> >> actually make the new proposal (also updating at the end of NAPI) be
> >> better and make the current scheme suffer. We will examine this
> >> further and get back.
> >
> > Actually, after some more thought and discussions I think we should
> > optimize for the 1 core case, since that is what gives the whole
> > system the best performance, provided that you can scale your
> > application with instantiation that is. For a 4 core system, 4 x the 1
> > core performance > 2 x 2 core performance by a lot. I think that the 1
> > core case is the one that is going to be used out there. At least that
> > is what I hear and see.
> >
> > So, when the merge window opens I am going to submit a patch that
> > updates the consumer pointer when we exit NAPI too. Will increase the
> > performance of the 1 core case.
>
> That sounds good to me. It doesn't make sense to update it multiple
> times per NAPI (in the single core case the application won't run at
> that time anyway), so once per NAPI is the most frequent, and according
> to your experiments it should be the most efficient. It should make
> mlx5e work again. One concern though: you say you are going to submit it
> to -next, but a kernel with your patches has been released, and it has
> broken AF_XDP support in mlx5e. I can send a small fix to net that will
> revert the behavior back to updating the consumer index once every 16
> frames (so it makes mlx5e work again), and your patch will go on top of
> my bugfix. Does it sound right to you?

How about a patch set of two patches. In the cover letter you explain
the situation. 1: The application might deadlock if the kernel
requires multiple buffers to be put on the fill ring to proceed but
the consumer pointer has not been updated by the kernel so it is not
possible to put them there. 2: When the kernel needs more buffers, the
driver should signal this through the fill ring's need_wakeup flag.
Document this. There are two solutions to this: a) fix the publishing
of the consumer pointer and document that the user application has to
put entries in the fill ring when the need_wakeup flag is set for the
fill ring (and implement this in your driver if you have not already
done so). b) Fix the Mellanox driver so it can work on any amount of
buffers put in the fill ring. We chose a) because it will result in
the most performant system and optimizing for the "few packets in the
fill ring case" is optimizing for something that will rarely happen.

I can send you the first patch. I do not want to reintroduce the batch
size, if I do not have to. As I have said before, there are already
enough tunables in an AF_XDP application. We do not need another one.
My scheme of publishing the consumer pointers at the end of the NAPI
loop seems to work really well and requires no parameters. You can
then add a patch for 2 and a cover letter making our case that we
would like this fixed. I will send you the patch in a separate mail on
this list. What do you think?

Thanks: Magnus

> Thanks for taking time to do the tests!
>
> > /Magnus
> >
> >> /Magnus
> >>
> >>>>>> I will look into this
> >>>>>> and see what I get.
> >>>>>>
> >>>>>>> 4. As mlx5e allocates frames in batches, the consequences are eve=
n more
> >>>>>>> severe: it's a deadlock where the driver waits for the applicatio=
n, and
> >>>>>>> vice versa. The driver never reaches the point where cons_tail ge=
ts
> >>>>>>> equal to cons_head. E.g., if cons_tail + 3 =3D=3D cons_head, and =
the batch
> >>>>>>> size requested by the driver is 8, the driver won't peek anything=
 from
> >>>>>>> the fill ring waiting for difference between cons_tail and cons_h=
ead to
> >>>>>>> increase to be at least 8. On the other hand, the application can=
't put
> >>>>>>> anything to the ring, because it still thinks that the consumer i=
ndex is
> >>>>>>> 0. As cons_tail never reaches cons_head, the consumer index doesn=
't get
> >>>>>>> updated, hence the deadlock.
> >>>>>>
> >>>>>> Good thing that you detected this. Maybe I should get a Mellanox c=
ard
> >>>>>> :-). This is different from how we implemented Intel's drivers tha=
t
> >>>>>> just work on any batch size. If it gets 3 packets back, it will us=
e
> >>>>>> those. How do you deal with the case when the application just put=
s a
> >>>>>> single buffer in the fill ring and wants to receive a single packe=
t?
> >>>>>
> >>>>> mlx5e will wait until the full batch is available. As AF_XDP is int=
ended
> >>>>> for high-performance apps, this scenario is less expected. We prefe=
r to
> >>>>> leverage our performance features.
> >>>>
> >>>> That you cannot support all applications on top of AF_XDP with your
> >>>> zero-copy support seems broken to me. But I give you that you might
> >>>> support all the ones you care about with your current batching
> >>>> support. Like you say, most apps will put plenty of buffers on the
> >>>> fill ring, so this should not be a problem. Can you not implement so=
me
> >>>> slow path for these cases? You must have one for the skb case.
> >>>>
> >>>>>> Why does the Mellanox driver need a specific batch size? This is j=
ust
> >>>>>> for my understanding so we can find a good solution.
> >>>>>
> >>>>> The main reason is our performance feature called striding RQ. Skip=
ping
> >>>>> all irrelevant details, a batch of 64 pages is posted to the NIC wi=
th a
> >>>>> single request, and the NIC fills them progressively. This feature =
is
> >>>>> turned on by default on modern NICs, and it's really good for
> >>>>> performance.
> >>>>>
> >>>>> It might be possible to post a smaller batch though, I'm not sure a=
bout
> >>>>> it, it needs to be checked, but anyway it's not something that we w=
ill
> >>>>> likely do, because it's a complication of the data path, and if we =
know
> >>>>> more frames are coming, it's much better for the performance to wai=
t for
> >>>>> them, rather than to post several incomplete batches.
> >>>>>
> >>>>>>> So, in my vision, the decision to remove RX_BATCH_SIZE and period=
ic
> >>>>>>> updates of the consumer index was wrong. It totally breaks mlx5e,=
 that
> >>>>>>> does batching, and it will affect the performance of any driver, =
because
> >>>>>>> the application can't refill the ring until it gets completely em=
pty and
> >>>>>>> the driver starts waiting for frames. I suggest that periodic upd=
ates of
> >>>>>>> the consumer index should be readded to xskq_cons_peek_addr.
> >>>>>>
> >>>>>> The reason I wanted to remove RX_BATCH_SIZE is that application
> >>>>>> developers complained about it giving rise to counter intuitive
> >>>>>> behavior in user space. I will try to dig out the complaints and t=
he
> >>>>>> explanations Bj=C3=B6rn and I had to send which it seemed that use=
rs really
> >>>>>> should not have to care about. It should just work.
> >>>>>
> >>>>> I think the counter that doesn't update till the very last moment a=
nd
> >>>>> then advances by the ring size will also be something to complain a=
bout
> >>>>> (and I am the first one to complain :D). Such bursts are not good i=
n any
> >>>>> case.
> >>>>
> >>>> Do you have any performance data that shows this scheme is bad for
> >>>> performance? The good thing about this scheme is that global state i=
s
> >>>> updated less frequently. And the bad thing is what you mentioned. Bu=
t
> >>>> which one has the greatest effect, is the question.
> >>>>
> >>>>>> I also do not like
> >>>>>> to have arbitrary constants like this. Why 16?
> >>>>>
> >>>>> I believe any batching mechanism has a constant that look arbitrary=
.
> >>>>> This constant should be the golden mean: if it's too small, there i=
s
> >>>>> little effect from batching; if it's too big, it gets too bursty.
> >>>>>
> >>>>> Basically, after your patch it just changed from 16 to the ring siz=
e.
> >>>>> Maybe we can tie that constant to ring size? Make it ring_size /
> >>>>> another_arbitrary_constant? :)
> >>>>
> >>>> Agreed, I thought about this too. Something tied to ring_size might =
be
> >>>> a good compromise. Will examine this. But I want to base this on
> >>>> performance data not idle speculation, so need to run some experimen=
ts
> >>>> first.
> >>>>
> >>>> /Magnus
> >>>>
> >>>>>> Would much prefer not
> >>>>>> having to deal with this, unless of course it horribly breaks
> >>>>>> something or gives rise to worse performance. Might still be the c=
ase
> >>>>>> here, but if not, I would like to remove it.
> >>>>>>
> >>>>>> Thanks: Magnus
> >>>>>>
> >>>>>>> Magnus, what do you think of the suggestion above?
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Max
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>> I tracked this issue in our internal bug tracker in case we nee=
d to
> >>>>>>>>> perform actual debugging of mlx5e. I'm looking forward to your =
feedback
> >>>>>>>>> on my assumption above.
> >>>>>>>>>
> >>>>>>>>>>> The hardware I am using is a Mellanox ConnectX4 2x100G card (=
MCX416A-
> >>>>>> CCAT)
> >>>>>>>>>>> running the mlx5 driver.
> >>>>>>>>>
> >>>>>>>>> This one should run without striding RQ, please verify it with =
ethtool
> >>>>>>>>> --show-priv-flags (the flag name is rx_striding_rq).
> >>>>>>>>
> >>>>>>>> I do not remember changing this option, so whatever the default =
is, is
> >>>>>> what it
> >>>>>>>> was running with. I am traveling this week and do not have acces=
s to
> >>>>>> these
> >>>>>>>> systems, but will ensure that this flag is set properly when I g=
et back.
> >>>>>>>>
> >>>>>>>
>
