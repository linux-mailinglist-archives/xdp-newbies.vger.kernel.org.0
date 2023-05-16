Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03A87046BC
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 May 2023 09:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjEPHnF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 16 May 2023 03:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbjEPHnD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 16 May 2023 03:43:03 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F97D1FD8
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 00:43:02 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-395a957a310so1458347b6e.0
        for <xdp-newbies@vger.kernel.org>; Tue, 16 May 2023 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684222981; x=1686814981;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LeMwapTjtDgpD6ac/xZNoy1+3xZvlNyqHoJh+btTwoE=;
        b=WOZCih+jZAz0dEZegEEzQ7iyAGlK/8RiuDbIILY2aWAP0jkJS+giISF0QzjvgGFnVZ
         F9Kc2Ae3VxKsbGwN8WzSWNkQjsIypyJ/OC46SqwpdsrUjjkUZ+aY2Z3MZoBheePbbgH8
         VoQvm0eSPdXHAjJrSe0ZFgbqf5437nW+RRayVA6p4fah2ihI45c8iDUdlzdPD/peq54C
         QHpOxofrQIGOTUaNKxYj9xFGqKf4bu7zdH+FtgetikGqrOLs2BWdPl0KLiChfbVqXGfL
         vNEzWJ7pxEj4tZayvoXblGV0eOUw2JhAEhCAfSSyEZi9xnsMCkEzbC5wA/vrqXTuvvRB
         5I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684222981; x=1686814981;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeMwapTjtDgpD6ac/xZNoy1+3xZvlNyqHoJh+btTwoE=;
        b=NbAnym5TdnL+cKLLZRpOau7hg08JxDkmCJdgyGsbCvpYNb2vq4cVTBSiC7b65+cR+b
         qDZ1sgZBUyCu+3xLEWdBqM4IHniVh6gi2Wf43i+Uldp3402tUig9e8OMi75z7sOlEzBQ
         CyHweF9HNpICMAYDEJhL9V+SZLH0eWounuSwwBNb/682NxDXvczNNKlO9CMHlxW00pkX
         krqPM0oLF4XEk/FU9RaTJmEQN4bXTB4hxifGZK3PWz1vXPm9K8QCHb7zLZgubuZyB0oG
         CWv9L78afDUU0v4p/Zk+oPKxOisd8M1TtiJDv96RbsB3qhyeqJ1rRgAfvSozuea98BZ8
         4B6g==
X-Gm-Message-State: AC+VfDy8dvqv4kOddxYCOnH6jp399x8JUgfZ4Bpgz5Ih2z5BmrcZRucg
        INgPGbJA4Fz0964f1Ziqm80q+ueqpIIqtnAlIW7PcES4Gn6xXA==
X-Google-Smtp-Source: ACHHUZ5vSRw+W/mX82F/R3J6NxK4OsgJ2N0xDeiDle8Eq4Sg0HJUZLuYJXsLncmvxTJlpRMbEDpngF3sRFCgmHo0LNY=
X-Received: by 2002:a05:6808:1513:b0:395:dcd5:52d9 with SMTP id
 u19-20020a056808151300b00395dcd552d9mr6100390oiw.33.1684222981149; Tue, 16
 May 2023 00:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <CAAVAo4Nn0KXWO49+PHea=fVuDFBXfEBVqQOqb9G4TtfJBX38rQ@mail.gmail.com>
In-Reply-To: <CAAVAo4Nn0KXWO49+PHea=fVuDFBXfEBVqQOqb9G4TtfJBX38rQ@mail.gmail.com>
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Tue, 16 May 2023 10:46:15 +0200
Message-ID: <CAAVAo4PvwHcdmE86-1=-FtDYgxozBqL3_TnvVA6CD2nujY6qVQ@mail.gmail.com>
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

Sorry, I answered the dhcp part earlier.
Regarding the Nat, I can tell you that it also works with your XDP
program if properly configured.

Il giorno mar 16 mag 2023 alle ore 10:36 Marco <ctxspi@gmail.com> ha scritto:
>
> I have not much experience with dhcp but ensure first that dhcp
> packets are not blocked from the xdp program.
> So as already mentioned, try pinging with zero payloads and check if
> they get redirected.
>
> Il giorno gio 4 mag 2023 alle ore 19:41 team lnx <teamlnxi8@gmail.com>
> ha scritto:
> >
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
> >
> > Are some of the assumptions not right here leading to ping failure ?
> >
> > Regards,
> > teamlnx
>
>
>
> --
> E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!



-- 
E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
