Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0352A31E20C
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Feb 2021 23:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbhBQW17 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 17 Feb 2021 17:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbhBQW15 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 17 Feb 2021 17:27:57 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AA6C061756;
        Wed, 17 Feb 2021 14:27:17 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id z18so12783949ile.9;
        Wed, 17 Feb 2021 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hxgUP08Cw4TYttxB1Yh64Z2EXit+fU1rTI4YbayBBsc=;
        b=lh2ycFxzxkkpvMWPn6nBwnUQJdomUiu8P/AKKS93tzAUJVTtqpSA2szVRWT3Qx6ZBm
         LlNmoAqu2d5yvnyYwaUAmavTyWQFqtGoi4mQnlCD0qsJHFjq7ATJSBKIjOnrf8TfQpbg
         7aaw0DHzEwsGS4WTChtLawt9bB2CuXRHgSO0a+7K4XxNb8U9XnrRIvTH5wQ2SNqpDd3h
         2avnblQoXj7bDxM2Zh1Tmdofj0lZwB4LIXqC441iOHK7tSjlt6iZ+BGTMbIcp7TDdFCy
         IFmNkFtXGbuFGfSWgkJPVIKdwjKwjMFrl3lj2QETsuchdcJQRIT/FYJqQ+Y90tM6wGnt
         Efwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hxgUP08Cw4TYttxB1Yh64Z2EXit+fU1rTI4YbayBBsc=;
        b=BgvaKc54CnutGHaiWD+aixH65uzdK8y5synHzhlWgk7JuTpujW8cYA50hOUdj5atzg
         s4ajR/6p9KRhP2NSMbqHMfcQeDqxda4g1jQIOiJMLlc1GmUMbcgxlabYsS5mCMU6a9Z2
         RMKtSG9vYdmcTehEPjbC0jQCR+veUNkXiqPKBhGUV+UINmennMa+zB+Y364gPtLpnEKJ
         zXjR/kZmOZPbkRzy6mJDFWVHDKQ8VWJ5odhkjyZqptso+qjmviGRvXCw7FNHTOrr1ewq
         ELDmL+7zXLSJZV61Du7wrBgXLjiAvKWWp8DkdjExG8mHl6yivKN7BbDANBcd/J2fPeKY
         bNAw==
X-Gm-Message-State: AOAM531Patn34DItSjVOKBS9ahkcPVdhHbb0Dulf1265jyQ6LRY/zSs9
        55foWo6ksACmB4QNhBX5IjI=
X-Google-Smtp-Source: ABdhPJyR6lHL4EWwVUaSFzrmODxbMhhAsTIeukJkEKvs+FugXkRsu/5Usw1MvtTqQXjyy4GV6VV8hw==
X-Received: by 2002:a92:6907:: with SMTP id e7mr1085734ilc.134.1613600836799;
        Wed, 17 Feb 2021 14:27:16 -0800 (PST)
Received: from localhost (c-71-199-46-190.hsd1.ut.comcast.net. [71.199.46.190])
        by smtp.gmail.com with ESMTPSA id f15sm2037545ilj.23.2021.02.17.14.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:27:16 -0800 (PST)
Date:   Wed, 17 Feb 2021 15:27:14 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210217222714.evijmkyucbnlqh3d@snout.localdomain>
References: <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
 <87ft1un121.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ft1un121.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/17 04:53PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> > On 21/02/15 01:47PM, Toke Høiland-Jørgensen wrote:
> >> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> >> 
> >> > On 21/02/11 12:18PM, Toke Høiland-Jørgensen wrote:
> >> >> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

8< snip

> > OK, what currently happens is we have a separate, centralized Go web
> > service exposing an HTTP based API. When the sysadmin calls that API it
> > stores the config data in a database. Then, we have another service that
> > periodically queries the database and writes the config data to a
> > constant database (cdb) and stores that in blob storage. Then, there is
> > a service running on each node that periodically pulls down the latest
> > cdb. Our orchestration tool running on each node is watching for new
> > cdbs using inotify; when the tool sees a new CDB it loads the new
> > configuration data--which, for us, literally ends up just being JSON
> > data--and does anything that needs done.
> >
> > I had omitted those details for a couple of reasons: First, it's kind of a
> > lot and I didn't know it would be helpful. Second, this is the way it
> > works currently because, for expediency, we leveraged the internal
> > ecosystem that was already setup. We will likely move away from it, at
> > least partially.
> >
> > So, I think the important part is that our orchestration tool will
> > periodically get the config data in JSON format. A path to each BPF
> > program is in the config data and the orchestration tool downloads them
> > as needed. We may move to just including the BPF program binary in the
> > config data--TBD. Obviously, we aren't using libxdp yet, so our config
> > data doesn't have "run priority", instead the config data has the order
> > the BPF programs need to run, and BPF programs themselves have to do the
> > bpf_tail_call (and the orchestration tool does a bunch of complicated
> > orchestration to get the chain in the right order). The config data also
> > contains a bunch of other information to do the orchestration, e.g.,
> > interface, ingress or egress, tc or xdp, what userspace code to run and
> > any config values for that, etc.
> >
> > Hopefully that answers your question, and sorry if it was too much
> > information :)
> 
> No, that was very helpful, thanks! Just the kind of detail I was after
> to understand your deployment scenario :)

OK, phew :)

