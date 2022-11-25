Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C2763850D
	for <lists+xdp-newbies@lfdr.de>; Fri, 25 Nov 2022 09:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiKYIQg (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 25 Nov 2022 03:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiKYIQd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 25 Nov 2022 03:16:33 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11FE303D5
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Nov 2022 00:16:30 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id q7so4314210ljp.9
        for <xdp-newbies@vger.kernel.org>; Fri, 25 Nov 2022 00:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KniLokbouaO3b0PHHA3MUBtE3BsQfzUaJMuK47ZVEo=;
        b=SlIIydnxbK/F3yk8JLowJ1uRRrBC2YmknmDCDGMxhv2qw+GS6R43QedE4XNDEo+i7c
         ZerXekQWFoIzkIWSfUFCMZR5LTjtoxCfZctGaJL3qUZ+NmP0C7JMIY62x1NkuQ6K+Rc+
         Ux+LcEr+1COobnbbi6czbP+IqeYiPmgCecuguVX63OKd75e5decdLIHhW9BEv9p/s0Xx
         gP61qq0TQ5Hgm7KkDStSjVUYSmiTw4YbHgKFYHbVFpinQs8DF2FrOHiOET6YF+wc5H4h
         XSTXr+3/7BKb46+YizprkfPBDjtrXd82ti0/uhySyYMUXONS3IPIJaPIYkh5H5n36gqr
         oecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KniLokbouaO3b0PHHA3MUBtE3BsQfzUaJMuK47ZVEo=;
        b=nauHNE2WGgOYu7K7FVHQdWqUbxTwT8z0uZA1l+xwp79BlundAxS0AksfBNd/NOx7k6
         MSfbBf1k/J9F3e9e6JA1dIuVLpD2d9wdK5XmJfpYrZowAqburQ4FJpKLAAZy/F05ii28
         ywj0aQr5DYfEzNzmUTruG6pUV+tkVPQBaq8FLR1Tjy2ZfihPntN7BkFEP6CQpHmmtaeO
         9OlnsjzU32OSD6HKfYfeoWSekJ3D6edAQgwxUjLYhgn5MIDLYWDLWXG3XUVuzGbQ4Bgj
         ju+3BEyHNB58RbgDoKdOhEcY5CXrTQNqb1of+jad6UJ4qQebreKcor11EKEMS36ueSDN
         MSfQ==
X-Gm-Message-State: ANoB5pnAv3odLMoEJULDy6/8VLyUvJM0GeoRbmKRV0pVdg7BZ5XbLuGf
        /5xPPNjT/03kmd8D2CX77sqQhhvlBNTufF9kKdq9D8u+/DgYqQ==
X-Google-Smtp-Source: AA0mqf59LmuAzp7BSattgKkq93prAylVMFFNouWVrrimh6dUTKDcNgxuBs4vhdo+aWzw1omk/NV5kJgaBl6KjzYyrQM=
X-Received: by 2002:a05:651c:1987:b0:277:a6f:9733 with SMTP id
 bx7-20020a05651c198700b002770a6f9733mr5167109ljb.384.1669364188984; Fri, 25
 Nov 2022 00:16:28 -0800 (PST)
MIME-Version: 1.0
References: <LO4P265MB37586C972D240B09A515D6D7870F9@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO4P265MB37586C972D240B09A515D6D7870F9@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Fri, 25 Nov 2022 09:16:17 +0100
Message-ID: <CAJ8uoz0OCtzKOcW0vm7YH9D4Vp3rzoi5S8nW5PtEfsmP0HcXdQ@mail.gmail.com>
Subject: Re: ICE driver bug using XDP_TX with multi FCQs
To:     Robin Cowley <Robin.Cowley@thehutgroup.com>,
        "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Thu, Nov 24, 2022 at 4:40 PM Robin Cowley
<Robin.Cowley@thehutgroup.com> wrote:
>
> Hi there,
>
> We're looking at developing some software that uses XSK in zero copy mode=
, where we either redirect packets to userspace using AF_XDP, or transmit p=
ackets straight from the XDP kernel program using XDP_TX.
>
> Our program is the same one as described here:
> https://lore.kernel.org/xdp-newbies/6205E10C-292E-4995-9D10-409649354226@=
outlook.com/
>
> Recently we've been testing some functionality that transmits packets dir=
ectly from the data plane / XDP code using XDP_TX. This functionality works=
 on a mellanox MT27710 ConnectX-4 Lx NIC using mlx5_core driver. However, u=
sing an Intel NIC with the ice driver, we have some problems. This was test=
ed on the 5.15 kernel and on the newer 6.1 kernel and they both result in t=
he same behaviour.
>
> Everything below was seen using the intel NIC with these configs:
>
> # ethtool -i ice0
> driver: ice
> version: 6.1.0-0.rc5.el8.elrepo.x86_64
> firmware-version: 2.50 0x800077a8 1.2960.0
> expansion-rom-version:
> bus-info: 0000:03:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: yes
> supports-register-dump: yes
> supports-priv-flags: yes
>
> # lspci -s 03:00.0
> 03:00.0 Ethernet controller: Intel Corporation Ethernet Controller E810-X=
XV for SFP (rev 02)
>
> # ethtool -g ice0
> Ring parameters for ice0:
> Pre-set maximums:
> RX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=828160
> RX Mini:=E2=80=82=E2=80=82=E2=80=82=E2=80=82n/a
> RX Jumbo:=E2=80=82=E2=80=82=E2=80=82n/a
> TX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=828160
> Current hardware settings:
> RX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=824096
> RX Mini:=E2=80=82=E2=80=82=E2=80=82=E2=80=82n/a
> RX Jumbo:=E2=80=82=E2=80=82=E2=80=82n/a
> TX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=824096
>
> # ethtool -l ice0
> Channel parameters for ice0:
> Pre-set maximums:
> RX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=8216
> TX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=8216
> Other:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82 1
> Combined:=E2=80=82=E2=80=82 16
> Current hardware settings:
> RX:                0
> TX:=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=820
> Other:            1
> Combined:=E2=80=82=E2=80=82 4
>
>
> When redirecting traffic from the data plane into user-space via XSK, eve=
rything works as expected.
>
> When transmitting packets from the data plane directly out the NIC via XD=
P_TX, we can see our kernel logs getting hit through the systemd-journal pr=
ocess. It seems to be for every packet sent through XDP_TX, it's generating=
 a kernel warning.
>
>
> An example warning and call trace is:
>
> Incorrect XDP memory type (1785255936) usage
> WARNING: CPU: 7 PID: 0 at net/core/xdp.c:403 __xdp_return+0x33/0x1f0
>
> ...
>
> Call Trace:
> <IRQ>
> ice_xmit_zc+0x251/0x310 [ice]
> ice_napi_poll+0x54/0x640 [ice]
> __napi_poll+0x2b/0x190
> net_rx_action+0x2b2/0x310
> __do_softirq+0xbe/0x2b6
> irq_exit_rcu+0xad/0xd0
> common_interrupt+0x82/0xa0
> </IRQ>
>
>
> The memory type value seen above changes each error, suggesting that the =
value is uninitialized or the pointer is corrupted.
>
> We have been able to recreate the issue using a program based on the xdps=
ock sample programs from the kernel tree to validate it=E2=80=99s not speci=
fic to our software.
>
>
> We have been testing a simple BPF program that swaps the MAC addresses ar=
ound and transmits the packet back out of the same NIC. This can be seen he=
re: https://github.com/OpenSource-THG/xdpsock-sample/tree/test_zero_copy_tx=
 on the test_zero_copy_tx branch, which has the very basic BPF program. The=
 issue only occurs when testing the multi FCQ, it seems to work fine on a s=
ingle FCQ. The issue also happens in copy mode and zero copy mode.
>
> The command used was:
>
> ./xdpsock_multi --extra-stats --l2fwd --zero-copy --interface ice0 --chan=
nels=3D2 --busy-poll
>
>
> It is my belief that this is a supported scenario, but I=E2=80=99m seekin=
g some guidance to validate my thoughts, and ultimately whether this is a l=
egitimate bug.

Thank you so much for the detailed bug report Robin. We will try to
reproduce it on our end, root cause it and get back to you.

> I hope this gives enough background and information for a reproducible is=
sue. Any feedback is welcome and we look forward to hearing a response. :)
> Robin Cowley
> Software Engineer
> The Hut Group<http://www.thehutgroup.com/>
>
> Tel:
> Email: Robin.Cowley@thehutgroup.com<mailto:Robin.Cowley@thehutgroup.com>
>
> For the purposes of this email, the "company" means The Hut Group Limited=
, a company registered in England and Wales (company number 6539496) whose =
registered office is at Fifth Floor, Voyager House, Chicago Avenue, Manches=
ter Airport, M90 3DQ and/or any of its respective subsidiaries.
>
> Confidentiality Notice
> This e-mail is confidential and intended for the use of the named recipie=
nt only. If you are not the intended recipient please notify us by telephon=
e immediately on +44(0)1606 811888 or return it to us by e-mail. Please the=
n delete it from your system and note that any use, dissemination, forwardi=
ng, printing or copying is strictly prohibited. Any views or opinions are s=
olely those of the author and do not necessarily represent those of the com=
pany.
>
> Encryptions and Viruses
> Please note that this e-mail and any attachments have not been encrypted.=
 They may therefore be liable to be compromised. Please also note that it i=
s your responsibility to scan this e-mail and any attachments for viruses. =
We do not, to the extent permitted by law, accept any liability (whether in=
 contract, negligence or otherwise) for any virus infection and/or external=
 compromise of security and/or confidentiality in relation to transmissions=
 sent by e-mail.
>
> Monitoring
> Activity and use of the company's systems is monitored to secure its effe=
ctive use and operation and for other lawful business purposes. Communicati=
ons using these systems will also be monitored and may be recorded to secur=
e effective use and operation and for other lawful business purposes.
>
> hgvyjuv
