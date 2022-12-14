Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303CC64C471
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 08:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237576AbiLNHjK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 02:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbiLNHiy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 02:38:54 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8555C1AA28
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Dec 2022 23:38:44 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id tz12so19822579ejc.9
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Dec 2022 23:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0QePnOj5Wf1FVWjs+zwZXw9RnpB3idtSsHVHg4KWr0=;
        b=QzO+UrzsnIcfQoUAGLihCzYCOjsf51lllGac8FtmmRP9pZ2os8BdK0el3vNH783Qx9
         lOk7OUDA+3B6Y3TeNLMZrJ4suS8k4+ZDNiVne+RKC5YMq8u9v9Ku0HkrJDZtXalBwGyb
         pMUSru43gvh4wY522Xgm29y2NVk/VtHNaDmeamALW66c2E0d1+0TZreqXbkBYc6vHQY+
         gZ4JUeFlbqlb699Ynf65wxqBz04BCu+M/wxa8b6my3OcFNEHbjSxrt602rQXYxeb1UYl
         G5dhY6oKkamUw7QeydyULiMrt85HakEiGd3snJwevxLUyIkJ9LbWaEUxWwWieQsEAyO/
         XI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0QePnOj5Wf1FVWjs+zwZXw9RnpB3idtSsHVHg4KWr0=;
        b=BK6Ze639C6aCEF6fBLqZEuycYd+5Rs3DDiHAi8Cy0kQr4k0dBodq93ykEY1KTThgm3
         PjOrJFpBlxmyX11Qy/qFxBOPY9I/BOPlNc2/CXJBnzpWFVqCkgX2+xCrXCwp9lISI66t
         yjS8JbnNa2T1MklsMdCUip61g5PwfhrmBNtUuBjfH+fQUxxy7BMItsZTpmCqC97Jnjxe
         C7BjPlrAuGDhXwcwUGYb8imTNMeB3NUGKLuVLNKWi4nMv49XCIBrGD4/NY+Y7bBXiAII
         I7R2KsK17iypcJWwFkBNlY3yOFc+bokhuoAp+uxDJgKQockcDcZte9C2YI+kXXQ8rOu/
         nP1w==
X-Gm-Message-State: ANoB5pmEvTTEN9RrK4fola7wE/94lj/SnaOfF5lsqGbxYEMazFbxao5f
        lyy0+xKf9XLblFZ2VUe5aJk3Gstpu3gxEbt9zt9cRA7djZbRbA==
X-Google-Smtp-Source: AA0mqf7n72Na2F6Cta2gTe3HZHlbXdRJLPZtqhBL9m8vMpMdh8aKqQgXo3eT67qFxTIcgarBLlEqUc47z5fK3fZm2D0=
X-Received: by 2002:a17:906:6c91:b0:7c1:4c57:4726 with SMTP id
 s17-20020a1709066c9100b007c14c574726mr1241428ejr.488.1671003522992; Tue, 13
 Dec 2022 23:38:42 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com> <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
 <00931ED6-D940-491F-B6DA-BEE71F61A6F7@futurewei.com> <CAJ8uoz0f5dDAsPMwgKWQSPZuGYnSfU9Xz2jZVmdCeeWBZeiMfA@mail.gmail.com>
 <075DA44A-891D-415E-9F97-005F2D87967A@futurewei.com> <F570C31F-1C80-4238-B40D-BDEB4970F4D2@futurewei.com>
 <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com>
In-Reply-To: <5827E9AF-0DCE-490A-A6F8-F099E7446758@futurewei.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 14 Dec 2022 08:38:31 +0100
Message-ID: <CAJ8uoz1p4N8bh0xWcFHxsaCjLu=DFq--Uc2XpPt2_EV2WquBUw@mail.gmail.com>
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

On Tue, Dec 13, 2022 at 8:11 PM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
> It looks like that I didn=E2=80=99t include the mailing list in my previo=
us replies. I hope this one does.
>
> Also, for the AF_XDP-forwarding example, is it able to handle multiple AF=
_XDP sockets on the same NIC?

Yes.

> Such as:
>
> ```
> ./xdp_fwd -i IFA -q Q1 -i IFA -q Q2 -i IFA -q Q3 -i IFA -q Q4 -c CX -c CY
>
> ```
>
> If the above is doable, maybe I can have multiple queues, rather than hav=
ing one, on the same NIC, create one AF_XDP socket per queue, and then use =
this xdp_fwd example to achieve multi-threading?

That is the best way to do multithreading without having to resort to
expensive locking. One queue and socket per thread is the way to go.

