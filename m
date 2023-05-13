Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63DF270150E
	for <lists+xdp-newbies@lfdr.de>; Sat, 13 May 2023 09:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjEMHlE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 13 May 2023 03:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjEMHlC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 13 May 2023 03:41:02 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18355BA0
        for <xdp-newbies@vger.kernel.org>; Sat, 13 May 2023 00:41:00 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1960539df06so5954869fac.1
        for <xdp-newbies@vger.kernel.org>; Sat, 13 May 2023 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683963660; x=1686555660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LVzhR4VgQiVqZ1h2Qnu2/WA2+m7vrUYb1xsTo2BU3Ys=;
        b=qH4fAosJzGX3CWKC4xhZ2sdBEJTFx/pjvo30kcdspJpWVh+O0eGGwybuOvuHChZzCp
         kACMw57102u0wBoiz6W2SF/fX5dUQNiAuMkueloGAQcGR6Q2dkmqJwl1gA3Gcrl0C9DI
         NSqGYb81SLBnVhaxowHZN5Z30pu2pW+KMNHkQYk+oPzGhqqKCa33YNzLPW2F7t2HGuap
         G66hve+S/wErvRTRM8siQubmX3VjHQehK8Ci+3KOM3hoPdx4rEkkaa+E9uGSH4gWZpIL
         Ff3GAMCXyWa+ksv0/k4/1/IaPF1KLitCgm5vbYjtjwywyJ1h1b8rH27ezN5h8SU4XxTX
         L7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683963660; x=1686555660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVzhR4VgQiVqZ1h2Qnu2/WA2+m7vrUYb1xsTo2BU3Ys=;
        b=CAmc+ncBrlUxpcTb0234tyQz4aAVz/5D+OpcQ6yw777E8qzfuyPoeBgYhAAAZNhQ6F
         fNvA2VL/0qolQmyh74xju8LrrhMTNiqbdnjCfcx/84XeB0tgvv2Ww4w+fqWHCqligjrw
         8zf4cGrsmuyJQtcCK4ScJjNC2vQtcAPG7oMhjK2a8gTjLs4KI65g6FVcR4n/drfmXCNM
         v5vksd6/RhQsyaFcYiFBbS3lrrpBn3dJZ/7sADhhG/88gyr8rsLfy6Erq5bTPRLcf2Fk
         pbKQYZ92681ZP1W7eCYxPUfZbcEz2yk8z4JfLgmsfyCWQ6QhjuCYZNL8sFIgtHgFh5x7
         I4uw==
X-Gm-Message-State: AC+VfDz3wxHAXN2C4CuuNzBAkpFPi/FrCsdTR/jEQgLyBPKZxP6mh3AO
        Otn2pPRtuGbMzAc288tJz2wk3TYwH8NswwFjDuo=
X-Google-Smtp-Source: ACHHUZ5M3IW9kX1RFpXsPnUqrBIz87fLS3UHpoH0k5cAVcewDsvNYC2bQH5HD+Q0pSJ/qcQHhzzLb4w853DiUH9WBes=
X-Received: by 2002:a05:6870:768f:b0:192:d6c9:a18d with SMTP id
 dx15-20020a056870768f00b00192d6c9a18dmr12857227oab.55.1683963659835; Sat, 13
 May 2023 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com> <CAOLRUnBAV=7odpfcGaoMBpUrRrsM3wBP2g16CfWdEtXhG7wzTA@mail.gmail.com>
In-Reply-To: <CAOLRUnBAV=7odpfcGaoMBpUrRrsM3wBP2g16CfWdEtXhG7wzTA@mail.gmail.com>
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Sat, 13 May 2023 10:44:07 +0200
Message-ID: <CAAVAo4MFxU-4XR2c5puwrMKM45av4MwM8L+i4tr_2ACtHH_8bg@mail.gmail.com>
Subject: Re: XDP redirect - ping fail
To:     team lnx <teamlnxi8@gmail.com>
Cc:     "Shaw, Jeffrey B" <jeffrey.b.shaw@intel.com>,
        xdp-newbies@vger.kernel.org,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
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

Hi Teaminx

Have you already tried to send an icmp packet with zero payload to see
with bpf_printk what happens before redirection?

Il giorno ven 12 mag 2023 alle ore 21:17 team lnx
<teamlnxi8@gmail.com> ha scritto:
>
> Yes, IFACE1 has a route(static) to IFACE3 and ping succeeds.
> Ping fails to IFACE4 from IFACE1, Do I need NAT and does XDP have support=
 ?
>
>
> On Thu, May 4, 2023 at 11:05=E2=80=AFAM Shaw, Jeffrey B
> <jeffrey.b.shaw@intel.com> wrote:
> >
> > On 5/4/2023 10:38 AM, team lnx wrote:
> > > Hello,
> > >
> > > I see a ping not working in below topology with xdp redirect
> > >
> > >
> > > IFACE1 <--------->   IFACE2      IFACE3    <------------------> IFACE=
4
> > >
> > > IFACE2 and IFACE3 are on same host machine
> > >
> > > IFACE1 and IFACE2 are  on static ip
> > > IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server
> > >
> > > steps
> > > 1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
> > > 2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
> > > 3. Run xdp redirect on IFACE2 and IFACE3
> > > 4. start ping from IFACE1 to IFACE4
> >
> > Does IFACE1 have a route to 192.168.2.x and is the next hop resolved?
> > You can use `tcpdump` on IFACE1 and IFACE4 to see what packets are sent
> > and received.



--=20
E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
