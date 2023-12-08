Return-Path: <xdp-newbies+bounces-12-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4380AC88
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 19:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381312818FE
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85DE481C1;
	Fri,  8 Dec 2023 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNgmgZcj"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FE91718
	for <xdp-newbies@vger.kernel.org>; Fri,  8 Dec 2023 10:57:39 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-425a3cdbda9so5456151cf.1
        for <xdp-newbies@vger.kernel.org>; Fri, 08 Dec 2023 10:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702061858; x=1702666658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpYakrOByamSsbDcuspTuL9XMh1fzT1iYs6UfhtzCCI=;
        b=KNgmgZcjxN/MuqjA9RlP7WSgXDwXGu2TRx7oE1f3GnFHlQ1vu5ErB44yG/yvCcdjmW
         7GboyfyfrKCcTTZr/PkuSQ1FYmMQl90KvmaPMimJxo3FBvF/bNdjOIz7e7RUh8L2JTQr
         nPOULiWyH1wbOvqWSyBMxcoYpO5HEBeBb1EEyjyizxwnPg0tn/LyVp9dB1/bdUEkWTh/
         1qkqHiSdsf2ttyaxGsJK8n9zpgISF9guD5YxxN14nHv9rOBcSzjjkap8IkTqbwWlyvWp
         fWeHLdXycn+uSKEsBu2rwBm71OUuIFhDQ4wDR8MmBjFPzksGK70UXUtWbF9LqDOe2f3/
         P/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702061858; x=1702666658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpYakrOByamSsbDcuspTuL9XMh1fzT1iYs6UfhtzCCI=;
        b=i4yeEqJ8frqcTY3hqXaSfGP/f4faebyq6CsLU0kUh/FzLAJUzEV7bCAEg57Ay2NoP0
         DLmEOSlOR9RONxHoBDy7YXLVfc834sG1fvVDNo+E5lokfYTkcgweKc99121v19bPS/sk
         7mV87W778vM+xlvlheKfdBLD7Dp6aYyxkPYBGgW9SfZ59o1evhKTb73i6QmVbs8aeOel
         4m/dKRoPZ6M1Al4b/tHLSmMijshXUFuZu0rSSxU7ErC9twF3UiOydez8GY7050rx5yzS
         DlIE1g30TDIxWkPg1IwYMWEfnQEJYHwfu+gNqfXdXM4D06w7ib58sI4vaOJC2LCHTr3J
         liuQ==
X-Gm-Message-State: AOJu0Yw5IIMhwBK6O26HKAY1c8S7QBESgMqc1IggtYbdv5P+yoLd4q9c
	CrayAIE7WEV0agrSq+ds3H1qRTMzwJVXVChlUX9hMRts
X-Google-Smtp-Source: AGHT+IGbnH5K7rddEh0odHlTZ159aOdCxTZkAM1Q8oxPyzaAmXGlc6Z7WSB8aH5yoqihqWRTBB6pYJgNI2fQ68M3yis=
X-Received: by 2002:a05:622a:14c6:b0:425:9e97:b1c6 with SMTP id
 u6-20020a05622a14c600b004259e97b1c6mr855889qtx.35.1702061858321; Fri, 08 Dec
 2023 10:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
 <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com>
 <c5a2af04-5028-4f71-b6d1-4a428e8a7bc4@novoserve.com> <CAK3+h2w_sZ+cm4HJr+GvHCkWUUE3cfYweuSTh3XWDe7SCHbSsg@mail.gmail.com>
 <CAAi1gX4iUmdd=uZpoBAVxYohX629g7RDw_Qs44bKD9XFW_qP1w@mail.gmail.com> <CAAi1gX5O3TpTdryKkfxT7Xp0dqJzkNu8KCuJTJSREPJ1cBC9_A@mail.gmail.com>
In-Reply-To: <CAAi1gX5O3TpTdryKkfxT7Xp0dqJzkNu8KCuJTJSREPJ1cBC9_A@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 8 Dec 2023 10:57:27 -0800
Message-ID: <CAK3+h2z1r69Z5g+qTwCaJzgnD5sv93x67TLJ3gVQ70_nFE0AqQ@mail.gmail.com>
Subject: Re: Bug in xdp synproxy kernel code
To: Minh Le Hoang <minh.lehoang@novoserve.com>
Cc: xdp-newbies@vger.kernel.org, 
	Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 4:42=E2=80=AFAM Minh Le Hoang <minh.lehoang@novoserv=
