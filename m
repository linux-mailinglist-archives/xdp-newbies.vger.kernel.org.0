Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80F42151DE5
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 17:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgBDQKQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 11:10:16 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33756 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbgBDQKP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 Feb 2020 11:10:15 -0500
Received: by mail-oi1-f175.google.com with SMTP id q81so19024571oig.0
        for <xdp-newbies@vger.kernel.org>; Tue, 04 Feb 2020 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hdhnq2QBMFGwRKzCGPBwRYd7RYK8IM4/ThOExDM6fmM=;
        b=ieTRr0fnVzcq4lZC8xSdM8hRInKFdjRaOI3aruYQY45zrVYe2/IYHoQZSqpCdvvNiC
         0fHZc1oXOJZbSlKNegKoHxU7H7JcHGmDv6O7tXIVYVuWq7VakKjh138PA4c/a/92lCRK
         HvLv3AQ8Of1P17O6F9V1bkdjRFdpXLdTm3CaOvwa9BLkQyDz72s0NqBIcBKgcW9X7ZO6
         OZN9SoeIpgCiy5AEGHJoXMhnsJlzAY5ecmroWY2JaFo+VaqeSbp4NKCYFgN9FOoIsrka
         DyEkVOA1q+t4WXR5xKonqzziHbLS4bfmimHh0to7/PQ3xkf5HbESFlgX9O/888ZENrM1
         YSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hdhnq2QBMFGwRKzCGPBwRYd7RYK8IM4/ThOExDM6fmM=;
        b=Nk++4y7NBcXUp3troZg0KPUZnP3J8nk4kpAdYw5+lmLlqv6EwQXaJiNMSniB2U00iX
         J52K0Ox2KSzOPyCSx3rbYy2Ax7Extm1ms6BgAdZCZi4AWoOD6z1BSvC5Z2XCKXEBobUy
         frovgXjSY84ZwmzGeAL5ng6Ns8l1bpCwFW1ZJosG3jCDa0I4Q0XU9++ONXaENo5aOgjP
         YzQscf74oX26Yr0q8IFlLG7wC67kbIcexzWSKZJwy+XigyOMNnlXAI6xXC9ogzWE5juV
         kGwmCOelK9hDOdeTlUd9u693jwUTtGEc4ameD26ApGlxnBAb3bP1snP9Ye3dpaHSXqHY
         2Rxw==
X-Gm-Message-State: APjAAAUzUzVaXHTjqJane0zptDClM6wS76vrdBwt9bMIbu0pBHlHOrjM
        vR/J6kFge4i1S859ig4mCxN/k/RaotqcGb7nQmc=
X-Google-Smtp-Source: APXvYqzJmIvv2y8nHTWt1YnSCgvoLq3eQN2lXLq35+ATAMlwVJLsOrl16nqI/nuHDpu3HbIdCfrChwfRn1JXprrwiJQ=
X-Received: by 2002:aca:54cc:: with SMTP id i195mr3855498oib.126.1580832614376;
 Tue, 04 Feb 2020 08:10:14 -0800 (PST)
MIME-Version: 1.0
References: <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
 <20200116020414.GA46831@smtp.ads.isi.edu> <CAJ8uoz0yqYTq+OOK8p0XRcWyMkfnJ1ZT7hUew9w3FuHr=4K-QQ@mail.gmail.com>
 <4c03813d-5edf-7e9e-8905-31902b5acb71@mellanox.com> <20200122214352.GA13201@smtp.ads.isi.edu>
 <b1b9342b-b9e5-f576-c06c-3a43dcf2b189@mellanox.com> <CAJ8uoz1wuCmPehXNX2_OddF2YC=2mNaFZC4f+6j9VkmSTSPaQQ@mail.gmail.com>
 <HE1PR0501MB2570108E0E186FEE0A09D668D1040@HE1PR0501MB2570.eurprd05.prod.outlook.com>
 <CAJ8uoz1kkj8Fb+dg4RFDO+CpXhDs=70fb1DrTubgO+tKg0zTpg@mail.gmail.com> <CAJ8uoz2FsPY=Q2ab6wqHhpaaEFmsi3F8gga2OfLUUSQuRZvuHw@mail.gmail.com>
In-Reply-To: <CAJ8uoz2FsPY=Q2ab6wqHhpaaEFmsi3F8gga2OfLUUSQuRZvuHw@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Tue, 4 Feb 2020 17:10:02 +0100
Message-ID: <CAJ8uoz0Ucw82B1Cq9KCTVu_=O5p6ETxqwL=awmkcG1A=XF=irw@mail.gmail.com>
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

