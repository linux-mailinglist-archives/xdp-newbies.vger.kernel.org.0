Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4E631D3BF
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Feb 2021 02:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhBQBU5 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 16 Feb 2021 20:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhBQBU4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 16 Feb 2021 20:20:56 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A7AC061574;
        Tue, 16 Feb 2021 17:20:16 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id l3so13322888oii.2;
        Tue, 16 Feb 2021 17:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6RAPlAKCQmH4EU6dNYIDbqIZvx6ggj2zs8Qs6NWdnWQ=;
        b=I0J57UwTIOF9MBoFNg/idmi+dVjPQxr2QRS1/kV/iNrBvubII+wF5NccUw+WTFYWdX
         x07u3WzbEWhLq3VHUbHTxroVdniRRhcrhPLTAME3FzbmsGdZ70Q0KY0+N1tXyd7IH85U
         kjdgEc/JqSd9SQXuvbWnH9b8Ji8wiXI5/+8me6M14l49eMtuAfQ4U9hsi1VV3eq0m8gX
         gWANG5d9hwuaz1gpLL75mC21URm6QQSmU0rdrrkT02iktiWfIYgnTqHKamvvM0PLOzkw
         4EGymKxz2k8LqkILufuAuhOjtnaUoqYvrncaWlVmTEqvb4bi/xF1Lu4Z+PrMpCN31b9n
         q75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6RAPlAKCQmH4EU6dNYIDbqIZvx6ggj2zs8Qs6NWdnWQ=;
        b=W1k45+lUNuy1w72XW8H4oldyzxYytFxhuxhZhHBp1PIEaGISbt7eNOaMLCGibUyNc1
         IfsZDSRIi/PAt2nfNB+aUbkiFAYEtOWXom9rPAnFgVL3qTiak2WLPj6Xssvr6MIJ8RxE
         SM1jA6Lgd/gkvtfxhs4jqG9zM91iGKCmyij2kQmC08DkyHJyvY7OFyiMvsSKHUvgwCzq
         yIjzW4a1RstwGQ1QHyGCid0Q3IAu9Ng06UHRylsX8biMz7i4jV+yI6MYCHH5kKj237NZ
         AwVZt0zx4z7EIoC8pzjKJRuT0ibOowYoNk/mdvGB1LbLH9M5BokGL5/JGeIvOcIhD8v6
         H62A==
X-Gm-Message-State: AOAM532LrmLO2NBWadlNQUHfc6n91o2loJpZI/zvIF2pPsQT5nY2mBu6
        YNEJeBhthJThbMiJKl/WYUw=
X-Google-Smtp-Source: ABdhPJxH0Mwxp6okZ0RVUNBoqzrx/x7/jlxa+Av4g3O/soUVgrvw609gUSofMwUGa0/e4s5f5ZA58g==
X-Received: by 2002:aca:b945:: with SMTP id j66mr4235412oif.31.1613524815269;
        Tue, 16 Feb 2021 17:20:15 -0800 (PST)
Received: from localhost ([216.207.42.140])
        by smtp.gmail.com with ESMTPSA id c10sm105949otu.78.2021.02.16.17.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 17:20:14 -0800 (PST)
Date:   Tue, 16 Feb 2021 18:20:12 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h7mdcxbd.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/15 01:47PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> > On 21/02/11 12:18PM, Toke Høiland-Jørgensen wrote:
> >> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> >> The policy override stuff is not implemented yet, but I am planning to
> >> implement it by having libxdp read a config file with priority overrides
> >> (similar to how libc will read /etc/nsswitch.conf or /etc/hosts which
> >> makes them work in all applications).
> >> 
> >> And of course, if you're writing an orchestration tool, then you *are*
> >> the user, so having the tool override priorities is definitely in scope
> >> (it'll just be an alternative way to set policy instead of a config
> >> file). How are you planning to specify the effective run order? I am
> >> also quite open to working on a compatible way that can work for both
> >> your tool and libxdp :)
> >
> > As part of our control plane we have a whole process for a sysadmin to
> > get config data to to our BPF orchestration tool, which is running on
> > multiple nodes. It very abstractly looks like this:
> >
> >
> >                                      +---- Node 1
> >                                      |
> > UI -> API -> DATABASE -> CONFIG DATA +---- Node 2
> >                                      |
> >                                      +---- Node N
> >
> > So, the sysadmin using the UI or API would dictate which xdp programs
> > run *and* what their priority is (plus anything else that would
> > otherwise go into XDP_RUN_CONFIG, plus a bunch of other config data for
> > various other needs). Then--and hopefully I'm getting this right--when
> > our (Go) orchestration tool uses (Go) libxdp, the tool needs a way to
> > set the run order for the XDP programs before the dispatcher loads.
> 
> Yeah, and what I was interested in was how the orchestration tool gets
> this data (and the BPF programs themselves)? Is there a daemon running
> on the nodes that exposes an API? Are you pushing this via SSH/Ansible?
> Infinite monkeys with typewriters inputting data? Something else? :)

OK, what currently happens is we have a separate, centralized Go web
service exposing an HTTP based API. When the sysadmin calls that API it
stores the config data in a database. Then, we have another service that
periodically queries the database and writes the config data to a
constant database (cdb) and stores that in blob storage. Then, there is
a service running on each node that periodically pulls down the latest
cdb. Our orchestration tool running on each node is watching for new
cdbs using inotify; when the tool sees a new CDB it loads the new
configuration data--which, for us, literally ends up just being JSON
data--and does anything that needs done.

