Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F6F31EA0C
	for <lists+xdp-newbies@lfdr.de>; Thu, 18 Feb 2021 13:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBRMvD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 18 Feb 2021 07:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbhBRKRT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 18 Feb 2021 05:17:19 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682BFC061793;
        Thu, 18 Feb 2021 02:16:39 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c1so993386qtc.1;
        Thu, 18 Feb 2021 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2HiCruRN9Pgq0gqCN/tSAqWLIGJxcDpmovRVeDmHiW0=;
        b=PL1sFj2SIJD3/csd4zK7GN48tQ2Qn5xedd8D8or8JAoWxccoFBj4DOirJd0Yp8zxGR
         UCsu5eA8RTsP37bFtCFmC5d86upMYgGXQUUOQYPB7dvQ6K0BVJLW3JzJB3tQB8vuuvmO
         I7QBJhcXBVsc6+NqjZN7U5zCG2gSOoqUYWPtaRVcFNQzZVYBk5U154lb0L+DyFJ+G+Wq
         Gg30Nquzs6M9nvAbM2f3QOEqKmIuqj4UrJ7jxQHDaO9YX5jT6wT3OWWY1gz2GGiHX6+6
         HOEgAqWzjVIHR7RWdr9HSflwvdaY0XTDhKIHG/UFBQR4QAFh4LczjvqDR35GJSxpFucR
         Iz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2HiCruRN9Pgq0gqCN/tSAqWLIGJxcDpmovRVeDmHiW0=;
        b=MdwnVDN3taJvS3lev4Lmc+2oyx0F12LUKea179n0nCAPRe1STeyityBdmDWzNZKKM7
         rduo1dlv0M9opKS316e8Aowmnt9JIQ9B/m1cAJD2N2/+DKcdGV8eeUBsBcFi5iZ9iQeI
         5g2AsAJyTK87vNpWY/vswWHbofmrTi+Nllq0BypVtoNM6XgZMqoojEfZTdfABo6ZPZbx
         LQXbPtRLqUJ2dwgpvtUNG/BRSfgTyozZiF5Gb/SxrFk5fKZgk5RHFhatBPctlyb72nE1
         ApGl7JsNz5aP34Lr6ischkRAO5QDhdBKPvWSP3th2ce1q4GG0++kHSeyZBvhBmNHw9RG
         CDNQ==
X-Gm-Message-State: AOAM532rq74PN0aQ1Y8PyWXnB3UqPL4RdNsb0KbysL0UOgvp/h6qzyRq
        HU+sjUJc7QQFpiTbOohA5W8=
X-Google-Smtp-Source: ABdhPJyHASRk2KdOR1HGAj1WFn/3gD2Eg1+o/bKGW8gv0UZ7Nspn9/6sKwAjrjqwFEAbRXNSaK1FoQ==
X-Received: by 2002:ac8:5783:: with SMTP id v3mr3371694qta.133.1613643398694;
        Thu, 18 Feb 2021 02:16:38 -0800 (PST)
Received: from localhost ([216.207.42.140])
        by smtp.gmail.com with ESMTPSA id i5sm3055010qtw.3.2021.02.18.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 02:16:38 -0800 (PST)
Date:   Thu, 18 Feb 2021 03:16:34 -0700
From:   "Brian G. Merrell" <brian.g.merrell@gmail.com>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Lorenz Bauer <lmb@cloudflare.com>,
        Andrey Ignatov <rdna@fb.com>, bpf@vger.kernel.org
Subject: Re: How to orchestrate multiple XDP programs
Message-ID: <20210218101634.qn4lq2zvdwafpyvv@snout.localdomain>
References: <20201201091203.ouqtpdmvvl2m2pga@snout.localdomain>
 <878sah3f0n.fsf@toke.dk>
 <20201216072920.hh42kxb5voom4aau@snout.localdomain>
 <873605din6.fsf@toke.dk>
 <87tur0x874.fsf@toke.dk>
 <20210210222710.7xl56xffdohvsko4@snout.localdomain>
 <874kiirgx3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874kiirgx3.fsf@toke.dk>
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 21/02/11 12:18PM, Toke Høiland-Jørgensen wrote:
> "Brian G. Merrell" <brian.g.merrell@gmail.com> writes:
> 
> > On 21/01/29 01:02PM, Toke Høiland-Jørgensen wrote:
> >> Hi Brian
> >> 
> >> I've posted a first draft of this protocol description here:
> >> https://github.com/xdp-project/xdp-tools/blob/master/lib/libxdp/protocol.org
> >> 
> >> Please take a look and let me know what you think. And do feel free to
> >> point out any places that are unclear, as I said this is a first draft,
> >> and I'm expecting it to evolve as I get feedback from you and others :)
> >> 
> >> -Toke
> >> 
> >
> > Thanks so much for doing this Toke. There's a lot of great information.
> > I did one read-through, and didn't notice any surprises compared to the
> > code that I've read so far.
> 
> Awesome! :)

A question for anyone (sorry if it's a silly one)...

I did a second read-through of the protocol this evening. I wanted to
take a deeper look at the function calls that are referenced. Some of
them are BPF syscalls, which should be relatively straightforward to
interface with from Go. However, some functions like
bpf_get_link_xdp_info() appear to reside deep in the bowels of libbpf.
I'd really like to avoid needing cgo bindings, so my question is if
there some way to 1) interface with these functions that I'm just not
seeing, or 2) achieve what's necessary for implementing libxdp by only
utilizing syscalls.

I'm definitely open to insight from anyone with experience in this area.

Thanks,
Brian