On Thu, Jan 30, 2020 at 12:40 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, Jan 30, 2020 at 10:59 AM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, Jan 30, 2020 at 10:37 AM Maxim Mikityanskiy
> > <maximmi@mellanox.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Magnus Karlsson <magnus.karlsson@gmail.com>
> > > > Sent: 27 January, 2020 17:55
> > > > To: Maxim Mikityanskiy <maximmi@mellanox.com>
> > > > Cc: Ryan Goodfellow <rgoodfel@isi.edu>; xdp-newbies@vger.kernel.org=
; Tariq
> > > > Toukan <tariqt@mellanox.com>; Saeed Mahameed <saeedm@mellanox.com>;=
 Moshe
> > > > Shemesh <moshe@mellanox.com>
> > > > Subject: Re: zero-copy between interfaces
> > > >
> > > > On Mon, Jan 27, 2020 at 3:01 PM Maxim Mikityanskiy <maximmi@mellano=
x.com>
> > > > wrote:
> > > > >
> > > > > On 2020-01-22 23:43, Ryan Goodfellow wrote:
> > > > > > On Tue, Jan 21, 2020 at 01:40:50PM +0000, Maxim Mikityanskiy wr=
ote:
> > > > > >>>> I've posted output from the program in debugging mode here
> > > > > >>>>
> > > > > >>>> - https://gitlab.com/mergetb/tech/network-
> > > > emulation/kernel/snippets/1930375
> > > > > >>>>
> > > > > >>>> Yes, you are correct in that forwarding works for a brief pe=
riod and
> > > > then stops.
> > > > > >>>> I've noticed that the number of packets that are forwarded i=
s equal
> > > > to the size
> > > > > >>>> of the producer/consumer descriptor rings. I've posted two p=
ing
> > > > traces from a
> > > > > >>>> client ping that shows this.
> > > > > >>>>
> > > > > >>>> - https://gitlab.com/mergetb/tech/network-
> > > > emulation/kernel/snippets/1930376
> > > > > >>>> - https://gitlab.com/mergetb/tech/network-
> > > > emulation/kernel/snippets/1930377
> > > > > >>
> > > > > >> These snippets are not available.
> > > > > >
> > > > > > Apologies, I had the wrong permissions set. They should be avai=
lable
> > > > now.
> > > > > >
> > > > > >>
> > > > > >>>>
> > > > > >>>> I've also noticed that when the forwarding stops, the CPU us=
age for
> > > > the proc
> > > > > >>>> running the program is pegged, which is not the norm for thi=
s program
> > > > as it uses
> > > > > >>>> a poll call with a timeout on the xsk fd.
> > > > > >>
> > > > > >> This information led me to a guess what may be happening. On t=
he RX
> > > > > >> side, mlx5e allocates pages in bulks for performance reasons a=
nd to
> > > > > >> leverage hardware features targeted to performance. In AF_XDP =
mode,
> > > > > >> bulking of frames is also used (on x86, the bulk size is 64 wi=
th
> > > > > >> striding RQ enabled, and 8 otherwise, however, it's implementa=
tion
> > > > > >> details that might change later). If you don't put enough fram=
es to XSK
> > > > > >> Fill Ring, the driver will be demanding more frames and return=
 from
