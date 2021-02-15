Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D3031B9BD
	for <lists+xdp-newbies@lfdr.de>; Mon, 15 Feb 2021 13:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhBOMu3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 15 Feb 2021 07:50:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57233 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229968AbhBOMsx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 15 Feb 2021 07:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613393243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zz2erX1cT6SUrhvwxtsGIayGjyD8f6dcyEWxk76xw6I=;
        b=hiyN6J/6s/0ljkFekfu/Bnnwv1ebf/L2oUIO91HUvaNqqWN38xtaI+JU7kwUOc/n8jr8Tc
        LD11ES0YT/d1IvjTD8ZraUM+KlJOM8/FpAjoqf/I6JtPodjuUdOyVVAHXHhLmT2p8sA7vX
        GgEzCv1pThS3U8IOL1WP8s5T+v8gsPo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-FRB6uYC5NwiY4R0waLffcQ-1; Mon, 15 Feb 2021 07:47:22 -0500
X-MC-Unique: FRB6uYC5NwiY4R0waLffcQ-1
Received: by mail-ed1-f69.google.com with SMTP id y9so2539562edv.15
        for <xdp-newbies@vger.kernel.org>; Mon, 15 Feb 2021 04:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=Zz2erX1cT6SUrhvwxtsGIayGjyD8f6dcyEWxk76xw6I=;
        b=d/zF7dHoCaDSCg5ywXieTuok/k5LPLEkK0gowjJSUalOpm4CBy/i+ScR7fSrAUNagD
         5GhqiOfR5wG1N597fllKNtomsbsL0o5SsCFvwWT6aDM+qD7GRlRwSRuY4PNYkJA5Ibbb
         9zODedFaBQu5hbuWS/vnn2l6cnUwuoSGOneVzGaynk4yN2mGPTXnL+wCbP4jwGfeYfhS
         VfaJc6Oo62vsytBbwPTmfHwzlmbtr+exT70YzLkXWTN8klnNKzYm1ckwsrrtYjcrn3fg
         +DJNjXT0vN4DA7bfbZqIYy4SVXvuf0mD1RWz6dMmJJjWvrpCv/6SgbY1aT+Pi2u0/5o0
         Gwdw==
X-Gm-Message-State: AOAM533gZkpuO68zGVLx/3czykGl54cH4IVOVTHXRl/JOQfbM36TfLLr
        3+S8pYcKjBiYRfRQXgXsJIFJO8qjp3kizTqk4yJUzoDg+gULa6S2KlX0mg2ZtAlPnSkJ+hDxDVf
        Rt3VmiBNnr0iYXEcDA31aSpc=
X-Received: by 2002:a17:906:798:: with SMTP id l24mr15479583ejc.92.1613393240911;
        Mon, 15 Feb 2021 04:47:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhoU42Y/PJAT2UIKsEvncZCW+fY7inE+t4/ovyOcxgVdB3IvronPhYMskL4IeBrhJVHimwgQ==
X-Received: by 2002:a17:906:798:: with SMTP id l24mr15479564ejc.92.1613393240633;
        Mon, 15 Feb 2021 04:47:20 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ga5sm10627293ejb.114.2021.02.15.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 04:47:19 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 773B71805FB; Mon, 15 Feb 2021 13:47:18 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk> <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 15 Feb 2021 13:47:18 +0100
