Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7AF75C757
	for <lists+xdp-newbies@lfdr.de>; Fri, 21 Jul 2023 15:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjGUNIL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 21 Jul 2023 09:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGUNIK (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 21 Jul 2023 09:08:10 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14270186
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Jul 2023 06:08:07 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fd190065a7so16057525e9.2
        for <xdp-newbies@vger.kernel.org>; Fri, 21 Jul 2023 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689944885; x=1690549685;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qF7yXYmtGw17kBq5jxlzl3L9qi9whnJ5KNC/dRoY8ac=;
        b=HrcXScnw4nAS7t/VBTB6/wIfW+VLR0kkmke2HxQwQO96GehEWrTH+rhT2VfYWkjwKc
         OXCFBqjfDBIN8SgPUVOihjrrsmXp9mJgW9D50Wq4biLk92nV0b0sZS3EseOZUIK3c8RQ
         CWrY2Um34favoZyqPL12I6bMWv2XKYrz/zaQUOlrZJW3cibFj0wju4rGHCqtlhP6dSGG
         HvJEvZPbBWe1kQcSJjCISCyP86qrTf2Qs7le8MgLsz5kl3FyXehKhxFidp8kZrbTSBh5
         b0M9+mQYPkYzuO4ZTdeTL47tY4cOrBYEB9WfK+ylc2E9+BMDi/UHRWXSoYUkrxr9AIYs
         LycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689944885; x=1690549685;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF7yXYmtGw17kBq5jxlzl3L9qi9whnJ5KNC/dRoY8ac=;
        b=dUsUo9hx4lPKc9IadhahHiXdH7zU+xRSly5sWxakJ6RN0Sw/Jsm0Q2ffd0sIQM+aE8
         Bzgbqe0FjN+OECp1miQHZEg2/XlA2+YVZem/76bg+S7TAdsFjB5X/6zQoWQx4IXTMXbF
         NJ8Dtxf7Vw9qRXJtu/9FGamqr/skJ7gB0QEFk1svLK+5tiv8zQtZNYKIYBgBlNZ/oliW
         Ah+P+vlDB3AxTiG3q7g+YtwClj/Gpz8sGKNiBTmN71iUcF8kSIEF1RSDbwmVK8/LCQVq
         j7JaWPxmObhWtenjJ9SmgtFa8zeJI6ITbWcXF/7rmnhoom/474k3HNviOhzZRR9fM7HI
         +IXw==
X-Gm-Message-State: ABy/qLZe3hdqgQ4/Ic2V3tlTdNMchyF1QT93gvGVQ1PR7p9APgXuTM2P
        qhcNcIKxpglE/OqGRrXoMJQJQHOIm+nw3w==
X-Google-Smtp-Source: APBJJlGftF3mj4Uu2Mt0CQ16LDKI4ghV7wLn5M9VI7eU2lY2b5VidIyVaHN6jCWSc8KTSiD+yJ0VpQ==
X-Received: by 2002:adf:e710:0:b0:314:8d:7eb5 with SMTP id c16-20020adfe710000000b00314008d7eb5mr1400678wrm.29.1689944885388;
        Fri, 21 Jul 2023 06:08:05 -0700 (PDT)
Received: from [192.168.1.20] ([82.66.150.212])
        by smtp.gmail.com with ESMTPSA id a12-20020a5d53cc000000b00313f9a0c521sm4145137wrw.107.2023.07.21.06.08.01
        for <xdp-newbies@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 06:08:02 -0700 (PDT)
Message-ID: <ac17e949-52c3-2e42-52e2-5774a9e0d6cd@gmail.com>
Date:   Fri, 21 Jul 2023 15:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To:     xdp-newbies@vger.kernel.org
From:   Alexandre Cassen <acassen@gmail.com>
Subject: New project around XDP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello,

Just this quick pop-up to announce new opensource project using XDP/eBPF :

www.gtp-guard.org

in short a GTP proxy/Firewall for mobile Core-Network and using XDP for 
its data-plane.

Any comments welcome.

regs,
Alexandre
