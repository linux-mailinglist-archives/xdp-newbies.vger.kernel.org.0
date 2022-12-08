Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4EE3646DB5
	for <lists+xdp-newbies@lfdr.de>; Thu,  8 Dec 2022 12:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiLHLAd (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 8 Dec 2022 06:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiLHLAH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 8 Dec 2022 06:00:07 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29043E8
        for <xdp-newbies@vger.kernel.org>; Thu,  8 Dec 2022 02:54:51 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r26so1533795edc.10
        for <xdp-newbies@vger.kernel.org>; Thu, 08 Dec 2022 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i8GxeaN1JM2ptvWm3lZiEqdJ6NMP6Rpm6Ce40VrFWk=;
        b=kbCJaYXQZF0iy0bU3PgT9eXKK5kzsI0crLXTyVoVWHcehAZkOXMLZvKvb7X9r3/gXV
         Tqw39k9MvDBuYM/5JPMUvEAnMBIYI0Y18wko0DUyXUiUUCtru5hAPREE6jrUIWRJUAdI
         FahMltxTdPazB4fjGq6hsyNqCscyv7fgO/vR4DFqQICnLntoe2Aaj/TEAxkqUtZQgVEX
         9wBj2+9ekbfjrme2QEuLE8iZHu9gTae/cv5PB3Is5NpqA9aJfBOSit/+QqEl3n1Y8gkz
         vq/UkUGc3V+nvIVavIvDGtKmCjabSvWtMpzWpnTO8liML0tmFQCE7tnTaD8EeZTmJqYo
         5Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4i8GxeaN1JM2ptvWm3lZiEqdJ6NMP6Rpm6Ce40VrFWk=;
        b=CXiMq0rMg2eX9/v1UeOHtj376muJjxTJdNbr09sirOUjMVFriL7p9ZRd5tiEzsaFb0
         1zo8EMvzbnzAKYGw/uN64thRTO1fzF/uUMCySiQqTJ8YXyZobhAf5a6soFZLcAjRcLN/
         ZLtBbDKRJ9C36SlnWkHDmdgBF9bL1sl38sgXO141DRBPXCVHDHCQEMvtuCqVlArQgdSE
         kHVBXGd4T7BpE5lWVVpYZalwdxsDXflJVQl9NX4eBN/Z9dgSTzQ/4drvbFCV+kHfKKRQ
         8j3wzMofT++9p+CCSxiOFaVOqDqbfSBMGQAMIEGhNwVhEG1CCaEnf1lA6o05THnEjSSv
         F2+g==
X-Gm-Message-State: ANoB5plHDP0Jh8FjNSDGr4X/V+Cq7aIhA1QOV2jRpyAefzze4IZMVEun
        6xdweph9oW7eoW/1t6EjezniL7KNQnZSzprUOI/9J07LfXkI+Q==
X-Google-Smtp-Source: AA0mqf5vWEI7rqMIvzurbyYBsNwLRG5iL+VWFJTQVZQ20+NEIRVNXG4zD0mnzpWr/eazTAT1JHlZgYKzfXpZiTeebHQ=
X-Received: by 2002:a05:6402:5c7:b0:469:6e8f:74c1 with SMTP id
 n7-20020a05640205c700b004696e8f74c1mr66270327edx.334.1670496889540; Thu, 08
 Dec 2022 02:54:49 -0800 (PST)
MIME-Version: 1.0
References: <MW3PR13MB3914293EBC3BB94EB7863C02D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <MW3PR13MB3914DAF2E660702C2EF52058D61A9@MW3PR13MB3914.namprd13.prod.outlook.com>
 <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
In-Reply-To: <662AEFE7-B907-406F-8DB3-47E6157217DB@futurewei.com>
From:   Magnus Karlsson <magnus.karlsson@gmail.com>
Date:   Thu, 8 Dec 2022 11:54:37 +0100
Message-ID: <CAJ8uoz3F_NEfFW+zDc60AgL1SDfD9BE0qvkEHhr9yzqusSpEwg@mail.gmail.com>
Subject: Re: Is It Possible to RX/Process/TX packets concurrently with AF_XDP?
To:     Zhaoxi Zhu <zzhu@futurewei.com>
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

On Wed, Dec 7, 2022 at 11:54 PM Zhaoxi Zhu <zzhu@futurewei.com> wrote:
>
> Hi All,
>
> Thank you very much for reading this email. My name is Rio.
>
> I recently started looking into the XDP technology, especially AF_XDP, an=
d I really love it. I started studying and modifying this AF_XDP example(ht=
tps://github.com/xdp-project/xdp-tutorial/blob/master/advanced03-AF_XDP/af_=
xdp_user.c) to meet my need, and it has been working fine.
>
> However, one thing I notice is that this user space application is single=
 threaded. I wonder if it is feasible to multi-threading to the RX/packet p=
rocessing/TX parts of the program, in order to utilize other cores and poss=
ibly make my application faster?
>

Please check out the AF_XDP-forwarding example in this repo:

https://github.com/xdp-project/bpf-examples

> One challenge I face now is, as I tried different places to add multi-thr=
eading, the program does not work properly. Symptoms such as `assert(xsk->u=
mem_frame_free < NUM_FRAMES);` failed; ICMP ping packets doesn=E2=80=99t ar=
rive destination until seconds later and TCP connection generated by `iperf=
` cannot be established occurs as I tried different places to add multi-thr=
eading to my code.
>
> So, my question is, does AF_XDP applications support multi-threading duri=
ng RX/packet processing/TX? If so, what is a proper way to modify the AF_XD=
P example code to let it run properly?
>
> Thank you again for reading this email. I look forward to hearing from yo=
u.
>
> Best,
> Rio Zhu
>
>
