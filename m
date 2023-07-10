Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6871974D924
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jul 2023 16:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbjGJOjl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Jul 2023 10:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjGJOjk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jul 2023 10:39:40 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBAACC
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 07:39:39 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e5da79223so785234a12.1
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688999977; x=1691591977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFxysj7MdRrt5c0Djj42XZBp+A3quthuIDJQ4xI2l7g=;
        b=gBMLQ3NjVlQXQvZpnStN5EsZIZVImLHkWeBN8AlChSQi69RM2Kk1kNGcRCk8vW8ol8
         0NoYSXtgN509UqvfTJo4h/I+1EOaJxEI1JzBSG8GxrjaF2dZIwyWc22TYJmsGE5nMI5i
         q5tGR7BGK7N7LPlRBSKGoRMMcbJDBRPfFuoc/1hDtJsIYfdODqhEETVDSJzRjXtTlAZA
         gKEbq2sglz/DyQ7pGuulYsz96rfcofAHpV2mL2enhVp2NBojHFNUXPq6jhvAhJzu60Y6
         7IA8Fe+TPw32ONIIUbyeA2+6Y4aUI+5HsWEnLR4Wj5+eRPOO5iCuWuCfcTqwAgqBnCb/
         FdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999977; x=1691591977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFxysj7MdRrt5c0Djj42XZBp+A3quthuIDJQ4xI2l7g=;
        b=QbhTdsGJGyTNOV0nGKgYPylEBpU86aZk73N/PXDe1UpKFR829+cWEIWLsP5Q+bV0aS
         eSfUvlGsOxEyf4SI+ywN75VT0BpI1l+LYWaZYJWGJagk6eN198QK1dJJrKasojFIxe1f
         9CLSpUj7KHROQ0iiSF5u6AJguiqWnGvmbzTQ/c4u589jYS77ms05vyed+xnyxhGTxCeU
         IV7fh0GbOLG8hCXjK+eRZo/T28ASzjNcHbETC2w5saCyY5HNdNhcRL88mqxGTmOr1j6j
         tl/+Elo4l520e9ZSu4jJ/bB9ub3PfpW0yeZH76SLAEb7b8vRpUNxkyrdFztY9iYdpg+5
         PqTQ==
X-Gm-Message-State: ABy/qLZcRNABk+3LPJeydCNPNjjFuG5pGX7zaOopaBdPN+38vWtjcpgf
        V/CUIQuCZqUWouEQp7Gg2N9QS1FBtjW5qMar29hoiR6szCw=
X-Google-Smtp-Source: APBJJlGswmyj9SOn/Wuj6yidk1AGRMo7jMrsyw0yy/s6v/UO0/ZFIvdX97hiXFgrhvYKfJ0+14CUM5O4QH/mosQqCyo=
X-Received: by 2002:a05:6402:184e:b0:514:9929:1b01 with SMTP id
 v14-20020a056402184e00b0051499291b01mr11358307edy.8.1688999977368; Mon, 10
 Jul 2023 07:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANaGk7uNc171gmxH=NspPokePc+4eg2qg+jK+kVispnJcwRinA@mail.gmail.com>
 <CAJ8uoz3YrC9W10rZM_qJivW51Ly+dBb5_UZ2jHgeFC4+1jzAww@mail.gmail.com>
In-Reply-To: <CAJ8uoz3YrC9W10rZM_qJivW51Ly+dBb5_UZ2jHgeFC4+1jzAww@mail.gmail.com>
From:   =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Date:   Mon, 10 Jul 2023 16:39:25 +0200
Message-ID: <CANaGk7tV=uj1cm_xROj6HRH=D9BtstmXUu-8ZeGBrX8_LG+u6w@mail.gmail.com>
Subject: Re: thread safe, lock free AF_XDP setup
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks a lot Magnus

Now I fully understand.

Julius

On Mon, Jul 10, 2023 at 3:57=E2=80=AFPM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Mon, 10 Jul 2023 at 15:51, J=C3=BAlius Milan <julius.milan.22@gmail.co=
m> wrote:
> >
> > Hi all
> >
> > I am missing a full understanding of what really is thread safe and
> > what is not, when using AF_XDP.
> >
> > RX and TX operations look obvious as every xsk socket has its own RX
> > and TX rings and so I can have multiple threads, as long as they don't
> > try to use the same ring of the same socket concurrently, that's the
> > only limitation (Am I correct yet?). So I can have for example 1:1
> > mapping of thread to xsk socket to avoid locking.
>
> That is correct.
>
> > However what about UMEM rings, i.e. Completion and Fill queue?
> > About ring operations as __peek, __reserve ..., it is written (for ex.
> > here: https://www.kernel.org/doc/html/latest/networking/af_xdp.html#rin=
gs),
> > that they are not thread safe.
> > So it seems that I should use mutex to access them.
> > But I can see in:
> > https://github.com/xdp-project/bpf-examples/blob/master/AF_XDP-forwardi=
ng/xsk_fwd.c#L526
> > That they are filled / drained without locking, how is it then?
>
> The documentation above mentions that there are two shared_umem modes:
> one if you want to share the same netdev/queue_id and another one for
> all the other cases. The forwarding example uses the latter which has
> one fill ring and one completion ring per socket. So no locking
> needed. The former only has one fill and completion ring pair per
> umem, so you need to take care of mutual exclusion yourself in this
> case.
>
> > Does it make a difference if the socket is created by
> > xsk_socket__create_shared or xsk_socket__create?
>
> The former one sets the XDP_SHARED_UMEM flag. If you want to share the
> umem between several sockets, you need to use this one.
>
> > What is the limitation that cannot be broken, as I described it for RX
> > / TX? (if correctly)
> >
> > Best Regards
> > Julius
