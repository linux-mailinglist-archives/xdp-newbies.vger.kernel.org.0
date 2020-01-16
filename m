Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 925DC13DD7B
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 15:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgAPOdE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 09:33:04 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45590 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgAPOdD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 09:33:03 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so19008679oie.12
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Jan 2020 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jqhQebhh7vIeksyj3l3zL59BZEAquxtJtgs3KqaiFAk=;
        b=KZn3dsDCEuWnwEySTYpYwDv9E49FQcVoVA/jDiRyLhYDqxsGRT5hxMyn31pNwJXcz3
         ISt78Vy4HPcXTNbd47GfLDBybhiQSUchUEO/viH07f/5BjepSBsnpNrDf3DawDybEtv9
         5oEx/3H5Qq8HWVD09eBt5apT3jc9uP8YZGHFbRO95x+s/kxpl/HRw81tLXJuqZnVBxK+
         ++OYOjhRXomtYlWl0E3bqqlVQILZ7afhCG5hWO1NmmP4ono5JKNCcz0nv2X2Txgfq5O2
         EeFvginSl219VlACerf0GVMzf/3srtVUpYbxjNncae20K8+IHwu1yHFLubLP0TxhTyu3
         dT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jqhQebhh7vIeksyj3l3zL59BZEAquxtJtgs3KqaiFAk=;
        b=b+t6vibuofVd4UVcPBJvHF9MPBaEYWb8uT52198k1lf5ncU0W1AIOfEE0rSowChR8/
         dnpIVTw3m6HF+w+yKjuIsBscaaIpNYT2wJ9OhXHMCJrlNUdgpy3yWwcHnGWIGbnDf5pE
         V7Wx563Yz6aQrSekfq9Um/9CENXQ3iCXpR0PFblGE0haxkqX+cdsheJrb66v/UHnHjmU
         vqkX0iaOEgnLjEcFq+fl0ZGB5UJktPES5hTDgLb0b0LXjuh9kEy4z5vYcoBcsst7SSvy
         u3b/Qjzn0J7IXDUiHPG1l4ll0XzSU/szwT60rTyzc9+wnQFmiFjN0tc5chzmxWqq4Oiy
         SSVA==
X-Gm-Message-State: APjAAAUTLtuTbZ6M40GDKYV+GeqMqvfo4f6Mt6DrXi3azOoSqCzdCSqg
        Q5Oefg1hQjMQhupftjeq8ccZtTLI6Ut/XsXZRv+1MzPE
X-Google-Smtp-Source: APXvYqxK0tyV9SGf/cVmQ6n6/TJ0+YKvysS0OpJJW/OCjrmwhk1hl1nWhA6ZjRUNZRVaZerf5dg158737r3sLOS0BQ8=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr4304934oid.98.1579185182607;
 Thu, 16 Jan 2020 06:33:02 -0800 (PST)
MIME-Version: 1.0
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu> <CAJ8uoz1FcfDYa1PaQuY-Yk+keEX5FT6+q2H2eLTce6DxcQjuiA@mail.gmail.com>
 <20200113151159.GB68570@smtp.ads.isi.edu> <CAJ8uoz1Ax5CAfO4wfo0Pj+jieeRN+gj0s2LpeeJ53uTorFP0ng@mail.gmail.com>
 <20200114205250.GA85903@smtp.ads.isi.edu> <20200115014137.GA105434@smtp.ads.isi.edu>
 <CAJ8uoz2VTXAT9ryF9Ls2JjacEw0Bc23t9w2jDEoMdA0dRc6Aaw@mail.gmail.com>
 <CAJ8uoz1Nf+Fsg40tfdnMenFiCjRBJN9maY9rVo--trt+Uwkqwg@mail.gmail.com> <20200116020414.GA46831@smtp.ads.isi.edu>
