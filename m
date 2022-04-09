Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09814FA7E6
	for <lists+xdp-newbies@lfdr.de>; Sat,  9 Apr 2022 15:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241839AbiDINDG (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 9 Apr 2022 09:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241828AbiDINCx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 9 Apr 2022 09:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A9FE3D4A2
        for <xdp-newbies@vger.kernel.org>; Sat,  9 Apr 2022 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649509245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vJF0+cpTjbpD0ugkGwD+TLHjTXyWijUBqPscSgAtu/A=;
        b=ERYw3iqs0gvlfbKDLpsgXKlqaHtEoWEJv5UMPz8l20RVjJkM2avZBOhQk+57zH590x/FTJ
        ISCSlXq8Jm+lwL3efa02b764Tpplr/yn/Tub2BwjQFYH1a6eUy4BSWP58KaLVSv3FoyF0D
        cfJMIMVhqqIUfQk82h4NGMxXcAg87do=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-TNDyyj9ENQCFXH3ZaiPqzQ-1; Sat, 09 Apr 2022 09:00:43 -0400
X-MC-Unique: TNDyyj9ENQCFXH3ZaiPqzQ-1
Received: by mail-ej1-f72.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so5816984ejw.9
        for <xdp-newbies@vger.kernel.org>; Sat, 09 Apr 2022 06:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vJF0+cpTjbpD0ugkGwD+TLHjTXyWijUBqPscSgAtu/A=;
        b=3csCLhcZ8qVHSHilyW/e2kpfM9JWlLsREiEPrS8Lj2JX5kgXkpC/tc9lP+Mu6wAd30
         VuFn7ewdJRRLu/+6adiTgDsJNDqY6FswAbKI+jHezJwVCSU/Yn3aaZWwXjfdk+w0X2ze
         B7KZw0gfOBKsTzSU0EFIio04RD5RuorvwPu7NhH731djbo18Edxr07f0CucsN81KUrUF
         Y3PRBTHVbJAiyI1d7NaqOHHDqasBGp+cv5Cv1FhSciuY/eIjHUrBg9AT6juTeHnJ4b5p
         7vDO2ks0jprpiSAUuCtLYK6ySKBiGU3dmLYkr+xiyE6YFj02pLL4cw41roGzzkm0Fhnu
         ozFg==
X-Gm-Message-State: AOAM532ghA4Nnx/ptnCqtDcEKbsNxjjlh/tTk6v2vFRROY70TchCi3w1
        XJEzKfMi3PbVmg0siTLJmFzetlouOg1TT99MitH7zBCWA6zExSCDsZy1n33EQUlUbVkQN72goPG
        pcOoP4X1dSLrk1VRi66d1ANM=
X-Received: by 2002:a17:906:1ece:b0:6ce:e14:6d92 with SMTP id m14-20020a1709061ece00b006ce0e146d92mr22244035ejj.408.1649509242341;
        Sat, 09 Apr 2022 06:00:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8+FcQQnwXUH+6c5Jzg6ItzZiUqT2/7YULSOWiG6w+uZCBJEMrO8AkuW2k3vg2P/dNGpl0Sg==
X-Received: by 2002:a17:906:1ece:b0:6ce:e14:6d92 with SMTP id m14-20020a1709061ece00b006ce0e146d92mr22244011ejj.408.1649509241959;
        Sat, 09 Apr 2022 06:00:41 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id b25-20020a056402139900b0041904036ab1sm11828149edv.5.2022.04.09.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 06:00:41 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C0B2227551B; Sat,  9 Apr 2022 15:00:40 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     "Deric, Nemanja" <nemanja.deric@siemens.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     "Bezdeka, Florian" <florian.bezdeka@siemens.com>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Subject: Re: Questions regarding AF_XDP (ETF, TX queue selection)
In-Reply-To: <DB6PR10MB1558DC7F6B10FD08418EC505EAE99@DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM>
References: <DB6PR10MB1558DC7F6B10FD08418EC505EAE99@DB6PR10MB1558.EURPRD10.PROD.OUTLOOK.COM>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 09 Apr 2022 15:00:40 +0200
Message-ID: <878rse8l8n.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Deric, Nemanja" <nemanja.deric@siemens.com> writes:

> Dear XDP-newbies,
>
> I am Nemanja Deric, and I am working as a Researcher for Industrial 
> Networking Department of Siemens AG (Munich, Germany). Recently, 
> we have started looking into AF_XDP/XDP and its applicability for some 
> of our industrial use cases. Thus, we have a few questions about the 
> technology which we hope that this mailing list can help us clarify.
>
> If you believe that these questions are better suited for some other 
> mailing list or direct email contact, please let me know so that I can 
> contact the correct person/mailing list.
>
> ETF, Timestamping:
> In comparison to AF_PACKET sockets AF_XDP sockets do not support 
> timestamping (SOL_TXTIME) yet. There seems no way to pass such 
> request or meta-information to the kernel / NIC. Is that correct? We 
> already heard about "xdp hints" but we have failed to get further 
> information like plans / roadmap / implementation state / ideas. 
> Any pointers where to look at?

Your understanding is basically correct: there's currently no support
for that kind of metadata in XDP at all (which extends to AF_XDP). The
effort to fix that is xdp-hints, and timestamps are explicitly part of
that. That's still work in progress; there's a mailing list dedicated
to this that you may want to subscribe to (and feel free to send a
message there indicating your interest!):

https://lists.xdp-project.net/postorius/lists/xdp-hints.xdp-project.net/

The closest you can get to a "progress report" is probably looking
through the archive of that list.

> TX queue selection:
> AF_XDP sockets are always bound to a specific RX queue. Instead, 
> TX queues are "automatically" chosen by the kernel - TX is more or 
> less handled by NAPI. Correct? Has someone already thought about 
> TX queue selection? Any plans / roadmap / details according 
> implementation state available?

+Magnus who may have an idea about this.

-Toke

