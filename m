Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06687053F9
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 May 2023 18:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjEPQeZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 16 May 2023 12:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjEPQeM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 16 May 2023 12:34:12 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FB0A267
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 09:33:38 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ac78bb48eeso150083321fa.1
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684254816; x=1686846816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzvSK28d5x8V2rOW5c8ub7fPran6kXmLm7u9QClS3s4=;
        b=Cv80gNbNXDys3a6F9AZPFGJSNqd5REHjNvWAZ+7s20bAEv7PHEvtLOq6+fZ7NCl+mB
         IO1bd8OOe+DwoPY2wi839VLuC2i/B/kfGpEw8yGKYx3wWA8dS7StfR4EDQ2vkD/iD2xK
         SD7ioQFAuBmjV8t4ufgX2W2DCmwJS1hdzVHOvCH9Acy/cUy/sDnCgjRPQM0iCHWiQNOm
         FdD/khDRt/QwqiGwxy5O3DQ+gVDWqpj42NGFZ/D2ICwVz5c/yT7UqJYs07jHmPao666g
         BNPPiJmF6td0pZ+p8ZUQEqA8Ee4MmxT7+//lASutd69xXPcf1nXrebuzFRJ208CHxhm6
         bMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254816; x=1686846816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzvSK28d5x8V2rOW5c8ub7fPran6kXmLm7u9QClS3s4=;
        b=YiBGJgdkOGGmz6Ar5enNG3F/konggmLgHy4woAe8LHq/Ou2FO/F41p3K99bTsivHPs
         bB55cbxnCSiHS22oAKFBTYzluoxMte7pi7GubFcLrmHoXGDyvIxeZKHDi2pgb5xnoKBm
         GeMIodAo59C9UyOvfWjHaRSXrt0l8wBqxDwzc5BZIOTGHwG6Iz69XWOJ0w379gdePByu
         I6PcnpHkLWEE6c4A37Bt4kbkWgg2fR6NPUr6KNQ1+dv30bFb2fM7pLqKqTecn8l4MwAd
         lf2cQSluoX6Ngi8tGxYRUuN9/FrYAp3l8fP27UlAKTDAAJ2OZuRIMmVJksxRGve5EobK
         7Lfg==
X-Gm-Message-State: AC+VfDzlZxcgAt2NckeyjPqKjPQUMRIMT92PW/m0mEvZV9ll/wphO5br
        39IKQ4xQfwX4dr4OGMpm1RS6/q0nxXC88izh+h4=
X-Google-Smtp-Source: ACHHUZ5KVQuMGQmNmzeTAbI2Uqo1rHx+k0fg4laXhVvxPxet7c4b6KiVzZDOPJiuVD/hogY+7kZlXjtwaZmGCrf3x74=
X-Received: by 2002:a2e:9c05:0:b0:2a8:ceef:e6cd with SMTP id
 s5-20020a2e9c05000000b002a8ceefe6cdmr8016936lji.52.1684254815680; Tue, 16 May
 2023 09:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <CAAVAo4Nn0KXWO49+PHea=fVuDFBXfEBVqQOqb9G4TtfJBX38rQ@mail.gmail.com> <CAAVAo4PvwHcdmE86-1=-FtDYgxozBqL3_TnvVA6CD2nujY6qVQ@mail.gmail.com>
In-Reply-To: <CAAVAo4PvwHcdmE86-1=-FtDYgxozBqL3_TnvVA6CD2nujY6qVQ@mail.gmail.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Tue, 16 May 2023 09:33:24 -0700
Message-ID: <CAOLRUnAPQtH0ESV5Cx7Q33OYZfYZrEo6wtxU5i37f26dQo6wNw@mail.gmail.com>
Subject: Re: XDP redirect - ping fail
To:     ctxspi@gmail.com
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

Thank you, I am using "xdp_fwd"  and I believe this alone wouldn't be
sufficient Is that correct ?


On Tue, May 16, 2023 at 12:43=E2=80=AFAM Marco <ctxspi@gmail.com> wrote:
>
> Sorry, I answered the dhcp part earlier.
> Regarding the Nat, I can tell you that it also works with your XDP
> program if properly configured.
>
> Il giorno mar 16 mag 2023 alle ore 10:36 Marco <ctxspi@gmail.com> ha scri=
tto:
> >
> > I have not much experience with dhcp but ensure first that dhcp
> > packets are not blocked from the xdp program.
> > So as already mentioned, try pinging with zero payloads and check if
> > they get redirected.
> >
> > Il giorno gio 4 mag 2023 alle ore 19:41 team lnx <teamlnxi8@gmail.com>
> > ha scritto:
> > >
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
> > >
> > > Are some of the assumptions not right here leading to ping failure ?
> > >
> > > Regards,
> > > teamlnx
> >
> >
> >
> > --
> > E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
>
>
>
> --
> E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
