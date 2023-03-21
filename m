Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895146C382B
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Mar 2023 18:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCUR1Y (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Mar 2023 13:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCUR1X (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Mar 2023 13:27:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6055651FBE
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:27:21 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a16so11877053pjs.4
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRLNOGf2lcVYd2tTK3pw1WXUHHVs+OsBFNm7xQ7Gt/U=;
        b=Cbr/+3+KZ78bZPd54DPZ8oZ4P834xQEVwWMSEmAZhtaCOsgN7Zco6JQ97wDVanJt9D
         buKZQ5RJAB7lkBCgJhQJxEXeHg1BmYgjNUUFDUPM+hlpuIYRm+26SVhxbPlqPsYw7qMD
         kz+7yFo+185jOliajcwPQWn5Fh66Tm1KaYvq1X2yW25IcWBJBTjh0r0bTam0hVpWhugI
         +i57WD7qe9LdwOTGu0EAyWlb/IqIH3S16+nHTbXDrQ0iCXTsocftuGNl4H3GiSt+EjPo
         y16BouzX5J6GKeOrfGCT7TYV907eTHSaIrQjyV3iVW8VqeWwmNRlZhp6UFaK6dmzSOu7
         T6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRLNOGf2lcVYd2tTK3pw1WXUHHVs+OsBFNm7xQ7Gt/U=;
        b=BIuomGsga10yIgB5XtGIl0AdqqNK0FJYLPyzTJ9d95cJsGerI4gX5ZFh+RmD0BoDeE
         Jm+hxhR4KaB81kfU8gmWTlgymJwE8gmupTP5mBC+EFT/f6p0fYNs2Xeez1slX1kzhsge
         nS0E/t1GdaUCHiESlwhwJjTNZd6gBRWTY+ZSxmVFlY/GtadBxQlBFDr26L/whPDiLUzR
         k3mvfhlKzW2GRhAi4lrfNQX/8g1Ks9ivfmYgWAj1Ma/dzwprLRrC19jSxrtqbRlcJzIZ
         fqXUOTffHgYEPm4fbrpBrR76rHJlHXkIE2Pp8SU/dXCvrAoFLvq5Jz7Ft5zvS7fPfjTU
         N9Vg==
X-Gm-Message-State: AO0yUKUHUC8Z2vMkZTn1CUD2ZnFFeRXBesJ/58cZUhTjpEYmddNRqWVJ
        GSUSeO9uvIx/dUIDM5vqVWti7RWyteW8BbU2Skfj3QLaRfwphg==
X-Google-Smtp-Source: AK7set95wV/hGLhl0TH2QfHN26k084QnwFclxvbxGr2IHtzxJKSBGdFmzNKQgdC5SIHSqEWJRc5Xu8njIhCBO8Y6HBE=
X-Received: by 2002:a17:902:d4c3:b0:1a0:7630:8eed with SMTP id
 o3-20020a170902d4c300b001a076308eedmr1140281plg.11.1679419640271; Tue, 21 Mar
 2023 10:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com> <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
In-Reply-To: <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Tue, 21 Mar 2023 10:27:09 -0700
Message-ID: <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
Subject: Re: How to get system localtime/wall time from eBPF?
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, brouer@redhat.com
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

On Mon, Mar 20, 2023 at 2:57=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Mon, Mar 20, 2023 at 10:15=E2=80=AFAM Jesper Dangaard Brouer
> <jbrouer@redhat.com> wrote:
> >
> >
> > On 20/03/2023 16.33, Vincent Li wrote:
> > >
> > > if I have a XDP based firewall to block ip  access based on system
> > > localtime/wall time, is it still impossible like what mentioned here
> > > https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment-8=
19419800?
> > > If so, is there any way to workaround this?
> >
> > You could use the BPF-helper named: bpf_ktime_get_tai_ns()
> >
> > See man clock_gettime(2). It is the same as CLOCK_TAI, which is
> > (currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock.
> >

sorry a follow-up question, the bpf_ktime_get_tai_ns will return time
as nano seconds, right?
I do not need the nanoseconds precision, I only need HH:MM like hours
and minutes of the day, for example 10:30 =3D 10 * 60 + 30 is good
enough,
 any trick get that from bpf_ktime_get_tai_ns()


> > Perhaps kernel should be extended with a bpf_ktime_get_wall_ns() ?
> >
> I guess it would be useful, I have a scenario that only allow ip
> access between 07:00AM - 10:30PM for middle school kids everyday. now
> I use cron job to run an user space program to add/delete IP from eBPF
> map pinned by the XDP firewall program :)
>
> > --Jesper
> >
