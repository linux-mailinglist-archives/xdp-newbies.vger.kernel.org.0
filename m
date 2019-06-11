Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56733C719
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 11:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404327AbfFKJS4 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 11 Jun 2019 05:18:56 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:38202 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404428AbfFKJS4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 05:18:56 -0400
Received: by mail-io1-f47.google.com with SMTP id k13so9265939iop.5
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=74U0tTlupcownqdFmumOW/MgKDnub6NJDz3joLIe4uI=;
        b=Xzbv1cTzlkXUfGB533bNgCQzESgaOIwul/6ePJ8t/CZzIWeMTW3za+IcozdSLZ+3El
         58QrFQjmbteYwOBNbv52fuAFgwhs2boLBuaJdO2NDp1eGwmbf6uOcWIXliOYxRhR7pty
         VYCo0gW431HqkTeMoEIjbsJgWFmrtffx+anK3LUiWOgCxjJqp/K/tUzO3vYmQ2R9lYu2
         dmzoFZb4fGNycMs27Aky3HDbMXqteY6c5ibNe3uTBaH5/yBmg+le2h9SX3DIFQ/d6LYN
         iyDt3N6bkDZQblVXL8BZCdaE56oEsnRXGPUcntnkhgR9YGSxlzTkGbAHfRHxdJmwh9ty
         onrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=74U0tTlupcownqdFmumOW/MgKDnub6NJDz3joLIe4uI=;
        b=V1ivExk6u5nzByPwtwknBqT1tLz8zEOB4mDiIt+iQ3PbGAViCfsYkA/JI6ie6McbR+
         ViA9PsPx+lEtHPvNxJWhQvTcFuLxUK4LfK9hLvX+yWLamgNSjnwiiP3G5kOdrhC4n+0n
         0glfmHVTgdMm26a+YcjbJsTg8VRP7RTiFewDrWWmc0hxn7VfLx7K6hruYnSBCiTW152x
         m/rSkY87lcCQ/bbusasCoDZ8eeGwSKuTVsVa/zHI9K1qwfAbrw1FF/q66WGqYMTRwcfj
         qhKpJPgE8SCYFFOqzZ8JPJ4ORmCJe/mHKrHEli07SO3PzWVNveozZG/9xA2zpNPuQA+/
         cu1g==
X-Gm-Message-State: APjAAAVEIXs1wcCGK33e9wJ9ybmmfmgHlHpIAuapU125wp+ZtJZqQGeA
        4Kbgq/h7yNHodrWr7S/mAaTWFLtzqhczIl3TX173IyhuOv4=
X-Google-Smtp-Source: APXvYqxzuvx79iLllb3ypEJKr1Q3kfdHHIGtu89SSCP0Byh8n3LYiJDaR8tTLNhvDdDHvLUDbMgit80UqrUNhRng6Mw=
X-Received: by 2002:a5d:8508:: with SMTP id q8mr31933604ion.31.1560244735296;
 Tue, 11 Jun 2019 02:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
 <20190610121540.36391dc3@carbon>
In-Reply-To: <20190610121540.36391dc3@carbon>
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Tue, 11 Jun 2019 12:18:44 +0300
Message-ID: <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks for the clarification.
I used ethtool_stats.pl script and realized total dropped packets are
sum of fdir_miss and rx_missed_errors.
Here I observed sometimes fdir_miss increase to 1-2m and
rx_missed_errors drop about same amount but their total not change.

Show adapter(s) (enp7s0f0) statistics (ONLY that changed!)
Ethtool(enp7s0f0) stat:       153818 (        153,818) <=3D fdir_miss /sec
Ethtool(enp7s0f0) stat:      9060176 (      9,060,176) <=3D rx_bytes /sec
Ethtool(enp7s0f0) stat:    946625059 (    946,625,059) <=3D rx_bytes_nic /s=
ec
Ethtool(enp7s0f0) stat:     14694930 (     14,694,930) <=3D rx_missed_error=
s /sec

As you can see, In my tests I dropped about 15m packets successfully.
After that I did some latency tests and get some bad results.
I loaded a xdp code that drops only udp packets. I connected 2 packet
sender through a switch. One of them I sent flood udp ddos. From other
one I just send ping and observed latency.
Here is results.
latency when there is no attack.

# ping -c 10 10.0.0.213
PING 10.0.0.213 (10.0.0.213) 56(84) bytes of data.
64 bytes from 10.0.0.213: icmp_seq=3D1 ttl=3D64 time=3D0.794 ms
64 bytes from 10.0.0.213: icmp_seq=3D2 ttl=3D64 time=3D0.435 ms
64 bytes from 10.0.0.213: icmp_seq=3D3 ttl=3D64 time=3D0.394 ms
64 bytes from 10.0.0.213: icmp_seq=3D4 ttl=3D64 time=3D0.387 ms
64 bytes from 10.0.0.213: icmp_seq=3D5 ttl=3D64 time=3D0.479 ms
64 bytes from 10.0.0.213: icmp_seq=3D6 ttl=3D64 time=3D0.487 ms
64 bytes from 10.0.0.213: icmp_seq=3D7 ttl=3D64 time=3D0.458 ms
64 bytes from 10.0.0.213: icmp_seq=3D8 ttl=3D64 time=3D0.536 ms
64 bytes from 10.0.0.213: icmp_seq=3D9 ttl=3D64 time=3D0.499 ms
64 bytes from 10.0.0.213: icmp_seq=3D10 ttl=3D64 time=3D0.391 ms

