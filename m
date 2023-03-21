Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004446C3864
	for <lists+xdp-newbies@lfdr.de>; Tue, 21 Mar 2023 18:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCURi1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 21 Mar 2023 13:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCURi0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 21 Mar 2023 13:38:26 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A43FF37
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:37:44 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q102so1750601pjq.3
        for <xdp-newbies@vger.kernel.org>; Tue, 21 Mar 2023 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679420257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weFK/0xrXhj9XNAbovUk51+/O6xWVeRHg8pk3ESCOR8=;
        b=i7KVZiuPSrlNODuyiR2LQsnV3VwJFh4LGePplEYjDS7tx7y3Et+RT3bGWbf5P7QM2l
         JXlYHUMQMNlBnmAoZOuYdftzMvHJwSSjBnso63H37+A/FKXqFeEVxufcL/p6sEA9X2du
         yMp6dY5uM16usqx1OOxPHLiGMWY6Of3M00q1ob45+VmUwxGERK6pzanIfMechgOtcRQz
         vdpkdG39/pJ1FmVNKCGSZldSNsy8/U/ENOV8vSUEiSByy6w2hYsyLyHWBEWZtRmbUVSh
         XAuPmCBPKGG5gprN3EdwGE9t5ykZVnK1DrVvM6Dkv/TaGTPs1xPckDtBKJhrRw8DAhXZ
         1ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679420257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weFK/0xrXhj9XNAbovUk51+/O6xWVeRHg8pk3ESCOR8=;
        b=Dr0eT6EAaMS7+fTJxVHvvxOlUflkuxRy7c95YZKwXNfrgL7IAaP4Fb+TTeccDVtgme
         6vZeKgsjuyNt5zXwQDBZ2ib2iXjm0ZPLkp7gzn/EpB7LsS3tEKs3Jcz6snO42oE7WrFW
         nrVaWXo3aNE5QZ6IqYZPbHhicc4hFd3kLsnIW707J+NCVrTXlTEPMU+9KbLgDidS3LUA
         42QRzWdGBCD/ND9+yPTsR+MRqeROjJhDbh2fQ6ywSDFdrwAb5TXjbNBMrNKdMNekSWy0
         PWtHEk7ToqrRfXoKpnKmgg6gz+pLh7G7sNipVMh+l15Gdk5ml8iDpoo5oZJbP5s485xr
         owHQ==
X-Gm-Message-State: AO0yUKX5SbOEwFRHnUgu55oGnR8+GMaBhHht6GmWBa7mVRUO1FqkZjPE
        P3LoRAJvR5chFpt8+3knbgpvPnzg/8o5lBNO+VtIm/AupFq75w==
X-Google-Smtp-Source: AK7set+fnzZsbeON+3vAQqZI9Ge5SEf6s39zijnyGcmvhn4R1Mz2TBzpFw+RecWAWYlKc4agm0uBzTzeUHkfzH1kJqc=
X-Received: by 2002:a17:90a:3d85:b0:237:3d0c:8d2e with SMTP id
 i5-20020a17090a3d8500b002373d0c8d2emr255560pjc.2.1679420257051; Tue, 21 Mar
 2023 10:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
 <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com> <CAK3+h2yXtcmhmiJBjhvWABtG20qyYY6m2DVCWcvDwZUcokdEXw@mail.gmail.com>
 <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
In-Reply-To: <CAK3+h2y7b0OMnyAyKTbPNVYE8W8tzBWuyJQbE1KqQRhyAi_ZAw@mail.gmail.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Tue, 21 Mar 2023 10:37:25 -0700
Message-ID: <CAK3+h2wvaLdvFmSWaOxwFpo+S0MsdnGr5fKz=hdfrU+AmCw2Uw@mail.gmail.com>
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

On Tue, Mar 21, 2023 at 10:27=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
>
> On Mon, Mar 20, 2023 at 2:57=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > On Mon, Mar 20, 2023 at 10:15=E2=80=AFAM Jesper Dangaard Brouer
> > <jbrouer@redhat.com> wrote:
> > >
> > >
> > > On 20/03/2023 16.33, Vincent Li wrote:
> > > >
> > > > if I have a XDP based firewall to block ip  access based on system
> > > > localtime/wall time, is it still impossible like what mentioned her=
e
> > > > https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment=
-819419800?
> > > > If so, is there any way to workaround this?
> > >
> > > You could use the BPF-helper named: bpf_ktime_get_tai_ns()
> > >
> > > See man clock_gettime(2). It is the same as CLOCK_TAI, which is
> > > (currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock.
> > >
>
> sorry a follow-up question, the bpf_ktime_get_tai_ns will return time
> as nano seconds, right?
> I do not need the nanoseconds precision, I only need HH:MM like hours
> and minutes of the day, for example 10:30 =3D 10 * 60 + 30 is good
> enough,
>  any trick get that from bpf_ktime_get_tai_ns()
>

so I guess I just do bpf_ktime_get_tai_ns() / 60000000000  to convert
to  minutes ?

> > > Perhaps kernel should be extended with a bpf_ktime_get_wall_ns() ?
> > >
> > I guess it would be useful, I have a scenario that only allow ip
> > access between 07:00AM - 10:30PM for middle school kids everyday. now
> > I use cron job to run an user space program to add/delete IP from eBPF
> > map pinned by the XDP firewall program :)
> >
> > > --Jesper
> > >
