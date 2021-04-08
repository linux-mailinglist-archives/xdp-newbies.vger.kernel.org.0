Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5751358C10
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Apr 2021 20:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbhDHSUr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 8 Apr 2021 14:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhDHSUo (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 8 Apr 2021 14:20:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE99C061760
        for <xdp-newbies@vger.kernel.org>; Thu,  8 Apr 2021 11:20:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id r8so5526834lfp.10
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Apr 2021 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fpgwW2K1DrzvivhEIvJdL9DONhX9fLsTi+h7GRC+dMc=;
        b=AiW6KHoqqh2OMXioJQt3/11xmSK9z0+E2lUNugR1eoa+J/5qlEwMj8uwNPeegHQ0uJ
         LM4S2XLCtt36JZHzDlR3zxZh63u1TmE3iT4BJobVP0zBVyA3ntKE0ddKwVqMSq2IkwhR
         28cyGv3LbT/c/kzHBTKCxAx7YZhKmdVT9ZUyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fpgwW2K1DrzvivhEIvJdL9DONhX9fLsTi+h7GRC+dMc=;
        b=AYTqRrzqE3vaUwtQIVkmpnidXx6zeowsgINULw5bBcFhGqwLyJBlw24tsTgirPXUI+
         6Ac0tldPAtLpi3ksVQoYpHgeOvJkB2+V8xvLyS7N4l2lO2fNetUJOrN300XzVcfvH8WZ
         tpAVSSo54ZLiee6R3++xV3LmGEuO+MNW681IssKG0pA+/84g+e75jqiz/pBP51yIXk29
         NXT0WdzBw23lI20ka0vG/kw2QEyWgnXfcFXSuL+ljh2DA3/oNSmSCWEXFd3jFvWJPmC3
         oBWFC96iwIvuUBGxgB/5WSaXe+Uia8eN2Kt7VWgpVsWUb76sQGngIVkGJM3o5CZrSIud
         DpEw==
X-Gm-Message-State: AOAM530PnEiDc3Ktw42NIDy7Eb0AG+Ep1mbIblNpLKJsvjzfBCiSw19K
        f4+ilF2UBZyiKcBOIETa357cEXfD1RFi752eyA1XGA==
X-Google-Smtp-Source: ABdhPJxo9EdVpOtiHhK8xjIfjLco/S242RkFOCUisZ8USxIUl9FBwj1tPFokpH+9kD9HuqBm0HRQjyHs0detzKYiki0=
X-Received: by 2002:a05:6512:2192:: with SMTP id b18mr7593191lft.515.1617906030847;
 Thu, 08 Apr 2021 11:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwr_MfAsdj_Ks3RkufEneCzN24nPG=MvdLkw+ZkayPycJHDkA@mail.gmail.com>
 <8735w112yx.fsf@toke.dk>
In-Reply-To: <8735w112yx.fsf@toke.dk>
From:   Neal Shukla <nshukla@riotgames.com>
Date:   Thu, 8 Apr 2021 11:20:19 -0700
Message-ID: <CAJwr_Mcxx776KgBXySv961V9Q2XrAf6pvcqu0Ttek6iqLj4gvg@mail.gmail.com>
Subject: Re: Profiling XDP programs for performance issues
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

System Info:
CPU: Intel(R) Xeon(R) Gold 6150 CPU @ 2.70GHz
Network Adapter/NIC: Intel X710
Driver: i40e
Kernel version: 5.8.15
OS: Fedora 33


It=E2=80=99s worth noting that we tried expanding the DDIO to full (0x7ff) =
and
a little more than half (0x7f0) with no material effect.

- Neal

On Thu, Apr 8, 2021 at 3:32 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> Neal Shukla <nshukla@riotgames.com> writes:
>
> > We=E2=80=99ve been introducing bpf_tail_call=E2=80=99s into our XDP pro=
grams and have run into
> > packet loss and latency increases when performing load tests. After pro=
filing
> > our code we=E2=80=99ve come to the conclusion that this is the problem =
area in our code:
> > `int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`
> >
> > This is the first time we read from the packet in the first XDP program=
. We have
> > yet to make a tail call at this point. However, we do write into the me=
tadata
> > section prior to this line.
> >
> > How We Profiled Our Code:
> > To profile our code, we used https://github.com/iovisor/bpftrace. We ra=
n this
> > command while sending traffic to our machine:
> > `sudo bpftrace bpftrace -e 'profile:hz:99 { @[kstack] =3D count(); }' >
> > /tmp/stack_samples.out`
> >
> > From there we got a kernel stack trace with the most frequently counted=
 spots at
> > the bottom of the output file. The most commonly hit spot asides from t=
he CPU
> > idle look like:
> > ```
> > @[
> >     bpf_prog_986b0b3beb6f0873_some_program+290
> >     i40e_napi_poll+1897
> >     net_rx_action+309
> >     __softirqentry_text_start+202
> >     run_ksoftirqd+38
> >     smpboot_thread_fn+197
> >     kthread+283
> >     ret_from_fork+34
> > ]: 8748
> > ```
> >
> > We then took the program id and ran this command to retrieve the jited =
code:
> > `sudo bpftool prog dump jited tag 986b0b3beb6f0873`
> >
> > By converting the decimal offset (290) from the stack trace to hex form=
at (122)
> > we found the line which it=E2=80=99s referring to in the jited code:
> > ```
> > 11d:   movzbq 0xc(%r15),%rsi
> > 122:   movzbq 0xd(%r15),%rdi
> > 127:   shl         $0x8,%rdi
> > 12b:   or          %rsi,%rdi
> > 12e:   ror         $0x8,%di
> > 132:   movzwl %di,%edi
> > ```
> > We've mapped this portion to refer to the line mentioned earlier:
> > `int layer3_protocol =3D bpf_ntohs(ethernet_header->h_proto);`
> >
> > 1) Are we correctly profiling our XDP programs?
> >
> > 2) Is there a reason why our first read into the packet would cause thi=
s issue?
> > And what would be the best way to solve the issue?
> > We've theorized it may have to do with cache or TLB misses as we've add=
ed a lot
> > more instructions to our programs.
>
> Yeah, this sounds like a caching issue. What system are you running this
> on? Intel's DDIO feature that DMAs packets directly to L3 cache tends to
> help with these sorts of things, but maybe your system doesn't have
> that, or it's not being used for some reason?
>
> Adding a few other people who have a better grasp of these details than
> me, in the hope that they can be more helpful :)
>
> -Toke
>
