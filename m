Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4859DEA1E6
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Oct 2019 17:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfJ3QjP (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Oct 2019 12:39:15 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37873 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726552AbfJ3QjP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Oct 2019 12:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572453553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Do835m/Xy08Op9hU02CFbeyd7EOGGXkxpytnbAadDWE=;
        b=MiVrBn0wnhh/O8e4dOAfuPAoNFiYCoDEA9GWFI+mzw//K+MqMAyhzQgdLtPrRfQ16TLqG1
        hkQqFdCTAH3D13m1Q/kThJkOe7FDBejcwziEnD2BJ0fz5dm1gPzGZFSIgidao31YKjB8Mw
        xETs7H4EwWl5d2OYbfwRpfKnnxa7E98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-nXUSerCJNSydLevAX-KL7g-1; Wed, 30 Oct 2019 12:39:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD222EDD;
        Wed, 30 Oct 2019 16:39:09 +0000 (UTC)
Received: from carbon (ovpn-200-19.brq.redhat.com [10.40.200.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B7D660872;
        Wed, 30 Oct 2019 16:39:03 +0000 (UTC)
Date:   Wed, 30 Oct 2019 17:39:02 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Ilya Goslhtein <ilejn@yandex.ru>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
Message-ID: <20191030173902.09311289@carbon>
In-Reply-To: <ac54dbc6-245a-c1b6-4bef-47296c69ec75@yandex.ru>
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
        <87imq0ut8l.fsf@toke.dk>
        <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
        <87a7bcusg3.fsf@toke.dk>
        <ac54dbc6-245a-c1b6-4bef-47296c69ec75@yandex.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nXUSerCJNSydLevAX-KL7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On Wed, 30 Oct 2019 18:44:27 +0300 Ilya Goslhtein <ilejn@yandex.ru> wrote:

> Hello,
>=20
> playing with xdpbridge https://github.com/ilejn/xdpbridge/ I've observed=
=20
> a limitation which is serious for me.

Hmm... I took a short look at your code.

Sorry for this candid/blunt evaluation: I think you are doing it wrong.
Both on how you use other FOSS code and how you use BPF/XDP.

First of all you are using bpf_load.c[1], which everybody should stop
using (sorry, I know I sort of started that trend).  Instead everybody
should use libbpf[2].  Second you have copied over bpf_load.c and
re-indented the entire file, which is bad, because it makes it very
hard to track the difference between the original FOSS project and your
project.

You *also* use libbpf, but directly from the kernel tree.  We don't
recommend doing it this way.  Facebook engineers are maintaining a
libbpf mirror on github[2], which can be used as a git-submodule.
Before all distros start shipping libbpf, the easiest way to get
started is to use libbpf as a git-submodule.

[1] https://github.com/ilejn/xdpbridge/blob/master/bpf_load.c
[2] https://github.com/libbpf/libbpf


> xdpbridge is basically a combination of xdp_redirect_map sample=20
> (world=3D>client path) and slightly more advanced l2fwd mode of xdpsock=
=20
> (client=3D>world path), =20
> where AF_XDP sockets are bound to two different interfaces (vanilla=20
> l2fwd mode uses same interface as ingress and egress) and where=20
> multithreading is supported.

IMHO choosing AF_XDP for a bridge implementation is the wrong approach.
I would implement this in the XDP BPF-program, and use fallback to the
normal Linux bridging code (for broadcasting, ARP etc).


> xdpbridge sets options for client and egress interfaces independently.
>=20
> So, setting zerocopy bind flag for world interface (-z command line=20
> parameter) prevents this interface from working as ingress for=20
> world=3D>client path, although different queues are used. No errors, just=
  =20
> no data transfer.

Sounds like you want part of the traffic to reach the normal kernel
networking stack.  In that case, the XDP program should sort that out
(and call XDP_PASS) before doing the XDP_REDIRECT step into AF_XDP.

=20
> It would be nice to understand if this issue fundamental or specific
> for the kernel (5.0.0-31-generic #33~18.04.1-Ubuntu) or card (Intel=20
> Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 01))
> or driver.
> Or, may be, it is just my mistake.
>=20
> I do appreciate any comments or suggestions.

I'm glad that you are open to feedback.

I recommend you look at our XDP-tutorial[3], to see an example of how
Toke and I recommend structuring a project that want to use XDP/BPF.


[3] https://github.com/xdp-project/xdp-tutorial
--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer


=20
> On 10.09.2019 17:38, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > Ilya Goslhtein <ilejn@yandex.ru> writes:
> > =20
> >> Hello Toke,
> >>
> >> thanks for the response.
> >>
> >> I do not think that it is the case.
> >>
> >> The interface I am trying to share is outgoing for xdpbridge and
> >> incoming for xdp_bridge_map.
> >>
> >> xdpbridge does not load xdp program for outgoing interface (while load=
s
> >> for incoming).
> >>
> >> xdp_bridge_map loads dummy XDP program for outgoing redirect, while it
> >> is Ok if it is already exists.
> >>
> >>
> >> It seems that if I use different queues for incoming and outgoing
> >> packets, everything is Ok, while I am not 100% sure yet. Does it look
> >> realistic? =20
> > Oh, right, yeah, the AF_XDP socket will need to configure a hardware
> > queue to use; depending on your hardware, that could be incompatible
> > with running a regular XDP program on the same hardware queue.
> >
> > Incidently, we are working on a way to make this work better; talk
> > starts in five minutes at LPC:
> > https://linuxplumbersconf.org/event/4/contributions/462/
> >
> > -Toke =20
>=20



