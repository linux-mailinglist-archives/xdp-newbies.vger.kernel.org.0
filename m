Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74C01EBF8F
	for <lists+xdp-newbies@lfdr.de>; Tue,  2 Jun 2020 18:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFBQBt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Jun 2020 12:01:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40809 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726000AbgFBQBt (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Jun 2020 12:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591113707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rQhxrB0WbDjFdMVztT6H6vUGZ5nXp2QZwufUKBm9YHE=;
        b=eog1p6I8v+SOv+kf0NZIhqqdz1tISOZnlaYLNde/MiEJ/FdQ4l3NkThQlpAJeRNJP4tmjW
        vALi1UYInux6SCyddI+hGzoLoAsOR/l4R0Z5dTcm5JrgvoLpPvdvzp8iygoTN1ObY+FKfo
        LWb+6FcA7mhDsi5lHI4wKJbbfQRwnNg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-dBzQa2n8MSKrWWzGyOQ74A-1; Tue, 02 Jun 2020 12:01:45 -0400
X-MC-Unique: dBzQa2n8MSKrWWzGyOQ74A-1
Received: by mail-ej1-f70.google.com with SMTP id r11so672995ejd.1
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Jun 2020 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=rQhxrB0WbDjFdMVztT6H6vUGZ5nXp2QZwufUKBm9YHE=;
        b=tc8V7v5U1K68mwsmBCw5FQcLjwORTqlF5Is73CFIBBH9rTKO98rzB3bSYy/9Wp8T5Z
         oHR2Hgn1YHJgti4xWVD2vt02hhqzRavLLmlu8e+NtsVDUglqZxWNQk52oOcfBxr21KMT
         FM7kRyCHrosNeIORHaUl3grYqNGeUooa3Fr3K5N2opqkQA5K0JFMiLItdXC4HWv72Udi
         706WZbhfXPdrm70NzizUg6uF+P1020swpvW0bU5BgkLyhaZ+wGnvw+dn7V7Y8j1p6Gmg
         sJr+/9YEEwBUx+pcfbC7nOukmWlAC9Ly4AaXR/avya0rFwZQ2Y/zuKLC6qH8OMp6BbAO
         q0Vg==
X-Gm-Message-State: AOAM5306/Vcp0qvb9x0A+F1NlCrbkJLfFK0tz+/SA7OGPBQ0VVRm0iKm
        +t8Nm/cJjtOInPiPPRey+JYwmERcRRNhsd3blPwc0y76lbvET0mdhJT/4kXQ6EwAaEP6gxAzN6x
        ZhGA/LHeBRgHnr/r9IbrqPsc=
X-Received: by 2002:a05:6402:1bce:: with SMTP id ch14mr27752598edb.80.1591113703553;
        Tue, 02 Jun 2020 09:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6DXHS3k0coTAEYGNytlDFBMUdJqICko5tQ72rDOu+uAi9rqvIRWpdHdUUnfMYUMSSGHHm5A==
X-Received: by 2002:a05:6402:1bce:: with SMTP id ch14mr27752577edb.80.1591113703375;
        Tue, 02 Jun 2020 09:01:43 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id on20sm1786794ejb.70.2020.06.02.09.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 09:01:42 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B0C50182797; Tue,  2 Jun 2020 18:01:40 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     maharishi bhargava <bhargavamaharishi@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com> <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 02 Jun 2020 18:01:40 +0200
Message-ID: <877dwpmp7f.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

maharishi bhargava <bhargavamaharishi@gmail.com> writes:

> On Tue 2 Jun, 2020, 14:31 Toke H=C3=B8iland-J=C3=B8rgensen, <toke@redhat.=
com> wrote:
>>
>> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>>
>> > Hi, in my XDP program, I want to redirect some packets using AF_XDP
>> > and redirect other packets directly from driver space.
>> > Redirection through AF_XDP works fine, but redirection through dev map
>> > stops after some packets are processed.
>>
>> Do you mean it stops even if you are *only* redirecting to a devmap, or
>> if you are first redirecting a few packets to AF_XDP, then to devmap?
>>
>> Also, which driver(s) are the physical NICs you're redirecting to/from
>> using, and which kernel version are you on?
>>
>> -Toke
>
>
>
> Currently, I'm trying to redirect packets only using devmap. But also
> have code for redirection using AF_XDP(only when a given condition is
> satisfied). A DPDK program is running in userspace which will receive
> packets from AF_XDP.

Right, so it's just devmap redirect that breaks. What do you mean
'redirection stops', exactly? How are you seeing this? Does xdp_monitor
(from samples/bpf) report any exceptions?

-Toke

