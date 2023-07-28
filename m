Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA7B7662A0
	for <lists+xdp-newbies@lfdr.de>; Fri, 28 Jul 2023 05:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjG1Dvs (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 27 Jul 2023 23:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjG1Dvr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 27 Jul 2023 23:51:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1282D40
        for <xdp-newbies@vger.kernel.org>; Thu, 27 Jul 2023 20:51:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so2878951e87.1
        for <xdp-newbies@vger.kernel.org>; Thu, 27 Jul 2023 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690516305; x=1691121105;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0AxmPES6KQVjtuWmURC/ljJ6ySWrFT12NnR64mLzZs=;
        b=GPQJObYiGNelGng+4oiVlZ3m1Vlx+dkOm3Ii+T9O1e5ImrUmNg0qAGLvu915fm9lQK
         6aogqaiMda/6KNWdf/KexnMq2SKA4EKly+zJY5WP5AnHkC23Pgs+UrLsrHwbl/VlB4g8
         HMtMcETbW08LaRzXFqqA9bIZJQMSATV4kZe/DW1ZqXFc7q/nnfrh/qu7ipYETKxFC9nj
         eG3jgngncPXe7l/j9sBNbh1cI9ivqlD3I5Z0pjJQEOni9HSebJQDczx8ztft7C7SoVnc
         pFF8cJOB/8WkbaWJtiP/9HswRjCHOF/moyZsMTiNpf1AEXBtIPL8bFqXgtiy2zyBO9u2
         FHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516305; x=1691121105;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0AxmPES6KQVjtuWmURC/ljJ6ySWrFT12NnR64mLzZs=;
        b=SDDOqMWhgTjsrhGz5bNfeJh5bCV6Oba8940e10cZ8PovzyhFCFA3MO82fEcwz/cnAv
         SOAEyPo3S4+uunvxrq1luZ7mpFdkdbJp2VQs51Mhsh92WxZ0k4s1575b5NxgU9etymFm
         D2ytMenrHWAo72tjg03qpRIF6HldzzYPHs3yOa42Cslq/Z3yJg70JvLYyi6gBHTZdqmY
         p5WsfMkHXEYiisLGYOzjKCH61bYf8HahDyl+lX52X6xc29P4QlYC0lhePd5gRp5rPNHx
         SBtC2YLM8m1VmlAzQ25avHWPfX2rJClK8Nw4zabH20lMoLOwGbJR3cXesc2f6l2ha0kn
         vrkA==
X-Gm-Message-State: ABy/qLbOWC7VSqsIUX/RaGjD/5PqOR5JK/ANrxILw+kQWj2g5Q7ebdfX
        x8a9M5FJDsVFjB3Xh6NgXNKrfQz3RndmWPspMg19YnK9
X-Google-Smtp-Source: APBJJlH5yYzll/j3y3Y10wswvBXcOXT4W4LTVOy/G+5BJ5b/CAzGPmRiaCa+bW5C/coiKC3g6VpVLMvnNYnEgf/3DUg=
X-Received: by 2002:a05:6512:3a85:b0:4f9:52f3:9a2b with SMTP id
 q5-20020a0565123a8500b004f952f39a2bmr881008lfu.54.1690516304770; Thu, 27 Jul
 2023 20:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+hDufANB4-u3Hb2ZLX-3P3KMQkLqGub6g7y9LHgkmLmHjKL5Q@mail.gmail.com>
In-Reply-To: <CA+hDufANB4-u3Hb2ZLX-3P3KMQkLqGub6g7y9LHgkmLmHjKL5Q@mail.gmail.com>
From:   =?UTF-8?B?6LaK5bOw6KO0?= <peiyuefeng@gmail.com>
Date:   Fri, 28 Jul 2023 11:51:32 +0800
Message-ID: <CA+hDufCfhfrnDKkuNG=exYqDOCR0QiAPoagzbLwwYZPa_+282w@mail.gmail.com>
Subject: Re: How to calculate the actual size of the memory occupied by the
 map in the bpf program?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

 The value of memlock can be seen through bpftool map, but this number
is not the actual size of the map, but only the data size of key and
value.

 Is there any way to estimate the actual size of the map in memory
based on the size of max_entries and key|value?

 Is there any way to know the actual size of each map in the current
xdp program?

 Best Regards
 Dalu Pay
