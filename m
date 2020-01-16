Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB813D2A2
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 04:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgAPDUE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 22:20:04 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36074 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgAPDUD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 22:20:03 -0500
Received: by mail-ed1-f65.google.com with SMTP id j17so17576731edp.3
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 19:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eHz7pTVvjV5sqsoAINZu6L0VdAHQkB4nUvLkg3cLBTc=;
        b=Tbz7IH+XN4yZC3tLowSNrVBLzfZZqpiTA9F3AmCsI1HRf9SOyXmsVqEKfld91HyB3a
         ULd6Kib65LqMtLbk57H/JTH7OW9+MWemUqCexDlBbI0NzMANLAmdFZKyF1npLdahSVFu
         dEmOx1ytN7shrGmOln574jSRuLybT2iHuq0TsbjhI4rABal6H+ZH5nn7vNCLQR0ShTmH
         en0Ff8OQRUgpQ5XC8+M30gvK3iHn6bvty6jsOSD+ZI/rcVGEG00WLLz5WkvajmZ/fenI
         YpKDzxDHunFInh7280Nnl2GNFUuGnEfRv0CkMrZSLxlxt2Ipte6wuRiXcmQ4w5dweiNy
         qSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eHz7pTVvjV5sqsoAINZu6L0VdAHQkB4nUvLkg3cLBTc=;
        b=B86e/JTH0f4g1zhiVSiYviOGx2euHwSvu3iaKWH5Y/THx3pAEmYb2culAzf4SV9ggu
         yokozeor/QCyDzJ0RKENGqANWfgvifhBbfCz5Y5Yl/gWd3qeVsuNbXKmrkUq9tr9AJu9
         Y66PPK3uZwe8gDmro+sEJoisFcvgUgq9oeKTTpu83gJV+kdIAG4yIoX2s1KKrR3wnmAu
         n6aUrxaopXVmA9fcbKNnT3fQTIuRoIEvpSJhPf46MgSZ0QKmsIpEm5bNi4G6WI1YtBbQ
         5ttzmOzkhUbLpi1wC68nq0ir12zYAzVGD3We0eduWOL10cFDv1UbwPCFyceZVZmJ2UZD
         Df8A==
X-Gm-Message-State: APjAAAV1OC3grsCqdT/arcfLHE4d8Py0H0JPp8aRd38ktwNb3OAOTnPA
        knLtj6Yx1kil4e5lPoYpcbu7tnSoGDf/9s0IAe4=
X-Google-Smtp-Source: APXvYqxFliaLbIrzNTm0d9EnenRSHM0qo0gLpUidQIUHWGOmvI1Pi6co/XjVHDr7t/YYQAnTZvkbFbmRsMBBUHC51Ko=
X-Received: by 2002:aa7:c692:: with SMTP id n18mr29802135edq.350.1579144801726;
 Wed, 15 Jan 2020 19:20:01 -0800 (PST)
MIME-Version: 1.0
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <87ftggtl7t.fsf@toke.dk> <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
 <99fe90fe-cbb4-1ff1-156b-bd8053293aca@gmail.com> <CAK86TEcGAkmPLeYACWGtLT0CJPZqGYCqZDpZSO=0x4_ph0qcUA@mail.gmail.com>
In-Reply-To: <CAK86TEcGAkmPLeYACWGtLT0CJPZqGYCqZDpZSO=0x4_ph0qcUA@mail.gmail.com>
From:   Vincent Li <mchun.li@gmail.com>
Date:   Wed, 15 Jan 2020 19:19:50 -0800
Message-ID: <CAK86TEe8Je6NjLWzRHoMhDgqKyhqYd7pX2awmAUTQ7V3GCcKAA@mail.gmail.com>
Subject: Re: XDP invalid memory access
To:     David Ahern <dsahern@gmail.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I changed the code below, not sure if I got it right from you, I still
got memory access error


 40 static int tcp_option(void *data, void *data_end)

 41 {

 42         struct ethhdr *eth =3D (struct ethhdr *)data;

 43         struct iphdr *iph =3D (struct iphdr *)(eth + 1);

 44         struct tcphdr *tcphdr =3D (struct tcphdr *)(iph + 1);

 45         int tcplen;

 46

 47         /* sanity check needed by the eBPF verifier */

 48         if ((void *)(tcphdr + 1)  > data_end)

 49                 return 0;

 50

 51         /* skip non TCP packets */

 52         if (eth->h_proto !=3D __constant_htons(ETH_P_IP) ||
iph->protocol !=3D IPPROTO_TCP)

 53                 return 0;

 54

 55         /* incompatible flags, or PSH already set */

 56         if (tcphdr->ack || tcphdr->fin || tcphdr->rst || tcphdr->psh)

 57                 return 0;

 58

 59         if (tcphdr->syn) {

 60                 if (((void *)(tcphdr + 1) + tcphdr->doff*4) > data_end)

 61                         return 0;

 62                 optlen =3D tcphdr->doff*4 - sizeof(*tcphdr);

 63                 for (i =3D 0; i < optlen; ) {

 64                         if (op[i] =3D=3D TCPOPT_EOL ) {

 65                                 char fmt[] =3D "XDP: tcp source : %d
tcp option eol :%d\n";

 66                                 bpf_trace_printk(fmt, sizeof(fmt),
(int)tcphdr->source, TCPOPT_EOL);

 67                                 return 1;

 68                         }

 69                         if (op[i] < 2)

 70                                 i++;

 71                         else

 72                                 i +=3D op[i+1] ? : 1;

 73                 }

 74                 /*

 75                if (tcphdr->doff*4 =3D=3D 44 || tcphdr->doff*4 =3D=3D 28=
) {

 76                         char fmt[] =3D "XDP: tcp source : %d data
offset :%d\n";

 77                         bpf_trace_printk(fmt, sizeof(fmt),
(int)tcphdr->source, (int)tcphdr->doff*4);

 78                        return 1;

 79                }

 80                */

 81         }

 82         return 0;

 83 }

