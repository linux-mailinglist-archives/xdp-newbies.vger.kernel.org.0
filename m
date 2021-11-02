Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A056443803
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Nov 2021 22:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhKBVsv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 17:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbhKBVsu (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Nov 2021 17:48:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEF2C061714
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Nov 2021 14:46:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 5so2264864edw.7
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Nov 2021 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=94iJRhAfc6ykKW4JaQp5t8yrlhWNPvq8XQ2glLltDMU=;
        b=XsrB8/2NgwdJALJj0dvV1cDCI1uN7ym0c8cLmnQjQSyWaLn9qMgLh1JFzWhAAxE5yE
         kewvA3ePM/RqJQLMZVub3uBxvIWevHjNaWlADL8rc5kAaGhSoxL3cyRvGyTH8C343oID
         bZyBNwxdejTel6jK90kCffI2p1Wxf9qn3yNlVybsN6aA9LpFU2idZ9Xwj+hsk5zCuJMk
         GUc4ZIjNFmHLCuiUsi3gjQ8YgVtG2COGzq3vMvjHp58pCCvjzwiCQWk9bmHIolKJ9GEi
         f5WJB6RRcNBUMerqI1QXRlAe1zZhX/lO0P8oMo/u6oTRQz+/awfbMExgfmRSI5HdmY1X
         ZMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=94iJRhAfc6ykKW4JaQp5t8yrlhWNPvq8XQ2glLltDMU=;
        b=WAv3atju5+GmSG4nFV1vPoryoxbd+vdUTh3KO2qM+v2raCPJE8M58HMeLM7NMUI80D
         Yggm95UilqlcZrNPhn/JQTEw8C8AGcQ3pHMYDA2uPR6E1PZ3YvLCIC8ZFEDxqflD3mSt
         +4PQVM4gBubOwlx8fHJbQ9xQWdbU4gXyKn399cIKTstk/F16ap8W+X7AjCJ9XZgjQSfT
         6eplapEP50nPLeRQA1gp33mhkJAbIH9ky2DQ0Xh1/8N/VRur9uMW/6AaoOWmthutJ5gM
         Jailbzx3cp+6O2AKBjeJI+PzRt4T9GzO8jyZmtLmZSmFGeIlcHcjVVJnV18/gSMEcxzx
         sf1Q==
X-Gm-Message-State: AOAM533dyonirdvQbiHQLvaMKe7S1KSQf/JIHVVSw7+GCIFZcJdLL2UB
        devAIzX0J5TDC8HI12c24XKRvfjrXkd34DxqHLxoxoIRRaVKwg==
X-Google-Smtp-Source: ABdhPJzhSXOQ9KqmktJfEEHdkj8Lf8DXLB5hpOeevvqbdH3ECUPTPaCbLkq4Bme5lpTuskA6QrTLSzKvcSFu5vbmDlU=
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr49599529ejc.452.1635889573578;
 Tue, 02 Nov 2021 14:46:13 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ThomasPtacek@gmail.com
From:   Thomas Ptacek <thomasptacek@gmail.com>
Date:   Tue, 2 Nov 2021 16:46:02 -0500
Message-ID: <CANDGNvaJZxXJaDYQKOF0pRZD5GWQYYZytnPyOUcZtejYE39jLg@mail.gmail.com>
Subject: TC bpf_csum_diff problems post-5.6 kernel
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

The problem I'm dealing with is XDP-adjacent, but not itself an XDP issue, so
disregard if I'm too far outside the charter of the list. :)

We run an XDP/TC-based UDP CDN.

"Edge" machine XDP takes UDP packets off eno1, slaps a proxy header on
them and bounces them to a wg0 (WireGuard)  interface, which shuttles them
to "Worker" machines.

"Worker" TC BPF on wg0 intercepts those UDP packets, strips off the
proxy header, reflects values from that header back into the UDP and IP
headers of the skb, and fixes up the checksums.

All this works fine up through kernel 5.6. But we're working on a fleet update,
and something >= 5.8 is breaking my code (or my code was always broken
and relying on some pre-5.8 bug to function).

With a bunch of perf debugging I've narrowed the problem down: it's the
checksum diff that accounts for the stripped header. I do (roughly):

    /* not shown: parse, copy proxy header to stack */

    bpf_skb_adjust_room(ctx, -12, BPF_ADJ_ROOM_NET, 0)
    skb_pull_data(ctx, sizeof(struct iphdr) + sizeof(struct udphdr))

    /* not shown: re-check packet pointers, set up pointers to headers ... */
    sum = ~((uint32_t)(udphdr->udp_sum))
    sum = bpf_csum_diff(&proxyHeader, 12, NULL, 0, sum);

    /* not shown: make other checksum fixups, write sum back to packet */

Using some perf-based printf debugging, I can see that the checksum
I'm getting from that bpf_csum_diff is wacky. Further: if I just leave the
proxy header in the UDP packet, but still change the UDP ports and
IP addresses, I get valid UDP checksums (albeit with a useless packet
that has a proxy header still in it).

I'm wondering if anyone can think of something that would have happened
post-5.6 that would have broken this (or if there's something obviously
abusive I'm doing with my "working" code, such that this never should have
worked to begin with).

---
Thomas H. Ptacek
