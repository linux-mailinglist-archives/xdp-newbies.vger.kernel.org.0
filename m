Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262C34E2E1F
	for <lists+xdp-newbies@lfdr.de>; Mon, 21 Mar 2022 17:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240009AbiCUQe1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 21 Mar 2022 12:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351283AbiCUQeI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 21 Mar 2022 12:34:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ED21868A4
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Mar 2022 09:32:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id s42so15983875pfg.0
        for <xdp-newbies@vger.kernel.org>; Mon, 21 Mar 2022 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=saAIeluL7/N7yQEn0wOTPMhDng4fdB3HWw7CWwPIPuY=;
        b=Uqi/Lz+k0INVwFqkZoxa+1og21DnNSXWtYuhjhF+bNEUNNEa/+rmkYNawVP2AGI5nT
         xxcyuGM/sapY4mEtc6kKnrdph4DsDpBU1xQgidrAGr441OXVY/xOowA4QItqrp0ihZUb
         nGBj/D1xJwsCCJbDeIoLYQde+Sq7eaIyCz0vyyfj1li9J0HACZ7aICfR63NLfF7D1QvI
         O4IVbh1HTHh3EAYDGAAldfr23D3LFIdu+5JJt1vv704lVqMGGL04kFu1rRzJgDGmyBrT
         iW1QXGeodgcRlgBiGW6sHqEYMs4GQjUb6LAm4MWqLyy5+pTiECwBCXcfseCYU561e200
         DrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=saAIeluL7/N7yQEn0wOTPMhDng4fdB3HWw7CWwPIPuY=;
        b=3hX2o+JvxnpXPx26zQO36Phm9aZ6+/NkppsNQ/c74hgbGPDL0t2ng2xUpBLJ8VpFV6
         qwzB03SAz4s8DDkfrDICKHln5LiXrKwd2+tztb64wWcbD3uC94TQAwfN1mham1AenTzC
         M7tvLGjzknNixpQ7Mhpg6jvelvetPxYTxomhaopmkFMn2rEqnxtTYkA/1vV64mPYNga8
         0uqDs6sceT3SyUfEO2MlF0MdwzfOZeQJuXGPt8XSHQIiruqOjALfY/paIjZf/u9Wa2FK
         2UOqzZ8k4zRaTIBwapI2s1SPQZog0BrdTouCwP1v10fUBhFkan0SCyQ6hH5JTr9af+4G
         wdew==
X-Gm-Message-State: AOAM532UeBM/XbMnBD4LlIl8GuJFXLRX/XcRRPRIHfq0ZMQNblgRq6rZ
        bdK6WFRkJCuEliLreO2Cg6e3NymF5ykTsxHTHEGy/8km
X-Google-Smtp-Source: ABdhPJz/3e1NEx4bEAuPpg+TMmK2GU9EmYgUd0WrMlxjEd1RfQxt8KagM2rkDPtiS6/FFH6x7HsWFMwD+nhWlKY6zqg=
X-Received: by 2002:a05:6a00:194c:b0:4f7:8a93:e814 with SMTP id
 s12-20020a056a00194c00b004f78a93e814mr24476243pfk.77.1647880362320; Mon, 21
 Mar 2022 09:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANzUK5919hyHSJf63nWJ2wefG57AKAB7W=D0AkUFKdP9s2BH+w@mail.gmail.com>
In-Reply-To: <CANzUK5919hyHSJf63nWJ2wefG57AKAB7W=D0AkUFKdP9s2BH+w@mail.gmail.com>
From:   Srivats P <pstavirs@gmail.com>
Date:   Mon, 21 Mar 2022 22:02:06 +0530
Message-ID: <CANzUK58uaaH=NA-enNahqgWadOson5pCdGYErGgBQQTudpyFUw@mail.gmail.com>
Subject: Re: Jumbo frames with Huge pages
To:     Xdp <xdp-newbies@vger.kernel.org>
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

> XDP does not allow jumbo frames due to the requirement of frameSize < pageSize.
>
> I'm also aware of the ongoing work related to scatter-gather
> (multi-buffers) to support jumbo frames with XDP.
>
> I'm wondering if jumbo frames can be more simply supported by using
> AF_XDP with huge pages (instead of multi-buffers)? If so, are jumbo
> frames supported in both Rx and Tx directions? I assume this support
> is likely driver specific?

I understand the multi-buffer requirement for the general eBPF/XDP
case to support jumbo frames.

However, for AF_XDP if the UMEM is composed of Huge pages with frame
size set to 8K or 16K and unaligned chunk flag enabled, the AF_XDP
rings (RX/TX) and the NIC rings (RX/TX) should all have buffer sizes
big enough for jumbo frames and direct access should work because it's
all contiguous memory. I don't see a need for multi-buffers for the
AF_XDP use case.

What am I missing?

* Is this use case a snowflake?
* Are there limitations in the ethernet drivers wrt to huge pages or
frame size limits?

Srivats
