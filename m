Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 535777417CB
	for <lists+xdp-newbies@lfdr.de>; Wed, 28 Jun 2023 20:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjF1SGe (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 28 Jun 2023 14:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjF1SGe (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 28 Jun 2023 14:06:34 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C20F1738
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Jun 2023 11:06:33 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b2f0a140b7so5579621a34.3
        for <xdp-newbies@vger.kernel.org>; Wed, 28 Jun 2023 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687975592; x=1690567592;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QOFvk79MTEjiYev9hxGD1DFViidz9AbiRj5E4RQpCMo=;
        b=U3MnrbLbhIqe3mK49ctg4bCGTPxDtMepwk/3CYnqEZqnSJ7E4VR7B+qnQdynIOdWHU
         caqFpl6QgyTdhL/2y9bvSg60pbn/X5P0MYRiUtLQzKOhBxLDqUqXzXkCbMcESNz+ZjqB
         rt5nYK2arCCrgfiIzELv5lft+AvfeLCWVSjl0yFfPcsQhUOv8KmK3qbtR01ntvxXRiwJ
         XQ5plqSo1m/ZDxb+TGnRhMbnLJsJAF7kxJbCTMl2ntCMpW8MOjwMEzcTzIW7kB6cXm7o
         KjhErrUXqzm8c7FianF8CEeRjLgEx/gUSX/HGKY90TsZ3Q6dXLtGJQjRq+/uvnOlTOQ+
         26aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687975592; x=1690567592;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOFvk79MTEjiYev9hxGD1DFViidz9AbiRj5E4RQpCMo=;
        b=ReEZ9lMvvcxyQJ8sUazewTQpB9FdWcJNtun3guqckio8IrYly93f26Y0Yl2bzTxbl8
         OWrftq3vzSBzC6uJYKC+e34paFEf9hlDrYczMS/KuDbLeCnMFw5FHs08VytxQ0UMHAPL
         /Vxh9oZ7AbjVwagbt7P3PGuioxyexEcjtZ+TqasYRfQWPVSXVwhA8IXod7CNywZx6BV6
         BvyRK6y1YB+aycY+w3nDmpH8GlSEYoy+IGKNeomFBAKBF9+Trd9cRAumlNx+XIlB+4dV
         5BzTAvx7l4s4FtfyqpBPWLoz4jek9yP7xi1klwFw/JVK57hfNwdu13Y6q9L81MxvEoft
         4ZBw==
X-Gm-Message-State: AC+VfDwvnVMKxD3myHfANvu/fXbGH7fJeS/IHYXuSk/XznfONylY9pnJ
        FMqJ0MCvRPqPeSf/vaGp6shlEObAPkgqSAL2b0cUvhBK+Nc5eg==
X-Google-Smtp-Source: ACHHUZ7H+N+C552vn3rE5B5hBWZ+H7A+3VfLXz7hHeyQfgLDiATvwE0bXLO5/rTVu7s8gjKqPbkzlA3RYYxlU8rB3rc=
X-Received: by 2002:a05:6830:2089:b0:6b8:6a83:2b17 with SMTP id
 y9-20020a056830208900b006b86a832b17mr5424645otq.33.1687975592368; Wed, 28 Jun
 2023 11:06:32 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?J=C3=BAlius_Milan?= <julius.milan.22@gmail.com>
Date:   Wed, 28 Jun 2023 20:06:20 +0200
Message-ID: <CANaGk7snu9tuzq=WxkUX48hpK-q2p_d=oLq-7Q6BcK_i4EiEPA@mail.gmail.com>
Subject: possibility to fill completion queue from user space?
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi all

I am writing an AF_XDP based user space application.
However in my use case, packets payload get fragmented while
processing, basically new packets are constructed inside and sent
further.
I probably cannot avoid mempcy anyway.

So I plan to solve it simply - one umem per port, no locking, no
keeping track of umem frames presence (kernel / user space) . Just
usage of the rings, one half of the frames to circulate between the RX
 <-> fill queue, the other half TX <-> completion queue.

Is it actually possible to initialize the rings in such a way that at
the very beginning I would fill the completion queue by some frames?
This is to avoid multithreaded access to the free frames without
locking (initial TX would take a look for free frames inside the
completion queue).

If it's a bad idea, what else would you suggest?

Thank you
Julius
