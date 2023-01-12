Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DE0666E3C
	for <lists+xdp-newbies@lfdr.de>; Thu, 12 Jan 2023 10:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbjALJ3r (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 12 Jan 2023 04:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235627AbjALJ27 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 12 Jan 2023 04:28:59 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9420C42606
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Jan 2023 01:23:24 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id c17so25935555edj.13
        for <xdp-newbies@vger.kernel.org>; Thu, 12 Jan 2023 01:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhxAxdjPDPWT6GAm/SreSKE5e3PqdXTJlrMRn2EZsNY=;
        b=dASe3BUvQ0q8MOxHVQJLsW2+YmeUOw4BoHm+UJYNKqowhvgLltv4sP1L0PqD1UQiBo
         47tMfnGfxoez6l1eBn3t7qOa1M9k85aagXhNIeEpe5YiEDuPyprS4XiAfm67O5lSzVt+
         4uU6SErJo5rJSKZy2Z98oEOnL/AKEKkzcbOeMjQyVyIYlAS/Laeu+c8ghPw++pYinLqx
         jAiBNOETYZwlanMcZc/AeLG8k6K0/+3utaUDDfRYdK1AkiKByWmdH28qJDAUAemZV/eH
         dQg2Tp0vmtbFmfKSjQXfLB31org63YbXJI4sJ1yLriAbbn+J83+qudYUlpeZLH0WY89c
         gi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhxAxdjPDPWT6GAm/SreSKE5e3PqdXTJlrMRn2EZsNY=;
        b=5stZeEnzjq1qqhlueICLByOyi5tI4kwuApDNlDtpZSyfUMa10WR+mWWFNr0ZWZ+jWB
         DWowRE0iKUVGzeEvuO3Yrzs8FRepSAnjVH0lU92H9rV5Fy4f5rN+c1idHCaMNli5KPNt
         mZC7BiPSRYhvOpFgBZMQyKiTBTFHlcEzr8F18EagKpnY49JAZTBbc3qI5/9GO5Bfp/wq
         vpSDqhTpVfeYHfaVx/EP28z8yRb7nolyWT2t7mpYv29I/rliz1ztoe5u1Ibh1SyScdsC
         rt9JG0TQHi6Pqurb2bmBwRXeHj5/XG/j54RqUxjwGeEBSt1NBq8wC8BzykbjR4r+8AOq
         LndQ==
X-Gm-Message-State: AFqh2kqSOdBp8zixW8wJz/TVPcXuvwCLfCa9neBW+T3ut/NlkXPfc8nF
        1MtU5XJzRExc7vMzfjyMNFmADF2veW+B64Tm8IkllrflbyFmHegZzjQ=
X-Google-Smtp-Source: AMrXdXtBnrYepCccGq7UQCBbRlLFiv9GM5AAtucnROX9c9aUjyy/DakZ5f64qaCG5E6tRuURLBx+B0tFgItOXPxELtQ=
X-Received: by 2002:a05:6402:2408:b0:47b:2514:f2e7 with SMTP id
 t8-20020a056402240800b0047b2514f2e7mr9356574eda.142.1673515402868; Thu, 12
 Jan 2023 01:23:22 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com> <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
 <00931ED6-D940-491F-B6DA-BEE71F61A6F7@futurewei.com> <CAJ8uoz0f5dDAsPMwgKWQSPZuGYnSfU9Xz2jZVmdCeeWBZeiMfA@mail.gmail.com>
 <075DA44A-891D-415E-9F97-005F2D87967A@futurewei.com> <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
 <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com> <CAJ8uoz1p4N8bh0xWcFHxsaCjLu=DFq--Uc2XpPt2_EV2WquBUw@mail.gmail.com>
 <214B309B-E42A-4738-965F-840702B188A6@futurewei.com> <CAJ8uoz0B1gsCUV-3tjw2M52u3XH4UbXLVaxWTYri44shVKqBwQ@mail.gmail.com>
 <291F9412-8559-407D-91E1-CEAA69A2BDFC@futurewei.com> <CAJ8uoz0Yzt6FyH4X2nuNtdDd6N8Rs0C6QYWY=mmPFHrHDRyG9g@mail.gmail.com>
 <BF61942C-D793-44F4-A995-55D291DEC4A5@futurewei.com> <0B26B835-6532-4B37-B3DF-78766509A321@futurewei.com>
In-Reply-To: <0B26B835-6532-4B37-B3DF-78766509A321@futurewei.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 12 Jan 2023 10:23:10 +0100
Message-ID: <CAJ8uoz2oRGpmkxrGgDMWvXBOjRz7aEYDTsJhbLqoVsrkyaR4_g@mail.gmail.com>
Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
To:     Zhaoxi Zhu <zzhu@futurewei.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, Jan 11, 2023 at 8:03 PM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
> Just an update, and a few more questions:
>
> Both issues I mentioned in my last email is caused by my use and modifica=
tion of the original xsk_fwd.c program, I was able to mitigate this issue b=
y setting the umem_cfg_default->fill_size to be as same as umem_cfg_default=
->comp_size.
>
> After this change, my program runs fine and hasn't been stuck anymore. I =
don't think it is needed to submit a fix to the original xsk_fwd.c this tim=
e, since it looks more like a problem caused my myself using/modifying the =
program incorrectly.
>
> However, it would be greatly appreciated if you can please share the reas=
on for setting the derfault fill_size to be twice as the comp_size, it is n=
ormal to think that these two rings should have the same size.

The rule of thumb is that fill ring size should be double that of the
Rx ring size. Does not matter what completion and Tx ring are compared
to fill ring. If you follow this rule of thumb and always fill the
fill ring with buffers when you have the opportunity, you will not be
able to starve the driver of buffers in softirq mode. If you starve
the driver of buffers, performance gets lower and you will get packet
loss which likely decreases performance of your app even further.

> Also, I would like to raise a few more questions about the AF_XDP:
>
> 1) We have the XDP_ZEROCOPY flag for the port_params_default, do we need =
to set a similar flag for the umem_cfg_default, if we want to make the UMEM=
 rings(fill ring and completion ring) also support zero copy? What is a goo=
