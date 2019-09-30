Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1497CC1BC3
	for <lists+xdp-newbies@lfdr.de>; Mon, 30 Sep 2019 08:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbfI3Gvx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 30 Sep 2019 02:51:53 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37855 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfI3Gvx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 30 Sep 2019 02:51:53 -0400
Received: by mail-oi1-f170.google.com with SMTP id i16so10171955oie.4
        for <xdp-newbies@vger.kernel.org>; Sun, 29 Sep 2019 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WaEJHkmpv6LXeMJw0u8GpUDBwAoAOJcbwNLvjRtie38=;
        b=R4SwStxJm+qYl9YOX8FvmbHDC839GBbCJOp3zn/mZzy4ynNzLaAs/MBNpgyMv7fAen
         JGF7K0AmVkqwnJw8QNKLAVyS2ojJG8p8ByqHBY8CqozArEGs1dPXHBk6QJFc5yJISemB
         8aH93uANhJm/z9wMbMvQSRJN8tk6Z//fYI3eWu3W7mhc49jVq68Y8aJFpzTRRFgV/q6r
         Zdp6A9CO76WkkA6PxFoxp6jgCc+c7bGqpGkfPkuZhW2fwy7anaeBS1SETkK29JSdajyp
         QYJS4Bit6V6Q/UHh+vwHrSKVt9apBurLf5ROhZUWSJBMqUN62pJKZR6Zdj3EhK7ex+rR
         omFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WaEJHkmpv6LXeMJw0u8GpUDBwAoAOJcbwNLvjRtie38=;
        b=Fkwa5Q2S8ahJxVroekrZK1Ncp9JDWQ4ciKrluuHby4pEGWLELcfKemD84iQhZN+2Mw
         9Fem3D9LN2VGUzyaIevfDJqU3n17/Cz0BWNy8ezNGLq4VYaeA6OCiqIJ2c31B6cLI4I1
         60ZN/0Fqvdy9chvdIVJ/Xy8IFrJ1/68UR4kZcx+9Pdqom+3opOsnqLARe/B+2lJ0ip/u
         f5FGTsAn/QVKmW/V9j/hKgFwNhXEEmC1YBNJCA2iz8js2lPyvaqPfNWB4YANqEEP/7lM
         MZmWiGOlTcBdeHYIRssr4CpPJgdJu82qaPyoRvZ6JC/P5/AGcNcSyMhAXk7KIvuH3Lqe
         /tkQ==
X-Gm-Message-State: APjAAAUcOBcqDdvPAsz4/RN7GXZLQym+qs59FT7yF6/q1h0YGOxAeP6Y
        w5YFxkaoBVxp+I/JcPLpDnDjlwHcTKqgSKd4Tkk=
X-Google-Smtp-Source: APXvYqzHA5pTlwLtu9R/vxFHkUCg+YrXLkpeST7zHTmttQSzIM0FYRM/AUMimxJfI5et+K8+bW9MkvRu0ohYrmwA0vU=
X-Received: by 2002:aca:304b:: with SMTP id w72mr16374241oiw.126.1569826311437;
 Sun, 29 Sep 2019 23:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon> <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com> <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
 <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech> <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
 <966e40dda4654444a420b935ad970d18@pantheon.tech> <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
 <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech> <565AE8A9-8A0D-4582-A3C5-D317F4DA0C9F@redhat.com>
 <CALDO+SbC-64-78Fxv4u3p8RHG9n9jqcEHE3rRK5QjqF_KH+bmQ@mail.gmail.com>
 <CAJ8uoz1p4rL2TQ-4kXNDzd2dmJ3DCgvzPFUiJjPHRUYaBbUYZQ@mail.gmail.com> <CALDO+SZNbFfqN=os_m3B15XN=pJ1TguPBQSV-GxetucmDDvrnQ@mail.gmail.com>
