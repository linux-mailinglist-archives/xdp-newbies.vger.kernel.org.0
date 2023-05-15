Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25583704154
	for <lists+xdp-newbies@lfdr.de>; Tue, 16 May 2023 01:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245722AbjEOXOi (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 15 May 2023 19:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245675AbjEOXOi (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 15 May 2023 19:14:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981A07ECA
        for <xdp-newbies@vger.kernel.org>; Mon, 15 May 2023 16:14:35 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ac7c59665bso145836911fa.3
        for <xdp-newbies@vger.kernel.org>; Mon, 15 May 2023 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684192474; x=1686784474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At7oWhnBV+m5oXn8F1isLvizJ3dnsbV14nS0fDlNKSM=;
        b=oscqYiOM/cVlGT1zaop3+J7dEmMb40kYicHB0XSZNi7R4zyyNiExQb33cnH936UrFo
         fpd+Xx5jK5QErjWquyPBX2BNMCqje+93w0FcSTgwgHJopHyhQM8oUBXTaZSsjJcU5VM5
         VMGb8ZnBVssJl/U8nArwAE3JKaarhSebLILMJQhWECPQv5sjvcKCCbdZPcnmoJxem9wC
         lCN8T3UgRoJ5wLmgchOrFxtke/uiL92YnmZheie1Bh/USsrLOZkh520F1ArM4f4m6r/A
         f3XjMUcjTLvKxORc+xuDIvfPym915G9+dzIXrmN4iY51BSI70FTjQXXwpaMnN+sUBPG7
         Bzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684192474; x=1686784474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=At7oWhnBV+m5oXn8F1isLvizJ3dnsbV14nS0fDlNKSM=;
        b=VfP2GGlXcL85iEt2UC6t1TaE3Gs/cptkqTkJDSEjYAEovDsXWjwhh4msSmUuPaA80m
         ikAArNEMLdi5dc9Pk94GrfrAq1NMbiVJTOfdaU8aUQE/i+mdOi6+PdjTZy+VTtpq39ET
         p4C5yNBI1GrH4ppppza5o1SKM1h6m9JshxYERFtegDjm/nuBLOc6zg+p9sw1bsq07oFs
         wn8MejUjpkhtukC//y7CU719/U7wVlfLtoCjGuaxDdAccCwTxXmMUEW+8wXfdM1MTPPQ
         AGbUWR4+LsXysk3XkzHWPL2BM8XpyU2tuKQvLlAXHuOvAix88sSJ13xyj6sYga/PjL2w
         084A==
X-Gm-Message-State: AC+VfDwLBHwC4d1w0OK9hOUwPS95NiMxLoZ7q25wNhCV7lMYSvowVyjs
        zT7nXW/e4AbivvgZiRQI3yBTd4Uc6tmuO4D9rLY=
X-Google-Smtp-Source: ACHHUZ5BptBHtxb+U1SriosWqvQlWSwu5rqNysSDDpu0J3tmIRwy6UMAWOgMb7oJJXo0y84yjvrc4sbEqzRwtbDbsYo=
X-Received: by 2002:a2e:804b:0:b0:2a8:a651:8098 with SMTP id
 p11-20020a2e804b000000b002a8a6518098mr6927027ljg.38.1684192473705; Mon, 15
 May 2023 16:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com> <CAOLRUnBAV=7odpfcGaoMBpUrRrsM3wBP2g16CfWdEtXhG7wzTA@mail.gmail.com>
 <CAAVAo4MFxU-4XR2c5puwrMKM45av4MwM8L+i4tr_2ACtHH_8bg@mail.gmail.com> <CAOLRUnCX=aDjsH56GP8MLXuA5dZ7NYi7OLBaXCpx26Q2j689Zw@mail.gmail.com>
In-Reply-To: <CAOLRUnCX=aDjsH56GP8MLXuA5dZ7NYi7OLBaXCpx26Q2j689Zw@mail.gmail.com>
From:   team lnx <teamlnxi8@gmail.com>
Date:   Mon, 15 May 2023 16:14:22 -0700
Message-ID: <CAOLRUnBOd-Dkc9d2DY8sjRbZ6C5VueZOZ23gg9701icwbtYiDw@mail.gmail.com>
Subject: Re: XDP redirect - ping fail
To:     ctxspi@gmail.com
Cc:     "Shaw, Jeffrey B" <jeffrey.b.shaw@intel.com>,
        xdp-newbies@vger.kernel.org
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

Hello Marco,

I am working on that but I could see a couple of discussions where it
has been mentioned we may have to
enhance xdp to have support NAT.

As an experiment in the same topology, adding masquerade NAT rules (ip
translation) without XDP doesn't have a ping issue.
Does this mean we need to have something like xdp-iptables to add NAT rules=
 ?


On Mon, May 15, 2023 at 4:04=E2=80=AFPM team lnx <teamlnxi8@gmail.com> wrot=
e:
>
> Hello Marco,
>
> I am working on that but I could see a couple of discussions where it has=
 been mentioned we may have to
> enhance xdp to have support NAT.
>
> As an experiment in the same topology, adding masquerade NAT rules (ip tr=
anslation) without XDP doesn't have a ping issue.
> Does this mean we need to have something like xdp-iptables to add NAT rul=
es ?
>
>
>
> On Sat, May 13, 2023 at 12:41=E2=80=AFAM Marco <ctxspi@gmail.com> wrote:
>>
>> Hi Teaminx
>>
>> Have you already tried to send an icmp packet with zero payload to see
>> with bpf_printk what happens before redirection?
>>
>> Il giorno ven 12 mag 2023 alle ore 21:17 team lnx
>> <teamlnxi8@gmail.com> ha scritto:
>> >
>> > Yes, IFACE1 has a route(static) to IFACE3 and ping succeeds.
>> > Ping fails to IFACE4 from IFACE1, Do I need NAT and does XDP have supp=
ort ?
>> >
>> >
>> > On Thu, May 4, 2023 at 11:05=E2=80=AFAM Shaw, Jeffrey B
>> > <jeffrey.b.shaw@intel.com> wrote:
>> > >
>> > > On 5/4/2023 10:38 AM, team lnx wrote:
>> > > > Hello,
>> > > >
>> > > > I see a ping not working in below topology with xdp redirect
>> > > >
>> > > >
>> > > > IFACE1 <--------->   IFACE2      IFACE3    <------------------> IF=
ACE4
>> > > >
>> > > > IFACE2 and IFACE3 are on same host machine
>> > > >
>> > > > IFACE1 and IFACE2 are  on static ip
>> > > > IFACE3 and IFACE4 are on dynamic ip, IFACE4 runs dhcp server
>> > > >
>> > > > steps
>> > > > 1. assign static ip between IFACE1 and IFACE2 (ex: 172.168.2.x)
>> > > > 2. dynamic ip between IFACE3 and IFACE4 (ex: 192.168.2.x)
>> > > > 3. Run xdp redirect on IFACE2 and IFACE3
>> > > > 4. start ping from IFACE1 to IFACE4
>> > >
>> > > Does IFACE1 have a route to 192.168.2.x and is the next hop resolved=
?
>> > > You can use `tcpdump` on IFACE1 and IFACE4 to see what packets are s=
ent
>> > > and received.
>>
>>
>>
>> --
>> E' meglio coltivare GNU/Linux... tanto Windows si pianta da solo!!
