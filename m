Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A9D1ED119
	for <lists+xdp-newbies@lfdr.de>; Wed,  3 Jun 2020 15:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFCNnx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 3 Jun 2020 09:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgFCNnw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 3 Jun 2020 09:43:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50934C08C5C0
        for <xdp-newbies@vger.kernel.org>; Wed,  3 Jun 2020 06:43:52 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gl26so2202517ejb.11
        for <xdp-newbies@vger.kernel.org>; Wed, 03 Jun 2020 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Smws0kt3xGKkeIus0HXeeexfX2lZFZaMsBAzH6EJ5ag=;
        b=PFsorh0zCvjFAQHo4pP2n/ygyUaiKknSIonXf+kVX8XDjZeJHRD55KYOATvSgfSToW
         UCOogb8ihSUKltJOTdgsXJuwrwySa7NLzCKMgWNPUASg7s0wQE2IBWzGlf0lvpA1F0RP
         vZtuvLzVU09XiQ9okM9K5qEfTPteUvt+v5rsnbNqr1WTCNnbj+TB/LX1rGw+sdJupfZP
         NPzgit8twv9mQlttLp2gt/ca8eF3x9Jc+dqLoeVMiP+46LW7CCZ4dOb5S7z86H5hcrkP
         vVn4Vxfmpkrs2KcYhOosnAP7QeispvPk4jYgbQb/AguJNuPfhmLBPTMonszMWrxvkLUQ
         o+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Smws0kt3xGKkeIus0HXeeexfX2lZFZaMsBAzH6EJ5ag=;
        b=MnFwlrJnf4kXhvSSCGoR1EbBhxZ8Bim6A1o0diHM6ARi5smAkNgWL/nyBC83Gois8k
         M2Z8Hgr7MFVvONmww0BeUDh6FZPeOzJz6NVDfA9jzUPl2vWTABGtbyRbWcD5ke9ja3GX
         U4QJBCxCcOkelTjM3aBxWyyQ/I93ukX3sc/XfH36Qpx+t/6f1zczE90nPOgQMjk7PID3
         /s725wTw4G9ezpxuBTTHNipNrc86bqMu94oOJdJgBW7/yoK1W0gA5DADxkwaxZXYUVxr
         Z35WSmhsv8+FiYV2r8k3fHPT890Qx3oukhS4gzPDBdnOUYRgnQA/KU816dr6fjfoP+Lk
         5X4w==
X-Gm-Message-State: AOAM531lfiPUrD6ZaISXkfiGIUJ7r7wc0AKtMDCzEZUWqUO1NdigTxnX
        /wHr5PJHvdcKVJWjO203SG05qoRa+5Oudkrituc=
X-Google-Smtp-Source: ABdhPJyST2G+SNnfiCrCyd/SwHd8jcVKG6ozmC6IRcbHsNT2Zmn0MNWCKbMR0hkDTJxqeaWA+Usv1hQHU4LCxQJUtB0=
X-Received: by 2002:a17:906:5fcd:: with SMTP id k13mr15206715ejv.459.1591191830862;
 Wed, 03 Jun 2020 06:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Jwd2y5Pjh+QMrH9vjBtHhvG2EC1MCfm-A2Pq2hjRPEvJ1J1Q@mail.gmail.com>
 <87d06hzvr8.fsf@toke.dk> <CA+Jwd2z4_tGfh9wS_CJQL36O_vYyv5knXkm6=A+UvNNtojEcrw@mail.gmail.com>
 <877dwpmp7f.fsf@toke.dk> <CA+Jwd2xnb8Nuc6Y2V=04fBa2bXfaMy1FPyK8CsFnOkqyxrtEwg@mail.gmail.com>
 <87lfl4l8zu.fsf@toke.dk> <20200603104833.GA14391@ranger.igk.intel.com>
 <87ftbcl86e.fsf@toke.dk> <20200603110726.GA55184@ranger.igk.intel.com>
In-Reply-To: <20200603110726.GA55184@ranger.igk.intel.com>
From:   maharishi bhargava <bhargavamaharishi@gmail.com>
Date:   Wed, 3 Jun 2020 19:13:39 +0530
Message-ID: <CA+Jwd2wPcKWkfGa=TszqODbm2sGiyXszy5LRKozab0JrsSoGBQ@mail.gmail.com>
Subject: Re: XDP_REDIRECT with xsks_map and dev_map
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jun 3, 2020 at 4:41 PM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> On Wed, Jun 03, 2020 at 01:07:05PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
> > Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:
> >
> > > On Wed, Jun 03, 2020 at 12:49:25PM +0200, Toke H=C3=83=C6=92=C3=82=C2=
=B8iland-J=C3=83=C6=92=C3=82=C2=B8rgensen wrote:
> > >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >>
> > >> > On Tue, Jun 2, 2020 at 9:31 PM Toke H=C3=83=C6=92=C3=82=C2=B8iland=
-J=C3=83=C6=92=C3=82=C2=B8rgensen <toke@redhat.com> wrote:
> > >> >>
> > >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >> >>
> > >> >> > On Tue 2 Jun, 2020, 14:31 Toke H=C3=83=C6=92=C3=82=C2=B8iland-J=
=C3=83=C6=92=C3=82=C2=B8rgensen, <toke@redhat.com> wrote:
> > >> >> >>
> > >> >> >> maharishi bhargava <bhargavamaharishi@gmail.com> writes:
> > >> >> >>
> > >> >> >> > Hi, in my XDP program, I want to redirect some packets using=
 AF_XDP