> > > > > >> poll() immediately. Basically, in the application, you should =
put as
> > > > > >> many frames to the Fill Ring as you can. Please check if that =
could be
> > > > > >> the root cause of your issue.
> > > > > >
> > > > > > The code in this application makes an effort to relenish the fi=
ll ring
> > > > as fast
> > > > > > as possible. The basic loop of the application is to first chec=
k if
> > > > there are
> > > > > > any descriptors to be consumed from the completion queue or any
> > > > descriptors that
> > > > > > can be added to the fill queue, and only then to move on to mov=
ing
> > > > packets
> > > > > > through the rx and tx rings.
> > > > > >
> > > > > > https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v=
5.5-
> > > > moa/samples/bpf/xdpsock_multidev.c#L452-474
> > > > >
> > > > > I reproduced your issue and did my investigation, and here is wha=
t I
> > > > found:
> > > > >
> > > > > 1. Commit df0ae6f78a45 (that you found during bisect) introduces =
an
> > > > > important behavioral change (which I thought was not that importa=
nt).
> > > > > xskq_nb_avail used to return min(entries, dcnt), but after the ch=
ange it
> > > > > just returns entries, which may be as big as the ring size.
> > > > >
> > > > > 2. xskq_peek_addr updates q->ring->consumer only when q->cons_tai=
l
> > > > > catches up with q->cons_head. So, before that patch and one previ=
ous
> > > > > patch, cons_head - cons_tail was not more than 16, so the consume=
r index
> > > > > was updated periodically. Now consumer is updated only when the w=
hole
> > > > > ring is exhausted.
> > > > >
> > > > > 3. The application can't replenish the fill ring if the consumer =
index
> > > > > doesn't move. As a consequence, refilling the descriptors by the
> > > > > application can't happen in parallel with using them by the drive=
r. It
> > > > > should have some performance penalty and possibly even lead to pa=
cket
> > > > > drops, because the driver uses all the descriptors and only then
> > > > > advances the consumer index, and then it has to wait until the
> > > > > application refills the ring, busy-looping and losing packets.
> > > >
> > > > This will happen if user space always fills up the whole ring, whic=
h
> > > > might or might not happen all depending on the app.
> > >
> > > Yes, that's right, and as far as I know, it's common to fill as many
> > > frames as the application can (there was no reason to do it other way
> > > till now).
> > >
> > > > With that said, it
> > > > might provide better performance to update it once in a while. It
> > > > might also be the case that we will get better performance with the
> > > > new scheme if we only fill half the fill ring.
> > >
> > > Yes, it may improve performance. However, I don't think it's correct =
to
> > > set such a limitation on the app.
>
> Actually, a much worse limitation to put on an application is to say
> that you have to have a certain amount of buffers on some ring for the
> zero-copy feature to work. For example that we need at least 64
> buffers on the fill ring for all the NIC cards to work in zero-copy
> mode. That would be a bad thing to have to put in the documentation.
> An OS is supposed to abstract away HW differences, and with this
> current limitation in your driver, it shines through for sure. What we
> would like to put in the documentation is a statement along the lines
> of: "for best performance, make sure you have plenty of buffers on the
> fill ring so that the NIC can work as efficiently as possible". Not a
> statement that it does not work on Mellanox unless you put enough
> buffers on the fill ring. So my advice (and wish) is that you fix this
> in your driver. With that said, I will still look into what is the
> best way to get at least the sample to work for you. But there is no
> way to make sure every single app works for you in zero-copy mode,
> unless you support arbitrary amount of buffers on the fill ring. I
> guess that sooner or later, a customer of yours will get into this
> situation one way or the other, so why not fix it now.
>
> /Magnus
>
> > I will examine what provides the best performance. On one hand it is
> > the number of updates to shared ring state (minimized by current
> > scheme) and the ability for the user app to but buffers on the fill
> > ring. Stating that putting e.g. half the packets on the fill ring
> > provides better performance (for some application) is not a
> > limitation. It is performance tuning advise :-).

I have now made a set of measurements. First I just made a variation
study using the xdpsock app, varying the amount of packets the kernel
can withdraw from a consumer ring (fill and Tx) before updating global
state. For the 1 core case (app and driver on the same core) the more
frequent you do this update, the better. The reason for this is that
it costs very little to update the state since the application is not
running. And it is beneficial for the app to have a freshly updated
state when it starts to execute as it can operate on more packets. For
the 2 core case (app on one core, driver on another) it is the
complete opposite: the fewer updates to global state, the better. The
reason for this is that it costs a lot to update global state as it
triggers cache coherency actions between the two cores.

What I did then was to compare the current scheme, update only when
grabbing new packets, to a new scheme were we also update the global
consumer pointer when we are exiting Rx or Tx processing in the NAPI
context. On two cores the current scheme gets 0.5 to 1 Mpps more in
throughput than also updating the pointer at the end of NAPI. But for
1 core case, the new scheme is the best and generates between 0.2 and
0.3 Mpps more in throughput than the current one. But all in all, the
current scheme is more beneficial than the proposed one if we say that
both the 1 core and the 2 core case is equally important.

Something to note is that the xdpsock application only puts batch size
(64) of packets in the fill ring in every iteration, and this might
lead to some good pacing for the current scheme and the 2 core case.
I.e., we do not get into the case of the fill ring only being full or
empty. But I will run this on some real apps to get some more results,
and I know that Bj=C3=B6rn has an optimized xdpsock application that puts
many more packets into the fill queue than 64. This optimization might
actually make the new proposal (also updating at the end of NAPI) be
better and make the current scheme suffer. We will examine this
further and get back.

/Magnus

> > > > I will look into this
> > > > and see what I get.
> > > >
> > > > > 4. As mlx5e allocates frames in batches, the consequences are eve=
n more
> > > > > severe: it's a deadlock where the driver waits for the applicatio=
n, and
> > > > > vice versa. The driver never reaches the point where cons_tail ge=
ts
> > > > > equal to cons_head. E.g., if cons_tail + 3 =3D=3D cons_head, and =
the batch
> > > > > size requested by the driver is 8, the driver won't peek anything=
 from
> > > > > the fill ring waiting for difference between cons_tail and cons_h=
ead to
> > > > > increase to be at least 8. On the other hand, the application can=
't put
> > > > > anything to the ring, because it still thinks that the consumer i=
ndex is
> > > > > 0. As cons_tail never reaches cons_head, the consumer index doesn=
't get
> > > > > updated, hence the deadlock.
> > > >
> > > > Good thing that you detected this. Maybe I should get a Mellanox ca=
rd
> > > > :-). This is different from how we implemented Intel's drivers that
> > > > just work on any batch size. If it gets 3 packets back, it will use
> > > > those. How do you deal with the case when the application just puts=
 a