> Thank you very much for your help and time.
> Rio
>
>
> From: Zhaoxi Zhu <zzhu@futurewei.com>
> Date: Monday, December 12, 2022 at 11:06 AM
> To: Magnus Karlsson <magnus.karlsson@gmail.com>
> Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF=
_XDP?
>
> Got it, thank you very much for your clarification.
>
> I have one more question, if I may: If one AF_XDP should be handled by on=
e thread, in order to avoid mutexes and to achieve better performance, then=
, can I have more than one AF_XDP socket on the same physical NIC, and use =
one thread per AF_XDP socket, in order to make process packets coming into =
this NIC concurrently?
>
> Currently, the way we are testing AF_XDP with is to have only 1 queue:
>
> ```
> sudo ethtool -L <interface> combined 1
> ```
>
> Can I change the number of queues to something like 4, and the user space=
 program,  have one AF_XDP socket per queue and one thread per AF_XDP socke=
t, in order to have four threads processing traffic coming into the same NI=
C?
>
> Thank you very much for your help and time.
> Rio
>
>
> From: Magnus Karlsson <magnus.karlsson@gmail.com>
> Date: Saturday, December 10, 2022 at 6:57 AM
> To: Zhaoxi Zhu <zzhu@futurewei.com>
> Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF=
_XDP?
>
> No, that is not possible without expensive mutual exclusion mechanisms. U=
ae one socket per thread instead.
>
> Magnus
> Le ven. 9 d=C3=A9c. 2022, 23:49, Zhaoxi Zhu <mailto:zzhu@futurewei.com> a=
 =C3=A9crit :
> Hi Magnust,
>
> Thank you very much for your reply and the link you provided.
>
> Do you think it is okay to have multiple threads for the same AF_XDP sock=
et? In the AF_XDP-forwarding example, it seems like that the same AF_XDP so=
cket is only handled by one thread. I wonder if that's okay for this AF_XDP=
-forward program to run like:
>
> ```
> ./xdp_fwd -i IFA -q QA -c CX -c CY
> ```
>
> So that we have two threads running on the same AF_XDP socket.
>
> Thank you again for your help.
> Rio Zhu
>
> On 12/8/22, 2:54 AM, "Magnus Karlsson" <mailto:magnus.karlsson@gmail.com>=
 wrote:
>
>     On Wed, Dec 7, 2022 at 11:54 PM Zhaoxi Zhu <mailto:zzhu@futurewei.com=
> wrote:
>     >
>     > Hi All,
>     >
>     > Thank you very much for reading this email. My name is Rio.
>     >
>     > I recently started looking into the XDP technology, especially AF_X=
DP, and I really love it. I started studying and modifying this AF_XDP exam=
ple(https://nam11.safelinks.protection.outlook.com/?url=3Dhttps://github.co=
m/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/af_xdp_user.c&data=
=3D05|01|zzhu@futurewei.com|a48e497c567c44334e3508dadabed0f9|0fee8ff2a3b240=
189c753a1d5591fedc|1|0|638062810350112528|Unknown|TWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=3D|3000|||&sdata=3DodDqj=
tTb0xvO+iz1o5qd2DjPi0K51dtocSxwBA41Yf4=3D&reserved=3D0) to meet my need, an=
d it has been working fine.
>     >
>     > However, one thing I notice is that this user space application is =
single threaded. I wonder if it is feasible to multi-threading to the RX/pa=
cket processing/TX parts of the program, in order to utilize other cores an=
d possibly make my application faster?
>     >
>
>     Please check out the AF_XDP-forwarding example in this repo:
>
>     https://nam11.safelinks.protection.outlook.com/?url=3Dhttps://github.=
com/xdp-project/bpf-examples&data=3D05|01|zzhu@futurewei.com|a48e497c567c44=
334e3508dadabed0f9|0fee8ff2a3b240189c753a1d5591fedc|1|0|638062810350112528|=
Unknown|TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0=3D|3000|||&sdata=3Dhwn1indUjoqf4hkLrb94sWeVc96az7jnsc/GyMAA4pM=3D&=
reserved=3D0
>
>     > One challenge I face now is, as I tried different places to add mul=
ti-threading, the program does not work properly. Symptoms such as `assert(=
xsk->umem_frame_free < NUM_FRAMES);` failed; ICMP ping packets doesn=E2=80=
=99t arrive destination until seconds later and TCP connection generated by=
 `iperf` cannot be established occurs as I tried different places to add mu=
lti-threading to my code.
>     >
>     > So, my question is, does AF_XDP applications support multi-threadin=
g during RX/packet processing/TX? If so, what is a proper way to modify the=
 AF_XDP example code to let it run properly?
>     >
>     > Thank you again for reading this email. I look forward to hearing f=
rom you.
>     >
>     > Best,
>     > Rio Zhu
>     >
>     >
>
