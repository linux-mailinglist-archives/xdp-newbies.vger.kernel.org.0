Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4144B31894F
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Feb 2021 12:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhBKLWc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Feb 2021 06:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48809 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230508AbhBKLUU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Feb 2021 06:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613042333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GHtPrxEst++ej8uY6LLGYBWGorI77l9vLcwoUoaA+FA=;
        b=BFMTOxU/ELJOUyzyfAcizhLar1dgI7lyLgKpoLEx9pIkBXTCeEHs5PU59m6VTJfxDcfugy
        VisITwxHo1x8Zdk8XAik1wG8xBEVvxBKgaLnHBO72Lhae4dPkIsw2wkBFoLqv5KlEHfxeE
        /R7mbRkMd+UHdSHzli6pFlFhwEZQajY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-rQ8-BzpiNwK27aCwSS1wIw-1; Thu, 11 Feb 2021 06:18:50 -0500
X-MC-Unique: rQ8-BzpiNwK27aCwSS1wIw-1
Received: by mail-ed1-f70.google.com with SMTP id b1so4428701edt.22
        for <xdp-newbies@vger.kernel.org>; Thu, 11 Feb 2021 03:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=GHtPrxEst++ej8uY6LLGYBWGorI77l9vLcwoUoaA+FA=;
        b=lLg/JAt8EVM8PMexxKSB4o5M1DfWvXnx+v6XkmIlCTtTazoykuyjTI+JBlEojB+pY4
         7RScr+8MJMy+kpnO/b5UCw/fObeHe2DqCKx5AhMRW9kvE2he5ODbn+liAbJwBLux37kr
         PLyBqcSlcot2E+bwdgmTDXFuaSDQDjjB6XbVMC20fx/QwFKQ02OW+GFLE4DCSkdsjYNT
         TorFaTi0mK0IjTfkyaZJY8UmCwe8SIms5El8x2IulgcwaPLHmVXIpt0cRUsH1bxBgTUy
         2WA/ksL1306cge/9SqsBVo17x0k9YrsITI1iFLYQBGy6/q8HmMfn516UcDkDYJlZWsEY
         G42A==
X-Gm-Message-State: AOAM532aWrzP26KhGHbXgAM8f6Rm7yQ3alpfI+d8FggaU9BfuBW6t2KM
        +t1qU8POfkvAftCdf3BOqZQhZOIUpA+iHKb3WxK4ckUuJmJfRj3Z28Q2+ilRYfaESBYXH6uF16F
        5NKrxeLe6w2eh4u/q9RfqKkk=
X-Received: by 2002:a17:906:7cb:: with SMTP id m11mr8266078ejc.332.1613042329435;
        Thu, 11 Feb 2021 03:18:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTYHBNl1ANgyirI30eL+chhtz48Uoj++tyaeeab2QTfeFP0aeO6fSmOPqRoXk+w33crf/fQg==
X-Received: by 2002:a17:906:7cb:: with SMTP id m11mr8266055ejc.332.1613042329105;
        Thu, 11 Feb 2021 03:18:49 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id w24sm4155776ejn.36.2021.02.11.03.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 03:18:48 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 35B321804EE; Thu, 11 Feb 2021 12:18:48 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210210222710.7xl56xffdohvsko4@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk> <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 11 Feb 2021 12:18:48 +0100
Message-ID: <874kiirgx3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> On 21/01/29 01:02PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Hi Brian
>>=20
>> I've posted a first draft of this protocol description here:
>> https://github.com/xdp-project/xdp-tools/blob/master/lib/libxdp/protocol=
.org
>>=20
>> Please take a look and let me know what you think. And do feel free to
>> point out any places that are unclear, as I said this is a first draft,
>> and I'm expecting it to evolve as I get feedback from you and others :)
>>=20
>> -Toke
>>=20
>
> Thanks so much for doing this Toke. There's a lot of great information.
> I did one read-through, and didn't notice any surprises compared to the
> code that I've read so far.

Awesome! :)

> One thing I have been a little concerned about is the XDP_RUN_CONFIG in
> the xdp program function. For our case--with multiple teams writing
> independent, composable xdp programs--we don't want the XDP_RUN_CONFIG
> policy to be in the xdp program. Instead, we want the Go orchestration
> tool to have that policy as part of its configuration data (e.g., what
> order to run the xdp program functions in). From what I can tell, it's
> possible to omit the XDP_RUN_CONFIG from the xdp program function, and
> instead set the values when loading the xdp dispatcher. That's great, and
> thanks for the foresight there. I just want to confirm that I'm
> understanding that correctly, because it's very important for us.

Yes. The values embedded into the program BTF are defaults, and can be
overridden on load. The idea is that an application will set a default
value (e.g., "I'm a firewall, so I want to run early" or "I want to
monitor traffic to the stack so I'll run late"), but if the sysadmin
wants to do things differently they can override the order. The
important bit being that ultimate control of run order is up to the
*user*, not the application developer.

The policy override stuff is not implemented yet, but I am planning to
implement it by having libxdp read a config file with priority overrides
(similar to how libc will read /etc/nsswitch.conf or /etc/hosts which
makes them work in all applications).

And of course, if you're writing an orchestration tool, then you *are*
the user, so having the tool override priorities is definitely in scope
(it'll just be an alternative way to set policy instead of a config
file). How are you planning to specify the effective run order? I am
also quite open to working on a compatible way that can work for both
your tool and libxdp :)

> Also, I do hope that the existing Go BTF libraries are good enough to do
> what's needed here, because if I'm understand correctly, that's how I'll
> need to approach setting the XDP_RUN_CONFIG values for our use case.

You'll need to *parse* BTF to *read* the XDP_RUN_CONFIG. Which is pretty
basic, really, you just need to walk the BTF reference tree. Feel free
to reuse the parsing code in libxdp; that is, in turn, adapted from the
.maps section parsing code in libbpf :)

> I've been tasked to work on a Go libxdp implementation this quarter, so
> I'll be starting on that soon and let you know if I have questions as I
> go. I'm also happy to coordinate with anyone else that's interested.

Sounds great! Will be interesting to see a second implementation;
independent implementations are the ultimate test of any specification :)

Please do keep me in the loop, and don't hesitate to ping me if there
are things that are unclear or that you feel are less-than-ideal in the
way things work. I'm also quite open to evolving the spec to meet
everyone's needs!

-Toke

