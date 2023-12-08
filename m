Return-Path: <xdp-newbies+bounces-10-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F11E680983E
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 01:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6CA11F2104B
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Dec 2023 00:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060B653;
	Fri,  8 Dec 2023 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhDr9Ej2"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8391720
	for <xdp-newbies@vger.kernel.org>; Thu,  7 Dec 2023 16:56:46 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d99c3a3a32so1005046a34.3
        for <xdp-newbies@vger.kernel.org>; Thu, 07 Dec 2023 16:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701997005; x=1702601805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDcw65yksvKtKrpn+x5Q8JwopytaTAhKXGIqXbtI+Ps=;
        b=nhDr9Ej2E/SZqCaY8kBfgphrCduPxpcj3n+OSrDmZ45e81H71K2Pv+9wujfVWph8mp
         hkgIKvQudw1IeFTnlswlbqVAEOP5YUhAx4sZ3RzNVCcGJXyVkXYHnZCSxgf24hupd2RL
         p36Q3Fad5l14237A/x8/O3aZ+Bg5nHFPmUO5stbDfkPeqCc7kZ5X9+iWejv4Naec3H3j
         +xcZEsLHgWD5oPBLqYGvcnqipdUvl+0LLr2/cZUaI6611hzi6K1qbND1QF3XNn7yzXPV
         wLDLW0g004xbuJnSZ/naBkXOqLpCRaS/tA2o1dqaqjAsSgifijUEvc2v2nijQk9ujpjq
         yzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997005; x=1702601805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDcw65yksvKtKrpn+x5Q8JwopytaTAhKXGIqXbtI+Ps=;
        b=ZO2ekI8MCq3L5gMkON1wcAbQQmQIRu42m+nYa1UXmP7Zl+F6hMmWEdj8mdKjUD4N8Y
         cqaUiFUm4BLhry2WiaJCbkHtq9vUu7opRbeWIV85iO0sNfHEzHmhNftzcZJwXuN7ZrJP
         q0I5k1ED5TfZX0yTgxpbrPBmN1NPw0ufY2PdHzySOwOePBFtRKBD5NX8hhh7PO8cr6qR
         PxyuZue4+V+a3PylILFi+wi4nUoB5Dt9tqL7Bgdsu+1MIDfhnteQJxgFTOfZjtnDf2mQ
         jcUh4Gw9NYvuoZXQQdteKxQbsZseB/cJChocfSQP4d0cyFvHZOl1I2kYD2HpHDYiD2kL
         /oqg==
X-Gm-Message-State: AOJu0Yw+w1gaU1gkKZpPGe0VhSBcEDXAi38V41splxI+SKOz0NtFxAAj
	QcI2StyIFWPLVzIsx25b4BIRCPLT6nN+L1lOgVyZ3SHQ
X-Google-Smtp-Source: AGHT+IEfuAi+UhCSz1EZDkCq/+TvZ5Td2CL8jFkx9dYAJFmWezBVcICzMdAdDbT8JFHAoEtE5N0W+o5r64i5loE67yc=
X-Received: by 2002:a05:6830:18f1:b0:6d9:e3c0:9d6e with SMTP id
 d17-20020a05683018f100b006d9e3c09d6emr882495otf.10.1701997005405; Thu, 07 Dec
 2023 16:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAi1gX7owA+Tcxq-titC-h-KPM7Ri-6ZhTNMhrnPq5gmYYwKow@mail.gmail.com>
 <CAK3+h2w-k4xYmLWtcmrit1kfWQiSCOY4Zp2--w-iMVqH3zVopQ@mail.gmail.com> <c5a2af04-5028-4f71-b6d1-4a428e8a7bc4@novoserve.com>
In-Reply-To: <c5a2af04-5028-4f71-b6d1-4a428e8a7bc4@novoserve.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 7 Dec 2023 16:56:34 -0800
Message-ID: <CAK3+h2w_sZ+cm4HJr+GvHCkWUUE3cfYweuSTh3XWDe7SCHbSsg@mail.gmail.com>
Subject: Re: Bug in xdp synproxy kernel code
To: Jeroen van Ingen Schenau <jeroen.vaningenschenau@novoserve.com>
Cc: Minh Le Hoang <minh.lehoang@novoserve.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 2:19=E2=80=AFAM Jeroen van Ingen Schenau
<jeroen.vaningenschenau@novoserve.com> wrote:
>
> Hi Vincent, list,
>
> >> iptables -t filter -A FORWARD \
> >>     -i eth1 -p tcp -m tcp --dport 80 -m state --state INVALID,UNTRACKE=
D \
> >>     -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
> >> iptables -t filter -A FORWARD \
> >>     -i eth1 -m state --state INVALID -j DROP
> >
> > I have been unable to get it working by attaching  xdp synproxy to
> > firewall/router without having target/protected destination IP on
> > firewall/router by adding rules in filter table INPUT chain, your idea
> > of adding  rules in filter FORWARD  chain solves my puzzle :)
>
> Glad that that helped! It was something that Minh struggled with too,
> for a while.
>
> Indeed you need to use the INPUT chain for traffic destined to the host
> itself (eg when you run this code on a webserver, reverse proxy or
> something like HAproxy in TCP mode). The FORWARD chain should be used
> when the host is just a hop in the path, so when it's bridging or
> routing the traffic, as is the case with a firewall placed in front of
> one or more servers.
>
> Our use case is a transparent firewall that can be placed in line with
> traffic to clean it, so probably similar to what you were trying.
>
> On a side note: the presentation [0] that you reference in your repo [1]
> also gives an example with the FORWARD chain, see pages/slides 12 & 13.
>
>
> >> I use the curl command in the client to get the web page from the
> >> server for testing. It is strange for me that after the synproxy code
> >> completes the 3 way handshake tcp with the client, it sends the syn
> >> packet to the server but it drops the SYNACK packet from the server.
> >>
> > I guess maybe originally the synproxy code is not expected to handle
> > SYNACK from the backend server?
>
> Looking through the code, we thought that it was actually designed to
> handle this (but not sure how it was tested then, and why this issue
> hadn't been identified yet).
>
>
> >> Now the xdp synproxy kernel code does not drop the SYNACK tcp packet
> >> from the server.
> >
> > Thanks for the analysis, if this is right and confirmed by other
> > expert, I guess I should also fix it up in the xdp synproxy  code I
> > ported to bpf-samples repo
> > https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy.
>
> Well, it would be nice if you can also test and validate our patch -
> having read through the code numerous times and after several tests in
> our VM setup (as Minh describes), this change makes the code do what we
> expect.
>

Thank you for your detailed explanation,   I tried Minh's lab setup
but for some reason I could not get it
working, I suspect it is my lab setup issue, I also tried a simple
firewall/router setup and attach
the xdp synproxy program directly to the firewall/router interface, no
standalone filter box involved to handle SYNACK from backend server
it works with and without your patch.

> It has been accepted into bpf-next [2], so hopefully it will propagate
> to the relevant upstream repos - and maybe make it into Linux kernel 6.8.
>

I will add your fix to the bpf-examples repo, and thank you for having
a real world working example xdp synproxy from kernel bpf selftest :)

>
> Kind regards,
>
> Jeroen van Ingen Schenau
>
> [0]:
> https://netdevconf.info/0x15/slides/30/Netdev%200x15%20Accelerating%20syn=
proxy%20with%20XDP.pdf
> [1]: https://github.com/xdp-project/bpf-examples/tree/master/xdp-synproxy
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=3Db6a3451e0847

