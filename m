Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F721EF67A
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 13:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgFELgI (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jun 2020 07:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgFELgI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 07:36:08 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85C4C08C5C3
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 04:36:07 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id q10so3166057uaj.13
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jun 2020 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TN9Rq04R8YnnphIZtdaSADoD7zShdRC9N81DWrVUIYM=;
        b=gwR2vj6TovZqPtjTZZRdSSrKF/ys5Paj418dbucki7RKQqtgygswu/MKikuKkpQhHG
         xPjRKl/Q114etMrmm0JL37c2FduU7PzQgEgo9OJ6ab48i+NKaEh4pjD4savtHAsUPKfz
         bTZHsPQMcAXFCbkUn2/H3P0VVBqUuTinv01cllBVxkknF7EFsB877g6zgz1/JUBVvL5L
         rPneAE/8y8aLWi1+oCnLAOFTLwaQGLUgJ4fSQ88CThGdCsMJg2DLBrTFI1k4yp6MuL1w
         Bu8OD+uc+qEzbP/g5spKA/3B5BKcC0gGZTnzDCkoFHr7X7zz/KYQ5T+Dgsp5OumA6bNt
         1HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TN9Rq04R8YnnphIZtdaSADoD7zShdRC9N81DWrVUIYM=;
        b=QJ4TcO9eZ+69WA9wnEWxcx+NI9dd5cjYlHp8q7q94PcIpxsNHlZBG20QcpGFLyINcT
         n0c0YVKpTg6yOiuS2gPpfBngZNZHb2X3kv/6AJVRCxJCysr5489/U3EZb8TwEncSmn0S
         0PsuvNE/rwKDz+r4xVTdbR3az4oZ9c3CLmDpQ8NX9lqlKZGv9NvrxE+5E1CbWpiF/ouS
         2SgFLADBMVgwYB8fXOi34gzIEINog7KESTQPKWQOTUcBTz37VwKeAF8mpUbLomDkf7xX
         SMW/Quglug5n8SRStgN5Mb5OaJo7um4iMENXV6IUfOt8HF6Tu/UhFfRWgMDq0Y9XjUu8
         Wl9g==
X-Gm-Message-State: AOAM531gIKQWjkNKj++B+YRHHX7IoR0OgkGeGu2STiSQmMie+fv8Pby3
        7fOE1tFoLPWj7EH1Gv6eL8A4gp9W/wH1Kx7cbPQ=
X-Google-Smtp-Source: ABdhPJza1nd1zeAAOmFl4ttcNdUmZuq46QexEkZDBvbef69zBE7zsuYaOYGJg77qf2cehYBvQHUYFYu0LOh3gDECpHE=
X-Received: by 2002:ab0:224d:: with SMTP id z13mr7150639uan.83.1591356966966;
 Fri, 05 Jun 2020 04:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
 <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com>
 <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com>
 <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com>
 <874krskwz6.fsf@toke.dk> <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
 <877dwme8ym.fsf@toke.dk>
In-Reply-To: <877dwme8ym.fsf@toke.dk>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 5 Jun 2020 13:35:55 +0200
Message-ID: <CAJ8uoz0tPZ1Z==kzKagDCv7F3ysa9oiEKF1xM+AWrCUYAQgwmw@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     maharishi bhargava <bhargavamaharishi@gmail.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, Jun 5, 2020 at 12:57 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>
> > On Wed, Jun 3, 2020 at 8:39 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@r=
edhat.com> wrote:
> >>
> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >>
> >> > On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
> >> > <maciej.fijalkowski@intel.com> wrote:
> >> >>
> >> >> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8=
rgensen wrote:
> >> >> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
> >> >> >
> >> >> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=
=82=C2=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
> >> >> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> >> > >>
> >> >> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=
=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
> >> >> > >> >>
> >> >> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> >> > >> >>
> >> >> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8i=
land-J=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
> >> >> > >> >> >>
> >> >> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> >> > >> >> >>
> >> >> > >> >> >> > Hi, in my XDP program, I want to redirect some packets=
 using AF_XDP
> >> >> > >> >> >> > and redirect other packets directly from driver space.
> >> >> > >> >> >> > Redirection through AF_XDP works fine, but redirection=
 through dev map
> >> >> > >> >> >> > stops after some packets are processed.
> >> >> > >> >> >>
> >> >> > >> >> >> Do you mean it stops even if you are *only* redirecting =
to a devmap, or
> >> >> > >> >> >> if you are first redirecting a few packets to AF_XDP, th=
en to devmap?
> >> >> > >> >> >>
> >> >> > >> >> >> Also, which driver(s) are the physical NICs you're redir=
ecting to/from
> >> >> > >> >> >> using, and which kernel version are you on?
> >> >> > >> >> >>
> >> >> > >> >> >> -Toke
> >> >> > >> >> >
> >> >> > >> >> >
> >> >> > >> >> >
> >> >> > >> >> > Currently, I'm trying to redirect packets only using devm=
ap. But also
> >> >> > >> >> > have code for redirection using AF_XDP(only when a given =
condition is
> >> >> > >> >> > satisfied). A DPDK program is running in userspace which =
will receive
> >> >> > >> >> > packets from AF_XDP.
> >> >> > >> >>
> >> >> > >> >> Right, so it's just devmap redirect that breaks. What do yo=
u mean
> >> >> > >> >> 'redirection stops', exactly? How are you seeing this? Does=
 xdp_monitor
> >> >> > >> >> (from samples/bpf) report any exceptions?
> >> >> > >> >>
> >> >> > >> >> -Toke
> >> >> > >> >>
> >> >> > >> > So, In my setup, there are three systems, Let's Assume A, B,=
 C. System
> >> >> > >> > B is acting as a forwarder between A and C. So I can see the=
 number of
> >> >> > >> > packets received at system C. To be specific, only 1024 pack=
ets are
> >> >> > >> > received. If I remove the xsks_map part from the code and do=
n't run
> >> >> > >> > DPDK in userspace. This problem does not occur. Also if I fo=
rward all
> >> >> > >> > the packets using AF_XDP, there is no such issue.
> >> >> > >>
> >> >> > >> I thought you said you were seeing the problem when only redir=
ecting to
> >> >> > >> a devmap? So why does the xsk_map code impact this? I think yo=
u may have
> >> >> > >> to share some code...
> >> >> > >
> >> >> > > Isn't the case here that either xsk_map or dev_map consumes the=
 frame and
> >> >> > > therefore the latter doesn't see it? so cloning might be needed=
 here?
> >> >> >
> >> >> > Yeah, certainly you can't redirect *the same packet* to both xsk_=
map and
> >> >> > devmap - but that wasn't what I understood was the use case here?
> >> >>
> >> >> Maybe the best would be if Maharishi shared the code as you request=
ed :)
> >> >>
> >> >> >
> >> >> > -Toke
> >> >> >
> >> > CODE:
> >> > BPF MAPS:
> >> >
> >> >
> >> > struct bpf_map_def SEC("maps") xsks_map =3D {
> >> >     .type =3D BPF_MAP_TYPE_XSKMAP,
> >> >     .key_size =3D sizeof(int),
> >> >     .value_size =3D sizeof(int),
> >> >     .max_entries =3D 64,  /* Assume netdev has no more than 64 queue=
s */
> >> > };
> >> >
> >> > struct bpf_map_def SEC("maps") tx_port =3D {
> >> >     .type =3D BPF_MAP_TYPE_DEVMAP,
> >> >     .key_size =3D sizeof(int),
> >> >     .value_size =3D sizeof(int),
> >> >     .max_entries =3D 1024,
> >> > };
> >> >
> >> > struct Ingress_qos_lts_value{
> >> >     struct bpf_spin_lock lock;
> >> >     u64 timestamp;
> >> > };
> >> > struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
> >> >     .type =3D BPF_MAP_TYPE_ARRAY,
> >> >     .key_size =3D sizeof(u32),
> >> >     .value_size =3D sizeof(struct Ingress_qos_lts_value),
> >> >     .max_entries =3D 1025,
> >> > };
> >> > BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_valu=
e);
> >> >
> >> >
> >> > SEC("prog")
> >> > int ebpf_filter(struct xdp_md *ctx){
> >> >     struct xdp_output xout;
> >> >    xout.output_port =3D 1;
> >> >     void* ebpf_packetStart =3D ((void*)(long)ctx->data);
> >> >     void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
> >> >     u64 rate =3D 100;//100 Kbps
> >> >     rate *=3D 1000*1000*100;//10 Gbps
> >> >     u32 key =3D 1;//some key
> >> >     u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
> >> >     packet_length *=3D 1000000000; //packet length * 10^9, to conver=
t
> >> > rate from second to nanosecond
> >> >     struct Ingress_qos_lts_value* val;
> >> >     val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
> >> >     u64 now =3D bpf_ktime_get_ns();
> >> >     u64 lts;
> >> >     if (val) {
> >> >         bpf_spin_lock(&val->lock);
> >> >         lts =3D *(&val->timestamp)+(packet_length/rate);
> >> >         if(now>lts){
> >> >             lts =3D now;
> >> >         }
> >> >         *(&val->timestamp) =3D lts;
> >> >         bpf_spin_unlock(&val->lock);
> >> >                     // printk("Time : %x %x\n",lts,now);
> >> >         if(lts>now){
> >> >             return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, =
0);
> >> >         }
> >> >     }
> >> >     return  bpf_redirect_map(&tx_port,xout.output_port,0);
> >> > }
> >> >
> >> > So, Basically this code redirects the packet to some other interface
> >> > or sends the packet to userspace based on the incoming packet rate.
> >>
> >> Well, if you say it goes away when you remove the xsk code, the obviou=
s
> >> explanation would be that the packets are being redirected to userspac=
e
> >> instead? What does xdp_monitor say?
> >>
> >> -Toke
> >>
> > No packets are not going to userspace. NIC stops processing any more
> > packets after 1024 redirected packets. I'll post the results of
> > xdp_monitor asap.
> >
> > Also, one piece of information that might be helpful. In DPDK's
> > default code for creating xsk_socket, the value of bind_flags was 0.
> > When I changed it to XDP_COPY(1 << 1), everything started working
> > correctly. So, is it something like, the socket was getting created in
> > zero-copy mode and as far as I know, kernel version 5.3 does not
> > support zero-copy mode. Due to this xdp_redirect using DEVMAP was not
> > working as expected.
>
> Hmm, in zero-copy mode packets are DMA'ed directly into the
> userspace-provided buffer (hence zero copies). Pretty sure this is
> incompatible with forwarding them to the stack, whether or not the
> kernel supports zero-copy in the first place.

If you redirect to another netdev or XDP_PASS a packet to the kernel,
it will be copied and the copy is sent onwards to the system. As Toke
says, whatever you had in that packet will be visible to the process
you created/used the zero-copy AF_XDP socket in. But any further
modification to the packet will not be visible in the umem area, since
the packet was copied to another kernel internal buffer.

/Magnus

> Cc Magnus who will know for sure.
>
> -Toke
>
