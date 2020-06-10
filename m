Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C890A1F5131
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 11:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgFJJc2 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 05:32:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44579 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727769AbgFJJc1 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 05:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591781545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5FlRHXmeBboarkTSpXdeBV8U7XG+XcuVsmgDpRsRNj0=;
        b=R7+QK8xWPZTnotO4YAWBLgXvWk76GPCg2bQgSpfp0qBIt9dApB5WEAqB/9gGIDusj+ENFQ
        aC8ypv88ULYpXhq/KgrFs6nISDrwKpmgGwzKbQsentlRfQHYYYHq1aVaP17DtOlQPhk9dV
        +CeYxmrNS5Wx+DXk5xyTQzoKYx9kgfA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-GuD7EHkQOrGx3B__HDiX2w-1; Wed, 10 Jun 2020 05:32:21 -0400
X-MC-Unique: GuD7EHkQOrGx3B__HDiX2w-1
Received: by mail-ej1-f70.google.com with SMTP id ca6so821441ejb.7
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 02:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=5FlRHXmeBboarkTSpXdeBV8U7XG+XcuVsmgDpRsRNj0=;
        b=rqJhy3Ieo79ELsePwZU/RDm0jT6ZaXNQ5SYZnpqI8U910TwcIWUVzAEdUEYa7vBDpo
         f/sQ0nShc3IvUR1zH4KwZm0lJo8dpMO3drucfUGPFNwIcpQJ0Ceh8/jgn744iftyyIQN
         OTzNJ8p2EMjBsvFk3LXXokvoc18MX2S7jTZfV+TXTvPJTZAgtRasdiInq/Ie8D1eZZT9
         f4aFMaOE9RN/tuMLpQMHnhjz67mV/KosSHu0S22sRvFEXZLh/lepSPzKy5BsCzqpJo1G
         IuG51oNL+LcM37BhojrN5joUI1fEpMLO5qnPSNCDwte4panmZMX46Kc3k169oieXIhYS
         7IEg==
X-Gm-Message-State: AOAM532e//1SSRi6278VCetdrnQDjXegmc/pOWYaqkM9Ovc/DZaLLhI0
        FyOJtJNP1zwMiWfv+qKcZtV817YmYjGs+ItzYFrYjjkYktZKItZswicr44+byAxV8ggkqB6lUmz
        LGncJp+72Pn+3SfxHudSPidg=
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr1654472edr.260.1591781540763;
        Wed, 10 Jun 2020 02:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfKtttEKq7frvgLeGrCA182m4IklpzpwsZ62Kp13NRRY6hydsEmBt2OBnouwhTGuOlW0X1LA==
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr1654446edr.260.1591781540438;
        Wed, 10 Jun 2020 02:32:20 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id n5sm17526745edq.13.2020.06.10.02.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 02:32:19 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id F0EB91814F0; Wed, 10 Jun 2020 11:32:18 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Elerion <elerion1000@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: How to load BTF style maps?
In-Reply-To: <CAMDScm=VZJMZYN=SXo9OAshY=yYxwtavLDgTvu1qEasg77JyLw@mail.gmail.com>
References: <CAMDScm=VZJMZYN=SXo9OAshY=yYxwtavLDgTvu1qEasg77JyLw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 10 Jun 2020 11:32:18 +0200
Message-ID: <87ftb38dwd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Elerion <elerion1000@gmail.com> writes:

> I have maps written in the old style like this:
>
> struct bpf_map_def SEC("maps") xdp_stats_map = {
> .type        = BPF_MAP_TYPE_ARRAY,
> .key_size    = sizeof(__u32),
> .value_size  = sizeof(struct datarec),
> .max_entries = XDP_ACTION_MAX,
> };
>
> I changed it to the new BTF style like this but now the example BPF
> loader from the kernel doesn't work anymore.
>
> struct {
>     __uint(type, BPF_MAP_TYPE_ARRAY);
>     __uint(max_entries,  XDP_ACTION_MAX);
>     __type(key,  __u32);
>     __type(value,  struct datarec);
> }  xdp_stats_map SEC(".maps");
>
> I used this to load my program
> https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c
>
> But now it fails to load. First thing I noticed was the I had to
> change "maps" to ".maps"
> https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c#L563
>
> But then bpf_create_map_node fails because all the arguments are 0. I
> dumped the buffer here
> https://github.com/torvalds/linux/blob/master/samples/bpf/bpf_load.c#L489
> and it just copies 28 bytes of zeroes for each map I have.
>
> How do you load BTF style maps? bpf_load.c doesn't seem to work on them.

Hmm, bpf_load.c seems to be using old-style loading (not libbpf) and so
wouldn't understand BTF-defined maps. I guess we should fix that.

In the meantime, you can try one of the following options:

Use xdp-loader from xdp-tools (since this seems to be an XDP use case?):
https://github.com/xdp-project/xdp-tools

Use bpftool (in tools/bpf/bpftool in the kernel source tree).

-Toke