Message-ID: <87h7mdcxbd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> On 21/02/11 12:18PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
>>=20
>> > One thing I have been a little concerned about is the XDP_RUN_CONFIG in
>> > the xdp program function. For our case--with multiple teams writing
>> > independent, composable xdp programs--we don't want the XDP_RUN_CONFIG
>> > policy to be in the xdp program. Instead, we want the Go orchestration
>> > tool to have that policy as part of its configuration data (e.g., what
>> > order to run the xdp program functions in). From what I can tell, it's
>> > possible to omit the XDP_RUN_CONFIG from the xdp program function, and
>> > instead set the values when loading the xdp dispatcher. That's great, =
and
>> > thanks for the foresight there. I just want to confirm that I'm
>> > understanding that correctly, because it's very important for us.
>>=20
>> Yes. The values embedded into the program BTF are defaults, and can be
>> overridden on load. The idea is that an application will set a default
>> value (e.g., "I'm a firewall, so I want to run early" or "I want to
>> monitor traffic to the stack so I'll run late"), but if the sysadmin
>> wants to do things differently they can override the order. The
>> important bit being that ultimate control of run order is up to the
>> *user*, not the application developer.
>
> Great. In our case, it would be ideal if the application developer
> doesn't even need to be aware of the XDP_RUN_CONFIG and can just omit
> it. I guess for our implementation that would mean that we don't error
> out if the BTF section doesn't exist, and instead we look to our
> configuration data (more on that below) for the relevant information.

That's also what libxdp does; if no XDP_RUN_CONFIG is found, it just
uses the defaults (run prio 50 + chain call on XDP_PASS).

>> The policy override stuff is not implemented yet, but I am planning to
>> implement it by having libxdp read a config file with priority overrides
>> (similar to how libc will read /etc/nsswitch.conf or /etc/hosts which
>> makes them work in all applications).
>>=20
>> And of course, if you're writing an orchestration tool, then you *are*
>> the user, so having the tool override priorities is definitely in scope
>> (it'll just be an alternative way to set policy instead of a config
>> file). How are you planning to specify the effective run order? I am
>> also quite open to working on a compatible way that can work for both
>> your tool and libxdp :)
>
> As part of our control plane we have a whole process for a sysadmin to
> get config data to to our BPF orchestration tool, which is running on
> multiple nodes. It very abstractly looks like this:
>
>
>                                      +---- Node 1
>                                      |
> UI -> API -> DATABASE -> CONFIG DATA +---- Node 2
>                                      |
> 		                     +---- Node N
>
> So, the sysadmin using the UI or API would dictate which xdp programs
> run *and* what their priority is (plus anything else that would
> otherwise go into XDP_RUN_CONFIG, plus a bunch of other config data for
> various other needs). Then--and hopefully I'm getting this right--when
> our (Go) orchestration tool uses (Go) libxdp, the tool needs a way to
> set the run order for the XDP programs before the dispatcher loads.

Yeah, and what I was interested in was how the orchestration tool gets
this data (and the BPF programs themselves)? Is there a daemon running
on the nodes that exposes an API? Are you pushing this via SSH/Ansible?
Infinite monkeys with typewriters inputting data? Something else? :)

> I was planning to set the run order programatically on the XDP program
> objects via libxdp calls. It looks like your libxdp implementation
> already has ways to do this in the form of xdp_program__set_run_prio()
> and xdp_program__chain_call_enabled().
>
> Does that make sense? This is still all very theoretical for me at this
> point!

Yup, totally possible to set this programmatically with libxdp as well
today. However, before doing so you still need to communicate the list
of BPF programs and their run configuration to each node. And I'm
thinking it may be worthwhile to specify how to do this as part of the
"protocol" and also teach libxdp about the format, so others won't have
to reinvent the same thing later.

The reason I went with the embedded BTF is that this gets compiled into
the ELF file, and so we can be pretty sure that it doesn't get lost,
without having to keep track of separate configuration files. So this
makes it a good fit for BPF program authors specifying a default: they
can be pretty sure that this will stay with the object code no matter
how it's moved around.

The downside of using BTF is of course the same: it's tightly coupled to
the compiled binary, and it's a bit awkward to parse (and modify). So I
always anticipated that a secondary format that was *decoupled* from the
binary byte code format would be needed, just as you're describing. So
I'm just looking for input on what such a format might reasonably look
like :)

>> > Also, I do hope that the existing Go BTF libraries are good enough to =
do
>> > what's needed here, because if I'm understand correctly, that's how I'=
ll
>> > need to approach setting the XDP_RUN_CONFIG values for our use case.
>>=20
>> You'll need to *parse* BTF to *read* the XDP_RUN_CONFIG. Which is pretty
>> basic, really, you just need to walk the BTF reference tree. Feel free
>> to reuse the parsing code in libxdp; that is, in turn, adapted from the
>> .maps section parsing code in libbpf :)
>
> OK, that makes sense. Since I want to keep our implementation purely
> in Go (if possible), what I trying to say what that I hope there's an
> existing Go library that can parse and read BTF (Cillium's Go eBPF
> library looks promising). After thinking more about our orchestration
> config data use case I was describing above, though, I don't think
> reading XDP_RUN_CONFIG from BTF is strictly necessary for our use
> case.

See above re: my reasons for picking the BTF format. Not sure how you're
developing the BPF programs, but it may turn out to be useful to have
program authors specify defaults as well. E.g., you could have whatever
process *inserts* programs into your database (assuming that's where you
store the available programs) read default values from the BTF and
pre-populate the admin UI with those when someone wants to load
programs?

> That said, it obviously would be preferable to conform to the
> specification, plus it does look necessary to read the program IDs
> from BTF anyway :)

The program IDs are allocated by the kernel on load, so those have
nothing to do with BTF. But you'll likely want to support BTF-defined
maps, and the freplace functionality itself relies on BTF being present;
so you'll need to handle it somehow... :)

-Toke

