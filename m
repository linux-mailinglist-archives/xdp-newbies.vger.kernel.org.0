Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CC431DCC2
	for <lists+xdp-newbies@lfdr.de>; Wed, 17 Feb 2021 16:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhBQPys (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 17 Feb 2021 10:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31682 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233858AbhBQPyp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 17 Feb 2021 10:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613577197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D2uZWoamDdnnAA1lSTQTDOMHFQAWhI+7kdRpmcN+2qY=;
        b=aXu8/aaSg9DokCeiurcFfcEfTDd5A76oIRpcYZ/gFh0XT1mfSN18kt9oKgYclV9v+LSC8c
        71RkTvdgR+o82JmbjgUugx6/FWEH9NkN+hmYFMzpdQS9C+DK2Iy0BiAAL4hnOpwosP14fY
        59+hcv37WJ6LmWxd9rJFwt2XljIHe1Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-wnDRFehFNUSFBceCIeqmDQ-1; Wed, 17 Feb 2021 10:53:15 -0500
X-MC-Unique: wnDRFehFNUSFBceCIeqmDQ-1
Received: by mail-ej1-f69.google.com with SMTP id p15so8538457ejq.22
        for <xdp-newbies@vger.kernel.org>; Wed, 17 Feb 2021 07:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=D2uZWoamDdnnAA1lSTQTDOMHFQAWhI+7kdRpmcN+2qY=;
        b=JO2luHl9R9RDSBq6iBtUqTsxJGHoJJLgRjEpivkNAsy4vmsnOAOWG0BpS0/e5vTVJE
         1MgttiLVA5XZ5IllmHN5naTn+1U419aIa4XAwmfVUj6i8ocRSx4X5G2AQ4IxJuyElE51
         Nh6C1MnWkMGiZimbDOOcJKhqD7Vey5ldufbuGMoSnzPjQKR8ywydZWcSrE/WqSugMpQp
         Hexyx3+WzQ5nWaf5GUppqBPYmbSrNpl/hk8b6xz9VN/wftXhtXX4Ic31RXIvRxNBGbgn
         1UBaCYgtpKz10+uNbSHkMAIgPfbsMqpOrVUbn5kbqTggL8gWAibl5yRgkHi75DGQ4NJ8
         67ag==
X-Gm-Message-State: AOAM531r9r5eU7tRNzAcOSeZJjSAfmcNW7IrYJCefTJ085/8b2E+oAn6
        UG55uj1HXgG8TkWQt0dFlPDYk1xM+VJKTPgloJy1BPaVgzalUPZLi+fckC2+3L/GFGe93XJipt0
        ab38HQ71tP/G9EUShIkTJjbE=
X-Received: by 2002:a05:6402:304f:: with SMTP id bu15mr6481018edb.259.1613577193539;
        Wed, 17 Feb 2021 07:53:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG/8J9dsAllu3EoI4MNq5I19e/tLcEF5K61yoHGgCGqgBMhatQKCGdsFrT3LkmXWQD9WURpQ==
X-Received: by 2002:a05:6402:304f:: with SMTP id bu15mr6480976edb.259.1613577193081;
        Wed, 17 Feb 2021 07:53:13 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id n15sm1342779edb.53.2021.02.17.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 07:53:12 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C5A5D1805FA; Wed, 17 Feb 2021 16:53:10 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Brian G. Merrell" <brian.g.merrell@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
In-Reply-To: <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk> <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
 <20210212065148.ajtbx2xos6yomrzc@snout.localdomain>
 <87h7mdcxbd.fsf@toke.dk>
 <20210217012012.qfdhimcyniw6dlve@snout.localdomain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 17 Feb 2021 16:53:10 +0100
Message-ID: <87ft1un121.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Brian G. Merrell" <brian.g.merrell@gmail.com> writes:

> On 21/02/15 01:47PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
>>=20
>> > On 21/02/11 12:18PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> >> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
>>=20
>> >> The policy override stuff is not implemented yet, but I am planning to
>> >> implement it by having libxdp read a config file with priority overri=
des
>> >> (similar to how libc will read /etc/nsswitch.conf or /etc/hosts which
>> >> makes them work in all applications).
>> >>=20
>> >> And of course, if you're writing an orchestration tool, then you *are*
>> >> the user, so having the tool override priorities is definitely in sco=
pe
>> >> (it'll just be an alternative way to set policy instead of a config
>> >> file). How are you planning to specify the effective run order? I am
>> >> also quite open to working on a compatible way that can work for both
>> >> your tool and libxdp :)
>> >
>> > As part of our control plane we have a whole process for a sysadmin to
>> > get config data to to our BPF orchestration tool, which is running on
>> > multiple nodes. It very abstractly looks like this:
>> >
>> >
>> >                                      +---- Node 1
>> >                                      |
>> > UI -> API -> DATABASE -> CONFIG DATA +---- Node 2
>> >                                      |
>> >                                      +---- Node N
>> >
>> > So, the sysadmin using the UI or API would dictate which xdp programs
>> > run *and* what their priority is (plus anything else that would
>> > otherwise go into XDP_RUN_CONFIG, plus a bunch of other config data for
>> > various other needs). Then--and hopefully I'm getting this right--when
>> > our (Go) orchestration tool uses (Go) libxdp, the tool needs a way to
>> > set the run order for the XDP programs before the dispatcher loads.
>>=20
>> Yeah, and what I was interested in was how the orchestration tool gets
>> this data (and the BPF programs themselves)? Is there a daemon running
>> on the nodes that exposes an API? Are you pushing this via SSH/Ansible?
>> Infinite monkeys with typewriters inputting data? Something else? :)
>
> OK, what currently happens is we have a separate, centralized Go web
> service exposing an HTTP based API. When the sysadmin calls that API it
> stores the config data in a database. Then, we have another service that
> periodically queries the database and writes the config data to a
> constant database (cdb) and stores that in blob storage. Then, there is
> a service running on each node that periodically pulls down the latest
> cdb. Our orchestration tool running on each node is watching for new
> cdbs using inotify; when the tool sees a new CDB it loads the new
> configuration data--which, for us, literally ends up just being JSON
> data--and does anything that needs done.
>
> I had omitted those details for a couple of reasons: First, it's kind of a
> lot and I didn't know it would be helpful. Second, this is the way it
> works currently because, for expediency, we leveraged the internal
> ecosystem that was already setup. We will likely move away from it, at
> least partially.
>
> So, I think the important part is that our orchestration tool will
> periodically get the config data in JSON format. A path to each BPF
> program is in the config data and the orchestration tool downloads them
> as needed. We may move to just including the BPF program binary in the
> config data--TBD. Obviously, we aren't using libxdp yet, so our config
> data doesn't have "run priority", instead the config data has the order
> the BPF programs need to run, and BPF programs themselves have to do the
> bpf_tail_call (and the orchestration tool does a bunch of complicated
> orchestration to get the chain in the right order). The config data also
> contains a bunch of other information to do the orchestration, e.g.,
> interface, ingress or egress, tc or xdp, what userspace code to run and
> any config values for that, etc.
>
> Hopefully that answers your question, and sorry if it was too much
> information :)