> > >> >> >> > and redirect other packets directly from driver space.
> > >> >> >> > Redirection through AF_XDP works fine, but redirection throu=
gh dev map
> > >> >> >> > stops after some packets are processed.
> > >> >> >>
> > >> >> >> Do you mean it stops even if you are *only* redirecting to a d=
evmap, or
> > >> >> >> if you are first redirecting a few packets to AF_XDP, then to =
devmap?
> > >> >> >>
> > >> >> >> Also, which driver(s) are the physical NICs you're redirecting=
 to/from
> > >> >> >> using, and which kernel version are you on?
> > >> >> >>
> > >> >> >> -Toke
> > >> >> >
> > >> >> >
> > >> >> >
> > >> >> > Currently, I'm trying to redirect packets only using devmap. Bu=
t also
> > >> >> > have code for redirection using AF_XDP(only when a given condit=
ion is
> > >> >> > satisfied). A DPDK program is running in userspace which will r=
eceive
> > >> >> > packets from AF_XDP.
> > >> >>
> > >> >> Right, so it's just devmap redirect that breaks. What do you mean
> > >> >> 'redirection stops', exactly? How are you seeing this? Does xdp_m=
onitor
> > >> >> (from samples/bpf) report any exceptions?
> > >> >>
> > >> >> -Toke
> > >> >>
> > >> > So, In my setup, there are three systems, Let's Assume A, B, C. Sy=
stem
> > >> > B is acting as a forwarder between A and C. So I can see the numbe=
r of
> > >> > packets received at system C. To be specific, only 1024 packets ar=
e
> > >> > received. If I remove the xsks_map part from the code and don't ru=
n
> > >> > DPDK in userspace. This problem does not occur. Also if I forward =
all
> > >> > the packets using AF_XDP, there is no such issue.
> > >>
> > >> I thought you said you were seeing the problem when only redirecting=
 to
> > >> a devmap? So why does the xsk_map code impact this? I think you may =
have
> > >> to share some code...
> > >
> > > Isn't the case here that either xsk_map or dev_map consumes the frame=
 and
> > > therefore the latter doesn't see it? so cloning might be needed here?
> >
> > Yeah, certainly you can't redirect *the same packet* to both xsk_map an=
d
> > devmap - but that wasn't what I understood was the use case here?
>
> Maybe the best would be if Maharishi shared the code as you requested :)
>
> >
> > -Toke
> >
CODE:
BPF MAPS:


struct bpf_map_def SEC("maps") xsks_map =3D {
    .type =3D BPF_MAP_TYPE_XSKMAP,
    .key_size =3D sizeof(int),
    .value_size =3D sizeof(int),
    .max_entries =3D 64,  /* Assume netdev has no more than 64 queues */
};

struct bpf_map_def SEC("maps") tx_port =3D {
    .type =3D BPF_MAP_TYPE_DEVMAP,
    .key_size =3D sizeof(int),
    .value_size =3D sizeof(int),
    .max_entries =3D 1024,
};

struct Ingress_qos_lts_value{
    struct bpf_spin_lock lock;
    u64 timestamp;
};
struct bpf_map_def SEC("maps") Ingress_qos_lts =3D {
    .type =3D BPF_MAP_TYPE_ARRAY,
    .key_size =3D sizeof(u32),
    .value_size =3D sizeof(struct Ingress_qos_lts_value),
    .max_entries =3D 1025,
};
BPF_ANNOTATE_KV_PAIR(Ingress_qos_lts,u32,struct Ingress_qos_lts_value);


SEC("prog")
int ebpf_filter(struct xdp_md *ctx){
    struct xdp_output xout;
   xout.output_port =3D 1;
    void* ebpf_packetStart =3D ((void*)(long)ctx->data);
    void* ebpf_packetEnd =3D ((void*)(long)ctx->data_end);
    u64 rate =3D 100;//100 Kbps
    rate *=3D 1000*1000*100;//10 Gbps
    u32 key =3D 1;//some key
    u64 packet_length=3D(ebpf_packetEnd-ebpf_packetStart-42)*8;
    packet_length *=3D 1000000000; //packet length * 10^9, to convert
rate from second to nanosecond
    struct Ingress_qos_lts_value* val;
    val =3D bpf_map_lookup_elem(&Ingress_qos_lts, &key);
    u64 now =3D bpf_ktime_get_ns();
    u64 lts;
    if (val) {
        bpf_spin_lock(&val->lock);
        lts =3D *(&val->timestamp)+(packet_length/rate);
        if(now>lts){
            lts =3D now;
        }
        *(&val->timestamp) =3D lts;
        bpf_spin_unlock(&val->lock);
                    // printk("Time : %x %x\n",lts,now);
        if(lts>now){
            return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, 0);
        }
    }
    return  bpf_redirect_map(&tx_port,xout.output_port,0);
}

So, Basically this code redirects the packet to some other interface
or sends the packet to userspace based on the incoming packet rate.
