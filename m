Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C72C658B9F
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Dec 2022 11:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbiL2KXv (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Dec 2022 05:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiL2KXV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Dec 2022 05:23:21 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0AC13F91
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Dec 2022 02:18:41 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id g1so11915540edj.8
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Dec 2022 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxp/WZUYDf4HyiYo7WBwVlYg/GurAYIqzL0DOunWIRk=;
        b=FQAtEfm/jqSMMbLncbJaU70adBuqTR89ZB6LwlS83wF1WdUL7asIZY4mFhhexsM/4Z
         h3Uy/cEeUNf4HpNM22b/tmJI0mBsGYLytOJF1ecig73Kgmvm2Ufi/p3OyE2zAnOXEB8r
         SOVPFo6hqQEOO8N3Ty6ob8yKAHXZ8xhOKYJHj6/tJEP8TWxUwmoNkLapukqD2Fz+rJAf
         MH41ycwnRSVG23+mS+XJxohnVtIDSITr4rvjOLbjN6WTo+zYTtNcdaux1oIrgE1vjNtQ
         BAbKfmeTcC0H7uH9p+qr58fK+Aj1hKnlQrT/Dy9JlpLoBsTq7LLjoXiqsJRhaS8G9Rh+
         T2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxp/WZUYDf4HyiYo7WBwVlYg/GurAYIqzL0DOunWIRk=;
        b=Gi5yZfFhDl1iPvNmTa0DqWCRg7/TjcftT4WPyju6XaAvYabrFIV3nFzFCm1eEOIW4K
         wydg+aJYKHaYZGXq71l1gvTtFqSU1c6H+CivElD+Dkc+9iY3NHBZY8yCgz1tcWDkYHG4
         qD/B2Wv/DjvXfqp0hOT8P/5ZzmKJhA17+PpuaG+G0Vgl1SiCy6HMDp/r/WzEp0+11Jt0
         LlKmEnh9h4SRCuRE1PPsPhhU4Zk1mBv4GGeggJ94zrWx+/5ypwbFaqfDma9CqFJTV/Bg
         KA0y5cwa/JgFn92SvqeNjke7E58/8xDgBDz6jmWCJ6ESyXM/acf6KEgDMWWdVQo7BFrl
         6pJA==
X-Gm-Message-State: AFqh2kosiD5BAV6X8FJrQE0Q/p08tTXMuRtDZljKcY0ukEsoUo1KvKHD
        ZMqbPIzFeVR5/oJGs+5xc+OLNHLuExphgPBRGuydeqFnTe8TDQ==
X-Google-Smtp-Source: AMrXdXvRG2Up0/PmYMv9IrUr88oyyOZ0cBjTrqj/wvamQUaBUeuP8ljZJJx8c+zbxvXjqm3bpwDf8PmBWZ+U432qtw4=
X-Received: by 2002:aa7:d7c8:0:b0:46c:d007:8642 with SMTP id
 e8-20020aa7d7c8000000b0046cd0078642mr2722017eds.348.1672309119806; Thu, 29
 Dec 2022 02:18:39 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com> <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
 <00931ED6-D940-491F-B6DA-BEE71F61A6F7@futurewei.com> <CAJ8uoz0f5dDAsPMwgKWQSPZuGYnSfU9Xz2jZVmdCeeWBZeiMfA@mail.gmail.com>
 <075DA44A-891D-415E-9F97-005F2D87967A@futurewei.com> <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
 <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com> <CAJ8uoz1p4N8bh0xWcFHxsaCjLu=DFq--Uc2XpPt2_EV2WquBUw@mail.gmail.com>
 <214B309B-E42A-4738-965F-840702B188A6@futurewei.com> <CAJ8uoz0B1gsCUV-3tjw2M52u3XH4UbXLVaxWTYri44shVKqBwQ@mail.gmail.com>
 <291F9412-8559-407D-91E1-CEAA69A2BDFC@futurewei.com>
In-Reply-To: <291F9412-8559-407D-91E1-CEAA69A2BDFC@futurewei.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 29 Dec 2022 11:18:26 +0100
Message-ID: <CAJ8uoz0Yzt6FyH4X2nuNtdDd6N8Rs0C6QYWY=mmPFHrHDRyG9g@mail.gmail.com>
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

On Thu, Dec 29, 2022 at 2:07 AM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
>
>
> =EF=BB=BF>> On 12/22/22, 1:38 AM, "Magnus Karlsson" <magnus.karlsson@gmai=
l.com> wrote:
> >>
> >>   On Thu, Dec 22, 2022 at 12:11 AM Zhaoxi Zhu <zzhu@futurewei.com> wro=
te:
> >>   >
> >>    >
> >>    > >    On Tue, Dec 13, 2022 at 8:11 PM Zhaoxi Zhu <zzhu@futurewei.c=
om> wrote:
> >>    > >    >
> >>    > >    > It looks like that I didn=E2=80=99t include the mailing li=
st in my previous replies. I hope this one does.
> >>    > >    >
> >>    > >   > Also, for the AF_XDP-forwarding example, is it able to hand=
le multiple AF_XDP sockets on the same NIC?
> >>    > >
> >>    > >    Yes.
> >>    > >
> >>    > >    > Such as:
> >>    > >    >
> >>    > >    > ```
> >>    > >    > ./xdp_fwd -i IFA -q Q1 -i IFA -q Q2 -i IFA -q Q3 -i IFA -q=
 Q4 -c CX -c CY
> >>    > >    >
> >>    > >    > ```
> >>    > >    >
> >>    > >    > If the above is doable, maybe I can have multiple queues, =
rather than having one, on the same NIC, create one AF_XDP socket per queue=
, and then use this xdp_fwd example to achieve multi-threading?
> >>    > >
> >>    > >   That is the best way to do multithreading without having to r=
esort to
> >>    > >    expensive locking. One queue and socket per thread is the wa=
y to go.
> >>    > >
> >>    >
> >>    > Thank you so much for your reply and suggestions. I made changes =
following your suggestions and it partly worked!
> >>    >
> >>    > At the beginning, I copied the round robin logic of the xdpsock_k=
ern.c and put it in my XDP code, in the user space, I have the number_of_re=
ceving_queues of threads, which equals to the number of cores of my machine=
(24), each have an AF_XDP socket for that queue, but none of them are recei=
ving packets. I added some logs to the rx_burst and found out that they wer=
e all busy polling and the n_packets are always 0. I later changed the numb=
er of queues and threads to 4, and the results are the same. What could be =
the reason that the round robin doesn't work?
> >>    >
> >>    > Then, I set the number of receiving queues to. 8, removed the rou=
nd robin logic in the XDP code, simply forward the packet to the ctx->rx_ue=
ue_index of the xsks_map; and used 8 threads in the userspace for the 8 que=
ues, and it is now able to receive packets. However, when I tried to increa=
se the number of queue and threads to 16, none of the AF_XDP socket can rec=
eive packets again. Do you know what might be cause this? Is it because the=
 number of queues and threads are too many?
> >>
> >>    There is not upper limit to the amount of queues and threads suppor=
ted
> >>    in the AF_XDP code. Your NIC will likely have a limit on the amount=
 of
> >>    queues though.
> >>
>
> Thank you very much for your tips. After some debugging, I found out that=
 it is because of some bugs initiating the bcache, which results in ports' =
pcache trading new slabs from the bpool.

Please submit this fix to the bpf-examples repo so other people can
benefit from it too.

> I fixed that and continued testing, my test is to run some iperfs to gene=
rate traffic that goes through these AF_XDP sockets.
>
> There is one interesting behavior: the iperf traffic runs fine at the beg=
inning. However, after some time, maybe 30 seconds or 1 minute, the traffic=
 stopped and I didn't see any sockets rx/tx packets(I added some logs there=
 for debugging).
