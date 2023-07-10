Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20AA74D843
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jul 2023 15:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGJN51 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Jul 2023 09:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGJN50 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jul 2023 09:57:26 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05085D8
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 06:57:26 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7940dbf5b4aso314004241.1
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688997445; x=1691589445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O8CwbKWJYNc+hvH7ZhjjD5HGTKogtWhJRV7b176vNw=;
        b=KGbzReeQvKlB/10XvkLTxxFXgnnERbvz7oKDrWDkW/AwJDYHwSZ1iGbD8URvChoFoS
         5Mayt2WRqLWauWrjYXtSYkYap58/H3ajKyw4FMBH9jSXhPJKEADLTjU5YCrOSz2Sl+/5
         eq/eowKL299C50zB4FlqJ1G1KUQxNWUKYtSU0zXDPQ8aT4ewmxcKzDWYdgyFEGxprsS/
         JdZjkchpXKRxzDxd7emrMFRhzgfG0TC6ZxkUS9TTjqP71+Xh6RNxdi4RhOKEPW3BVCJB
         zfF+k6jsj68RS2OsRBpCwqQn6TiysaFFr2fUfuSPy1yV9brPgKHf5y9LBFautj40k0Yn
         K8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688997445; x=1691589445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O8CwbKWJYNc+hvH7ZhjjD5HGTKogtWhJRV7b176vNw=;
        b=WoduJQ4P630tf2dSY2iQMjuH9ybD/f4wUBzYxqM3ugkSUr/WcWc3JdbLe72mx4JgMD
         cN07ae1GQ+UIeoRsujcD9vu8GCKSRgg3bUN9Rqg1F7hdLZ/HtO5P0IvKDNx7x3qxb9v1
         9Y22qtnIJBznD9METDhKECCvaZG4nBfMe4SDEGSKaXBzR06bSUiCnpLoCfDOvk/JceUS
         bFGw574juLNhOXq/2518tynFJQTZOwiGqaqxntBhWcDN+3vVzAhkc07WqvYjnd6kZ4hv
         mWu4VggyB0r9SYtHvw5kPaoQbFw2ib5TgeR2ae1sRgyBFdxaoeBn11VlRKOY30Hv6NuR
         wf/g==
X-Gm-Message-State: ABy/qLbGAAjdEP9ezAIPPUBtHZf/bgeZrBoR1pAUgYsH2Ul8nyQ7N2jt
        hjUjTgqMnthVlIQx1o4Ypx6HPHwSUk94w0QSfmI=
X-Google-Smtp-Source: APBJJlG/SCikXSHqj0V2anMDSK6KBc6ehcW8ph6eA5s5+sK4WQO0zTUAUZ8Wdz17X94pJCUluj+rXs2ElO0IwFS/ePA=
X-Received: by 2002:a05:6102:1506:b0:443:7be5:4e51 with SMTP id
 f6-20020a056102150600b004437be54e51mr4140105vsv.3.1688997445072; Mon, 10 Jul
 2023 06:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANaGk7uNc171gmxH=NspPokePc+4eg2qg+jK+kVispnJcwRinA@mail.gmail.com>
In-Reply-To: <CANaGk7uNc171gmxH=NspPokePc+4eg2qg+jK+kVispnJcwRinA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 10 Jul 2023 15:57:13 +0200
Message-ID: <CAJ8uoz3YrC9W10rZM_qJivW51Ly+dBb5_UZ2jHgeFC4+1jzAww@mail.gmail.com>
Subject: Re: thread safe, lock free AF_XDP setup
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Mon, 10 Jul 2023 at 15:51, J=C3=BAlius Milan <julius.milan.22@gmail.com>=
 wrote:
>
> Hi all
>
> I am missing a full understanding of what really is thread safe and
> what is not, when using AF_XDP.
>
> RX and TX operations look obvious as every xsk socket has its own RX
> and TX rings and so I can have multiple threads, as long as they don't
> try to use the same ring of the same socket concurrently, that's the
> only limitation (Am I correct yet?). So I can have for example 1:1
> mapping of thread to xsk socket to avoid locking.

That is correct.

> However what about UMEM rings, i.e. Completion and Fill queue?
> About ring operations as __peek, __reserve ..., it is written (for ex.
> here: https://www.kernel.org/doc/html/latest/networking/af_xdp.html#rings=
),
> that they are not thread safe.
> So it seems that I should use mutex to access them.
> But I can see in:
> https://github.com/xdp-project/bpf-examples/blob/master/AF_XDP-forwarding=
/xsk_fwd.c#L526
> That they are filled / drained without locking, how is it then?

The documentation above mentions that there are two shared_umem modes:
one if you want to share the same netdev/queue_id and another one for
all the other cases. The forwarding example uses the latter which has
one fill ring and one completion ring per socket. So no locking
needed. The former only has one fill and completion ring pair per
umem, so you need to take care of mutual exclusion yourself in this
case.

> Does it make a difference if the socket is created by
> xsk_socket__create_shared or xsk_socket__create?

The former one sets the XDP_SHARED_UMEM flag. If you want to share the
umem between several sockets, you need to use this one.

> What is the limitation that cannot be broken, as I described it for RX
> / TX? (if correctly)
>
> Best Regards
> Julius
