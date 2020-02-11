Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33122159255
	for <lists+xdp-newbies@lfdr.de>; Tue, 11 Feb 2020 15:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgBKOyd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 11 Feb 2020 09:54:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36261 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727264AbgBKOyd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 11 Feb 2020 09:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581432871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8NVLxwWTOxE6u7A/qti2YerzSZ7+x+aQJQi9mvS0cs=;
        b=HBuPh/34z+siAYHz8gkf7jyrXCftvjJWEj4Y4GYQPc8FT4xQTNV1B2qqxauxmsthF689aI
        eEMXK55kqVcgItoie/DZlqIugiOCWiqHHGK5aIo7JE/G9KFUXElL2iF6oHEOm+GyuEzibG
        0E4IioAstvn2ykEvmRtgO+0wtv9BHG4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-6nRkuYxGMYyusLteZaXPcw-1; Tue, 11 Feb 2020 09:54:29 -0500
X-MC-Unique: 6nRkuYxGMYyusLteZaXPcw-1
Received: by mail-lj1-f200.google.com with SMTP id s25so3878343ljm.9
        for <xdp-newbies@vger.kernel.org>; Tue, 11 Feb 2020 06:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=d8NVLxwWTOxE6u7A/qti2YerzSZ7+x+aQJQi9mvS0cs=;
        b=hT3uDQbfLHMze/dmgH88Scts72H+sgYIRjWMZDN6zy1vXITq2EqnTbjQh5+PrkuLYa
         XYqRCqRnVhzugw789MF1guh8fLSyyss0PZpGjtpfl0tQjAO6rzG/adJggcofkzhGCH1b
         wzj9/qm8aPhz67/GIHuH94tUBLIZaTuqhyYoyyfwtiq1cYZAvRXQ5bKOOLL0ap58760E
         cdy9RfKmCjhq6s5Nc4NropzqjyI08VKHqnnkwbqgNEhkxpG2s2hbN9EdsgqNavB6dUzX
         lzAE1iZkUCGISG8z0/NQQpXXuaX9xcQnjwe58Jcg4xiATwFhEtQ3EAg+Uunu72XwMj1f
         IaVg==
X-Gm-Message-State: APjAAAVtUZNJdBmWyRpzVynOy80W29PJXDl+5oJpcMLt4kCKEZfi37yq
        024PnbqQ6fkOGuyirCPKXmKD9WR16NjYCSxZXN36uGG6zhLkCCNflqq6mQlEjbk7Je2BRuXoH5G
        qii8TN2gWTepCv5aOXrcRLZo=
X-Received: by 2002:a19:7401:: with SMTP id v1mr3843619lfe.129.1581432868335;
        Tue, 11 Feb 2020 06:54:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJ0zzuLIZLPJvyWS7ogYan9maBy3tqsqdTMzYz5/ikzYB5eKiGpt/P2xxEQRIa4WNjFCOqwg==
X-Received: by 2002:a19:7401:: with SMTP id v1mr3843611lfe.129.1581432868083;
        Tue, 11 Feb 2020 06:54:28 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id w6sm1934253lfq.95.2020.02.11.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 06:54:27 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 8BBDC180365; Tue, 11 Feb 2020 15:54:26 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Eelco Chaudron <echaudro@redhat.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Andrii Nakryiko <andriin@fb.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf@vger.kernel.org
Subject: Re: Need a way to modify the section name for a read program object
In-Reply-To: <0D7B2C92-FC75-4167-A973-EB0AD84FC878@redhat.com>
References: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com> <874kw664dy.fsf@toke.dk> <f1fa48b7-8096-b4f2-51cc-bcb4c1da0cd4@fb.com> <87zhdyduho.fsf@toke.dk> <CAEf4BzbWwseeKnGJCPj_VLLcQ-wkbhXWKAPsjQuy4LNDq8fvBg@mail.gmail.com> <0D7B2C92-FC75-4167-A973-EB0AD84FC878@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 11 Feb 2020 15:54:26 +0100
Message-ID: <87wo8ti38d.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Eelco Chaudron" <echaudro@redhat.com> writes:

> On 4 Feb 2020, at 20:32, Andrii Nakryiko wrote:
>
>> On Tue, Feb 4, 2020 at 11:27 AM Toke H=C3=B8iland-J=C3=B8rgensen=20
>> <toke@redhat.com> wrote:
>>>
>>> Andrii Nakryiko <andriin@fb.com> writes:
>>>
>>>> On 2/4/20 2:19 AM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>>>>> "Eelco Chaudron" <echaudro@redhat.com> writes:
>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> I'm trying to write an xdpdump like utility and have some missing=20
>>>>>> part
>>>>>> in libbpf to change the fentry/FUNCTION section name before=20
>>>>>> loading the
>>>>>> trace program.
>>>>>>
>>>>>> In short, I have an eBPF program that has a section name like
>>>>>> "fentry/FUNCTION" where FUNCTION needs to be replaced by the name=20
>>>>>> of the
>>>>>> XDP program loaded in the interfaces its start function.
>>>>>>
>>>>>> The code for loading the ftrace part is something like:
>>>>>>
>>>>>>     open_opts.attach_prog_fd =3D bpf_prog_get_fd_by_id(info.id);
>>>>>>     trace_obj =3D bpf_object__open_file("xdpdump_bpf.o",=20
>>>>>> &open_opts);
>>>>>>
>>>>>>     trace_prog_fentry =3D=20
>>>>>> bpf_object__find_program_by_title(trace_obj,
>>>>>> "fentry/FUNCTION");
>>>>>>
>>>>>>     /* Here I need to replace the trace_prog_fentry->section_name=20
>>>>>> =3D
>>>>>> "fentry/<INTERFACE PROG NAME> */
>>>>>>
>>>>>>     bpf_object__load(trace_obj);
>>>>>>     trace_link_fentry =3D=20
>>>>>> bpf_program__attach_trace(trace_prog_fentry);
>>>>>>
>>>>>>
>>>>>> See the above, I would like to change the section_name but there=20
>>>>>> is no
>>>>>> API to do this, and of course, the struct bpf_program is
>>>>>> implementation-specific.
>>>>>>
>>>>>> Any idea how I would work around this, or what extension to libbpf=20
>>>>>> can
>>>>>> be suggested to support this?
>>>>>
>>>>> I think what's missing is a way for the caller to set the=20
>>>>> attach_btf_id.
>>>>> Currently, libbpf always tries to discover this based on the=20
>>>>> section
>>>>> name (see libbpf_find_attach_btf_id()). I think the right way to=20
>>>>> let the
>>>>> caller specify this is not to change the section name, though, but=20
>>>>> just
>>>>> to expose a way to explicitly set the btf_id (which the caller can=20
>>>>> then
>>>>> go find on its own).
>>>>
>>>> Yes, I agree, section name should be treated as an immutable=20
>>>> identifier
>>>> and a (overrideable) hint to libbpf.
>>>>
>>>>>
>>>>> Not sure if it would be better with a new open_opt (to mirror
>>>>> attach_prog_fd), or just a setter=20
>>>>> (bpf_program__set_attach_btf_id()?).
>>>>> Or maybe both? Andrii, WDYT?
>>>>
>>>> open_opts is definitely wrong way to do this, because open_opts=20
>>>> apply to
>>>> all BPF programs, while this should be per-program.
>>>
>>> Yes, of course; silly me :)
>>>
>>>> I'm also not sure having API that allows to specify BTF type ID is=20
>>>> the
>>>> best, probably better to let libbpf perform the search by name. So=20
>>>> I'd
>>>> say something like this:
>>>>
>>>> int bpf_program__set_attach_target(int attach_prog_fd, const char
>>>> *attach_func_name)
>>>>
>>>> This should handle customizing all the tp_btf/fentry/fexit/freplace=20
>>>> BPF
>>>> programs we have.
>>>
>>> Right, that makes sense; I think that would cover it (apart from your
>>> function signature missing a struct bpf_program argument).
>>
>> great! and, ha-ha, too object-oriented thinking ;)
>
> Thanks for your feedback, assuming you are not working on it, I=E2=80=99l=
l=20
> implement/test it and sent out a patch.

Please do! :)

-Toke