>
> The program didn't crash, it is as if there's no new traffic coming to th=
e sockets. However, if I stop the iperfs and give the sockets a break, say =
1 or 2 minutes, and restart the iperfs, the sockets are usually able to rx/=
tx traffic again, until it doesn't.
>
> I wonder have you seen anything like this before? It feels like that I'm =
very close to having a fully running program, but I'm stuck at this step an=
d I can't figure out why.

Have not seen anything like this. TCP is sensitive to packet loss. Are
packets dropped in your test run?

> Thanks again for your help.
>
> >>    > Another questions is, since I'm not using round robin in my XDP c=
ode, the traffic isn't distributed evenly among my queues, it seems to me t=
hat 2 queues are always getting most of the traffic and the others are gett=
ing very little:
> >>    >
> >>    > +------+--------------+---------------+--------------+-----------=
----+
> >>    > | Port |   RX packets | RX rate (pps) |   TX packets | TX_rate (p=
ps) |
> >>    > +------+--------------+---------------+--------------+-----------=
----+
> >>    > |    0 |         2113 |             1 |         2113 |           =
  1 |
> >>    > |    1 |            0 |             0 |            0 |           =
  0 |
> >>    > |    2 |            0 |             0 |            0 |           =
  0 |
> >>    > |    3 |          568 |             0 |          568 |           =
  0 |
