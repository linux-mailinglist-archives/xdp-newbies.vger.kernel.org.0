Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2538527B30B
	for <lists+xdp-newbies@lfdr.de>; Mon, 28 Sep 2020 19:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgI1RYE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 28 Sep 2020 13:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgI1RYE (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 28 Sep 2020 13:24:04 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7662FC061755
        for <xdp-newbies@vger.kernel.org>; Mon, 28 Sep 2020 10:24:04 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r9so1974629ioa.2
        for <xdp-newbies@vger.kernel.org>; Mon, 28 Sep 2020 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F4tdqMXfLnjLxn45VNNOKd0IiDgMEzNSMuOV9tnaJ8A=;
        b=aGCnncXF4/u6WW9on+1n+q91aJb25qymrUjk7gd7AJl+nD6rizmCSOo2TYgK6kS2af
         NA9igsPd5mn2pK3ER1QKltdwmjiP4llnPrPIg2bt92yVQVkZ5VyTl6QUT9D42CwuYPxy
         far3cSjHOb5eXHL1Nj6sdgpS4P9ENQwIGc8DlpUw4FkfimFhy9xNNCMXrqVo4Fv170i2
         atu0vNlK5accdtyl3Z3GkF9GTIKPlQhWDb9H+QGNOgejlJeZSRq/wvKPuZAgU9544ezA
         W6X3Lc9T3ljKGp6hwvVBxXZ+OjaPu17NsdUX4KBVYi8v6CSz2BEriwImqmtAsZroHlfU
         184Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F4tdqMXfLnjLxn45VNNOKd0IiDgMEzNSMuOV9tnaJ8A=;
        b=OdfwsVhaHtfN1vIeCSAvh6ifvrYaj0hUjtqeYBJl32cJOpvptd20JjIwJOCzqJkA3r
         kTJ87rC4m75uJVLOCgYTheLjn0rUDeC+XsOccY0iIt0qpHVQwrvnK97kaPWm4VtPBVD5
         a3ltVZF4KPlWau0GQOJC+RzAeC25YFfcesoX56IbZ+CTnSh4Ab//Ok6TdADiKIM6dqEb
         q+8diGRQ/qktMYUZTr6g5hMCe5RLk0hh+/Fhb0XkJsHno0LsTqPaXL4hw6T9SwkPs2J2
         spRj/jPxRwckTgspjJUb1wdE/GQXkkjiWR4/UhrpeOY38BSLLb+KuVHegbe4chCaJ1l0
         w6Mw==
X-Gm-Message-State: AOAM533CuD+JhKhxZZIKrfTNXWqZ2mM6gXYx9NAia96ZELT6YWLBfypb
        EAuAsFrB5Tx+r38VgkFo/jqu33t2kjL9Xu8tl9NCrkzxc/9+4w==
X-Google-Smtp-Source: ABdhPJxFgX/y12DndhAzAh6LIBr+TMs0NR+sJk77CbyJ4WbsOMo5e41EewJ9tYqkvLjPH2VUrQvzLnONYLvNh6pSEbA=
X-Received: by 2002:a05:6602:2f88:: with SMTP id u8mr7645273iow.175.1601313843746;
 Mon, 28 Sep 2020 10:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHQoOTbXqZ0_djDbMuXwSs31Mo3dRCSFShD1NvW+Dz2YmKiejw@mail.gmail.com>
 <CAH3MdRUUEHMeTjpNy=a0Q0CnJeXioFzCuoBVpdnu3gKhm5D0pA@mail.gmail.com> <CAHQoOTa2zd6zQ0h+YaGK7b_p=O5u9hN-H8SgKRp9yMVqPCjfOQ@mail.gmail.com>
In-Reply-To: <CAHQoOTa2zd6zQ0h+YaGK7b_p=O5u9hN-H8SgKRp9yMVqPCjfOQ@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Mon, 28 Sep 2020 10:23:27 -0700
Message-ID: <CAH3MdRVadepb7ydQ=a+3dAgOAWHKqHHQC+yOhy5VTCkQG4PqPA@mail.gmail.com>
Subject: Re: Using pinned maps within a network namespace
To:     John McDowall <jmcdowall@paloaltonetworks.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Sep 25, 2020 at 3:54 PM John McDowall
<jmcdowall@paloaltonetworks.com> wrote:
>
> Song,
>
> You are right the issue is that in a new namespace /sys/fs/bpf is readonly.
>
> On host system (Centos 8.2)
>
> [jmcdowall@jed102 framework]$ ls -al /sys/fs
> total 0
> drwxr-xr-x.  9 root root   0 Jul 15 16:01 .
> dr-xr-xr-x. 13 root root   0 Jul 15 16:02 ..
> drwx-----T.  2 root root   0 Jul 15 16:01 bpf

You probably called
   mount -t bpf bpf /sys/fs/bpf
with additional mode options to mount bffs.

> drwxr-xr-x. 14 root root 360 Jul 15 16:01 cgroup
> drwxr-xr-x.  4 root root   0 Jul 22 11:58 ext4
> drwxr-xr-x.  3 root root   0 Jul 16 11:05 fuse
> drwxr-x---.  2 root root   0 Jul 15 16:01 pstore
> drwxr-xr-x.  7 root root   0 Jul 15 16:01 selinux
> drwxr-xr-x.  5 root root   0 Jul 29 18:58 xfs
> [jmcdowall@jed102 framework]$
>
> Then create a network namespace
>
> [jmcdowall@jed102 framework]$ sudo ip netns add test
> [sudo] password for jmcdowall:
> [jmcdowall@jed102 framework]$ sudo ip netns exec test ls -la /sys/fs
> total 0
> drwxr-xr-x.  9 root root 0 Sep 25 14:31 .
> dr-xr-xr-x. 13 root root 0 Jul 15 16:02 ..
> dr-xr-xr-x.  2 root root 0 Sep 25 14:31 bpf

This is just the default directory. It is not mounted with bpffs.

> dr-xr-xr-x.  2 root root 0 Sep 25 14:31 cgroup
> drwxr-xr-x.  4 root root 0 Sep 25 14:31 ext4
> drwxr-xr-x.  3 root root 0 Sep 25 14:31 fuse
> dr-xr-xr-x.  2 root root 0 Sep 25 14:31 pstore
> dr-xr-xr-x.  2 root root 0 Sep 25 14:31 selinux
> drwxr-xr-x.  5 root root 0 Sep 25 14:31 xfs
> [jmcdowall@jed102 framework]$
>
> and the bpf directory is readonly.
>
> There does not seem to be a way to make the directory writable.
>
> Does anyone have any ideas?

somethings like this may help.
mkdir /tmp/t
mount -t bpf bpf /tmp/t
ip netns exec test mount --bind /root/t /tmp/t
ip netns exec test mount | grep bpf
    none on /root/t type bpf (rw,relatime)

Now inside namespace, you will have a bpffs.
Based on my experience, you cannot create bpffs (like `mount -t bpf
bpf <...>`) inside the net namespace.

>
> Regards
>
> John
>
>
>
> On Tue, Sep 15, 2020 at 10:12 PM Y Song <ys114321@gmail.com> wrote:
> >
> > On Tue, Sep 15, 2020 at 11:46 AM John McDowall
> > <jmcdowall@paloaltonetworks.com> wrote:
> > >
> > > Hi everyone,
> > >
> > > This may be a dumb question, I have set up a simple test environment
> > > with multiple network namespaces running on a ubuntu 20.04 vagrant
> > > box, with the latest github libbpf.
> > >
> > > I want to use a pinned map, I can make /sys/fs/bpf shared by:
> > >
> > > $ mount mount --make-shared /sys/fs/bpf
> > > $ mount --bind /sys/fs/bpf /sys/fs/bpf
> >
> > Similar commands `mount --bind /sys/fs/bpf /sys/fs/bpf1` in the same namespace
> > works fine.
> >
> > Maybe there are restrictions related to namespace? Maybe it becomes readonly?
> > Could you print out the error code below?
> >
> > >
> > > but when I try access the maps from a C program running in a namespace
> > > using bpf I get
> > >
> > >  Access to /sys/fs/bpf/lwtconfig map failed obj_pin errno: No such
> > > file or directory
> > >
> > > The code snippet is:
> > >
> > > mapfd = bpf_obj_pin(pin_fd,CONFIG_MAP_PATH);
> > >         if (mapfd < 0) {
> > >             jed_info(jed_logfile,"Access to %s map failed obj_pin ",
> > > CONFIG_MAP_PATH);
> > >             pin_fd = bpf_obj_get(CONFIG_MAP_PATH);
> > >             if (pin_fd < 0){
> > >              jed_error(jed_logfile,"Access to %s map failed with
> > > obj_get ", CONFIG_MAP_PATH);
> > >             }
> > >         }
> > >
> > > Is this possible, and if so what am I missing?
> > >
> > > Regards
> > >
> > > John
