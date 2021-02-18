Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4431EE60
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Feb 2021 19:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhBRSdg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 18 Feb 2021 13:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49921 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233249AbhBRQWH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 18 Feb 2021 11:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613665214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2fZbKswGgvogl4Rf0Fl7ioUxyVo0jhV+j8pOfIx3/KU=;
        b=T9SlWWoipTRHy59sXB3GsWiOrVucrpnqy9l8bJ+VPBMeOzWH+47wB0smh15SV5kRlYXAtu
        bpfVPPfESgciopn6fC8R7t6bCsVzE2d2xoY+ixjX9Dsi3AxEzNUJX+X7XKfvptsyNLfjhp
        WfmowNg6keQ6QudK/t72g57FS+Trq0w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-bC8eOEq_MlKIWMsnyPVymA-1; Thu, 18 Feb 2021 11:20:12 -0500
X-MC-Unique: bC8eOEq_MlKIWMsnyPVymA-1
Received: by mail-ed1-f69.google.com with SMTP id q2so1115393edt.16
        for <xdp-newbies@vger.kernel.org>; Thu, 18 Feb 2021 08:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=2fZbKswGgvogl4Rf0Fl7ioUxyVo0jhV+j8pOfIx3/KU=;
        b=FJJhnSpU38Pv80IW0gwdLQTCDbo64KHvryl35yNq0Miu6yYtBHrCSSvgcyXiZyYTpj
         qiSJ2H5hTg+77axYvm+DDg7Wh8vuV0QUPzGh6cGDv98d8ywrBzdUQlnwFjGr4gCSMVH3
         oxxKnahRI3FdguSKGeHS1fyqZ8xBf/aj1K10igsc33fhq1JalVK+cG8r2zXPBufGI/Hl
         3h7cY2TDGhqESkhQlTiuXm7QrSw9vbebkLgE9nwNYG/RMjDxs9H/eYr8OW2HBqCugbTZ
         0DLkuvw879bo0teYYLbNMyUYoISr8tcWONG5OStDpGHGJ1tz6QRR1vmz48BuhcU5n5te
         lzqw==
X-Gm-Message-State: AOAM530JU078qAdTp64bcTKHfZeCdiWwaDzWtnehlESnagHePJ0Gqms+
        PDICtCtcd/mZGxpkQwjjbyl4Gwdoe5Nh8jQHrMhftR1QAK/2BCUgBVN71nzG3vfoivhjzuU8l00
        6QrmGAUA7sGop5p6o+GuF7sg=
X-Received: by 2002:a17:906:cc91:: with SMTP id oq17mr4619738ejb.45.1613665210709;
        Thu, 18 Feb 2021 08:20:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtVJSDaa81MpNLEgwE6YEqZzPzOFxDDotnZ4rOjBKPhOZrSOilcocmTl+Kh4BmZ5cnbf95Nw==
X-Received: by 2002:a17:906:cc91:: with SMTP id oq17mr4619716ejb.45.1613665210385;
        Thu, 18 Feb 2021 08:20:10 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id v1sm2962978ejd.3.2021.02.18.08.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:20:09 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 578F3180606; Thu, 18 Feb 2021 17:20:08 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
References: <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk> <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
 <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 18 Feb 2021 17:20:08 +0100
Message-ID: <87pn0xl553.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

>> Yeah, so what I was thinking was whether it would be useful to, for
>> instance, define a "bundle" format that contains the config data that
>> libxdp will understand. Could just be a JSON schema containing keys for
>> priority, chain call actions and a filename, so you can just point
>> xdp_program__open_file() at that and it will do the rest.
>> 
>> However, I'm still not quite sure I'm convinced that this will be
>> generally useful. As you say, you can just as well just set the values
>> programmatically after loading the file, and I suspect that different
>> deployments will end up having too much custom stuff around this that
>> they'll bother using such a facility anyway. WDYT?
>
> Yeah, my hunch is that different deployments will have custom config
> data and then getting the data into libxdp format will just be another
> data conversion step. I could be wrong.
>
> If it is decided to create a data format, then the JSON schema you
> described is pretty much exactly what I had in mind, too. For whatever
> that is worth!

Right, I'll mull this over some more but let's defer it for now.

