Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E9132B183
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Mar 2021 04:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhCCBv3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Mar 2021 20:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447352AbhCBN3G (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Mar 2021 08:29:06 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C19C061A2A
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Mar 2021 05:28:25 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id c19so1934963pjq.3
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Mar 2021 05:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTl1w+P56sPYXDsVtU19vdFxI4XW+z1iHre4Dl3jxHo=;
        b=drCnH/DbpeCaKQtf7eI8OIQeJIeBfQVf336wt98Bnnt1ujCvbowYEfGxeHduWXmlNt
         aNwDDGK+u/EoZlQe5vR6xOdtSqBQP4DAT/aUEp8aRarIyT5gaEKzGXIPoOEEEAb2zXlq
         JspAmwm6oEHokROorEQcB3K4xUk1UjW2kjWV50bE/amYTyvu0afBFr6smEXW5pl4XxzQ
         lQdgtcsi5WTfOMdVxlYt/IgrjibdMuG3XZn7qoqmOof5cpvoYCy9ogooVW1iHGIzPn/f
         KsPNk744ASuC8tx7xgrINVw79mzYCVIpvtWQ44TaVNqQ1Gq7bJHRjqLnbPAHst7aQYrF
         tF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTl1w+P56sPYXDsVtU19vdFxI4XW+z1iHre4Dl3jxHo=;
        b=Pj1i3vTprRydoZM54nbZfWwd1TyVHv2Lml/RQ/FFC1I/3wswZxxnogXLl1DG5AW32A
         BhF8NgD6nXX/H5gRI84BpQSUOlyazTktT3LkyuSI6RxMlsajrue9pn8vCryS5p6iTQzs
         ExKLgrmB6gVmJQ1FPfPu7ciibmQdhL1DZg5KmEfaJshb8JUaTb9Rtfq7ceSmJA4FOpLa
         g0CispnkiVhSCd0j14mAa3wXdF5AQC6ikETCrlEAfZHo0o8q9c0ZBewfaQS3P3bJ7OPe
         mFdSmWZH+UnPLdwpOeZreB69SAcWiuZgEBWby66Oa86VR0+jTltiRneknDoYUcJXPNLt
         +E7w==
X-Gm-Message-State: AOAM530xq7jekL5WiLKtU+K31UuEkpTyLskyEcQfG+ijbrOt7jxMF9jG
        5PnG5UKOhf+7VYXPGsu5lLuarpqCoeOJrJUSBq4zzMoV8ao=
X-Google-Smtp-Source: ABdhPJysug/880qxAoUu62Dcbxf66Sry1jQi4RX30l9WFwDou9kLwdkZb1pW3PxrfeQnIs586TKvr69p+GQ9euE0MPk=
X-Received: by 2002:a17:90a:ce92:: with SMTP id g18mr4560042pju.52.1614691704735;
 Tue, 02 Mar 2021 05:28:24 -0800 (PST)
MIME-Version: 1.0
References: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
In-Reply-To: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Tue, 2 Mar 2021 18:58:12 +0530
Message-ID: <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
Subject: Re: Putting Into Account Packet End (ctx->data_end)
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Mar 1, 2021 at 9:40 PM Christian Deacon <gamemann@gflclan.com> wrote:
>
> Hey everyone,
>
> I wasn't sure if this belonged on the BPF mailing list or XDP Newbies.
> However, I figured I'd send it to the XDP Newbies list first since the
> project I'm making involves XDP.
>
> In my project, I'm trying to create a pointer that puts in account the
> ctx->data_end pointer. The new pointer is an unsigned 32-bit integer
> that is suppose to represent an IPv4 address. Here's an example of the code.
>
> ```
> void *data_end = (void *)(long)ctx->data_end;
>
> //uint32_t *icmpdata = data_end - sizeof(uint32_t);
> uint32_t *icmpdata = data_end;
> icmpdata -= sizeof(uint32_t);
>
> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
> {
>      return XDP_DROP;
> }
> ```
>
> I'm trying to replace the last four bytes of the packet with this IPv4
> address. When I do this, I receive the following BPF verifier error when
> running the XDP program.
>
> ```
> R7 invalid mem access 'pkt_end'
> processed 909 insns (limit 100000000) max_states_per_insn 3 total_states
> 30 peak_states 30 mark_read 25
> ```
>
> To my understanding, this is due to accessing the packet end (data_end).
> However, I'm curious why this is prohibited if we're trying to go back
> four bytes into memory.
>
> I've also tried calculating the length of the packet and using ctx->data
> like the following.
>
> ```
> void *data = (void *)(long)ctx->data;
>
> unsigned int len = (ctx->data_end - ctx->data);
>
> uint32_t *icmpdata = data + len;
> icmpdata -= sizeof(uint32_t);
>
> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
> {
>      return XDP_DROP;
> }
> ```
>
> However, this states the offset is outside of the packet.
>
> ```
> invalid access to packet, off=-16 size=4, R2(id=56,off=-16,r=0)
> R2 offset is outside of the packet
> processed 931 insns (limit 100000000) max_states_per_insn 3 total_states
> 29 peak_states 29 mark_read 24
> ```
>
> I'm sure there is something I'm doing wrong with the check. With that
> said, I believe I found the verifier check it's running into below.
>
> https://github.com/torvalds/linux/blob/master/kernel/bpf/verifier.c#L2882
>
> It looks like the `mem_size` argument is 0 and offset is below 0 which
> is causing it to fail. I'm not sure why, but I'd assume it's because the
> verifier believes `len` could be negative. Though, I tried adding checks
> for `len` and ran into the same issue.
>
> The XDP project I'm working on is a basic layer 3/4 forwarding program
> that does source port mapping when forwarding the packets. I have it
> working for TCP/UDP packets. However, for ICMP, I have nothing to keep
> track of within the headers. Therefore, I'm trying to add four bytes to
> the packet and appending the client's IPv4 address to the end of the
> packet before forwarding. When the packet comes back, I parse the last
> four bytes of the packet which is suppose to indicate the client IP
> address and remove the last four bytes of the packet. Below is the
> source code at the moment.
>
> https://github.com/gamemann/XDP-Forwarding/blob/master/src/xdp_prog.c#L181
>
> I hope this is enough information, but if isn't, please let me know. I
> also apologize if this is something silly I'm missing/not understanding.
>
> Thank you for your time!
>

See https://lore.kernel.org/bpf/CANzUK5-g9wLiwUF88em4uVzMja_aR4xj9yzMS_ZObNKjvX6C6g@mail.gmail.com/

Srivats
