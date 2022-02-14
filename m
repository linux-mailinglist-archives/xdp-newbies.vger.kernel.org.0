Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0ED64B59DD
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Feb 2022 19:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239150AbiBNS2t (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Feb 2022 13:28:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiBNS2t (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Feb 2022 13:28:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5799A55480
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644863320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ilqkkSNPZDRpqlHVwYKChic4cIQ92pVlPya8cSL49XE=;
        b=imGh31DZ0SxBPFYNEX5oucSU7S8rpAhkn7hEPib59VVsLQyWyoE3KXLgDD8ejgK+v843Va
        umWU427RDRmJrJggnzGK7jFS9Kzw2s7pPhPEmwyNpKK6eCtLcLwHqn4H+RDrFss89awKlp
        S2aNhZMB9ydzc7H2tl1HhtbzXxanJd0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-a_G-EZiIPbCQBcu83fg9RQ-1; Mon, 14 Feb 2022 13:28:38 -0500
X-MC-Unique: a_G-EZiIPbCQBcu83fg9RQ-1
Received: by mail-ed1-f71.google.com with SMTP id w18-20020a056402269200b00410b0a48d56so2995318edd.17
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 10:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=ilqkkSNPZDRpqlHVwYKChic4cIQ92pVlPya8cSL49XE=;
        b=nYTq8dOlp0N/pRPjIwxiFXbY4gqMp8hiCa1/oelVvhaObq4IAunjrlV7EkxYz+jJDa
         nCBHV7xMhbfJ9tPSt9T/7x6YXKUkrIVwDXyqbrYXnLGRmVRASfHw1ioBYRROJJlFCPiR
         fzxGkl0YHC3/ajNaqOfweoW8Qute1cwTb/eYKtH/h9cmxdYRsMgoj+sszShBHuzy/KfB
         +rujEpxJKuH2KxDMPVmU33MjWDyhmFaQm0SRO70Qj6ZLfkI2b1zccSHZheEhd8hkhJqB
         NdceHWJhgDBJ88NSgFh+GNZF7l/rtZDN3OZduHqz5xHIsdVveIChKrmpfR75+gIi2YIQ
         F8pg==
X-Gm-Message-State: AOAM532DceHUnMQz65RtxdVxBZDWVMV0d83XbpRuzEA/GDNSpZdpnnwC
        GTPjMXtlW3T5pRvTXI/W96Yo44COR0+2Lij1al9J/GLzJH4r3Paj1Qd5MGtVqpIMLbcZnVoQB8Q
        m+js8rsEld3lNuZje9Ne6/F4=
X-Received: by 2002:a05:6402:530b:: with SMTP id eo11mr51614edb.169.1644863315469;
        Mon, 14 Feb 2022 10:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxWGXwGUBtQWp34ibrJmpNyl0rHBclBdsE4a4gm3DgdBc0vGL0bHe90xbzg0qzCruDsIQ9QA==
X-Received: by 2002:a05:6402:530b:: with SMTP id eo11mr51354edb.169.1644863312787;
        Mon, 14 Feb 2022 10:28:32 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id q5sm10855825ejc.115.2022.02.14.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 10:28:32 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7FEBA12E296; Mon, 14 Feb 2022 19:28:31 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Sophia Yoo <sy6@princeton.edu>, xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
In-Reply-To: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 14 Feb 2022 19:28:31 +0100
Message-ID: <877d9x7168.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sophia Yoo <sy6@princeton.edu> writes:

> Hello,
>
> I am relatively new to BPF/XDP, and I=E2=80=99m currently trying to use a=
 TC
> egress program to redirect a packet back to ingress, where I have an
> XDP program attached. When the XDP program is attached in generic mode
> (XDP_SKB_MODE), the redirect occurs properly and the packet is seen on
> the ingress of the interface, but when the program is attached in
> native mode (XDP_DRV_MODE), the packet never redirects and is just
> seen exiting the interface, even though the return code of the
> redirect function is =E2=80=9Csuccess=E2=80=9D.

The difference between XDP generic and driver mode is that the generic
mode is hooked into the core networking stack whereas driver mode runs
in the driver as the very first thing after packets are physically
received from the network.

This also explains why what you're trying to do doesn't work: the TC
hook runs in the core networking stack, and when it does a redirect, the
packet does not actually pass through the network driver, it appears
further up in the stack, where only the generic XDP hook will see it.

So this has nothing to do with the support in the driver; XDP is simply
not suitable for what you're trying to do. Why are you trying to do this
in the first place? I.e., what's the higher-level use case here?

-Toke

