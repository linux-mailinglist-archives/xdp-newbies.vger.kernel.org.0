Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81773426BF5
	for <lists+xdp-newbies@lfdr.de>; Fri,  8 Oct 2021 15:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhJHNw6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 8 Oct 2021 09:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJHNw5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 8 Oct 2021 09:52:57 -0400
X-Greylist: delayed 145916 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 Oct 2021 06:51:01 PDT
Received: from telegrapho.inexo.com.br (unknown [IPv6:2001:12c4:f0da:5e:216:3eff:feff:56a4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58F55C061570
        for <xdp-newbies@vger.kernel.org>; Fri,  8 Oct 2021 06:51:01 -0700 (PDT)
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 1564E7ACE20B; Fri,  8 Oct 2021 10:50:56 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 1564E7ACE20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1633701056;
        bh=47YCM5o2y1AxpdDsHQry4MYEROjJgxvHrC4lFMxTde8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dn/PL9lJJJrNuJqqL2y5A+J9Y4lJrTakAs+I0Z9yyjvo0CAXVzPvc7hpPI4M1FoKy
         C6fWVmclz7ZLRuubKYxtShqr23wge2sjOI6eJ1vY3ocZ2iJa1kaZsdE6t5ahDuCFQA
         Pp3heTmlkx3DfXJ+LC0TF/3A/cu33RWYU+UVUjb+/lFcfGUjmbxhhQJTEnw9Ss+Xmm
         kMrLo/daTV5545T2PS0fBj8ZN5JEvhyYfoIL2izQRTv4V+13YTz56jrsicM6jARzeN
         9YN6iZ6qFUYRO/SE7E7Gl1eJ6ffGKd7FSKn+7wuTWSI0j2s1HuvSVZZTPMfg5v9mdl
         RhAlfkY3AMrpA==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.4
Received: from pulsar (unknown [187.17.38.38])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id CFE1A7ACE208;
        Fri,  8 Oct 2021 10:50:52 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br CFE1A7ACE208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1633701052;
        bh=47YCM5o2y1AxpdDsHQry4MYEROjJgxvHrC4lFMxTde8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i3D/unY/hmKXN/ozZtptzee1e9Jmq6GJ94WPiM58qlWUKeNfStnIVPFY45lwkuaec
         iYaKZUcT1FbgB1iBMIcuyN+N06GJ2GDAZW1mq8Gtbt65vElZGOE/k18SVY59fQlseR
         X64dHlBa8jdr+BH+OSe0V06JdBJD4m80cCvWo7uv9bAaYN2o87DNddpUGnAQXe7tXO
         yhhulnS5g+trHkrmQnhCqGT/N3VBRbt7upGCELp9Pf54GdxDZecRKzZzbtHpmw+SUm
         I3yXpHj7YmVIKyslkF0Kth8K2QMEfKu9mJ22BT6Ord23UwU3gTeC2VY7gQj88otAx8
         YlcDh7nwMIMbQ==
Date:   Fri, 8 Oct 2021 10:50:50 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org, Jesper Brouer <brouer@redhat.com>
Subject: Re: xdp-cpumap-tc multi queue schema and traffic mirroring
Message-ID: <20211008105050.5c70c225@pulsar>
In-Reply-To: <875yu8n4xp.fsf@toke.dk>
References: <20211006181848.20300152@pulsar>
        <875yu8n4xp.fsf@toke.dk>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 07 Oct 2021 19:02:58 +0200
Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:

> "Ethy H. Brito" <ethy.brito@inexo.com.br> writes:
>=20
> > Hi All
> >
> > Before I moved to XDP cpumap bandwidth control "philosophy" I used to s=
noop
> > inside the htb classes (mainly the default one) mirroring traffic to a
> > dummy interface then run tcpdump on that like:
> >
> > 	tc filter add dev eth0 parent 1: protocol all prio 0xffff \
> > 	u32 match u32 0 0 flowid 1:$shp action mirred egress mirror dev
> > dummy0
> >
> > Then "tcpdump -npi dummy0" used to show me all that classid "1:$shp" was
> > carrying.
> >
> > Now, with the multi queue environment XDP creates, I can't make mirrori=
ng
> > to work. For instance: I need to see what is going on with HTB classid
> > e:102, so I tried:=20
> > 	tc filter add dev eth0 parent e: ... e:102 action mirred egress ...
> >
> > and "tcpdump -npi dummy0" prints traffic that has nothing to do with
> > classid e:102. I can confirm the traffic is pored thru the class since =
its
> > bandwidth is controlled/limited correctly. =20


Hi Toke, et All.

>=20
> The xdp-cpumap-tc utility will attach a filter to the egress interface,
> presumably that is taking priority and short-circuit your mirred filter?

This makes sense.=20
But How to circumvent this??

Snooping the default class (classes, in xdp-cpumap case) is essencial to ca=
tch misconfigured mappings.

Regards

Ethy
