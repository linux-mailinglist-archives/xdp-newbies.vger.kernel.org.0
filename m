Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D07B48B0
	for <lists+xdp-newbies@lfdr.de>; Sun,  1 Oct 2023 19:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbjJARBq (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sun, 1 Oct 2023 13:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbjJARBp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sun, 1 Oct 2023 13:01:45 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363FFC9
        for <xdp-newbies@vger.kernel.org>; Sun,  1 Oct 2023 10:01:43 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a4c073cc06so1919387b3.1
        for <xdp-newbies@vger.kernel.org>; Sun, 01 Oct 2023 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=novoserve.com; s=google; t=1696179702; x=1696784502; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4xulq+XE/5CSlZdBmBea7JbrZN6UMAqPNMIz1QuVZWc=;
        b=JdIBBKl0B4an7FlqjcdSesq2GmBYZAMPd7QeOq+gtY/YTaiv6iKZaL7Qi4ovC4HfH/
         UTIkFSagNgqDxxAYHRJePvMt9Kh7/PVY3ck1rbmhndL9gvMSNnlFk5E23Oeosx2CJWSZ
         GEnIQ3elt8Rol4NfBhQNNgIWWQS93nEX+QdyMQ26hTPitNOtYEzNstK2ZR7dHBpKeVVg
         KlQM/Jl+BhPrCePYpdB8nqYzRP287ltW4bwiEr74RViQmPLTcc320IaGdqkeKACQGqyj
         egA77D6k+5PWs2GHYyT6fpP20AMLaD2OxqRukf2YSMg3eKY+krqgCRTon+gSqWwhCvad
         buNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696179702; x=1696784502;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xulq+XE/5CSlZdBmBea7JbrZN6UMAqPNMIz1QuVZWc=;
        b=QIX1UtMW4jx7rx6ktrChLeNb38c7XpaYWrjqvjPUHeB7GH40BHGrhn2ML9NhalnXM0
         tuQuIoCtqcXeIMrj3hjw4yJSWnGMTIRuKQYsoFGFlZR/xXj/UyUPTt+yn0xBuycalCbz
         LB32vyDeI4sfcpcycghiZcXbGoqsRtf1U173j4ergSatiezjbjpKIgb0Jkeb3+LLpntJ
         S0cf+a/osJjPZaJ4umNZBHUzzUnRWtR0PQUDEQ5SWqTw8aUyhpUFmsG6EdejPWqVpkUg
         YLQ5TtInP5F7+Dd+Ob7vZZOzIhaBSnkGf0fHKVQwR55GRQ2E7bGFtQEvHDjc/UA22CxJ
         FM8Q==
X-Gm-Message-State: AOJu0YxYxhrL/7PtPIROhPuTR7ZGZewtE3WWrynVIerofvvlDEwnBjSk
        KpU2W8wPh7xrm/xGteNyCeRkS/GtJnG5qC7GcRR17EqH519mxEsnbhyBOw==
X-Google-Smtp-Source: AGHT+IF4wkLXoGKZPiaqLQZEiPIUz3gw7dF1jVcdPxs6SIlTJfF6sth9ZfX5dP0Y9e4r2IKnebKWtFTShXfknevnC9c=
X-Received: by 2002:a25:b301:0:b0:d86:476c:3f9b with SMTP id
 l1-20020a25b301000000b00d86476c3f9bmr9806625ybj.17.1696179702127; Sun, 01 Oct
 2023 10:01:42 -0700 (PDT)
MIME-Version: 1.0
From:   Minh Le Hoang <minh.lehoang@novoserve.com>
Date:   Sun, 1 Oct 2023 19:01:31 +0200
Message-ID: <CAAi1gX6u0giV3U9DrnqGfTDQRYvL5D=R6za55JSk5goPAHpczQ@mail.gmail.com>
Subject: Xdp synproxy causes tcp resest
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi everyone, currently I am trying to make the xdp synproxy work from
the sample of linux kernel repository. I take the xdp kernel code from
here: https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
 , and the xdp synproxy userspace program from here:
https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/xdp_synproxy.c
.
I set up my testing environment with 3 network namespaces: ns1 as a
server, ns2 as a router and ns3 as a client. I set 4 virtual
ethernets: veth1 with peer veth2, veth3 with peer veth4 and add them
to the different namespaces. To be specific, I use veth1
(192.168.1.1/24) for namespace ns1, veth2(192.168.1.2/24) and
veth3(192.168.2.1/24) for namespace ns2, and veth4(192.168.2.2/24) for
namespace ns3. For the namespace ns1, I enable tcp syncookie, tcp
loose contract by using these command:
sysctl -w net.ipv4.tcp_syncookies=2
sysctl -w net.ipv4.tcp_timestamps=1
sysctl -w net.netfilter.nf_conntrack_tcp_loose=0
Then I upload the xdp synproxy program to the veth1 using this command:
./xdp_synproxy --iface veth1 --ports 80 --single --mss4 1460 --mss6
1440 --wscale 7 --ttl 64
and upload the xdp dummy kernel program, which is just simple xdp_pass
to the veth2 interface of namespace ns2 with this command:
ip link set veth2 xdp object xdp_dummy_kern.bpf.o section xdp
. Most of my setup is taken from the test program from linux kernel repository:
https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/prog_tests/xdp_synproxy.c

After that, I run the a simple http server at port 80 in namespace
ns1. I use the netcat in network namespace ns3 to check for the tcp
connect:
# nc -v 192.168.1.1 80
nc: connect to 192.168.1.1 port 80 (tcp) failed: Connection reset by peer

. I debug using tcpdump and xdpdump in both interface veth1 and veth2
and discover that the xdp synproxy program allow tcp ack packet to
passthrough but does not notify the host which causes invalid tcp
state and causes the server to respond with tcp reset flag. For more
detail, here are the link to the Wireshark files of veth1 and veth2:

https://www.dropbox.com/scl/fo/26kgk8sfozme1d6cc9zn4/h?rlkey=s1y9klybryilk5btylnp0dttg&dl=0

Why does this problem happen? What should I do to fix this problem? In
addition, I notice that if the veth2 interface does not attach the xdp
dummy program, it does not recognise the tcp syn-ack packet generated
by xdp synproxy program. What could be the solution for this?

Kind regard

Minh.