I had omitted those details for a couple of reasons: First, it's kind of a
lot and I didn't know it would be helpful. Second, this is the way it
works currently because, for expediency, we leveraged the internal
ecosystem that was already setup. We will likely move away from it, at
least partially.

So, I think the important part is that our orchestration tool will
periodically get the config data in JSON format. A path to each BPF
program is in the config data and the orchestration tool downloads them
as needed. We may move to just including the BPF program binary in the
config data--TBD. Obviously, we aren't using libxdp yet, so our config
data doesn't have "run priority", instead the config data has the order
the BPF programs need to run, and BPF programs themselves have to do the
bpf_tail_call (and the orchestration tool does a bunch of complicated
orchestration to get the chain in the right order). The config data also
contains a bunch of other information to do the orchestration, e.g.,
interface, ingress or egress, tc or xdp, what userspace code to run and
any config values for that, etc.

Hopefully that answers your question, and sorry if it was too much
information :)

> 
> > I was planning to set the run order programatically on the XDP program
> > objects via libxdp calls. It looks like your libxdp implementation
> > already has ways to do this in the form of xdp_program__set_run_prio()
> > and xdp_program__chain_call_enabled().
> >
> > Does that make sense? This is still all very theoretical for me at this
> > point!
> 
> Yup, totally possible to set this programmatically with libxdp as well
> today. However, before doing so you still need to communicate the list
> of BPF programs and their run configuration to each node. And I'm
> thinking it may be worthwhile to specify how to do this as part of the
> "protocol" and also teach libxdp about the format, so others won't have
> to reinvent the same thing later.

It seems like I must be missing something here, but my plan was to do
this all programmatically by calling libxdp functions from the
orchestration tool by 1) calling something like xdp_program__open_file()
to load the XDP program, and then 2) setting the run configuration by
calling something like xdp_program__set_run_prio() and
xdp_program__chain_call_enabled(), and 3) adding the programs to the
dispatcher and loading it.

Correct me if I'm wrong, but I guess you're saying that it might be
worth creating an abstraction in libxdp where a user can pass in the
necessary config data and libxdp does the work, that I just summarized
in the previous paragraph, on the user's behalf. I can see how that
could be a useful abstraction.

> The reason I went with the embedded BTF is that this gets compiled into
> the ELF file, and so we can be pretty sure that it doesn't get lost,
> without having to keep track of separate configuration files. So this
> makes it a good fit for BPF program authors specifying a default: they
> can be pretty sure that this will stay with the object code no matter
> how it's moved around.
> 
> The downside of using BTF is of course the same: it's tightly coupled to
> the compiled binary, and it's a bit awkward to parse (and modify). So I
> always anticipated that a secondary format that was *decoupled* from the
> binary byte code format would be needed, just as you're describing. So
> I'm just looking for input on what such a format might reasonably look
> like :)

I don't have super strong feelings about this, and there may be use
cases that I'm not thinking about, but my first thought would be to make
the format just be code in libxdp, and have the libxdp "abstraction"
function take an array of objects that contain the necessary data.

I know in a previous e-mail you mentioned having a config file with
priority overrides. That's just not a use case that our team would want
to use. And, my opinion would be that the program using libxdp should be
the one to implement that sort of policy; it keeps libxdp more simple
without needing to worry about parsing config files (and handling config
version changes in the code and the spec). For example, xdp-loader could
have a config file with priority overrides and people could use that
code if they wanted to do something similar.

Hopefully I'm even making sense, but like I said, I don't have strong
feelings about the format, as long as we are able to achieve our
required use case of programmatically setting the run configuration
values from a libxdp user program.

> 
> >> > Also, I do hope that the existing Go BTF libraries are good enough to do
> >> > what's needed here, because if I'm understand correctly, that's how I'll
> >> > need to approach setting the XDP_RUN_CONFIG values for our use case.
> >> 
> >> You'll need to *parse* BTF to *read* the XDP_RUN_CONFIG. Which is pretty
> >> basic, really, you just need to walk the BTF reference tree. Feel free
> >> to reuse the parsing code in libxdp; that is, in turn, adapted from the
> >> .maps section parsing code in libbpf :)
> >
> > OK, that makes sense. Since I want to keep our implementation purely
> > in Go (if possible), what I trying to say what that I hope there's an
> > existing Go library that can parse and read BTF (Cillium's Go eBPF
> > library looks promising). After thinking more about our orchestration
> > config data use case I was describing above, though, I don't think
> > reading XDP_RUN_CONFIG from BTF is strictly necessary for our use
> > case.
> 
> See above re: my reasons for picking the BTF format. Not sure how you're
> developing the BPF programs, but it may turn out to be useful to have
> program authors specify defaults as well. E.g., you could have whatever
> process *inserts* programs into your database (assuming that's where you
> store the available programs) read default values from the BTF and
> pre-populate the admin UI with those when someone wants to load
> programs?

We explicitly do not want defaults set by program authors. We want that
policy to be completely in the hands of the orchestration environment.

> 
> > That said, it obviously would be preferable to conform to the
> > specification, plus it does look necessary to read the program IDs
> > from BTF anyway :)
> 
> The program IDs are allocated by the kernel on load, so those have
> nothing to do with BTF. But you'll likely want to support BTF-defined
> maps, and the freplace functionality itself relies on BTF being present;
> so you'll need to handle it somehow... :)
> 
> -Toke

Thanks again,
Brian
