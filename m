Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E61632B19A
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Mar 2021 04:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhCCBwa (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Mar 2021 20:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbhCCAzx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 2 Mar 2021 19:55:53 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE12AC061756
        for <xdp-newbies@vger.kernel.org>; Tue,  2 Mar 2021 16:55:10 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id u18so12800322ljd.3
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Mar 2021 16:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iith.ac.in; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ey4F337XJyDl4jIRJhZaLJgsmxXfZLnyC+kGMp+QfPk=;
        b=oSADZZe0fTSPIp7w8w1B+uBwVI+eFPhebbi8nRs/rPDI2H/unl677dao/gDWGleiYZ
         /3RABRl0rNYALRtUQghl44W09Sq5MCgVIYbzSe/+6nJSA7cpEgZshyb9SFxx3G7aDHbu
         I9xhffS7tmQvgX8o5ad0ALAH1SA1xa5OTG7ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ey4F337XJyDl4jIRJhZaLJgsmxXfZLnyC+kGMp+QfPk=;
        b=rRFDEJ0XikRzWp3Y5kUrcD8jeVvpRwarjR4PQoqFeDnejpIE3i5o7vpejAe5Y5R/TH
         vZStLLeEMZ7qt8WePaKvZaBFnBQu/couZNl31GNjp8n7/RIf/XIKY3elS5tq/8RqrkP/
         RCmmvR//guk2je/IN22fc+07WrO4cpJbb3/KjN/rNpOpy71J4r01yE1NGHmj/kB4RZJr
         N67khei+FJwwv+mOCPII0wMYDGOZxAl9rrR/tmhx+PS/kjbrK/hT6ri047MMc8R1/YDb
         be3NFobxdz3Cma1mdFbgE05bm1U+/Z6CMAa6nZdIvhfZ6qrg5KOqpV8FgC/vRjd0Afj6
         z0+w==
X-Gm-Message-State: AOAM532tn/XI2n7r0/P18yIjV4GZYXvXSTxeaAYSL72TRL4TtSrT6bu0
        jjKccI5xVbWSOM1T+QmyyjIHfvlaK/tnvAlBSrYyQQ/goMKM8Zwl3e2ejoo62zGbWMHukGKme4a
        Ib+tbSwHyUlaaNW3c7r3QCzAnK2cetqbw
X-Google-Smtp-Source: ABdhPJxEcIpNK2RR4qydYpEfO89W9R60q4g5NyXKeUpzyhTriZ5ng7v1rkbWfwPWcmAcK1Zj9/lG2sCwX3K0QhDYsxk=
X-Received: by 2002:a05:651c:cd:: with SMTP id 13mr4581956ljr.129.1614732909241;
 Tue, 02 Mar 2021 16:55:09 -0800 (PST)
MIME-Version: 1.0
References: <CADutbzUJrgLQvhyd7EGd2EQSJv13rQkCHFpfMJwJkAtYhGLtdw@mail.gmail.com>
 <87pn0jvswj.fsf@toke.dk> <CAH3MdRUSKRNgRphaVGM3sXuUgPAWv2hZo_G7FBMANa58qO7G4A@mail.gmail.com>
In-Reply-To: <CAH3MdRUSKRNgRphaVGM3sXuUgPAWv2hZo_G7FBMANa58qO7G4A@mail.gmail.com>
From:   Shwetha Vittal <cs19resch01001@iith.ac.in>
Date:   Wed, 3 Mar 2021 06:24:56 +0530
Message-ID: <CADutbzWo9KO9TBcR4HpmuBBB1DFLSAGte3d_wASFFJpTWFitmQ@mail.gmail.com>
Subject: Re: Query on eBPF Map iterator in Kernel space
To:     Y Song <ys114321@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sure thanks. I have created a hashmap. I will try with the new
proposed API  long bpf_for_each_map_elem(struct bpf_map *map, void
*callback_fn, void *callback_ctx, u64 flags) from bpf-next repository.

Thanks
Shwetha

On Tue, Mar 2, 2021 at 11:55 AM Y Song <ys114321@gmail.com> wrote:
>
> On Mon, Mar 1, 2021 at 6:44 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
> >
> > Shwetha Vittal <cs19resch01001@iith.ac.in> writes:
> >
> > > Hi,
> > >
> > > Is there any way to iterate through eBPF Map elements in kernel space=
.
> > > I know that there is one at user space bpf_map_get_next_key(). But it
> > > doesn't work when tried in kernel space. I have a requirement to find
> > > the record in the eBPF map which has the least value in kernel space
> > > and pick it for further packet processing and therefore need to
> > > iterate through eBF Map .
> >
> > There will be soon:
> > https://lore.kernel.org/bpf/20210226204920.3884074-1-yhs@fb.com/
>
> What kind of maps are you trying to iterate? The above patch set
> supports hash and array maps. Also, the above patch set has been
> merged into bpf-next repo. Feel free to experiment with it!
>
> >
> > -Toke
> >

--=20


Disclaimer:- This=C2=A0footer text is to convey that this email is sent by =
one=20
of the=C2=A0users of IITH. So, do not mark it as SPAM.
