Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8947B9FE8
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Oct 2023 16:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbjJEOan (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 5 Oct 2023 10:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbjJEO3E (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 5 Oct 2023 10:29:04 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AF426A6F
        for <xdp-newbies@vger.kernel.org>; Thu,  5 Oct 2023 05:57:40 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d818d65f23cso992483276.3
        for <xdp-newbies@vger.kernel.org>; Thu, 05 Oct 2023 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696510660; x=1697115460; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X0o8iBcdzUfdHlP1uGz/G1lb/EXIWc7OeCXrfObQS34=;
        b=eLwutxJ/x2zGijrkviv2duBcrlCEWlj7j1IBEvG7c18JBpWeD0VfiDD3mkreFV8MAl
         Lz6QrzWK3wwl8B+JkPrpZVdfC+/DqvSKmSd+8MyxJcgpWW1syQJxQKdP+NlXG4m8j/SL
         PYv9o356fWDB7RwOJUtZhUHrgrhag+KbNytQPFdNIXUfaVMdqeKGfGvtKZAC0H0ZtAeD
         kV6kb+vcxcLTwNH38rcScQMKNIIsNnGwNYsgdCuW1wG3kDHIffPWiTjpKYRmpreDnf/B
         C4lYnyTGMoNol0UBW/potHukP+E79E+M2xxS0CRBN09cHiEontd1ZfR8eddwjXNq1TKL
         hJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696510660; x=1697115460;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0o8iBcdzUfdHlP1uGz/G1lb/EXIWc7OeCXrfObQS34=;
        b=uJOvu5dznZuKr8nwJndtganF/TZH2urLW1hlCnavqmBaih9iXoVwrtPSpt5VGKbltt
         qhDa7YXZsziU1EZxi0Sf/wGe7VDNG9+gcI6TGb44aUAg2xzAcpuxzpmszVZ8tDDWBHaF
         2TOlnzOp4FCmcpVnZXU8babmxFowLqzEqzalNsBOnt0MHP/osqDJ1Kb7QDBdtbcB4w2L
         a0Z7HciRb44iSc7Xg+nTRVIhJdHP9ARQlGI5Prvqo3X+xu1flwDaM1eruOUxesosTxxx
         N7WE44OHpOBONe+yzkI7mka1yNRHFfLCzWYhebkz6GMVZrsecAHlmnfqM3NOaaak45ym
         TkxA==
X-Gm-Message-State: AOJu0YxO07exAU+Lf3I9NSyVxI7KN1GrZFGwOZiJA29ZR/jZAgj/lNPV
        pERb2kdvQzu7o/zEi3wUxACXtcGmd56tBNOSsjhFHd5+wQU=
X-Google-Smtp-Source: AGHT+IH1+tlb1nFWzN9qIIJT5zPa/qbqNKYSbbtsEXNC4fBMX/Fxf1kxutHmAJgEG35mXUjHPWdmaZnG/42q3HSOafQ=
X-Received: by 2002:a25:acd2:0:b0:d4a:d2e2:afe0 with SMTP id
 x18-20020a25acd2000000b00d4ad2e2afe0mr5219663ybd.14.1696510659683; Thu, 05
 Oct 2023 05:57:39 -0700 (PDT)
MIME-Version: 1.0
From:   Srivats P <pstavirs@gmail.com>
Date:   Thu, 5 Oct 2023 18:27:03 +0530
Message-ID: <CANzUK5_amwfvNb-MRGaGezzpnsvToze22XcHQ_LeTbOBAWkE6Q@mail.gmail.com>
Subject: AF_XDP RX processing with NO rx-ring
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I want to clarify my AF_XDP understanding for a particular scenario.

Consider a single UMEM with 1 Fill Ring and 1 Completion Ring and
single XDP socket  bound to queue 0 with 1 Tx Ring but NO Rx Ring.
Assume the NIC has only a single queue (to keep things simple for
explaining this scenario).

There is a XDP program attached to Queue 0 which does either a
XDP_DROP or XDP_PASS for all Rx packets.

We are running in Driver mode.

What happens to RX packets received on Queue 0?

Here's my understanding -

 * Even though there is no AF_XDP Rx Ring, there will be a NIC Rx Ring
for queue 0
 * The NIC Rx Ring for queue 0 is populated by the driver with UMEM
buffers taken from the Fill ring
 * A Rx packet will be received in the NIC Rx Ring for Queue 0 first
 * The driver will run the XDP program on the Rx packet buffer (a UMEM buffer)
 * If the program results in XDP_DROP, the driver will "free" the Umem
buffer by putting it on the Completion Ring
 * If the program results in XDP_PASS, the driver will allocate a
standard Linux kernel SKB, copy the packet buffer contents into the
SKB and queue it up for standard netdev processing; It will then
"free" the RX Umem buffer by putting it on the Completion Ring (since
we have already copied packet into the skb)

Is this understanding correct or am I mistaken anywhere?

Thanks in advance,
Srivats
