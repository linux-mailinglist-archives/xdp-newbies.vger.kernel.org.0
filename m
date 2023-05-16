Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EF670467A
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 May 2023 09:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjEPHdW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 16 May 2023 03:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjEPHdV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 16 May 2023 03:33:21 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5A344B6
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 00:33:20 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6aaef8ca776so4141171a34.2
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684222400; x=1686814400;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4WRoKgHk8OfyK8/kj5takTeL9RvQ2tcS+BnbRD8Hm8Y=;
        b=FG8QAACwIFJhaEqrQKclVmZFW1ysMaGEgFSDkbpxMjUZRHQ241A4I25YlRwuA7dJLF
         AMQIOMC+AytVGSUJOcgpbZtSxoNzFLkACDK3PT/X2JMg8BR2WP9MP5fs9oaPmvV/AE4/
         4olbKobPN7LcnB4C3s3qQrj0ABqpfy+Fi3pOm5PCQ5eLKGCOshdigiCewKcQzHi0jvfw
         YBSutNiCsrxFqd0R8qvSSfJgwFjO/xAsDvg7r6yPhBynVjwB14lrfnrbDdbVT8qB/lG2
         QlwqrE9rAM0I4Pg7NyuRaSYnr5Tia9/BeKvHHz7Fs67ftop4dDble9RE0KFp0qcLyYbf
         QKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684222400; x=1686814400;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WRoKgHk8OfyK8/kj5takTeL9RvQ2tcS+BnbRD8Hm8Y=;
        b=gX6ZOZZKdxKnZi4OBbjtMs9cNdYvpjlLKrn9rLPvAiwUkLtSEhvS/5Fu82/BEoKKiz
         3PCh/NPN0rzv4wP2A6EwMuwbzhS/iFleGnPSlW2hbRr3pZoGMDy9obiJD2Fu8QCCXMFd
         cxdqT/Cc9Jxx7Ya/QOuSe51c31aG+gy1X8bQPz4JoqgbhClx2ob/zgHC3QWCwOxwHdMh
         VODFzKrNGB3FPtQSYv31l6iDbP5zMLx1pLo+cEwC8BLcMur4eNkpN4yLVLWVY7FGIMRE
         KKrXyr4J7WZF1CHuc6Ixu+6HPH6ufGnVJGJPXx4f+L3D63Fmp7C0+CqoKWp6uT7UL9m0
         8Ong==
X-Gm-Message-State: AC+VfDzF+39TflfFp/cwsSDWHBXMF+uTVCXJ4tLiCv9Cf/sHJPsz/YrD
        iQWzhSj9Iup6K0b3ZrQyhORlnoIHLTBctmYLgapytxVrWe7jHA==
X-Google-Smtp-Source: ACHHUZ5euT/w3C4QAtI9nRwTnPdafsXRtIpkMq2fKQ3g75sS5kgfzzb3bT6gfUXcT3euEXi1YYeXiDiGaLeHDsKu6ug=
X-Received: by 2002:a54:4694:0:b0:386:b953:d8f8 with SMTP id
 k20-20020a544694000000b00386b953d8f8mr9499076oic.37.1684222399876; Tue, 16
 May 2023 00:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
In-Reply-To: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Tue, 16 May 2023 10:36:33 +0200
Message-ID: <CAAVAo4Nn0KXWO49+PHea=fVuDFBXfEBVqQOqb9G4TtfJBX38rQ@mail.gmail.com>
Subject: Re: XDP redirect - ping fail
To:     team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I have not much experience with dhcp but ensure first that dhcp
packets are not blocked from the xdp program.
So as already mentioned, try pinging with zero payloads and check if
they get redirected.

Il giorno gio 4 mag 2023 alle ore 19:41 team lnx <teamlnxi8@gmail.com>
ha scritto:
>
> Hello,
>
> I see a ping not working in below topology with xdp redirect
>
>
> IFACE1 <--------->   IFACE2      IFACE3    <------------------> IFACE4
>
> IFACE2 and IFACE3 are on same host machine
>
> IFACE1 and IFACE2 are  on static ip
> IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server
>
> steps
> 1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
> 2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
> 3. Run xdp redirect on IFACE2 and IFACE3
> 4. start ping from IFACE1 to IFACE4
>
> Are some of the assumptions not right here leading to ping failure ?
>
> Regards,
> teamlnx



-- 
E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
