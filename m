Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A301C4DC75C
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 14:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbiCQNPm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 09:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234415AbiCQNPk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 09:15:40 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96EB18A792
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 06:14:23 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 6so2632000pgg.0
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/qhArArbXhNMCGkgJ6NaQpa8A592+UMEjPqh5islJWk=;
        b=I+VB7VNqUyW81n3/kzGyQBNn39gUeg4NrIAjFRMf+SgG30OTSIATEcQVkrARCe6iZf
         QFdvX/67mGJBkGY8P/oQlo9IGp1xnOrkNqEc83atL6tDnOMTYerQconh/i2LfHyJPxYK
         uqK9eVJNO1tRUUo1yGt+4Gooy8V7CnBnGI9WwTgouWfcpzMTPkAhMQe6Ts2HvIyKC5ZZ
         er3ho6eRso8AQQeUd/NfFyi/JVMv9KY8AB6WKxBR79spZgPQILFBdTTi3JmyDsYeNazo
         PESvw1yVE26mr1gs6IXMhuzdZxi57uf4gduZthqqPe9xp1WCIXmFkblk96wkpw+FsW5R
         vKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/qhArArbXhNMCGkgJ6NaQpa8A592+UMEjPqh5islJWk=;
        b=whfAABI7DKoMvc7NB6wJiuuoWaSIlkYWM6YfaAmc3+fEXgz79AVwRPifJAtDie5R25
         kK7ogMEWlTVTXfqLdcr3EXSVC41jJM4t+GzAKw4581L4gWFT5NWSp8Zz7TqGUyqMgKkf
         FWPRsrNLmhLC7XrUrK7Xwz80J+2M2+9l1g4bSbXpbFx59+6+QHE9Kq9hDmtqB1drkrbY
         Un9zB1kcdPrRGI28YA1UqlEQ++1jDdn1hlWIj99xhrH8pzX4nXDmUYfMzAm8c60IxVw1
         /MkHHW4is9ROqfgGv73pMX6tGQdaw4Y13VQsyIz1r8sEAeJHim3BLqljVdlgqvoIU4gP
         9n6A==
X-Gm-Message-State: AOAM533hroCtirxzQt5w8TszYfRq4KCyOJ0fbvRNG0YUdwc6WPKNkVAQ
        /ZGORASYtxtLA+f1+aPTJOGcCSQCUa5eQAveugrYzVcIFy0=
X-Google-Smtp-Source: ABdhPJwMFkZE5V8uNAiW/Y+vJVfUHN9rpRJkEp1WHdWZk8mObR7vkUaEdcKbI/Su9SICxQ1eMS6umr5pAqa0GFfNCpQ=
X-Received: by 2002:a63:101:0:b0:36c:6d40:5688 with SMTP id
 1-20020a630101000000b0036c6d405688mr3660521pgb.554.1647522862940; Thu, 17 Mar
 2022 06:14:22 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 17 Mar 2022 18:43:41 +0530
Message-ID: <CANzUK5919hyHSJf63nWJ2wefG57AKAB7W=D0AkUFKdP9s2BH+w@mail.gmail.com>
Subject: Jumbo frames with Huge pages
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

Hi,

XDP does not allow jumbo frames due to the requirement of frameSize < pageSize.

I'm also aware of the ongoing work related to scatter-gather
(multi-buffers) to support jumbo frames with XDP.

I'm wondering if jumbo frames can be more simply supported by using
AF_XDP with huge pages (instead of multi-buffers)? If so, are jumbo
frames supported in both Rx and Tx directions? I assume this support
is likely driver specific?

Any info on using huge pages to support jumbo frames is appreciated.

Thanks in advance,
Srivats
