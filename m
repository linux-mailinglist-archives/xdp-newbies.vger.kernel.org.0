Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B508314D87C
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2020 10:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgA3J7i (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Jan 2020 04:59:38 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45471 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgA3J7i (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Jan 2020 04:59:38 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so2521926otp.12
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jan 2020 01:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pMXXcqZGNVXW/z841xgynU1Mq8GmLvrmBFT4fNvm5bY=;
        b=FeOzm13UlIYK4v9+Dk5yZuYaSe0srnvjlzoI7UxQ8jemisQf1RcFACqSxzMAUqbckA
         s801bnJyuLcmhMgKgVk1OVQVPDovJfPuIzmN06vUmqzJK3iwx6xkFUQiEqRpSudlj1gH
         z92oTVdeCuktB2MciC1XeocuTeGJAnlgj0qSVWYNgUAP0R7XCW4p4cSKZnubaHWaEQQ7
         Ta3t9eiUtzHYCVhho0zKyFvBnME5m8BQpoTbQk0llYo0sOmo8v6z9q2Jw3tTh+Qk7Ike
         QmdjJA6aUPpye3qecoD02GVFlv1KtA14oQu3TQ6oh/WhSw8XAk7yQi5b1GzyxEseUhY/
         6tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pMXXcqZGNVXW/z841xgynU1Mq8GmLvrmBFT4fNvm5bY=;
        b=W6iQWbsCi5JgfbysoLyApMOvbC8dnY5SylAxzyN+DHUCqB+gGRWe263nGEDLPTebSN
         esSUHdehTWWspjkjO/SbYhfXhwG5e/W+pTTLm0SeDPo3O+2dfiasanZtSf0w7kHxIMFM
         gHEWXNuZkFrpJStyGZDkrmbzyRvZVzObFcEognjQfB4VMliM9gJmH8XnFKis0u6VUIMn
         0brV8lVEigUvzwAy2vMttkhhKm/q8RB3MGFYCEaX7YypKsUEHJy3ohUa2gHthvOhvp/K
         UJ16v3Z4gq83czacEGlCxhd/u92Q+DQIVykFf2eXTFNqaczX1/kxNSh7S4u5PHe3vEDF
         iPbQ==
X-Gm-Message-State: APjAAAXIcjDZ3iSeVZ6F8BgwaaPe/69uhn4FySf08GhbuId6EIkqcksT
        XudnyJD6Kj3BkMlJ8A0zOHYIYtgZfNubXooWqtVCYbUS
X-Google-Smtp-Source: APXvYqwTJuBmopszg8Gj+kqzHA9+sGcgrFKrI95jgsb4ppZK6E5NujHKo3b+apmW/Uu1bUf6xTlYEoXlzEcVw9i4NCk=
X-Received: by 2002:a9d:5c1:: with SMTP id 59mr2918464otd.192.1580378377437;
 Thu, 30 Jan 2020 01:59:37 -0800 (PST)
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
In-Reply-To: <HE1PR0501MB2570108E0E186FEE0A09D668D1040@HE1PR0501MB2570.eurprd05.prod.outlook.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 30 Jan 2020 10:59:26 +0100
Message-ID: <CAJ8uoz1kkj8Fb+dg4RFDO+CpXhDs=70fb1DrTubgO+tKg0zTpg@mail.gmail.com>
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

On Thu, Jan 30, 2020 at 10:37 AM Maxim Mikityanskiy
<maximmi@mellanox.com> wrote:
>
> > -----Original Message-----
> > From: Magnus Karlsson <magnus.karlsson@gmail.com>
> > Sent: 27 January, 2020 17:55
> > To: Maxim Mikityanskiy <maximmi@mellanox.com>
> > Cc: Ryan Goodfellow <rgoodfel@isi.edu>; xdp-newbies@vger.kernel.org; Ta=
riq
> > Toukan <tariqt@mellanox.com>; Saeed Mahameed <saeedm@mellanox.com>; Mos=
he
> > Shemesh <moshe@mellanox.com>
> > Subject: Re: zero-copy between interfaces
> >
> > On Mon, Jan 27, 2020 at 3:01 PM Maxim Mikityanskiy <maximmi@mellanox.co=
m>
> > wrote:
> > >
> > > On 2020-01-22 23:43, Ryan Goodfellow wrote:
> > > > On Tue, Jan 21, 2020 at 01:40:50PM +0000, Maxim Mikityanskiy wrote:
> > > >>>> I've posted output from the program in debugging mode here
> > > >>>>
> > > >>>> - https://gitlab.com/mergetb/tech/network-
> > emulation/kernel/snippets/1930375
> > > >>>>
> > > >>>> Yes, you are correct in that forwarding works for a brief period=
 and
> > then stops.
> > > >>>> I've noticed that the number of packets that are forwarded is eq=
ual
> > to the size
> > > >>>> of the producer/consumer descriptor rings. I've posted two ping
> > traces from a
> > > >>>> client ping that shows this.
> > > >>>>
> > > >>>> - https://gitlab.com/mergetb/tech/network-
> > emulation/kernel/snippets/1930376
> > > >>>> - https://gitlab.com/mergetb/tech/network-
> > emulation/kernel/snippets/1930377
> > > >>
> > > >> These snippets are not available.
> > > >
> > > > Apologies, I had the wrong permissions set. They should be availabl=
e
> > now.
> > > >
> > > >>
> > > >>>>
> > > >>>> I've also noticed that when the forwarding stops, the CPU usage =
for
> > the proc
> > > >>>> running the program is pegged, which is not the norm for this pr=
ogram
> > as it uses
> > > >>>> a poll call with a timeout on the xsk fd.
> > > >>
> > > >> This information led me to a guess what may be happening. On the R=
X
> > > >> side, mlx5e allocates pages in bulks for performance reasons and t=
o
> > > >> leverage hardware features targeted to performance. In AF_XDP mode=
,
> > > >> bulking of frames is also used (on x86, the bulk size is 64 with
> > > >> striding RQ enabled, and 8 otherwise, however, it's implementation
> > > >> details that might change later). If you don't put enough frames t=
o XSK
> > > >> Fill Ring, the driver will be demanding more frames and return fro=
m
> > > >> poll() immediately. Basically, in the application, you should put =
as
> > > >> many frames to the Fill Ring as you can. Please check if that coul=
d be
> > > >> the root cause of your issue.
> > > >
> > > > The code in this application makes an effort to relenish the fill r=
ing
> > as fast
> > > > as possible. The basic loop of the application is to first check if
> > there are
> > > > any descriptors to be consumed from the completion queue or any
> > descriptors that
> > > > can be added to the fill queue, and only then to move on to moving
> > packets
> > > > through the rx and tx rings.
> > > >
> > > > https://gitlab.com/mergetb/tech/network-emulation/kernel/blob/v5.5-
> > moa/samples/bpf/xdpsock_multidev.c#L452-474
> > >
> > > I reproduced your issue and did my investigation, and here is what I
> > found:
> > >
> > > 1. Commit df0ae6f78a45 (that you found during bisect) introduces an
> > > important behavioral change (which I thought was not that important).
> > > xskq_nb_avail used to return min(entries, dcnt), but after the change=
 it
> > > just returns entries, which may be as big as the ring size.
> > >
> > > 2. xskq_peek_addr updates q->ring->consumer only when q->cons_tail
> > > catches up with q->cons_head. So, before that patch and one previous
> > > patch, cons_head - cons_tail was not more than 16, so the consumer in=
dex
> > > was updated periodically. Now consumer is updated only when the whole
> > > ring is exhausted.
> > >
> > > 3. The application can't replenish the fill ring if the consumer inde=
x
> > > doesn't move. As a consequence, refilling the descriptors by the
> > > application can't happen in parallel with using them by the driver. I=
t
> > > should have some performance penalty and possibly even lead to packet
> > > drops, because the driver uses all the descriptors and only then
> > > advances the consumer index, and then it has to wait until the
> > > application refills the ring, busy-looping and losing packets.
> >
> > This will happen if user space always fills up the whole ring, which
> > might or might not happen all depending on the app.
>
> Yes, that's right, and as far as I know, it's common to fill as many
> frames as the application can (there was no reason to do it other way
> till now).
>
> > With that said, it
> > might provide better performance to update it once in a while. It
> > might also be the case that we will get better performance with the
> > new scheme if we only fill half the fill ring.
>
> Yes, it may improve performance. However, I don't think it's correct to
> set such a limitation on the app.

I will examine what provides the best performance. On one hand it is
the number of updates to shared ring state (minimized by current
scheme) and the ability for the user app to but buffers on the fill
ring. Stating that putting e.g. half the packets on the fill ring
provides better performance (for some application) is not a
limitation. It is performance tuning advise :-).

> > I will look into this
> > and see what I get.
> >
> > > 4. As mlx5e allocates frames in batches, the consequences are even mo=
re
> > > severe: it's a deadlock where the driver waits for the application, a=
nd
> > > vice versa. The driver never reaches the point where cons_tail gets
> > > equal to cons_head. E.g., if cons_tail + 3 =3D=3D cons_head, and the =
batch
> > > size requested by the driver is 8, the driver won't peek anything fro=
m
> > > the fill ring waiting for difference between cons_tail and cons_head =
to
> > > increase to be at least 8. On the other hand, the application can't p=
ut
> > > anything to the ring, because it still thinks that the consumer index=
 is
> > > 0. As cons_tail never reaches cons_head, the consumer index doesn't g=
et
> > > updated, hence the deadlock.
> >
> > Good thing that you detected this. Maybe I should get a Mellanox card
> > :-). This is different from how we implemented Intel's drivers that
> > just work on any batch size. If it gets 3 packets back, it will use
> > those. How do you deal with the case when the application just puts a
> > single buffer in the fill ring and wants to receive a single packet?
>
> mlx5e will wait until the full batch is available. As AF_XDP is intended
> for high-performance apps, this scenario is less expected. We prefer to
> leverage our performance features.

