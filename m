Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EBA471BA5
	for <lists+xdp-newbies@lfdr.de>; Sun, 12 Dec 2021 17:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhLLQra (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 12 Dec 2021 11:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54306 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231694AbhLLQra (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 12 Dec 2021 11:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639327649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uRmHOl2gIKGXSfVnHAP3BRqFDZYF82oWzSnLV9Rkuv4=;
        b=SiFE3wlIi/DqHYx9IEgq2wzN7lEMoitfdpYQJLyJaDs+MSNhsDFzPFspDGo6sNDMPAhT9D
        ZmCfC1CtvQyPt4bk2o6Hn+w8MLd11lRZKdHgtXikcwZ7VjP/RzS167TKFgJ1qnGnrM3mZP
        VqdrkidvuEMJ8FpxCkRYzQlnEN1e0P8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-DCUnOlYnOay154DublSkIA-1; Sun, 12 Dec 2021 11:47:28 -0500
X-MC-Unique: DCUnOlYnOay154DublSkIA-1
Received: by mail-ed1-f70.google.com with SMTP id eg20-20020a056402289400b003eb56fcf6easo11923812edb.20
        for <xdp-newbies@vger.kernel.org>; Sun, 12 Dec 2021 08:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=uRmHOl2gIKGXSfVnHAP3BRqFDZYF82oWzSnLV9Rkuv4=;
        b=XwoexYBER4TEg+bQ4+2qtWCwhmMHMDiLNwMglG8b5fDr36vyH0xw42zaPEKwk+mk6X
         2BnfQB6n15g7/87qIKBdIsgKkICT6ruZuQUGFEwMTicAaBpJ7yxcT+DaOAaL07CiFHUo
         U32wAENgFBkrCxlBqmJPXLym9FUooiq//C+YtvSPvpYeXnW+1/tL1b4XXntldWxIHnaY
         W+IiK7KNINaOWqMpn0LwdBq1+oeh0byuOhQizdszvS8gr0fDpR9YsbYjJv967XMkm4B7
         XG861+8XydyAEfyDjq1hEex7jzpH+7BU+EGxxBnRK0v1WWss6lv+bnFOi+oSqXrdMWgR
         YWLw==
X-Gm-Message-State: AOAM531vh3kh7dcpP7ZD9iRZIC/iHIGsMk2EsOyxc2XE1nmJie9RqixS
        p0pcDr20Ipy+VS5mPLrjokCmr5wol4ZzWroPp3G0JTDJXQ2mXjBUTzEhMQ0A+0kJoy3wIBnF4wX
        VNdwFwekakYmzv1J1axML4gY=
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr55989835edq.370.1639327645751;
        Sun, 12 Dec 2021 08:47:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6k4ZMto2uGSBsq1JjGOgZ14wT9MeC4XjErtMJOm01l3VUDJ8X+r5xbahE0om6TDJBS4gvnQ==
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr55989705edq.370.1639327644574;
        Sun, 12 Dec 2021 08:47:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id sd28sm4901682ejc.37.2021.12.12.08.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 08:47:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5869D180440; Sun, 12 Dec 2021 17:47:23 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Lorenzo Mainardi <lormayna@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Newbie help
In-Reply-To: <CACLEbghzZw=cxAZGxU4fYqfUeojw1yt9RF0cHBiDOux0K0=LaQ@mail.gmail.com>
References: <CACLEbghzZw=cxAZGxU4fYqfUeojw1yt9RF0cHBiDOux0K0=LaQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sun, 12 Dec 2021 17:47:23 +0100
Message-ID: <87h7bdhisk.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Lorenzo Mainardi <lormayna@gmail.com> writes:

> Hello everyone,
> I am trying to follow this tutorial
> (https://developers.redhat.com/blog/2021/04/01/get-started-with-xdp)
> to learn XDP.
>
> So I compiled my XDP program and then attached it to an interface:
>
> lorenzo@kwaremont:~/progetti/xdp_test$ ip addr show eno1
> 2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,DYNAMIC,UP> mtu 1500
> xdpgeneric/id:37 qdisc pfifo_fast state DOWN group default qlen 1000
>     link/ether 8c:dc:d4:8e:38:c7 brd ff:ff:ff:ff:ff:ff
>     altname enp9s0
>     inet 10.0.8.1/24 scope global eno1
>        valid_lft forever preferred_lft forever
> lorenzo@kwaremont:~/progetti/xdp_test$ ping 10.0.8.1
> PING 10.0.8.1 (10.0.8.1) 56(84) bytes of data.
> 64 bytes from 10.0.8.1: icmp_seq=1 ttl=64 time=0.047 ms
> 64 bytes from 10.0.8.1: icmp_seq=2 ttl=64 time=0.033 ms
> ^C
> --- 10.0.8.1 ping statistics ---
> 2 packets transmitted, 2 received, 0% packet loss, time 1018ms
> rtt min/avg/max/mdev = 0.033/0.040/0.047/0.007 ms
>
> Anyway, it seems that the program is not dropping packets. Is there
> any way to troubleshoot it? Where am I wrong?

Erm, you're pinging the interface from within the machine itself? That
will never hit the XDP hook of the interface, those packets just go over
loopback.

XDP processes packets on ingress, when they arrive *on that interface*.
So you'll have to try the ping from outside the machine itself (although
from the NO-CARRIER flag on the interface it looks like it's not
actually connected to anything?).

For testing, it can be useful to use virtual Ethernet (veth) devices;
they have full support for XDP. The XDP tutorial will help you get setup
to use those: https://github.com/xdp-project/xdp-tutorial

-Toke

