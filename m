Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B1A1F661A
	for <lists+xdp-newbies@lfdr.de>; Thu, 11 Jun 2020 13:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgFKLAO (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 11 Jun 2020 07:00:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49557 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726407AbgFKLAK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 11 Jun 2020 07:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591873209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tjEOiVvDYw9J9HrlxrdpORbRDHPi5Ga65mVy4ncGYq4=;
        b=Eu7k9NPX2SOVFfgsmvp3FRTc9Dw+p55689lh3AJ5A472Lpdowjo2TVtC3pv2KWTRlaohjh
        OAABAlIQLLu2N6CEIvEVeVLdJ6fdHDAheNiXswcoCCWpDKn8FqdZa0WlN6n5iIRXlpxPVu
        vL0C13pUrBMLJ3OTgQ+a1lyYHwxFAbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PwtJQ2BXMdKDxbDNFZE0DA-1; Thu, 11 Jun 2020 07:00:05 -0400
X-MC-Unique: PwtJQ2BXMdKDxbDNFZE0DA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF61805DC6;
        Thu, 11 Jun 2020 11:00:04 +0000 (UTC)
Received: from carbon (unknown [10.40.208.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0CCA1A92C;
        Thu, 11 Jun 2020 10:59:53 +0000 (UTC)
Date:   Thu, 11 Jun 2020 12:59:52 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Elerion <elerion1000@gmail.com>,
        "iovisor-dev@lists.iovisor.org" <iovisor-dev@lists.iovisor.org>
Cc:     brouer@redhat.com,
        Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Yonghong Song <ys114321@gmail.com>
Subject: Re: Error loading xdp program that worked with bpf_load
Message-ID: <20200611125952.3527dfdb@carbon>
In-Reply-To: <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com>
        <87imfy7hrx.fsf@toke.dk>
        <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
        <87a71a7gay.fsf@toke.dk>
        <CAMDScmnTYKfjMjiqLGduY4Pk3X0D7RQhjtY7DuPmh65VMNeCRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

(Cross-posting to iovisor-dev)

Seeking input from BPF-llvm developers. How come Clang/LLVM 10+ is
generating incompatible BTF-info in ELF file, and downgrading to LLVM-9
fixes the issue ?


On Wed, 10 Jun 2020 14:50:27 -0700 Elerion <elerion1000@gmail.com> wrote:

> Never mind, I fixed it by downgrading to Clang 9.
>=20
> It appears to be an issue with Clang/LLVM 10+
>=20
> https://github.com/cilium/ebpf/issues/43
>=20
> On Wed, Jun 10, 2020 at 2:38 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
> >
> > Elerion <elerion1000@gmail.com> writes:
> > =20
> > > [69] FUNC xdp_program type_id=3D68 vlen !=3D 0 =20
> >
> > 'vlen !=3D 0' is the error. Not sure why you hit that; what's the output
> > of 'bpftool btf dump file yourprog.o' ?
> >
> > -Toke
> > =20


--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

