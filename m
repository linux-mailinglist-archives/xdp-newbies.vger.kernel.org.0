Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8D57BB6FB
	for <lists+xdp-newbies@lfdr.de>; Fri,  6 Oct 2023 13:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjJFLxJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 6 Oct 2023 07:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjJFLxJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Fri, 6 Oct 2023 07:53:09 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7E1C5
        for <xdp-newbies@vger.kernel.org>; Fri,  6 Oct 2023 04:53:07 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bc9353be9bso281007a34.1
        for <xdp-newbies@vger.kernel.org>; Fri, 06 Oct 2023 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696593187; x=1697197987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uWDRb3IrZtQKbZr7uq7Or7lyN+PJ27cD+lM7NdHyIM=;
        b=b11N/XA9z+G64+JDBjS+cOkNRG6D1wp/z4cmTJ37lq/nuLsjJh86k4IWtbHChXq7lv
         tmeU21N12fucmTNiFu5RWkOFUWrzmH2qQw9GTkJwXuX/REfRjwBqd99jqFk+/29OlGz2
         DBTo3aFKWGH/fh8qw75hKOyE9WIeL72i/fS+krCj5JquJyiwvNDo406q+S55wmSXuM6q
         uVAQ1elhu1mmVnKgg2ba9uHNSywub2ChsGK3RkCHfN3tNK6ik90gPizhsAyVt6v+b+lC
         paEtjt57yNMf/BTy61cB+mhZOrJ18rxaCNd5eHbwVmAPme7ZJnPSYpAqk+LQYxe0gZ9f
         dqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593187; x=1697197987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uWDRb3IrZtQKbZr7uq7Or7lyN+PJ27cD+lM7NdHyIM=;
        b=SI3N5nou+Y1rUEOq6FbGtd5G5Odi6GN9N2SG7HK/wxV1R0eaAKVLEFO2KrkwNwIKlM
         KGaSq+Z/ft9DFLNrlbGMz81j6QxG9Albcu/3AmLmaB2PKGa5GXBnyoz8XbTAfCtH3GI5
         4WOgbLijrAT+Z/jLQpsOLdOrXoqj7Wm9wdzg+ySGuposb2T0Q7DAlSNwhXnhGB5EL3ot
         04wLIKQp6cxSkCrhRcPAw869iWeq2/iQcS7GJsg4r3vl8wUC6s63uALG5pi2UCukUQIr
         jY1fYLiiMDVynmo7Ovntx4jKHto+8ROkyThbbFfdSys1q8lEJTXlAygyR1dN5t8jE9T1
         yfXA==
X-Gm-Message-State: AOJu0Yy6NzkE/i0eLdZflw4pEgwIYamiO2SQ3kk/2ZLkM+aHj/ugPPyG
        cRkbp9YGRgXsQDAmBtbeIGeUpSBdq0ZYfyFTkcNnCwLQjErfVA==
X-Google-Smtp-Source: AGHT+IHKdGZhKiFX9NeU1mvYw8WFanUkeH8AZSGWojA0j05BItcQqKYnFBcxLUoL7h2OkzakMrUCQblS8dsdiSKGxnA=
X-Received: by 2002:a05:6870:5250:b0:1be:ec3c:1ef with SMTP id
 o16-20020a056870525000b001beec3c01efmr8894791oai.0.1696593186949; Fri, 06 Oct
 2023 04:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
 <CAJ8uoz2j3u0L0aR+GiGLjSRqQJZSmvqseLWefE_ZmYHvq1t10w@mail.gmail.com>
 <CANzUK584muNbmyO8zKfQRKBRS0nSRHZ11fpK94rsvifOBLkpYA@mail.gmail.com>
 <CAJ8uoz37jD8bg6Ef7KgsZz4_yJRmejDe-LB2x6WBwnehkXqisg@mail.gmail.com> <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