> > > > single buffer in the fill ring and wants to receive a single packet=
?
> > >
> > > mlx5e will wait until the full batch is available. As AF_XDP is inten=
ded
> > > for high-performance apps, this scenario is less expected. We prefer =
to
> > > leverage our performance features.
> >
> > That you cannot support all applications on top of AF_XDP with your
> > zero-copy support seems broken to me. But I give you that you might
> > support all the ones you care about with your current batching
> > support. Like you say, most apps will put plenty of buffers on the
> > fill ring, so this should not be a problem. Can you not implement some
> > slow path for these cases? You must have one for the skb case.
> >
> > > > Why does the Mellanox driver need a specific batch size? This is ju=
st
> > > > for my understanding so we can find a good solution.
> > >
> > > The main reason is our performance feature called striding RQ. Skippi=
ng
> > > all irrelevant details, a batch of 64 pages is posted to the NIC with=
 a
> > > single request, and the NIC fills them progressively. This feature is
> > > turned on by default on modern NICs, and it's really good for
> > > performance.
> > >
> > > It might be possible to post a smaller batch though, I'm not sure abo=
ut
> > > it, it needs to be checked, but anyway it's not something that we wil=
l
> > > likely do, because it's a complication of the data path, and if we kn=
ow
> > > more frames are coming, it's much better for the performance to wait =
for
> > > them, rather than to post several incomplete batches.
> > >
> > > > > So, in my vision, the decision to remove RX_BATCH_SIZE and period=
ic
> > > > > updates of the consumer index was wrong. It totally breaks mlx5e,=
 that
> > > > > does batching, and it will affect the performance of any driver, =
because
> > > > > the application can't refill the ring until it gets completely em=
pty and
> > > > > the driver starts waiting for frames. I suggest that periodic upd=
ates of
> > > > > the consumer index should be readded to xskq_cons_peek_addr.
> > > >
> > > > The reason I wanted to remove RX_BATCH_SIZE is that application
> > > > developers complained about it giving rise to counter intuitive
> > > > behavior in user space. I will try to dig out the complaints and th=
e
> > > > explanations Bj=C3=B6rn and I had to send which it seemed that user=
s really
> > > > should not have to care about. It should just work.
> > >
> > > I think the counter that doesn't update till the very last moment and
> > > then advances by the ring size will also be something to complain abo=
ut
> > > (and I am the first one to complain :D). Such bursts are not good in =
any
> > > case.
> >
> > Do you have any performance data that shows this scheme is bad for
> > performance? The good thing about this scheme is that global state is
> > updated less frequently. And the bad thing is what you mentioned. But
> > which one has the greatest effect, is the question.
> >
> > > > I also do not like
> > > > to have arbitrary constants like this. Why 16?
> > >
> > > I believe any batching mechanism has a constant that look arbitrary.
> > > This constant should be the golden mean: if it's too small, there is
> > > little effect from batching; if it's too big, it gets too bursty.
> > >
> > > Basically, after your patch it just changed from 16 to the ring size.
> > > Maybe we can tie that constant to ring size? Make it ring_size /
> > > another_arbitrary_constant? :)
> >
> > Agreed, I thought about this too. Something tied to ring_size might be
> > a good compromise. Will examine this. But I want to base this on
> > performance data not idle speculation, so need to run some experiments
> > first.
> >
> > /Magnus
> >
> > > > Would much prefer not
> > > > having to deal with this, unless of course it horribly breaks
> > > > something or gives rise to worse performance. Might still be the ca=
se
> > > > here, but if not, I would like to remove it.
> > > >
> > > > Thanks: Magnus
> > > >
> > > > > Magnus, what do you think of the suggestion above?
> > > > >
> > > > > Thanks,
> > > > > Max
> > > > >
> > > > > >>
> > > > > >> I tracked this issue in our internal bug tracker in case we ne=
ed to
> > > > > >> perform actual debugging of mlx5e. I'm looking forward to your=
 feedback
> > > > > >> on my assumption above.
> > > > > >>
> > > > > >>>> The hardware I am using is a Mellanox ConnectX4 2x100G card =
(MCX416A-
> > > > CCAT)
> > > > > >>>> running the mlx5 driver.
> > > > > >>
> > > > > >> This one should run without striding RQ, please verify it with=
 ethtool
> > > > > >> --show-priv-flags (the flag name is rx_striding_rq).
> > > > > >
> > > > > > I do not remember changing this option, so whatever the default=
 is, is
> > > > what it
> > > > > > was running with. I am traveling this week and do not have acce=
ss to
> > > > these
> > > > > > systems, but will ensure that this flag is set properly when I =
get back.
> > > > > >
> > > > >