In-Reply-To: <CALDO+SZNbFfqN=os_m3B15XN=pJ1TguPBQSV-GxetucmDDvrnQ@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 30 Sep 2019 08:51:40 +0200
Message-ID: <CAJ8uoz3KVH8TNA86YUiMoMS43gtSL1GTwGEg5yqwoZApLETVTQ@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     William Tu <u9012063@gmail.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        =?UTF-8?B?TWFyZWsgWsOhdm9kc2vDvQ==?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Thomas F Herbert <therbert@redhat.com>,
        Kevin Laatz <kevin.laatz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Sep 27, 2019 at 8:09 PM William Tu <u9012063@gmail.com> wrote:
>
> On Fri, Sep 27, 2019 at 12:02 AM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, Sep 26, 2019 at 1:34 AM William Tu <u9012063@gmail.com> wrote:
> > >
> > > On Wed, Sep 25, 2019 at 12:48 AM Eelco Chaudron <echaudro@redhat.com>=
 wrote:
> > > >
> > > >
> > > >
> > > > On 25 Sep 2019, at 8:46, J=C3=BAlius Milan wrote:
> > > >
> > > > > Hi Eelco
> > > > >
> > > > >> Currently, OVS uses the mmaped memory directly, however on egres=
s, it
> > > > >> is copying the memory to the egress interface it=E2=80=99s mmape=
d memory.
> > > > > Great, thanks for making this clear to me.
> > > > >
> > > > >> Currently, OVS uses an AF_XDP memory pool per interface, so a fu=
rther
> > > > >> optimization could be to use a global memory pool so this extra =
copy
> > > > >> is not needed.
> > > > > Is it even possible to make this further optimization? Since ever=
y
> > > > > interface has it's own non-shared umem, so from my point of view,=
 at
> > > > > least one
> > > > > copy for case as you described above (when RX interface is differ=
ent
> > > > > then TX interface) is necessery. Or am I missing something?
> > > >
> > > > Some one @Intel told me it would be possible to have one huge mempo=
ol
> > > > that can be shared between interfaces. However I have not
> > > > researched/tried it.
> > >
> > > I thought about it before, but the problem is cq and fq are per-umem.
> > > So when having only one umem shared with many queues or devices,
> > > each one has to acquire a lock, then they can access cq or fq. I thin=
k
> > > that might become much slower.
> >
> > You basically have to implement a mempool that can be used by multiple
> > processes. Unfortunately, there is no lean and mean standalone
> > implementation of a mempool. There is a good one in DPDK, but then you
> > get the whole DPDK package into your application which is likely what
> > you wanted to avoid in the first place. Anyone for writing libmempool?
> >
> > /Magnus
> >
>
> That's interesting.
> Do you mean the DPDK's rte_mempool which supports multiple-producer?

Yes.

> If I create a shared umem for queue1  and queue2, then each queue has its
> own tx/rx ring so they can process in parallel. But for handling the per-=
umem
> cq/fq, I can create a dedicated thread to process cq/fq.
> So for example:
> Thread 1 for handling cq/fq
> Thread 2 for processing queue1 tx/rx queue
> Thread 3 for processing queue2 tx/rx queue
> and the mempool should allow multiple producer and consumer.
>
> Does this sound correct?

You do not need a dedicated process. Just something in the mempool
code that enforces mutual exclusion (a mutex or whatever) between
thread 2 and 3 when they are performing operations on the mempool.
Going with a dedicated process sounds complicated.

/Magnus