In-Reply-To: <CANzUK5-Xz5swtaTRqxWVvFx5LwEMu0u2wFdHtCxrNznpAVwXtA@mail.gmail.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 6 Oct 2023 13:52:55 +0200
Message-ID: <CAJ8uoz3Hx4Kw6WzXCzS2LL=3sRuNZzToCv3d=dbGjj1iBPt-JA@mail.gmail.com>
Subject: Re: AF_XDP RX processing with NO rx-ring
To:     Srivats P <pstavirs@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 6 Oct 2023 at 13:41, Srivats P <pstavirs@gmail.com> wrote:
>
> On Thu, Oct 5, 2023 at 9:03=E2=80=AFPM Magnus Karlsson
> <magnus.karlsson@gmail.com> wrote:
> >
> > On Thu, 5 Oct 2023 at 17:18, Srivats P <pstavirs@gmail.com> wrote:
> > >
> > > On Thu, Oct 5, 2023 at 8:40=E2=80=AFPM Magnus Karlsson
> > > <magnus.karlsson@gmail.com> wrote:
> > > >
> > > > On Thu, 5 Oct 2023 at 16:31, Srivats P <pstavirs@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I want to clarify my AF_XDP understanding for a particular scenar=
io.
> > > > >
> > > > > Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
> > > > > single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring=
.
> > > > > Assume the NIC has only a single queue (to keep things simple for
> > > > > explaining this scenario).
> > > > >
> > > > > There is a XDP program attached to Queue 0 which does either a
> > > > > XDP_DROP or XDP_PASS for all Rx packets.
> > > > >
> > > > > We are running in Driver mode.
> > > > >
> > > > > What happens to RX packets received on Queue 0?
> > > > >
> > > > > Here's my understanding -
> > > > >
> > > > >  * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx=
 Ring
> > > > > for queue 0
> > > > >  * The NIC Rx Ring for queue 0 is populated by the driver with UM=
EM
> > > > > buffers taken from the Fill ring
> > > >
> > > > In driver mode (i.e. not zero-copy mode) this will not happen. The
> > > > ring will be populated by kernel buffers.
> > >
> > > What is the behaviour in zero-copy mode?
> >
> > Then the behaviour is according to what you wrote above. Just note
> > that nothing will be returned in the fill ring as you are not sending
> > anything to the AF_XDP socket.
>
> I assume you meant "Rx Ring" and not "Fill ring" above?

Yes, sorry. Nothing will arrive in the Rx ring, and the Fill ring will
not be used apart from the initial burst of buffers that will be
grabbed by the system. Note though that you have to provide some
buffers in the fill ring as these are the ones that are used by the
NIC in zero-copy mode. They are just never returned to user-space
through the Rx ring. They are just recycled in the driver so the
system never needs to grab more in your scenario.

> >
> > > >
> > > > >  * A Rx packet will be received in the NIC Rx Ring for Queue 0 fi=
rst
> > > > >  * The driver will run the XDP program on the Rx packet buffer (a=
 UMEM buffer)
> > > > >  * If the program results in XDP_DROP, the driver will "free" the=
 Umem
> > > > > buffer by putting it on the Completion Ring
> > > > >  * If the program results in XDP_PASS, the driver will allocate a
> > > > > standard Linux kernel SKB, copy the packet buffer contents into t=
he
> > > > > SKB and queue it up for standard netdev processing; It will then
> > > > > "free" the RX Umem buffer by putting it on the Completion Ring (s=
ince
> > > > > we have already copied packet into the skb)
> > > >
> > > > As the buffers are kernel buffers, user-space will not be notified.
> > > > The completion ring is solely for the Tx path, saying that user spa=
ce
> > > > can have the buffer back.
> > > >
> > > > The rest is correct.
> > > >
> > > > /Magnus
> > > >
> > > > > Is this understanding correct or am I mistaken anywhere?
> > > > >
> > > > > Thanks in advance,
> > > > > Srivats
