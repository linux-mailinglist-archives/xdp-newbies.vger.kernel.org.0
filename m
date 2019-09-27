Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCADBFF71
	for <lists+xdp-newbies@lfdr.de>; Fri, 27 Sep 2019 08:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfI0GzO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 27 Sep 2019 02:55:14 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:44581 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfI0GzN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 27 Sep 2019 02:55:13 -0400
Received: by mail-ot1-f53.google.com with SMTP id 21so1343188otj.11
        for <xdp-newbies@vger.kernel.org>; Thu, 26 Sep 2019 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bi7jx/MGsma9Tp6lioNiMkdd07lxOJS6f1oRSpnADrw=;
        b=WkyTesrzu4kYvQXnQ8HGEbePSIxL4zXmztNt+9YOmSLyJqDq1tO0MWqRWOnTBYaHMi
         Q25d81IKTOS22Tf1vl0Jgkigqr3qAlf358sBEvbP5b1/exG9yfodCQfLypGu8RNd7wMr
         Hj8300Fz9Xy1PixgrIPSrH+i4TX/34llFRKOPc9KzkDcd4x04kHH6udxwYOvDW6m3MB7
         5gekJIF668TUg8ySVKLuCSQWHqze2iXDX+0t7HRybYOega4cw/oMD9tx8L70QaPZH3wy
         bBWor/tozmUTpIfUza8CAM5jg18LfiWLVxQVS1LBX/mXdD6adB4NgVCiv7u4UeUN+Jrs
         ZSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bi7jx/MGsma9Tp6lioNiMkdd07lxOJS6f1oRSpnADrw=;
        b=nKL5llZ8bqqqzgXIKFpWhLN2iwN0NAY2qutNkSQW8hbV6aFwxywNzObbTcM8e9GC1S
         t5vFC4M4LwPcvdYwZYDCKeT/QzixCHovxey7rOnNlFdoIrWJYEuydk6tdXG6vqxFO87p
         I3paE6t1VtBP8j2Uemh0wVzwUBqJH/BFEFJzKT6OVQ7Y9hJ31CD6b4dwV6BMH0e8oP/H
         1BFYl0jjw2zHA9tbpdJjH1+xEUSdulHoGl2AwlgA2JWpy09g8z/B4149LKx+QX9G1YHB
         auDz5a+YJESIsmpAYI4dlHkAhVyx5olzvWMzJVOf5rl//AoPVwTNcJpcdQBI9UYTStMS
         xdFg==
X-Gm-Message-State: APjAAAWiJcWCtdSP8Zo1TmAbNAaf7Occ01lmTQMnMfSBeYTE5IAHK8l1
        kxrMFMq6OntL9c91NqYrCRAztPyjhJ8cUgSUYfw=
X-Google-Smtp-Source: APXvYqwJuNJj6niusJ0oQjTIveIq/L+lsbegthfcWw2GoosP3eQR5fq1R/EN6naRvkDO09HVxRMxk1GcO25QUNVz2Cc=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr2000176oti.39.1569567312819;
 Thu, 26 Sep 2019 23:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <7de437b13561433fa766aca690995c45@pantheon.tech>
In-Reply-To: <7de437b13561433fa766aca690995c45@pantheon.tech>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 27 Sep 2019 08:55:02 +0200
Message-ID: <CAJ8uoz1OL5_R12A4Np-aMmRM8a3qwQpXbuH3V+ZOiiRc6HYBwA@mail.gmail.com>
Subject: Re: bug in AF_XDP socket cleanup?
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <Julius.Milan@pantheon.tech>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        William Tu <u9012063@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi J=C3=BAlius,

The ring clean up routines in i40e and ixgbe are asynchronous, so they
will likely not be ready when you return from the xsk_socket__delete()
call. What happens if you add a sleep(1) before you create it a second
time?

/Magnus

On Wed, Sep 25, 2019 at 5:47 PM J=C3=BAlius Milan <Julius.Milan@pantheon.te=
ch> wrote:
>
> Hi folks
>
>
>
> I am stuck with proper cleanup of AF_XDP socket. Not sure if I am doing s=
omething wrong or is it a bug.
>
> I create xdp socket, then I remove it and then I am trying to create it a=
gain and got EBUSY from bind syscall
>
> of xsk_socket__create.
>
>
>
> My cleanup looks like this:
>
> xsk_socket__delete();
>
> xsk_umem__delete();
>
> bpf_set_link_xdp_fd(ifindex, -1, opt_xdp_flags);
>
>
>
> Attaching simple test case. It=E2=80=99s just reduced and modified xdpsoc=
k_user.c form kernel samples.
>
> Tested on kernel v5.3 4d856f72c10ecb060868ed10ff1b1453943fc6c8 and relate=
d libbpf.
>
>
>
> Thanks a lot
>
> Julius
