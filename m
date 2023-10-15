Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE467C97F2
	for <lists+xdp-newbies@lfdr.de>; Sun, 15 Oct 2023 06:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbjJOE6k (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 15 Oct 2023 00:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjJOE6j (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sun, 15 Oct 2023 00:58:39 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B887BA9
        for <xdp-newbies@vger.kernel.org>; Sat, 14 Oct 2023 21:58:37 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d84f18e908aso3780852276.1
        for <xdp-newbies@vger.kernel.org>; Sat, 14 Oct 2023 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=novoserve.com; s=google; t=1697345917; x=1697950717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp7ZIe2m4tJVbbluH33S5UC3YAZY3ESAEhmL74yAq18=;
        b=RHlsTmjxi2rhYggXP7UduAiaOXumbea/tnTof/5RaYzlkEMBMwTOV7ePFMQn0q1OJV
         lLMbzfX0J5Gw1gCxrboGqqOpnZhjxhkwoaHJ/bTj4TTCO+WDLoucYA0sAmhdHJ+DvJ8E
         rJIKbJMB8NfsBf2xm3wgCwIHqbVCNY22y3AmIrGfFrHeLBe8bOOze2CfFtX8SzoCnoiQ
         w1066RaF9mXx3vwDNCGiQ5x4QzQiwlYvZPJJDmJsBYsw1eLam9/urzk6uCjG8gwU1taq
         3oYU5JZlHMhj+RM+Z05f17Wme5eSQrRnGl/xIxvrZDR4AOw0owRwqlSUekNL9y7BQKfB
         g9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697345917; x=1697950717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kp7ZIe2m4tJVbbluH33S5UC3YAZY3ESAEhmL74yAq18=;
        b=aWPoFSSVj3dPd95i7vMyhs1wZUd9dVRhaBH/GNWKnWKzVkqHBCjHVyOEcjcpGzbgTl
         5GoAw0ja5z8JdGVbFtLivJnE70A75cbUzJf14VK6pm/rzVTVUNzfxDQQzH5CvoXm/Wf+
         dUBm/B1Y/XTEVItAWuRUFDmnwpfRlBxSd686Zff7cpaNmiYI2eO6NDQzHtQHF9m1TEdP
         pkfOAbEvxenc+QNihAIvREX5ZAfgRRJyIu6bJ1KJAPe6QqbXflBgVRMwH/DHy/RBAsN5
         ajlrCJ8nyoHDaheM7n5cjYQBx5pS5QHYZYPRIFntUsgAyfBRcn0HypQBSqpN3ffAr/HE
         qSIg==
X-Gm-Message-State: AOJu0YzCQgE2T8/vQfmvtVO/rDPoXbabC7xwoOvnOhzTcAAGU/E79f0x
        LwA6wGZZn2BNmKeHqB8Hj3Z5SNUZ3uWnHssBhwQDL34Nnmy0M0DTzbc/Bg==
X-Google-Smtp-Source: AGHT+IGN2DI5wKWDjoTBOJYFkmEPcDq4ZN5GwWRZviST5RT65Ww7ttHayPEcHI/PJLXKC8sdPRAkAUiOyKabqU5Z0iE=
X-Received: by 2002:a25:14d5:0:b0:d0c:9ab2:72d3 with SMTP id
 204-20020a2514d5000000b00d0c9ab272d3mr27904450ybu.14.1697345916703; Sat, 14
 Oct 2023 21:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAAi1gX6u0giV3U9DrnqGfTDQRYvL5D=R6za55JSk5goPAHpczQ@mail.gmail.com>
 <CAK3+h2xMqRe_Ta=R3sikpqxzr9TfiHyWtp7V=xeYFD9h2z8XtA@mail.gmail.com>
In-Reply-To: <CAK3+h2xMqRe_Ta=R3sikpqxzr9TfiHyWtp7V=xeYFD9h2z8XtA@mail.gmail.com>
From:   Minh Le Hoang <minh.lehoang@novoserve.com>
Date:   Sun, 15 Oct 2023 06:58:25 +0200
Message-ID: <CAAi1gX45-41AJdFdAUVNL6KQWvR=MxgJ3xjqu36CFCSj=41YLg@mail.gmail.com>
Subject: Re: Xdp synproxy causes tcp resest
To:     Vincent Li <vincent.mc.li@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006d50260607ba2467"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

--0000000000006d50260607ba2467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,
Thank you for your reply. I have now changed the setup a little bit by
making network namepace ns2 as a firewall to use iptable. I run these
command for iptable configuration:
sysctl -w net.ipv4.tcp_syncookies=3D2
sysctl -w net.ipv4.tcp_timestamps=3D1
sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0

iptables -t raw -I PREROUTING  -i veth3 -p tcp -m tcp --syn --dport 80
-j CT --notrack
iptables -t filter -A INPUT -i veth3 -p tcp -m tcp --dport 80 -m state
--state INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale
7 --mss 1460
iptables -t filter -A INPUT -i veth3 -m state --state INVALID -j DROP

./xdp_synproxy --iface veth3 --ports 80 --single --mss4 1460 --mss6
1440 --wscale 7 --ttl 64

 The result is really confusing because the xdp program drops all the
tcp SYN packets. Below is the wireshark file I capture by using
xdpdump program in veth3:
Kind regards,
Minh

On Wed, Oct 11, 2023 at 4:32=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Sun, Oct 1, 2023 at 10:11=E2=80=AFAM Minh Le Hoang
> <minh.lehoang@novoserve.com> wrote:
> >
> > Hi everyone, currently I am trying to make the xdp synproxy work from
> > the sample of linux kernel repository. I take the xdp kernel code from
> > here: https://github.com/torvalds/linux/blob/master/tools/testing/selft=
ests/bpf/progs/xdp_synproxy_kern.c
> >  , and the xdp synproxy userspace program from here:
> > https://github.com/torvalds/linux/blob/master/tools/testing/selftests/b=
pf/xdp_synproxy.c
> > .
> > I set up my testing environment with 3 network namespaces: ns1 as a
> > server, ns2 as a router and ns3 as a client. I set 4 virtual
> > ethernets: veth1 with peer veth2, veth3 with peer veth4 and add them
> > to the different namespaces. To be specific, I use veth1
> > (192.168.1.1/24) for namespace ns1, veth2(192.168.1.2/24) and
> > veth3(192.168.2.1/24) for namespace ns2, and veth4(192.168.2.2/24) for
> > namespace ns3. For the namespace ns1, I enable tcp syncookie, tcp
> > loose contract by using these command:
> > sysctl -w net.ipv4.tcp_syncookies=3D2
> > sysctl -w net.ipv4.tcp_timestamps=3D1
> > sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
> > Then I upload the xdp synproxy program to the veth1 using this command:
> > ./xdp_synproxy --iface veth1 --ports 80 --single --mss4 1460 --mss6
> > 1440 --wscale 7 --ttl 64
> > and upload the xdp dummy kernel program, which is just simple xdp_pass
> > to the veth2 interface of namespace ns2 with this command:
> > ip link set veth2 xdp object xdp_dummy_kern.bpf.o section xdp
> > . Most of my setup is taken from the test program from linux kernel rep=
ository:
> > https://github.com/torvalds/linux/blob/master/tools/testing/selftests/b=
pf/prog_tests/xdp_synproxy.c
> >
> > After that, I run the a simple http server at port 80 in namespace
> > ns1. I use the netcat in network namespace ns3 to check for the tcp
> > connect:
> > # nc -v 192.168.1.1 80
> > nc: connect to 192.168.1.1 port 80 (tcp) failed: Connection reset by pe=
er
> >
> > . I debug using tcpdump and xdpdump in both interface veth1 and veth2
> > and discover that the xdp synproxy program allow tcp ack packet to
> > passthrough but does not notify the host which causes invalid tcp
> > state and causes the server to respond with tcp reset flag. For more
> > detail, here are the link to the Wireshark files of veth1 and veth2:
>
> I did not look at your capture, this problem sounds familiar and I
> guess you probably missed the iptables rules for SYNPROXY, if you look
> at bpf selftest, it has iptables rules setup for synproxy, I am
> porting xdp synproxy to bpf-examples repo and here are the iptables
> rules for example
>
> https://github.com/vincentmli/bpf-examples/tree/vli-dev/xdp-synproxy
>
> >
> > https://www.dropbox.com/scl/fo/26kgk8sfozme1d6cc9zn4/h?rlkey=3Ds1y9klyb=
ryilk5btylnp0dttg&dl=3D0
> >
> > Why does this problem happen? What should I do to fix this problem? In
> > addition, I notice that if the veth2 interface does not attach the xdp
> > dummy program, it does not recognise the tcp syn-ack packet generated
> > by xdp synproxy program. What could be the solution for this?
> >
> > Kind regard
> >
> > Minh.

--0000000000006d50260607ba2467
Content-Type: application/octet-stream; name="veth3cap_xdp.pcapng"
Content-Disposition: attachment; filename="veth3cap_xdp.pcapng"
Content-Transfer-Encoding: base64
Content-ID: <f_lnqzt0a40>
X-Attachment-Id: f_lnqzt0a40

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
--0000000000006d50260607ba2467--