That you cannot support all applications on top of AF_XDP with your
zero-copy support seems broken to me. But I give you that you might
support all the ones you care about with your current batching
support. Like you say, most apps will put plenty of buffers on the
fill ring, so this should not be a problem. Can you not implement some
slow path for these cases? You must have one for the skb case.

> > Why does the Mellanox driver need a specific batch size? This is just
> > for my understanding so we can find a good solution.
>
> The main reason is our performance feature called striding RQ. Skipping
> all irrelevant details, a batch of 64 pages is posted to the NIC with a
> single request, and the NIC fills them progressively. This feature is
> turned on by default on modern NICs, and it's really good for
> performance.
>
> It might be possible to post a smaller batch though, I'm not sure about
> it, it needs to be checked, but anyway it's not something that we will
> likely do, because it's a complication of the data path, and if we know
> more frames are coming, it's much better for the performance to wait for
> them, rather than to post several incomplete batches.
>
> > > So, in my vision, the decision to remove RX_BATCH_SIZE and periodic
> > > updates of the consumer index was wrong. It totally breaks mlx5e, tha=
t
> > > does batching, and it will affect the performance of any driver, beca=
use
> > > the application can't refill the ring until it gets completely empty =
and
> > > the driver starts waiting for frames. I suggest that periodic updates=
 of