d way to check if zero copy is in use in my rings?

No need to do that. Use a getsockopt() and provide the option
XDP_OPTIONS to check if you are in zc mode. See
include/uapi/linux/if_xdp.h.

> 2) I noticed that the umem_fq doesn't need to wake up, and the txq needs =
to wake up, when I'm using the default umem and port parameters, is there a=
ny reasons behind that? What should I do if I also want to the umem_fq to w=
ake up(and do the poll())? I think I tried to set XDP_RING_NEED_WAKEUP for =
umem_cfg_default->flags, but it causes failure for UMEM creation.

Only the Rx and Tx ring uses the need_wakeup flag. You wake everything
up by acting on one of them.

> 3) Since the xsk_fwd.c code enabled us to use multi-threading for the AF_=
XDP sockets, are there any recommendations on how many threads should be ke=
pt for the AF_XDP socket, and how many threads to be reserved for the rest =
of the machine? One of my concerns is, if I assign all cores to AF_XDP sock=
ets, other codes in the machine would have no CPU resource left. I have see=
n my test machine crashed when I assigned all cores to the AF_XDP sockets.

The million dollar question :-). It all depends on what you are doing
with the rest of the system. To leave at least core 0 alone is always
a good idea.

> 4) Kind of related to question 3), do we know what core(s) the kernel XDP=
 program runs on? Are there any concerns that kernel XDP and AF_XDP runs on=
 the same core(s), and they would fight for resources? What is a good way t=
o make sure that both kernel XDP and AF_XDP sockets not fight for CPU resou=
rces?

The XDP program runs on the core you have bound your irq of that
netdev to. Default core_id =3D=3D queue_id for most NICs and not very
large servers.

> 5) Are there any relationship between the RX/TX queue interrupts, and the=
 AF_XDP sockets? Say I have these interrupts for my NIC that runs AF_XDP:
