Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A45A13D001
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2020 23:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgAOWVS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 17:21:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51519 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728899AbgAOWVS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 17:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579126876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=41A5PsaWRzvIv2huIKcSE0zSOJ585MZTKUfioC4Vdhs=;
        b=BSfTQTHv/1Gv+DUzbouhfMzjTJLPLDlVLQGb7u4m2Lv2iLSziVscUbpdQZ8/PT25INrOx4
        qbS3Jsl8GqrgtJnob8T0x/WWd5TSVzGEUOEI0WiveWOjA8lgs0OkkbnuICmep6thENi86P
        t4+u2shRnTrivaAIooAbmKcT7BEfh2w=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-IRdF5eFpM728MRztVMFyZA-1; Wed, 15 Jan 2020 17:21:13 -0500
X-MC-Unique: IRdF5eFpM728MRztVMFyZA-1
Received: by mail-lj1-f198.google.com with SMTP id z2so4461462ljh.16
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 14:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=41A5PsaWRzvIv2huIKcSE0zSOJ585MZTKUfioC4Vdhs=;
        b=gfs1TQIkd0/woCGOb1x5zC5CnjwFpUo+jTR44yewPtn3LOktBGJ1z1rp7ChfhP6qa7
         lwFjZcmnJOCkgPMlcnQk4O3cyb/z1xAkr6dZKNWQOB73nmMYdyWPWOcpwgOP6kHXr+5K
         sG3fbtMcG9XjFRLK78PSqcsXDcDChQ4eXbNjrAAT5wes8x+Swg7Mg85QTT2SLlhDsO1q
         3hmd/IPmtGmw+ducRn+/24H9CBDP3Y1uCYiuAah/pENlYYedctfJqT9Rch8W3h6VJULX
         kku7xM+7ghNXHAmyEVoa2mFtGBgSXI24f/10k22Wk7dTschcqrKC1W2lEAHObUgQvrsu
         5JzQ==
X-Gm-Message-State: APjAAAVYTANFZNwnFiopxq9lr0dcuVwHIO7F8CWYAlrotF9TXIYqUKOM
        E6PrSIyiV6YrtSvL0LBleIUmrACMFlxc6wU4PB4VQSTzJXDZ5rI+gw9g4LnP87u4NNL31D/mpBA
        tbQcIFh/lsH6p4c+UZp8LT94=
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr342131ljs.35.1579126872188;
        Wed, 15 Jan 2020 14:21:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy460KcIk0xOjFaDxHSAKebtS68q00Fj33FvUz3Do2LpFIMr56oDbYQvE3q6qQYql0tsZ4dQ==
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr342124ljs.35.1579126871933;
        Wed, 15 Jan 2020 14:21:11 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id r2sm9461938lfn.13.2020.01.15.14.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 14:21:11 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 803661804D6; Wed, 15 Jan 2020 23:21:10 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <mchun.li@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP invalid memory access
In-Reply-To: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 15 Jan 2020 23:21:10 +0100
Message-ID: <87ftggtl7t.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Vincent Li <mchun.li@gmail.com> writes:

> Hi,
>
> I am writing a sample XDP program to parse tcp packet options, code
> below, compiled ok, when I attach it to a network interface
>
> #clang -O2 -emit-llvm -c tcp_option.c -o - |llc -march=bpf
> -filetype=obj -o tcp_option.o
>
>
> # ip link set dev enp3s0 xdpgeneric object tcp_option.o verbose
>
>
> Prog section 'prog' rejected: Permission denied (13)!
>
>  - Type:         6
>
>  - Instructions: 42 (0 over limit)
>
>  - License:      GPL
>
>
> Verifier analysis:
>
>
> 0: (61) r2 = *(u32 *)(r1 +4)
>
> 1: (61) r1 = *(u32 *)(r1 +0)
>
> 2: (bf) r3 = r1
>
> 3: (07) r3 += 54
>
> 4: (b7) r0 = 2
>
> 5: (2d) if r3 > r2 goto pc+35
>
>  R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
> R2_w=pkt_end(id=0,off=0,imm=0) R3_w=pkt(id=0,off=54,r=54,imm=0)
> R10=fp0
>
> 6: (71) r2 = *(u8 *)(r1 +12)
>
> 7: (71) r3 = *(u8 *)(r1 +13)
>
> 8: (67) r3 <<= 8
>
> 9: (4f) r3 |= r2
>
> 10: (b7) r0 = 2
>
> 11: (55) if r3 != 0x8 goto pc+29
>
>  R0_w=inv2 R1_w=pkt(id=0,off=0,r=54,imm=0)
> R2_w=inv(id=0,umax_value=255,var_off=(0x0; 0xff)) R3_w=inv8 R10=fp0
>
> 12: (71) r2 = *(u8 *)(r1 +23)
>
> 13: (b7) r0 = 2
>
> 14: (55) if r2 != 0x6 goto pc+26
>
>  R0=inv2 R1=pkt(id=0,off=0,r=54,imm=0) R2=inv6 R3=inv8 R10=fp0
>
> 15: (69) r1 = *(u16 *)(r1 +46)
>
> 16: (bf) r2 = r1
>
> 17: (57) r2 &= 7936
>
> 18: (b7) r0 = 2
>
> 19: (55) if r2 != 0x200 goto pc+21
>
>  R0_w=inv2 R1_w=inv(id=0,umax_value=65535,var_off=(0x0; 0xffff))
> R2_w=inv512 R3=inv8 R10=fp0
>
> 20: (77) r1 >>= 2
>
> 21: (57) r1 &= 60
>
> 22: (07) r1 += -20
>
> 23: (18) r2 = 0x0
>
> 25: (63) *(u32 *)(r2 +0) = r1
>
> R2 invalid mem access 'inv' <----------------
>
> processed 25 insns (limit 1000000) max_states_per_insn 0 total_states
> 1 peak_states 1 mark_read 1
>
>
> it appears optlen = tcphdr->doff*4 - sizeof(*tcphdr); is invalid ? if
> I comment out lines between 60 and 73, no problem with invalid mem
> access

You have to check that you're not reading out of bounds before
dereferencing the bytes in the TCP header...

-Toke

