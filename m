Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F0F74D7FB
	for <lists+xdp-newbies@lfdr.de>; Mon, 10 Jul 2023 15:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbjGJNna (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 10 Jul 2023 09:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGJNna (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 10 Jul 2023 09:43:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07914D2
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 06:43:27 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-307d58b3efbso4382889f8f.0
        for <xdp-newbies@vger.kernel.org>; Mon, 10 Jul 2023 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688996605; x=1691588605;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xvIXFVrOcbgyCFvJr3XRaCY9PfDEzYUEvbAXFyWZShs=;
        b=ji7izm+jmYVDoUudoYrzlxDRRggKj7bzi+C9lnWVS5vRzuNHoa9vUWtGUovvuo+ks1
         fdJGvXn2YeM0beb7CKeNqVgoLden+f/Sbv+MHfbR3k6jKpbHn3A8UHz3ehRGodTruIa3
         l5bRF/wCELXthKow/+4zO6OKwmsS/RYq0yVog/T65kmcmZBvMaVm2yP/65mxXD73NvWI
         Ef2WnkbOSs0+fAA03AliXWZyWM+ebSYYEQ0CQOz5cuHITSQTNW+/Xxgzenh01j6AIbWW
         xrMSw/xKdbWZ61H+fXD6vfhYBuPXVkIxTKwfoAwTkeAa26QIqPgW8VB+kG5eO/I2thsK
         k/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688996605; x=1691588605;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvIXFVrOcbgyCFvJr3XRaCY9PfDEzYUEvbAXFyWZShs=;
        b=XL4md3+3jxRNHDJqluo1OIaWkFYVj+tEYcqlgLWxSbHoUgoY9CL2qiz+ChX1NAMsHp
         iRoPoU5fUAQYkwqOcjGlaTRopp4/lAn1w/QvPasPFl6N7f/6YhcUmy5c2gyJCaPjG/8R
         wKzYfj+bx0z+OvqNo46+Y9ABsWZ3ZPbmvybxFBXVUsd3sZub0wAzIw8JzV+yr2Q2J8rF
         ajcAKGBQE3KqnyIxh6zTk9F7qyEV0JmpUuNbwTVgwCFlEeiL26V2a/uu/xijVnlMPHG1
         GgPmbsMgHxAkpM8jEe2wtvbh8V1dHIpsspqtB8dfWpum11/BESx+owp2JiJOWkn5YxT9
         /DYw==
X-Gm-Message-State: ABy/qLbV2UcPjUw8yZxoYoUwZ/m/F6IwF4KGikfFVoAeHlWlOtv06f8Q
        Aiz97RPdeu1vtbjWHqRScKifyjonZjjOE4dT/1iPTvgHpiw=
X-Google-Smtp-Source: APBJJlH3aXPEWSoaFm7HL30u0k00tzvwhiIkQfkkwwTASXJCnIoZo2tiiEUXad38HXjoEKTqtKx/Vn/8V1QNle8twZw=
X-Received: by 2002:a5d:504d:0:b0:314:38e4:259f with SMTP id
 h13-20020a5d504d000000b0031438e4259fmr11088278wrt.37.1688996604789; Mon, 10
 Jul 2023 06:43:24 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Date:   Mon, 10 Jul 2023 15:43:13 +0200
Message-ID: <CANaGk7uNc171gmxH=NspPokePc+4eg2qg+jK+kVispnJcwRinA@mail.gmail.com>
Subject: thread safe, lock free AF_XDP setup
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all

I am missing a full understanding of what really is thread safe and
what is not, when using AF_XDP.

RX and TX operations look obvious as every xsk socket has its own RX
and TX rings and so I can have multiple threads, as long as they don't
try to use the same ring of the same socket concurrently, that's the
only limitation (Am I correct yet?). So I can have for example 1:1
mapping of thread to xsk socket to avoid locking.

However what about UMEM rings, i.e. Completion and Fill queue?
About ring operations as __peek, __reserve ..., it is written (for ex.
here: https://www.kernel.org/doc/html/latest/networking/af_xdp.html#rings),
that they are not thread safe.
So it seems that I should use mutex to access them.
But I can see in:
https://github.com/xdp-project/bpf-examples/blob/master/AF_XDP-forwarding/xsk_fwd.c#L526
That they are filled / drained without locking, how is it then?

Does it make a difference if the socket is created by
xsk_socket__create_shared or xsk_socket__create?

What is the limitation that cannot be broken, as I described it for RX
/ TX? (if correctly)

Best Regards
Julius