>> > I know in a previous e-mail you mentioned having a config file with
>> > priority overrides. That's just not a use case that our team would want
>> > to use. And, my opinion would be that the program using libxdp should be
>> > the one to implement that sort of policy; it keeps libxdp more simple
>> > without needing to worry about parsing config files (and handling config
>> > version changes in the code and the spec). For example, xdp-loader could
>> > have a config file with priority overrides and people could use that
>> > code if they wanted to do something similar.
>> 
>> Yeah, that's totally what would make sense for your deployment case. The
>> design where libxdp reads a config file comes from my distro
>> perspective: We want to build a system whereby different applications
>> can each incorporate XDP functionality and co-exist; and the goal is to
>> make libxdp the synchronisation point between them. I.e., we can say to
>> application authors "just use libxdp when writing your application and
>> it'll work", while at the same time empowering sysadmins to change the
>> default application ordering.
>
> Ah, yes, that perspective helps a lot; I understand much better why you
> would want a centralized configuration file. My mind is actually kind of
> melting now thinking about all the use cases.
>
> Is the idea that the configuration file would have the final word? For
> example, if there are multiple applications using libxdp (and possibly
> even programatically overriding their priorities), could a sysadmin then
> write a config file to dictate what they actually want? That would made
> sense to me. If that's the goal, then I guess I would take back my
> opinion about that policy not belonging in libxdp. I think application
> writers would be less likely to use the configuration format (for
> reasons we discussed above), but it does seem like a necessary mechanism
> for sysadmins to orchestrate multiple applications that don't know about
> each other.

Yeah, that would be the idea.

> For my team's use case, we have the luxury of being the One
> Application to rule all BPF programs.

Yup, obviously being in full control of the system gives you some
options we don't quite have as a distro. But see below - I still think
there are some similarities.

>> By having that configuration be part of the library, applications can be
>> free to use either the command-line loader or include the loading into
>> their own user-space binary.
>> 
>> But since you are (notionally) both the application developer and system
>> owner, that is less of a concern for you as you control the whole stack.
>> 
>> > Hopefully I'm even making sense, but like I said, I don't have strong
>> > feelings about the format, as long as we are able to achieve our
>> > required use case of programmatically setting the run configuration
>> > values from a libxdp user program.
>> 
>> Sure, that you can certainly achieve with implementing what libxdp
>> includes today. I'm just trying to make sure we explore any
>> opportunities for standardising something useful so others can benefit
>> from it as well; so I hope you'll forgive my probing :)
>
> 8< snip
>
>> > We explicitly do not want defaults set by program authors. We want that
>> > policy to be completely in the hands of the orchestration environment.
>> 
>> Right, OK. How does the admin configuring the orchestration system
>> figure out which order to run programs in, BTW? Is this obvious from the
>> nature of the programs, or do you document it out of band somewhere, or
>> something like that?
>
> We're a pretty huge organization... lots of DCs, public cloud, private
> cloud, different kernel versions, sister companies, hundreds of
> applications, etc. We want anyone to be able to write cool BPF
> programs and userspace applications without needing awareness of
> what's running before or after or if that order might change in the
> future. I'm sure the desired order will be more obvious for some
> programs than others, but we have administrators that can analyze the
> BPF programs, compose multiple BPF programs together, and order and
> reorder them. We have a team of people that can work with teams to
> resolve any interdependencies if necessary.
>
> As an example, we've done something similar for HTTP ingress and
> egress Lua plugins in the past. We have dozens of teams that write Lua
> code to do custom L7 things with HTTP requests and responses, and then
> we have a UI where admins/ops folks can literally drag and drog the
> plugins into the desired order. We wouldn't want teams making
> assumptions about what order plugins should run in, either.


See, so this is the part that's actually analogous to what we want to do
as a distro. Except the people writing the cool BPF programs are
different software vendors and open source projects, not different
divisions within the same sprawling org. But in a sense the situation is
quite similar.

So thinking a bit more about the difference between your orchestration
system and the model I've been working from, I think the biggest
difference is not that you are assuming control of a system with an
orchestration system. In a sense a distro is also an orchestration
system bringing together different software from different sources.

No, I think the main difference is that in the model you described,
you're assuming that your orchestration system would install the XDP
program on behalf of the application as well as launch the userspace
bits. Whereas I'm assuming that an application that uses XDP will start
in userspace (launched by systemd, most likely), and will then load its
own XDP program after possibly doing some initialisation first (e.g.,
pre-populating maps, that sort of thing).

From what I've understood from what you explained about your setup, your
model could work with both models as well; so why are you assuming that
applications won't want to install their own XDP programs? :)

-Toke