> > > the consumer index should be readded to xskq_cons_peek_addr.
> >
> > The reason I wanted to remove RX_BATCH_SIZE is that application
> > developers complained about it giving rise to counter intuitive
> > behavior in user space. I will try to dig out the complaints and the
> > explanations Bj=C3=B6rn and I had to send which it seemed that users re=
ally
> > should not have to care about. It should just work.
>
> I think the counter that doesn't update till the very last moment and
> then advances by the ring size will also be something to complain about
> (and I am the first one to complain :D). Such bursts are not good in any
> case.

Do you have any performance data that shows this scheme is bad for
performance? The good thing about this scheme is that global state is
updated less frequently. And the bad thing is what you mentioned. But
which one has the greatest effect, is the question.

> > I also do not like
> > to have arbitrary constants like this. Why 16?
>
> I believe any batching mechanism has a constant that look arbitrary.
> This constant should be the golden mean: if it's too small, there is
> little effect from batching; if it's too big, it gets too bursty.
>
> Basically, after your patch it just changed from 16 to the ring size.
> Maybe we can tie that constant to ring size? Make it ring_size /
> another_arbitrary_constant? :)

Agreed, I thought about this too. Something tied to ring_size might be
a good compromise. Will examine this. But I want to base this on
performance data not idle speculation, so need to run some experiments
first.

/Magnus

> > Would much prefer not
> > having to deal with this, unless of course it horribly breaks
> > something or gives rise to worse performance. Might still be the case
> > here, but if not, I would like to remove it.
> >
> > Thanks: Magnus
> >
> > > Magnus, what do you think of the suggestion above?
> > >
> > > Thanks,
> > > Max
> > >
> > > >>
> > > >> I tracked this issue in our internal bug tracker in case we need t=
o
> > > >> perform actual debugging of mlx5e. I'm looking forward to your fee=
dback
> > > >> on my assumption above.
> > > >>
> > > >>>> The hardware I am using is a Mellanox ConnectX4 2x100G card (MCX=
416A-
> > CCAT)
> > > >>>> running the mlx5 driver.
> > > >>
> > > >> This one should run without striding RQ, please verify it with eth=
tool
> > > >> --show-priv-flags (the flag name is rx_striding_rq).
> > > >
> > > > I do not remember changing this option, so whatever the default is,=
 is
> > what it
> > > > was running with. I am traveling this week and do not have access t=
o
> > these
> > > > systems, but will ensure that this flag is set properly when I get =
back.
> > > >
> > >