>
>             CPU0       CPU1       CPU2       CPU3       CPU4       CPU5  =
     CPU6       CPU7       CPU8       CPU9       CPU10      CPU11      CPU1=
2      CPU13      CPU14      CPU15      CPU16      CPU17      CPU18      CP=
U19      CPU20      CPU21      CPU22      CPU23
>   93:         22          0       3825          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099200-edge    =
  NIC-TxRx-0
>   94:          0          0         16          0          0          0  =
        0          0          0          0       2313          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099201-edge    =
  NIC-TxRx-1
>   95:          0          0          0          0         20          0  =
        0          0          0          0       2459          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099202-edge    =
  NIC-TxRx-2
>   96:          0          0          0          0          0          0  =
       16          0          0          0          0          0          0=
          0          0          0          0          0       4433         =
 0          0          0          0          0  IR-PCI-MSI 2099203-edge    =
  NIC-TxRx-3
>   97:          0          0          0          0          0          0  =
        0          0         16          0          0          0          0=
          0          0          0          0          0       3266         =
 0          0          0          0          0  IR-PCI-MSI 2099204-edge    =
  NIC-TxRx-4
>   98:          0          0          0          0          0          0  =
        0          0          0          0         22          0          0=
          0          0          0          0          0          0         =
 0          0          0       6788          0  IR-PCI-MSI 2099205-edge    =
  NIC-TxRx-5
>   99:          0          0          0          0          0          0  =
        0          0          0          0          0          0         16=
          0          0          0          0          0          0         =
 0          0          0       2116          0  IR-PCI-MSI 2099206-edge    =
  NIC-TxRx-6
>  100:       2498          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0         16          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099207-edge    =
  NIC-TxRx-7
>  101:       2493          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0         16          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099208-edge    =
  NIC-TxRx-8
>  102:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0       2527          0         25         =
 0          0          0          0          0  IR-PCI-MSI 2099209-edge    =
  NIC-TxRx-9
>  103:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0       3746          0          0         =
 0         26          0          0          0  IR-PCI-MSI 2099210-edge    =
  NIC-TxRx-10
>  104:          0          0          0          0          0          0  =
        0          0          0          0          0          0       2575=
          0          0          0          0          0          0         =
 0          0          0         18          0  IR-PCI-MSI 2099211-edge    =
  NIC-TxRx-11
>  105:          0         16          0          0          0          0  =
        0          0          0          0          0          0       2571=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099212-edge    =
  NIC-TxRx-12
>  106:          0          0          0         16          0          0  =
     2080          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099213-edge    =
  NIC-TxRx-13
>  107:          0          0          0          0          0         16  =
     2670          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099214-edge    =
  NIC-TxRx-14
>  108:          0          0       2715          0          0          0  =
        0         18          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099215-edge    =
  NIC-TxRx-15
>  109:          0          0       1503          0          0          0  =
        0          0          0         16          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099216-edge    =
  NIC-TxRx-16
>  110:          0          0          0          0          0          0  =
        0          0       1503          0          0         16          0=
          0          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099217-edge    =
  NIC-TxRx-17
>  111:          0          0          0          0          0          0  =
        0          0       1503          0          0          0          0=
         16          0          0          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099218-edge    =
  NIC-TxRx-18
>  112:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0       1503         16          0          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099219-edge    =
  NIC-TxRx-19
>  113:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0       1503          0          0         16          0         =
 0          0          0          0          0  IR-PCI-MSI 2099220-edge    =
  NIC-TxRx-20
>  114:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0          0          0          0         =
16       1503          0          0          0  IR-PCI-MSI 2099221-edge    =
  NIC-TxRx-21
>  115:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0       1503         16          0          0  IR-PCI-MSI 2099222-edge    =
  NIC-TxRx-22
>  116:          0          0          0          0       1503          0  =
        0          0          0          0          0          0          0=
          0          0          0          0          0          0         =
 0          0          0          0         16  IR-PCI-MSI 2099223-edge    =
  NIC-TxRx-23
