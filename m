Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B744958ECE3
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Aug 2022 15:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiHJNQs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Aug 2022 09:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiHJNQS (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Aug 2022 09:16:18 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F19CDF62
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Aug 2022 06:16:16 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so3281520pjz.1
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Aug 2022 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=chyLwoJYYfHs+tB6banemEa1THxs2fjzNAFmSbWZLag=;
        b=hUtEgqWkOkGV7+pFwLmRU4S5pV1FdSne/m8fVZ1ArkGXI0N1d4YRBjUJq43YQVBh+4
         sbqJV8d8JUKwjnepJvHCaSDxxWvqjh991PrO+FzgVrJ4ktiMvjTUvZqDYmq0D431N/Rt
         Mlmcmp/2MPgiLaM6BMXvlCKyv3/PaDur7utiRA3k0wVbSZscEhJb9ITO2o1rEyZXPmNT
         GI0+fTcmpTCEIcKT+1NnkRv2QQh7oqfszQYVbHY9Eppne2GjWAaBsITuXDI/e1zdBoUe
         aFvaQQY4NqoWJ66IckvTdLtV9QFLEx3vLpVuhM2xBlvF84kAelg1ybIWkf4N09T35/VE
         S5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=chyLwoJYYfHs+tB6banemEa1THxs2fjzNAFmSbWZLag=;
        b=k2TYpwMyj99mMvoq1Irm5iYwNHX6brhusrYQbTFfLhrTCf0lmtc/bbxyzcmSjAl3Gt
         x7x+ajF1qdW9R51feZpJdC4nEk7L4ku2XfNjSnBKPdOI/v2wFPI4z5dEpjYVTt7Fcez5
         1reqQ4iQH8rUU78m7+R+3qJZm/87d1DBgdwhxq0xc8dXCNA3Jdywpfz9amJs7drM7Jw5
         HkSvmH8AVUJeP1qc8D4Wm69sr7ZdQ0ZBr1yZr/HCWuFM7RsrW0ejek7D4O9tkc+lNLtL
         wWLxTm2j1Xv/oaDM5AJqZeWcSLPw7lakfbKezK2JEZuLddOe3icqg1cgGibDKERJnm5b
         f+0g==
X-Gm-Message-State: ACgBeo3j9EJgbZR1R11L+9YWueHYufUAhUFxJ58driRRFNLZdijSyzFa
        9XobPCpqoU26FFLi2Izhl+TrsD9Yaup3Kck7upA=
X-Google-Smtp-Source: AA6agR73e9D736hEVk8r0c0Q6qhzblLyzdBHFyp8am5rx/yAI8fNN0fofbcJCylKgTBbCTEyI/W+35KCDsMDXsiQZtc=
X-Received: by 2002:a17:90b:350a:b0:1f5:6a5e:5d12 with SMTP id
 ls10-20020a17090b350a00b001f56a5e5d12mr3807009pjb.46.1660137376182; Wed, 10
 Aug 2022 06:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <6205E10C-292E-4995-9D10-409649354226@outlook.com>
 <CAJ8uoz0a_q8T99=rHny2L+wVUgCd0jNYQd1f=LLd-2WncrAiuw@mail.gmail.com>
 <CB1ACD33-ED8B-44FC-956A-36662D54D0B8@outlook.com> <CAJ8uoz3-vC7RCU3gG=CWTT6=z_r21G8ujo9eGFzfiVa0EPfMeA@mail.gmail.com>
 <2A83ED8B-B369-41D5-950B-8D46217594CF@outlook.com>
In-Reply-To: <2A83ED8B-B369-41D5-950B-8D46217594CF@outlook.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Wed, 10 Aug 2022 15:16:04 +0200
Message-ID: <CAJ8uoz0+C+2V1bFeSd5_NMGYoDSOfYf8uXJac41oqtdfxBo6vw@mail.gmail.com>
Subject: Re: XSK + ZC, shared UMEM and multiple Fill/Completion queues - broken?
To:     Alasdair McWilliam <alasdair.mcwilliam@outlook.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
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

On Tue, Aug 9, 2022 at 5:12 PM Alasdair McWilliam
<alasdair.mcwilliam@outlook.com> wrote:
>
>
>
> > On 9 Aug 2022, at 15:58, Magnus Karlsson <magnus.karlsson@gmail.com> wrote:
> >
> >
> > I can reach it thanks. Could you please send me the command line you
> > use to trigger the problem so I can try out exactly that on my system?
> > And I guess it is the "multi FCQ" build that breaks.
>
> Certainly:
>
> ./xdpsock_multi --l2fwd --interface ice0 --queue 0 --channels 4 --poll --busy-poll --zero-copy
>
> Hardware info:
>
> # ethtool -i ice0
> driver: ice
> version: 5.18.10-1.el8.elrepo.x86_64
> firmware-version: 2.50 0x800077a8 1.2960.0
> expansion-rom-version:
> bus-info: 0000:03:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
>
> # lspci -s 03:00.0 | grep -i E810
> 03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-XXV for SFP (rev 02)
>
> # ethtool -g ice0
> Ring parameters for ice0:
> Pre-set maximums:
> RX:             8160
> RX Mini:        n/a
> RX Jumbo:       n/a
> TX:             8160
> Current hardware settings:
> RX:             4096
> RX Mini:        n/a
> RX Jumbo:       n/a
> TX:             4096
>
> # ethtool -l ice0
> Channel parameters for ice0:
> Pre-set maximums:
> RX:             16
> TX:             16
> Other:          1
> Combined:       16
> Current hardware settings:
> RX:             0
> TX:             0
> Other:          1
> Combined:       4

OK, I believe I have found the problem and have produced a fix for it.
As usual, it is something simple and stupid, sigh. I will post a patch
here tomorrow. Would you be able to test it and see if it fixes the
problem with corrupted packets in your app? If it does, then I will
post the patch on the netdev mailing list. Just note that even if this
fixes this, there is still your RSS problem. Maciej is looking into
that. You were also reporting stalls, which we should examine if they
still occur after fixing the corrupted packets and the RSS problem.

/Magnus
