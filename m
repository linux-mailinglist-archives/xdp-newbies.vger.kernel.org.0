Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951C16AC499
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 Mar 2023 16:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjCFPPW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 Mar 2023 10:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjCFPPS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 Mar 2023 10:15:18 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE093211EB
        for <xdp-newbies@vger.kernel.org>; Mon,  6 Mar 2023 07:15:04 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id i34so39988113eda.7
        for <xdp-newbies@vger.kernel.org>; Mon, 06 Mar 2023 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1678115703;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TTSTT2p+CPMM2TBQP78+1J3GxXq6iOUVTuAb1vKWFE=;
        b=UZSmaVgKD21E5DmrUwRcCUfck2sahVVbiQFFnckRCc7q0uMRx7w3tXIvlIimuQcUoO
         wxEbDyKjAxDFHLsOItt+mGzeXBV4I6gqwSLsgOTXaNTrXlhJu2zTcldWeAHUsD5UvrH7
         OvT8QRBA82FKika8NqUEiF771Z3jMznLi4JOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115703;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TTSTT2p+CPMM2TBQP78+1J3GxXq6iOUVTuAb1vKWFE=;
        b=6csesVbby2NjaIO1p1ONzhoLcZw4G6WESlwsXjZIcxGK8EJQ5ziTXVgBdIL/3+Hrjj
         8sDEHceBOF+7Uru6dQqwKVc6fK78YDNs5Q7hPLffiu0L/tQE+lgMzHkLn4S5p1NnUR6X
         JTJJv3WEuuousC24VbJu9hpl2NO3rpAzftO6ZsXqPEx/qQAilJkP7Ht5nUsoQ647tigI
         0pZDLPG7i0w1TxEG3p7JANfXhDxatsqVi2Sy5Di4utaUlcg75Ja0xAsH7T6YacxbRPJR
         ZDw/nuIz5uy3BtB5B+JId5EdHBOXiKtGFV0/lebAbKoxxpSdTD0DzZBq0im4UIVZJwm+
         jdKQ==
X-Gm-Message-State: AO0yUKUkoaoSipo+IQ/hn1VCLC8JVfmZ054eEW5OIT6A6RRlGSip6UeY
        on0J/sSk4qqX24ken3wDMr40Ntcta8pW/TyGz5AO487XgYCAoEpD
X-Google-Smtp-Source: AK7set+wi+4kzy3qCTj4VzMW5Wj+uJ1xKDA6m06E0WMwfuxCDgu9FLv+1lyQCIu11t512YHY2xOv13vLCoHAEtGHB4g=
X-Received: by 2002:a17:906:5811:b0:877:747d:4a90 with SMTP id
 m17-20020a170906581100b00877747d4a90mr5416120ejq.14.1678115703033; Mon, 06
 Mar 2023 07:15:03 -0800 (PST)
MIME-Version: 1.0
References: <CAHApi-kjcGOcKuat3fjW_RVLLONT4Vw=60NvgOgBve-d_RgeCg@mail.gmail.com>
 <CAHApi-k8gexhi=jiuHarbB3Key4d7_CigKSj5CZH6cf0B_bbQg@mail.gmail.com>
In-Reply-To: <CAHApi-k8gexhi=jiuHarbB3Key4d7_CigKSj5CZH6cf0B_bbQg@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Mon, 6 Mar 2023 16:19:29 +0100
Message-ID: <CAHApi-kp-jsQxu7XEAxEodhjb_oCJgpVEbbia2wMD0qdZ9bK6A@mail.gmail.com>
Subject: Crash in mlx5e_dealloc_rx_wqe [mlx5_core]
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi XDP developers,
I am getting an intermittent kernel crash using XDP with Mellanox
hardware. I can reproduce this on two different machines by running
the `xdpsock` example.

Setup:
(0) I am using kernel version 6.1.14 and NICs "MT27700 Family
[ConnectX-4]" and NIC "MT2892 Family [ConnectX-6 Dx]" (both crash).
(1) ethtool -N <INTERFACE> flow-type udp4 src-ip <SOURCE_IP> action 0
(2) Generate traffic on <INTERFACE> from an external machine. I am
using `trafgen` to send jumbo packets (payload size 3401 bytes).

How to crash it:
(1) Run `xdpsock` from the bpf-examples repo (it may not trigger the
first time, try killing xdpsock and restarting it multiple times).

./xdpsock -i <INTERFACE>
<CTRL-C>
./xdpsock -i <INTERFACE> --frame-size=2048
<CTRL-C>
...

Sometimes it crashes when killing `xdpsock` (I think), sometimes it
crashes immediately on start (e.g. with --frame-size=2048).

I have a screenshot of the error message. Please email me directly and
I will send it to you.

Thanks,
Kal