>  117:          0          0          0          0          0          0  =
        0          0          0          0          0          0          0=
          0          0          0          1          0          0         =
 0          0          0          0          0  IR-PCI-MSI 2099224-edge    =
  NIC
>
>
> Should I be binding the AF_XDP sockets with the corresponding CPU of the =
above interrupt matrix? Say socket with iface_queue 0 binds to CPU 0 and CP=
U 2, the same CPUs of NIC_TxRx-0 interrupts?

Yes, that is a good idea if you do not want to change the default irq affin=
ity.

> This is a long post with many questions, thank you very much for reading =
this email and helping us.
> Zhaoxi Zhu
>
>
> =EF=BB=BFOn 12/30/22, 1:31 PM, "Zhaoxi Zhu" <zzhu@futurewei.com> wrote:
>
>     >On 12/29/22, 2:18 AM, "Magnus Karlsson" <magnus.karlsson@gmail.com> =
wrote:
>     >
>     >    On Thu, Dec 29, 2022 at 2:07 AM Zhaoxi Zhu <zzhu@futurewei.com> =
wrote:
>     >    >
>     >    >
>     >    >
>     >    > >> On 12/22/22, 1:38 AM, "Magnus Karlsson" <magnus.karlsson@gm=
ail.com> wrote:
>     >    > >>
>     >    > >>   On Thu, Dec 22, 2022 at 12:11 AM Zhaoxi Zhu <zzhu@futurew=
ei.com> wrote:
>     >    > >>   >
>     >    > >>    >
>     >    > >>    > >    On Tue, Dec 13, 2022 at 8:11 PM Zhaoxi Zhu <zzhu@=
futurewei.com> wrote:
>     >    > >>    > >    >
>     >    > >>    > >    > It looks like that I didn=E2=80=99t include the=
 mailing list in my previous replies. I hope this one does.
>     >    > >>    > >    >
>     >    > >>    > >   > Also, for the AF_XDP-forwarding example, is it a=
ble to handle multiple AF_XDP sockets on the same NIC?
>     >    > >>    > >
>     >    > >>    > >    Yes.
>     >    > >>    > >
>     >    > >>    > >    > Such as:
>     >    > >>    > >    >
>     >    > >>    > >    > ```
>     >    > >>    > >    > ./xdp_fwd -i IFA -q Q1 -i IFA -q Q2 -i IFA -q Q=
3 -i IFA -q Q4 -c CX -c CY
>     >    > >>    > >    >
>     >    > >>    > >    > ```
>     >    > >>    > >    >
>     >    > >>    > >    > If the above is doable, maybe I can have multip=
le queues, rather than having one, on the same NIC, create one AF_XDP socke=
t per queue, and then use this xdp_fwd example to achieve multi-threading?
>     >    > >>    > >
>     >    > >>    > >   That is the best way to do multithreading without =
having to resort to
>     >    > >>    > >    expensive locking. One queue and socket per threa=
d is the way to go.
>     >    > >>    > >
>     >    > >>    >
>     >    > >>    > Thank you so much for your reply and suggestions. I ma=
de changes following your suggestions and it partly worked!
>     >    > >>    >
>     >    > >>    > At the beginning, I copied the round robin logic of th=
e xdpsock_kern.c and put it in my XDP code, in the user space, I have the n=
umber_of_receving_queues of threads, which equals to the number of cores of=
 my machine(24), each have an AF_XDP socket for that queue, but none of the=
m are receiving packets. I added some logs to the rx_burst and found out th=
at they were all busy polling and the n_packets are always 0. I later chang=
ed the number of queues and threads to 4, and the results are the same. Wha=
t could be the reason that the round robin doesn't work?
>     >    > >>    >
>     >    > >>    > Then, I set the number of receiving queues to. 8, remo=
ved the round robin logic in the XDP code, simply forward the packet to the=
 ctx->rx_ueue_index of the xsks_map; and used 8 threads in the userspace fo=
