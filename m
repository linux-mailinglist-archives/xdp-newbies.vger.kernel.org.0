Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEBE5037AE
	for <lists+xdp-newbies@lfdr.de>; Sat, 16 Apr 2022 19:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbiDPRF1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 16 Apr 2022 13:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiDPRF0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 16 Apr 2022 13:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 297317EB14
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650128573;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ef5FSDvq6DLHr/756OVe32pqGS4Tej1giT9CXTJ7msE=;
        b=cplYr608SO8JXExIA+tyJe3bU5Z/zi3WX4wDnZus/kmjsiV2O+XB1o4HgRHOfBaSHitS5o
        FWkTzzKssi4dU/0OYBSmksanfGXCQGpgOJz272yp2qSyrogS5OdcndmT1ngvRA8GP7gQ14
        gbcRH/+uw0W799DO0eWG8wzxdSxIfmA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-2g20d3yoPnKadzdANeJ6tw-1; Sat, 16 Apr 2022 13:02:51 -0400
X-MC-Unique: 2g20d3yoPnKadzdANeJ6tw-1
Received: by mail-ed1-f72.google.com with SMTP id l24-20020a056402231800b00410f19a3103so6552550eda.5
        for <xdp-newbies@vger.kernel.org>; Sat, 16 Apr 2022 10:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ef5FSDvq6DLHr/756OVe32pqGS4Tej1giT9CXTJ7msE=;
        b=Thug5VD9ua7x89SNJOzNL2+PXN+VjLuukyDnXIPCPuSooQrAw/vJ+H5UyBkGnutoqC
         h9+ItCAAPGdOTmT2OgFGOG06+2+4SPIag6MQH0fnIRcFN0+I5lAK9eKcXpRhMD2pXBlt
         MDUE8LNd7Iz2oN6fYuCre9HPKaJaGgDcuNwT5EQTjK/21m5hTqnU2RvpbEcWkOFdytsW
         uthQC9qQ3IfVO4cxm07VzoOHD6+U3bUeCw8RQyKGvbowEroHr2psQQNGw9ZNIGdQ2iDo
         mlHVwZQwAfdQH6YvBgWfUXWiz+yDC+I/uUXgKWU+A+QOeXfcD+o/ihMxLdA0XET+/tg3
         bEqQ==
X-Gm-Message-State: AOAM5324juKDtyqMWNf6xLeCXXn4qawF6X0kqsV3x38y6JrmEewqKex8
        x9jrBu92UXG63HtSqENB5UtdNNaGpxJA1+51PQHdyP1brRXLgagJZb/mjbHOrL1jsnwCA3HWQEf
        +Mut71Y++TNdMhFPLvd9714E=
X-Received: by 2002:a17:906:4546:b0:6e8:873a:22a8 with SMTP id s6-20020a170906454600b006e8873a22a8mr3281733ejq.711.1650128570252;
        Sat, 16 Apr 2022 10:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcmsZ7EjY84wJzDowRqWTLiXtM/3eXXHeYI9qw92h3AC+Jdn4TJSVs6Lmq1Bml5wTPPfvypA==
X-Received: by 2002:a17:906:4546:b0:6e8:873a:22a8 with SMTP id s6-20020a170906454600b006e8873a22a8mr3281709ejq.711.1650128569902;
        Sat, 16 Apr 2022 10:02:49 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm4536854edd.33.2022.04.16.10.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 10:02:49 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E9C3C2BAFA6; Sat, 16 Apr 2022 19:02:47 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     ctxspi@gmail.com, xdp-newbies@vger.kernel.org
Subject: Re: XDP Redirect detail
In-Reply-To: <CAAVAo4MGusmZeW6eOsx8-Ph-dJRGYENQ-eKY7h0B=3TapQii5A@mail.gmail.com>
References: <CAAVAo4MGusmZeW6eOsx8-Ph-dJRGYENQ-eKY7h0B=3TapQii5A@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 16 Apr 2022 19:02:47 +0200
Message-ID: <87lew53qrs.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Marco <ctxspi@gmail.com> writes:

> Hi
>
> Can XDP_REDIRECT forward packets to egress interface with speed
> different than ingress interface?
>
> More precisely, if ingress interface speed is 100 Gbps and the egress
> interface speed is 10 Gbps, the xdp program can be load on two
> interfaces and forward traffic (using XDP_REDIRECT) between them?

Well, yes, it can forward packets just fine; but it'll just forward each
packet as it comes in, there's no mechanism for queueing or otherwise
rate limiting them. 10->100G is fine, of course, but in the other
direction, if you are receiving at 100Gbps line rate, you'll end up
forwarding 10 Gbps of it out the 10G interface and dropping the rest,
semi-randomly as the TX buffers overflow.

We're working on adding a  queueing mechanism to XDP to help with this,
but it'll probably be a little while yet before it surfaces...

-Toke

