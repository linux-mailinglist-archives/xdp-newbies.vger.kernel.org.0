Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B3A1EF66B
	for <lists+xdp-newbies@lfdr.de>; Fri,  5 Jun 2020 13:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgFELbW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 5 Jun 2020 07:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgFELbW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 5 Jun 2020 07:31:22 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3425CC08C5C2
        for <xdp-newbies@vger.kernel.org>; Fri,  5 Jun 2020 04:31:22 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id t23so2135193vkt.5
        for <xdp-newbies@vger.kernel.org>; Fri, 05 Jun 2020 04:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4dqm1lHmWom52Q/6kD95j7xY10P2xox/kyXIJg34VdU=;
        b=b6qGzYqjNHYsVHYTlzJDug5rt+1AfBhsb+4K9oA2O1Drx/NTVn96cbos2QmZeOoX5/
         MBe9TC9g0mks8shf21OPOafrVphuLhqf952SffQy6ZsRPY7CJ4zYjJwntk8ZTeXRvn52
         5HTQwtOj8AFCltv2BkaHYhRDiVHFjrgIoF1HG/qKfuf5+o63zMldO1lWyz4gI6QeQSBa
         GrL3LF9Qejd9a+5iUaFNCudYtjNxaRzy7pS8PFp2B1BD7v4r7052pNc0LzKu3ANPz/gX
         svnf9Dy+RABtrtdZHiPxp+rzjJSESRV4WGrmbxo6nnOdJU6RVFhWFWjsSDcU1X6EEJhH
         YbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4dqm1lHmWom52Q/6kD95j7xY10P2xox/kyXIJg34VdU=;
        b=IHRhozTcWZ19KPJElPTCl5f8KqJ3Td2KsotG42UuOyOb+Ecm99MM/XVj1y6BP3IcWW
         mVzQpdMa+mbgHGtNdXqnk4HQm7UEPMcIWn/aBxUjkhac93bnIjaMWCwR+Jty2kvnhk2R
         TvmfiqN7mjvpC1lpPFqdgkLlzPudDDyJVKRQeoIxMIvgAeLO4IukqMUa0c0sHK8OuQyE
         3aHzAC5IJ7p7qc9iNB1Q5XMh526gTk07I91b045rK0/TVi7UK5oSHTxedeXhxjNV4aDh
         viQ5uB3KM7sYCR6Vv09o2jjZqHXTkV/DAdmOWYlY10UNPdlXU09AkwzyqXrFcxbWizDT
         B3bw==
X-Gm-Message-State: AOAM532RmLR/6nsOG6toVoFFs4v3ERBYZye5rAOuxXjkbw4+8bqoYYlu
        8giOLw0Q9A469oTCX/iIBAyGNWuk407e9ykT3D0=
X-Google-Smtp-Source: ABdhPJyLvgGY/9wxxZ5nWXnZcuVReHFMW7h3BPZPjvRyu+wSUYWWZTqTwWIiXpR/ddb7gGbFMLdm66hQbGL19nIApSI=
X-Received: by 2002:a1f:3ac6:: with SMTP id h189mr6614344vka.16.1591356681307;
 Fri, 05 Jun 2020 04:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
 <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com>
 <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com>
 <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com>
 <874krskwz6.fsf@toke.dk> <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
In-Reply-To: <CA+Jwd2ww5csJOhbid7aSWHcC4MahDM8mu+y90pX+U3H9F2iJRQ@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 5 Jun 2020 13:31:10 +0200
Message-ID: <CAJ8uoz0S-M-7WyMStBLQeuGLEyDOw-MEcwnqtO3Ogh93o2AHfA@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     maharishi bhargava <bhargavamaharishi@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Jun 4, 2020 at 10:15 PM maharishi bhargava
<bhargavamaharishi@gmail.com> wrote:
>
> On Wed, Jun 3, 2020 at 8:39 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@red=
hat.com> wrote:
> >
> > maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> >
> > > On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
> > > <maciej.fijalkowski@intel.com> wrote:
> > >>
> > >> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8r=
gensen wrote:
> > >> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
> > >> >
> > >> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=
=82=C2=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
> > >> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >> > >>
> > >> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8=
iland-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
> > >> > >> >>
> > >> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >> > >> >>
> > >> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8il=
and-J=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
> > >> > >> >> >>
> > >> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >> > >> >> >>
> > >> > >> >> >> > Hi, in my XDP program, I want to redirect some packets =
using AF_XDP
> > >> > >> >> >> > and redirect other packets directly from driver space.
> > >> > >> >> >> > Redirection through AF_XDP works fine, but redirection =
through dev map
> > >> > >> >> >> > stops after some packets are processed.
> > >> > >> >> >>
> > >> > >> >> >> Do you mean it stops even if you are *only* redirecting t=
o a devmap, or
> > >> > >> >> >> if you are first redirecting a few packets to AF_XDP, the=
n to devmap?
> > >> > >> >> >>
> > >> > >> >> >> Also, which driver(s) are the physical NICs you're redire=
cting to/from
> > >> > >> >> >> using, and which kernel version are you on?
> > >> > >> >> >>
> > >> > >> >> >> -Toke
> > >> > >> >> >
> > >> > >> >> >
> > >> > >> >> >
> > >> > >> >> > Currently, I'm trying to redirect packets only using devma=
p. But also
> > >> > >> >> > have code for redirection using AF_XDP(only when a given c=
ondition is
> > >> > >> >> > satisfied). A DPDK program is running in userspace which w=
ill receive
> > >> > >> >> > packets from AF_XDP.
> > >> > >> >>
> > >> > >> >> Right, so it's just devmap redirect that breaks. What do you=
 mean
