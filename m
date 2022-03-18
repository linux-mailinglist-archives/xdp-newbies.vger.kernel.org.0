Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FC44DE143
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Mar 2022 19:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240149AbiCRSm0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Mar 2022 14:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240144AbiCRSmY (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Mar 2022 14:42:24 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CA62DF3FB
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Mar 2022 11:41:03 -0700 (PDT)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8BF283F1D2
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Mar 2022 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647628393;
        bh=mxIDfCAT3BN+iPS6NvdhZaYBC8NHSOC5YxpWK4wnxdo=;
        h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
         Content-Type:Date:Message-ID;
        b=Cub2of4ZuvarBiyyxzLwJr7yLlYU7SGq0NvzXB8AAQzFkkh2xPRKsYQwQLVkZ3nRj
         GC5gBKKHXWmVlPmBs+8xBhNY8poQHJnhUEZ1oL6Zl8qIS15eO2X5MtOPoIaOscz13t
         M/xETjocOpb/dIquOkcy14XDk7fmmuptjDsJiZqgUwetns9MPpmR2nNr3lNKEOmww1
         aHcaVa6rl/uhd/hAnkYTSIPLbUhDTsFljYKNhGtM3+CkKtqXJqAWYuKWx0lTj2WC+P
         0onoC05gK5IqKDOz125WYzKOYIflZOPQW39toduu5s/I/4uu/kFATFfMoIkfgeb4XJ
         m6nLiQNj6l8Rg==
Received: by mail-pl1-f200.google.com with SMTP id q8-20020a170902f78800b00151cc484688so4338231pln.20
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Mar 2022 11:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :comments:mime-version:content-transfer-encoding:date:message-id;
        bh=mxIDfCAT3BN+iPS6NvdhZaYBC8NHSOC5YxpWK4wnxdo=;
        b=L7eJMOQJuYsiNxOHbo5Ofdd6d6HRXdl0zfQPM5m5VbsHAmGHoleqHio0MJKbfbQBIa
         i/iwdi+z8Zk7APLArGD2OHIIk5/80Zi/xsZUJRQnU/IGAr1XMkZ2RJpUU+kBcltuIick
         eKWh7WipZpyw2UeAZGNpQtSWwgiK2ktQHe7MKmckEA5yV6bLYZSfyQ0WirTkQuvbaTVD
         tYDMOP2SWVIjRLosGz4C59hOjT09kTFnFRJNdlOZ9YJJzk08ySsAsqn39RtZXlHR+RvT
         Q60Bduq9cNuzqpOC4k214KBxCyxKyOoYPLKy9z5Q/bEG2rf0mgeiZyLBYjFUaB8SoEUV
         Q0dQ==
X-Gm-Message-State: AOAM533zYY78DYyd3Kd3R5OighhA+W9eEloLXNa/9UWuEYCsoqR4zoMG
        PII39DvaKBOuo11AWj3EPrM/04qbyN2/30JgitPMG/pJ93vjrrf4hTSsYTiz8jYXVVdvF1VUugP
        iGcfpIUdSZ2VuugZ1t5BbHly2LzKqjKQGcNu3YlMp
X-Received: by 2002:a05:6a00:848:b0:4f7:ba8b:4429 with SMTP id q8-20020a056a00084800b004f7ba8b4429mr11469166pfk.4.1647628391901;
        Fri, 18 Mar 2022 11:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+7isA7p2cwmw9PyPXjkv4eN6SWmB407GKbTx0PvtIXc/p7CT/wByQ/z9AqXPP0ZAUk9Nr7g==
X-Received: by 2002:a05:6a00:848:b0:4f7:ba8b:4429 with SMTP id q8-20020a056a00084800b004f7ba8b4429mr11469139pfk.4.1647628391627;
        Fri, 18 Mar 2022 11:33:11 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.157])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a414c00b001bf6d88870csm8652451pjg.55.2022.03.18.11.33.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:33:11 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
        id A8CFC5FDEE; Fri, 18 Mar 2022 11:33:10 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
        by famine.localdomain (Postfix) with ESMTP id A1DCBA0B18;
        Fri, 18 Mar 2022 11:33:10 -0700 (PDT)
