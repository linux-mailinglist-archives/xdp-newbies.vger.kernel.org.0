Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E770322946
	for <lists+xdp-newbies@lfdr.de>; Tue, 23 Feb 2021 12:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhBWLJC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 23 Feb 2021 06:09:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34517 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232231AbhBWLIg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 23 Feb 2021 06:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614078429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=98wd0QG+v4RXUDxbb0NPp3Yzg92ldtQK4iygBZ4W0GE=;
        b=JpM2L7sUJCypP8fRdHWr0L6DjKIDXs3UDyX0Lo/OaAgj1ysu9y1wW/P5z5DBIpCsVzIOyd
        MwHX8CL3aRBwPWRksVpgDfOMQ7wqypKZ7MFUAAaOuMm4rRUtzJj0v9bhlO+S7JAV3xMPmQ
        IhptHaelDjUAZGl+Z1+d5eXYfFvQF7Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-eob5Ri4gMce8w_g2CMFJCg-1; Tue, 23 Feb 2021 06:07:07 -0500
X-MC-Unique: eob5Ri4gMce8w_g2CMFJCg-1
Received: by mail-ed1-f71.google.com with SMTP id t9so8444126edd.3
        for <xdp-newbies@vger.kernel.org>; Tue, 23 Feb 2021 03:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=98wd0QG+v4RXUDxbb0NPp3Yzg92ldtQK4iygBZ4W0GE=;
        b=YziFbs8KZU5uiDh5U+rVq6P2aGvDC8m0w0L1TJwdY3sEg8K0w8n66cQ+cwATa6Aby8
         gwQztoEWrcIwxasrn0VtqtRL284hiDMO9nnmmjL/DO9DQCKmX2E5mXFvKIj0lxtt5Lpn
         JZQjn9+UaWvUYE3AVgUM/c9P7O48IcZrxexFjXb2VoFzNZWhYKgnKwU+wIOHclGn4xXB
         p0wY4BeZ8Mf9/gzKYJztcHwJwVWVZYOw1Sgo5s6x0C7iueewG/EbBRwj+JOk2xA/QKVv
         dk0GXG4D4LpQXrKqfvJ+EZj7jiHrAmrL7O39TWntXraX8f8wsStFBMC/hBToaupCDPn0
         +Oug==
X-Gm-Message-State: AOAM533dmkr3kzzcC1fZ+C4MypsOG0vEZ9Y3zxiqk8V8my9xXhXm0ya4
        9IoZ4NSKh5H+nGobPwd2ojMF9LV1uCTXpkjPQ8DC+fZO/b0ViyZpKeqYdO8gYUe4pflIjBcsOJZ
        B7shztfkpzdwTnGc15HGPzhU=
X-Received: by 2002:a17:906:1e50:: with SMTP id i16mr12692159ejj.466.1614078426256;
        Tue, 23 Feb 2021 03:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD6x5Jkk2AYH/zGWrp+LrGGLAvooZtS4tOPWUc9eayVWibZ7ZClOzhczyEjOuRuAIYc90vKg==
X-Received: by 2002:a17:906:1e50:: with SMTP id i16mr12692138ejj.466.1614078425928;
        Tue, 23 Feb 2021 03:07:05 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id h10sm14644100edk.45.2021.02.23.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 03:07:05 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id F17B8180676; Tue, 23 Feb 2021 12:07:04 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210223085422.tv2gk6olg66zcbwe@snout.localdomain>
References: <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
 <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
 <87pn0xl553.fsf@toke.dk>
 <20210222193459.hxvlcq65yyh3b6dr@snout.localdomain>
 <87v9ajg1yx.fsf@toke.dk>
 <20210223085422.tv2gk6olg66zcbwe@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 23 Feb 2021 12:07:04 +0100
