Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D5A6632DB
	for <lists+xdp-newbies@lfdr.de>; Mon,  9 Jan 2023 22:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjAIV2P (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 9 Jan 2023 16:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbjAIV2O (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 9 Jan 2023 16:28:14 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A03BB2
        for <xdp-newbies@vger.kernel.org>; Mon,  9 Jan 2023 13:28:13 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id h192so6813123pgc.7
        for <xdp-newbies@vger.kernel.org>; Mon, 09 Jan 2023 13:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn++7zBzStkOxGioKEbW1KvssDwnyHV0SeT/vp/Mcn4=;
        b=M5YFZak35LKrNGqeXB8Exx2SGorBoCrsi7Aj+m7uHZJMsDRk9AcK4Gipdg/8diATqO
         JfN0CVC7ZKRSEJxuXrQzyO5oDktyUslVgAZtWN8OqmBDSOl/TVJgP6ynG42rrcuO1dTt
         Iyq4/IPPuz9sT9SXxvInESWv68mxMWs4moutjzCFGjYxj5OKd1equhyxU2PtwJtXDXSo
         W/LKB8MHCrYYkl3w/iztWbCy3J73wHymX1ydF8CZwPnhl5XKbxd3d6Tm3uICX44FnBMh
         bAfLrMwMe4d9HshXvWKMrA8BKXURnEQiiV1i9owcGxRaBUqK8lrHgzBaDnBRZbELDurf
         xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn++7zBzStkOxGioKEbW1KvssDwnyHV0SeT/vp/Mcn4=;
        b=yQjxQu+/gCmA2C+MVdyhqt+bjnR1URdBUlxmU8PYnZLc8dabKKLgZvUY6LXQyzyUcH
         ZnTVBv0E2NPBez6caxo/EaD04Tn4D9L8bEJTfLo7I63GBHHiQFmMradwgHYWgDIF1O/5
         Cnu3UBY72WF3JamApUwoiIf1ScDx00HRLq1G486/SFBrTdgcYePxLsXPDJ9hC467If3L
         7peq4Jcr1Vet7eHzwG/8e+GWwGk38xFC6/8o29yL44HRRs39c2uMfUfrR9BfbsaR4ygw
         ugMEbp6aX3YhHius3s1kziSquUIIjA1zvBCaXAnsyE2KPGu/WZRpEWnuJdzIy4uuZScR
         i/0w==
X-Gm-Message-State: AFqh2ko6GrmY4SIGriPNuLhd1/ZeyrRvzPu36OsedxxICDxMea2rIeZD
        Tfr2YH4T3UobS4scIfWFlNFskU6ZPgy+VkQONusyTzEL
X-Google-Smtp-Source: AMrXdXtdcoB1NcUwnW5zCGeEVDmoI5j8Jh819aN9WPC3fn8TkXHEaTA1zbUCMCUf/A1gxJZGklB/ek2MO7nB2Orb2wA=
X-Received: by 2002:a63:d104:0:b0:479:4ab8:4558 with SMTP id
 k4-20020a63d104000000b004794ab84558mr5115114pgg.247.1673299693295; Mon, 09
 Jan 2023 13:28:13 -0800 (PST)
MIME-Version: 1.0
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
 <875yedfvgs.fsf@toke.dk> <CAK3+h2wND2Cqi-6vwCyoFUn35eQYGoYJSBjGF9gfjx3QPMBZ-g@mail.gmail.com>
 <87bknh5fxf.fsf@toke.dk>
In-Reply-To: <87bknh5fxf.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Mon, 9 Jan 2023 13:28:02 -0800
Message-ID: <CAK3+h2xVrKPCusUa3B2QT83Sjq0mNU8c31qXTOGid+UOhaQ7SQ@mail.gmail.com>
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

On Mon, Jan 2, 2023 at 3:34 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > On Wed, Dec 14, 2022 at 2:53 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com> wrote:
> >>
> >> Vincent Li <vincent.mc.li@gmail.com> writes:
> >>
> >> > Hi,
> >> >
> >> > If I have an user space stack like mTCP works on top of AF_XDP as tc=
p
> >> > stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
> >> > or other tcp attack, and redirect good tcp packet back to linux host
> >> > stack after mTCP filtering, is that possible?
> >>
> >> Not really, no. You can inject it using regular userspace methods (say=
,
> >> a TUN device), or using AF_XDP on a veth device. But in both cases the
> >> packet will come in on a different interface, so it's not really
> >> transparent. And performance is not great either.
> >
> > I have thought about it more :) what about this scenario
> >
> >
> > good tcp rst/ack or bad flooding rst/ack -> NIC1 -> mTCP+AF_XDP ->NIC2
> >
> > NIC1 and NIC2 on the same host, drop flooding rst/ack by mTCP,
> > redirect good tcp rst/ack to NIC2, is that possible?
>
> You can do this if NIC2 is a veth device: you inject packets into the
> veth on the TX side, they come out on the other side and from the kernel
> PoV it looks like all packets come in on the peer veth. You'll need to
> redirect packets the other way as well.
>
> > any performance impact?
>
> Yes, obviously :)
>
> >> In general, if you want to filter traffic before passing it on to the
> >> kernel, the best bet is to implement your filtering in BPF and run it =
as
> >> an XDP program.
> >
> > I am thinking for scenario like tcp rst/ack flood DDOS attack to NIC1
> > above, I can't simply drop every rst/ack because there could be
> > legitimate rst/ack, in this case since mTCP can validate legitimate
> > stateful tcp connection, drop flooding rst/ack packet, redirect good
> > rst/ack to NIC2. I am not sure a BPF XDP program attached to NIC1 is
> > able to do stateful TCP packet filtering, does that make sense to you?
>
> It makes sense in the "it can probably be made to work" sense. Not in
> the "why would anyone want to do this" sense. If you're trying to
> protect against SYN flooding using XDP there are better solutions than
> proxying things through a user space TCP stack. See for instance Maxim's
> synproxy patches:
>

SYN flooding is just one of the example, what I have in mind is an
user space TCP/IP stack runs on top of AF_XDP as middle box/proxy for
packet filtering or load balancing, like F5 BIG-IP runs an user space
TCP/IP stack on top of AF_XDP. I thought open source mTCP + AF_XDP
could be a similar use case as middle box.  user space TCP/IP stack +
AF_XDP as middle box/proxy,  the performance is not going to be good?

> https://lore.kernel.org/r/20220615134847.3753567-1-maximmi@nvidia.com

thanks,  it appears it requires iptables rules setup to work with the
synproxy if I recall correctly

>
> -Toke
>
