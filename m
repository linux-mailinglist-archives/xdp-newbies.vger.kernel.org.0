Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731AE74BEC2
	for <lists+xdp-newbies@lfdr.de>; Sat,  8 Jul 2023 20:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjGHShh (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 8 Jul 2023 14:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGHShh (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 8 Jul 2023 14:37:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524291A8
        for <xdp-newbies@vger.kernel.org>; Sat,  8 Jul 2023 11:37:35 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so46732761fa.2
        for <xdp-newbies@vger.kernel.org>; Sat, 08 Jul 2023 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688841453; x=1691433453;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HUxxPT0UOOWF53wX4HXo8tkkIAaRlbiOadoJE91IPc=;
        b=rUCWD/gKCsIWkn+CkI9trm+mxuN2s4/MgW54/GMUFPbDTHz7Q1h79J1rpFANQ4akIR
         JqH8zwvHz8AeLbHwlrkrigUyZnno+rJuLFlbMcVWXFOH5KUQYjWvZRCmBYh/jY7AifrH
         gBo/1Y7pWy2bAWyAKpUqsM5/91ddy82c5rz2Ez/wpDXNJR5YEQgNVMqXkBFLNdembmRp
         ggYonryoMOmpA81YGbGizJvmtuLcAciKFuR4EQGM3i9r/0klwDNYlqagIcT2vhV8ASGO
         Sn4cKyvUohGU5IXrGVmgnOjo68FqVAp8RiE9y3vvUw26OUaxDL29LI4OGU/pdzRfVdoa
         HEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688841453; x=1691433453;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HUxxPT0UOOWF53wX4HXo8tkkIAaRlbiOadoJE91IPc=;
        b=Ube5JaE7pWUbU4IRngIJ1LfZTM+/W/PfyeAAJlsooIhx/F7qvyjGYVLlEycgmsAuCw
         HPE1vkyNyuCw0MWPI2jC/RhjMqGfJYWyWacBp1qTgYDD1qdQQhsbzz3alMXYcZMDL5Mg
         8lx46S5YVj6Zll7cMh9f8lb6VBRUoxMBBMIv/qnZSUTVJSIkV8tTdLaM90sKRQFqtdQM
         IV5GVkfk5uK9bw70ZPqk1GSizqZcoSzDQ4nPSFynQsZ5BiYP5ZTmsfcu7xJb67yXrke0
         9eS/eRlld6kCUqGXRXBuGFETiQV7YIBSi7LcXqAXkhxs1Uust++hNhO38sNpIQAWLhrK
         PEHg==
X-Gm-Message-State: ABy/qLak8bd25Y8hVcIROIFz4MDVTrmxIf3YzzxId+tRi4+0bQ7KS81v
        J5znil8vMLWjUvjf8OritYH6ctIPoMI=
X-Google-Smtp-Source: APBJJlFe+SQ9yxzkNX1nCEVM0+VDriQScJHH/ngCyAj7oNAX5ILl9s+xnL9wWoCRFtAXA76h+dunFg==
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id q26-20020a2e969a000000b002b6dcdeb77fmr6600620lji.35.1688841452969;
        Sat, 08 Jul 2023 11:37:32 -0700 (PDT)
Received: from user (85.253.129.61.cable.starman.ee. [85.253.129.61])
        by smtp.gmail.com with ESMTPSA id r6-20020a2e80c6000000b002b6dbce8325sm1280721ljg.24.2023.07.08.11.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 11:37:32 -0700 (PDT)
Date:   Sat, 8 Jul 2023 21:37:31 +0300
From:   Luigi De Matteis <luigi.dematteis.linuxdev@gmail.com>
To:     xdp-newbies@vger.kernel.org
Subject: error: =?utf-8?B?4oCYc29ja190eXBlX25hbWVz?= =?utf-8?B?4oCZ?=
 undeclared
Message-ID: <ZKms65z9ciQkzwjU@user>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_NEW_HELO_USER,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi you all,
I'm trying to build the linux kernel following the guide on
kernelnewbies, is there anybody who can help me to figure out what the
following error is pointing to?

  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
  CC      security/apparmor/net.o
security/apparmor/net.c: In function ‘audit_net_cb’:
security/apparmor/net.c:81:13: error: ‘sock_type_names’ undeclared (first use in this function)
   81 |         if (sock_type_names[aad(sa)->net.type])
      |             ^~~~~~~~~~~~~~~
security/apparmor/net.c:81:13: note: each undeclared identifier is reported only once for each function it appears in
make[4]: *** [scripts/Makefile.build:243: security/apparmor/net.o] Error 1
make[3]: *** [scripts/Makefile.build:477: security/apparmor] Error 2
make[2]: *** [scripts/Makefile.build:477: security] Error 2
make[1]: *** [/home/user/Desktop/kernel/git/kernels/staging/Makefile:2020: .] Error 2
make: *** [Makefile:234: __sub-make] Error 2


I'm running on Ubuntu 22.04

thank you in advance,
Luigi

