Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323DE32B19E
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Mar 2021 04:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbhCCBxb (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Mar 2021 20:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbhCCBgY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Mar 2021 20:36:24 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15892C06178B
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Mar 2021 17:33:46 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id g9so19897255ilc.3
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Mar 2021 17:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jG/l/GjC2trJKV6T6GkZHV/70MXLMmBwWWaLdYH3iSo=;
        b=fcHr9tFcTiU0SwHHEznl4CoqvaRP1VQXBWql778MWqlA8WK8NhljrwM5tFKy+fwddc
         KpupKZM6Q+QTS4P7jc+sFdRIhJnMCucSY+pPqmPU/uxKu6V8LDyKPBhB2/bKiOzw9ifs
         vBFk/C9mHWwhO81hHi+iYHpsRt6E7Y5UvfwdFIcN6QpvRVbiTuHAyBS+AOuhfX/LNN8b
         2KPxce3UsgtmA7KLNoLNsPBJO11T2xG32jFwddo8vfBWAbyKnTDhsShqdpaSfPzzVH3M
         X3GHa0XaNhBfNcLH3EfyMlB3ajTHYsOW1ZGVDOzISL48B1qm8YDEIrHJd6n+K/AzvKhm
         t7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jG/l/GjC2trJKV6T6GkZHV/70MXLMmBwWWaLdYH3iSo=;
        b=pGyXlt6LrfWXjtMU33s2k/BT1WZHZy76nCltYV7GJn3ExDXuFSo7K5mU44jBSf/qOy
         mI8mmXYei1UQqvfiXk1T7HaDS99azvqqZmNKmT6cqZ6kNn/m9k+foBE6eJEnmiBwjwaI
         IUo1XNgCV0IGHvle9/frMm76FRLomGhoW4gLZhWE+dJPFK3J0GeEWDF3ryKfLSNn0jya
         79z9+ePYSsiJo/8oAw+i4oJAL2q5KcgHtNwgBuuWrEmbLZdoNkAHAkqV1lZmcyX4zL19
         sIUOL3JPcfWPw+8OV1knEzcUPpdm3VNZpyR1V3kIYtTJryETrduTv8z0kU3LGmq3sg4T
         tpeg==
X-Gm-Message-State: AOAM530T19dDe0r3nwhwdwQzmQUmkeaYRXCo1hqYhqWpF86KM9KLXByx
        7Np3nBtq0Enu096QsRnNSzNpcB1Js40pkuNBSfTc4DM53Og=
X-Google-Smtp-Source: ABdhPJxYW23oyjeHKdPku40nMDKx9bAfTeeDN34EDkb/RXLUS4z7CqHm0bTsKh0W62ZmVsISG29fYgc/uU1zmo0LXhg=
X-Received: by 2002:a05:6e02:f06:: with SMTP id x6mr18635645ilj.287.1614735225504;
 Tue, 02 Mar 2021 17:33:45 -0800 (PST)
MIME-Version: 1.0
References: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
 <87pn0jvswj.fsf@toke.dk> <CAH3MdRUSKRNgRphaVGM3sXuUgPAWv2hZo_G7FBMANa58qO7G4A@mail.gmail.com>
 <CADutbzWo9KO9TBcR4HpmuBBB1DFLSAGte3d_wASFFJpTWFitmQ@mail.gmail.com>
In-Reply-To: <CADutbzWo9KO9TBcR4HpmuBBB1DFLSAGte3d_wASFFJpTWFitmQ@mail.gmail.com>
From:   Y Song <ys114321@gmail.com>
Date:   Tue, 2 Mar 2021 17:33:09 -0800
Message-ID: <CAH3MdRVpX2Npern-s+ZnR9YW-7BRNm_cmv6xAoHMY2w2Tctx5w@mail.gmail.com>
Subject: Re: Query on eBPF Map iterator in Kernel space
To:     Shwetha Vittal <cs19resch01001@iith.ac.in>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Mar 2, 2021 at 4:55 PM Shwetha Vittal <cs19resch01001@iith.ac.in> w=
rote:
>
> Sure thanks. I have created a hashmap. I will try with the new
> proposed API  long bpf_for_each_map_elem(struct bpf_map *map, void
> *callback_fn, void *callback_ctx, u64 flags) from bpf-next repository.

Great. Let us know if you hit any issues or have any suggestions. Thanks!

>
> Thanks
> Shwetha
>
> On Tue, Mar 2, 2021 at 11:55 AM Y Song <ys114321@gmail.com> wrote:
> >
> > On Mon, Mar 1, 2021 at 6:44 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@r=
edhat.com> wrote:
> > >
> > > Shwetha Vittal <cs19resch01001@iith.ac.in> writes:
> > >
> > > > Hi,
> > > >
> > > > Is there any way to iterate through eBPF Map elements in kernel spa=
ce.
> > > > I know that there is one at user space bpf_map_get_next_key(). But =
it
> > > > doesn't work when tried in kernel space. I have a requirement to fi=
nd
> > > > the record in the eBPF map which has the least value in kernel spac=
e
> > > > and pick it for further packet processing and therefore need to
> > > > iterate through eBF Map .
> > >
> > > There will be soon:
> > > https://lore.kernel.org/bpf/20210226204920.3884074-1-yhs@fb.com/
> >
> > What kind of maps are you trying to iterate? The above patch set
> > supports hash and array maps. Also, the above patch set has been
> > merged into bpf-next repo. Feel free to experiment with it!
> >
> > >
> > > -Toke
> > >
>
> --
>
>
> Disclaimer:- This footer text is to convey that this email is sent by one
> of the users of IITH. So, do not mark it as SPAM.