No, that was very helpful, thanks! Just the kind of detail I was after
to understand your deployment scenario :)

>> > I was planning to set the run order programatically on the XDP program
>> > objects via libxdp calls. It looks like your libxdp implementation
>> > already has ways to do this in the form of xdp_program__set_run_prio()
>> > and xdp_program__chain_call_enabled().
>> >
>> > Does that make sense? This is still all very theoretical for me at this
>> > point!
>>=20
>> Yup, totally possible to set this programmatically with libxdp as well
>> today. However, before doing so you still need to communicate the list
>> of BPF programs and their run configuration to each node. And I'm
>> thinking it may be worthwhile to specify how to do this as part of the
>> "protocol" and also teach libxdp about the format, so others won't have
>> to reinvent the same thing later.
>
> It seems like I must be missing something here, but my plan was to do
> this all programmatically by calling libxdp functions from the
> orchestration tool by 1) calling something like xdp_program__open_file()
> to load the XDP program, and then 2) setting the run configuration by
> calling something like xdp_program__set_run_prio() and
> xdp_program__chain_call_enabled(), and 3) adding the programs to the
> dispatcher and loading it.
>
> Correct me if I'm wrong, but I guess you're saying that it might be
> worth creating an abstraction in libxdp where a user can pass in the
> necessary config data and libxdp does the work, that I just summarized
> in the previous paragraph, on the user's behalf. I can see how that
> could be a useful abstraction.

Yeah, so what I was thinking was whether it would be useful to, for
instance, define a "bundle" format that contains the config data that
libxdp will understand. Could just be a JSON schema containing keys for
priority, chain call actions and a filename, so you can just point
xdp_program__open_file() at that and it will do the rest.

