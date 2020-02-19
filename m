Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159F9165265
	for <lists+xdp-newbies@lfdr.de>; Wed, 19 Feb 2020 23:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBSWUx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 19 Feb 2020 17:20:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36646 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSWUx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 19 Feb 2020 17:20:53 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so2087838ljg.3;
        Wed, 19 Feb 2020 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IxkCTvIXZE+mPSrvY5wypnYY7iG30RFCkWRVq1nI3Gs=;
        b=de04jhU9AYfcCCYURZZEJ9/ikkL6Fv0CUNTRxTAtj8Ln1ArMoedOcGNNB1qNoPB16k
         pMPVcJhZ4moOx5S4a06vfircos2DmJjNfISBFB8CesIr6NwKTDP4fQRBFVtnBIOe0ey9
         LycElozwM221Ej7k+a2/ImKGwCAv58++v1HdjoLHWV3ix3cwPgokHP2FvBgcZF0Khj1O
         TMAF8eUcz+BjS/DR67VfjvcfDZrSw166pZxZuPY3GOpdGcpow85pQmAjSfvFxU63iuBm
         Cv+c2MQ7waFWQzezxsXxm4dWhX/6Iwpu3zkoTrG7IMup0PmOHTF4MKgWJLWg6P0pE3rs
         TuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IxkCTvIXZE+mPSrvY5wypnYY7iG30RFCkWRVq1nI3Gs=;
        b=pp+dDT1i6Q5s5XYDA8nvaXB8WeZZRRzWK8o5haqChtTUL9LTbp0Kp2pGnRu3yFVOoa
         npWv+wXCXTPY1zRI+jmmUiKhIDtBGbXbMawnB6c7GtoccvuFU9wMz//yjjHWoBJoZTrc
         Gf7C+bO0hau9QcSkv9/8qA8TSgC0YQovUJ6sMthZDlCWWz73o3bdSEVUi3glSGzLV5Wk
         zOyjrJYukeGoM7B3unyJubCz0sXCvEh6alX17eXrPdVmBnSyCeFblkkB3YQOiWLAMS0P
         EJA9QukYgLk0h3Hl8MxLVZ29dvG4JDUL6vK67XALpkej7J9t39xu1UDwhWLvJgGHNN8y
         ZnwQ==
X-Gm-Message-State: APjAAAWgZU5hhfoIAHt4cPvRyXcwqUZ3fB1wtqYpPaQ8GbJEaFVaFHbu
        zg3RKrYXDcMTHaSAJN1HEAr4A12PlIQ7FsI2r+Vav7lc
X-Google-Smtp-Source: APXvYqy8ZewYR74RaIcgZFFtZ3C3anwl7OvgOCnTxEHB7BmrGT4dAUom9vglMqYEuiYeP9pIQ74bwT1MM1CCONkfDCY=
X-Received: by 2002:a2e:b007:: with SMTP id y7mr16321934ljk.215.1582150850846;
 Wed, 19 Feb 2020 14:20:50 -0800 (PST)
MIME-Version: 1.0
References: <F844EC8A-902B-4BF7-95E3-B0D6DC618F1B@redhat.com>
 <20200219203626.ozkdoyhyexwxwbbt@ast-mbp> <87o8tuw7gj.fsf@toke.dk>
In-Reply-To: <87o8tuw7gj.fsf@toke.dk>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Wed, 19 Feb 2020 14:20:39 -0800
Message-ID: <CAADnVQJzbAu3tdqn1DbyK+VFwYjp5rpgJOpPFLEcoe_mEr3YEw@mail.gmail.com>
Subject: Re: Capture xdp packets in an fentry BPF hook
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Eelco Chaudron <echaudro@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Feb 19, 2020 at 2:14 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:
>
> > On Wed, Feb 19, 2020 at 03:38:40PM +0100, Eelco Chaudron wrote:
> >> Hi Alexei at al.,
> >>
> >> I'm getting closer to finally have an xdpdump tool that uses the bpf
> >> fentry/fexit tracepoints, but I ran into a final hurdle...
> >>
> >> To stuff the packet into a perf ring I'll need to use the
> >> bpf_perf_event_output(), but unfortunately, this is a program of trace=
 type,
> >> and not XDP so the packet data is not added automatically :(
> >>
> >> Secondly even trying to pass the actual packet data as a reference to
> >> bpf_perf_event_output() will not work as the verifier wants the data t=
o be
> >> on the fp.
> >>
> >> Even worse, the trace program gets the XDP info not thought the ctx, b=
ut
> >> trough the fentry/fexit input value, i.e.:
> >>
> >>      SEC("fentry/func")
> >>      int BPF_PROG(trace_on_entry, struct xdp_buff *xdp)...
> >>
> >>      struct net_device {
> >>          int ifindex;
> >>      } __attribute__((preserve_access_index));
> >>
> >>      struct xdp_rxq_info {
> >>          struct net_device *dev;
> >>          __u32 queue_index;
> >>      } __attribute__((preserve_access_index));
> >>
> >>      struct xdp_buff {
> >>          void *data;
> >>          void *data_end;
> >>          void *data_meta;
> >>          void *data_hard_start;
> >>          unsigned long handle;
> >>          struct xdp_rxq_info *rxq;
> >>      } __attribute__((preserve_access_index));
> >>
> >> Hence even trying to copy in bytes to a local buffer is not allowed by=
 the
> >> verifier, i.e. __u8 *data =3D (u8 *)(long)xdp->data;
> >>
> >> Can you let me know how you envisioned a BPF entry hook to capture pac=
kets
> >> from XDP. Am I missing something, or is there something missing from t=
he
> >> infrastructure?
> >
> > Tracing of XDP is missing a helper similar to bpf_skb_output() for skb.
> > Its first arg will be 'struct xdp_buff *' and .arg1_type =3D ARG_PTR_TO=
_BTF_ID
> > then it will work similar to bpf_skb_output() in progs/kfree_skb.c.
>
> What about freplace? Since that is also using the tracing
> infrastructure, will the replacing program also be considered a tracing
> program by the verifier? Or is it possible to load a program with an XDP
> type, but still use it for freplace?

Please see freplace example in progs/fexit_bpf2bpf.c
freplace is not a separate type of program.
It's not tracing and it's not networking.
It's an extension of the target program.
If target prog is xdp prog the extension will have access
to the same struct xdp_md and the same xdp helpers.
