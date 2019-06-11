Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF313CCCA
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Jun 2019 15:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390311AbfFKNSa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 11 Jun 2019 09:18:30 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:51987 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387864AbfFKNS3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Jun 2019 09:18:29 -0400
Received: by mail-it1-f196.google.com with SMTP id m3so4848354itl.1
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Jun 2019 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cy6MMiZTmc78cUu7V8PmBMxix6UBJ211NT4sPOOfZNM=;
        b=opO6yeBdNF1tsfOjFuB4/lrz34dtcZm0qGbWu0MS5T2q4i11ckBMERYymPXEGdUxtf
         /7lJp6nM5vduiTVuniKwPI+vwNnTTHfh9dA3EPwYbOn7ihHN3+5ST6mglUQvjzowdDzH
         UGd05/3sdcNuEY2IWDo4lvH72YiwXdrqEwAluqW1HDzWsROhjsgperSWKbt6FCH809Vl
         zUYTsrJnrN2y6opHbehJg+Z0o2YEmihKqw3HjVX1/XfO3ZXKkmsDT8ruNRDkmkDEt1Ot
         D1spuaweBm/h5NninbLvzztTue+B4vUfbGgj4APT9iOSyvL3tVlaEKWJD7I5G3fbakSy
         StQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cy6MMiZTmc78cUu7V8PmBMxix6UBJ211NT4sPOOfZNM=;
        b=TkP+rDQ14R/E1EF6voUma2Klq7WIENu5UzOPK6Xi7Igvy+R7fzzVpwDSXSkdCbdmCm
         njs1v4i4b3C36ll26eSb1MVb0q4TsGgjCa+LPkj7bMvS+Q5IgDhJDO4TNKkNwzP5mj7w
         R1tH699VEzEZJ2hu9IZJEvBkgV/hmn8Ph1QkGR4qPTU5o1txRsBdpGYohseYs3Jfnhu1
         xQAPQDCgWOXY5WEoKR1/yZKO2edG0eRmC3PR0E9J5pahcU1BcwjLbb0teUFYNKZv7g6f
         SrPKN3NeQ/J8Rx+tmV3OB5aYYNLb3WYqXvpoHTXIqfykDdbVnloUFxbRNWxCo1JyZVAa
         AlVA==
X-Gm-Message-State: APjAAAW7d6fpgUtoEf6YfLb4vz48MJ/lzDcQJS5Ex0rekdKpHcH/LZKg
        5p7BYpsq0m4od6fnBhskdLb81XVLIgCfj4a8cS0FNCzjz3E=
X-Google-Smtp-Source: APXvYqzJXyX2j71Re3iIg3Hdr987811bJH4HXgj7nbnICoEt1E1C0l0fDEII0pcAE+8bDtUjii0NfNFRnV/yE4ZWlKM=
X-Received: by 2002:a24:2407:: with SMTP id f7mr13657471ita.21.1560259108807;
 Tue, 11 Jun 2019 06:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK6Qs9=ig3-PWKtSk7UJfm1gcWz9cSGYU7uDxxUw=xju5TtP9w@mail.gmail.com>
 <20190610121540.36391dc3@carbon> <CAK6Qs9mdViRXL5BhafcUdv06inVF0ZuciBX1zPNasRYw3We9-g@mail.gmail.com>
 <20190611124119.49a0e440@carbon>
In-Reply-To: <20190611124119.49a0e440@carbon>
From:   =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Date:   Tue, 11 Jun 2019 16:18:17 +0300
Message-ID: <CAK6Qs9mncU4E-ZBSb8RNZrGqUyruU4of-fStr9vhLVmCVHg+TA@mail.gmail.com>
Subject: Re: ethtool isn't showing xdp statistics
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Is there any other package or library that I should upgrade besides
kernel and iproute?

I used this code example
https://gist.github.com/fntlnz/f6638d59e0e39f0993219684d9bf57d3
Compiled as
clang -O2 -Wall -target bpf -c dropudp.c -o dropudp.o