> Thanks
> Wiliam
>
> > > > Maybe Magnus can confirm?
> > > >
> > > >
> > > > > J=C3=BAlius
> > > > >
> > > > > -----Original Message-----
> > > > > From: Eelco Chaudron [mailto:echaudro@redhat.com]
> > > > > Sent: Monday, September 23, 2019 3:02 PM
> > > > > To: J=C3=BAlius Milan <Julius.Milan@pantheon.tech>
> > > > > Cc: Magnus Karlsson <magnus.karlsson@gmail.com>; William Tu
> > > > > <u9012063@gmail.com>; Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.co=
m>; Marek
> > > > > Z=C3=A1vodsk=C3=BD <marek.zavodsky@pantheon.tech>; Jesper Dangaar=
d Brouer
> > > > > <brouer@redhat.com>; xdp-newbies@vger.kernel.org; Karlsson, Magnu=
s
> > > > > <magnus.karlsson@intel.com>; Thomas F Herbert <therbert@redhat.co=
m>;
> > > > > Kevin Laatz <kevin.laatz@intel.com>
> > > > > Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions ab=
out
> > > > > XDP)
> > > > >
> > > > >
> > > > >
> > > > > On 23 Sep 2019, at 11:00, J=C3=BAlius Milan wrote:
> > > > >
> > > > >> Many Thanks Magnus
> > > > >>
> > > > >>>> I have next 2 questions:
> > > > >>>>
> > > > >>>> 1] When I use xsk_ring_prod__reserve and successive
> > > > >>>> xsk_ring_prod__submit. Is it correct to submit also less than =
I
> > > > >>>> reserved?
> > > > >>>>     In some cases I can't exactly determine how much to reserv=
e in
> > > > >>>> advance, since vpp buffers have different size than xdp frames=
.
> > > > >>>
> > > > >>> Let me see so I understand this correctly. Ponder you reserve 1=
0
> > > > >>> slots and later submit 4. This means you have reserved 6 more t=
han
> > > > >>> you need.
> > > > >>> Do you want to "unreserve" these and give them back to the ring=
?
> > > > >>> This
> > > > >>> is not supported by the interface today. Another way of solving=
 this
> > > > >>> (if this is your problem and I am understanding it correctly, t=
hat
> > > > >>> is) is that you in the next iteration only reserve 10 - 6 =3D 4=
 slots
> > > > >>> because you already have 6 slots available from the last iterat=
ion.
> > > > >>> You could still submit 10 after this. But adding something like=
 an
> > > > >>> unreserve option would be easy as long as we made sure it only
> > > > >>> affected local ring state. The global state seen in the shared
> > > > >>> variables between user space and kernel would not be touched, a=
s
> > > > >>> this
> > > > >>> would affect performance negatively. Please let me know what yo=
u
> > > > >>> think.
> > > > >>>
> > > > >> Yes, You understand it correctly, I implemented it the way you
> > > > >> suggested, i.e. by marking index and count of reserved slots (no=
t
> > > > >> committed yet, but works well), thanks again.
> > > > >>
> > > > >>>> 2] Can I use hugepage backed memory for umem? If not, is it pl=
anned
> > > > >>>> for future?
> > > > >>>>     Yet it does copy pakets from rx rings to vpp buffers, but
> > > > >>>> speculating about straight zerocopy way.
> > > > >>>
> > > > >>> Yes you can use huge pages today, but the internal AF_XDP code =
has
> > > > >>> not been optimized to use huge pages, so you will not get the f=
ull
> > > > >>> benefit from them today. Kevin Laatz, added to this mail, is wo=
rking
> > > > >>> on optimizing the AF_XDP code for huge pages. If you want to kn=
ow
> > > > >>> more or have some requirements, do not hesitate to contact him.
> > > > >>>
> > > > >> Kevin will the API for using hugepages change while optimization
> > > > >> process significantly or can I already start to rewrite my vpp d=
river
> > > > >> to use hugepages backed memory?
> > > > >> Also please let me know, when you consider AF_XDP code optimized=
 to
> > > > >> use huge pages.
> > > > >>
> > > > >> William, if I may ask next question.
> > > > >> Does OVS implementation of af_xdp driver copy paket data from af=
_xdp
> > > > >> mmaped ring buffers into OVS "buffers" (some structure to repres=
ent
> > > > >> the packet in OVS) or is it zerocopy in this manner, i.e. OVS
> > > > >> "buffers" mempool is directly mmaped as ring and so no copy on R=
X is
> > > > >> needed. Since in 2nd case it would be very valuable for me as
> > > > >> inspiration.
> > > > >
> > > > > Currently, OVS uses the mmaped memory directly, however on egress=
, it
> > > > > is copying the memory to the egress interface it=E2=80=99s mmaped=
 memory.
> > > > > Currently, OVS uses an AF_XDP memory pool per interface, so a fur=
ther
> > > > > optimization could be to use a global memory pool so this extra c=
opy
> > > > > is not needed.
> > > > >
> > > > >>
> > > > >>> /Magnus
> > > > >>>
> > > > >>
> > > > >> Thanks a lot,
> > > > >>
> > > > >> J=C3=BAlius