> >> > I was planning to set the run order programatically on the XDP program
> >> > objects via libxdp calls. It looks like your libxdp implementation
> >> > already has ways to do this in the form of xdp_program__set_run_prio()
> >> > and xdp_program__chain_call_enabled().
> >> >
> >> > Does that make sense? This is still all very theoretical for me at this
> >> > point!
> >> 
> >> Yup, totally possible to set this programmatically with libxdp as well
> >> today. However, before doing so you still need to communicate the list
> >> of BPF programs and their run configuration to each node. And I'm
> >> thinking it may be worthwhile to specify how to do this as part of the
> >> "protocol" and also teach libxdp about the format, so others won't have
> >> to reinvent the same thing later.
> >
> > It seems like I must be missing something here, but my plan was to do
> > this all programmatically by calling libxdp functions from the
> > orchestration tool by 1) calling something like xdp_program__open_file()
> > to load the XDP program, and then 2) setting the run configuration by
> > calling something like xdp_program__set_run_prio() and
> > xdp_program__chain_call_enabled(), and 3) adding the programs to the
> > dispatcher and loading it.
> >
> > Correct me if I'm wrong, but I guess you're saying that it might be
> > worth creating an abstraction in libxdp where a user can pass in the
> > necessary config data and libxdp does the work, that I just summarized
> > in the previous paragraph, on the user's behalf. I can see how that
> > could be a useful abstraction.
> 
> Yeah, so what I was thinking was whether it would be useful to, for
> instance, define a "bundle" format that contains the config data that
> libxdp will understand. Could just be a JSON schema containing keys for
> priority, chain call actions and a filename, so you can just point
> xdp_program__open_file() at that and it will do the rest.
> 
> However, I'm still not quite sure I'm convinced that this will be
> generally useful. As you say, you can just as well just set the values
> programmatically after loading the file, and I suspect that different
> deployments will end up having too much custom stuff around this that
> they'll bother using such a facility anyway. WDYT?

Yeah, my hunch is that different deployments will have custom config
data and then getting the data into libxdp format will just be another
data conversion step. I could be wrong.

If it is decided to create a data format, then the JSON schema you
described is pretty much exactly what I had in mind, too. For whatever
that is worth!

> > I know in a previous e-mail you mentioned having a config file with
> > priority overrides. That's just not a use case that our team would want
> > to use. And, my opinion would be that the program using libxdp should be
> > the one to implement that sort of policy; it keeps libxdp more simple
> > without needing to worry about parsing config files (and handling config
> > version changes in the code and the spec). For example, xdp-loader could
> > have a config file with priority overrides and people could use that
> > code if they wanted to do something similar.
> 
> Yeah, that's totally what would make sense for your deployment case. The
> design where libxdp reads a config file comes from my distro
> perspective: We want to build a system whereby different applications
> can each incorporate XDP functionality and co-exist; and the goal is to
> make libxdp the synchronisation point between them. I.e., we can say to
> application authors "just use libxdp when writing your application and
> it'll work", while at the same time empowering sysadmins to change the
> default application ordering.

Ah, yes, that perspective helps a lot; I understand much better why you
would want a centralized configuration file. My mind is actually kind of
melting now thinking about all the use cases.

Is the idea that the configuration file would have the final word? For
example, if there are multiple applications using libxdp (and possibly
even programatically overriding their priorities), could a sysadmin then
write a config file to dictate what they actually want? That would made
sense to me. If that's the goal, then I guess I would take back my
opinion about that policy not belonging in libxdp. I think application
writers would be less likely to use the configuration format (for
reasons we discussed above), but it does seem like a necessary mechanism
for sysadmins to orchestrate multiple applications that don't know about
each other. For my team's use case, we have the luxury of being the One
Application to rule all BPF programs.

> 
> By having that configuration be part of the library, applications can be
> free to use either the command-line loader or include the loading into
> their own user-space binary.
> 
> But since you are (notionally) both the application developer and system
> owner, that is less of a concern for you as you control the whole stack.
> 
> > Hopefully I'm even making sense, but like I said, I don't have strong
> > feelings about the format, as long as we are able to achieve our
> > required use case of programmatically setting the run configuration
> > values from a libxdp user program.
> 
> Sure, that you can certainly achieve with implementing what libxdp
> includes today. I'm just trying to make sure we explore any
> opportunities for standardising something useful so others can benefit
> from it as well; so I hope you'll forgive my probing :)

8< snip

> > We explicitly do not want defaults set by program authors. We want that
> > policy to be completely in the hands of the orchestration environment.
> 
> Right, OK. How does the admin configuring the orchestration system
> figure out which order to run programs in, BTW? Is this obvious from the
> nature of the programs, or do you document it out of band somewhere, or
> something like that?

We're a pretty huge organization... lots of DCs, public cloud, private
cloud, different kernel versions, sister companies, hundreds of
applications, etc. We want anyone to be able to write cool BPF programs
and userspace applications without needing awareness of what's running
before or after or if that order might change in the future. I'm sure
the desired order will be more obvious for some programs than others,
but we have administrators that can analyze the BPF programs, compose
multiple BPF programs together, and order and reorder them. We have a
team of people that can work with teams to resolve any interdependencies
if necessary.

As an example, we've done something similar for HTTP ingress and egress
Lua plugins in the past. We have dozens of teams that write Lua code to
do custom L7 things with HTTP requests and responses, and then we have a
UI where admins/ops folks can literally drag and drog the plugins into
the desired order. We wouldn't want teams making assumptions about what
order plugins should run in, either.

Hopefully that helps!

Thanks again,
Brian
