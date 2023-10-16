Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA82F7CB12F
	for <lists+xdp-newbies@lfdr.de>; Mon, 16 Oct 2023 19:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjJPRRm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 16 Oct 2023 13:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJPRRl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 16 Oct 2023 13:17:41 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25139F
        for <xdp-newbies@vger.kernel.org>; Mon, 16 Oct 2023 10:17:39 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4180b417309so28295811cf.0
        for <xdp-newbies@vger.kernel.org>; Mon, 16 Oct 2023 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697476659; x=1698081459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg4rH9P1XYv8hT8MvzRB9weOkN7alBudwRrzPbCP9Yg=;
        b=GCzb34NURn9q0Uhz65Kf9eZIzV3VsRHMIocf0D8T0+INk++zoS1V/IovN4ccMeNOgK
         8jYYWkcbbsbWQdNS6NCJ0+hrS1lZIFIdPov2JLsu1KndK2yy2391R6wdkY9dCk4pjI95
         Lkp8/mcmbLd6PprhyNp/tvc0WuNfe9fU/yaAwTz256mr1fgshCD1d8WKLsNZ2hiRzESQ
         TeanxYfJyu4MVjZeQ8FqBq0oQmp66iG/T4CYXOp2RU4RVUb+C0z7fEJzvPEZieoDRJ1m
         hkd+PoXgg2FaEc6R4QbNtFDqinZPQdnODmHLfl/xzuzc3C/9/2RHm+37/0bmDwbwswvU
         k3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476659; x=1698081459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg4rH9P1XYv8hT8MvzRB9weOkN7alBudwRrzPbCP9Yg=;
        b=a8aLn55s/4aFnFqU2PDV596/+yszUJG9GpKFjmtqBDwV7Za56Mqm5FaVaBzM2L8++o
         /5+xscYbBYqDYF9KJzAZ0zxNrQ4wkeQ9nMhJA9nYD+OjMdlbGbrxOA/WH9vQJdoRydgj
         6r7xTAw8LGKrOfJydXL8AWt+Qv8zJcKpDW4XoAGEK6vJrULmKwlhIHbD7iQVAot4ANvN
         vvruW3GH1am/RaxKJxYiiQezEaTSKB/QuS3JG83whjbfcPVGqGR70iJXum3emn785Bwg
         1cp/URnCuaFQezjpW9SdrRgtjyE29StZlOY/PjPGPa1HojZzD15fPGteO3+Spxe4aNpr
         c7JQ==
X-Gm-Message-State: AOJu0YynKcnP9sDJPHnkt2UV3lgQKVWtA8UaBSGlzmbU2QH3pBH+mgAB
        2ZXuaKlsGKyuc2QnAocDK9YBV7lYKc7i073wbzc=
X-Google-Smtp-Source: AGHT+IF2BqdmmBVCLMCn5NsTea9AcZ/llBkAOs0jA5wBTiLG4w/JM3qhzDlxsPuqrcEJ8hpa9Tfj7l/ckmqh1wM0Em0=
X-Received: by 2002:a05:622a:148f:b0:419:51de:1d90 with SMTP id
 t15-20020a05622a148f00b0041951de1d90mr40729623qtx.44.1697476658842; Mon, 16
 Oct 2023 10:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAi1gX6u0giV3U9DrnqGfTDQRYvL5D=R6za55JSk5goPAHpczQ@mail.gmail.com>
 <CAK3+h2xMqRe_Ta=R3sikpqxzr9TfiHyWtp7V=xeYFD9h2z8XtA@mail.gmail.com> <CAAi1gX45-41AJdFdAUVNL6KQWvR=MxgJ3xjqu36CFCSj=41YLg@mail.gmail.com>
In-Reply-To: <CAAi1gX45-41AJdFdAUVNL6KQWvR=MxgJ3xjqu36CFCSj=41YLg@mail.gmail.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Mon, 16 Oct 2023 10:17:27 -0700
Message-ID: <CAK3+h2wqYYbJ+pY9stohNe8MSMmByrf2bn-fN6DZg_nuZ_HO6Q@mail.gmail.com>
Subject: Re: Xdp synproxy causes tcp resest
To:     Minh Le Hoang <minh.lehoang@novoserve.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Oct 14, 2023 at 9:58=E2=80=AFPM Minh Le Hoang
<minh.lehoang@novoserve.com> wrote:
>
> Hi Vincent,
> Thank you for your reply. I have now changed the setup a little bit by
> making network namepace ns2 as a firewall to use iptable. I run these
> command for iptable configuration:
> sysctl -w net.ipv4.tcp_syncookies=3D2
> sysctl -w net.ipv4.tcp_timestamps=3D1
> sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
>
> iptables -t raw -I PREROUTING  -i veth3 -p tcp -m tcp --syn --dport 80
> -j CT --notrack
> iptables -t filter -A INPUT -i veth3 -p tcp -m tcp --dport 80 -m state
> --state INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale
> 7 --mss 1460
> iptables -t filter -A INPUT -i veth3 -m state --state INVALID -j DROP
>
> ./xdp_synproxy --iface veth3 --ports 80 --single --mss4 1460 --mss6
> 1440 --wscale 7 --ttl 64
>
>  The result is really confusing because the xdp program drops all the
> tcp SYN packets. Below is the wireshark file I capture by using
> xdpdump program in veth3:
> Kind regards,
> Minh