> >>    > |    4 |         2590 |             1 |         2590 |           =
  1 |
> >>    > |    5 |            0 |             0 |            0 |           =
  0 |
> >>    > |    6 |            0 |             0 |            0 |           =
  0 |
> >>    > |    7 |           85 |             0 |           85 |           =
  0 |
> >>    > +------+--------------+---------------+--------------+-----------=
----+
> >>    >
> >>    > I understand this is mainly because I don't have round robin in m=
y XDP code, but I wonder what decides which queue gets the traffic? Also, i=
f round robin works, does it mean that when a packet arrives in the XDP in =
queue x, and then be forwarded to an AF_XDP socket with queue y, the packet=
 will be copied, and zero-copy won't work in this case?
> >>
> >>    Your packet distribution among queues is decided by your NIC and th=
e
> >>    traffic it receives. It probably has RSS enabled by default. You ca=
n
> >>    program the NIC flow steering rules using ethtool. If you want
> >>    something perfectly spread among the cores, you probably want to ha=
ve
> >>    a synthetic workload and enable explicit flow steering rules to
> >>    achieve perfect control. Google some examples and experiment withou=
t
> >>    using XDP, is my tip.
> >>
> >>    You cannot direct packets coming in on queue X to a socket bound to
> >>    queue Y, this regardless if it is zero-copy mode or not. You are
> >>    correct that this could be supported in copy-mode, but it is not.
> >>
> >>    > Again, thank you very much for reading this and your help.
> >>    >
> >>    > Rio
> >>    >
> >>    > >    > Thank you very much for your help and time.
> >>    > >    > Rio
> >>    > >    >
> >>    > >    >
> >>    > >    > From: Zhaoxi Zhu <zzhu@futurewei.com>
> >>    > >    > Date: Monday, December 12, 2022 at 11:06 AM
> >>    > >   > To: Magnus Karlsson <magnus.karlsson@gmail.com>
> >>    > >    > Subject: Re: Is It Possible to RX/Process/TX packets concu=
rrently with AF_XDP?
> >>    > >    >
> >>    > >    > Got it, thank you very much for your clarification.
> >>    > >    >
> >>    > >    > I have one more question, if I may: If one AF_XDP should b=
e handled by one thread, in order to avoid mutexes and to achieve better pe=
rformance, then, can I have more than one AF_XDP socket on the same physica=
l NIC, and use one thread per AF_XDP socket, in order to make process packe=
ts coming into this NIC concurrently?
> >>    > >    >
> >>    > >   > Currently, the way we are testing AF_XDP with is to have on=
ly 1 queue:
> >>    > >    >
> >>    > >    > ```
> >>    > >    > sudo ethtool -L <interface> combined 1
> >>    > >    > ```
> >>    > >    >
> >>    > >    > Can I change the number of queues to something like 4, and=
 the user space program,  have one AF_XDP socket per queue and one thread p=
er AF_XDP socket, in order to have four threads processing traffic coming i=
nto the same NIC?
> >>    > >    >
> >>    > >    > Thank you very much for your help and time.
> >>    > >    > Rio
>
