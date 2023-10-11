Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559B47C56E4
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Oct 2023 16:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjJKOcw (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 11 Oct 2023 10:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjJKOcv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 11 Oct 2023 10:32:51 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23BC9D
        for <xdp-newbies@vger.kernel.org>; Wed, 11 Oct 2023 07:32:49 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41983b83e53so45810421cf.2
        for <xdp-newbies@vger.kernel.org>; Wed, 11 Oct 2023 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697034769; x=1697639569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfAgwiaF9D/UKsVIjPvkRwIWrpx36mUpvBk63iciOLo=;
        b=JJY12v6WHZ1XEedd+5MEI9bsOI184OQLgo9KqIzCkQSLtsVlB0O+mlaaZWVOGKDcvi
         i89ATe2N+fGUTZ7uCMkywVyGnr5/uh8GkyBD0t4BAdgKeSVUCOapfEvDeeNNnXZznZkD
         2vMwTcGGz5mpoDZrDIELg32mX/isQKGnWcX8MqcNxpfwZrDD6OuryJLK4DcpqKJrzQZS
         QzxbGkbZpgWzz4iFhvIgYELPZ939wMuI/fvfmqbJJkD1KtBq8eLQh7j3IGWAI2V+b8it
         y6aner44bmpFYtNz2rzB3nTXe6p7OBsq0rUF/9Wxv0uVs+syacsiVeheX8ETr686FYcm
         YtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034769; x=1697639569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfAgwiaF9D/UKsVIjPvkRwIWrpx36mUpvBk63iciOLo=;
        b=kUUZ/sU9Ub/vQx5B7R8iIkkYH7KId3wX0OjNHOJKA0pMGPYxzZtNqQ20tp8QQmnXEb
         DkLcEkVQzZnnlE8yXN26Ef8TQ30M3HP2hODNRujwMRZXXFxpH3qghlkfa2XHlqCc3syc
         bCsQF8ljQvQUlCReo5hesgYr8DhKQgdcv3pY9JrnyUuOp2OGK7I2CHc9/5uaRRMopYrO
         VlGxTFs/Qz0Pp2T7q8go6rx5rW4lEapFqnHmYwiPQJzoEEl20RK8dqCsMDOynb4+qqa8
         yZXSBaEsmeSNWvxeBuyguJcoAj/VEXp9aVIFdDnAE2wK4IhAQBhqygr+OmdHm/SfFVSP
         rebw==
X-Gm-Message-State: AOJu0YxWqe9S0HVfirhOKFryNZImoqvcvican9OShh2VdKSn74JfZYy2
        pShGyhdsHIUtXNa8vTwZ7rAaIhW1Ny+BEoBA41XYUc38Ojk=
X-Google-Smtp-Source: AGHT+IFixXg1/PYSp2uYRwEgOI80J3Wu9w/ttywWYDWJJBJwx8S0QCUPItI5y6oFtZf1mLSPlYhvWF7kQpgbj3WRxP4=
X-Received: by 2002:ac8:7f55:0:b0:418:134f:17f4 with SMTP id
 g21-20020ac87f55000000b00418134f17f4mr26254585qtk.22.1697034768864; Wed, 11
 Oct 2023 07:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAAi1gX6u0giV3U9DrnqGfTDQRYvL5D=R6za55JSk5goPAHpczQ@mail.gmail.com>
In-Reply-To: <CAAi1gX6u0giV3U9DrnqGfTDQRYvL5D=R6za55JSk5goPAHpczQ@mail.gmail.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Wed, 11 Oct 2023 07:32:37 -0700
Message-ID: <CAK3+h2xMqRe_Ta=R3sikpqxzr9TfiHyWtp7V=xeYFD9h2z8XtA@mail.gmail.com>
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

On Sun, Oct 1, 2023 at 10:11=E2=80=AFAM Minh Le Hoang
<minh.lehoang@novoserve.com> wrote:
>
> Hi everyone, currently I am trying to make the xdp synproxy work from
> the sample of linux kernel repository. I take the xdp kernel code from
> here: https://github.com/torvalds/linux/blob/master/tools/testing/selftes=
ts/bpf/progs/xdp_synproxy_kern.c
>  , and the xdp synproxy userspace program from here:
> https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf=
/xdp_synproxy.c
> .
> I set up my testing environment with 3 network namespaces: ns1 as a
> server, ns2 as a router and ns3 as a client. I set 4 virtual
> ethernets: veth1 with peer veth2, veth3 with peer veth4 and add them
> to the different namespaces. To be specific, I use veth1
> (192.168.1.1/24) for namespace ns1, veth2(192.168.1.2/24) and
> veth3(192.168.2.1/24) for namespace ns2, and veth4(192.168.2.2/24) for
> namespace ns3. For the namespace ns1, I enable tcp syncookie, tcp
> loose contract by using these command:
> sysctl -w net.ipv4.tcp_syncookies=3D2
> sysctl -w net.ipv4.tcp_timestamps=3D1
> sysctl -w net.netfilter.nf_conntrack_tcp_loose=3D0
> Then I upload the xdp synproxy program to the veth1 using this command:
> ./xdp_synproxy --iface veth1 --ports 80 --single --mss4 1460 --mss6
> 1440 --wscale 7 --ttl 64
> and upload the xdp dummy kernel program, which is just simple xdp_pass
> to the veth2 interface of namespace ns2 with this command:
> ip link set veth2 xdp object xdp_dummy_kern.bpf.o section xdp
> . Most of my setup is taken from the test program from linux kernel repos=
itory:
> https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf=
/prog_tests/xdp_synproxy.c
>
> After that, I run the a simple http server at port 80 in namespace
> ns1. I use the netcat in network namespace ns3 to check for the tcp
> connect:
> # nc -v 192.168.1.1 80
> nc: connect to 192.168.1.1 port 80 (tcp) failed: Connection reset by peer
>
> . I debug using tcpdump and xdpdump in both interface veth1 and veth2
> and discover that the xdp synproxy program allow tcp ack packet to
> passthrough but does not notify the host which causes invalid tcp
> state and causes the server to respond with tcp reset flag. For more
> detail, here are the link to the Wireshark files of veth1 and veth2:

I did not look at your capture, this problem sounds familiar and I
guess you probably missed the iptables rules for SYNPROXY, if you look
at bpf selftest, it has iptables rules setup for synproxy, I am
porting xdp synproxy to bpf-examples repo and here are the iptables
rules for example

https://github.com/vincentmli/bpf-examples/tree/vli-dev/xdp-synproxy

>
> https://www.dropbox.com/scl/fo/26kgk8sfozme1d6cc9zn4/h?rlkey=3Ds1y9klybry=
ilk5btylnp0dttg&dl=3D0
>
> Why does this problem happen? What should I do to fix this problem? In
> addition, I notice that if the veth2 interface does not attach the xdp
> dummy program, it does not recognise the tcp syn-ack packet generated
> by xdp synproxy program. What could be the solution for this?
>
> Kind regard
>
> Minh.
