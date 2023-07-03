Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8F27459EC
	for <lists+xdp-newbies@lfdr.de>; Mon,  3 Jul 2023 12:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjGCKPD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 3 Jul 2023 06:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjGCKPC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 3 Jul 2023 06:15:02 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4714BC
        for <xdp-newbies@vger.kernel.org>; Mon,  3 Jul 2023 03:14:57 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-444c4e6ab29so224429137.0
        for <xdp-newbies@vger.kernel.org>; Mon, 03 Jul 2023 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688379297; x=1690971297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3THLmv+xWcSDBIhvZddyBAV8m8bsjzS0zSZwg+gIY=;
        b=pDqD7OE6av2W/CHRU5M+utB4ajV74Fnvw1rkkgA2ym0hlNKsUkz6kylq7O9QhTAYIO
         C46rr+l4uuozNeQMrJ6hbunsMPQKsO26RtsckBOV+W1QH3JjjNFHqHlfljRdHypA7bzh
         g64RitwPoXnkhPjbFV41JtAVER8mQDV471xsMDsbC6LahynX9NMKjSrlGjE5Yp531kx4
         nZRYiuLqjbxXVcidROSAhISZjklWRnZMWnhA989myk3LR6Q/sdtCbPMMd763nXd7M1NU
         v7HkAdxGBiOhiTKtujv1oYYO+uThPEbWR5bm/zI82VYXt9WmBsJJhDse48KcZN6F38f2
         gqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688379297; x=1690971297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk3THLmv+xWcSDBIhvZddyBAV8m8bsjzS0zSZwg+gIY=;
        b=bWjjmUrbAD94+/XRN+Jfgs17VQZ+cBRSwfCRg0F3BWYvA+HtGgADIXTkYmOks3eWHS
         3KxNujBBIgaCcdpMIKZ4VWKd3aVB3IXY9Sgv0dLwWiVxVF8AcWtVKnPPyK/AAMA1ww/P
         xt7ztJNzgymj9vG8NsS//vE0H2Z6T5gUjEXthdTPtVOnwXJeHGLv4R0/5lX+WlP+/t8Z
         5MPLdITB31wj5gGsn1Rm/7iNfvD8jywn2rGBbAocz2eZFnYOf7gxz+goT2JJmnkHmr51
         G/0wGoePQsmINi4GEILDNXBwVTJXOHfUAzu9XFHImSnz1MMNDhNK03ctkx8XpsjyBiSk
         tuog==
X-Gm-Message-State: ABy/qLbD5eIbWNKArZv4xWvNLcB9SrnygXeiggfHS1CtLXjvX+KXu7A9
        PdQqvce5okJ67nw+hR0NqgAwQI5d32LkPChbo6Ap8zDFzAI=
X-Google-Smtp-Source: APBJJlG/fLuHvnUVAylIXTk2nKlYbVNuB2qfdCLaZM5fqzcwuBz+P0wARCA6/A3BJWidSq4IU/s9tKXigksIBZccO04=
X-Received: by 2002:a05:6102:3c95:b0:443:62fe:6f3b with SMTP id
 c21-20020a0561023c9500b0044362fe6f3bmr4041940vsv.0.1688379296869; Mon, 03 Jul
 2023 03:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANaGk7snu9tuzq=WxkUX48hpK-q2p_d=oLq-7Q6BcK_i4EiEPA@mail.gmail.com>
 <CAJ8uoz2iLFhY=jZRTR9+P14Qo_-GN34s7Cj8-zCO6Uvofovs+g@mail.gmail.com> <CANaGk7tkiDwmD_18cE6TioRs0cO5F5bX4n1msU-YZnVopAO0cg@mail.gmail.com>
In-Reply-To: <CANaGk7tkiDwmD_18cE6TioRs0cO5F5bX4n1msU-YZnVopAO0cg@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Mon, 3 Jul 2023 12:14:45 +0200
Message-ID: <CAJ8uoz0mV2pAvCyJVH5cvckQDovC-q+sUCLMM5siKOrfT+m4Yw@mail.gmail.com>
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

On Mon, 3 Jul 2023 at 11:59, J=C3=BAlius Milan <julius.milan.22@gmail.com> =
wrote:
>
> Thanks a lot Magnus
>
> If I understand correctly, you mean creating some storage of free umem
> addresses?
> Something as:
> https://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP=
/af_xdp_user.c#L147
> If so I did it and it works well, I just have to keep them separated per =
thread.
>
> Regarding the new peek you mentioned, do you think such patch would be
> meaningful even for
> merging in libxdp? That would be a motivation for me to dive deep into it=
.
> And would it be thread safe as I suppose?

It would not be thread safe and I would not spend time trying to merge
it to libxdp since you are the only one in 5-years that have requested
something like this :-). You have a solution that works for you. Just
go on and focus on what you really would like to accomplish.

> One more question: can I use the poll() also for the Completion Queue?
> It might be useful for me.

This is not supported, but I can see the use of it. Wakeup when there
is a new entry in the completion queue I guess. This has been
requested by someone before, but not been implemented so far.

> Best Regards
> Julius
>
> On Thu, Jun 29, 2023 at 8:32=E2=80=AFAM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Wed, 28 Jun 2023 at 20:26, J=C3=BAlius Milan <julius.milan.22@gmail.=
com> wrote:
> > >
> > > Hi all
> > >
> > > I am writing an AF_XDP based user space application.
> > > However in my use case, packets payload get fragmented while
> > > processing, basically new packets are constructed inside and sent
> > > further.
> > > I probably cannot avoid mempcy anyway.
> > >
> > > So I plan to solve it simply - one umem per port, no locking, no
> > > keeping track of umem frames presence (kernel / user space) . Just
> > > usage of the rings, one half of the frames to circulate between the R=
X
> > >  <-> fill queue, the other half TX <-> completion queue.
> > >
> > > Is it actually possible to initialize the rings in such a way that at
> > > the very beginning I would fill the completion queue by some frames?
> > > This is to avoid multithreaded access to the free frames without
> > > locking (initial TX would take a look for free frames inside the
> > > completion queue).
> >
> > You could fill the completion ring with entries from user space at
> > initialization time. As long as you always pick the first entry in the
> > completion ring before putting it on the Tx ring, the kernel would not
> > overwrite your entries. One complication is that you would have to
> > construct a new peek() routine for the completion queue, as the normal
> > one would indicate no entries found even though you have written
> > entries in it.
> >
> > Maybe an easier idea is to just have some code like this:
> >
> > /* Total N entries in Tx and completion ring.
> >  *  allocated initialized to 0 somewhere */
> > if (allocated < N) {
> >     allocated++;
> >     return N;
> > }
> > return next entry on completion queue;
> >
> > Returns the buffer number in the umem and assumes your Tx buffers are
> > first in the umem. Though this scheme would introduce an if statement
> > in the path, it would be easier to start with. You need an address not
> > a number, and you likely also need some indication of "no buffer
> > available". Tried to keep it simple.
> >
> >
> > > If it's a bad idea, what else would you suggest?
> > >
> > > Thank you
> > > Julius
