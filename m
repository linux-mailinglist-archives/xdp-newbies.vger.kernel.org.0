Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF3D653D8F
	for <lists+xdp-newbies@lfdr.de>; Thu, 22 Dec 2022 10:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiLVJiS (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 22 Dec 2022 04:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbiLVJiR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 22 Dec 2022 04:38:17 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E1627924
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Dec 2022 01:38:15 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id m18so3590511eji.5
        for <xdp-newbies@vger.kernel.org>; Thu, 22 Dec 2022 01:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYHwZOQ1+Ps/8UN1j/ctCj0bdAFGbw6EyQDy9r7djnY=;
        b=KFLsaJ9mHetBFUjnFMeVurbjRhMnqP/VhFgUNLbXlpt7r4E4iFV8+pEaYPDnZRQvuV
         +KORfiPl/YTTUD9gkLWAfSKRmrfe4KQb6h6BbMijoawkWH0Ft53f9GhYp7phQUiIaE1W
         chvm0UUqIIloQZnDrvxNeZjK9qXK1BGI/pkye+v3TjRpoKI3arRg8cEqlo5Hea2S7AM/
         EYjcwRnQUhcmQguoM2G7lWNoK7DX+m3prpy8cJWg1WzCKlCeLRrEkbgx7L7PQYFxVAVt
         5AkDS5gDo26yyJ279Wri9y/Chz0aL+0+d4lkgXCesLJu2h/fIaq19HFnBOoOEBD2TLCv
         UebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYHwZOQ1+Ps/8UN1j/ctCj0bdAFGbw6EyQDy9r7djnY=;
        b=D1Vlo2b78kMFm7XblTDT+1UnJAM0U/dBiQOIGVzNmaJXzaElWZcn341jIoLFJPt2J7
         tzuYFyOrbD3kl3Kz4CscJXKn/B9fpE/pfleh8KxQ4/X/wzxz+DsPEdsO3IYMKyR2wT69
         LBmvKsVHwnTcgs3Myd0AI88PkPmKWNR3xY3cCcIWuREIhd0CJhjpJtsqGFCl8FcjxMjt
         sA6YkwScnzAcWlPhfV5zqsF9fazyCaEGslWO8r3jPb8IWD1u3lLHHuUGB2SnuFfri2Qx
         oMVzO6U3PROKQ7IonQUlT/uA4xwCp6DoHPmEq/EE0EQKa7nEeyFkFydz430uShrMPut4
         VIGw==
X-Gm-Message-State: AFqh2krU454dtxWIVvHDXLHqMHT5GXVKRlxuioSNdN8Ny07lu4lsy04s
        1DKqHQ5e6yzTRM2OXz0tMr7fXO6CmzYz7JzwtCh0nuH+TyK4gA==
X-Google-Smtp-Source: AMrXdXuXiEIoZCuB+zmyQAkyQB0517gtjkhL00VyY9JxIyGm6+cahWQIv+OqiXaAdvJJ7ktZIJ9gN+4OMcypxtDS8uE=
X-Received: by 2002:a17:907:b681:b0:828:7572:a6d5 with SMTP id
 vm1-20020a170907b68100b008287572a6d5mr305218ejc.137.1671701894034; Thu, 22
 Dec 2022 01:38:14 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com> <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
 <00931ED6-D940-491F-B6DA-BEE71F61A6F7@futurewei.com> <CAJ8uoz0f5dDAsPMwgKWQSPZuGYnSfU9Xz2jZVmdCeeWBZeiMfA@mail.gmail.com>
 <075DA44A-891D-415E-9F97-005F2D87967A@futurewei.com> <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
 <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com> <CAJ8uoz1p4N8bh0xWcFHxsaCjLu=DFq--Uc2XpPt2_EV2WquBUw@mail.gmail.com>
 <214B309B-E42A-4738-965F-840702B188A6@futurewei.com>
In-Reply-To: <214B309B-E42A-4738-965F-840702B188A6@futurewei.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 22 Dec 2022 10:38:02 +0100
Message-ID: <CAJ8uoz0B1gsCUV-3tjw2M52u3XH4UbXLVaxWTYri44shVKqBwQ@mail.gmail.com>
Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
To:     Zhaoxi Zhu <zzhu@futurewei.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Dec 22, 2022 at 12:11 AM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
>
> >    On Tue, Dec 13, 2022 at 8:11 PM Zhaoxi Zhu <zzhu@futurewei.com> wrot=
e:
> >    >
> >    > It looks like that I didn=E2=80=99t include the mailing list in my=
 previous replies. I hope this one does.
> >    >
> >   > Also, for the AF_XDP-forwarding example, is it able to handle multi=
ple AF_XDP sockets on the same NIC?
> >
> >    Yes.
> >
> >    > Such as:
> >    >
> >    > ```
> >    > ./xdp_fwd -i IFA -q Q1 -i IFA -q Q2 -i IFA -q Q3 -i IFA -q Q4 -c C=
X -c CY
> >    >
> >    > ```
> >    >
> >    > If the above is doable, maybe I can have multiple queues, rather t=
han having one, on the same NIC, create one AF_XDP socket per queue, and th=
en use this xdp_fwd example to achieve multi-threading?
> >
> >   That is the best way to do multithreading without having to resort to
> >    expensive locking. One queue and socket per thread is the way to go.
> >
>
> Thank you so much for your reply and suggestions. I made changes followin=
g your suggestions and it partly worked!
>
> At the beginning, I copied the round robin logic of the xdpsock_kern.c an=
d put it in my XDP code, in the user space, I have the number_of_receving_q=
ueues of threads, which equals to the number of cores of my machine(24), ea=
ch have an AF_XDP socket for that queue, but none of them are receiving pac=
kets. I added some logs to the rx_burst and found out that they were all bu=
sy polling and the n_packets are always 0. I later changed the number of qu=
eues and threads to 4, and the results are the same. What could be the reas=
on that the round robin doesn't work?
>
> Then, I set the number of receiving queues to. 8, removed the round robin=
 logic in the XDP code, simply forward the packet to the ctx->rx_ueue_index=
 of the xsks_map; and used 8 threads in the userspace for the 8 queues, and=
 it is now able to receive packets. However, when I tried to increase the n=
umber of queue and threads to 16, none of the AF_XDP socket can receive pac=
kets again. Do you know what might be cause this? Is it because the number =
of queues and threads are too many?

There is not upper limit to the amount of queues and threads supported
in the AF_XDP code. Your NIC will likely have a limit on the amount of
queues though.

> Another questions is, since I'm not using round robin in my XDP code, the=
 traffic isn't distributed evenly among my queues, it seems to me that 2 qu=
eues are always getting most of the traffic and the others are getting very=
 little:
>
> +------+--------------+---------------+--------------+---------------+
> | Port |   RX packets | RX rate (pps) |   TX packets | TX_rate (pps) |
> +------+--------------+---------------+--------------+---------------+
> |    0 |         2113 |             1 |         2113 |             1 |
> |    1 |            0 |             0 |            0 |             0 |
> |    2 |            0 |             0 |            0 |             0 |
> |    3 |          568 |             0 |          568 |             0 |
> |    4 |         2590 |             1 |         2590 |             1 |
> |    5 |            0 |             0 |            0 |             0 |
> |    6 |            0 |             0 |            0 |             0 |
> |    7 |           85 |             0 |           85 |             0 |
> +------+--------------+---------------+--------------+---------------+
>
> I understand this is mainly because I don't have round robin in my XDP co=
de, but I wonder what decides which queue gets the traffic? Also, if round =
robin works, does it mean that when a packet arrives in the XDP in queue x,=
 and then be forwarded to an AF_XDP socket with queue y, the packet will be=
 copied, and zero-copy won't work in this case?

Your packet distribution among queues is decided by your NIC and the
traffic it receives. It probably has RSS enabled by default. You can
program the NIC flow steering rules using ethtool. If you want
something perfectly spread among the cores, you probably want to have
a synthetic workload and enable explicit flow steering rules to
achieve perfect control. Google some examples and experiment without
using XDP, is my tip.

You cannot direct packets coming in on queue X to a socket bound to
queue Y, this regardless if it is zero-copy mode or not. You are
correct that this could be supported in copy-mode, but it is not.

> Again, thank you very much for reading this and your help.
>
> Rio
>
> >    > Thank you very much for your help and time.
> >    > Rio
> >    >
> >    >
> >    > From: Zhaoxi Zhu <zzhu@futurewei.com>
> >    > Date: Monday, December 12, 2022 at 11:06 AM
> >   > To: Magnus Karlsson <magnus.karlsson@gmail.com>
> >    > Subject: Re: Is It Possible to RX/Process/TX packets concurrently =
with AF_XDP?
> >    >
> >    > Got it, thank you very much for your clarification.
> >    >
> >    > I have one more question, if I may: If one AF_XDP should be handle=
d by one thread, in order to avoid mutexes and to achieve better performanc=
e, then, can I have more than one AF_XDP socket on the same physical NIC, a=
nd use one thread per AF_XDP socket, in order to make process packets comin=
g into this NIC concurrently?
> >    >
> >   > Currently, the way we are testing AF_XDP with is to have only 1 que=
ue:
> >    >
> >    > ```
> >    > sudo ethtool -L <interface> combined 1
> >    > ```
> >    >
> >    > Can I change the number of queues to something like 4, and the use=
r space program,  have one AF_XDP socket per queue and one thread per AF_XD=
P socket, in order to have four threads processing traffic coming into the =
same NIC?
> >    >
> >    > Thank you very much for your help and time.
> >    > Rio
> >    >
> >    >
> >    > From: Magnus Karlsson <magnus.karlsson@gmail.com>
> >    > Date: Saturday, December 10, 2022 at 6:57 AM
> >    > To: Zhaoxi Zhu <zzhu@futurewei.com>
> >    > Subject: Re: Is It Possible to RX/Process/TX packets concurrently =
with AF_XDP?
> >    >
> >    > No, that is not possible without expensive mutual exclusion mechan=
isms. Uae one socket per thread instead.
> >    >
> >    > Magnus
> >    > Le ven. 9 d=C3=A9c. 2022, 23:49, Zhaoxi Zhu <mailto:zzhu@futurewei=
.com> a =C3=A9crit :
> >    > Hi Magnust,
> >    >
> >    > Thank you very much for your reply and the link you provided.
> >    >
> >    > Do you think it is okay to have multiple threads for the same AF_X=
DP socket? In the AF_XDP-forwarding example, it seems like that the same AF=
_XDP socket is only handled by one thread. I wonder if that's okay for this=
 AF_XDP-forward program to run like:
> >    >
> >    > ```
> >    > ./xdp_fwd -i IFA -q QA -c CX -c CY
> >    > ```
> >    >
> >    > So that we have two threads running on the same AF_XDP socket.
> >    >
> >    > Thank you again for your help.
> >    > Rio Zhu
> >    >
> >    > On 12/8/22, 2:54 AM, "Magnus Karlsson" <mailto:magnus.karlsson@gma=
il.com> wrote:
> >    >
> >    >     On Wed, Dec 7, 2022 at 11:54 PM Zhaoxi Zhu <mailto:zzhu@future=
wei.com> wrote:
> >    >     >
> >    >     > Hi All,
> >    >     >
> >    >     > Thank you very much for reading this email. My name is Rio.
> >    >     >
> >    >     > I recently started looking into the XDP technology, especial=
ly AF_XDP, and I really love it. I started studying and modifying this AF_X=
DP example(https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgithub.com%2Fxdp-project%2Fxdp-tutorial%2Fblob%2Fmaster%2Fadvanced03-AF=
_XDP%2Faf_xdp_user.c&amp;data=3D05%7C01%7Czzhu%40futurewei.com%7Ceea3f6f57f=
7c420d4d2408dadda63b02%7C0fee8ff2a3b240189c753a1d5591fedc%7C1%7C0%7C6380660=
03311816136%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D6lmj2amKpz%2FURa0yO=
lY9BjTb7lpRT%2B%2FRZfEVEUdHOA0%3D&amp;reserved=3D0) to meet my need, and it=
 has been working fine.
> >    >     >
> >    >     > However, one thing I notice is that this user space applicat=
ion is single threaded. I wonder if it is feasible to multi-threading to th=
e RX/packet processing/TX parts of the program, in order to utilize other c=
ores and possibly make my application faster?
> >    >     >
> >    >
> >    >     Please check out the AF_XDP-forwarding example in this repo:
> >    >
> >    >     https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgithub.com%2Fxdp-project%2Fbpf-examples&amp;data=3D05%7C01%7Czzhu%40f=
uturewei.com%7Ceea3f6f57f7c420d4d2408dadda63b02%7C0fee8ff2a3b240189c753a1d5=
591fedc%7C1%7C0%7C638066003311816136%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sd=
ata=3DMihUfPys5vhGnNrQktOUyhiDn1nukOE8rfgS3rXUGaQ%3D&amp;reserved=3D0
> >    >
> >    >     > One challenge I face now is, as I tried different places to =
add multi-threading, the program does not work properly. Symptoms such as `=
assert(xsk->umem_frame_free < NUM_FRAMES);` failed; ICMP ping packets doesn=
=E2=80=99t arrive destination until seconds later and TCP connection genera=
ted by `iperf` cannot be established occurs as I tried different places to =
add multi-threading to my code.
> >    >     >
> >    >     > So, my question is, does AF_XDP applications support multi-t=
hreading during RX/packet processing/TX? If so, what is a proper way to mod=
ify the AF_XDP example code to let it run properly?
> >    >     >
> >    >     > Thank you again for reading this email. I look forward to he=
aring from you.
> >    >     >
> >    >     > Best,
> >    >     > Rio Zhu
> >    >     >
> >    >     >
> >    >
>