--- 10.0.0.213 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9202ms
rtt min/avg/max/mdev =3D 0.387/0.486/0.794/0.113 ms


latency when there is 150k attack

# ping -c 10 10.0.0.213
PING 10.0.0.213 (10.0.0.213) 56(84) bytes of data.
64 bytes from 10.0.0.213: icmp_seq=3D1 ttl=3D64 time=3D43.4 ms
64 bytes from 10.0.0.213: icmp_seq=3D2 ttl=3D64 time=3D8.26 ms
64 bytes from 10.0.0.213: icmp_seq=3D4 ttl=3D64 time=3D47.1 ms
64 bytes from 10.0.0.213: icmp_seq=3D5 ttl=3D64 time=3D2.51 ms
64 bytes from 10.0.0.213: icmp_seq=3D6 ttl=3D64 time=3D1.43 ms
64 bytes from 10.0.0.213: icmp_seq=3D7 ttl=3D64 time=3D40.6 ms
64 bytes from 10.0.0.213: icmp_seq=3D8 ttl=3D64 time=3D44.2 ms
64 bytes from 10.0.0.213: icmp_seq=3D9 ttl=3D64 time=3D38.0 ms
64 bytes from 10.0.0.213: icmp_seq=3D10 ttl=3D64 time=3D50.5 ms

--- 10.0.0.213 ping statistics ---
10 packets transmitted, 9 received, 10% packet loss, time 9060ms

latency when there is 800k attack

# ping -c 10 10.0.0.213
PING 10.0.0.213 (10.0.0.213) 56(84) bytes of data.
64 bytes from 10.0.0.213: icmp_seq=3D4 ttl=3D64 time=3D0.395 ms
64 bytes from 10.0.0.213: icmp_seq=3D5 ttl=3D64 time=3D0.359 ms
64 bytes from 10.0.0.213: icmp_seq=3D8 ttl=3D64 time=3D30.3 ms

--- 10.0.0.213 ping statistics ---
10 packets transmitted, 3 received, 70% packet loss, time 9246ms
rtt min/avg/max/mdev =3D 0.359/10.376/30.376/14.142 ms

latency when there is 1.6m attack

# ping -c 10 10.0.0.213
PING 10.0.0.213 (10.0.0.213) 56(84) bytes of data.
64 bytes from 10.0.0.213: icmp_seq=3D2 ttl=3D64 time=3D34.7 ms

--- 10.0.0.213 ping statistics ---
10 packets transmitted, 1 received, 90% packet loss, time 9205ms
rtt min/avg/max/mdev =3D 34.756/34.756/34.756/0.000 ms

latency when there is 2.4m attack

# ping -c 10 10.0.0.213
PING 10.0.0.213 (10.0.0.213) 56(84) bytes of data.
From 10.0.0.214 icmp_seq=3D10 Destination Host Unreachable

--- 10.0.0.213 ping statistics ---
10 packets transmitted, 0 received, +1 errors, 100% packet loss, time 9229m=
s

After that all ping stop as you can see. I don't know how to debug
that latency. I believe I need to do some tuning but I don't know what
it is. I tried to enable jit but nothing changed.
If xdp cause this latency, than it is useless for me. Can you help me
to understand its cause?

On Mon, Jun 10, 2019 at 1:15 PM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
> On Mon, 10 Jun 2019 12:55:07 +0300
> =C4=B0brahim Ercan <ibrahim.metu@gmail.com> wrote:
>
> > Hi.
> > I'm trying to do a xdp performance test on redhat based environment.
> > To do so, I compiled kernel 5.0.13 and iproute 4.6.0
> > Then I loaded compiled code to interface with below command.
> > #ip -force link set dev enp7s0f0 xdp object xdptest.o
> >
> > After that packets dropped as expected but I can not see statistics
> > with ethtool command like below.
> > #ethtool -S enp7s0f0 | grep xdp
> >
> > ethtool version is 4.8
> > I did my test with that NIC
> > Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (rev 0=
1)
> >
> > I wonder why I can't see statistics. Did I miss something while
> > compiling kernel or iproute? Should I also compile ethtool too?
>
> You did nothing wrong. Consistency for statistics with XDP is a known
> issue, see [1].  The behavior varies per driver, which obviously is bad
> from a user perspective.  You NIC is based on ixgbe driver, which don't
> have ethtool stats counters for XDP, instead it actually updates
> ifconfig counters correctly. While for mlx5 it's opposite (p.s. I use
> this[2] ethtool stats tool).
>
> We want to bring consistency in this area, but there are performance
> concerns.  As any stat counter will bring overhead, and XDP is all
> about maximum performance.  Thus, we want this counter overhead to be
> opt-in (that is not on as default).
>
> Currently you have to add the stats your want to the XDP/BPF program
> itself.  That is the current opt-in mechanism.  To help you coded this,
> we have an example here[3].
>
>
> [1] https://github.com/xdp-project/xdp-project/blob/master/xdp-project.or=
g#consistency-for-statistics-with-xdp
> [2] https://github.com/netoptimizer/network-testing/blob/master/bin/ethto=
ol_stats.pl
> [3] https://github.com/xdp-project/xdp-tutorial/blob/master/common/xdp_st=
ats_kern.h
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
>
