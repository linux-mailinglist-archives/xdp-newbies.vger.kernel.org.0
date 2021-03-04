Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176D232D116
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Mar 2021 11:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbhCDKr1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Mar 2021 05:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55854 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238890AbhCDKrU (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 4 Mar 2021 05:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614854755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pE5PtoZ0RjzTX6aqtRQnMx0ZltZZa/HjyryBvdL8MiU=;
        b=LyhSI81VqgKE9ABtXk3gNV08jv0EeqcSR1V5UqYEZTynHUPAhTtUDZ0e6hLfMqZ327jesj
        SimdjSC4fmOCOoI04Pwf5wmGrQ54XJ8fyAl5SVJJnKuJzwtkPl25rKqdsB/o5RYsX/jpjU
        QDKI8o/H1a++LmBKKAzKiS5b00whnmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-RsM8Isr_Oc-KZY9ohsaaQw-1; Thu, 04 Mar 2021 05:45:49 -0500
X-MC-Unique: RsM8Isr_Oc-KZY9ohsaaQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB6091084D6E;
        Thu,  4 Mar 2021 10:45:48 +0000 (UTC)
Received: from carbon (unknown [10.36.110.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1755D5C1C2;
        Thu,  4 Mar 2021 10:45:40 +0000 (UTC)
Date:   Thu, 4 Mar 2021 11:45:39 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Cc:     brouer@redhat.com, Srivats P <pstavirs@gmail.com>,
        Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Putting Into Account Packet End (ctx->data_end)
Message-ID: <20210304114529.54e59889@carbon>
In-Reply-To: <877dmoik70.fsf@toke.dk>
References: <acb3dbc2-c725-d977-8441-15e06acb27cb@gflclan.com>
        <CANzUK5-_n_2kg0mAFpDFU8+z_Lp5ErhUq_CczyXhVnsK+4RgfA@mail.gmail.com>
        <877dmoik70.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 03 Mar 2021 11:51:47 +0100
Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> wrote:

> Srivats P <pstavirs@gmail.com> writes:
>=20
> > On Mon, Mar 1, 2021 at 9:40 PM Christian Deacon <gamemann@gflclan.com> =
wrote: =20
> >>
> >> Hey everyone,
> >>
> >> I wasn't sure if this belonged on the BPF mailing list or XDP Newbies.
> >> However, I figured I'd send it to the XDP Newbies list first since the
> >> project I'm making involves XDP.
> >>
> >> In my project, I'm trying to create a pointer that puts in account the
> >> ctx->data_end pointer. The new pointer is an unsigned 32-bit integer
> >> that is suppose to represent an IPv4 address. Here's an example of the=
 code.
> >>
> >> ```
> >> void *data_end =3D (void *)(long)ctx->data_end;
> >>
> >> //uint32_t *icmpdata =3D data_end - sizeof(uint32_t);
> >> uint32_t *icmpdata =3D data_end;
> >> icmpdata -=3D sizeof(uint32_t);
> >>
> >> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
> >> {
> >>      return XDP_DROP;
> >> }
> >> ```
> >>
> >> I'm trying to replace the last four bytes of the packet with this IPv4
> >> address. When I do this, I receive the following BPF verifier error wh=
en
> >> running the XDP program.
> >>
> >> ```
> >> R7 invalid mem access 'pkt_end'
> >> processed 909 insns (limit 100000000) max_states_per_insn 3 total_stat=
es
> >> 30 peak_states 30 mark_read 25
> >> ```
> >>
> >> To my understanding, this is due to accessing the packet end (data_end=
).
> >> However, I'm curious why this is prohibited if we're trying to go back
> >> four bytes into memory.
> >>
> >> I've also tried calculating the length of the packet and using ctx->da=
ta
> >> like the following.
> >>
> >> ```
> >> void *data =3D (void *)(long)ctx->data;
> >>
> >> unsigned int len =3D (ctx->data_end - ctx->data);
> >>
> >> uint32_t *icmpdata =3D data + len;
> >> icmpdata -=3D sizeof(uint32_t);
> >>
> >> if (icmpdata + sizeof(uint32_t) > (uint32_t *)data_end)
> >> {
> >>      return XDP_DROP;
> >> }
> >> ```
> >>
> >> However, this states the offset is outside of the packet.
> >>
> >> ```
> >> invalid access to packet, off=3D-16 size=3D4, R2(id=3D56,off=3D-16,r=
=3D0)
> >> R2 offset is outside of the packet
> >> processed 931 insns (limit 100000000) max_states_per_insn 3 total_stat=
es
> >> 29 peak_states 29 mark_read 24
> >> ```
> >>
> >> I'm sure there is something I'm doing wrong with the check. With that
> >> said, I believe I found the verifier check it's running into below.
> >>
> >> https://github.com/torvalds/linux/blob/master/kernel/bpf/verifier.c#L2=
882
> >>
> >> It looks like the `mem_size` argument is 0 and offset is below 0 which
> >> is causing it to fail. I'm not sure why, but I'd assume it's because t=
he
> >> verifier believes `len` could be negative. Though, I tried adding chec=
ks
> >> for `len` and ran into the same issue.
> >>
> >> The XDP project I'm working on is a basic layer 3/4 forwarding program
> >> that does source port mapping when forwarding the packets. I have it
> >> working for TCP/UDP packets. However, for ICMP, I have nothing to keep
> >> track of within the headers. Therefore, I'm trying to add four bytes to
> >> the packet and appending the client's IPv4 address to the end of the
> >> packet before forwarding. When the packet comes back, I parse the last
> >> four bytes of the packet which is suppose to indicate the client IP
> >> address and remove the last four bytes of the packet. Below is the
> >> source code at the moment.
> >>
> >> https://github.com/gamemann/XDP-Forwarding/blob/master/src/xdp_prog.c#=
L181
> >>
> >> I hope this is enough information, but if isn't, please let me know. I
> >> also apologize if this is something silly I'm missing/not understandin=
g.
> >>
> >> Thank you for your time!
> >> =20
> >
> > See
> > https://lore.kernel.org/bpf/CANzUK5-g9wLiwUF88em4uVzMja_aR4xj9yzMS_ZObN=
KjvX6C6g@mail.gmail.com/ =20
>=20
> Since this is a question that gets asked a lot: Would you care to submit
> this as an example to https://github.com/xdp-project/bpf-examples -
> we're trying to collect useful examples there, and I think this fits the
> bill.

Good idea!

Is this the solution to my slightly similar attempts here:
 https://github.com/xdp-project/xdp-tutorial/tree/master/experiment01-tailg=
row

--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