and loaded with
./ip -force link set dev enp7s0f0 xdp object dropudp.o sec prog

I also realized that after loading xdp code, network go down about 5
second, Is that normal?
Im using bridged topology. I don't know it is important or not.
# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.00900b3b696c       yes                 enp7s0f0

          enp7s0f1

And this is my related kernel config parameters.
~# egrep -ie "xdp|bpf" /boot/config-5.0.13-1.lbr.x86_64
# CONFIG_CGROUP_BPF is not set
CONFIG_BPF=3Dy
CONFIG_BPF_SYSCALL=3Dy
# CONFIG_BPF_JIT_ALWAYS_ON is not set
CONFIG_XDP_SOCKETS=3Dy
CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
# CONFIG_BPFILTER is not set
# CONFIG_NET_CLS_BPF is not set
# CONFIG_NET_ACT_BPF is not set
CONFIG_BPF_JIT=3Dy
CONFIG_HAVE_EBPF_JIT=3Dy
CONFIG_BPF_EVENTS=3Dy
# CONFIG_BPF_KPROBE_OVERRIDE is not set
# CONFIG_TEST_BPF is not set

clang version
# clang --version
clang version 5.0.1 (tags/RELEASE_501/final)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /opt/rh/llvm-toolset-7/root/usr/bin

I really wonder what is wrong with my configuration :/


