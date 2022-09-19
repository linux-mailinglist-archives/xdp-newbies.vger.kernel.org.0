Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C05395BD5EB
	for <lists+xdp-newbies@lfdr.de>; Mon, 19 Sep 2022 22:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiISUzZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 19 Sep 2022 16:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiISUzZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 19 Sep 2022 16:55:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1892449B7F
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Sep 2022 13:55:24 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id s6so488328lfo.7
        for <xdp-newbies@vger.kernel.org>; Mon, 19 Sep 2022 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=oRNwx0LyenjJWa/3QlAGfIReUKEXMAs1vDx50HVwa14=;
        b=Xsafw/VhVjF136Wvs3d3bUYZwKppS5eR19G46c7ur1ZK9FC3Kfgv0KkFpgfvk3hfDS
         IkVba/Fu9FGqPrmJO+HZtIhng3FsyN4xWBiF3O5FubiEwZizhZVEaZfyAhhhJb4jM56b
         dgrOsTXNSyZ+Bkk2b5KuiK/6CkQU/dJGY97GYV4L73wMWXNONUXnO+Exr/hYkuTzS1Hc
         vd17ROLn5l0GDu7cTmsgqEBXMqkEuBqPVcydPPMtvs2aeg7WwjoxBwJyz9Y9Cvr5llLi
         x2+xv6EyqkJ5KeYkDFUnxTSYnNeUCkuewReqsBjDnIIM0knhN2IQeXlEAy7UEDtupjck
         oqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oRNwx0LyenjJWa/3QlAGfIReUKEXMAs1vDx50HVwa14=;
        b=2KqyrwS1XP+Jnh3rtbjYIbSQtzg63c+Jphdz2wXbf61nqLN9wb+7ze9eJNqC/Zd3+L
         g91Y0Sbk1+x8xKeWSYQx+4PJ34VZ9WvxI2e9wqG6LqlUf9/zsqxG5L/D7rW1App87d06
         NeCY77QNdztIzfv5FzKDcs01XMm/+S7Fr0eznIGExspn3a3VTVioS1fZHpdxOIzR7FPK
         iIIfBjaEOwyzXWpqlcN9bMhaIE5lyr0tcWaAAQGj5JCP4uIFWrz1k0Kb67K76IXNllHA
         cqT8LuAWILbMY2g9VhPrYbGWE80E+V/BvUcJyuPxyvjXQijNWELoIN9/mfsuW7BVGpkU
         jcAw==
X-Gm-Message-State: ACrzQf2iHWKLpNbQ5qG55qrtrVIcwd3B7mMjCyjjlf/N0zCqXuQezWVy
        L+/tgwhb9I57bHQb4OJrQiplVaQq3DIZzg/XPw66Hi24QDxHsw==
X-Google-Smtp-Source: AMsMyM6lwSQ1MeqDkTkAmLNytKUZIGgwcWbYBlNavh6QW1yOGPVZ0YoTeuXoqh6vPLWJNwkjS1Fm89ekEzynnIaE7kY=
X-Received: by 2002:ac2:4a61:0:b0:497:ae0c:4f66 with SMTP id
 q1-20020ac24a61000000b00497ae0c4f66mr6571527lfp.660.1663620921231; Mon, 19
 Sep 2022 13:55:21 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Smith <hrotsvit@gmail.com>
Date:   Mon, 19 Sep 2022 15:55:08 -0500
Message-ID: <CADx6jH51gFXRvp2H76eePrz2oTw5-Av6nV4-N+CVVcgDKAuL2A@mail.gmail.com>
Subject: Questions about IRQ utilization and throughput with XDP_REDIRECT on
 Intel i40e
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

In trying to understand the differences in IRQ utilization and
throughput when performing XDP_REDIRECT in a simple netfilter bridge
on the Intel i40e, we have encountered behavior we are unable to
explain and we would like advice on where to investigate next.

The two questions we are seeking guidance for are:
1) Why does XDP in the i40e driver handle interrupts on multiple IRQs,
while the same flows are serviced by a single IRQ without XDP
(netfilter bridge)?

2) Why does the i40e driver with XDP under load seemingly get faster
when tracing is attached to functions inside the driver=E2=80=99s napi_poll
loop?

Our working theory is that the i40e driver is not as efficient in
interrupt handling when XDP is enabled. Something in napi_poll is
looping too aggressively, and, when artificially slowed by attaching
to various kprobes and tracepoints, the slightly delayed code becomes
more efficient.

Testing setup:

Without XDP, our iperf3 test utilizes almost 100% CPU on a single core
to achieve approximately 9.42 Gbits/sec. Total hard IRQs over 10
seconds is as follows:
i40e-enp1s0f1-TxRx-1            127k
Iperf3 retransmissions are roughly 0.

With simple XDP_REDIRECT programs installed on both interfaces, CPU
usage drops to ~43% on two different cores (one significantly higher
than the other), and hard IRQs over 10 seconds is as follows:
i40e-enp1s0f0-TxRx-1            169k
i40e-enp1s0f0-TxRx-2              82k
i40e-enp1s0f1-TxRx-1            147k
i40e-enp1s0f1-TxRx-2            235k
Throughput in this case is only ~8.75 Gbits/sec, and iperf3
retransmissions number between 1k and 3k consistently.

When we use bpftrace to attach multiple BPF programs to i40e functions
involved in XDP (e.g., `bpftrace -e =E2=80=98tracepoint:i40e:i40e_clean_rx_=
irq
{} kprobe:i40e_xmit_xdp_ring {}=E2=80=99), retransmissions drop to 0,
throughput increases to 9.4 Gbits/sec, and CPU utilization on the
busier CPU increases to ~73%. Hard IRQs are similar to the
XDP_REDIRECT IRQs above.

Attaching traces should not logically result in a throughput increase.

Any insight or guidance would be greatly appreciated!

Adam Smith
