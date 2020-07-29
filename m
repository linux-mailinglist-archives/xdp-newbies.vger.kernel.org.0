Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F405D231B7D
	for <lists+xdp-newbies@lfdr.de>; Wed, 29 Jul 2020 10:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgG2Io6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 29 Jul 2020 04:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728046AbgG2Ioy (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 29 Jul 2020 04:44:54 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E66C0619D2
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Jul 2020 01:44:54 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b9so11502409plx.6
        for <xdp-newbies@vger.kernel.org>; Wed, 29 Jul 2020 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=oT969njJ6bHkbmnuxsl9AFfjVsFzEh+zkwaU03Gw2qs=;
        b=iEYGJPtBNZmF9qmdUNm+UjVJhq27pg34y0wcKBLKtvSDLg7QLeoz8c4Jea7m50s7+7
         Iz8CK4HY9MUTuoQ+G4sI6wlEFFYq4+6qHl3T1MePyYiVDF0raIKWhYJoXDowF9GCGfJm
         047PKoTKwEs0cZSMPK1PVCCnA1oLkC8oaY4UZZwVsqYnvjMxWJ6FMwqgFsM35fF3bKZs
         MWGmeRwUMoQlM6y6cODO+3BncDRrjiQu09WwV0m7qZdU6zM+OY0lq8Y39i7BdBHXtZJw
         KiblASdgUorBnbVLnfzEcx6LpnpEJlZA6cYr/SKBURch7MWMUU//chhE0/MFyKXXNrxe
         7gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=oT969njJ6bHkbmnuxsl9AFfjVsFzEh+zkwaU03Gw2qs=;
        b=tKBpf3iqCuoNaKlBC2h6FMNngJf0Y+/MeClud1BBL1MKMsv2wVxplvTxo1L5O4l0fF
         ZwhMvcLDQSQH9f0/WZchv2JCYK8DRg7AgsJtGxXKgNwNE907FJ/2TEePkUNbh9Uvpa+G
         ZhorBvjqCYu4Ep1YgvAjmt3pQ5qasLfx1L2eJHkMnQRaQHs+ssQsn8qiCXXQY6ubDhph
         UeGx0VDpnj24o2KWccMDGGjbQHPKYsz6CwTzqWKQbEkykvaA0lPm+m3XT0vBSG7xQVMT
         9dZoOJu3JjxixubjwE+QHbbcOyXDo0ZG+CaSE77YBtZCgrOTK6NR3jnE/azFgj7dz4Pk
         meNw==
X-Gm-Message-State: AOAM530cn7yXHu7fEXFxrISqTI2MplogI9ww5YLjbuJejPTMkN/mILKR
        h+Ps7kBSQhrMvzxEtiLan9ggve5HQvY=
X-Google-Smtp-Source: ABdhPJyI7YwkK0eOgc0VLNmROxPj3TfY85HGcIu1kABycJftizvj/0qkzZsfUfFndC94UVMLCYPBOw==
X-Received: by 2002:a17:90b:378d:: with SMTP id mz13mr8494004pjb.98.1596012294143;
        Wed, 29 Jul 2020 01:44:54 -0700 (PDT)
Received: from [192.168.192.8] ([103.86.182.200])
        by smtp.gmail.com with ESMTPSA id k71sm1508057pje.33.2020.07.29.01.44.53
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 01:44:53 -0700 (PDT)
To:     xdp-newbies@vger.kernel.org
From:   Sandip Patil <techiek7@gmail.com>
Subject: igb native xdp support
Message-ID: <9ffcedaa-5b57-0188-0ab7-9a38ecbb9f69@gmail.com>
Date:   Wed, 29 Jul 2020 14:14:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello team,

Is there a plan to add support for native XDP in Intel igb driver?

Regards,

Sandip Patil