However, I'm still not quite sure I'm convinced that this will be
generally useful. As you say, you can just as well just set the values
programmatically after loading the file, and I suspect that different
deployments will end up having too much custom stuff around this that
they'll bother using such a facility anyway. WDYT?

>> The reason I went with the embedded BTF is that this gets compiled into
>> the ELF file, and so we can be pretty sure that it doesn't get lost,
>> without having to keep track of separate configuration files. So this
>> makes it a good fit for BPF program authors specifying a default: they
>> can be pretty sure that this will stay with the object code no matter
>> how it's moved around.
>>=20
>> The downside of using BTF is of course the same: it's tightly coupled to
>> the compiled binary, and it's a bit awkward to parse (and modify). So I
>> always anticipated that a secondary format that was *decoupled* from the
>> binary byte code format would be needed, just as you're describing. So
>> I'm just looking for input on what such a format might reasonably look
>> like :)
>
> I don't have super strong feelings about this, and there may be use
> cases that I'm not thinking about, but my first thought would be to make
> the format just be code in libxdp, and have the libxdp "abstraction"
> function take an array of objects that contain the necessary data.

Well that's basically what 'struct xdp_program' in libxdp is :) You can
create an array of those (setting their properties with the setter
methods as you mentioned above) and pass them to
xdp_program__attach_multi() which will build a dispatcher for all of
them and attach that (incorporating any programs that may already be
attached by their priority).

> I know in a previous e-mail you mentioned having a config file with
> priority overrides. That's just not a use case that our team would want
> to use. And, my opinion would be that the program using libxdp should be
> the one to implement that sort of policy; it keeps libxdp more simple
> without needing to worry about parsing config files (and handling config
> version changes in the code and the spec). For example, xdp-loader could
> have a config file with priority overrides and people could use that
> code if they wanted to do something similar.

Yeah, that's totally what would make sense for your deployment case. The
design where libxdp reads a config file comes from my distro
perspective: We want to build a system whereby different applications
can each incorporate XDP functionality and co-exist; and the goal is to
make libxdp the synchronisation point between them. I.e., we can say to
application authors "just use libxdp when writing your application and
it'll work", while at the same time empowering sysadmins to change the
default application ordering.

By having that configuration be part of the library, applications can be
free to use either the command-line loader or include the loading into
their own user-space binary.

But since you are (notionally) both the application developer and system
owner, that is less of a concern for you as you control the whole stack.

> Hopefully I'm even making sense, but like I said, I don't have strong
> feelings about the format, as long as we are able to achieve our
> required use case of programmatically setting the run configuration
> values from a libxdp user program.

Sure, that you can certainly achieve with implementing what libxdp
includes today. I'm just trying to make sure we explore any
opportunities for standardising something useful so others can benefit
from it as well; so I hope you'll forgive my probing :)

>> >> > Also, I do hope that the existing Go BTF libraries are good enough =
to do
>> >> > what's needed here, because if I'm understand correctly, that's how=
 I'll
>> >> > need to approach setting the XDP_RUN_CONFIG values for our use case.
>> >>=20
>> >> You'll need to *parse* BTF to *read* the XDP_RUN_CONFIG. Which is pre=
tty
>> >> basic, really, you just need to walk the BTF reference tree. Feel free
>> >> to reuse the parsing code in libxdp; that is, in turn, adapted from t=
he
>> >> .maps section parsing code in libbpf :)
>> >
>> > OK, that makes sense. Since I want to keep our implementation purely
>> > in Go (if possible), what I trying to say what that I hope there's an
>> > existing Go library that can parse and read BTF (Cillium's Go eBPF
>> > library looks promising). After thinking more about our orchestration
>> > config data use case I was describing above, though, I don't think
>> > reading XDP_RUN_CONFIG from BTF is strictly necessary for our use
>> > case.
>>=20
>> See above re: my reasons for picking the BTF format. Not sure how you're
>> developing the BPF programs, but it may turn out to be useful to have
>> program authors specify defaults as well. E.g., you could have whatever
>> process *inserts* programs into your database (assuming that's where you
>> store the available programs) read default values from the BTF and
>> pre-populate the admin UI with those when someone wants to load
>> programs?
>
> We explicitly do not want defaults set by program authors. We want that
> policy to be completely in the hands of the orchestration environment.

Right, OK. How does the admin configuring the orchestration system
figure out which order to run programs in, BTW? Is this obvious from the
nature of the programs, or do you document it out of band somewhere, or
something like that?

-Toke

