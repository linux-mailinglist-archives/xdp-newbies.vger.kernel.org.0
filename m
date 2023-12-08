Return-Path: <xdp-newbies+bounces-11-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209380A393
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 13:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A1CB20B5A
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 12:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557D101C6;
	Fri,  8 Dec 2023 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=novoserve.com header.i=@novoserve.com header.b="gqMeIqAi"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C9711C
	for <xdp-newbies@vger.kernel.org>; Fri,  8 Dec 2023 04:41:51 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-db548cd1c45so2027738276.2
        for <xdp-newbies@vger.kernel.org>; Fri, 08 Dec 2023 04:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=novoserve.com; s=google; t=1702039311; x=1702644111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rawd+KuTSiu52rupksXvdwoDthdgMXM4cnIlODESNFA=;
        b=gqMeIqAianAYwTLoFjyVcwnwPKM2NWm8QB1p+yllUqFmFHb42/ibKifp/8xcewg8cy
         uTGS9+pvX3oUcfIthcPJzQfVsmdJ6WHRL6s2vgLhgQ+tsdwzEJ2kx8DuCTixBkW2WtKu
         qOZdw+m76lMhOUxGYrJYkgCRE1/Y69VAlrxNxROgjKQRAXf4j2RI956pFJd3VrDmZnSG
         TpFSwO05VMJ7B8/mkcoPCdYSquOTrMfZc0Dibj2lx4935mGRqKe7SvegPZF31E87QMz3
         48T8kOqywsXSDsF26CbmalpQSlKGsexS50EzO4AyQAIsqrjAufAbuqxfz61nmn5OI21T
         76AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039311; x=1702644111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rawd+KuTSiu52rupksXvdwoDthdgMXM4cnIlODESNFA=;
        b=Q8WmZqpOo13cUrm+EKeHr4JZyVIYvHNE8WDKRBvS8tZUU9BqglvOhHBRxFyrnn7yUl
         mKFpyGKE1rqOTGIq01hmuMp/s17GAdUHDC0Z11cYPJKDkonVZHY1gWdH8VPcBtfmQ1tD
         XaynGTLyJm7y1/VdZiboWeRXVmfdKNP8C9+TGg8WvdGB8Dt17Q7iab/Z1xPj2ZGFhWcb
         Lhl7XnWji1xbNEbKznguYQrhginhfdlsTgMuLlCXmjhDj7mQv46l8heRvWd2cDrxmTil
         POaQ73Q9sMeUlnav8Gx2J6dQD/7W3z5kKwoAaMM6zOMkf230PIrhYuqDsNlp2IcW9HuF
         D9IQ==
X-Gm-Message-State: AOJu0YyRjDqFrsXrIqGrfb+MI7Ad4UoJfhIFml7K0HYnZsUjQmdJuKQB
	02JAYo2H0hQ8Tqg1mJXGMyDOxqODsXspEBAcnr9dJhHRzQPfyS+S
X-Google-Smtp-Source: AGHT+IErzdzPVweS0Jg0Z182BXzSY5kZcvfGfgkwjjsJfkNklwXJjU+6xe8wW13mRKWt3xahh9Rlk1dArvzQecmd2Cs=
X-Received: by 2002:a25:b2a4:0:b0:db5:3a8e:e756 with SMTP id
 k36-20020a25b2a4000000b00db53a8ee756mr4074086ybj.24.1702039310818; Fri, 08
 Dec 2023 04:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
 <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com>
 <c5a2af04-5028-4f71-b6d1-4a428e8a7bc4@novoserve.com> <CAK3+h2w_sZ+cm4HJr+GvHCkWUUE3cfYweuSTh3XWDe7SCHbSsg@mail.gmail.com>
 <CAAi1gX4iUmdd=uZpoBAVxYohX629g7RDw_Qs44bKD9XFW_qP1w@mail.gmail.com>
In-Reply-To: <CAAi1gX4iUmdd=uZpoBAVxYohX629g7RDw_Qs44bKD9XFW_qP1w@mail.gmail.com>
From: Minh Le Hoang <minh.lehoang@novoserve.com>
Date: Fri, 8 Dec 2023 13:41:40 +0100
Message-ID: <CAAi1gX5O3TpTdryKkfxT7Xp0dqJzkNu8KCuJTJSREPJ1cBC9_A@mail.gmail.com>
Subject: Fwd: Bug in xdp synproxy kernel code
To: xdp-newbies@vger.kernel.org
Cc: Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Minh Le Hoang <minh.lehoang@novoserve.com>
Date: Fri, Dec 8, 2023 at 1:40=E2=80=AFPM
Subject: Re: Bug in xdp synproxy kernel code
To: Vincent Li <vincent.mc.li@gmail.com>


