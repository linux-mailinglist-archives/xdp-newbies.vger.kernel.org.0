Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5015A4439C5
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Nov 2021 00:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhKBXgT (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 2 Nov 2021 19:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230502AbhKBXgM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 2 Nov 2021 19:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635896016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U9pkUjjAUJIJawg1eSHiJ5WmpNvm12cnURURHx+dwl8=;
        b=Tdomcy1yXqcxj1JMb9XFvpeqQaozu/ws4jSaU/6OBRfJmaKGTotSzzF4IR5wz4x0L2/dm9
        8Hj+ogfgzFmmU33W3TLYLf5uaVp3rN2ICo6M0Nhjk3Z1H73NLqa7TPqFegJ2tPSA7120ob
        dF587Sc3j4V4Z+OFGp77mM4VSaBXL+E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-8ugkzwWvNKePIfabixA-iA-1; Tue, 02 Nov 2021 19:33:35 -0400
X-MC-Unique: 8ugkzwWvNKePIfabixA-iA-1
Received: by mail-ed1-f71.google.com with SMTP id o22-20020a056402439600b003dd4f228451so837628edc.16
        for <xdp-newbies@vger.kernel.org>; Tue, 02 Nov 2021 16:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=U9pkUjjAUJIJawg1eSHiJ5WmpNvm12cnURURHx+dwl8=;
        b=LsHxx2ygpffoQK3BdnEGMole51jkYaBlmaXbs3KoNjCvq6DSd+HdF3/UFgHZp25HkZ
         p7CBjOqKvQhIURScN/oBl3BnG9AL2KPP0JU0lwgdZJ48A7OMs2RAtLeS7Z0ypEKAUaKg
         pW0k7RaASAO9TDB7FC2fTn4NVQ+lTh04Fvd7JzLQv947X19BNKXON38aEdHwymU+4p42
         9IHX+qP483/lGsjkNIUbtFYTlTMjCmk9lDjbHWq9gtnYtByy8MK2XNWNQ5rMo25l2t3U
         JtbCWr+B0k3NCFmLx7Cx8nf8dmmMBT4EltTUpzm2/uzvxEe3Mze2GSyjYL9PTPmlRjis
         WjWg==
X-Gm-Message-State: AOAM533DXnICWUJ/83jAe6jlLom9wEjtkji6V6LyjDsa43h1Ly9aeo1Z
        vhUvgLT5GGr4xZGuYyXp1dy7X6Dst41NYOHEMj1YWSgKXrx0fla9BohHw3VSDg0bb+v4776IqeX
        hx2xuUz+yl+EpOz5ecv/P2Js=
X-Received: by 2002:a05:6402:4315:: with SMTP id m21mr22370831edc.54.1635896013847;
        Tue, 02 Nov 2021 16:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6PjLt2ujdCEYTVpLHP+c6/EzbmuKrZ3y+MBKpOx7dO3QByvwEN78pIM2SFR9d5mgl3tcNLw==
X-Received: by 2002:a05:6402:4315:: with SMTP id m21mr22370790edc.54.1635896013471;
        Tue, 02 Nov 2021 16:33:33 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id v13sm167996ejq.93.2021.11.02.16.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 16:33:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 3DAF8180248; Wed,  3 Nov 2021 00:33:32 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: RPM for the kernel samples?
In-Reply-To: <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
References: <875ca290-95ad-c5ed-bc4d-550a35f9bd12@intel.com>
 <87lf265ilu.fsf@toke.dk> <0d83bd43-36d8-c038-af5f-f10fe0de523a@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Nov 2021 00:33:32 +0100
Message-ID: <87ilxa5e0j.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Jesse Brandeburg <jesse.brandeburg@intel.com> writes:

> On 11/2/2021 2:54 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Jesse Brandeburg <jesse.brandeburg@intel.com> writes:
>>=20
>>> Hi there, does anyone here know if the samples/bpf directory from the
>>> kernel is built as a part of an RPM from fedora or RHEL/Centos?
>>=20
>> It's certainly possible to build it from the existing kernel .spec file:
>>=20
>> https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_10=
46
>>=20
>> I know we have this available as an internal package for RHEL, but I
>> don't think we ship it anywhere. And it seems like the flag is turned
>> off for Fedora as well.
>>=20
>> What do you need it for? Opening an issue asking for it to be built for
>> Fedora might be a good start; feel free to Cc me on that as well :)
>
> Hi Toke! thanks!
>
> I'm tired of fighting tooth and nail to get the samples compiled on my=20
> own system whenever I need them. I'd much rather there just be an=20
> already made set of executables.

Right, makes sense. FYI we were discussing moving (some of?) the XDP
samples to xdp-tools[0].

> We use them for testing our driver's functionality for XDP, among
> other things.

I don't suppose you have anyone interested in working on an actual XDP
test suite of some kind, would you? Like a set of "compliance tests"
that lives in-tree and that any driver author can run to test their
driver's XDP implementation?

> I'll file a bugzilla.

Great!

-Toke

[0] https://lore.kernel.org/r/CAJ8uoz1GP4M71E-PNScndfeTbcCG2OUg+wcoO4ZaJF5U=
TBiXCQ@mail.gmail.com=20

