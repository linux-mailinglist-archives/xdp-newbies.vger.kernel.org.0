Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D53A06646A5
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Jan 2023 17:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238803AbjAJQz3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 11:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239032AbjAJQzL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 11:55:11 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF564E405
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 08:55:05 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id g16so13790025plq.12
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TadKKTNPfS4tO2gT8iqSOeA4Wxia1oTZGYNasoQx214=;
        b=FgzzmcjQeF9ws1FqUu/xYSpvGyd+u+W++5qVy251dHJ49DeFbG9p6YJUOMXodKYNrE
         AAkgdCCKftpK3jQm6Hke++1VCJ9O0CLR+wh3izjmye/pFsDckH21OpYvAnQHfSFM5p3P
         8XU/Y5fWuVypqrh6q1vUlCNPRxAUqtVDf6g5UeFU7VxThcL1EycHoXngxBExqInHsNiY
         KAgBPNuGPZNo2JQzBLOf9sEvgT5DGnQJgOCNWysXFU2gjvD5k9phNJ2MLeC1qA0C+FkW
         CmvkMykwwLcQd1+D3wqK5aFpAQyFzxUcbUMa/c9pj+I7iB/Ja41UsdjVZ24amFNR2jxP
         Ua5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TadKKTNPfS4tO2gT8iqSOeA4Wxia1oTZGYNasoQx214=;
        b=Boec7ZnTw8FSVYvu0uiMWEvYOkXuaAUyF6aaNfzl2xR1Rf+yb3SsGdu/yaKX+wmeFA
         qkrQtnofwbpDI0BaRFP8hm/XlzIE8Nl8A+IrY5XwOViynhUbgaYUXyIgYpXfALtAdnK1
         2IsIieXFauZ+4o3WcWn0JqZz0a5sSavgHWeAodowlT65c+MLQmrpE6RfpgPZLZQaYbHA
         TFV2Lz69Dp3B69o3hMgEyy5mSVZ3UMvn+hvH09uNsbwT8w1H0F+PEzLsZ8sLy31PuGnQ
         ne4mYb2qAU/NZB6sOT9Kn+5fIaF2E8s9VWVUO3if4Fxk4Vy9qynHv9znXskB1Wf/KyRU
         Oz+Q==
X-Gm-Message-State: AFqh2kpnYoPDh9hnHAVa6YTvYf/25hdF32BdvadQa5yoAEUolj49UiM/
        wPgfrHWQKerDQKneY/F8N95miipdsg5S7FZOYcIBPg1H
X-Google-Smtp-Source: AMrXdXuah94uKs1MQWHD/9lPq6LT2JCnwRqtK18jsSZgcdk2xi3uqI2D+bZr2RxUcyNe0o5R1LxzFheEx4PsMa/jhsU=
X-Received: by 2002:a17:90a:5b:b0:227:203c:6071 with SMTP id
 27-20020a17090a005b00b00227203c6071mr628472pjb.167.1673369705379; Tue, 10 Jan
 2023 08:55:05 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk> <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
 <87bknh5fxf.fsf@toke.dk> <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
 <87tu0yh0r6.fsf@toke.dk>
In-Reply-To: <87tu0yh0r6.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Tue, 10 Jan 2023 08:54:54 -0800
Message-ID: <CAK3+h2wQo2LUDqaqymTz=kJ08tBy_m4C6KieBsn-PLn_PbY6Og@mail.gmail.com>
Subject: Re: Redirect packet back to host stack after AF_XDP?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Jan 10, 2023 at 7:23 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > On Mon, Jan 2, 2023 at 3:34 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@r=
edhat.com> wrote:
> >>
> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >>
> >> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <to=
ke@redhat.com> wrote:
> >> >>
> >> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >> >>
> >> >> > Hi,
> >> >> >
> >> >> > If I have an user space stack like mTCP works on top of AF_XDP as=
 tcp
> >> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack fl=
ood
> >> >> > or other tcp attack, and redirect good tcp packet back to linux h=
ost
> >> >> > stack after mTCP filtering, is that possible?
> >> >>
> >> >> Not really, no. You can inject it using regular userspace methods (=
say,
> >> >> a TUN device), or using AF_XDP on a veth device. But in both cases =
the
> >> >> packet will come in on a different interface, so it's not really
> >> >> transparent. And performance is not great either.
> >> >
> >> > I have thought about it more :) what about this scenario
> >> >
> >> >
> >> > good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->NI=
C2
> >> >
> >> > NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
> >> > redirect good tcp rst/ack to NIC2, is that possible?
> >>
> >> You can do this if NIC2 is a veth device: you inject packets into the
> >> veth on the TX side, they come out on the other side and from the kern=
el
> >> PoV it looks like all packets come in on the peer veth. You'll need to
> >> redirect packets the other way as well.
> >>
> >> > any performance impact?
> >>
> >> Yes, obviously :)
> >>
> >> >> In general, if you want to filter traffic before passing it on to t=
he
> >> >> kernel, the best bet is to implement your filtering in BPF and run =
it as
> >> >> an XDP program.
> >> >
> >> > I am thinking for scenario like tcp rst/ack flood DDOS attack to NIC=
1
> >> > above, I can't simply drop every rst/ack because there could be
> >> > legitimate rst/ack, in this case since mTCP can validate legitimate
> >> > stateful tcp connection, drop flooding rst/ack packet, redirect good
> >> > rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
> >> > able to do stateful TCP packet filtering, does that make sense to yo=
u?
> >>
> >> It makes sense in the "it can probably be made to work" sense. Not in
> >> the "why would anyone want to do this" sense. If you're trying to
> >> protect against SYN flooding using XDP there are better solutions than
> >> proxying things through a user space TCP stack. See for instance Maxim=
's
> >> synproxy patches:
> >>
> >
> > SYN flooding is just one of the example, what I have in mind is an
> > user space TCP/IP stack runs on top of AF_XDP as middle box/proxy for
> > packet filtering or load balancing, like F5 BIG-IP runs an user space
> > TCP/IP stack on top of AF_XDP. I thought open source mTCP + AF_XDP
> > could be a similar use case as middle box.  user space TCP/IP stack +
> > AF_XDP as middle box/proxy,  the performance is not going to be good?
>
> Well, you can certainly build a proxy using AF_XDP by intercepting all
> the traffic and bridging it onto a veth device, say. I've certainly
> heard of people doing that. It'll have some non-trivial overhead,
> though; even if AF_XDP is fairly high performance, you're still making
> all traffic take an extra hop through userspace, and you'll lose
> features like hardware TSO, etc. Whether it can be done with "good"
> performance depends on your use case, I guess (i.e., how do you define
> "good performance"?).
>
> I guess I don't really see the utility in having a user-space TCP stack
> be a middlebox? If you're doing packet-level filtering, you could just
> do that in regular XDP (and the same for load balancing, see e.g.,
> Katran), and if you want to do application-level filtering (say, a WAF),
> you could just use the kernel TCP stack?
>

the reason I mention user-space TCP stack is user space stack appears
performs better than kernel TCP stack, and we see user-space stack +
DPDK for high speed packet processing applications out there, since
XDP/AF_XDP seems to be competing with DPDK, so I thought why not user
space stack + AF_XDP :)

> >> https://lore.kernel.org/r/20220615134847.3753567-1-maximmi@nvidia.com
> >
> > thanks,  it appears it requires iptables rules setup to work with the
> > synproxy if I recall correctly
>
> Might be; not familiar with the details of that...
>
> -Toke
>