> > >> > >> >> 'redirection stops', exactly? How are you seeing this? Does =
xdp_monitor
> > >> > >> >> (from samples/bpf) report any exceptions?
> > >> > >> >>
> > >> > >> >> -Toke
> > >> > >> >>
> > >> > >> > So, In my setup, there are three systems, Let's Assume A, B, =
C. System
> > >> > >> > B is acting as a forwarder between A and C. So I can see the =
number of
> > >> > >> > packets received at system C. To be specific, only 1024 packe=
ts are
> > >> > >> > received. If I remove the xsks_map part from the code and don=
't run
> > >> > >> > DPDK in userspace. This problem does not occur. Also if I for=
ward all
> > >> > >> > the packets using AF_XDP, there is no such issue.
> > >> > >>
> > >> > >> I thought you said you were seeing the problem when only redire=
cting to
> > >> > >> a devmap? So why does the xsk_map code impact this? I think you=
 may have
> > >> > >> to share some code...
> > >> > >
> > >> > > Isn't the case here that either xsk_map or dev_map consumes the =
frame and
> > >> > > therefore the latter doesn't see it? so cloning might be needed =
here?
> > >> >
> > >> > Yeah, certainly you can't redirect *the same packet* to both xsk_m=
ap and
> > >> > devmap - but that wasn't what I understood was the use case here?
> > >>
> > >> Maybe the best would be if Maharishi shared the code as you requeste=
d :)
> > >>
> > >> >
> > >> > -Toke
> > >> >
> > > CODE:
> > > BPF MAPS:
> > >
> > >
> > > struct bpf_map_def SEC("maps") xsks_map =3D {
> > >     .type =3D BPF_MAP_TYPE_XSKMAP,
> > >     .key_size =3D sizeof(int),
> > >     .value_size =3D sizeof(int),
> > >     .max_entries =3D 64,  /* Assume netdev has no more than 64 queues=
 */
> > > };
> > >
> > > struct bpf_map_def SEC("maps") tx_port =3D {
> > >     .type =3D BPF_MAP_TYPE_DEVMAP,
> > >     .key_size =3D sizeof(int),
> > >     .value_size =3D sizeof(int),
> > >     .max_entries =3D 1024,
> > > };
> > >
> > > struct Ingress_qos_lts_value{
> > >     struct bpf_spin_lock lock;
> > >     u64 timestamp;
> > > };
> > > struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
> > >     .type =3D BPF_MAP_TYPE_ARRAY,
> > >     .key_size =3D sizeof(u32),
> > >     .value_size =3D sizeof(struct Ingress_qos_lts_value),
> > >     .max_entries =3D 1025,
> > > };
> > > BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_value=
);
> > >
> > >
> > > SEC("prog")
> > > int ebpf_filter(struct xdp_md *ctx){
> > >     struct xdp_output xout;
> > >    xout.output_port =3D 1;
> > >     void* ebpf_packetStart =3D ((void*)(long)ctx->data);
> > >     void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
> > >     u64 rate =3D 100;//100 Kbps
> > >     rate *=3D 1000*1000*100;//10 Gbps
> > >     u32 key =3D 1;//some key
> > >     u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
> > >     packet_length *=3D 1000000000; //packet length * 10^9, to convert
> > > rate from second to nanosecond
> > >     struct Ingress_qos_lts_value* val;
> > >     val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
> > >     u64 now =3D bpf_ktime_get_ns();
> > >     u64 lts;
> > >     if (val) {
> > >         bpf_spin_lock(&val->lock);
> > >         lts =3D *(&val->timestamp)+(packet_length/rate);
> > >         if(now>lts){
> > >             lts =3D now;
> > >         }
> > >         *(&val->timestamp) =3D lts;
> > >         bpf_spin_unlock(&val->lock);
> > >                     // printk("Time : %x %x\n",lts,now);
> > >         if(lts>now){
> > >             return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0=
);
> > >         }
> > >     }
> > >     return  bpf_redirect_map(&tx_port,xout.output_port,0);
> > > }
> > >
> > > So, Basically this code redirects the packet to some other interface
> > > or sends the packet to userspace based on the incoming packet rate.
> >
> > Well, if you say it goes away when you remove the xsk code, the obvious
> > explanation would be that the packets are being redirected to userspace
> > instead? What does xdp_monitor say?
> >
> > -Toke
> >
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

Yes, for DPDK to work with AF_XDP in zero-copy mode, you need at least
Linux 5.4 and DPDK 19.11 or later.

/Magnus

> - Maharishi