I suggest you not do top posting in the mailing list because it is not
easier to follow.

 I have not tried namespace myself so I am not sure if there is any
particular setup requirement, in a firewall scenario, what I noticed
is that the target IP that the XDP SYNPROXY is protecting for needs to
be a destination IP on the firewall itself (the firewall could do DNAT
to backend server IP after SYNPROXY processing), not IP on the backend
server behind the firewall, at least that is my observation, I maybe
missing something.

>
> On Wed, Oct 11, 2023 at 4:32=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Sun, Oct 1, 2023 at 10:11=E2=80=AFAM Minh Le Hoang
> > <minh.lehoang@novoserve.com> wrote:
> > >
> > > Hi everyone, currently I am trying to make the xdp synproxy work from
> > > the sample of linux kernel repository. I take the xdp kernel code fro=
m
> > > here: https://github.com/torvalds/linux/blob/master/tools/testing/sel=
ftests/bpf/progs/xdp_synproxy_kern.c
> > >  , and the xdp synproxy userspace program from here:
> > > https://github.com/torvalds/linux/blob/master/tools/testing/selftests=
/bpf/xdp_synproxy.c
> > > .
> > > I set up my testing environment with 3 network namespaces: ns1 as a
> > > server, ns2 as a router and ns3 as a client. I set 4 virtual
> > > ethernets: veth1 with peer veth2, veth3 with peer veth4 and add them
> > > to the different namespaces. To be specific, I use veth1
> > > (192.168.1.1/24) for namespace ns1, veth2(192.168.1.2/24) and
> > > veth3(192.168.2.1/24) for namespace ns2, and veth4(192.168.2.2/24) fo=
r
> > > namespace ns3. For the namespace ns1, I enable tcp syncookie, tcp
> > > loose contract by using these command:
> > > sysctl -w net.ipv4.tcp_syncookies=3D2
> > > sysctl -w net.ipv4.tcp_timestamps=3D1
> > > sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
> > > Then I upload the xdp synproxy program to the veth1 using this comman=
d:
> > > ./xdp_synproxy --iface veth1 --ports 80 --single --mss4 1460 --mss6
> > > 1440 --wscale 7 --ttl 64
> > > and upload the xdp dummy kernel program, which is just simple xdp_pas=
s
> > > to the veth2 interface of namespace ns2 with this command:
> > > ip link set veth2 xdp object xdp_dummy_kern.bpf.o section xdp
> > > . Most of my setup is taken from the test program from linux kernel r=
epository:
> > > https://github.com/torvalds/linux/blob/master/tools/testing/selftests=
/bpf/prog_tests/xdp_synproxy.c
> > >
> > > After that, I run the a simple http server at port 80 in namespace
> > > ns1. I use the netcat in network namespace ns3 to check for the tcp
> > > connect:
> > > # nc -v 192.168.1.1 80
> > > nc: connect to 192.168.1.1 port 80 (tcp) failed: Connection reset by =
peer
> > >
> > > . I debug using tcpdump and xdpdump in both interface veth1 and veth2
> > > and discover that the xdp synproxy program allow tcp ack packet to
> > > passthrough but does not notify the host which causes invalid tcp
> > > state and causes the server to respond with tcp reset flag. For more
> > > detail, here are the link to the Wireshark files of veth1 and veth2:
> >
> > I did not look at your capture, this problem sounds familiar and I
> > guess you probably missed the iptables rules for SYNPROXY, if you look
> > at bpf selftest, it has iptables rules setup for synproxy, I am
> > porting xdp synproxy to bpf-examples repo and here are the iptables
> > rules for example
> >
> > https://github.com/vincentmli/bpf-examples/tree/vli-dev/xdp-synproxy
> >
> > >
> > > https://www.dropbox.com/scl/fo/26kgk8sfozme1d6cc9zn4/h?rlkey=3Ds1y9kl=
ybryilk5btylnp0dttg&dl=3D0
> > >
> > > Why does this problem happen? What should I do to fix this problem? I=
n
> > > addition, I notice that if the veth2 interface does not attach the xd=
p
> > > dummy program, it does not recognise the tcp syn-ack packet generated
> > > by xdp synproxy program. What could be the solution for this?
> > >
> > > Kind regard
> > >
> > > Minh.
