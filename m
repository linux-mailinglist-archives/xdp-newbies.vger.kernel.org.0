Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DED32B0A3
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Mar 2021 04:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhCCBmL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Mar 2021 20:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835901AbhCBGZv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Mar 2021 01:25:51 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B59AC061756
        for <xdp-newbies@vger.kernel.org>; Mon,  1 Mar 2021 22:25:11 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id k2so17029934ili.4
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Mar 2021 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=48aP0s2PleI6Bka23100ZgXrf9naF/tWDRjIg97JlSs=;
        b=sWSOKkOde32RngRnG/DmqN6kk0os3vw6pYxiOY1Wti0AVL5mNHggHUHPvPc2isIhB/
         Hul5XBa4aFpyisqx0v/j0Y3bg1Sx3lhOF3hUjLjq8DiV1fcd9TeqEulrJPNK/VqN9n7W
         Inx3IILa7BAb7iXU5aYuactHlHWJpVNIpOGBqF/1wSFI33eUMqd654vRtfmwcAuq3igh
         iS/ma3796DK7In08chWNfcfVJK0k1l1yreSkb7sjtw/2yWK1cdORMZW1U9MuD7zw1KqF
         mIwnsbp1mKyyoBdlpvdPCHof3SC0n3L9Slq+SciMgRGBOgQ90AyLeP79SMQwhwkzMpaq
         NY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=48aP0s2PleI6Bka23100ZgXrf9naF/tWDRjIg97JlSs=;
        b=oBQ7lj1b2ROZvtiMZYkv7rILzy+9IErEP8Zxya56gvFxDJU2ZqquJ2tmeHIkHOfD2X
         ZKJQkYv0kM8FlJ0n3EvSzgn0l17Z2UW8lqPVuyf3EY7FiIaTGv0O1nXwnE1z3RfdN8S/
         N94I1R47/YOZ2IO29zEcwr2T0N1e5MdBn6BRtlMrxqBBqYtG2wOGwHluWZ/terwmyLbg
         G9vmlEP3PM22SkP0mJ0ETKf9ZbvR9Evk9soTPTPg7e+hcsf94C3LmlOSV8mb4dA6G4kk
         uQUU7bPLLrhYNnXl2tD1kiDDWnFAsUtCwi6j9y/e3B4Nl8nIek+sur4uTa4gvk/EfzFw
         LJ3g==
X-Gm-Message-State: AOAM53396RpPG3zN6civ36RGM/sZl8/Gc/bSJrKHWQ4FRrYPti7JACD7
        d26WctLWxFFFuO9bifi1AKNvwC/h5wsmOuodOOc0oaun9OI=
X-Google-Smtp-Source: ABdhPJxU4WUUcchFspsENu5jY2ikZadzvj2rUQ/2z5TiT9Xi4LpW3GCrxxedgEzyWUOK6uEZATvHuLqq1hsBg5IJ+DU=
X-Received: by 2002:a05:6e02:1a6d:: with SMTP id w13mr17838845ilv.181.1614666310690;
 Mon, 01 Mar 2021 22:25:10 -0800 (PST)
MIME-Version: 1.0
References: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
 <87pn0jvswj.fsf@toke.dk>
In-Reply-To: <87pn0jvswj.fsf@toke.dk>
From:   Y Song <ys114321@gmail.com>
Date:   Mon, 1 Mar 2021 22:24:34 -0800
Message-ID: <CAH3MdRUSKRNgRphaVGM3sXuUgPAWv2hZo_G7FBMANa58qO7G4A@mail.gmail.com>
Subject: Re: Query on eBPF Map iterator in Kernel space
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Shwetha Vittal <cs19resch01001@iith.ac.in>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, Mar 1, 2021 at 6:44 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> Shwetha Vittal <cs19resch01001@iith.ac.in> writes:
>
> > Hi,
> >
> > Is there any way to iterate through eBPF Map elements in kernel space.
> > I know that there is one at user space bpf_map_get_next_key(). But it
> > doesn't work when tried in kernel space. I have a requirement to find
> > the record in the eBPF map which has the least value in kernel space
> > and pick it for further packet processing and therefore need to
> > iterate through eBF Map .
>
> There will be soon:
> https://lore.kernel.org/bpf/20210226204920.3884074-1-yhs@fb.com/

What kind of maps are you trying to iterate? The above patch set
supports hash and array maps. Also, the above patch set has been
merged into bpf-next repo. Feel free to experiment with it!

>
> -Toke
>
