Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD4B3580A2
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Apr 2021 12:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhDHKck (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 8 Apr 2021 06:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53930 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229686AbhDHKcj (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 8 Apr 2021 06:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617877948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wfcDJnGBmHGKyv7MIWsdbsTjVCkqIMiyzkucnqwUyok=;
        b=g3hWXCb3+GRmJHZsFsnV/4eXDHf55mJ0uZGkWgfvdUPDNGUp+yTUPTKTwSITiEm3JglSto
        CPQf/hxLS1+IxYwCntwTafw2gQ/3oM/DMtV+mgwtDK7UrpkpuLV0eP+1Esa42OpO8271XI
        xWwPJbzglT09HmBM0GzLpt3xH1in50w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-OflHut_iObiCAoQVnAeJlw-1; Thu, 08 Apr 2021 06:32:26 -0400
X-MC-Unique: OflHut_iObiCAoQVnAeJlw-1
Received: by mail-ej1-f71.google.com with SMTP id jt26so643760ejc.18
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Apr 2021 03:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=wfcDJnGBmHGKyv7MIWsdbsTjVCkqIMiyzkucnqwUyok=;
        b=fvEKm06Z4E6O43XgZ9muEeyG/n0vxEt8HbxVBZnjoTLGrD6zwftOb51CdTHEOJjxmU
         wpCFUUQTLBLDtN2WGyvZAPYJMOdameDUVPcRu9RF1X3u+ZE8zaskzk6pnwdEFvQvsVO4
         qljRQZhhl5+kmN/r4hIeNxMCIubxvucH3blpqs/VxeSwGPqHge4V1KKETZ83+BNZOLmK
         QLaPNMcU/9bReSCKhI7z/uAs5lSG59w0h+Q61pGltec0sIyyv7yk8n1M3aU+wbq2JuPD
         eZ3Nh/hJt4c9d57Exr1uEa1bZHC80jElZsfaCw+iZHdXVMnRapltx320b2mN4SBCyZ3F
         73QA==
X-Gm-Message-State: AOAM532nficFIBYrSU30OlB+zdYgc1+kwKvYM46Vg/X21hchF89MseSR
        a+g1WtubQKGTX7TvOV0+HGXQ95yNs2ato/0vIv3IYSuNIRkyb9kUxc8a48sgRsFLjuqw+LVDrOt
        Ycb34sJSlHER8CY8wMxmR6gI=
X-Received: by 2002:a17:907:984a:: with SMTP id jj10mr9284810ejc.180.1617877944554;
        Thu, 08 Apr 2021 03:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygPejFhcP0J3GOCI4Ck7i3tILEJmNVlXvqML9bH7DS9xHjjs2JBDsUKWBg8wQJ8RzrnWNxiQ==
X-Received: by 2002:a17:907:984a:: with SMTP id jj10mr9284779ejc.180.1617877944190;
        Thu, 08 Apr 2021 03:32:24 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id h15sm17281421edb.74.2021.04.08.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:32:23 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 796861804B4; Thu,  8 Apr 2021 12:32:22 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Neal Shukla <nshukla@riotgames.com>, xdp-newbies@vger.kernel.org
Cc:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Profiling XDP programs for performance issues
In-Reply-To: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 08 Apr 2021 12:32:22 +0200
Message-ID: <8735w112yx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Neal Shukla <nshukla@riotgames.com> writes:

> We=E2=80=99ve been introducing bpf_tail_call=E2=80=99s into our XDP progr=
ams and have run into
> packet loss and latency increases when performing load tests. After profi=
ling
> our code we=E2=80=99ve come to the conclusion that this is the problem ar=
ea in our code:
> `int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`
>
> This is the first time we read from the packet in the first XDP program. =
We have
> yet to make a tail call at this point. However, we do write into the meta=
data
> section prior to this line.
>
> How We Profiled Our Code:
> To profile our code, we used https://github.com/iovisor/bpftrace. We ran =
this
> command while sending traffic to our machine:
> `sudo bpftrace bpftrace -e 'profile:hz:99 { @[kstack] =3D count(); }' >
> /tmp/stack_samples.out`
>
> From there we got a kernel stack trace with the most frequently counted s=
pots at
> the bottom of the output file. The most commonly hit spot asides from the=
 CPU
> idle look like:
> ```
> @[
>     bpf_prog_986b0b3beb6f0873_some_program+290
>     i40e_napi_poll+1897
>     net_rx_action+309
>     __softirqentry_text_start+202
>     run_ksoftirqd+38
>     smpboot_thread_fn+197
>     kthread+283
>     ret_from_fork+34
> ]: 8748
> ```
>
> We then took the program id and ran this command to retrieve the jited co=
de:
> `sudo bpftool prog dump jited tag 986b0b3beb6f0873`
>
> By converting the decimal offset (290) from the stack trace to hex format=
 (122)
> we found the line which it=E2=80=99s referring to in the jited code:
> ```
> 11d:   movzbq 0xc(%r15),%rsi
> 122:   movzbq 0xd(%r15),%rdi
> 127:   shl         $0x8,%rdi
> 12b:   or          %rsi,%rdi
> 12e:   ror         $0x8,%di
> 132:   movzwl %di,%edi
> ```
> We've mapped this portion to refer to the line mentioned earlier:
> `int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`
>
> 1) Are we correctly profiling our XDP programs?
>
> 2) Is there a reason why our first read into the packet would cause this =
issue?
> And what would be the best way to solve the issue?
> We've theorized it may have to do with cache or TLB misses as we've added=
 a lot
> more instructions to our programs.

Yeah, this sounds like a caching issue. What system are you running this
on? Intel's DDIO feature that DMAs packets directly to L3 cache tends to
help with these sorts of things, but maybe your system doesn't have
that, or it's not being used for some reason?

Adding a few other people who have a better grasp of these details than
me, in the hope that they can be more helpful :)

-Toke