Message-ID: <87pn0rf3fr.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> On 21/02/22 11:41PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
>> > On 21/02/18 05:20PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>
>> >> No, I think the main difference is that in the model you described,
>> >> you're assuming that your orchestration system would install the XDP
>> >> program on behalf of the application as well as launch the userspace
>> >> bits.
>> >
>> > Yes, that's right. This is the model we are implementing.
>> >
>> >> Whereas I'm assuming that an application that uses XDP will start
>> >> in userspace (launched by systemd, most likely), and will then load i=
ts
>> >> own XDP program after possibly doing some initialisation first (e.g.,
>> >> pre-populating maps, that sort of thing).
>> >>=20
>> >> From what I've understood from what you explained about your setup, y=
our
>> >> model could work with both models as well; so why are you assuming th=
at
>> >> applications won't want to install their own XDP programs? :)
>> >
>> > I would just say that in our organizations network and administration
>> > environment, we ideally want a centralized orchestration tooling and
>> > control plane that is used for all XDP (and tc) programs running on our
>> > machines with our model described above.
>>=20
>> Right, sure, I'm not disputing this model is useful as well, I'm just
>> wondering about how you envision the details working. Say your
>> orchestration system installs an XDP program on behalf of an application
>> and then launches the userspace component (assuming one exists). How is
>> that userspace program supposed to obtain a file descriptor for the
>> map(s) used by the XDP program in order to communicate with it?
>
> OK, so this part is admittedly a little hand-wavy and a work in
> progress. We're literally working on design and proof of concepts right
> now, but this is basically what we're envisioning:
>
> 1. Orchestration tool gets all its JSON config data, which includes
>    remote paths for BPF programs and any respective userspace
>    programs.
> 2. Orchestration tool downloads BPF programs and loads them (using
>    Go libxdp when it's available). Then (and this is where I'm going to
>    start waving my hands) the orchestrator will need to gather any
>    necessary map names/ids/fds information to be send to the userspace
>    program. I'm just not exactly sure how easy/hard/possible this part
>    is.
> 3. We start the userspace programs as separate processes and communicate
>    with them via RPC (there's a nice Go plugin system for this[1]). Each
>    userspace program implements an interface and we communicate the map
>    info (among other things) over RPC to the userspace program when it
>    starts.
>
> I'm going to continue researching and fleshing out the details, but are
> there any obvious problems with this approach?

I think the basic idea can work (it's similar to systemd's socket
activation, which also passes the socket fd to the userspace process on
launch). However, there are a couple of things that become impossible
for the userspace process to do in this model:

- Modifying the BPF object before load: Libbpf does quite a few
  transformations on the bytecode to handle relocations, and it's also
  going to grow a full linker at some point. This is not a problem if
  the userspace program just lets libbpf do the default thing, but if it
  wants to customise the operations it becomes a problem. The obvious
  use case for this that comes to mind is dynamically omitting parts of
  the code for features that are not enabled (like we do in xdp-filter).

- Populating maps before load: This is necessary to use customised
  'const' global variables: The map backing these are frozen on load to
  allow the verifier to make strong assumptions about their content, so
  you can't modify them after the map is loaded.

- Atomic map population: Say you have an XDP program that reacts to
  traffic steering rules, and you start out with the program being
  attached to the interface and an empty map that userspace then has to
  populate. While the map is being populated, the XDP program will
  process some packets with an incomplete view of the final ruleset.
  Whereas if you can populate the map completely before attaching the
  program you can be sure that it's consistent. Depending on the nature
  of the application, this may lead to weird effects, or it may be
  mostly harmless.

Now, all of these could in principle be performed by the orchestrator on
behalf of the program, but that means you'll have to make the
orchestrator more complex, and you'll have to come up with a way to
express these operations in your configuration language.

> A backup plan is to have the userspace programs do the loading of the
> BPF program, but it's not obvious to me how that would be easier to
> obtain the file descriptor for the map(s) vs. having the orchestrator
> figure it out and send it to the userspace process.

Both approaches carry complexities with it, and I'm not sure there
really is a universal right answer. What tipped the scales for me were
the issues above. However, being in a more controlled environment, the
trade off may well be different for you.

> If it works out that the orchestrator can load the BPF programs on
> behalf of the userspace programs, then I think the primary benefit is
> that the developer of the userspace program doesn't need to follow
> some boilerplate to load the appropriate way--we've done all that for
> them. It seems nice that the orchestrator could be the one interface
> with libxdp (for the XDP case) without every userspace program needing
> to doing it's own adding/removing (and thus dispatcher swapping),
> though I would guess that's not really a problem at all.

Yeah, I do agree that it would be nicer if there was a clean interface
the application could talk to without having to muck about with
dispatchers. My hope is that by encapsulating all that in a library we
can pretend that there is :)

However, I can see how this perspective may also be different in a Go
world: With a C library in a distro we can ship the library as a
separate package and as long as we maintain ABI compatibility, we can
upgrade the library independently of the applications. Whereas with Go's
vendoring approach it becomes way harder to ensure that all applications
use the "right" version of the library. In that sense, a C library is
more of a "system service" whereas a Go library is more of an
"application sub-function".

> I feel like I've gone out of the scope of libxdp in this e-mail, but
> you did ask :) And I do appreciate any feedback or raising of red
> flags.

Only slightly :)
As outlined above all of this has gone into my thinking when designing
libxdp, so I appreciate the chance to get your perspectives on these
very real tradeoffs. So thanks again for taking the time to explain your
thought process!

-Toke

