Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365711ECDFF
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jun 2020 13:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgFCLHL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jun 2020 07:07:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46968 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725855AbgFCLHL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Jun 2020 07:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591182429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=st5z5SH3vZfU9b/sKAZdJgMCb0+vkyjja7CySGa5Brs=;
        b=Eb4TJuVwc5CBy3tDUcUJ53PbHWowJbhxX3a9oIu4yPjaVlpWZ2Zf+zX1M7a3areEMLDpNr
        idWVktnX8jOGiU/K5mpvylG6oypWurqMGQSMnHLtjNXvWO6kFA/RdTlZ/VTJtKGh/MLmSR
        i9sc+lMHorkWk04UBVIkJrvMj+oVWcQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-elcbltxSN3i9eqY7dAXqNw-1; Wed, 03 Jun 2020 07:07:07 -0400
X-MC-Unique: elcbltxSN3i9eqY7dAXqNw-1
Received: by mail-ed1-f70.google.com with SMTP id x11so903216edj.21
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jun 2020 04:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=st5z5SH3vZfU9b/sKAZdJgMCb0+vkyjja7CySGa5Brs=;
        b=s3chtjzSbbabE3dC/SIfJJk8OSvUkvyvoYV1tNQXSzjfpTLo9fPeApvMz5dnLXuuww
         Rtif6f2YVfIRwDUWFDtsfKTs/o/XaYPJR+F2AJzm2xDIkBbv74JNlbzpnXcHmnSSWPbI
         +LB5CqVnOEe2fStHSLMRq2wPQEyAk5ZyCb4anepDFvfmzI1sxXfUWwEU/mi0Yq2hy46O
         bL9gJoVoFrv9ZwV8XDnjIKrIiLtSQEIvWVDc/mglpyooo1mkXB9PfsUWC2UvLPWBpiwj
         eZ+LJMzQo+w7d+qTY/VuG7IZZAPSG4yYvvxD5W1ndeWn8QIsqNzWx89RnNJOy+aQ9pgO
         w/5Q==
X-Gm-Message-State: AOAM531bHyQ1b+PipdERRJag1pSQlRqt8r5MqFyjUvjtSHGuin0CwTH2
        0QFFKpfry5iLaiDwMCvNXxxi9Puznc548o3d1bDX0l3HbU0WSAjGNRfmAalmjDT3dfnVnv+t03P
        dKFRVZ9quwAkjsBS1nBJPQHU=
X-Received: by 2002:a17:906:fb9b:: with SMTP id lr27mr1843991ejb.405.1591182426831;
        Wed, 03 Jun 2020 04:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyadOWWsTcfXcFmTbFUTv+1uqajf7lc3eZafWDXjpgEjMRB45YHtdC6lQg5TTEJbuoIDSlwtQ==
X-Received: by 2002:a17:906:fb9b:: with SMTP id lr27mr1843975ejb.405.1591182426625;
        Wed, 03 Jun 2020 04:07:06 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id l27sm909446eja.118.2020.06.03.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:07:05 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 4E9D5182797; Wed,  3 Jun 2020 13:07:05 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     maharishi bhargava <bhargavamaharishi@gmail.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <20200603104833.GA14391@ranger.igk.intel.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com> <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com> <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com> <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Jun 2020 13:07:05 +0200
Message-ID: <87ftbcl86e.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=82=C2=B8i=
land-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
>> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>>=20
>> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8iland-J=
=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
>> >>
>> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >>
>> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8iland-J=C3=
=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
>> >> >>
>> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >> >>
>> >> >> > Hi, in my XDP program, I want to redirect some packets using AF_=
XDP
>> >> >> > and redirect other packets directly from driver space.
>> >> >> > Redirection through AF_XDP works fine, but redirection through d=
ev map
>> >> >> > stops after some packets are processed.
>> >> >>
>> >> >> Do you mean it stops even if you are *only* redirecting to a devma=
p, or
>> >> >> if you are first redirecting a few packets to AF_XDP, then to devm=
ap?
>> >> >>
>> >> >> Also, which driver(s) are the physical NICs you're redirecting to/=
from
>> >> >> using, and which kernel version are you on?
>> >> >>
>> >> >> -Toke
>> >> >
>> >> >
>> >> >
>> >> > Currently, I'm trying to redirect packets only using devmap. But al=
so
>> >> > have code for redirection using AF_XDP(only when a given condition =
is
>> >> > satisfied). A DPDK program is running in userspace which will recei=
ve
>> >> > packets from AF_XDP.
>> >>
>> >> Right, so it's just devmap redirect that breaks. What do you mean
>> >> 'redirection stops', exactly? How are you seeing this? Does xdp_monit=
or
>> >> (from samples/bpf) report any exceptions?
>> >>
>> >> -Toke
>> >>
>> > So, In my setup, there are three systems, Let's Assume A, B, C. System
>> > B is acting as a forwarder between A and C. So I can see the number of
>> > packets received at system C. To be specific, only 1024 packets are
>> > received. If I remove the xsks_map part from the code and don't run
>> > DPDK in userspace. This problem does not occur. Also if I forward all
>> > the packets using AF_XDP, there is no such issue.
>>=20
>> I thought you said you were seeing the problem when only redirecting to
>> a devmap? So why does the xsk_map code impact this? I think you may have
>> to share some code...
>
> Isn't the case here that either xsk_map or dev_map consumes the frame and
> therefore the latter doesn't see it? so cloning might be needed here?

Yeah, certainly you can't redirect *the same packet* to both xsk_map and
devmap - but that wasn't what I understood was the use case here?

-Toke

