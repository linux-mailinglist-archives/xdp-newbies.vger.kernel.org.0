Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCD33283D3
	for <lists+xdp-newbies@lfdr.de>; Mon,  1 Mar 2021 17:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhCAQZO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 1 Mar 2021 11:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20299 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237562AbhCAQWU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 1 Mar 2021 11:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614615653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YM3yCG6aMG+Odvwo3hKtOettGzC4VJAxt6PYEdka1JQ=;
        b=XX3Uh1Da+XWyOWlUBou0+nbLybxatJyblLe0YSWemwGm4qsjXr23OYBR2iQ02d0JtWA2A/
        zJBq2vLO0zrVkQnw1+L2lNQBsLVpfU4e25PkasXQi+Xt8t7rpGc3eUDbzj3Ev31TLjA1+D
        jOs468NrPW2+ehUSeOk2Kyo0QZhJEAQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-MAr_yMTwPCq3Ffkpk3B__A-1; Mon, 01 Mar 2021 11:20:43 -0500
X-MC-Unique: MAr_yMTwPCq3Ffkpk3B__A-1
Received: by mail-ej1-f69.google.com with SMTP id 11so316285ejz.20
        for <xdp-newbies@vger.kernel.org>; Mon, 01 Mar 2021 08:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=YM3yCG6aMG+Odvwo3hKtOettGzC4VJAxt6PYEdka1JQ=;
        b=nqdtuO0RIkZfCqev0hrr0+g9iYdL0lB8oN5iB69S5VwtOgJR+TL7wVH6jRRHIuFHm6
         AQF2PlniFdzmL5jrIjIZSVM1JGZRhiwie1kuu93mie3pMe8DjJK+cZ7KwDxyqHnobeOE
         dJ3BbiuIEvb/eFJvgCoWVGs1/vppAR5ErXNRGPGiHdTOa77pWCraSKfN9EMGBVozhUCB
         WUsiHDCSFC57VW8KmGSvR9svopzxtq20uQHVslJ9lEKCEgKXDc4e/cuhTycgLseXaaMb
         cFDeWM/iwdOeHMXVYvVqWWQbQlNkGFdxXaNdOrl2H34iNWeOLsfIsRmQWfBCCHUtRVE3
         iBRg==
X-Gm-Message-State: AOAM533KHpavNp6raC6H2rxHpxXHMa/EGoAvPNdhmeM5R5w9HZM6rra2
        c8Oue6vdhYrnZN3KhV6QiRnxTUV+hHKIPojGjet1dpx8bnlzlFqiQJuML3kXZROy4pF8dIBtQin
        O7UbDFBR4Yb+9OxNevd/v/SU=
X-Received: by 2002:a50:fd90:: with SMTP id o16mr17066581edt.292.1614615642268;
        Mon, 01 Mar 2021 08:20:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwavAh+0Rvhv9AAVRTL7eicIaGmxpHDUtZ4TN++zTH7/IzdEoPCJpooVL+U7x58qaBRtaBCkg==
X-Received: by 2002:a50:fd90:: with SMTP id o16mr17066555edt.292.1614615641935;
        Mon, 01 Mar 2021 08:20:41 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id q18sm12514058eji.100.2021.03.01.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 08:20:41 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D6D8C1800F1; Mon,  1 Mar 2021 17:20:40 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Radu Stoenescu <radu.stoe@gmail.com>,
        Simon Horman <simon.horman@netronome.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Redirect from NIC to TAP
In-Reply-To: <CAM-scZPjB4QFTNPfbzD0DNmrfKMKUPMnnH+gSRFRk6jH4_WswA@mail.gmail.com>
References: <CAM-scZPPeu44FeCPGO=Qz=03CrhhfB1GdJ8FNEpPqP_G27c6mQ@mail.gmail.com>
 <20210209102118.476f507d@carbon>
 <CAM-scZNLN5cgJBEdVFSSrLJi3zW-5THzbY=diESdKiiisCT9MQ@mail.gmail.com>
 <20210209094137.GA14290@ranger.igk.intel.com>
 <20210218101239.GA7062@netronome.com>
 <CAM-scZPjB4QFTNPfbzD0DNmrfKMKUPMnnH+gSRFRk6jH4_WswA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 01 Mar 2021 17:20:40 +0100
Message-ID: <87eegyx2uf.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Radu Stoenescu <radu.stoe@gmail.com> writes:

> Thanks a lot for the info.
>
> In retrospect, was there a way I could reach this conclusion myself
> (no driver support)? I'm asking this since I'm relatively new to the
> environment and we run various NICs from various vendors, and I would
> like to know how to perform the "due diligence" myself before reaching
> out?

Grepping the source code is one. The xdp_monitor tool from samples/bpf
might have provided a hint as well, but only that something was wrong,
not the cause.

This is a long-standing issue, and there's been some discussion around
it, but let's just say that no consensus has emerged yet :/

-Toke