r the 8 queues, and it is now able to receive packets. However, when I trie=
d to increase the number of queue and threads to 16, none of the AF_XDP soc=
ket can receive packets again. Do you know what might be cause this? Is it =
because the number of queues and threads are too many?
>     >    > >>
>     >    > >>    There is not upper limit to the amount of queues and thr=
eads supported
>     >    > >>    in the AF_XDP code. Your NIC will likely have a limit on=
 the amount of
>     >    > >>    queues though.
>     >    > >>
>     >    >
>     >    > Thank you very much for your tips. After some debugging, I fou=
nd out that it is because of some bugs initiating the bcache, which results=
 in ports' pcache trading new slabs from the bpool.
>     >
>     >    Please submit this fix to the bpf-examples repo so other people =
can
>         benefit from it too.
>
>     Sure, let me verify it this also happens for the original xsk_fwd pro=
gram as well, if that's also the case, I would create an issue and submit a=
 PR for it.
>     >
>     >    > I fixed that and continued testing, my test is to run some ipe=
rfs to generate traffic that goes through these AF_XDP sockets.
>     >    >
>     >    > There is one interesting behavior: the iperf traffic runs fine=
 at the beginning. However, after some time, maybe 30 seconds or 1 minute, =
the traffic stopped and I didn't see any sockets rx/tx packets(I added some=
 logs there for debugging).
>     >    >
>     >    > The program didn't crash, it is as if there's no new traffic c=
oming to the sockets. However, if I stop the iperfs and give the sockets a =
break, say 1 or 2 minutes, and restart the iperfs, the sockets are usually =
able to rx/tx traffic again, until it doesn't.
>     >    >
>     >    > I wonder have you seen anything like this before? It feels lik=
e that I'm very close to having a fully running program, but I'm stuck at t=
his step and I can't figure out why.
>     >
>     >    Have not seen anything like this. TCP is sensitive to packet los=
s. Are
>     >    packets dropped in your test run?
>     >
>
>     I'm not sure if that's the case, is there a way to find out? Also, wh=
en the traffic stopped, it wasn't only stopped for TCP traffic, it seems to=
 stop for other traffics, such as ping. However, after a while, it would re=
cover and I would be able to do iperf/ping again.
>
>     One thing I find interesting is that, when there's only 1 or 2 iperfs=
 running at the same time, and each of them are getting ~3 to 4 Gbits/sec s=
peeds, the AF_XDP sockets tend to stop working at some point. However, if I=
 have a larger number of iperfs running, say 10, and each getting less spee=
d(a little less than 1 Gbits/sec), the AF_XDP sockets works without stoppin=
g. This behavior surprises me, as the combined traffic that the sockets nee=
ds to handle is more (9.X Gbits/second v.s 7.x Gbits/second),  but there's =
AF_XDP sockets works fine in my few tests. I guess I need to investigate mo=
re on this issue.
>
>     Another question I have is: In the xsk_fwd.c code, is there any reaso=
n why the port_params_default has the XDP_USE_NEED_WAKEUP, but the same fla=
g isn't set for the umem_cfg_default? I was debugging the traffic stopping =
issue, and I realized that the umem fill queue doesn't need to wake up, and=
 the tx queue does. I tried to add this XDP_USE_NEED_WAKEUP to the umem_cfg=
_default but it causes failure for creating umem. Is there any way to use t=
his flag for the umem queues, does it bring any performance benefits?
>
>     Thank you very much and happy new year to the community.
>     Rio
>
>     >    > Thanks again for your help.
>     >    >
>     >    > >>    > Another questions is, since I'm not using round robin =
in my XDP code, the traffic isn't distributed evenly among my queues, it se=
ems to me that 2 queues are always getting most of the traffic and the othe=
rs are getting very little:
>     >    > >>    >
>     >    > >>    > +------+--------------+---------------+--------------+=
---------------+
>     >    > >>    > | Port |   RX packets | RX rate (pps) |   TX packets |=
 TX_rate (pps) |
