Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306BC64D168
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 21:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiLNUlf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 15:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiLNUk6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 15:40:58 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0C9E53
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 12:40:40 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id k185so993461vsc.2
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 12:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqHiw9jmFLbLobiwJW8OfV5PSM9faUHAkHg03jrSMFI=;
        b=A7cBtrHv22/juAAs56ucn7HlRElpjguzTgS6N6GYs6fTX5fHh06fLxVNXx9ZOyABMe
         TAQLFbS4xpDgJWAbxl7XCPM4AoUP2wZLP4QBxuNSK11KHyas2x7ytqu6E42AlTaZhBE3
         41baZzeRRoIM0xfKEgnIUvUjg0j2xVZWESZfbjfEKH6TIWgLZ30CS4hD5j7eRLMKd4o6
         yBAQstjGVT4f+p2oWSIFHGICPW27vRuTCTxp128a2bOdI2WA7kybvdjKiyMt1XXlRrAd
         HR95YaB5SRXzX2LaTyi835UKYHNhatQNX4z1zOuyQKhA5Qsgm2WKgiQVXoq1E2JU+hb5
         yorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqHiw9jmFLbLobiwJW8OfV5PSM9faUHAkHg03jrSMFI=;
        b=NRU+jRqatt/Jha0aJINLcXVmkrE6js6gzbG7FEDglL9Oas3kzinKmyf2B16F0dkBVT
         ttd+DKQ0CPyMXMoQtIdYm5efnfgrFTd9KWSDRAhE7BlQPalHzvM8s80+ItZkca0MPRVS
         WX1U8AVRMz7t+t9us8brVg6XZIduTUQxQuuwp6pMy0R7TMRUxLoR3V3MpM7VXvyp+od9
         NmNNFug2k79lZa2ZTw7wtn5nAR6APfPvFJP8NcxdT7RF6OqtGSX55ApW8v4v4Sgf9cuH
         d0bqvOlpR7kJa+aut1C32LZ1Q+yHPmTDWiGjUyh1hFgMOgq+BCLTRErcCCVV7ZRAt7nN
         Zzzg==
X-Gm-Message-State: ANoB5pkkD2ljFW4aOnyufoH5gk87qzCDWUGkFvveURi5//ndVlr5WF9j
        NloUpF0lru1HhkyC18CuojiE1l/3m8SjLVpLdoiW5VTZlx8=
X-Google-Smtp-Source: AA0mqf4ACsKWr+kHL20XNVFLr4tLA0dgYPuKZ/MVO+RBUl/1rU0D9oRZzvAxk5Khq4pwdfRi3ySz5xlM3IjN82p1ivg=
X-Received: by 2002:a05:6102:3da2:b0:3b5:f9a:7fae with SMTP id
 h34-20020a0561023da200b003b50f9a7faemr1450246vsv.81.1671050439567; Wed, 14
 Dec 2022 12:40:39 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
In-Reply-To: <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
From:   Vincent Li <vincent.mc.li@gmail.com>
Date:   Wed, 14 Dec 2022 12:40:28 -0800
Message-ID: <CAK3+h2yda5-wN+-Dzj+QwcyaR__OeFaVenOhXWZ2+SJb4SbMKw@mail.gmail.com>
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

On Wed, Dec 7, 2022 at 2:54 PM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
> Hi All,
>
> Thank you very much for reading this email. My name is Rio.
>
> I recently started looking into the XDP technology, especially AF_XDP, an=
d I really love it. I started studying and modifying this AF_XDP example(ht=
tps://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/af_=
xdp_user.c) to meet my need, and it has been working fine.
>
> However, one thing I notice is that this user space application is single=
 threaded. I wonder if it is feasible to multi-threading to the RX/packet p=
rocessing/TX parts of the program, in order to utilize other cores and poss=
ibly make my application faster?
>
>
> One challenge I face now is, as I tried different places to add multi-thr=
eading, the program does not work properly. Symptoms such as `assert(xsk->u=
mem_frame_free < NUM_FRAMES);` failed; ICMP ping packets doesn=E2=80=99t ar=
rive destination until seconds later and TCP connection generated by `iperf=
` cannot be established occurs as I tried different places to add multi-thr=
eading to my code.
>
> So, my question is, does AF_XDP applications support multi-threading duri=
ng RX/packet processing/TX? If so, what is a proper way to modify the AF_XD=
P example code to let it run properly?
>

I used to use mTCP with DPDK https://github.com/mtcp-stack/mtcp, then
I thought why not mTCP on top of AF_XDP and I found this
https://github.com/mcabranches/mtcp, it is multi-thread and a learning
example, maybe we can exchange notes since I am learning AF_XDP too :)

> Thank you again for reading this email. I look forward to hearing from yo=
u.
>
> Best,
> Rio Zhu
>
>