On Tue, Jun 11, 2019 at 1:46 PM Jesper Dangaard Brouer
<brouer@redhat.com> wrote:
>
> On Tue, 11 Jun 2019 12:18:44 +0300
> =C4=B0brahim Ercan <ibrahim.metu@gmail.com> wrote:
>
> > Thanks for the clarification.
> > I used ethtool_stats.pl script and realized total dropped packets are
> > sum of fdir_miss and rx_missed_errors.
> > Here I observed sometimes fdir_miss increase to 1-2m and
> > rx_missed_errors drop about same amount but their total not change.
> >
> > Show adapter(s) (enp7s0f0) statistics (ONLY that changed!)
> > Ethtool(enp7s0f0) stat:     153818 (      153,818) <=3D fdir_miss /sec
> > Ethtool(enp7s0f0) stat:    9060176 (    9,060,176) <=3D rx_bytes /sec
> > Ethtool(enp7s0f0) stat:  946625059 (  946,625,059) <=3D rx_bytes_nic /s=
ec
> > Ethtool(enp7s0f0) stat:   14694930 (   14,694,930) <=3D rx_missed_error=
s /sec
> >
> > As you can see, In my tests I dropped about 15m packets successfully.
>
> Sorry, but your output with 14,694,930 rx_missed_errors /sec, shows
> something is *very* wrong with your setup.  The rx_missed_errors (for
> ixgbe) is not your XDP_DROP number.  The rx_missed_errors is a hardware
> Missed Packet Counter (MPC register).  So, the packets are being
> dropped by HW.
>
>
> > After that I did some latency tests and get some bad results.
> > I loaded a xdp code that drops only udp packets. I connected 2 packet
> > sender through a switch. One of them I sent flood udp ddos. From other
> > one I just send ping and observed latency.
> > Here is results.
>
> [cut]
> We first need to figure out what is wrong with your setup, since the
> NIC hardware is dropping packets.
>
> Here is output from my testlab, so you have a baseline of what numbers
> to expect.
>
> XDP dropping packets via:
>
> sudo ./xdp_rxq_info --dev ixgbe2 --action XDP_DROP
>
>  Running XDP on dev:ixgbe2 (ifindex:9) action:XDP_DROP options:no_touch
>  XDP stats       CPU     pps         issue-pps
>  XDP-RX CPU      4       14,705,913  0
>  XDP-RX CPU      total   14,705,913
>
>  RXQ stats       RXQ:CPU pps         issue-pps
>  rx_queue_index    1:4   14,705,882  0
>  rx_queue_index    1:sum 14,705,882
>
>
> My ethtool_stats.pl output:
>
> Show adapter(s) (ixgbe2) statistics (ONLY that changed!)
> Ethtool(ixgbe2  ) stat:   15364178 (   15,364,178) <=3D fdir_miss /sec
> Ethtool(ixgbe2  ) stat:  881716018 (  881,716,018) <=3D rx_bytes /sec
> Ethtool(ixgbe2  ) stat:  952151488 (  952,151,488) <=3D rx_bytes_nic /sec
> Ethtool(ixgbe2  ) stat:     182070 (      182,070) <=3D rx_missed_errors =
/sec
> Ethtool(ixgbe2  ) stat:   14695267 (   14,695,267) <=3D rx_packets /sec
> Ethtool(ixgbe2  ) stat:   14695291 (   14,695,291) <=3D rx_pkts_nic /sec
> Ethtool(ixgbe2  ) stat:  881714129 (  881,714,129) <=3D rx_queue_1_bytes =
/sec
> Ethtool(ixgbe2  ) stat:   14695235 (   14,695,235) <=3D rx_queue_1_packet=
s /sec
> Ethtool(ixgbe2  ) stat:        596 (          596) <=3D tx_flow_control_x=
off /sec
>
> (It even shows that I forgot to disable Ethernet flow control, via
> tx_flow_control_xoff).
>
> --Jesper
>
>
> > On Mon, Jun 10, 2019 at 1:15 PM Jesper Dangaard Brouer
> > <brouer@redhat.com> wrote:
> > >
> > > On Mon, 10 Jun 2019 12:55:07 +0300
> > > =C4=B0brahim Ercan <ibrahim.metu@gmail.com> wrote:
> > >
> > > > Hi.
> > > > I'm trying to do a xdp performance test on redhat based environment=
.
> > > > To do so, I compiled kernel 5.0.13 and iproute 4.6.0
> > > > Then I loaded compiled code to interface with below command.
> > > > #ip -force link set dev enp7s0f0 xdp object xdptest.o
> > > >
> > > > After that packets dropped as expected but I can not see statistics
> > > > with ethtool command like below.
> > > > #ethtool -S enp7s0f0 | grep xdp
> > > >
> > > > ethtool version is 4.8
> > > > I did my test with that NIC
> > > > Intel Corporation 82599ES 10-Gigabit SFI/SFP+ Network Connection (r=
ev 01)
> > > >
> > > > I wonder why I can't see statistics. Did I miss something while
> > > > compiling kernel or iproute? Should I also compile ethtool too?
> > >
> > > You did nothing wrong. Consistency for statistics with XDP is a known
> > > issue, see [1].  The behavior varies per driver, which obviously is b=
ad
> > > from a user perspective.  You NIC is based on ixgbe driver, which don=
't
> > > have ethtool stats counters for XDP, instead it actually updates
> > > ifconfig counters correctly. While for mlx5 it's opposite (p.s. I use
> > > this[2] ethtool stats tool).
> > >
> > > We want to bring consistency in this area, but there are performance
> > > concerns.  As any stat counter will bring overhead, and XDP is all
> > > about maximum performance.  Thus, we want this counter overhead to be
> > > opt-in (that is not on as default).
> > >
> > > Currently you have to add the stats your want to the XDP/BPF program
> > > itself.  That is the current opt-in mechanism.  To help you coded thi=
s,
> > > we have an example here[3].
> > >
> > >
> > > [1] https://github.com/xdp-project/xdp-project/blob/master/xdp-projec=
t.org#consistency-for-statistics-with-xdp
> > > [2] https://github.com/netoptimizer/network-testing/blob/master/bin/e=
thtool_stats.pl
> > > [3] https://github.com/xdp-project/xdp-tutorial/blob/master/common/xd=
p_stats_kern.h
> > > --
> > > Best regards,
> > >   Jesper Dangaard Brouer
> > >   MSc.CS, Principal Kernel Engineer at Red Hat
> > >   LinkedIn: http://www.linkedin.com/in/brouer
> > >
>
>
>
> --
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
