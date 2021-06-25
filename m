Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C381D3B3A6C
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Jun 2021 03:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhFYBRl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Jun 2021 21:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFYBRl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Jun 2021 21:17:41 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84ADDC061574
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Jun 2021 18:15:20 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id p133so2173511yba.11
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Jun 2021 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EM+Pv5n0GEDcEzg7dEiz9t0cbUFzzI+H6iqWWS9gJqI=;
        b=bcuA/mxMPLmMgLEYSteDJJSl7YCV5liBqRiPY15AOAvWTKE6abM1JpkJWQ9D9reZ/l
         67x/f7pXHOgVKv4whVnSSr3RuA6lFy1mdVj7OZ4M93b89omp6lZlSG0oD3k36AvLdMBZ
         Oj5CRfiZolt7MECvRBZ9p8XSihkqDgAK29KBpgaYiLo4snSNQ3CNWGlYdqfckpD4zeHe
         2yLeOhiofT7IQTtTMiJGbQkKNYOJuNPB/bS1lYWWz9hcOuIb+3lVO0XU4X/7DM1yO9le
         aCYiNfi2f9/XT1p3QvUUAtmt8i5wfyWNIRK5o0upsb1vEOpkAD84nU1A1EChjllYvsM+
         sO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EM+Pv5n0GEDcEzg7dEiz9t0cbUFzzI+H6iqWWS9gJqI=;
        b=ZxbhJmjLw4USabjk4fD0TI3eoklUl5xECCKmylt9hqx2THtLw5X+zITRwmSQfrXgaT
         GczY4iFc5dFCKG5pFGE1YwWLeSy6rH5i/sSf2Ts0aswV39NiypQceTOM8MEP4XVhEX1x
         gRM3mbgAxMMqlwyf+Oc342JZnTmZEVDZppCDViq2C8X4ws3q+NiarTNBoSqUpnx9x3YQ
         rnp4VHBIFZaVnoNQxzBIhJWNbI4AN81qcKL664Mw5dY3Lcjkf8GRy+d7p1dYWj8ug4WZ
         c+zVPlBTKqJCHLKFD5aMaLrwczTH4W8AMWe7mtdrcAIqG0NcfOgPSaoKnSzbLhROcFhl
         MVKQ==
X-Gm-Message-State: AOAM53129pc6Qzmt7TdA0AnleET6wY7xRI43OHz8mEIwOQQvbUSDNId6
        MdSfURwPEUK0BdDFWXimyuRXrdmgReMieDCS57Y0kQFA6OUmsw==
X-Google-Smtp-Source: ABdhPJyhakVP9HInZjguNeoxA8sC2Zqi0qU35FmeGZ5YdZeoSyYARFQHxbX9oDy51hiN+S6Acs6tY1c6/cz0+7fYbLM=
X-Received: by 2002:a25:c045:: with SMTP id c66mr8985786ybf.296.1624583719727;
 Thu, 24 Jun 2021 18:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210622172216.79c6b3f2@babalu> <20210624170458.5bc55a54@babalu>
 <20210624221637.4353b844@carbon> <20210624174421.35864a09@babalu>
In-Reply-To: <20210624174421.35864a09@babalu>
From:   Y Song <ys114321@gmail.com>
Date:   Thu, 24 Jun 2021 18:14:43 -0700
Message-ID: <CAH3MdRU7NeP_fMB3wLmXBPN4cWz5mOppee0gfZdxWPtEx1V5nQ@mail.gmail.com>
Subject: Re: xdp_iphash_to_cpu_cmdline: Error loading BTF: Invalid argument(22)
To:     "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 24, 2021 at 1:45 PM Ethy H. Brito <ethy.brito@inexo.com.br> wrote:
>
> On Thu, 24 Jun 2021 22:16:37 +0200
> Jesper Dangaard Brouer <brouer@redhat.com> wrote:
>
> > On Thu, 24 Jun 2021 17:04:58 -0300
> > "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> >
> > > On Tue, 22 Jun 2021 17:22:16 -0300
> > > "Ethy"  wrote:
> > >
> > > > Hi
> > > >
> > > > Runing "# ./xdp_iphash_to_cpu --dev eth1 --all-cpus --wan" returns 2 loading errors:
> > > >
> > > > ----------------------8<----------------------------------
> > > > libbpf: Error loading BTF: Invalid argument(22)
> > > > libbpf: magic: 0xeb9f
> > > > version: 1
> > > > flags: 0x0
> > > > hdr_len: 24
> > > > type_off: 0
> > > > type_len: 492
> > > > str_off: 492
> > > > str_len: 1724
> > > > btf_total_size: 2240
> > > > [1] PTR (anon) type_id=2
> > > > [2] STRUCT xdp_md size=20 vlen=5
> > > >   data type_id=3 bits_offset=0
> > > >   data_end type_id=3 bits_offset=32
> > > >   data_meta type_id=3 bits_offset=64
> > > >   ingress_ifindex type_id=3 bits_offset=96
> > > >   rx_queue_index type_id=3 bits_offset=128
> > > > [3] TYPEDEF __u32 type_id=4
> > > > [4] INT unsigned int size=4 bits_offset=0 nr_bits=32 encoding=(none)
> > > > [5] FUNC_PROTO (anon) return=6 args=(1 ctx)
> > > > [6] INT int size=4 bits_offset=0 nr_bits=32 encoding=SIGNED
> > > > [7] FUNC xdp_program type_id=5 vlen != 0
> > > >
> > > > libbpf: Error loading ELF section .BTF: -22. Ignored and continue.
> >
> > NOTICE above: "Ignored and continue".
> >
> > Thus, this is not a real *error*, instead this is just a (very) verbose
> > *warning* that your system (kernel version? / compile options?) doesn't
> > support BTF correctly.  The BTF info is not really needed by
> > xdp-cpuma-tc, so you can safely ignore this "warning".

FYI, the error is due to
    [7] FUNC xdp_program type_id=5 vlen != 0
I guess you may have an old libbpf. The new libbpf should do
sanitization for this.
  https://lore.kernel.org/bpf/20200110064124.1760511-2-ast@kernel.org/

>
> Noticed!
>
> >
> >
> > > > TC workaround for mapname: map_ifindex_type map_fd:5
> > > > Added CPU:0 queue_size:192
> > > > Added CPU:1 queue_size:192
[...]
