Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA15742066
	for <lists+xdp-newbies@lfdr.de>; Thu, 29 Jun 2023 08:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjF2GcN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 29 Jun 2023 02:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjF2GcM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 29 Jun 2023 02:32:12 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D5CB1
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Jun 2023 23:32:11 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-635e01eb981so826946d6.1
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Jun 2023 23:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688020329; x=1690612329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwHa9LzxbPGuex6LGom9OXvXiTWJX7AK1KdL85I1cPo=;
        b=d4DWoB6OZLU2m/3iNVYtFh4vXE31EaMtErUsD+rRQooGUag+ftkMJuemBL3hccGMUh
         aelFDiQzs6qla3Czd+HssDfn4FrdSbECfHVDBaswv4L4rJnzNw88/vmKrix+A0+6z+V2
         x5zbdjg6Wcs8kkbUlPiS6KQ9L9e+ANSfhynxn0sQWmGaD5tTBzBPz3yAhLLmaOlb/+Gd
         8+pYOzSo5UGP4zMzwIZ+KoJB5HB2bZjxUhOT7nZx/rB8gxAleGd5aOnRCWAf1FYMpJW6
         EB6jtHV/8RG/ocXeBlCOtU1vm+7Z6Pl/F2LDz0ZuPmVp6FiiB5Xzh8fi6PR3WIMaecyB
         7Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688020329; x=1690612329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwHa9LzxbPGuex6LGom9OXvXiTWJX7AK1KdL85I1cPo=;
        b=CXIi8eALxz/Bdb6iPxdeW/sV4ELYY4v01ILBOO/2JO5UZbAMhnxYxpGJDoenHQMriV
         4lpDCuoSnbPqM7cWkNjci3FZSqpQCcckzs9p7OGpRhEKoejDfgm7ackul2u+cosV7BBo
         QSUfFykdO5JG1D1hE0tAkmEwj5fgHBrrrzTusmmsn3lykuU8msib/yqYzA/LuFBRxIiu
         C/PXWTJt9VXZ5G4tewVzQJsUDeZ5Enj11qwk7dFFz/ihN18gMjxxIjy9CcpMWkLuzvFf
         Z0hQQkGQ+TRQyiHTYxV5UF+OaPDowAp7wkEcFOBcgLSMa+Q/+CN6DdsP8bUAaejdZta+
         aUSQ==
X-Gm-Message-State: AC+VfDwINNbqekmFMTOS35+IKfyGt5UchzimcQWR0rPNWG3bDC98K5wo
        9Tlgjx0Ukgya5CeUZKkr6UBuABxjG1j/J73jrKj27eqagCY=
X-Google-Smtp-Source: ACHHUZ7HSfhG7oU8gPCLgbStYIlk1OG5Tjmwc2jl5Qp+znwiTZgWTd4vYXDdTht3tZeWXPDhUMJzSbHn8mOmDrsVhUo=
X-Received: by 2002:ad4:5945:0:b0:625:aa48:e50f with SMTP id
 eo5-20020ad45945000000b00625aa48e50fmr43463338qvb.6.1688020329373; Wed, 28
 Jun 2023 23:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANaGk7snu9tuzq=WxkUX48hpK-q2p_d=oLq-7Q6BcK_i4EiEPA@mail.gmail.com>
In-Reply-To: <CANaGk7snu9tuzq=WxkUX48hpK-q2p_d=oLq-7Q6BcK_i4EiEPA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 29 Jun 2023 08:31:58 +0200
Message-ID: <CAJ8uoz2iLFhY=jZRTR9+P14Qo_-GN34s7Cj8-zCO6Uvofovs+g@mail.gmail.com>
Subject: Re: possibility to fill completion queue from user space?
To:     =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
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

On Wed, 28 Jun 2023 at 20:26, J=C3=BAlius Milan <julius.milan.22@gmail.com>=
 wrote:
>
> Hi all
>
> I am writing an AF_XDP based user space application.
> However in my use case, packets payload get fragmented while
> processing, basically new packets are constructed inside and sent
> further.
> I probably cannot avoid mempcy anyway.
>
> So I plan to solve it simply - one umem per port, no locking, no
> keeping track of umem frames presence (kernel / user space) . Just
> usage of the rings, one half of the frames to circulate between the RX
>  <-> fill queue, the other half TX <-> completion queue.
>
> Is it actually possible to initialize the rings in such a way that at
> the very beginning I would fill the completion queue by some frames?
> This is to avoid multithreaded access to the free frames without
> locking (initial TX would take a look for free frames inside the
> completion queue).

You could fill the completion ring with entries from user space at
initialization time. As long as you always pick the first entry in the
completion ring before putting it on the Tx ring, the kernel would not
overwrite your entries. One complication is that you would have to
construct a new peek() routine for the completion queue, as the normal
one would indicate no entries found even though you have written
entries in it.

Maybe an easier idea is to just have some code like this:

/* Total N entries in Tx and completion ring.
 *  allocated initialized to 0 somewhere */
if (allocated < N) {
    allocated++;
    return N;
}
return next entry on completion queue;

Returns the buffer number in the umem and assumes your Tx buffers are
first in the umem. Though this scheme would introduce an if statement
in the path, it would be easier to start with. You need an address not
a number, and you likely also need some indication of "no buffer
available". Tried to keep it simple.


> If it's a bad idea, what else would you suggest?
>
> Thank you
> Julius