From:   Jay Vosburgh <jay.vosburgh@canonical.com>
To:     Federico Parola <federico.parola@polito.it>
cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        xdp-newbies@vger.kernel.org,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
In-reply-to: <37d17135-df90-8101-159a-babd2ea58a4d@polito.it>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it> <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it> <86baadd1-daac-09fa-c3df-50308272ef77@intel.com> <2430.1647559617@famine> <37d17135-df90-8101-159a-babd2ea58a4d@polito.it>
Comments: In-reply-to Federico Parola <federico.parola@polito.it>
   message dated "Fri, 18 Mar 2022 11:30:14 +0100."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 18 Mar 2022 11:33:10 -0700
Message-ID: <20413.1647628390@famine>
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Federico Parola <federico.parola@polito.it> wrote:

>On 18/03/22 00:26, Jay Vosburgh wrote:
>> Jesse Brandeburg <jesse.brandeburg@intel.com> wrote:
>>=20
>>> On 3/17/2022 8:34 AM, Federico Parola wrote:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0We observed similar "batching" behavior on i=
40e devices late
>>>>> last year in ordinary use (not XDP, but using SR-IOV VFs).=C2=A0 We
>>>>> instrumented the drivers at the send and receive sides, and determined
>>>>> that it appeared to be a behavior of the receiving device itself, i.e=
.,
>>>>> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
>>>>> update of the RX ring pointers) until packet 8 arrives, at which point
>>>>> all 8 were delivered simultaneously.
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0The issue was evidently in the firmware, and=
 was resolved after
>>>>> a firmware upgrade.
>>>> Hi Jay,
>>>> I just updated the firmware to the latest version (v8.50 from v8.30) b=
ut
>>>> unfortunately the problem is still there.
>>>> However I'm experiencing the problem only when using AF_XDP in busy po=
ll
>>>> mode, all other modes (standard AF_XDP and normal packet reception) wo=
rk
>>>> just fine.
>>>> Maybe the two problems are correlated in some way.
>>>
>>> This sounds related to the WB_ON_ITR feature in our hardware. If
>>> interrupts are disabled the driver needs to set that bit (and an ITR
>>> value) so that packets get written back in a timely manner and don't ju=
st
>>> wait for a cache line edge (I bet your Cache Line Size value in PCIe sp=
ace
>>> (lspci) is set to 128?)
>> 	FWIW, in the case we had, driver changes (5.14 upstream, the
>> then-current Intel out of tree driver) didn't change the behavior.  The
>> PCI Cache Line Size was 64 bytes; the device was
>> 13:00.0 Ethernet controller: Intel Corporation Ethernet Controller X710
>> for 10GbE SFP+ (rev 02)
>>          Subsystem: Hewlett-Packard Company Ethernet 10Gb 2-port 562SFP+=
 Adapter
>> 	From an lspci -vvv perspective, failing and non-failing cards
>> differed only in the serial numbers.
>>=20
>
>I tested it on 3 different XL710 NICs, all updated to the latest 8.50
>firmware, and they all present the same 8 packets "batching" behavior.
>How do I check the PCI Cache Line Size (I didn't find such entry in lspci
>-vvv)? Normal cache line size is 64B on my system, but I guess they are
>two different things.

	It's in the lspci -vvv, near the top, e.g.,

08:00.0 Ethernet controller: Intel Corporation Ethernet Controller XL710 fo=
r 40GbE QSFP+ (rev 02)
        Subsystem: Intel Corporation Ethernet Converged Network Adapter XL7=
10-Q2
        Physical Slot: 1
        Control: [...bunch of stuff...]
        Status: [...bunch of stuff...]
        Latency: 0, Cache Line Size: 64 bytes

	Checking the PCIe spec, though, I'm not sure why this would
matter, as PCIe 4.0 7.5.1.3 Cache Line Size Register says it "has no
effect on any PCI Express device behavior."

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
