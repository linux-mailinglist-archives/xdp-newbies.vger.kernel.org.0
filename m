Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92601700F0E
	for <lists+xdp-newbies@lfdr.de>; Fri, 12 May 2023 20:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjELSuK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 12 May 2023 14:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239170AbjELSuJ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 12 May 2023 14:50:09 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9275585
        for <xdp-newbies@vger.kernel.org>; Fri, 12 May 2023 11:50:08 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac80da3443so113623171fa.0
        for <xdp-newbies@vger.kernel.org>; Fri, 12 May 2023 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683917406; x=1686509406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usvF0ViHZbf3gDcORyIXaDeBR9vf1D4Z4nnPIrkBLTY=;
        b=YdI0HMYgcImq08lcXkhe3PDgWWa97TkTEnc1E0byrH8/BBrFVBvUA2GXxpiEDIQJmr
         SxdZ+pwlx9bCQnLPv74h4Kmca4DvZxzB10Re8ZkfhqHv+uiioE0hd8T3DsU7JOPWTeN+
         WxHVGyPC054tGg0Aa740EwFogVK5U9Wvlz6IY0xctV+L9e0MUjP9RqhGfR7jPqH0BCzo
         0y1rdrA88aV4/kFJUfV7XznsEouQ47/X8YTEKtH/u7bF5e5DzbLo2jrx5J3IUmm+3urW
         vH0Qj7NUMC88Kf4LCA9VdUUwKhz/QgCBrplMj0VisjL604r3qUNnsSk6RV0Dg9o6ullN
         EYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683917406; x=1686509406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usvF0ViHZbf3gDcORyIXaDeBR9vf1D4Z4nnPIrkBLTY=;
        b=TtmVr3C/7FsxZsQ2j8nfZfBHhQt8GJdPRrUTA1xzoDW+vS7960gXdSRVXpl2xV7sFH
         90cakSM3X3RGc3kT4kbznkHwMlhFRyF1BCTnSnsD4BUZiyZl9eU/N+5Aie2ZUKBE8eMm
         ByR5PPLv38bTI4A7dLoiOhe76cQuycMfhP1cATiHCGiA4UEvKiR0RV31GViG2GOM3udZ
         YL/UYFVpyo8iYS2JsvF9ywTFPcJKRrqMK2+SZnQreOzjLvz3t6/2GN+S/+be16kzJKAO
         x/DZ2ZghsZeto12ZmqXxzCFRb0cPpTyMxyD7wJeK05adLVjS8LhWY1vT2yu/CM3j9xnb
         ynjA==
X-Gm-Message-State: AC+VfDwg0RimmBoUc8WA7vn10me+r4w0tQ3LoXCQeBrjx3qxG8iKQhW+
        hddv1cmzFC2DtdbmYnwpTEv1LV1I63aUnKd7ZhI=
X-Google-Smtp-Source: ACHHUZ70cS/WyppQflFRlXW802F6yF/wKYqMYD94oCMXhMr5Lk/AgzeSpiHvh7Dv0zFE9Z+yFu7z1O3T+lR3N9g4+vI=
X-Received: by 2002:a2e:850c:0:b0:2ad:99c1:18f6 with SMTP id
 j12-20020a2e850c000000b002ad99c118f6mr4965997lji.37.1683917405984; Fri, 12
 May 2023 11:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com>
In-Reply-To: <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Fri, 12 May 2023 11:49:54 -0700
Message-ID: <CAOLRUnBAV=7odpfcGaoMBpUrRrsM3wBP2g16CfWdEtXhG7wzTA@mail.gmail.com>
Subject: Re: XDP redirect - ping fail
To:     "Shaw, Jeffrey B" <jeffrey.b.shaw@intel.com>
Cc:     xdp-newbies@vger.kernel.org,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
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

Yes, IFACE1 has a route(static) to IFACE3 and ping succeeds.
Ping fails to IFACE4 from IFACE1, Do I need NAT and does XDP have support ?


On Thu, May 4, 2023 at 11:05=E2=80=AFAM Shaw, Jeffrey B
<jeffrey.b.shaw@intel.com> wrote:
>
> On 5/4/2023 10:38 AM, team lnx wrote:
> > Hello,
> >
> > I see a ping not working in below topology with xdp redirect
> >
> >
> > IFACE1 <--------->   IFACE2      IFACE3    <------------------> IFACE4
> >
> > IFACE2 and IFACE3 are on same host machine
> >
> > IFACE1 and IFACE2 are  on static ip
> > IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server
> >
> > steps
> > 1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
> > 2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
> > 3. Run xdp redirect on IFACE2 and IFACE3
> > 4. start ping from IFACE1 to IFACE4
>
> Does IFACE1 have a route to 192.168.2.x and is the next hop resolved?
> You can use `tcpdump` on IFACE1 and IFACE4 to see what packets are sent
> and received.