In-Reply-To: <20200116020414.GA46831@smtp.ads.isi.edu>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 16 Jan 2020 15:32:51 +0100
Message-ID: <CAJ8uoz2WqQMVVu8F9JPBc2-Z=yvkg_9LH6cycxtYvJhJ4ytWJQ@mail.gmail.com>
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jan 16, 2020 at 3:04 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
>
> On Wed, Jan 15, 2020 at 09:20:30AM +0100, Magnus Karlsson wrote:
> > On Wed, Jan 15, 2020 at 8:40 AM Magnus Karlsson
> > <magnus.karlsson@gmail.com> wrote:
> > >
> > > On Wed, Jan 15, 2020 at 2:41 AM Ryan Goodfellow <rgoodfel@isi.edu> wrote:
> > > >
> > > > On Tue, Jan 14, 2020 at 03:52:50PM -0500, Ryan Goodfellow wrote:
> > > > > On Tue, Jan 14, 2020 at 10:59:19AM +0100, Magnus Karlsson wrote:
> > > > > >
> > > > > > Just sent out a patch on the mailing list. Would be great if you could
> > > > > > try it out.
> > > > >
> > > > > Thanks for the quick turnaround. I gave this patch a go, both in the bpf-next
> > > > > tree and manually applied to the 5.5.0-rc3 branch I've been working with up to
> > > > > this point. It does allow for allocating more memory, however packet
> > > > > forwarding no longer works. I did not see any complaints from dmesg, but here
> > > > > is an example iperf3 session from a client that worked before.
> > > > >
> > > > > ry@xd2:~$ iperf3 -c 10.1.0.2
> > > > > Connecting to host 10.1.0.2, port 5201
> > > > > [  5] local 10.1.0.1 port 53304 connected to 10.1.0.2 port 5201
> > > > > [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> > > > > [  5]   0.00-1.00   sec  5.91 MBytes  49.5 Mbits/sec    2   1.41 KBytes
> > > > > [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> > > > > [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> > > > > ^C[  5]  10.00-139.77 sec  0.00 Bytes  0.00 bits/sec    4   1.41 KBytes
> > > > > - - - - - - - - - - - - - - - - - - - - - - - - -
> > > > > [ ID] Interval           Transfer     Bitrate         Retr
> > > > > [  5]   0.00-139.77 sec  5.91 MBytes   355 Kbits/sec    9             sender
> > > > > [  5]   0.00-139.77 sec  0.00 Bytes  0.00 bits/sec                  receiver
> > > > > iperf3: interrupt - the client has terminated
> > > > >
> > > > > I'll continue to investigate and report back with anything that I find.
> > > >
> > > > Interestingly I found this behavior to exist in the bpf-next tree independent
> > > > of the patch being present.
> > >
> > > Ryan,
> > >
> > > Could you please do a bisect on it? In the 12 commits after the merge
> > > commit below there are number of sensitive rewrites of the ring access
> > > functions. Maybe one of them breaks your code. When you say "packet
> > > forwarding no longer works", do you mean it works for a second or so,
> > > then no packets come through? What HW are you using?
> > >
> > > commit ce3cec27933c069d2015a81e59b93eb656fe7ee4
> > > Merge: 99cacdc 1d9cb1f
> > > Author: Alexei Starovoitov <ast@kernel.org>
> > > Date:   Fri Dec 20 16:00:10 2019 -0800
> > >
> > >     Merge branch 'xsk-cleanup'
> > >
> > >     Magnus Karlsson says:
> > >
> > >     ====================
> > >     This patch set cleans up the ring access functions of AF_XDP in hope
> > >     that it will now be easier to understand and maintain. I used to get a
> > >     headache every time I looked at this code in order to really understand it,
> > >     but now I do think it is a lot less painful.
> > >     <snip>
> > >
> > > /Magnus
> >
> > I see that you have debug messages in your application. Could you
> > please run with those on and send me the output so I can see where it
> > stops. A bisect that pin-points what commit that breaks your program
> > plus the debug output should hopefully send us on the right path for a
> > fix.
> >
> > Thanks: Magnus
> >
>
> Hi Magnus,
>
> I did a bisect starting from the head of the bpf-next tree (990bca1) down to
> the first commit before the patch series you identified (df034c9). The result
> was identifying df0ae6f as the commit that causes the issue I am seeing.
>
> I've posted output from the program in debugging mode here
>
> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930375

Perfect. Thanks.

> Yes, you are correct in that forwarding works for a brief period and then stops.
> I've noticed that the number of packets that are forwarded is equal to the size
> of the producer/consumer descriptor rings. I've posted two ping traces from a
> client ping that shows this.
>
> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930376
> - https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1930377
>
> I've also noticed that when the forwarding stops, the CPU usage for the proc
> running the program is pegged, which is not the norm for this program as it uses
> a poll call with a timeout on the xsk fd.

I will replicate your setup and try to reproduce it. Only have one
port connected to my load generator now, but when I get into the
office, I will connect two ports.

In what loop does the execution get stuck when it hangs at 100% load?

/Magnus

> The hardware I am using is a Mellanox ConnectX4 2x100G card (MCX416A-CCAT)
> running the mlx5 driver. The program is running in zero copy mode. I also tested
> this code out in a virtual machine with virtio NICs in SKB mode which uses
> xdpgeneric - there were no issues in that setting.
>
> --
> ~ ry
