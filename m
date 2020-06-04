Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38D11EEB59
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jun 2020 21:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgFDTwU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jun 2020 15:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbgFDTwT (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 15:52:19 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5302EC08C5C0
        for <xdp-newbies@vger.kernel.org>; Thu,  4 Jun 2020 12:52:19 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y13so7442928eju.2
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jun 2020 12:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6DTbWYBdZK/wRZapqAD100b3rpMaE6FYzQ1WERQgf0k=;
        b=YCKKV8hbgUC+r3wR3UUOyVivKx5auWHrqDmWKHPihPIF0dOI/MWRQ+8ZfAmWblWsuD
         k/exvGuew7Yz23gc1sRbUD27ohwbRbeTFK9jiZkY4l/vCN4tvtba3omcJNMXRxhhOHPq
         Djc6oo0j+ixgAXfMVvVATBA7zwVOGXO+PjHa5SGvVcsr+gVNBmQnlMHCOaWy5ElPuqSB
         Y53ZJxgTgg1Y+zbNGtfZwsulFbdCDOVzG6uXO5daIbGyrH32uiQYsEfPCNWSpV19lt/l
         OxXe6JKKbPJ7e1ENAGWP3VzEJgn1+M+BNjpO3w7ZFt04tUTMH4EFT7VIqnMgm9oiiOAw
         vZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6DTbWYBdZK/wRZapqAD100b3rpMaE6FYzQ1WERQgf0k=;
        b=ms0ZxeNHviov97FrXwfRWOtIpO/SlGCmbfHJx+ehxOrqjEcrvqTbjgpw4gSfwTVfMV
         vn+U3aCHqUe5c1ZLtoQ5PjkneG+ZoUiIF4rzjPb0XfreHmrDaFPmdGAhL1Si3iErmoWq
         zJhL27LmC79r+OXpqyKCRqPQzmZ5Grnn78ju4TLqWUl3ZbcsU4muyy29SC+itGMp9wys
         iZVxhwUwgVeSitrmtYxjEo5oL1X5Tszo3iKHkLvuCRAVy6S3p4pkJwzEmRG+eH9qUbK2
         E0webOJ/Gq9doe6wQUpZebSXMDmlnLDryYMNI3WkH7wRLSCc/ilfT44i7e3bKIzleX6A
         AnnQ==
X-Gm-Message-State: AOAM531boH3+cIKjOMuALzWT91Y2xehmFs8pCv7kAseDBtz+dGY59P9x
        dzbFCRC863uWe9jV2mQqa3wllWO7VMXXU0qpODQ=
X-Google-Smtp-Source: ABdhPJx2qaXHU/hAerYy89mMCSBAWz9lLLmHKWmrvR6i5S+dX8/WHoyhCtPZibda82rniTjcKplS7R5JzvQ03entEcg=
X-Received: by 2002:a17:906:e0cf:: with SMTP id gl15mr5519983ejb.501.1591300337250;
 Thu, 04 Jun 2020 12:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
 <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com>
 <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com>
 <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com> <874krskwz6.fsf@toke.dk>
In-Reply-To: <874krskwz6.fsf@toke.dk>
From:   maharishi bhargava <bhargavamaharishi@gmail.com>
Date:   Fri, 5 Jun 2020 01:22:06 +0530
Message-ID: <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jun 3, 2020 at 8:39 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>
> > On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
> > <maciej.fijalkowski@intel.com> wrote:
> >>
> >> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
> >> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
> >> >
> >> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=82=
=C2=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
> >> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> > >>
> >> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8il=
and-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
> >> > >> >>
> >> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> > >> >>
> >> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8ilan=
d-J=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
> >> > >> >> >>
> >> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >> > >> >> >>
> >> > >> >> >> > Hi, in my XDP program, I want to redirect some packets us=
ing AF_XDP
> >> > >> >> >> > and redirect other packets directly from driver space.
> >> > >> >> >> > Redirection through AF_XDP works fine, but redirection th=
rough dev map
> >> > >> >> >> > stops after some packets are processed.
> >> > >> >> >>
> >> > >> >> >> Do you mean it stops even if you are *only* redirecting to =
a devmap, or
> >> > >> >> >> if you are first redirecting a few packets to AF_XDP, then =
to devmap?
> >> > >> >> >>
> >> > >> >> >> Also, which driver(s) are the physical NICs you're redirect=
ing to/from
> >> > >> >> >> using, and which kernel version are you on?
> >> > >> >> >>
> >> > >> >> >> -Toke
> >> > >> >> >
> >> > >> >> >
> >> > >> >> >
> >> > >> >> > Currently, I'm trying to redirect packets only using devmap.=
 But also
> >> > >> >> > have code for redirection using AF_XDP(only when a given con=
dition is
> >> > >> >> > satisfied). A DPDK program is running in userspace which wil=
l receive
> >> > >> >> > packets from AF_XDP.
> >> > >> >>
> >> > >> >> Right, so it's just devmap redirect that breaks. What do you m=
ean
> >> > >> >> 'redirection stops', exactly? How are you seeing this? Does xd=
p_monitor
> >> > >> >> (from samples/bpf) report any exceptions?
> >> > >> >>
> >> > >> >> -Toke
> >> > >> >>
> >> > >> > So, In my setup, there are three systems, Let's Assume A, B, C.=
 System
> >> > >> > B is acting as a forwarder between A and C. So I can see the nu=
mber of
> >> > >> > packets received at system C. To be specific, only 1024 packets=
 are
> >> > >> > received. If I remove the xsks_map part from the code and don't=
 run
> >> > >> > DPDK in userspace. This problem does not occur. Also if I forwa=
rd all
> >> > >> > the packets using AF_XDP, there is no such issue.
> >> > >>
> >> > >> I thought you said you were seeing the problem when only redirect=
ing to
> >> > >> a devmap? So why does the xsk_map code impact this? I think you m=
ay have
> >> > >> to share some code...
> >> > >
> >> > > Isn't the case here that either xsk_map or dev_map consumes the fr=
ame and
> >> > > therefore the latter doesn't see it? so cloning might be needed he=
re?
> >> >
> >> > Yeah, certainly you can't redirect *the same packet* to both xsk_map=
 and
> >> > devmap - but that wasn't what I understood was the use case here?
> >>
> >> Maybe the best would be if Maharishi shared the code as you requested =
:)
> >>
> >> >
> >> > -Toke
> >> >
> > CODE:
> > BPF MAPS:
> >
> >
> > struct bpf_map_def SEC("maps") xsks_map =3D {
> >     .type =3D BPF_MAP_TYPE_XSKMAP,
> >     .key_size =3D sizeof(int),
> >     .value_size =3D sizeof(int),
> >     .max_entries =3D 64,  /* Assume netdev has no more than 64 queues *=
/
> > };
> >
> > struct bpf_map_def SEC("maps") tx_port =3D {
> >     .type =3D BPF_MAP_TYPE_DEVMAP,
> >     .key_size =3D sizeof(int),
> >     .value_size =3D sizeof(int),
> >     .max_entries =3D 1024,
> > };
> >
> > struct Ingress_qos_lts_value{
> >     struct bpf_spin_lock lock;
> >     u64 timestamp;
> > };
> > struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
> >     .type =3D BPF_MAP_TYPE_ARRAY,
> >     .key_size =3D sizeof(u32),
> >     .value_size =3D sizeof(struct Ingress_qos_lts_value),
> >     .max_entries =3D 1025,
> > };
> > BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_value);
> >
> >
> > SEC("prog")
> > int ebpf_filter(struct xdp_md *ctx){
> >     struct xdp_output xout;
> >    xout.output_port =3D 1;
> >     void* ebpf_packetStart =3D ((void*)(long)ctx->data);
> >     void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
> >     u64 rate =3D 100;//100 Kbps
> >     rate *=3D 1000*1000*100;//10 Gbps
> >     u32 key =3D 1;//some key
> >     u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
> >     packet_length *=3D 1000000000; //packet length * 10^9, to convert
> > rate from second to nanosecond
> >     struct Ingress_qos_lts_value* val;
> >     val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
> >     u64 now =3D bpf_ktime_get_ns();
> >     u64 lts;
> >     if (val) {
> >         bpf_spin_lock(&val->lock);
> >         lts =3D *(&val->timestamp)+(packet_length/rate);
> >         if(now>lts){
> >             lts =3D now;
> >         }
> >         *(&val->timestamp) =3D lts;
> >         bpf_spin_unlock(&val->lock);
> >                     // printk("Time : %x %x\n",lts,now);
> >         if(lts>now){
> >             return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0);
> >         }
> >     }
> >     return  bpf_redirect_map(&tx_port,xout.output_port,0);
> > }
> >
> > So, Basically this code redirects the packet to some other interface
> > or sends the packet to userspace based on the incoming packet rate.
>
> Well, if you say it goes away when you remove the xsk code, the obvious
> explanation would be that the packets are being redirected to userspace
> instead? What does xdp_monitor say?
>
> -Toke
>
No packets are not going to userspace. NIC stops processing any more
packets after 1024 redirected packets. I'll post the results of
xdp_monitor asap.

Also, one piece of information that might be helpful. In DPDK's
default code for creating xsk_socket, the value of bind_flags was 0.
When I changed it to XDP_COPY(1 << 1), everything started working
correctly. So, is it something like, the socket was getting created in
zero-copy mode and as far as I know, kernel version 5.3 does not
support zero-copy mode. Due to this xdp_redirect using DEVMAP was not
working as expected.

- Maharishi
