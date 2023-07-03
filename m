Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F75D74598C
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Jul 2023 12:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjGCKCD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Jul 2023 06:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjGCKB2 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Jul 2023 06:01:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F351982
        for <xdp-newbies@vger.kernel.org>; Mon,  3 Jul 2023 02:59:16 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc0981733so40271005e9.3
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Jul 2023 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688378355; x=1690970355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wKzviQWu9YcQIfUYhECoiCbozIPK5KHk59GElYF6yU=;
        b=FiFTa9Kbw3ldUuCzUU2mguuTvoNFe8eZD4mMVMP930jRnWH9WRpoVDBW/lV/XFEKQQ
         299543qfOGGY7hE+znTttnU241jaDwyl1aqSHwNBQTnoyZP7pYncMVjqH1mXHlkAxJhn
         OvqugP7rdaAuIoLbCBVPp+n0mQ4N3UEz7RGyw8ESpitApcGkyBxDtXK9nozaxAdnQZ+B
         i7X9zeZtjH3adfC9pgnAE7GH8KU70iSalNZxDu4tbzdqkQpeDAdo18O2E49HzKy1VCUP
         69/yXV6FzGIGmSbFYLpBUN9EZnd3OEH61F7ULDbRk4anrSH04yp7fgm6EwqyeuAM1B7Z
         kvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688378355; x=1690970355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wKzviQWu9YcQIfUYhECoiCbozIPK5KHk59GElYF6yU=;
        b=GaWSl8hmjkD5Sxb2DtSYWIz51Yy8+LLBn91Z34iNwn1kwIGtqJM0jymwDDSnr7eBTu
         wY98JXJsVvzEKWsOZIq0swg2ygfbFMHxSEBEEla6PTQg743V8jmkctbEwa6YtOkBzn9P
         b1s9VXk02rBOol8TyHwM4jfmGVChIpQs1XUxBb4wNQxBmePxq4m7QrRFyGqvT9LRP+qN
         e6KjMDs+EJ9P21C2/8M5IJH3M5ZnwvkFYvZuMEC9MEUpyV33Nld/F+8xd7VxDJWF/O8W
         I33fzgadE/b4EDnVZuliLeGfMDHjVAcKUQ9nG0wED+Fc+kW0+6lZeqP8Ioc0LyjKybgH
         kmjA==
X-Gm-Message-State: AC+VfDxFpjoPAf6tYOTzsHZN1/V5NK5G3ytuUfBhnXD83bbB+Fq04Hmm
        JlVFyECBI+hZxv942m9cbHgu7i3qRRSWTkZCgZ3T30b1WSI=
X-Google-Smtp-Source: ACHHUZ4+oEX4ThqVFM7iabaM4soOAGMdTq0d5/TVEtqONbAEQWMEk8a309didU5YsMV9HhDw/qHztcpssGPph4X3Cdo=
X-Received: by 2002:a05:600c:2906:b0:3fb:ba04:6d5d with SMTP id
 i6-20020a05600c290600b003fbba046d5dmr7624713wmd.12.1688378354931; Mon, 03 Jul
 2023 02:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <CANaGk7snu9tuzq=WxkUX48hpK-q2p_d=oLq-7Q6BcK_i4EiEPA@mail.gmail.com>
 <CAJ8uoz2iLFhY=jZRTR9+P14Qo_-GN34s7Cj8-zCO6Uvofovs+g@mail.gmail.com>
In-Reply-To: <CAJ8uoz2iLFhY=jZRTR9+P14Qo_-GN34s7Cj8-zCO6Uvofovs+g@mail.gmail.com>
From:   =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Date:   Mon, 3 Jul 2023 11:59:02 +0200
Message-ID: <CANaGk7tkiDwmD_18cE6TioRs0cO5F5bX4n1msU-YZnVopAO0cg@mail.gmail.com>
Subject: Re: possibility to fill completion queue from user space?
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thanks a lot Magnus

If I understand correctly, you mean creating some storage of free umem
addresses?
Something as:
https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/a=
f_xdp_user.c#L147
If so I did it and it works well, I just have to keep them separated per th=
read.

Regarding the new peek you mentioned, do you think such patch would be
meaningful even for
merging in libxdp? That would be a motivation for me to dive deep into it.
And would it be thread safe as I suppose?

One more question: can I use the poll() also for the Completion Queue?
It might be useful for me.

Best Regards
Julius

On Thu, Jun 29, 2023 at 8:32=E2=80=AFAM Magnus Karlsson
<magnus.karlsson@gmail.com> wrote:
>
> On Wed, 28 Jun 2023 at 20:26, J=C3=BAlius Milan <julius.milan.22@gmail.co=
m> wrote:
> >
> > Hi all
> >
> > I am writing an AF_XDP based user space application.
> > However in my use case, packets payload get fragmented while
> > processing, basically new packets are constructed inside and sent
> > further.
> > I probably cannot avoid mempcy anyway.
> >
> > So I plan to solve it simply - one umem per port, no locking, no
> > keeping track of umem frames presence (kernel / user space) . Just
> > usage of the rings, one half of the frames to circulate between the RX
> >  <-> fill queue, the other half TX <-> completion queue.
> >
> > Is it actually possible to initialize the rings in such a way that at
> > the very beginning I would fill the completion queue by some frames?
> > This is to avoid multithreaded access to the free frames without
> > locking (initial TX would take a look for free frames inside the
> > completion queue).
>
> You could fill the completion ring with entries from user space at
> initialization time. As long as you always pick the first entry in the
> completion ring before putting it on the Tx ring, the kernel would not
> overwrite your entries. One complication is that you would have to
> construct a new peek() routine for the completion queue, as the normal
> one would indicate no entries found even though you have written
> entries in it.
>
> Maybe an easier idea is to just have some code like this:
>
> /* Total N entries in Tx and completion ring.
>  *  allocated initialized to 0 somewhere */
> if (allocated < N) {
>     allocated++;
>     return N;
> }
> return next entry on completion queue;
>
> Returns the buffer number in the umem and assumes your Tx buffers are
> first in the umem. Though this scheme would introduce an if statement
> in the path, it would be easier to start with. You need an address not
> a number, and you likely also need some indication of "no buffer
> available". Tried to keep it simple.
>
>
> > If it's a bad idea, what else would you suggest?
> >
> > Thank you
> > Julius
