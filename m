Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9A03B3FAA
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Jun 2021 10:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFYIqY (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 25 Jun 2021 04:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229839AbhFYIqY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 25 Jun 2021 04:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624610643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q14OYOMIoJsCR0BNz2rImS9MB0+sQaHp9RpJDnLQb2I=;
        b=V0NBM05V09fULry8DwFdJkwShcvVO8LJQ8ckY6FYVK+yAq3a3n2pTJw4XEHiFzfA2qq6ZI
        /irtSYTmRNshqwspQy1q+MsYzuvlOBOihtP9bmnYSDFNVXrXQx0S6aJHa2WKfwsTzEccqz
        4GPPodHZZCl2bjybnS/MrES3aAhHpUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ehiVfc43Nm6Faa-4jgLANQ-1; Fri, 25 Jun 2021 04:44:01 -0400
X-MC-Unique: ehiVfc43Nm6Faa-4jgLANQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 418631018720;
        Fri, 25 Jun 2021 08:44:00 +0000 (UTC)
Received: from carbon (unknown [10.36.110.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 58EEB1037E80;
        Fri, 25 Jun 2021 08:43:55 +0000 (UTC)
Date:   Fri, 25 Jun 2021 10:43:54 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Y Song <ys114321@gmail.com>
Cc:     "Ethy H. Brito" <ethy.brito@inexo.com.br>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        brouer@redhat.com
Subject: Re: xdp_iphash_to_cpu_cmdline: Error loading BTF: Invalid
 argument(22)
Message-ID: <20210625104354.1f85db25@carbon>
In-Reply-To: <CAH3MdRU7NeP_fMB3wLmXBPN4cWz5mOppee0gfZdxWPtEx1V5nQ@mail.gmail.com>
References: <20210622172216.79c6b3f2@babalu>
        <20210624170458.5bc55a54@babalu>
        <20210624221637.4353b844@carbon>
        <20210624174421.35864a09@babalu>
        <CAH3MdRU7NeP_fMB3wLmXBPN4cWz5mOppee0gfZdxWPtEx1V5nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, 24 Jun 2021 18:14:43 -0700
Y Song <ys114321@gmail.com> wrote:

> On Thu, Jun 24, 2021 at 1:45 PM Ethy H. Brito <ethy.brito@inexo.com.br> wrote:
> >
> > On Thu, 24 Jun 2021 22:16:37 +0200
> > Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> >  
> > > On Thu, 24 Jun 2021 17:04:58 -0300
> > > "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> > >  
> > > > On Tue, 22 Jun 2021 17:22:16 -0300
> > > > "Ethy"  wrote:
> > > >  
> > > > > Hi
> > > > >
> > > > > Runing "# ./xdp_iphash_to_cpu --dev eth1 --all-cpus --wan" returns 2 loading errors:
> > > > >
> > > > > ----------------------8<----------------------------------
> > > > > libbpf: Error loading BTF: Invalid argument(22)
> > > > > libbpf: magic: 0xeb9f
> > > > > version: 1
> > > > > flags: 0x0
> > > > > hdr_len: 24
> > > > > type_off: 0
> > > > > type_len: 492
> > > > > str_off: 492
> > > > > str_len: 1724
> > > > > btf_total_size: 2240
> > > > > [1] PTR (anon) type_id=2
> > > > > [2] STRUCT xdp_md size=20 vlen=5
> > > > >   data type_id=3 bits_offset=0
> > > > >   data_end type_id=3 bits_offset=32
> > > > >   data_meta type_id=3 bits_offset=64
> > > > >   ingress_ifindex type_id=3 bits_offset=96
> > > > >   rx_queue_index type_id=3 bits_offset=128
> > > > > [3] TYPEDEF __u32 type_id=4
> > > > > [4] INT unsigned int size=4 bits_offset=0 nr_bits=32 encoding=(none)
> > > > > [5] FUNC_PROTO (anon) return=6 args=(1 ctx)
> > > > > [6] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> > > > > [7] FUNC xdp_program type_id=5 vlen != 0
> > > > >
> > > > > libbpf: Error loading ELF section .BTF: -22. Ignored and continue.  
> > >
> > > NOTICE above: "Ignored and continue".
> > >
> > > Thus, this is not a real *error*, instead this is just a (very) verbose
> > > *warning* that your system (kernel version? / compile options?) doesn't
> > > support BTF correctly.  The BTF info is not really needed by
> > > xdp-cpuma-tc, so you can safely ignore this "warning".  
> 
> FYI, the error is due to
>     [7] FUNC xdp_program type_id=5 vlen != 0
> I guess you may have an old libbpf. The new libbpf should do
> sanitization for this.
>   https://lore.kernel.org/bpf/20200110064124.1760511-2-ast@kernel.org/

Ah, thanks for pointing that out!  Guess it is my fault, that I've not
kept git-submodule for libbpf up-to-date in this git-repo.

With the recent interest for xdp-cpumap-tc[1], I will try find some
time to update libbpf and also fix other practical issues that have
been reported to me.

[1] https://github.com/xdp-project/xdp-cpumap-tc
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

