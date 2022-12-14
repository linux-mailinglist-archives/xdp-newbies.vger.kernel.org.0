Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E6D64D032
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 20:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbiLNTqX (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 14:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237752AbiLNTqW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 14:46:22 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF7E186C3
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 11:46:21 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so47059686ejb.13
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 11:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiurjwUu0yoKFFVkOIAa6bQhXghvecVSZd/zpMif5Hg=;
        b=iouXpzXREoJGUdkFuWI4xN17IMIUpjsrrByHaPXN3xTxBdXaV6+fJD4oEa/ZTIKjpT
         gPdT4LJlc7tlKg1PLfsJ51t/I0Ldz63ErUeZq3AvHQH6ocoYZdTU2ys9GC8XEJDOLw0N
         Hdq7TGdXuAd40Lw8klVcGMDndUq44FE23PsMPIefbzCwuv0PFLIdJse8baQa0n75224E
         Rtz2pS42dMAJEgim3r2DS+vQNiIogmlej7dT3flqpjfA6Y6K9W40fh0aD9FnfOnLBH/0
         E9pw5nOP4meJ+fREGUtbIBMGMbQCcwoeoYqXtNPUs+U5rpGsedeG6k9I9XG4vGty7C4i
         wpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiurjwUu0yoKFFVkOIAa6bQhXghvecVSZd/zpMif5Hg=;
        b=2veCheZsJ1sz8iXl380ZcMZbx6F7DROQIcDJwKh+g+WvzAiMkRbsTEvc21oy5YAzCH
         4ZEbmj7jsL+57gu5WSdzhdErEKhlM2CgfXq6EtilMBIIACbPsoy2NbtvQZ2m3UT51Grz
         tJPi9lWFJQnfYzd19bPeJPif0le2/c22zLNf7B1IKDvnv3460QrViGGEOIMxIc0xUCjj
         2c32kfBpVLJDP4PfeoH/7Spml4KU8UONxBh2TAtwUeWFHtQxLjr0bkfS1r20HDgKlonV
         yGWPseitn2HXbINi6Wr2GWLCRRSiek3Q3rfGsr1QpThyxRnRU1OhxkLLnRaanmuPd9+u
         8Xcg==
X-Gm-Message-State: ANoB5pmvctAKwK1qOvrlgjwj2L0Lw/rzFNJqKmfhGDboQ4shTrxwQ6tu
        1te/twyqfxtG+EOC2LGtInwZgLZHCBi0Ejp8WCF+qwbgzgzFEQ==
X-Google-Smtp-Source: AA0mqf7PCTwSHfHt8urL2OC4fjEEmdr5cnz87v/y635ZEMgifvBCiD6cBtUrOuib1Nog1zMRPmf6Z6mq1eObbwuu/M4=
X-Received: by 2002:a17:906:3e5a:b0:7c1:19e1:50e6 with SMTP id
 t26-20020a1709063e5a00b007c119e150e6mr8242620eji.585.1671047179106; Wed, 14
 Dec 2022 11:46:19 -0800 (PST)
MIME-Version: 1.0
References: <4c094424-4ace-86a3-ffc9-0142b62b7d27@polito.it>
 <CAJ8uoz3bgtUGBAW7f7vcA7=mvg8fAz8PXvjbmoEuMKaoURkw+w@mail.gmail.com> <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
In-Reply-To: <62dd0cd8-e133-406e-7a2e-18435f92ffe3@polito.it>
From:   Andrey Slastenov <a.slastenov@gmail.com>
Date:   Wed, 14 Dec 2022 20:46:07 +0100
Message-ID: <CABYudaqpPuDxCrw4Vd14mgpAqzRp1SWKh=bQ_VviuRAwSAHwMA@mail.gmail.com>
Subject: Re: Why choosing AF_XDP (busy polling) over DPDK
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello everyone

Check out this short article about why XDP was chosen over DPDK. The
reasoning for this decision is also explained.

https://gcore.com/blog/how-we-use-regular-expressions-in-xdp-for-packet-fil=
tering/


BR, Andrey


=D1=81=D1=80, 14 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 16:20, Federico Pa=
rola <federico.parola@polito.it>:
>
> On 12/14/22 10:00, Magnus Karlsson wrote:
> > On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
> > <federico.parola@polito.it> wrote:
> >>
> >> Hello everyone,
> >> in a context in which all traffic is sent to user space, and the main
> >> concern is performance (so AF_XDP busy polling is the best candidate),
> >> is there a reason to choose AF_XDP instead of DPDK for packet I/O, giv=
en
> >> that the latter is still much faster?
> >
> > The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
> > The choice is do you want to use user-space drivers or kernel space
> > drivers. There are many pros and cons with both approaches. The two
> > main advantages of user-space drivers in DPDK are that they are faster
> > than their kernel counterparts and you get access to many NIC features
> > that are not available right now from user-space if you are using a
> > kernel driver. Kernel drivers, on the other hand, enables you to
> > deploy your application on any Linux system (from a certain version)
> > and does not force you into the strict execution model of DPDK (which
> > is what most people use with user-space drivers). Everything in Linux
> > is still usable and it is easy to have a system that mixes data-plane
> > processing with other types of workloads. If the only thing you care
> > about is max performance of a pure packet processing workload on a
> > system you have complete control over, the choice is easy: go with a
> > user-space driver and DPDK. If this is not your ultimate goal, then
> > XDP and AF_XDP might be something to consider.
> Thanks for your answer Magnus.
>
> - Concerning deploying an application on any Linux system, what could be
> the limitations of DPDK userspace drivers that AF_XDP doesn't have? The
> use of hugepages?
>
> - Concerning a system that mixes data-plane processing with other types
> of workloads, do you refer only to the capability of XDP to steer
> traffic either towards userspace with AF_XDP or let it proceed to the
> kernel? Or are there other features of DPDK userspace drivers that would
> impact this kind of system? Maybe the use of busy polling is too
> aggressive to share the CPU with other workloads?
>
> >
> > There are likely some good write-ups on the Internet about this.
> >
> > /Magnus
> >
> >> Best regards,
> >> Federico Parola


=D1=81=D1=80, 14 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 16:20, Federico Pa=
rola <federico.parola@polito.it>:
>
> On 12/14/22 10:00, Magnus Karlsson wrote:
> > On Wed, Dec 14, 2022 at 9:16 AM Federico Parola
> > <federico.parola@polito.it> wrote:
> >>
> >> Hello everyone,
> >> in a context in which all traffic is sent to user space, and the main
> >> concern is performance (so AF_XDP busy polling is the best candidate),
> >> is there a reason to choose AF_XDP instead of DPDK for packet I/O, giv=
en
> >> that the latter is still much faster?
> >
> > The choice is not AF_XDP vs DPDK, since DPDK can run on top of AF_XDP.
> > The choice is do you want to use user-space drivers or kernel space
> > drivers. There are many pros and cons with both approaches. The two
> > main advantages of user-space drivers in DPDK are that they are faster
> > than their kernel counterparts and you get access to many NIC features
> > that are not available right now from user-space if you are using a
> > kernel driver. Kernel drivers, on the other hand, enables you to
> > deploy your application on any Linux system (from a certain version)
> > and does not force you into the strict execution model of DPDK (which
> > is what most people use with user-space drivers). Everything in Linux
> > is still usable and it is easy to have a system that mixes data-plane
> > processing with other types of workloads. If the only thing you care
> > about is max performance of a pure packet processing workload on a
> > system you have complete control over, the choice is easy: go with a
> > user-space driver and DPDK. If this is not your ultimate goal, then
> > XDP and AF_XDP might be something to consider.
> Thanks for your answer Magnus.
>
> - Concerning deploying an application on any Linux system, what could be
> the limitations of DPDK userspace drivers that AF_XDP doesn't have? The
> use of hugepages?
>
> - Concerning a system that mixes data-plane processing with other types
> of workloads, do you refer only to the capability of XDP to steer
> traffic either towards userspace with AF_XDP or let it proceed to the
> kernel? Or are there other features of DPDK userspace drivers that would
> impact this kind of system? Maybe the use of busy polling is too
> aggressive to share the CPU with other workloads?
>
> >
> > There are likely some good write-ups on the Internet about this.
> >
> > /Magnus
> >
> >> Best regards,
> >> Federico Parola



--=20


Andrey Slastenov
Network Expert
CCIE #19983
Email:a.slastenov@gmail.com
