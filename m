Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90BA2C9C4A
	for <lists+xdp-newbies@lfdr.de>; Tue,  1 Dec 2020 10:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390010AbgLAJMt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 1 Dec 2020 04:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390004AbgLAJMr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 1 Dec 2020 04:12:47 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09C0C0613CF
        for <xdp-newbies@vger.kernel.org>; Tue,  1 Dec 2020 01:12:07 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 79so984512otc.7
        for <xdp-newbies@vger.kernel.org>; Tue, 01 Dec 2020 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=Gew3oRtfNUw6ZQP93tVEWOMujn8EigeYqFZIIOGqOGQ=;
        b=afOF4OQVqi8KHa0SFcSCbfVDa+Yq1G5gVQWcZycMPxb/B4FoQIwLu/iRbbMn/MO6Cv
         kabD72xmO1OevDQQ+Zqw5+dMQE7c99P36Iop+GQoc0zKPt/xgZ4i7+LLCmAslD0Li+Dk
         fzqSvgzQOLitk7HP+W7w9yeW1zqVlWPij/4NoP9ReKLefLuWPuHGB2yEILo9L3h/Z2lH
         AiMl7QYCctgmC1NUw8prxlUK1NehZ7zwv0LN9q6xDpHbkWBeOwBHovL5OehP4Y7WH3/q
         XkoCZwnRYYvJfz/rgHSDKsMCTnDMWxgYsjRBOBafQR96uNh3v6JU/KjTeAkzWZLqj282
         5Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=Gew3oRtfNUw6ZQP93tVEWOMujn8EigeYqFZIIOGqOGQ=;
        b=iY4ZOGuzEN7UKX4dIZnHcrqV3O9NZmLnr0HGs8x8qz0LFbyso3HV7qJ5TzCNRJhIL8
         lYbNf71b4ZHMuYn8XsrUBZ8ZUrFPueW7jg0o1UPvMg8pkicTSAGSJHl8rrNMsmHSwShp
         IeKHZXWF6V8rFbCJOnXxwYXxf0C7hZh+VZWl+8URj39xhaQJWCMPkoFBinpJ8JS/dRSs
         EPKTugfZT/k6UpD+yFM36/AMCixcqA4AhknrfOpD8PqK1QDLdBuya2fuO0nmU7dIVRc+
         MOHjn8OiWehBCk6joeC40PZt+c4urCcYWnINYDNRY4wQM3L2kEUZT7vWm7q5DvnTEOc+
         GdMg==
X-Gm-Message-State: AOAM533xWLHzzJC9FEHWDDaCD9jJFh3wVd+60VZdDgNjQUjq+gATDEpm
        BslZH4iEnYb8+WyD7tQNLlntIUW4hIc=
X-Google-Smtp-Source: ABdhPJy/Ecm/DJbky8yK0pnR5/l3vx9VCTLhm2B8btvY3bw1XGb0jaDH0KeiL349URklSl44r5LeYA==
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr1141484otq.159.1606813926309;
        Tue, 01 Dec 2020 01:12:06 -0800 (PST)
Received: from localhost ([216.207.42.140])
        by smtp.gmail.com with ESMTPSA id q129sm285385oif.43.2020.12.01.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 01:12:05 -0800 (PST)
Date:   Tue, 1 Dec 2020 02:12:03 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     xdp-newbies@vger.kernel.org
Cc:     toke@redhat.com
Subject: How to orchestrate multiple XDP programs
Message-ID: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all,

tl;dr: What does the future look like for Go programs orchestrating
multiple, chained eBPF network functions? Is it worth considering doing
the orchestration from C++ (or Rust) instead of Go? I'm hoping the
Cilium and/or Katran folks (and any other interested people) can weigh
in!

--

I just joined a team working with the orchestration of multiple XDP (and
TC) programs. By "orchestration" I mean that various eBPF programs can
be written by multiple teams for different systems and we have logic to
decide how to run, update, and chain them together. This seems to be a
fast-moving topic right now and I'm trying to get my bearings as well as
prepare for the future. Feel free to just point me to relevant docs or
code

This is essentially what we do today: We have a top level Golang
orchestration program that has access to a database that contains all
the business logic (e.g., variable values for the bpf programs depending
on datacenter), the latest build of the C BPF userspace, and kernel
programs. Basically, like this:

                  +--> [userspace prog 1] --> [kern prog 1]
                  |
[Go orchestrator] +--> [userspace prog 2] --> [kern prog 2]
                  |
                  +--> [userspace prog 3] --> [kern prog 3]

The Go program simply executes (fork+exec) the userspace programs with
the appropriate command-line arguments for their environment. The
userspace program loads the kernel programs, which need to do a
bpf_tail_call to the next program, which is exposed with some bpf map
mojo[1].

I think it's not too dissimilar from what the Cilium and Katran folks
have been doing. I think our current approach is actually pretty cool
considering that the project started a couple of years ago, but I'm
trying to plot a course for the future.

I have a couple of concerns about the current design:

1. The kernel programs need to make the bpf_tail_call. I'd prefer our
   internal teams can write network functions without needing to be
   aware of other network functions.
2. The Go orchestrator simply doing a fork+exec feels naughty. I'm
   assuming there's potentially important error state information that
   we might be missing out on by not working with an library API.

Regarding #1, Toke Høiland-Jørgensen was kind enough to point me to his
recent work for the Linux 5.10 kernel and xdp-loader (backed by xdplib)
that I think addresses the underlying concern. However, I'm not so sure
how to handle my concern #2.

I think ideally, our new flow would look something like this:

                               +--> [kern prog 1]
                               |
[Go orchestrator] --> [xdplib] +--> [kern prog 2]
                               |
                               +--> [kern prog 3]

Assuming that make sense, I have a few questions:
    * is there any work being done for a Go interface for xdplib?
    * interface for xdplib? Any ideas on the level of effort to do that? 

Alternatively, we could probably just execute the xdp-loader binary from
Go, but that that goes back to my concern #2 above.

Thanks in advance for any feedback; please let me know if I'm even on
the right track with my thoughts here.

Thanks,
Brian


[1] https://www.youtube.com/watch?v=NpDoK6kmGe0&feature=youtu.be&t=2379
