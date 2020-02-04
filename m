Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1711520FC
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 20:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgBDT0i (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 14:26:38 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28878 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727331AbgBDT0i (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 4 Feb 2020 14:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580844397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cK4kk9KTG8BWaRuBvs8XbBF2ptu8HKpXaRe/RR/WOiY=;
        b=ELIgx4Ua+kvnPyvMhNHky8gfOoXCn7VhmboYre60jdSAJDWo/HzEBuQMrERfhXV3cN1Hgr
        +6YaqIrDgNLtBUaOQwV03nbx9eOCvgrVhruI2gftTLK4PQAv8ucoVhhGSuZoTTqkwaYbJV
        JRntnX/98jHObcYhpppObIEzYF5E9GE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Ea-qTHFxPHuPH6evwKYsng-1; Tue, 04 Feb 2020 14:26:33 -0500
X-MC-Unique: Ea-qTHFxPHuPH6evwKYsng-1
Received: by mail-lf1-f70.google.com with SMTP id x5so2662468lfe.6
        for <xdp-newbies@vger.kernel.org>; Tue, 04 Feb 2020 11:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=cK4kk9KTG8BWaRuBvs8XbBF2ptu8HKpXaRe/RR/WOiY=;
        b=tLQ6ZKPWiW5bWs/9JnigKk2cruX01yPVyBKEuWoDuIqsui69gtTlGxrALeD7qWIPoU
         F+PMlC6mHAru83mbDZbMPzU1tAtv7mmHjzwEj/EbYold0Hzxi5BY2+0UhimWt8gJXBUv
         5w1Uj4A1ajm/+eV0P5NlKX8QCOeiaWaCzyQLDrbgl/YFfe554pix/OCyx6lngCNe4u7J
         RGUNbndVWR0W9xU361CcuJtCTmiFlivrHEmyf2u6oGjQzcvN5+bp08WLdJtwoHq91dJZ
         jodGBmcLITrfsLUd1qAmqKMWYYVFTS4a/LFGl2FbfOasHQszVXOBaeOw4Mni0A29IrI/
         FzHw==
X-Gm-Message-State: APjAAAVR1z5yk5d12BRYu+odx3sx4Bloqx5oQVuEQQ3IclyJgXSU1Czn
        AqFAeMtOzSWS0LAiPOWkLbuaBeVzBOWGbtzGq681py43zHfHShr8yfT9w+rbSfkRLyjokMt3tY/
        Ty3pMNy5xxKS8lhEKcmVVlbE=
X-Received: by 2002:a2e:8490:: with SMTP id b16mr18432407ljh.282.1580844392058;
        Tue, 04 Feb 2020 11:26:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvfvrqkwYpIaL9OAVxaJzuQfBr7IoIkRwk5o0R2IIVGFCIbsigjFjq5mfDfNs75pDaOUSY8w==
X-Received: by 2002:a2e:8490:: with SMTP id b16mr18432399ljh.282.1580844391819;
        Tue, 04 Feb 2020 11:26:31 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id v9sm12662518lfe.18.2020.02.04.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:26:31 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 50B201802D4; Tue,  4 Feb 2020 20:26:27 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Andrii Nakryiko <andriin@fb.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        xdp-newbies@vger.kernel.org,
        "bpf\@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: Need a way to modify the section name for a read program object
In-Reply-To: <f1fa48b7-8096-b4f2-51cc-bcb4c1da0cd4@fb.com>
References: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com> <874kw664dy.fsf@toke.dk> <f1fa48b7-8096-b4f2-51cc-bcb4c1da0cd4@fb.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 04 Feb 2020 20:26:27 +0100
Message-ID: <87zhdyduho.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Andrii Nakryiko <andriin@fb.com> writes:

> On 2/4/20 2:19 AM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> "Eelco Chaudron" <echaudro@redhat.com> writes:
>>=20
>>> Hi All,
>>>
>>> I'm trying to write an xdpdump like utility and have some missing part
>>> in libbpf to change the fentry/FUNCTION section name before loading the
>>> trace program.
>>>
>>> In short, I have an eBPF program that has a section name like
>>> "fentry/FUNCTION" where FUNCTION needs to be replaced by the name of the
>>> XDP program loaded in the interfaces its start function.
>>>
>>> The code for loading the ftrace part is something like:
>>>
>>> 	open_opts.attach_prog_fd =3D bpf_prog_get_fd_by_id(info.id);
>>> 	trace_obj =3D bpf_object__open_file("xdpdump_bpf.o", &open_opts);
>>>
>>> 	trace_prog_fentry =3D bpf_object__find_program_by_title(trace_obj,
>>> "fentry/FUNCTION");
>>>
>>> 	/* Here I need to replace the trace_prog_fentry->section_name =3D
>>> "fentry/<INTERFACE PROG NAME> */
>>>
>>> 	bpf_object__load(trace_obj);
>>> 	trace_link_fentry =3D bpf_program__attach_trace(trace_prog_fentry);
>>>
>>>
>>> See the above, I would like to change the section_name but there is no
>>> API to do this, and of course, the struct bpf_program is
>>> implementation-specific.
>>>
>>> Any idea how I would work around this, or what extension to libbpf can
>>> be suggested to support this?
>>=20
>> I think what's missing is a way for the caller to set the attach_btf_id.
>> Currently, libbpf always tries to discover this based on the section
>> name (see libbpf_find_attach_btf_id()). I think the right way to let the
>> caller specify this is not to change the section name, though, but just
>> to expose a way to explicitly set the btf_id (which the caller can then
>> go find on its own).
>
> Yes, I agree, section name should be treated as an immutable identifier=20
> and a (overrideable) hint to libbpf.
>
>>=20
>> Not sure if it would be better with a new open_opt (to mirror
>> attach_prog_fd), or just a setter (bpf_program__set_attach_btf_id()?).
>> Or maybe both? Andrii, WDYT?
>
> open_opts is definitely wrong way to do this, because open_opts apply to=
=20
> all BPF programs, while this should be per-program.

Yes, of course; silly me :)

> I'm also not sure having API that allows to specify BTF type ID is the
> best, probably better to let libbpf perform the search by name. So I'd
> say something like this:
>
> int bpf_program__set_attach_target(int attach_prog_fd, const char=20
> *attach_func_name)
>
> This should handle customizing all the tp_btf/fentry/fexit/freplace BPF=20
> programs we have.

Right, that makes sense; I think that would cover it (apart from your
function signature missing a struct bpf_program argument).

> We might add extra attach_target_ops for future extensibility, if we
> anticipate that we'll need more knobs in the future, I haven't thought
> too much about that.

Good question, me neither. Will see if I can think of anything...

-Toke

