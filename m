Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F28273879
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Sep 2020 04:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbgIVC3E (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Sep 2020 22:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbgIVC3E (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Sep 2020 22:29:04 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D61AC061755
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 19:29:04 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id k14so10680312pgi.9
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Sep 2020 19:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oQsC7DD2HAP7+uy5BpEQQMvoRGDAKEGABa6idBhtMlg=;
        b=Hmf/rgNQeZM0VKHZTCHcjBAKJ1sxb+GeJh3Cizlh7uU0aId3W8sFgYeZToyysxTcKx
         0KZiemJP5aWebgOQ+1YHfS5fsjvPQHibMBNLVWtcIfiwAup6NZSLA46Wi1QPCJcgEmiI
         ZoiAuWkjKvYZFryaK9WZpyEZAOw/v0S6+9pRefD1KnwlocTRiMq3vsXgmDJJApMvV/31
         SX7NNSOQ8rggyJbXnywVIIFFgX0S7RbyO5Q0J4Rn4rC0SG9WwI9L7mwpdnq62e2a24bD
         t3n3rSaC3yvphkvJdB3smqO6ojk5WWdAsj0uqE2Et5hOKf8u7zArJ4hJBi5hnkUI4SAI
         PLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oQsC7DD2HAP7+uy5BpEQQMvoRGDAKEGABa6idBhtMlg=;
        b=sT43rh4Y6smo9f7mfj3FLy4IXj+g/j6FerCJuWzsdzW6mq6uT2UDQj9U5l4No69R5h
         gtK21xf/hLCYI4PPF/01EslXIq8MIMTXaatp2BCUnuFLUQI1FzFLoOEBusebo+V3l6sW
         ovB79rKP7bb1axdPtXRvE38NTlp04IiGs3ZoKCESPa6a5vBVXNK6ZBhqzZyI7G4J6MNZ
         wyGT1CoZMIdJ0nwgCZN6BD2S12gZecw0A/79bBQ8EmhbXuZTH4FGyG4AntvT+3URJbms
         XiZ79MvlzyPJEErEiN0s99E6ZujO4M9QkuIRjVEDbWWFBlG57CHWlYhdz9L5YR1rVfOS
         HsUg==
X-Gm-Message-State: AOAM531XJnq/20u7e6dUMC9Z1evNUFqc2KAH1Gzko1Rl9isH0KGp+Iqc
        QCmTkCqamDNuE6FwgrAEPpOD9rE5bY7wWS02PxOIQB5A1vY=
X-Google-Smtp-Source: ABdhPJwW13J5/MZ1Y9fhSjMvyf8tGzhEDfkSfxsxxGobTJufpSntA5kJwr0zFJRblpgbPg+PCxw7ITeWXfbAmW0V2dI=
X-Received: by 2002:a63:4d5b:: with SMTP id n27mr1835189pgl.360.1600741743694;
 Mon, 21 Sep 2020 19:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOfgOfuNuRo_dNO=RJcz1XiK_=hZmdopG12XcUFB_s0No3vsRw@mail.gmail.com>
 <87blhzqxa2.fsf@toke.dk> <CAOfgOft3xQgpxDmrExdJdPoiqcYD=yL0DNRHA6FRkgGKePQTQQ@mail.gmail.com>
 <87zh5jp6r5.fsf@toke.dk>
In-Reply-To: <87zh5jp6r5.fsf@toke.dk>
From:   Topi Wala <walatopi@gmail.com>
Date:   Mon, 21 Sep 2020 19:28:52 -0700
Message-ID: <CAOfgOftCMOv64fZjLCDTcgonCbXuYM+Ot3YPbwin8dfyXR7yaQ@mail.gmail.com>
Subject: Re: xdp-filter troubles
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

You're not the first person to run into the ARP behaviour, BTW. I guess
it may make sense to parse neighbour requests and include them in the IP
filter; feel free to open an issue in the xdp-tools repo for this (or
even better, a pull request!).

Sure, will take a look. There are lots of control packets to be
worried about, especially in the IPv6 world.


On Mon, Sep 21, 2020 at 7:03 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Topi Wala <walatopi@gmail.com> writes:
>
> > Sorry about the subject. I had to forward after using text (default is
> > http in gmail).
> > My kernel version is 5.7.17 (quite new). I am using xdp (ip link show
> > on the device shows the xdp, not xdpgeneric).
> > I'm using bpftool, since this is to deploy to a third party, and using
> > standard linux tools (bpftool, iproute2) is fine, userspace binaries
> > are not.
>
> Heh, that's an interesting policy - I'm guessing whoever set it doesn't
> really understand BPF... :)
>
> > Is there anything I miss by not using the xdp-filter binary?
>
> Well, a nicer user interface?
> But no, technically the BPF side should work just fine, as long as you
> populate the maps correctly. Just don't expect any future changes to
> xdp-filter to take your... interesting... use case into account :)
>
> > However, I think I have figured out the issue, and I'm quite surprised =
by it.
> > It appears that as soon as the xdpfilter program is attached, the arp
> > entry for that IP is discarded from all the entities connected to that
> > bridge.
> > The peer node consequently does an ARP before ping, and since ARP is
> > not an IP packet, it doesn't show up in the bpf log.
> > Since the remote node doesn't get an ARP response (arp request is
> > dropped), it doesn't send the ping packet at all.
>
> Hmm, installing an XDP program does call the netdev notifiers, so I
> guess the iface state can flip, causing the neighbour entries to be
> evicted. In general, it's probably safest to consider loading an XDP
> program to be a potentially destructive event (some physical devices
> will even reconfigure the hardware when this happens). This is only on
> first install, though, swapping between already-installed XDP programs
> should not have such issues.
>
> You're not the first person to run into the ARP behaviour, BTW. I guess
> it may make sense to parse neighbour requests and include them in the IP
> filter; feel free to open an issue in the xdp-tools repo for this (or
> even better, a pull request!).
>
> -Toke
>
