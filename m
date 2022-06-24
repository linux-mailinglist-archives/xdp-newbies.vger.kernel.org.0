Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB65B559DCC
	for <lists+xdp-newbies@lfdr.de>; Fri, 24 Jun 2022 17:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiFXPyd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 24 Jun 2022 11:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFXPyc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 24 Jun 2022 11:54:32 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C7113D25
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 08:54:30 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e7so3649429wrc.13
        for <xdp-newbies@vger.kernel.org>; Fri, 24 Jun 2022 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fA7juC2fpfh1kgoyeWI0EmHod+lKQt/zxOZFvf66Zao=;
        b=PrMRCaJ5gFCyqsfwT3ujfOpg5BZT1pGl9sa6AdP9aPLSa/A9LkmCgOxIAvsMgQj9zp
         dkj6ERTKgkaaAE8ABYRdVbIXgylpDjP4UK5dhiG93BVwHZpNY1MFF0+R3guMbVmoWIaW
         4SojPQuZfbz3A3KlNWw4J8t6cihklUqqCIdbfwJx6nOSro2B6d65I8vTolXNiAZaxz8B
         qYZxOxUHdcaOpp5pKWRpwnQ7X2JvHRLk6e2p1lFrrGNGipSyzC19VGzYaBWmtpJcDfJt
         97L42Lb5M8mWBgpyeUvZ+QpOXllc3Ht9EIXklEbUHX59t+/w8q62qO0yMUZ2Rc96RWwh
         Hm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fA7juC2fpfh1kgoyeWI0EmHod+lKQt/zxOZFvf66Zao=;
        b=wRfrHgjekquIn8xGXrffSB+LPnVelIpIXstwVXnm+KmVZNmQMcEiP1MowB4va4evOD
         E4Yj8+GUeutTkKMMIapSD9GxZ/STy5mDPyxG38EuQEh5upNDJNWn/Rm+NCuT4ez8YBye
         7NB2gohX+QG80p/Pvs7bWCDyEyA6tPihV9THO4EtPvFSLG2225b6ROuK5KnMe2knAsFm
         KjGlgl2UaHX1mg3oF/YM2XYVvDNdQdJWHwlxJbqwa1GJwnC+9Azr0zJqpKMLaYW3dEtT
         a0wzZnCEL9HHGQnUnWElYMSrHAS/wu/vimtdYAIg92K0C+XAlylsKbJMdMUoBfxhWGnr
         Ta3g==
X-Gm-Message-State: AJIora9gZcw1H1xCgMPPe7v4okEyKGO4PtE1x4YpPfmyWKM54VG5y+XF
        JEGsaYMOzZrWd4W7ry90US8KTr/O6tYJ+wyYIYa+oPrz
X-Google-Smtp-Source: AGRyM1tNlWqn7hZy1t37I31HMcVkBz0jiJIByPHFSPw5AE5ZgV2aSb1xfd8NRcsytB0b6yt3S6355l+B/guS2tuOuec=
X-Received: by 2002:a05:6000:1789:b0:219:2aa8:7159 with SMTP id
 e9-20020a056000178900b002192aa87159mr13480146wrg.474.1656086068513; Fri, 24
 Jun 2022 08:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5-ooeCADg0+N47TN29J5Pcknb8CF+3mrC7_jWDp-J-zNw@mail.gmail.com>
 <20220624134755.GB11243@1wt.eu>
In-Reply-To: <20220624134755.GB11243@1wt.eu>
From:   Srivats P <pstavirs@gmail.com>
Date:   Fri, 24 Jun 2022 21:23:51 +0530
Message-ID: <CANzUK59xb1mOTCCzpXN5M50JN1zzviVgJeJ+f0psccGvSHR0Yw@mail.gmail.com>
Subject: Re: Full 40Gbps with i40e for large packets?
To:     Willy Tarreau <w@1wt.eu>
Cc:     Xdp <xdp-newbies@vger.kernel.org>
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

> So assuming that you're running on copper with 40.000 Gbps, this is the
> on-wire bit rate, that includes the 8-byte preamble, the visible eth frame,
> the FCS (4 bytes) and the IFG (12 bytes), hence 1538 bytes for the regular
> 1514 bytes. This gives a maximum frame rate of 3250975 pps for such frames,
> which is what you'd get if by 1518 you included the FCS, or 3242542 pps if
> by 1518 you included a VLAN header (hence 1542 bytes on the wire).
>
> If we take that last example that sounds like the most plausible, that
> gives you a layer2 max bit rate of 3242542*1518*8 = 39.377 Gbps. As such,
> depending on how and where you measure, it's very possible that you've
> totally filled the wire.

Yes, I'm using 40G copper. 1518 byte is including FCS and no VLANs, so
the pps expected to fully fill the pipe as you calculate rightly is
3250975 or 3.25 Mpps.

The rate I get varies continuously between 3.19 and 3.22 Mpps and very
rarely goes up to 3.24 Mpps. The few times I've seen 3.24 Mpps is at
the immediate start of a run, but not afterwards - a behaviour I'm not
able to explain.

I'm trying to understand why I get a lower rate than 3.250975 Mpps and
what I need to do to get the full pps rate.

Srivats
