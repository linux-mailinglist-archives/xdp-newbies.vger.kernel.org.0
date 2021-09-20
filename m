Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAF04127A2
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Sep 2021 23:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhITVDN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Sep 2021 17:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50244 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234562AbhITVBN (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Sep 2021 17:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632171586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TlKMSVUJt5xdeahqngnFrqG8FLUTgFt8pKbZzcXtGZ4=;
        b=MojVbce3QsCI5UwtT5CGWHw20MaBZqObguPkrpXfqu9XBoVWSlRkKZyC2II8MhOF6Cq9XX
        P4OLfygYRHuWUBaqHh9/2GLxxUsPRIXO0bvM/IFIqikasaKcBGNTXDAlOu/QH9T0X/GDm5
        NLbiKSpqUrXTFUJupPDlcP+1L8Yk/ls=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-rP8h9pXMO0u9Q5GZC-mkgw-1; Mon, 20 Sep 2021 16:59:43 -0400
X-MC-Unique: rP8h9pXMO0u9Q5GZC-mkgw-1
Received: by mail-ed1-f72.google.com with SMTP id ec14-20020a0564020d4e00b003cf5630c190so16995988edb.3
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Sep 2021 13:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=TlKMSVUJt5xdeahqngnFrqG8FLUTgFt8pKbZzcXtGZ4=;
        b=uQaXhmMlurumEraTqJzlVFgUYFA55qhIn0OO7HdK2xloRKfZM5PsZ2VzRNqWdnO7vy
         4PMNuTfbylcrcr4n2D29j0OKMhIGx3vpwOjST8rOX5iKwmmfkpIc8r4q5d1GFOmJskPt
         pK3YVYmy8InkCqCPtehYikYO22YK60UrUigZPpK2uBpA727lQvmr3G8yDAnnT2vXqGMe
         PIKxxqZmwKrMqOwaHnG2nbwRRRJ45XGrfyTT8GfvWj/kqQhWT8gYc7MIHr7nJRGWLhOo
         wFkBKpTaEX3y/aG7KEGoEYqjt5xyVulqnaoRs7hWakMT39tj1nYFF/fM1owA28i+z8wT
         i4ag==
X-Gm-Message-State: AOAM532aTYah0gyKIMMXWcWTldqfH6+a3+B0aiEYsn9Xba9jfewlKM1o
        aO9/IhIGD1GBLe8iTYEFcuCN3+LQFvU4+08/oXnukhZaN1hF4Lc1Tahow+5Nh4yfkq2NRQEOIw7
        72n6b6d923bPZ//d3/bNOFRg=
X-Received: by 2002:a50:d6d8:: with SMTP id l24mr31679068edj.297.1632171582328;
        Mon, 20 Sep 2021 13:59:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysGaGUI88mz7V2jXDxc219qIhCuJCkU5I7W+rRvTsaRmDvPxM1bYKC9Od2IYxCdmIhvC4P5g==
X-Received: by 2002:a50:d6d8:: with SMTP id l24mr31679048edj.297.1632171582036;
        Mon, 20 Sep 2021 13:59:42 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id p24sm2536553edq.27.2021.09.20.13.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:59:41 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C14D218034A; Mon, 20 Sep 2021 22:59:39 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Parsing TCP Header Options In XDP/BPF
In-Reply-To: <dc08f117-50e7-bbe3-44e7-f6adb95eb011@gflclan.com>
References: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
 <87h7ek6cb1.fsf@toke.dk>
 <dc08f117-50e7-bbe3-44e7-f6adb95eb011@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 20 Sep 2021 22:59:39 +0200
Message-ID: <87mto73qv8.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey and I apologize for the late reply!
>
>
> On 9/15/2021 11:19 PM, Rob Sherwood wrote:
>  > Definitely not an expert but no one has replied so I'll throw out my=20
> guess :-)
>  >
>  > Check out https://lwn.net/Articles/794934/ for more info on 'bounded=20
> loops', but my guess is that the verifier doesn't have enough context to=
=20
> verify your loop is really bounded.
>  >
>  > One trick might be to convert your while loop to a for(;;) loop,=20
> e.g., instead of :
>  >
>  >=20
> https://github.com/gamemann/XDP-TCP-Header-Options/blob/master/src/xdp_pr=
og.c#L81
>  > while ( optdata < 40) {... }
>  >
>  > you could try:
>  >
>  > for (optdata =3D 0; optdata < 40; optdata ++) { ... }
>  >
>  > I know from past attempts that just because it's obvious to humans=20
> that there's not an infinite loop, it's not always obvious to the verifie=
r.
>  >
>  > Hope that helps (and is correct!),
>  >
>  > - Rob
>  > .
>
> I did try a for loop before, but still ran into the same BPF verifier=20
> error :( I tried adding checks to prevent an infinite loop along with=20
> checks to make sure it doesn't go outside of ctx->data_end or below=20
> ctx->data, but no change. Thank you!
>
> On 9/16/2021 5:32 AM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>  > Christian Deacon <gamemann@gflclan.com> writes:
>  >
>  >> Hi everyone,
>  >>
>  >>
>  >> I wasn't sure whether to submit this under XDP's mailing list or BPF'=
s.
>  >> However, since it's an XDP program, I figured I'd start here. The iss=
ue
>  >> has to do with the BPF verifier, though.
>  >>
>  >>
>  >> I am trying to parse TCP header options within XDP/BPF. In my case, I
>  >> want to locate the 'timestamps' option and read/write to the sender a=
nd
>  >> receive timestamps (the option's data, which is eight bytes in total I
>  >> believe).
>  >
>  > We're doing just this in the 'pping' utility, see code here:
>  >=20
> https://github.com/xdp-project/bpf-examples/blob/master/pping/pping_kern.=
c#L83
>  >
>  > -Toke
>
> This code works great for me so far! Thank you!

Awesome! You're welcome :)

-Toke

