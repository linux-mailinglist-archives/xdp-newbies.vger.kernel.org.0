Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AE81406C3
	for <lists+xdp-newbies@lfdr.de>; Fri, 17 Jan 2020 10:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgAQJpq (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 17 Jan 2020 04:45:46 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33381 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgAQJpq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 17 Jan 2020 04:45:46 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so22079490otp.0
        for <xdp-newbies@vger.kernel.org>; Fri, 17 Jan 2020 01:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEw7SPhhkhmExEzrF8vhmwik2mIU4uMBdZl4k+GfGoM=;
        b=TJ7fyGfKekqEzTVw15hzhdIszENiUw/BJro8H0iJI49I0J/cOFA1cEOdV40eudDSAA
         rSI2ELmNpsqcT8qCw3x57HfGKbL80EPo5cOJvlxlrdpM0cW8QddaGW850XWc8A35ccij
         /4mlPGSSNhJs62JbldJ7N87C2rl3CvIiWZOYNw3IiwaDPIbLOhsoU7EDQjUQSIqph3zC
         fJex8dR0EAibqao+IMjqBi9FpMwkw3rvi10TB3ZRy004SP0wYyB1wx3AD9136wMGpFtB
         dv5WbTSDETffcRxundL5LGOJrRNU6pB+aXdyirfYyNBAcqOEjseiIue+yAG6omw7mwnK
         Ml5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEw7SPhhkhmExEzrF8vhmwik2mIU4uMBdZl4k+GfGoM=;
        b=H5hu9vZCyn1biZ3SBO24dzC8B351/4Fb9Hs1mjlvJAk+PNJ4+q4pcZLoRh0YPLe9Sg
         VZSD9KEAvUY1s7gb+6r/kyT46YFizCO5sAz3DTZ6wo4WULB2uAyPK/jL9rVgVZ4figXr
         uX8Tdw/bIjHWzuwzBmXdxEXQNfuUjfNFYq0JY3PxlBOA9r3dPuVk+iPbImWCYDcPpqgb
         7WdbNApNUlscu06/Qp3hPIhfBBlXjAdXBfEvmCaMyON0YWqK74fjmsOyywUrm27WkP+j
         1IloF8ReYOI6cA+OVcW0dxoZBc6FzhBwT+xZ1KLzEGrrszvxxoEckBIO71ATXRMw6tvq
         Do/w==
X-Gm-Message-State: APjAAAUAbmGBjTpzNprJL+lYefYTDOf4r9+9V2Y6jjcIO+5V+CIRZXlz
        lee9HZi+7QA/TQdwl5gMa5C1gk6JYVT5pIeox3PZ5orMsu8=
X-Google-Smtp-Source: APXvYqxiErz1lcuT8j3A0vD/Pp2tgRU51xniP6xFOwup1CdcGLaaOz0VBvW28bRSxx3xooto3CYA61I9YahuNyagCD0=
X-Received: by 2002:a9d:7501:: with SMTP id r1mr5603186otk.196.1579254344894;
 Fri, 17 Jan 2020 01:45:44 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com>
 <20200116020414.GA46831@smtp.ads.isi.edu> <CAJ8uoz2WqQMVVu8F9JPBc2-Z=yvkg_9LH6cycxtYvJhJ4ytWJQ@mail.gmail.com>
In-Reply-To: <CAJ8uoz2WqQMVVu8F9JPBc2-Z=yvkg_9LH6cycxtYvJhJ4ytWJQ@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 17 Jan 2020 10:45:33 +0100
Message-ID: <CAJ8uoz3k1y9DeqQPf16BYL2HrrOUkpjEMmgUuVZX4nxAspJ4AA@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jan 16, 2020 at 3:32 PM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Thu, Jan 16, 2020 at 3:04 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> >
> > On Wed, Jan 15, 2020 at 09:20:30AM +0100, Magnus Karlsson wrote:
> > > On Wed, Jan 15, 2020 at 8:40 AM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Wed, Jan 15, 2020 at 2:41 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> > > > >
> > > > > On Tue, Jan 14, 2020 at 03:52:50PM -0500, Ryan Goodfellow wrote:
> > > > > > On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> > > > > > >
> > > > > > > Just sent out a patch on the mailing list. Would be great if you could
> > > > > > > try it out.
> > > > > >
> > > > > > Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> > > > > > tree and manually applied to the 5.5.0-rc3 branch I've been working with up to
> > > > > > this point. It does allow for allocating more memory, however packet
> > > > > > forwarding no longer works. I did not see any complaints from dmesg, but here
> > > > > > is an example iperf3 session from a client that worked before.
> > > > > >
> > > > > > ry@xd2:~$ iperf3 -c 10.1.0.2
> > > > > > Connecting to host 10.1.0.2, port 5201
> > > > > > [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> > > > > > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > > > > > [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> > > > > > [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > > [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > > [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > > [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > > [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > > [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > > ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> > > > > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > > > > [ ID] Interval           Transfer     Bitrate         Retr
> > > > > > [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> > > > > > [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> > > > > > iperf3: interrupt - the client has terminated
> > > > > >
> > > > > > I'll continue to investigate and report back with anything that I find.
> > > > >
> > > > > Interestingly I found this behavior to exist in the bpf-next tree independent
> > > > > of the patch being present.
> > > >
> > > > Ryan,
> > > >
> > > > Could you please do a bisect on it? In the 12 commits after the merge
> > > > commit below there are number of sensitive rewrites of the ring access
> > > > functions. Maybe one of them breaks your code. When you say "packet
> > > > forwarding no longer works", do you mean it works for a second or so,
> > > > then no packets come through? What HW are you using?
> > > >
> > > > commit ce3cec27933c069d2015a81e59b93eb656fe7ee4
> > > > Merge: 99cacdc 1d9cb1f
> > > > Author: Alexei Starovoitov <ast@kernel.org>
> > > > Date:   Fri Dec 20 16:00:10 2019 -0800
> > > >
> > > >     Merge branch 'xsk-cleanup'
> > > >
> > > >     Magnus Karlsson says:
> > > >
> > > >     ====================
> > > >     This patch set cleans up the ring access functions of AF_XDP in hope
> > > >     that it will now be easier to understand and maintain. I used to get a
> > > >     headache every time I looked at this code in order to really understand it,
> > > >     but now I do think it is a lot less painful.
> > > >     <snip>
> > > >
> > > > /Magnus
> > >
> > > I see that you have debug messages in your application. Could you
> > > please run with those on and send me the output so I can see where it
> > > stops. A bisect that pin-points what commit that breaks your program
> > > plus the debug output should hopefully send us on the right path for a
> > > fix.
> > >
> > > Thanks: Magnus
> > >
> >
> > Hi Magnus,
> >
> > I did a bisect starting from the head of the bpf-next tree (990bca1) down to
> > the first commit before the patch series you identified (df034c9). The result
> > was identifying df0ae6f as the commit that causes the issue I am seeing.
> >
> > I've posted output from the program in debugging mode here
> >
> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930375
>
> Perfect. Thanks.
>
> > Yes, you are correct in that forwarding works for a brief period and then stops.
> > I've noticed that the number of packets that are forwarded is equal to the size
> > of the producer/consumer descriptor rings. I've posted two ping traces from a
> > client ping that shows this.
> >
> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930376
> > - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930377
> >
> > I've also noticed that when the forwarding stops, the CPU usage for the proc
> > running the program is pegged, which is not the norm for this program as it uses
> > a poll call with a timeout on the xsk fd.
>
> I will replicate your setup and try to reproduce it. Only have one
> port connected to my load generator now, but when I get into the
> office, I will connect two ports.

If have now run your application, but unfortunately I cannot recreate
your problem. It works and runs for several minutes until I get bored
and terminate it. Note that I use an i40e card that you get a crash
with. So two problems I cannot reproduce, sigh. Here is my system
info. Can you please dump yours? Please do the ethtool dump on your
i40e card.

mkarlsso@kurt:~/src/dna-linux$ sudo ethtool -i ens803f0
[sudo] password for mkarlsso:
driver: i40e
version: 2.8.20-k
firmware-version: 5.05 0x800028a6 1.1568.0
expansion-rom-version:
bus-info: 0000:86:00.0
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes

mkarlsso@kurt:~/src/dna-linux$ uname -a
Linux kurt 5.5.0-rc4+ #72 SMP PREEMPT Thu Jan 16 10:03:20 CET 2020
x86_64 x86_64 x86_64 GNU/Linux

mkarlsso@kurt:~/src/dna-linux$ git log -1
commit b65053cd94f46619b4aae746b98f2d8d9274540e (HEAD, bpf-next/master)
Author: Andrii Nakryiko <andriin@fb.com>
Date:   Wed Jan 15 16:55:49 2020 -0800

    selftests/bpf: Add whitelist/blacklist of test names to test_progs

gcc version 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2)

I also noted that you use MAX_SOCKS in your XDP program. The size of
the xsks_map is not dependent on the number of sockets in your case.
It is dependent on the queue id you use. So I would introduce a
MAX_QUEUE_ID and set it to e.g. 128 and use that instead. MAX_SOCKS is
4, so quite restrictive.

/Magnus

> In what loop does the execution get stuck when it hangs at 100% load?
>
> /Magnus
>
> > The hardware I am using is a Mellanox ConnectX4 2x100G card (MCX416A-CCAT)
> > running the mlx5 driver. The program is running in zero copy mode. I also tested
> > this code out in a virtual machine with virtio NICs in SKB mode which uses
> > xdpgeneric - there were no issues in that setting.
> >
> > --
> > ~ ry
