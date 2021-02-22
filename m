Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5540D32224A
	for <lists+xdp-newbies@lfdr.de>; Mon, 22 Feb 2021 23:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhBVWmo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 22 Feb 2021 17:42:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57349 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231865AbhBVWmm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 22 Feb 2021 17:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614033675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=53OtEMVkEcCPkrIACC+vFNJAFJJ60PKUMz7mtzOX9co=;
        b=fRXLskA0bvf3gSUN5Px0YRynN7FFibj2RYr6pjPg2qOLI673tJX3o6Vbme8ARULt7dJb8N
        ZQ3fB41LFwYZnOCsLEy/OC3bDP/JoV4cJm9HxRXBHUAFxgZ/eKMWpDyjb+Bti/CrjHZFzB
        ZS3RgSRIwHbPdZJ4k+ja7+5f02PNxKM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-GEOVpy36Mdaw95Z1HNEMTw-1; Mon, 22 Feb 2021 17:41:13 -0500
X-MC-Unique: GEOVpy36Mdaw95Z1HNEMTw-1
Received: by mail-ed1-f72.google.com with SMTP id j10so7798017edv.5
        for <xdp-newbies@vger.kernel.org>; Mon, 22 Feb 2021 14:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=53OtEMVkEcCPkrIACC+vFNJAFJJ60PKUMz7mtzOX9co=;
        b=eCVqI98u7AkBW/IKxHmy1fFdWMQuNt2CMSBgHCw1y5eaQdzzmYGbSoKHzIBdu6/NYk
         cnsYbQ9GKflCAH2p+cMdFFRiPrG1ar1UVIYJbqnHmMDLgSpxZixF62x7fXZk/fDsjSvT
         vHJGQOGvRwKkUkSt4f/M7YsOoRIHOIqpVvtv1zAAbf/auTdB/mPpiJuEnPKx8TkMze0n
         GddiiqLVjxxyTQdRvFi9F2Va55GLGEEe+iwm+jtET7q1cSXjCdxiVnSCQLKl0hE6c6qq
         StejjB2dAtbApBeFeu9+y2Ti0mLiWOeBluVpSlVvVjosRJd/Xnb2IitCe/cIoD6iyIZ1
         tEAg==
X-Gm-Message-State: AOAM533UUbLvOJfmR6FUjkbJSQ1A9QaVa0ujVtlF0yfmdY9ri5QqJI6U
        f4quTMymKcohTGyxWR0HTWNKQ1h3yP9/1OqbG95cQRIyZ2L/clEn5/l3XOKKIP9tXY6pEz+hzTe
        OoTERg/nH3Els7rGxykhjMv0=
X-Received: by 2002:a17:906:1cc2:: with SMTP id i2mr23710560ejh.320.1614033671924;
        Mon, 22 Feb 2021 14:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwimIiDWi1pDXEOtIz1aEL9xfyGlrobJdFJc51yPVfo0MCeKRGyhtQJwEjLCuGAMyXCaX3Lig==
X-Received: by 2002:a17:906:1cc2:: with SMTP id i2mr23710544ejh.320.1614033671763;
        Mon, 22 Feb 2021 14:41:11 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id p3sm2829770edu.64.2021.02.22.14.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 14:41:10 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 85DD0180676; Mon, 22 Feb 2021 23:41:10 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210222193459.hxvlcq65yyh3b6dr@snout.localdomain>
References: <873605din6.fsf@toke.dk> <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
 <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
 <87pn0xl553.fsf@toke.dk>
 <20210222193459.hxvlcq65yyh3b6dr@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 22 Feb 2021 23:41:10 +0100
Message-ID: <87v9ajg1yx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> On 21/02/18 05:20PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
>
>> >> > We explicitly do not want defaults set by program authors. We want =
that
>> >> > policy to be completely in the hands of the orchestration environme=
nt.
>> >>=20
>> >> Right, OK. How does the admin configuring the orchestration system
>> >> figure out which order to run programs in, BTW? Is this obvious from =
the
>> >> nature of the programs, or do you document it out of band somewhere, =
or
>> >> something like that?
>> >
>> > We're a pretty huge organization... lots of DCs, public cloud, private
>> > cloud, different kernel versions, sister companies, hundreds of
>> > applications, etc. We want anyone to be able to write cool BPF
>> > programs and userspace applications without needing awareness of
>> > what's running before or after or if that order might change in the
>> > future. I'm sure the desired order will be more obvious for some
>> > programs than others, but we have administrators that can analyze the
>> > BPF programs, compose multiple BPF programs together, and order and
>> > reorder them. We have a team of people that can work with teams to
>> > resolve any interdependencies if necessary.
>> >
>> > As an example, we've done something similar for HTTP ingress and
>> > egress Lua plugins in the past. We have dozens of teams that write Lua
>> > code to do custom L7 things with HTTP requests and responses, and then
>> > we have a UI where admins/ops folks can literally drag and drog the
>> > plugins into the desired order. We wouldn't want teams making
>> > assumptions about what order plugins should run in, either.
>>=20
>>=20
>> See, so this is the part that's actually analogous to what we want to do
>> as a distro. Except the people writing the cool BPF programs are
>> different software vendors and open source projects, not different
>> divisions within the same sprawling org. But in a sense the situation is
>> quite similar.
>>=20
>> So thinking a bit more about the difference between your orchestration
>> system and the model I've been working from, I think the biggest
>> difference is not that you are assuming control of a system with an
>> orchestration system. In a sense a distro is also an orchestration
>> system bringing together different software from different sources.
>>=20
>> No, I think the main difference is that in the model you described,
>> you're assuming that your orchestration system would install the XDP
>> program on behalf of the application as well as launch the userspace
>> bits.
>
> Yes, that's right. This is the model we are implementing.
>
>> Whereas I'm assuming that an application that uses XDP will start
>> in userspace (launched by systemd, most likely), and will then load its
>> own XDP program after possibly doing some initialisation first (e.g.,
>> pre-populating maps, that sort of thing).
>>=20
>> From what I've understood from what you explained about your setup, your
>> model could work with both models as well; so why are you assuming that
>> applications won't want to install their own XDP programs? :)
>
> I would just say that in our organizations network and administration
> environment, we ideally want a centralized orchestration tooling and
> control plane that is used for all XDP (and tc) programs running on our
> machines with our model described above.

Right, sure, I'm not disputing this model is useful as well, I'm just
wondering about how you envision the details working. Say your
orchestration system installs an XDP program on behalf of an application
and then launches the userspace component (assuming one exists). How is
that userspace program supposed to obtain a file descriptor for the
map(s) used by the XDP program in order to communicate with it?

> That said, I do see your point about the possibility of using some
> other application that runs its own XDP programs, and then, yes, we
> would definitely want some way to control the priority. Ideally, the
> application would have its own configuration to set priorities, but I
> do think the system configuration file is a good way to ensure that
> the sysadmin does have the power to override if necessary.
>
> I think you're right that both models should be able to be used.
> Thanks for the good discussion.

Yeah, you too! Always good to have someone to bounce ideas off of :)

-Toke