# ip link set dev enp4s0 xdpgeneric object tcp_option.o verbose


Prog section 'prog' rejected: Permission denied (13)!

 - Type:         6

 - Instructions: 86 (0 over limit)

 - License:      GPL


Verifier analysis:


0: (b7) r0 =3D 2

1: (61) r2 =3D *(u32 *)(r1 +4)

2: (61) r1 =3D *(u32 *)(r1 +0)

3: (bf) r3 =3D r1

4: (07) r3 +=3D 54

5: (2d) if r3 > r2 goto pc+79

 R0_w=3Dinv2 R1_w=3Dpkt(id=3D0,off=3D0,r=3D54,imm=3D0)
R2_w=3Dpkt_end(id=3D0,off=3D0,imm=3D0) R3_w=3Dpkt(id=3D0,off=3D54,r=3D54,im=
m=3D0)
R10=3Dfp0

6: (71) r4 =3D *(u8 *)(r1 +12)

7: (71) r5 =3D *(u8 *)(r1 +13)

8: (67) r5 <<=3D 8

9: (4f) r5 |=3D r4

10: (55) if r5 !=3D 0x8 goto pc+74

 R0_w=3Dinv2 R1_w=3Dpkt(id=3D0,off=3D0,r=3D54,imm=3D0)
R2_w=3Dpkt_end(id=3D0,off=3D0,imm=3D0) R3_w=3Dpkt(id=3D0,off=3D54,r=3D54,im=
m=3D0)
R4_w=3Dinv(id=3D0,umax_value=3D255,var_off=3D(0x0; 0xff)) R5_w=3Dinv8 R10=
=3Dfp0

11: (71) r4 =3D *(u8 *)(r1 +23)

12: (55) if r4 !=3D 0x6 goto pc+72

 R0=3Dinv2 R1=3Dpkt(id=3D0,off=3D0,r=3D54,imm=3D0) R2=3Dpkt_end(id=3D0,off=
=3D0,imm=3D0)
R3=3Dpkt(id=3D0,off=3D54,r=3D54,imm=3D0) R4=3Dinv6 R5=3Dinv8 R10=3Dfp0

13: (69) r5 =3D *(u16 *)(r1 +46)

14: (bf) r4 =3D r5

15: (57) r4 &=3D 7936

16: (55) if r4 !=3D 0x200 goto pc+68

 R0=3Dinv2 R1=3Dpkt(id=3D0,off=3D0,r=3D54,imm=3D0) R2=3Dpkt_end(id=3D0,off=
=3D0,imm=3D0)
R3=3Dpkt(id=3D0,off=3D54,r=3D54,imm=3D0) R4_w=3Dinv512
R5_w=3Dinv(id=3D0,umax_value=3D65535,var_off=3D(0x0; 0xffff)) R10=3Dfp0

17: (77) r5 >>=3D 2

18: (57) r5 &=3D 60

19: (0f) r3 +=3D r5

last_idx 19 first_idx 12

regs=3D20 stack=3D0 before 18: (57) r5 &=3D 60

regs=3D20 stack=3D0 before 17: (77) r5 >>=3D 2

regs=3D20 stack=3D0 before 16: (55) if r4 !=3D 0x200 goto pc+68

regs=3D20 stack=3D0 before 15: (57) r4 &=3D 7936

regs=3D20 stack=3D0 before 14: (bf) r4 =3D r5

regs=3D20 stack=3D0 before 13: (69) r5 =3D *(u16 *)(r1 +46)

20: (2d) if r3 > r2 goto pc+64

 R0=3Dinv2 R1=3Dpkt(id=3D0,off=3D0,r=3D54,imm=3D0) R2=3Dpkt_end(id=3D0,off=
=3D0,imm=3D0)
R3=3Dpkt(id=3D1,off=3D54,r=3D54,umax_value=3D60,var_off=3D(0x0; 0x3c)) R4=
=3Dinv512
R5=3DinvP(id=3D0,umax_value=3D60,var_off=3D(0x0; 0x3c)) R10=3Dfp0

21: (18) r2 =3D 0x0

23: (b7) r4 =3D 0

24: (63) *(u32 *)(r2 +0) =3D r4

R2 invalid mem access 'inv'

processed 24 insns (limit 1000000) max_states_per_insn 0 total_states
2 peak_states 2 mark_read 2


Error fetching program/map!

On Wed, Jan 15, 2020 at 5:34 PM Vincent Li <mchun.li@gmail.com> wrote:
>
> thank you! I will try that
>
> On Wed, Jan 15, 2020 at 4:40 PM David Ahern <dsahern@gmail.com> wrote:
> >
> > On 1/15/20 3:31 PM, Vincent Li wrote:
> > > On Wed, Jan 15, 2020 at 2:21 PM Toke H=C3=B8iland-J=C3=B8rgensen <tok=
e@redhat.com> wrote:
> > >
> > >> You have to check that you're not reading out of bounds before
> > >> dereferencing the bytes in the TCP header...
> > >>
> > >
> > > I have below before the optlen
> > >
> > >    47 /* sanity check needed by the eBPF verifier */
> > >
> > >     48 if ((void *)(tcphdr + 1) > data_end)
> > >
> > >     49 return 0;
> > >
> > > this is not enough, how do I check the out of bounds properly?
> > >
> >
> > options are optional and after 'struct tcphdr' you need to do something
> > like:
> >
> >    if ((void *)(tcphdr + 1) + tcphdr->doff > data_end)
> >        return XDP_....
