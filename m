Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943B1152129
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 20:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgBDTcN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 14:32:13 -0500
Received: from mail-qk1-f176.google.com ([209.85.222.176]:41672 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBDTcM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 Feb 2020 14:32:12 -0500
Received: by mail-qk1-f176.google.com with SMTP id x82so164639qkb.8;
        Tue, 04 Feb 2020 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B/ZhbdzXUU4cU2LkoE3S0r5aNzHAmsl12y1TsjYHKS0=;
        b=lXRH2gTyvOBPLYmu7KgmUUgvavIGEggEuaa0JFFOL5CPiXz8I9+ocEAG52ZZT84IQC
         sZnLYlxViXodqwuXIlmVe2DteRZH34yBIjOI45M3HsvK4gWsSeJH9I0rCFyL3eC5jO+9
         kmrz8/GO2Yap+2lDPIdn+MhRqPY3CAKss+lbe6yq6Rw+tm23fJsuRRwg24m3zTMNcI1E
         FF4yjmxD+riX0FwRfyFpFdsBc3VAZSV+Ib4GChRnIEvEs4t3EYK9AsnEZhP96gdgD3Mx
         EBwudei3cTOxevCfz2Kiup9w6DXXmX+lFXny1vn3vI8u2Kf8Qlxmc89fCoim52vAhzKd
         LhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B/ZhbdzXUU4cU2LkoE3S0r5aNzHAmsl12y1TsjYHKS0=;
        b=a6stcf/ncskoQa3Bl2wVzAslBpKgvW246uveUsNoqo/bT2goOEF8buM9XCYgqH4gss
         LSO0Nz7NWtXxopV6EH5knVhbIfo5IrnQuf5m4hIp4RST74/kM9ifJ6RA3pyhgVVEPcF3
         qGUMKPeDaPL8Bx/gOmCDeigNKZeriqipRjPGSSSX5j/Sx/7gdDcbt47Q2YI2yjxIu9zg
         OxaqEcgoybWYIvSUyPwPiGvsv7rsb2uMl8juWiUSeJ9C5kMYhHynYTOmvfJp1XMu5NuJ
         oT77ExHWYhRnHO57lKOF7a9fvM2tkblow0CAphvd3yDM0BN/aJFrOFSIpRsS5CzBeakL
         1x7w==
X-Gm-Message-State: APjAAAX6vffLUTgpnLaW1HHBkiprUA9mU1iMGSZp2zydYvqtnh1YceBX
        SGhBQomsX9DdfQq17mKvr2FpUka9vV2yvqSn5WA=
X-Google-Smtp-Source: APXvYqzl7M4PIhJurb9T3O6suflM2UvcD69T7M7BipQONFV6To02JJjSHiLO65f9yVjYAjFDov7m9Nil8DW6uABQq1A=
X-Received: by 2002:ae9:eb48:: with SMTP id b69mr27781278qkg.39.1580844731251;
 Tue, 04 Feb 2020 11:32:11 -0800 (PST)
MIME-Version: 1.0
References: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com>
 <874kw664dy.fsf@toke.dk> <f1fa48b7-8096-b4f2-51cc-bcb4c1da0cd4@fb.com> <87zhdyduho.fsf@toke.dk>
In-Reply-To: <87zhdyduho.fsf@toke.dk>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Tue, 4 Feb 2020 11:32:00 -0800
Message-ID: <CAEf4BzbWwseeKnGJCPj_VLLcQ-wkbhXWKAPsjQuy4LNDq8fvBg@mail.gmail.com>
Subject: Re: Need a way to modify the section name for a read program object
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Andrii Nakryiko <andriin@fb.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Feb 4, 2020 at 11:27 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Andrii Nakryiko <andriin@fb.com> writes:
>
> > On 2/4/20 2:19 AM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> >> "Eelco Chaudron" <echaudro@redhat.com> writes:
> >>
> >>> Hi All,
> >>>
> >>> I'm trying to write an xdpdump like utility and have some missing par=
t
> >>> in libbpf to change the fentry/FUNCTION section name before loading t=
he
> >>> trace program.
> >>>
> >>> In short, I have an eBPF program that has a section name like
> >>> "fentry/FUNCTION" where FUNCTION needs to be replaced by the name of =
the
> >>> XDP program loaded in the interfaces its start function.
> >>>
> >>> The code for loading the ftrace part is something like:
> >>>
> >>>     open_opts.attach_prog_fd =3D bpf_prog_get_fd_by_id(info.id);
> >>>     trace_obj =3D bpf_object__open_file("xdpdump_bpf.o", &open_opts);
> >>>
> >>>     trace_prog_fentry =3D bpf_object__find_program_by_title(trace_obj=
,
> >>> "fentry/FUNCTION");
> >>>
> >>>     /* Here I need to replace the trace_prog_fentry->section_name =3D
> >>> "fentry/<INTERFACE PROG NAME> */
> >>>
> >>>     bpf_object__load(trace_obj);
> >>>     trace_link_fentry =3D bpf_program__attach_trace(trace_prog_fentry=
);
> >>>
> >>>
> >>> See the above, I would like to change the section_name but there is n=
o
> >>> API to do this, and of course, the struct bpf_program is
> >>> implementation-specific.
> >>>
> >>> Any idea how I would work around this, or what extension to libbpf ca=
n
> >>> be suggested to support this?
> >>
> >> I think what's missing is a way for the caller to set the attach_btf_i=
d.
> >> Currently, libbpf always tries to discover this based on the section
> >> name (see libbpf_find_attach_btf_id()). I think the right way to let t=
he
> >> caller specify this is not to change the section name, though, but jus=
t
> >> to expose a way to explicitly set the btf_id (which the caller can the=
n
> >> go find on its own).
> >
> > Yes, I agree, section name should be treated as an immutable identifier
> > and a (overrideable) hint to libbpf.
> >
> >>
> >> Not sure if it would be better with a new open_opt (to mirror
> >> attach_prog_fd), or just a setter (bpf_program__set_attach_btf_id()?).
> >> Or maybe both? Andrii, WDYT?
> >
> > open_opts is definitely wrong way to do this, because open_opts apply t=
o
> > all BPF programs, while this should be per-program.
>
> Yes, of course; silly me :)
>
> > I'm also not sure having API that allows to specify BTF type ID is the
> > best, probably better to let libbpf perform the search by name. So I'd
> > say something like this:
> >
> > int bpf_program__set_attach_target(int attach_prog_fd, const char
> > *attach_func_name)
> >
> > This should handle customizing all the tp_btf/fentry/fexit/freplace BPF
> > programs we have.
>
> Right, that makes sense; I think that would cover it (apart from your
> function signature missing a struct bpf_program argument).

great! and, ha-ha, too object-oriented thinking ;)

>
> > We might add extra attach_target_ops for future extensibility, if we
> > anticipate that we'll need more knobs in the future, I haven't thought
> > too much about that.
>
> Good question, me neither. Will see if I can think of anything...
>
> -Toke
>