e.com> wrote:
>
> ---------- Forwarded message ---------
> From: Minh Le Hoang <minh.lehoang@novoserve.com>
> Date: Fri, Dec 8, 2023 at 1:40=E2=80=AFPM
> Subject: Re: Bug in xdp synproxy kernel code
> To: Vincent Li <vincent.mc.li@gmail.com>
>
>
> Hi Vincent,
> I think the reason why the xdp synproxy works with and without the
> changing of the code is that in my setup lab, only 1 interface in the
> filter node is responsible for dealing with the incoming packet from
> both client and server. If you look in the mailing list naming "XDP
> synproxy causes tcp reset" which I finally made the code work by
> creating an iptable FORWARD chain, I set up a different lab containing
> 3 different network namespaces. The namespace ns2 which is both router
> and firewall, I upload the XDP synproxy program to the interface
> against the client's interface. When the XDP synproxy program triggers
> the conntrack table to establish TCP connection with the server, the
> interface containing XDP synproxy program is not involved in that
> operation. Thus, the bug in the code does not react. Only when I set
> up this network topology containing client, server, router, and filter
> node, my colleague Jeroen and I discovered this bug.
> Kind regards
> Minh
>

Thanks, I understand that.  I could not get your filter scenario
working in the lab probably due to my lab setup issue. I thought
letting synproxy handle SYNACK from the backend server is kind of an
extra workload in my humble opinion :), filtering only on
client/internet side should be good enough, but I don't know your
environment.

> On Fri, Dec 8, 2023 at 1:56=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > On Thu, Dec 7, 2023 at 2:19=E2=80=AFAM Jeroen van Ingen Schenau
> > <jeroen.vaningenschenau@novoserve.com> wrote:
> > >
> > > Hi Vincent, list,
> > >
> > > >> iptables -t filter -A FORWARD \
> > > >>     -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTR=
ACKED \
> > > >>     -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
> > > >> iptables -t filter -A FORWARD \
> > > >>     -i eth1 -m state --state INVALID -j DROP
> > > >
> > > > I have been unable to get it working by attaching  xdp synproxy to
> > > > firewall/router without having target/protected destination IP on
> > > > firewall/router by adding rules in filter table INPUT chain, your i=
dea
> > > > of adding  rules in filter FORWARD  chain solves my puzzle :)
> > >
> > > Glad that that helped! It was something that Minh struggled with too,
> > > for a while.
> > >
> > > Indeed you need to use the INPUT chain for traffic destined to the ho=
st
> > > itself (eg when you run this code on a webserver, reverse proxy or
> > > something like HAproxy in TCP mode). The FORWARD chain should be used
> > > when the host is just a hop in the path, so when it's bridging or
> > > routing the traffic, as is the case with a firewall placed in front o=
f
> > > one or more servers.
> > >
> > > Our use case is a transparent firewall that can be placed in line wit=
h
> > > traffic to clean it, so probably similar to what you were trying.
> > >
> > > On a side note: the presentation [0] that you reference in your repo =
[1]
> > > also gives an example with the FORWARD chain, see pages/slides 12 & 1=
3.
> > >
> > >
> > > >> I use the curl command in the client to get the web page from the
> > > >> server for testing. It is strange for me that after the synproxy c=
ode
> > > >> completes the 3 way handshake tcp with the client, it sends the sy=
n
> > > >> packet to the server but it drops the SYNACK packet from the serve=
r.
> > > >>
> > > > I guess maybe originally the synproxy code is not expected to handl=
e
> > > > SYNACK from the backend server?
> > >
> > > Looking through the code, we thought that it was actually designed to
> > > handle this (but not sure how it was tested then, and why this issue
> > > hadn't been identified yet).
> > >
> > >
> > > >> Now the xdp synproxy kernel code does not drop the SYNACK tcp pack=
et
> > > >> from the server.
> > > >
> > > > Thanks for the analysis, if this is right and confirmed by other
> > > > expert, I guess I should also fix it up in the xdp synproxy  code I
> > > > ported to bpf-samples repo
> > > > https://github.com/xdp-project/bpf-examples/tree/master/xdp-synprox=
y.
> > >
> > > Well, it would be nice if you can also test and validate our patch -
> > > having read through the code numerous times and after several tests i=
n
> > > our VM setup (as Minh describes), this change makes the code do what =
we
> > > expect.
> > >
> >
> > Thank you for your detailed explanation,   I tried Minh's lab setup
> > but for some reason I could not get it
> > working, I suspect it is my lab setup issue, I also tried a simple
> > firewall/router setup and attach
> > the xdp synproxy program directly to the firewall/router interface, no
> > standalone filter box involved to handle SYNACK from backend server
> > it works with and without your patch.
> >
> > > It has been accepted into bpf-next [2], so hopefully it will propagat=
e
> > > to the relevant upstream repos - and maybe make it into Linux kernel =
6.8.
> > >
> >
> > I will add your fix to the bpf-examples repo, and thank you for having
> > a real world working example xdp synproxy from kernel bpf selftest :)
> >
> > >
> > > Kind regards,
> > >
> > > Jeroen van Ingen Schenau
> > >
> > > [0]:
> > > https://netdevconf.info/0x15/slides/30/Netdev%200x15%20Accelerating%2=
0synproxy%20with%20XDP.pdf
> > > [1]: https://github.com/xdp-project/bpf-examples/tree/master/xdp-synp=
roxy
> > > [2]:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/comm=
it/?id=3Db6a3451e0847
>

