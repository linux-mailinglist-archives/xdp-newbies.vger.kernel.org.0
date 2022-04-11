Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A914FB514
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 Apr 2022 09:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239312AbiDKHlr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 11 Apr 2022 03:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbiDKHlr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 11 Apr 2022 03:41:47 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D266E4
        for <xdp-newbies@vger.kernel.org>; Mon, 11 Apr 2022 00:39:32 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id bo5so13877351pfb.4
        for <xdp-newbies@vger.kernel.org>; Mon, 11 Apr 2022 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hSr7KO+Vmqj08EMj04/21csKfKyYH3YLM5NBHIAUhbA=;
        b=gdW/IGgnmx6cLuCGcT6f9Ciis8RSvlCCRRfHrrtsHADFGE57CC31FWgRg/AWjSWD6J
         aWXFYV83LCfA4c7ysMYfGPPxtJgiZ/wr+KgCm8Qm3uFc2lgzG2F0CgdDHpcf7ien/K/7
         FSRL56qTyRahbSialZLvAwZyhXMzFc4it3L5eE13blayNP8qhaJUgPR5qATbhqNh2pCH
         OZl4HxJ073PD3QkTJqG9I2HODE8Vlk3c+tpe5jcECwggJKyKdql5m51qmd7PnS/MinRh
         AnUlobZtQxSGJGtabFu17xc+6NNItVpgXrS7kACLd9EJJ+L6gVMTP3p3ftwE8ZZU6svK
         typw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hSr7KO+Vmqj08EMj04/21csKfKyYH3YLM5NBHIAUhbA=;
        b=CTuNICGmcegX+Geou5GoH9USqkGFLjOZfjxQOkInMMIOu3afhh+kYE/3Igz6CuDv1A
         l82qcmYnBUD2/cq0LZUjxBtb1m/zhvjkUOZ+mrtRcMeYEvsv3B3prz2DN3uH4sjOpBiw
         hrcdefH/aBLTNcRdsnqk7/wrOwaRNAxVLdHPD6VkY4+hYg6eYwpaInMbg5m09vlHQAId
         SS2uCHPgSUFlAWuoxW5F40ZH4ktyWvOhQq9K6jRAbuVBXJQQ9LQW2yl/PAm1Beqv+YDA
         sJnh8Xl08Ih2ZyV2Q+BzDETcN8NkqOAfxgsIZ/y3Z5ZKhBh74qwHCYC+F4akxf2kpYVj
         7Dog==
X-Gm-Message-State: AOAM532AR0A1nkpmz8/js+WE+3Uyw+wzjHzLuuxPj2aa3cVCNHTmCM6y
        dDkwE+G6XmGpOs/5bUPFwuoQD1y7V4Akv2BrfUI=
X-Google-Smtp-Source: ABdhPJxXQJaypKL5LBztNYHXueCW7N6lkL4Ta1o7SgXrhgfungVOPPfp1VJicU2vld+S0Fi13ur8Wh0f+k1jtEO4FFk=
X-Received: by 2002:a05:6a00:1388:b0:505:9b0b:ba61 with SMTP id
 t8-20020a056a00138800b005059b0bba61mr10277549pfg.4.1649662772057; Mon, 11 Apr
 2022 00:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR10MB1558DC7F6B10FD08418EC505EAE99@DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM>
 <878rse8l8n.fsf@toke.dk>
In-Reply-To: <878rse8l8n.fsf@toke.dk>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 11 Apr 2022 09:39:21 +0200
Message-ID: <CAJ8uoz3pc2qdvhB3e91h4ZFEsHc2aG5NZApA22iaee2hKkk9sg@mail.gmail.com>
Subject: Re: Questions regarding AF_XDP (ETF, TX queue selection)
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     "Deric, Nemanja" <nemanja.deric@siemens.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Bezdeka, Florian" <florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Sat, Apr 9, 2022 at 3:00 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com> wrote:
>
> "Deric, Nemanja" <nemanja.deric@siemens.com> writes:
>
> > Dear XDP-newbies,
> >
> > I am Nemanja Deric, and I am working as a Researcher for Industrial
> > Networking Department of Siemens AG (Munich, Germany). Recently,
> > we have started looking into AF_XDP/XDP and its applicability for some
> > of our industrial use cases. Thus, we have a few questions about the
> > technology which we hope that this mailing list can help us clarify.
> >
> > If you believe that these questions are better suited for some other
> > mailing list or direct email contact, please let me know so that I can
> > contact the correct person/mailing list.
> >
> > ETF, Timestamping:
> > In comparison to AF_PACKET sockets AF_XDP sockets do not support
> > timestamping (SOL_TXTIME) yet. There seems no way to pass such
> > request or meta-information to the kernel / NIC. Is that correct? We
> > already heard about "xdp hints" but we have failed to get further
> > information like plans / roadmap / implementation state / ideas.
> > Any pointers where to look at?
>
> Your understanding is basically correct: there's currently no support
> for that kind of metadata in XDP at all (which extends to AF_XDP). The
> effort to fix that is xdp-hints, and timestamps are explicitly part of
> that. That's still work in progress; there's a mailing list dedicated
> to this that you may want to subscribe to (and feel free to send a
> message there indicating your interest!):
>
> https://lists.xdp-project.net/postorius/lists/xdp-hints.xdp-project.net/
>
> The closest you can get to a "progress report" is probably looking
> through the archive of that list.
>
> > TX queue selection:
> > AF_XDP sockets are always bound to a specific RX queue. Instead,
> > TX queues are "automatically" chosen by the kernel - TX is more or
> > less handled by NAPI. Correct? Has someone already thought about
> > TX queue selection? Any plans / roadmap / details according
> > implementation state available?
>
> +Magnus who may have an idea about this.

Tx queue id =3D Rx queue id if you create an AF_XDP socket with both Rx
and Tx. So if you bind to queue 2, you will receive any traffic that
is bound to that queue id on that socket and any packets sent on the
same socket will be transferred using queue id 2 (not any other
queue). This is true for both SKB mode (copy mode) and zero-copy mode.
Will this suffice for you? If not, please let me know of your
requirements.

The answer to the NAPI question depends on what mode you are running
in. In SKB mode the sending is done in process context and Tx
completion is performed in NAPI, just as it is with any regular
socket. In zero-copy mode, both the sending and completion are
performed in NAPI context. Note, that since SKB mode uses the regular
send path of the kernel, packet loss is possible. Though zero-copy
mode is guaranteed to have no packet loss, at least on all Intel
drivers.

/Magnus

> -Toke
>
