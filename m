Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A25FD3BB3
	for <lists+xdp-newbies@lfdr.de>; Fri, 11 Oct 2019 10:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfJKIzs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 11 Oct 2019 04:55:48 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:40270 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfJKIzs (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 11 Oct 2019 04:55:48 -0400
Received: by mail-oi1-f174.google.com with SMTP id k9so7369807oib.7
        for <xdp-newbies@vger.kernel.org>; Fri, 11 Oct 2019 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KXo+aTClzjTTnBBC1pf/lNnPlFebHPBXJnMK0RDDZYc=;
        b=Wu4G/D3/wiyj/LRjuBEzMCyyEwe458d8G/h+LAR4ul3ezXL9BVmHZKETobrdwxUEXo
         MaW8u2hNpz1BZp/aMpgwAHeq0GpzV6KT/IIyd2HrCp2B2D6waqmrC9zgC93u1elLADG6
         CIUSTIL0H5iNVQzHD09LgkCAkrgonBjl9erPEQL0rceYVDMl9XE5UBaV95uwzMPT9yKD
         PV1lqHDPbrZrv3I+NY8RvxN/6SElCvMBfCDMASogFLrHz+CQt1H+2396CkHzyZCFtX2H
         swGB2/w8qO/u9pYWkRKE69oZrU0QHdW6RDXsBYj2u/VT26sYRcTY/7pMWXcjtwdFhr1a
         HEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KXo+aTClzjTTnBBC1pf/lNnPlFebHPBXJnMK0RDDZYc=;
        b=H/MULMHFqSO98YkthRdo2BieyBaMz+bCW75v58El1/LOClA2pLpBP5r6nBU7jwWW8G
         FtOHvFqRkst4kKofJXGTsAMCe/Ny1S9qcmEMEgX/PL3br6HT0ONtBH+JYofwlDxNfijD
         hdjPMd6VF4KOzthLRQ0oJW1kqkU7SFGLrD8RscAVJ+iVKCD9+zUW43Nr/5snURsap9b/
         e9HaT3++07NUPi4quo2gi3myjvZ3UY1cpOUVnQinwcdk8TmqqiP91Bo9haxzi1TqlHth
         /JLr4Zy4b7Qn977atpCkBnuYOOkrRWcVlKeYVwyCUOf5wv4jnzXRe39RqRnJbUJu14eB
         HVKA==
X-Gm-Message-State: APjAAAVj4DySY4Ninu+Zrf43jDq9SZ4zoba8MxjgeStW2TdGZqT+fIlR
        6zuc91+XHErPhljnY4u2Lc3+rv91FOOFgU6lzLo=
X-Google-Smtp-Source: APXvYqzQR1I6KZvU1DJXyHiaIzfuodhBGysgnblDeVQE+ZORJxQFvHngrp6PNbK1LnfHUJUdQUH1Wysm28MUr5F0jtM=
X-Received: by 2002:aca:f585:: with SMTP id t127mr11302805oih.109.1570784146612;
 Fri, 11 Oct 2019 01:55:46 -0700 (PDT)
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
 <CAJ8uoz1p4rL2TQ-4kXNDzd2dmJ3DCgvzPFUiJjPHRUYaBbUYZQ@mail.gmail.com>
 <CALDO+SZNbFfqN=os_m3B15XN=pJ1TguPBQSV-GxetucmDDvrnQ@mail.gmail.com>
 <CAJ8uoz3KVH8TNA86YUiMoMS43gtSL1GTwGEg5yqwoZApLETVTQ@mail.gmail.com>
 <A80A2A07-D33A-4AB4-B71B-537A8D6651D7@redhat.com> <CAJ8uoz3MisB3zCtXM8Wd5vkBAohJs0=UVur+NyC1BAOMjTNuag@mail.gmail.com>
 <0fd1717d5050400ca20241d858a196e4@pantheon.tech>
In-Reply-To: <0fd1717d5050400ca20241d858a196e4@pantheon.tech>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 11 Oct 2019 10:55:35 +0200
Message-ID: <CAJ8uoz24vN8E6ogZ9KySnnv8VJgsaM=7TCq_Ehd-z_HuM1fr7w@mail.gmail.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        William Tu <u9012063@gmail.com>,
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

On Thu, Oct 10, 2019 at 11:30 AM J=C3=BAlius Milan
<Julius.Milan@pantheon.tech> wrote:
>
> On 30 Sep 2019, at 13:02, Magnus Karlsson wrote:
>
> > On Mon, Sep 30, 2019 at 11:28 AM Eelco Chaudron <echaudro@redhat.com>
> > wrote:
> >>
> >>
> >>
> >> On 30 Sep 2019, at 8:51, Magnus Karlsson wrote:
> >>
> >>> On Fri, Sep 27, 2019 at 8:09 PM William Tu <u9012063@gmail.com>
> >>> wrote:
> >>>>
> >>>> On Fri, Sep 27, 2019 at 12:02 AM Magnus Karlsson
> >>>> <magnus.karlsson@gmail.com> wrote:
> >>>>>
> >>>>> On Thu, Sep 26, 2019 at 1:34 AM William Tu <u9012063@gmail.com>
> >>>>> wrote:
> >>>>>>
> >>>>>> On Wed, Sep 25, 2019 at 12:48 AM Eelco Chaudron
> >>>>>> <echaudro@redhat.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 25 Sep 2019, at 8:46, J=C3=BAlius Milan wrote:
> >>>>>>>
> >>>>>>>> Hi Eelco
> >>>>>>>>
> >>>>>>>>> Currently, OVS uses the mmaped memory directly, however on
> >>>>>>>>> egress, it is copying the memory to the egress interface it=E2=
=80=99s
> >>>>>>>>> mmaped memory.
> >>>>>>>> Great, thanks for making this clear to me.
> >>>>>>>>
> >>>>>>>>> Currently, OVS uses an AF_XDP memory pool per interface, so a
> >>>>>>>>> further optimization could be to use a global memory pool so
> >>>>>>>>> this extra copy is not needed.
> >>>>>>>> Is it even possible to make this further optimization? Since
> >>>>>>>> every interface has it's own non-shared umem, so from my point
> >>>>>>>> of view, at least one copy for case as you described above
> >>>>>>>> (when RX interface is different then TX interface) is
> >>>>>>>> necessery. Or am I missing something?
> >>>>>>>
> >>>>>>> Some one @Intel told me it would be possible to have one huge
> >>>>>>> mempool that can be shared between interfaces. However I have
> >>>>>>> not researched/tried it.
> >>>>>>
> >>>>>> I thought about it before, but the problem is cq and fq are
> >>>>>> per-umem.
> >>>>>> So when having only one umem shared with many queues or devices,
> >>>>>> each one has to acquire a lock, then they can access cq or fq. I
> >>>>>> think that might become much slower.
> >>>>>
> >>>>> You basically have to implement a mempool that can be used by
> >>>>> multiple processes. Unfortunately, there is no lean and mean
> >>>>> standalone implementation of a mempool. There is a good one in
> >>>>> DPDK, but then you get the whole DPDK package into your
> >>>>> application which is likely what you wanted to avoid in the first
> >>>>> place. Anyone for writing libmempool?
> >>>>>
> >>>>> /Magnus
> >>>>>
> >>>>
> >>>> That's interesting.
> >>>> Do you mean the DPDK's rte_mempool which supports
> >>>> multiple-producer?
> >>>
> >>> Yes.
> >>>
> >>>> If I create a shared umem for queue1  and queue2, then each queue
> >>>> has its own tx/rx ring so they can process in parallel. But for
> >>>> handling the per-umem cq/fq, I can create a dedicated thread to
> >>>> process cq/fq.
> >>>> So for example:
> >>>> Thread 1 for handling cq/fq
> >>>> Thread 2 for processing queue1 tx/rx queue Thread 3 for processing
> >>>> queue2 tx/rx queue and the mempool should allow multiple producer
> >>>> and consumer.
> >>>>
> >>>> Does this sound correct?
> >>>
> >>> You do not need a dedicated process. Just something in the mempool
> >>> code that enforces mutual exclusion (a mutex or whatever) between
> >>> thread 2 and 3 when they are performing operations on the mempool.
> >>> Going with a dedicated process sounds complicated.
> >>
> >> I was trying to see how to experiment with this using libbpf, but
> >> looks like it=E2=80=99s not yet supported?
> >>
> >> Is see the following in xsk_socket__create():
> >>
> >> 475         if (umem->refcount) {
> >> 476                 pr_warning("Error: shared umems not supported by
> >> libbpf.\n");
> >> 477                 return -EBUSY;
> >> 478         }
> >>
> >
> > Using the XDP_SHARED_UMEM option is not supported in libbpf at this
> > point in time. In this mode you share a single umem with a single
> > completion queue and a single fill queue among many xsk sockets tied
> > to the same queue id. But note that you can register the same umem
> > area multiple times (creating multiple umem handles and multiple fqs
> > and cqs) to be able to support xsk sockets that have different queue
> > ids, but the same umem area. In both cases you need a mempool that can
> > handle multiple threads.
>
> Thinking about libmempool with umem shared among various independent proc=
esses, that would be great.
> So that multiple processes could share same NIC or even queue if register=
ed with all necessary locking in libmempool.
> But what if one process crashes? Wondering how to achieve proper cleanup =
and if it is even possible with architecture I mentioned.
> Maybe with some monitoring thread, but that's complicated. Any ideas?

That is a correct observation. Dealing with failures when processes
share memory is hard. Much easier with a private memory model, but
that usually has negative performance implications. For some
inspiration, you can check "man pthread_mutexattr_getrobust" and how
robust mutexes can be use when a process holding the mutex dies. Makes
the problem a little bit more tractable.

> > The old xdpsock application prior to libbpf had support for the
> > XDP_SHARED_UMEM option. Take a look at that one if you would like to
> > experiment with it.
> >
> > /Magnus
>
> J=C3=BAlius
