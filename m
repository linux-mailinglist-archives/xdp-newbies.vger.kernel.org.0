Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484151EEE03
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 00:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFDW4o (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 Jun 2020 18:56:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56267 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726221AbgFDW4o (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 Jun 2020 18:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591311401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t2sAOPMDFb8RhL6uvTpwNIa+xN61vUAbg4AYTokPIIw=;
        b=YptppkA1Ka/m6WdiDPFw8S6g4/XOZsGorOJUjwz0DlWAFyZOok1UFUPuQuVFUrePNEVPly
        j2O/4pVeW08BVOgNeYOi6rfUt/Z8Yij3JMaBWKu4dlWXjBuWS1cVuRIKLjLnorvQDz6/Em
        IHyLYMSpMllwujaPnvtymnZjYTwn02g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-v-6Z8m8hNgyUI1xWHwdC5g-1; Thu, 04 Jun 2020 18:56:39 -0400
X-MC-Unique: v-6Z8m8hNgyUI1xWHwdC5g-1
Received: by mail-ej1-f72.google.com with SMTP id l2so2675649ejd.11
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jun 2020 15:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=t2sAOPMDFb8RhL6uvTpwNIa+xN61vUAbg4AYTokPIIw=;
        b=fxiV8anTw4LLgWoKfAaM2jY064YN6k7rh3fHIrik70/gcIa7bY+xxDPnnlTUS9SbHq
         Jxv3zqynKa7b1ZjmVVMlj3YPhIQ+xrvcN6QTTrtFtjKDwfkh6p1EWL2Rv5ooGb29tqR7
         jiXh97i1+Q0gXf/yVWWVMh/XDaaNDNXE8oVeBZ6nE54X6i4EGFFaT5m3ckWWPR7EtZzN
         SSPub8mnm/mYavW0GF0CViDsRQHFskhBmVFzEAoMCAGCVgUy5W6v0jMN4FGMtuhnvmhh
         aySlKs5/NhIVsJXSfA89k+f5Qp9MSKYpjNVUynMhnoSDHpxIMdjGH5GdSCoZPKj0zNOI
         Xh3w==
X-Gm-Message-State: AOAM532W3KSxIAeJZAEEV26SImpqAl+Wy8uit+7vvjrMlIDhduElTaML
        CyFncT7QwsJH8HVBULYymN5PLpWsibeL4qJLEdA7FVJM3iSi0K/cY0WbNddNFJLUV0L4XNY6Au9
        fB0TexOERbvQ5KTvA/GD/fJY=
X-Received: by 2002:a17:906:aac8:: with SMTP id kt8mr6076184ejb.460.1591311398436;
        Thu, 04 Jun 2020 15:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCJhaJdK/77lJ6SPN/Z3Jk9WhUZvIx1MWTHkmXMij2PFMCZu63opfUDeK7L5PTin9zS4VYrg==
X-Received: by 2002:a17:906:aac8:: with SMTP id kt8mr6076172ejb.460.1591311398129;
        Thu, 04 Jun 2020 15:56:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id lx26sm2973107ejb.112.2020.06.04.15.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 15:56:37 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A9C2718200D; Fri,  5 Jun 2020 00:56:33 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     maharishi bhargava <bhargavamaharishi@gmail.com>
Cc:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org,
        Magnus Karlsson <magnus.karlsson@intel.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
In-Reply-To: <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com> <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com> <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com> <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com> <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com> <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com> <874krskwz6.fsf@toke.dk> <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 05 Jun 2020 00:56:33 +0200
Message-ID: <877dwme8ym.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

maharishi bhargava <bhargavamaharishi@gmail.com> writes:

> On Wed, Jun 3, 2020 at 8:39 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
>>
>> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>>
>> > On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
>> > <maciej.fijalkowski@intel.com> wrote:
>> >>
>> >> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8rg=
ensen wrote:
>> >> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
>> >> >
>> >> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=
=82=C2=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
>> >> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >> > >>
>> >> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8i=
land-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
>> >> > >> >>
>> >> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >> > >> >>
>> >> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8ila=
nd-J=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
>> >> > >> >> >>
>> >> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
>> >> > >> >> >>
>> >> > >> >> >> > Hi, in my XDP program, I want to redirect some packets u=
sing AF_XDP
>> >> > >> >> >> > and redirect other packets directly from driver space.
>> >> > >> >> >> > Redirection through AF_XDP works fine, but redirection t=
hrough dev map
>> >> > >> >> >> > stops after some packets are processed.
>> >> > >> >> >>
>> >> > >> >> >> Do you mean it stops even if you are *only* redirecting to=
 a devmap, or
>> >> > >> >> >> if you are first redirecting a few packets to AF_XDP, then=
 to devmap?
>> >> > >> >> >>
>> >> > >> >> >> Also, which driver(s) are the physical NICs you're redirec=
ting to/from
>> >> > >> >> >> using, and which kernel version are you on?
>> >> > >> >> >>
>> >> > >> >> >> -Toke
>> >> > >> >> >
>> >> > >> >> >
>> >> > >> >> >
>> >> > >> >> > Currently, I'm trying to redirect packets only using devmap=
. But also
>> >> > >> >> > have code for redirection using AF_XDP(only when a given co=
ndition is
>> >> > >> >> > satisfied). A DPDK program is running in userspace which wi=
ll receive
>> >> > >> >> > packets from AF_XDP.
>> >> > >> >>
>> >> > >> >> Right, so it's just devmap redirect that breaks. What do you =
mean
>> >> > >> >> 'redirection stops', exactly? How are you seeing this? Does x=
dp_monitor
>> >> > >> >> (from samples/bpf) report any exceptions?
>> >> > >> >>
>> >> > >> >> -Toke
>> >> > >> >>
>> >> > >> > So, In my setup, there are three systems, Let's Assume A, B, C=
. System
>> >> > >> > B is acting as a forwarder between A and C. So I can see the n=
umber of
>> >> > >> > packets received at system C. To be specific, only 1024 packet=
s are
>> >> > >> > received. If I remove the xsks_map part from the code and don'=
t run
>> >> > >> > DPDK in userspace. This problem does not occur. Also if I forw=
ard all
>> >> > >> > the packets using AF_XDP, there is no such issue.
>> >> > >>
>> >> > >> I thought you said you were seeing the problem when only redirec=
ting to
>> >> > >> a devmap? So why does the xsk_map code impact this? I think you =
may have
>> >> > >> to share some code...
>> >> > >
>> >> > > Isn't the case here that either xsk_map or dev_map consumes the f=
rame and
>> >> > > therefore the latter doesn't see it? so cloning might be needed h=
ere?
>> >> >
>> >> > Yeah, certainly you can't redirect *the same packet* to both xsk_ma=
p and
>> >> > devmap - but that wasn't what I understood was the use case here?
>> >>
>> >> Maybe the best would be if Maharishi shared the code as you requested=
 :)
>> >>
>> >> >
>> >> > -Toke
>> >> >
>> > CODE:
>> > BPF MAPS:
>> >
>> >
>> > struct bpf_map_def SEC("maps") xsks_map =3D {
>> >     .type =3D BPF_MAP_TYPE_XSKMAP,
>> >     .key_size =3D sizeof(int),
>> >     .value_size =3D sizeof(int),
>> >     .max_entries =3D 64,  /* Assume netdev has no more than 64 queues =
*/
>> > };
>> >
>> > struct bpf_map_def SEC("maps") tx_port =3D {
>> >     .type =3D BPF_MAP_TYPE_DEVMAP,
>> >     .key_size =3D sizeof(int),
>> >     .value_size =3D sizeof(int),
>> >     .max_entries =3D 1024,
>> > };
>> >
>> > struct Ingress_qos_lts_value{
>> >     struct bpf_spin_lock lock;
>> >     u64 timestamp;
>> > };
>> > struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
>> >     .type =3D BPF_MAP_TYPE_ARRAY,
>> >     .key_size =3D sizeof(u32),
>> >     .value_size =3D sizeof(struct Ingress_qos_lts_value),
>> >     .max_entries =3D 1025,
>> > };
>> > BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_value);
>> >
>> >
>> > SEC("prog")
>> > int ebpf_filter(struct xdp_md *ctx){
>> >     struct xdp_output xout;
>> >    xout.output_port =3D 1;
>> >     void* ebpf_packetStart =3D ((void*)(long)ctx->data);
>> >     void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
>> >     u64 rate =3D 100;//100 Kbps
>> >     rate *=3D 1000*1000*100;//10 Gbps
>> >     u32 key =3D 1;//some key
>> >     u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
>> >     packet_length *=3D 1000000000; //packet length * 10^9, to convert
>> > rate from second to nanosecond
>> >     struct Ingress_qos_lts_value* val;
>> >     val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
>> >     u64 now =3D bpf_ktime_get_ns();
>> >     u64 lts;
>> >     if (val) {
>> >         bpf_spin_lock(&val->lock);
>> >         lts =3D *(&val->timestamp)+(packet_length/rate);
>> >         if(now>lts){
>> >             lts =3D now;
>> >         }
>> >         *(&val->timestamp) =3D lts;
>> >         bpf_spin_unlock(&val->lock);
>> >                     // printk("Time : %x %x\n",lts,now);
>> >         if(lts>now){
>> >             return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0);
>> >         }
>> >     }
>> >     return  bpf_redirect_map(&tx_port,xout.output_port,0);
>> > }
>> >
>> > So, Basically this code redirects the packet to some other interface
>> > or sends the packet to userspace based on the incoming packet rate.
>>
>> Well, if you say it goes away when you remove the xsk code, the obvious
>> explanation would be that the packets are being redirected to userspace
>> instead? What does xdp_monitor say?
>>
>> -Toke
>>
> No packets are not going to userspace. NIC stops processing any more
> packets after 1024 redirected packets. I'll post the results of
> xdp_monitor asap.
>
> Also, one piece of information that might be helpful. In DPDK's
> default code for creating xsk_socket, the value of bind_flags was 0.
> When I changed it to XDP_COPY(1 << 1), everything started working
> correctly. So, is it something like, the socket was getting created in
> zero-copy mode and as far as I know, kernel version 5.3 does not
> support zero-copy mode. Due to this xdp_redirect using DEVMAP was not
> working as expected.

Hmm, in zero-copy mode packets are DMA'ed directly into the
userspace-provided buffer (hence zero copies). Pretty sure this is
incompatible with forwarding them to the stack, whether or not the
kernel supports zero-copy in the first place.

Cc Magnus who will know for sure.

-Toke

