Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634BA1ED302
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jun 2020 17:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgFCPJJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jun 2020 11:09:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60350 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725930AbgFCPJI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 3 Jun 2020 11:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591196946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jPm9pyHLRCxuG1+yOPCoj6xHSRn3zREXs7khCepb+sQ=;
        b=RYSlNCorXVDdHJGv7Cq3d+6tjXKljMaJRCahSEpyN67l6nsLLNNcrzVxngHgaoPweGE9wO
        aAz5uDArvMzAcy+fsqv89v2hv5RSTTh1at/fgm9aOjD2gQ/cxo4uqWLtZB0gxZwABsI8wc
        Of0UtH0zyNOC0GGOPK1vIngOKk0O3JY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-wBe6-njkMcO-hDN19iQ9kQ-1; Wed, 03 Jun 2020 11:09:04 -0400
X-MC-Unique: wBe6-njkMcO-hDN19iQ9kQ-1
Received: by mail-ed1-f71.google.com with SMTP id a21so1307457edy.1
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jun 2020 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=jPm9pyHLRCxuG1+yOPCoj6xHSRn3zREXs7khCepb+sQ=;
        b=jKbFjYfCPAvwFmWAoO8doI/usIeiLLszROmkhgo++dEVcirtkS7sFp1e6PWMzA5fXG
         dBTeQIO0z2yHdaK0wcxXwF/+MhzBIwG0jhHAZ635xz++EYP1e3Sxi1v66iYLmYvVDzbe
         bQoRBDMf7Cn6s1n8BYBC5mnf01Ua2TWBObtbEn5h9ks6fJmIk9sVVzGXqhU00CSjwJvQ
         NSCHZIwEiFmi9C2mnzJfdYBdqTUacgCfhCCiChHZupNX8TV25HyZFMHH3UhZVUlufcFf
         Gq++meY0HLHN70BEBk+jJ6vCnP03kYhcd151lgihhQXyWOMnaMwDn0IXZnuqsDzB4GpQ
         vIhA==
X-Gm-Message-State: AOAM533gNUVFmem1R10kyzwH4OePYd8HwSR/FWgAHS627t7ia0fjAorp
        3bCplN7kvAFzXpDDNgONJsy7C4cnEY9gRwVRQ5iEsHUJzbLaxVERV60nBJmhyKi3wKPeHizzniQ
        nY1MvlJrCElPjghhWdGAg+5w=
X-Received: by 2002:a05:6402:393:: with SMTP id o19mr16149021edv.28.1591196943457;
        Wed, 03 Jun 2020 08:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR086McbaAXRtXUh9WQz6EWtfe19wA3y9fF5z7f099GWyKMabeg8MYhVNjeLJeYRucfYIn2Q==
X-Received: by 2002:a05:6402:393:: with SMTP id o19mr16148996edv.28.1591196943190;
        Wed, 03 Jun 2020 08:09:03 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id d5sm1346984edu.5.2020.06.03.08.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:09:02 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0CB7C182797; Wed,  3 Jun 2020 17:09:02 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     maharishi bhargava <bhargavamaharishi@gmail.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com> <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com> <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com> <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com> <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com> <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 03 Jun 2020 17:09:01 +0200
Message-ID: <874krskwz6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

maharishi bhargava <bhargavamaharishi@gmail.com> writes:

> On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
> <maciej.fijalkowski@intel.com> wrote:
>>
>> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8rgens=
en wrote:
>> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
>> >
>> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=82=
=C2=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
>> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> > >>
>> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8ilan=
d-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
>> > >> >>
>> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> > >> >>
>> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8iland-=
J=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
>> > >> >> >>
>> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> > >> >> >>
>> > >> >> >> > Hi, in my XDP program, I want to redirect some packets usin=
g AF_XDP
>> > >> >> >> > and redirect other packets directly from driver space.
>> > >> >> >> > Redirection through AF_XDP works fine, but redirection thro=
ugh dev map
>> > >> >> >> > stops after some packets are processed.
>> > >> >> >>
>> > >> >> >> Do you mean it stops even if you are *only* redirecting to a =
devmap, or
>> > >> >> >> if you are first redirecting a few packets to AF_XDP, then to=
 devmap?
