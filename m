Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF536C38B0
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Mar 2023 18:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjCURzc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Mar 2023 13:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjCURzb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Mar 2023 13:55:31 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321A451F8C
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:55:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id s8so9429451pfk.5
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679421327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6b8K003AEu3G3QOQKazEiHZKsRTVXXmD5fQwW9/BY0=;
        b=nTuvciCulTxQv3iTR24lrZNO6ae4xldr3EvabQyBjPOeZFIHIsLjU3WBEaSO4xvIoy
         6vnkOuzqwz8V8aw/S68MXJlxD7QB4LiFNScKdaRKGk2hFzQSFV4I0MpGkKuAJyDybG3S
         28+cWVZqJQrAt5ipHAIiGwzocldZ5jBMbXSooKrQrJQd5PI9tzZb+r2a14DLpeQFK+r0
         JNyctjxD2cQJ6N0XIQlrbQW9X6JPMf6nW1d5kc/lX5kKWyTu8Ifztj94qNS0SP0vL1g6
         TplelgT1/5T4li4QEDcy6Nd8dmDv0aSvYxxfRiLDzK9K2E3uCmrrGYo81XqQDpK/XIvD
         hUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679421327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6b8K003AEu3G3QOQKazEiHZKsRTVXXmD5fQwW9/BY0=;
        b=UbZhba9QpDnsqcoNlqoqnsiU/7/LQJ+8pqYC78aBFSo/SpKBszqtgstDWGEP7zDqeD
         l3fqwj5SzjgZPVtxsDA2U7mbIYakZB9T/rB85XFFYyLl2to44B8gm3eYojxwznMFYgb7
         ZTTA1VxjvLVXnSNuZW8KFYOUS9gqtzljG5m1kVAOCKtFfVbEqaZTgAsq1x5fUFjDz/YO
         Nua1jWQWahfKl05S3V0bWBygdF7/nntm3f0EN3/t0c+NJ1DhaYLuao+fDQc6Z5pFGW68
         cbgoh2BFiwHzNxvrr1OzeKL/eqVdanQ/j6ZSw4qNpu4tfMAbqiC8uRUEzRClSqBpvn+w
         30Hw==
X-Gm-Message-State: AO0yUKXaeO8DDukQML05dtMnz7CGENCBQoFtHZX02rLvrVki20GI2EnK
        +kFRv/P68xpjNwPoMmycx8tGWRK9zhLHqIZM7+mjsFoHBUauXg==
X-Google-Smtp-Source: AK7set9hojtU2w8xb0GMGlilqzvrxxoOT138VkHDR+s1QwtYQwIyEgTx0YTJn2ydyc2mSb3Li0aF6jDhWfA99h3J7fM=
X-Received: by 2002:a05:6a00:9a0:b0:627:2973:b118 with SMTP id
 u32-20020a056a0009a000b006272973b118mr407708pfg.1.1679421327307; Tue, 21 Mar
 2023 10:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com> <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
 <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com> <875yau80g4.fsf@toke.dk>
In-Reply-To: <875yau80g4.fsf@toke.dk>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Tue, 21 Mar 2023 10:55:16 -0700
Message-ID: <CAK3+h2xt-rmizCv54cuJvii+6Ui-PuQSi2es6FS65fmZ0ise6Q@mail.gmail.com>
Subject: Re: How to get system localtime/wall time from eBPF?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Jesper Dangaard Brouer <jbrouer@redhat.com>,
        xdp-newbies@vger.kernel.org, brouer@redhat.com
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

On Tue, Mar 21, 2023 at 10:43=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <=
toke@redhat.com> wrote:
>
> Vincent Li <vincent.mc.li@gmail.com> writes:
>
> > On Mon, Mar 20, 2023 at 2:57=E2=80=AFPM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> >>
> >> On Mon, Mar 20, 2023 at 10:15=E2=80=AFAM Jesper Dangaard Brouer
> >> <jbrouer@redhat.com> wrote:
> >> >
> >> >
> >> > On 20/03/2023 16.33, Vincent Li wrote:
> >> > >
> >> > > if I have a XDP based firewall to block ip  access based on system
> >> > > localtime/wall time, is it still impossible like what mentioned he=
re
> >> > > https://github.com/xdp-project/xdp-tutorial/issues/204#issuecommen=
t-819419800?
> >> > > If so, is there any way to workaround this?
> >> >
> >> > You could use the BPF-helper named: bpf_ktime_get_tai_ns()
> >> >
> >> > See man clock_gettime(2). It is the same as CLOCK_TAI, which is
> >> > (currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock=
.
> >> >
> >
> > sorry a follow-up question, the bpf_ktime_get_tai_ns will return time
> > as nano seconds, right?
> > I do not need the nanoseconds precision, I only need HH:MM like hours
> > and minutes of the day, for example 10:30 =3D 10 * 60 + 30 is good
> > enough,
> >  any trick get that from bpf_ktime_get_tai_ns()
>
> Populate the time at latest midnight from userspace when installing the
> program and calculate offsets from that?
>

Yes, I populated the map with 10 * 60 + 30 from user space, the
remaining question is how to get minutes of the day from
bpf_ktime_get_tai_ns(), I guess that is what you mean to calculate the
offsets from kernel bpf code?