Hi Vincent,
I think the reason why the xdp synproxy works with and without the
changing of the code is that in my setup lab, only 1 interface in the
filter node is responsible for dealing with the incoming packet from
both client and server. If you look in the mailing list naming "XDP
synproxy causes tcp reset" which I finally made the code work by
creating an iptable FORWARD chain, I set up a different lab containing
3 different network namespaces. The namespace ns2 which is both router
and firewall, I upload the XDP synproxy program to the interface
against the client's interface. When the XDP synproxy program triggers
the conntrack table to establish TCP connection with the server, the
interface containing XDP synproxy program is not involved in that
operation. Thus, the bug in the code does not react. Only when I set
up this network topology containing client, server, router, and filter
node, my colleague Jeroen and I discovered this bug.
Kind regards
Minh

On Fri, Dec 8, 2023 at 1:56=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> On Thu, Dec 7, 2023 at 2:19=E2=80=AFAM Jeroen van Ingen Schenau
> <jeroen.vaningenschenau@novoserve.com> wrote:
> >
> > Hi Vincent, list,
> >
> > >> iptables -t filter -A FORWARD \
> > >>     -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTRAC=
KED \
> > >>     -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
> > >> iptables -t filter -A FORWARD \
> > >>     -i eth1 -m state --state INVALID -j DROP
> > >
> > > I have been unable to get it working by attaching  xdp synproxy to
> > > firewall/router without having target/protected destination IP on
> > > firewall/router by adding rules in filter table INPUT chain, your ide=
a
> > > of adding  rules in filter FORWARD  chain solves my puzzle :)
> >
> > Glad that that helped! It was something that Minh struggled with too,
> > for a while.
> >
> > Indeed you need to use the INPUT chain for traffic destined to the host
> > itself (eg when you run this code on a webserver, reverse proxy or
> > something like HAproxy in TCP mode). The FORWARD chain should be used
> > when the host is just a hop in the path, so when it's bridging or
> > routing the traffic, as is the case with a firewall placed in front of
> > one or more servers.
> >
> > Our use case is a transparent firewall that can be placed in line with
> > traffic to clean it, so probably similar to what you were trying.
> >
> > On a side note: the presentation [0] that you reference in your repo [1=
]
> > also gives an example with the FORWARD chain, see pages/slides 12 & 13.
> >
> >
> > >> I use the curl command in the client to get the web page from the
> > >> server for testing. It is strange for me that after the synproxy cod=
e
> > >> completes the 3 way handshake tcp with the client, it sends the syn
> > >> packet to the server but it drops the SYNACK packet from the server.
> > >>
> > > I guess maybe originally the synproxy code is not expected to handle
> > > SYNACK from the backend server?
> >
> > Looking through the code, we thought that it was actually designed to
> > handle this (but not sure how it was tested then, and why this issue
> > hadn't been identified yet).
> >
> >
> > >> Now the xdp synproxy kernel code does not drop the SYNACK tcp packet
> > >> from the server.
> > >
> > > Thanks for the analysis, if this is right and confirmed by other
> > > expert, I guess I should also fix it up in the xdp synproxy  code I
> > > ported to bpf-samples repo
> > > https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy.
> >
> > Well, it would be nice if you can also test and validate our patch -
> > having read through the code numerous times and after several tests in
> > our VM setup (as Minh describes), this change makes the code do what we
> > expect.
> >
>
> Thank you for your detailed explanation,   I tried Minh's lab setup
> but for some reason I could not get it
> working, I suspect it is my lab setup issue, I also tried a simple
> firewall/router setup and attach
> the xdp synproxy program directly to the firewall/router interface, no
> standalone filter box involved to handle SYNACK from backend server
> it works with and without your patch.
>
> > It has been accepted into bpf-next [2], so hopefully it will propagate
> > to the relevant upstream repos - and maybe make it into Linux kernel 6.=
8.
> >
>
> I will add your fix to the bpf-examples repo, and thank you for having
> a real world working example xdp synproxy from kernel bpf selftest :)
>
> >
> > Kind regards,
> >
> > Jeroen van Ingen Schenau
> >
> > [0]:
> > https://netdevconf.info/0x15/slides/30/Netdev%200x15%20Accelerating%20s=
ynproxy%20with%20XDP.pdf
> > [1]: https://github.com/xdp-project/bpf-examples/tree/master/xdp-synpro=
xy
> > [2]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit=
/?id=3Db6a3451e0847