>> > >> >> >>
>> > >> >> >> Also, which driver(s) are the physical NICs you're redirectin=
g to/from
>> > >> >> >> using, and which kernel version are you on?
>> > >> >> >>
>> > >> >> >> -Toke
>> > >> >> >
>> > >> >> >
>> > >> >> >
>> > >> >> > Currently, I'm trying to redirect packets only using devmap. B=
ut also
>> > >> >> > have code for redirection using AF_XDP(only when a given condi=
tion is
>> > >> >> > satisfied). A DPDK program is running in userspace which will =
receive
>> > >> >> > packets from AF_XDP.
>> > >> >>
>> > >> >> Right, so it's just devmap redirect that breaks. What do you mean
>> > >> >> 'redirection stops', exactly? How are you seeing this? Does xdp_=
monitor
>> > >> >> (from samples/bpf) report any exceptions?
>> > >> >>
>> > >> >> -Toke
>> > >> >>
>> > >> > So, In my setup, there are three systems, Let's Assume A, B, C. S=
ystem
>> > >> > B is acting as a forwarder between A and C. So I can see the numb=
er of
>> > >> > packets received at system C. To be specific, only 1024 packets a=
re
>> > >> > received. If I remove the xsks_map part from the code and don't r=
un
>> > >> > DPDK in userspace. This problem does not occur. Also if I forward=
 all
>> > >> > the packets using AF_XDP, there is no such issue.
>> > >>
>> > >> I thought you said you were seeing the problem when only redirectin=
g to
>> > >> a devmap? So why does the xsk_map code impact this? I think you may=
 have
>> > >> to share some code...
>> > >
>> > > Isn't the case here that either xsk_map or dev_map consumes the fram=
e and
>> > > therefore the latter doesn't see it? so cloning might be needed here?
>> >
>> > Yeah, certainly you can't redirect *the same packet* to both xsk_map a=
nd
>> > devmap - but that wasn't what I understood was the use case here?
>>
>> Maybe the best would be if Maharishi shared the code as you requested :)
>>
>> >
>> > -Toke
>> >
> CODE:
> BPF MAPS:
>
>
> struct bpf_map_def SEC("maps") xsks_map =3D {
>     .type =3D BPF_MAP_TYPE_XSKMAP,
>     .key_size =3D sizeof(int),
>     .value_size =3D sizeof(int),
>     .max_entries =3D 64,  /* Assume netdev has no more than 64 queues */
> };
>
> struct bpf_map_def SEC("maps") tx_port =3D {
>     .type =3D BPF_MAP_TYPE_DEVMAP,
>     .key_size =3D sizeof(int),
>     .value_size =3D sizeof(int),
>     .max_entries =3D 1024,
> };
>
> struct Ingress_qos_lts_value{
>     struct bpf_spin_lock lock;
>     u64 timestamp;
> };
> struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
>     .type =3D BPF_MAP_TYPE_ARRAY,
>     .key_size =3D sizeof(u32),
>     .value_size =3D sizeof(struct Ingress_qos_lts_value),
>     .max_entries =3D 1025,
> };
> BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_value);
>
>
> SEC("prog")
> int ebpf_filter(struct xdp_md *ctx){
>     struct xdp_output xout;
>    xout.output_port =3D 1;
>     void* ebpf_packetStart =3D ((void*)(long)ctx->data);
>     void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
>     u64 rate =3D 100;//100 Kbps
>     rate *=3D 1000*1000*100;//10 Gbps
>     u32 key =3D 1;//some key
>     u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
>     packet_length *=3D 1000000000; //packet length * 10^9, to convert
> rate from second to nanosecond
>     struct Ingress_qos_lts_value* val;
>     val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
>     u64 now =3D bpf_ktime_get_ns();
>     u64 lts;
>     if (val) {
>         bpf_spin_lock(&val->lock);
>         lts =3D *(&val->timestamp)+(packet_length/rate);
>         if(now>lts){
>             lts =3D now;
>         }
>         *(&val->timestamp) =3D lts;
>         bpf_spin_unlock(&val->lock);
>                     // printk("Time : %x %x\n",lts,now);
>         if(lts>now){
>             return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0);
>         }
>     }
>     return  bpf_redirect_map(&tx_port,xout.output_port,0);
> }
>
> So, Basically this code redirects the packet to some other interface
> or sends the packet to userspace based on the incoming packet rate.

Well, if you say it goes away when you remove the xsk code, the obvious
explanation would be that the packets are being redirected to userspace
instead? What does xdp_monitor say?

-Toke

