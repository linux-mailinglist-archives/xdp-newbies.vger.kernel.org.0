Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6541C1ECDCD
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jun 2020 12:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgFCKtc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jun 2020 06:49:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24497 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725882AbgFCKtb (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Jun 2020 06:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591181370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hkfj11tleHi0GtIeZ+kl2jEsqHTFpMO4PAfsMxk8LVI=;
        b=LKXf0BvtNNuZ0R0/IQ3MLNrmBRzKc4L1uPyNFVrfjbRWkAfvs/N9g4iv++W3zrCmCD/c5T
        lkj9++bDUYe81E6jNWyQK2s1eOC9KNzsT6QQ6ewv33UJw8sSWoBZa78Yr+Bgm3KgdviYqH
        tm+dzMtO9Vnr5mjYjgRm6C+GkHF3Cn8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-8Qs76Av-OEicaIA0a3H4pw-1; Wed, 03 Jun 2020 06:49:28 -0400
X-MC-Unique: 8Qs76Av-OEicaIA0a3H4pw-1
Received: by mail-ed1-f70.google.com with SMTP id s14so892804edr.7
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jun 2020 03:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=hkfj11tleHi0GtIeZ+kl2jEsqHTFpMO4PAfsMxk8LVI=;
        b=LkCbY6wVjmh1FhUuu4Uy2qme+WWpTspS0+tPhdswACzu+3QTD7+/54tt6b1eYaAw2o
         Oc/BSBU2+njL7zsEKERE9q144ddav1l+HABUThwcS73pxHfFAds0CZxIoCpcVE5nTJEe
         0iDWO8w9LBjvwkdfSUc4G3Br8JvUHvjm1QRLiTLVxZBUMTVtIYIxRWtVTI99JQBrKHd+
         jTXILYBY83XMsu1xtz7EWWeFzr11T+5sV8ebNTe37+Sj/qeLfgc1vrRkPDBXTjcCPPE1
         FaUCrro+A6jBx6PFHllLkaWZ3wd1JN57vrHDpkgpvyg35pHyUAtHJwISAREhH9cnC7uI
         yryw==
X-Gm-Message-State: AOAM533pdhMQcoeM+oG7rP3KuBKXT2vJEaFRAjE13yZ+j4u6dytRrlqO
        XJx3i10Yzcx6+ImK2+G/pvIXDatMU0X1l/d0A0SeTgh15wnZ+JAvFrY5R+Fz7Fb0MrbBvZcVtT1
        Y4bwfUP8libF4q5UfBiowGTk=
X-Received: by 2002:a50:cc85:: with SMTP id q5mr26831918edi.62.1591181367350;
        Wed, 03 Jun 2020 03:49:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye4yz0JjOkrasNxqMMkbyg/qhikHg1QyHUlUljZCc1hyFf8K9W/3mfJYYeMMQK8nYF/55IgA==
X-Received: by 2002:a50:cc85:: with SMTP id q5mr26831904edi.62.1591181367118;
        Wed, 03 Jun 2020 03:49:27 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a13sm914048eju.59.2020.06.03.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 03:49:26 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E0C64182797; Wed,  3 Jun 2020 12:49:25 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     maharishi bhargava <bhargavamaharishi@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com> <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com> <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Jun 2020 12:49:25 +0200
Message-ID: <87lfl4l8zu.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

maharishi bhargava <bhargavamaharishi@gmail.com> writes:

> On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
>>
>> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>>
>> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=B8iland-J=C3=B8rgensen, <toke@redh=
at.com> wrote:
>> >>
>> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >>
>> >> > Hi, in my XDP program, I want to redirect some packets using AF_XDP
>> >> > and redirect other packets directly from driver space.
>> >> > Redirection through AF_XDP works fine, but redirection through dev =
map
>> >> > stops after some packets are processed.
>> >>
>> >> Do you mean it stops even if you are *only* redirecting to a devmap, =
or
>> >> if you are first redirecting a few packets to AF_XDP, then to devmap?
>> >>
>> >> Also, which driver(s) are the physical NICs you're redirecting to/from
>> >> using, and which kernel version are you on?
>> >>
>> >> -Toke
>> >
>> >
>> >
>> > Currently, I'm trying to redirect packets only using devmap. But also
>> > have code for redirection using AF_XDP(only when a given condition is
>> > satisfied). A DPDK program is running in userspace which will receive
>> > packets from AF_XDP.
>>
>> Right, so it's just devmap redirect that breaks. What do you mean
>> 'redirection stops', exactly? How are you seeing this? Does xdp_monitor
>> (from samples/bpf) report any exceptions?
>>
>> -Toke
>>
> So, In my setup, there are three systems, Let's Assume A, B, C. System
> B is acting as a forwarder between A and C. So I can see the number of
> packets received at system C. To be specific, only 1024 packets are
> received. If I remove the xsks_map part from the code and don't run
> DPDK in userspace. This problem does not occur. Also if I forward all
> the packets using AF_XDP, there is no such issue.

I thought you said you were seeing the problem when only redirecting to
a devmap? So why does the xsk_map code impact this? I think you may have
to share some code...

Also, what does xdp_monitor say?

-Toke

