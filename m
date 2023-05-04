Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964906F732B
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 May 2023 21:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjEDT3I (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 May 2023 15:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjEDT3H (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 May 2023 15:29:07 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50357AB4
        for <xdp-newbies@vger.kernel.org>; Thu,  4 May 2023 12:29:06 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1926e90d257so420293fac.0
        for <xdp-newbies@vger.kernel.org>; Thu, 04 May 2023 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames; t=1683228546; x=1685820546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYPKqsGycIobg6ULY6/He1jAD9SH3RQMQNJRdBFz5YQ=;
        b=VcL9b8LKsGvHjoG/ytgFQzuhvMZR0U8C8SyhaPhBDc+FlilbKGbVjCj3IQLj/OwR3d
         rIi6h0lpfYiM0EyTm3MXTurL0CTNn/V2jcFZInkKJ78aGcCDd7+k/G+BXTsCgJAf9zv/
         k6c7g1p1CjNq/FOa0xFkfOUIX7gzaU9HOJiNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683228546; x=1685820546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYPKqsGycIobg6ULY6/He1jAD9SH3RQMQNJRdBFz5YQ=;
        b=bpX+/eLma31+rn8AMJc6rE9iBLKFcOtvPnrqVkanFJ8itLYrDvrHEQkvMdLS+uhenf
         jKFEPgZc5tg+1ida/enzE9Fy6jJUfmhszZEefkFyIL/Vx9G+SnRW6he0qKWbqAUbMDdC
         T6poD4/0qdhbyGjMxiBG8w/hjG8bGyvjTiTIMma4m8jFCa9zcDN9a+tAVerNFfRq/23l
         xO0+HCIdpmBPNh4xm9CyV3+9Lowts4xQjkIik0n9PpnN2SmYHDuri9b/DmZk7Am9D6vP
         Ji0zdeqZDRci1H2LsNCdn2NZXBMiXTqYHN73ZBUMsdBxvASNPpcilK/KBHpErXZy8Wm/
         1ICw==
X-Gm-Message-State: AC+VfDxwgwAUEGvSd0+4rOsUUfTMpMTbn7hBHO+o1eKHSfoa9gk8VXSU
        Y1av2TWWI/pigPGFfEFUgs24stEoCH4nXtkf2td6RVeNdc0NGwQmB5Y=
X-Google-Smtp-Source: ACHHUZ46UbjxEM9jlJB4kS/j4abmp0og6FFBfsxU+0zbfNITsUT0cRKMqmRPfOpAMooB0yVxQxZMHg8fGlJWWqJOV44=
X-Received: by 2002:a05:6870:e3c7:b0:17a:b663:d440 with SMTP id
 y7-20020a056870e3c700b0017ab663d440mr1596403oad.42.1683228546061; Thu, 04 May
 2023 12:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com> <CA+t96KCemTbqamJezLJ0sn0nN8EUrYd365iLmmv10qEVrF1_bQ@mail.gmail.com>
 <CA+t96KBZiDLde7WvG9R95ENg8r0iQUVofe5jRWDpQmx+SnbabQ@mail.gmail.com>
In-Reply-To: <CA+t96KBZiDLde7WvG9R95ENg8r0iQUVofe5jRWDpQmx+SnbabQ@mail.gmail.com>
From:   Zvi Effron <zeffron@riotgames.com>
Date:   Thu, 4 May 2023 12:28:54 -0700
Message-ID: <CAC1LvL33F_U6Ktm3nvF=D3KpF487uO=CtotL6xM-3G_8Skr7oQ@mail.gmail.com>
Subject: Re: XDP-REDIRECT cpu affinity
To:     Sanjay Rao <srao@fastly.com>
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, May 4, 2023 at 11:28=E2=80=AFAM Sanjay Rao <srao@fastly.com> wrote:
>
> I am looking at the implementation of ndo_xdp_xmit() in
> mlx5/core/en/xdp.c (most other drivers also have similar
> implementations). This function is called for XDP-REDIRECT.
>
> int mlx5e_xdp_xmit(struct net_device *dev, int n, struct xdp_frame
> **frames, u32 flags)
> {
> ------
> ------
>
> sq_num =3D smp_processor_id();
> if (unlikely(sq_num >=3D priv->channels.num))
> return -ENXIO;
>
> --------
> }
>
>
> Doesn't this restrict all ports to be bound to the same CPUs via
> smp_affinity? In my setup, one port has CPUs 1-63 and the other has
> 65-127 for a 63 queue configuration. XDP_REDIRECT will fail because
> 65-127 will exceed the channel count. Is that by design, or am I
> missing something? We can find a similar implementation for the i40e
> driver as well.

We had previously brought this up for the i40e driver[0]. My take on the
resulting conversation is that this behavior being a bug, but there is no c=
lear
idea of how to solve it without introducing locks, which would be an
unacceptable performance hit.

>
> Regards,
> Sanjay

--Zvi

[0]: https://lore.kernel.org/xdp-newbies/CAC1LvL1NHj6n+RNYRmja2YDhkcCwREuhj=
aBz_k255rU1jdO8Sw@mail.gmail.com/