>     >    > >>    > +------+--------------+---------------+--------------+=
---------------+
>     >    > >>    > |    0 |         2113 |             1 |         2113 |=
             1 |
>     >    > >>    > |    1 |            0 |             0 |            0 |=
             0 |
>     >    > >>    > |    2 |            0 |             0 |            0 |=
             0 |
>     >    > >>    > |    3 |          568 |             0 |          568 |=
             0 |
>     >    > >>    > |    4 |         2590 |             1 |         2590 |=
             1 |
>     >    > >>    > |    5 |            0 |             0 |            0 |=
             0 |
>     >    > >>    > |    6 |            0 |             0 |            0 |=
             0 |
>     >    > >>    > |    7 |           85 |             0 |           85 |=
             0 |
>     >    > >>    > +------+--------------+---------------+--------------+=
---------------+
>     >    > >>    >
>     >    > >>    > I understand this is mainly because I don't have round=
 robin in my XDP code, but I wonder what decides which queue gets the traff=
ic? Also, if round robin works, does it mean that when a packet arrives in =
the XDP in queue x, and then be forwarded to an AF_XDP socket with queue y,=
 the packet will be copied, and zero-copy won't work in this case?
>     >    > >>
>     >    > >>    Your packet distribution among queues is decided by your=
 NIC and the
>     >    > >>    traffic it receives. It probably has RSS enabled by defa=
ult. You can
>     >    > >>    program the NIC flow steering rules using ethtool. If yo=
u want
>     >    > >>    something perfectly spread among the cores, you probably=
 want to have
>     >    > >>    a synthetic workload and enable explicit flow steering r=
ules to
>     >    > >>    achieve perfect control. Google some examples and experi=
ment without
>     >    > >>    using XDP, is my tip.
>     >    > >>
>     >    > >>    You cannot direct packets coming in on queue X to a sock=
et bound to
>     >    > >>    queue Y, this regardless if it is zero-copy mode or not.=
 You are
>     >    > >>    correct that this could be supported in copy-mode, but i=
t is not.
>     >    > >>
>     >    > >>    > Again, thank you very much for reading this and your h=
elp.
>     >    > >>    >
>     >    > >>    > Rio
>     >    > >>    >
>     >    > >>    > >    > Thank you very much for your help and time.
>     >    > >>    > >    > Rio
>     >    > >>    > >    >
>     >    > >>    > >    >
>     >    > >>    > >    > From: Zhaoxi Zhu <zzhu@futurewei.com>
>     >    > >>    > >    > Date: Monday, December 12, 2022 at 11:06 AM
>     >    > >>    > >   > To: Magnus Karlsson <magnus.karlsson@gmail.com>
>     >    > >>    > >    > Subject: Re: Is It Possible to RX/Process/TX pa=
ckets concurrently with AF_XDP?
>     >    > >>    > >    >
>     >    > >>    > >    > Got it, thank you very much for your clarificat=
ion.
>     >    > >>    > >    >
>     >    > >>    > >    > I have one more question, if I may: If one AF_X=
DP should be handled by one thread, in order to avoid mutexes and to achiev=
e better performance, then, can I have more than one AF_XDP socket on the s=
ame physical NIC, and use one thread per AF_XDP socket, in order to make pr=
ocess packets coming into this NIC concurrently?
>     >    > >>    > >    >
>     >    > >>    > >   > Currently, the way we are testing AF_XDP with is=
 to have only 1 queue:
>     >    > >>    > >    >
>     >    > >>    > >    > ```
>     >    > >>    > >    > sudo ethtool -L <interface> combined 1
>     >    > >>    > >    > ```
>     >    > >>    > >    >
>     >    > >>    > >    > Can I change the number of queues to something =
like 4, and the user space program,  have one AF_XDP socket per queue and o=
ne thread per AF_XDP socket, in order to have four threads processing traff=
ic coming into the same NIC?
>     >    > >>    > >    >
>     >    > >>    > >    > Thank you very much for your help and time.
>     >    > >>    > >    > Rio
>     >    >
>
>
