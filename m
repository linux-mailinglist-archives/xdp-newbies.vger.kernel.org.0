Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7F16F71F7
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 May 2023 20:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjEDS2v (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 4 May 2023 14:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjEDS2u (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Thu, 4 May 2023 14:28:50 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18A55FC5
        for <xdp-newbies@vger.kernel.org>; Thu,  4 May 2023 11:28:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso1553424a12.0
        for <xdp-newbies@vger.kernel.org>; Thu, 04 May 2023 11:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1683224928; x=1685816928;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdVyy+VQDWJLE/f21jrKVLscLx3uQ095PaOfXqHJqSE=;
        b=gQgzQ1oCNW2M6k9eqBIamkc0uzBWkzeMFxtuhD8XjpwH1F3jOZ35xtk/8aej83PCYj
         a1qzHN+L8NdqKw8AvBJN5of1oEciCbkxBnUPaR1PU67lmbzzP0PiBq/8mGITbMJgjmIC
         lvT1q0VB+OU43WmZIbW2fdPb5ep+rPTd0UOj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683224928; x=1685816928;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdVyy+VQDWJLE/f21jrKVLscLx3uQ095PaOfXqHJqSE=;
        b=bVJBxVV6ubOGpfOzhx8S48Z7Uh+j8R4zJHXQYBL9I5ycUzBko8rcv+dUggZsaqOFoy
         xdvW5u8unaX1YIymaRkj1TGHLFmB2jHzOMpaqoknFPm1lxM8XAHLessu69SGbXXtvFEI
         qQU6khWDJF6loIzKL6N6LEZE7AZh2pCF3nux2ajQsPQfBAscBIZsAMJsnC5/j6F7U9bW
         D+hA5ZNtvEhC+xsRctBXcCCTZ0cmLNlyvqhIquLwZhdB0gZ/f8erYGubtPuB1u+kdnHf
         KNMCzTFIvD+oPKuMuJN6C4kGUBLOel2O54MSYRrvfuR0jHs/lpCKfkAWzx4h2rv7JK38
         u2dw==
X-Gm-Message-State: AC+VfDy3NF8VPdGVuBlVhmT0ZTciae79QGZ97cHs86PCrvrdm7kseARc
        2HL8Bw/dhTi88DiLH239k0OgNKBSBgZK/NREdTIBYlw9yrMI0kYRI4w=
X-Google-Smtp-Source: ACHHUZ7/APYd8uVoNa/eq6XTsFF0Xz+1crxHZmu/Qfotk7Ywwtzt5LI9Ik7vqFiN57q/wxyfdQd9L1KaqQh16Lb5jaY=
X-Received: by 2002:a17:907:70a:b0:957:28ed:aeb6 with SMTP id
 xb10-20020a170907070a00b0095728edaeb6mr7130364ejb.11.1683224927841; Thu, 04
 May 2023 11:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLRUnDWorqnndvxXe=oUuAgQ+z8kRFpn0ZWN4RexkMOyO_X2Q@mail.gmail.com>
 <cf0c3dba-719d-ddc1-5332-c873c0e8c758@intel.com> <CA+t96KCemTbqamJezLJ0sn0nN8EUrYd365iLmmv10qEVrF1_bQ@mail.gmail.com>
In-Reply-To: <CA+t96KCemTbqamJezLJ0sn0nN8EUrYd365iLmmv10qEVrF1_bQ@mail.gmail.com>
From:   Sanjay Rao <srao@fastly.com>
Date:   Thu, 4 May 2023 23:58:36 +0530
Message-ID: <CA+t96KBZiDLde7WvG9R95ENg8r0iQUVofe5jRWDpQmx+SnbabQ@mail.gmail.com>
Subject: XDP-REDIRECT cpu affinity
Cc:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I am looking at the implementation of ndo_xdp_xmit() in
mlx5/core/en/xdp.c (most other drivers also have similar
implementations). This function is called for XDP-REDIRECT.

int mlx5e_xdp_xmit(struct net_device *dev, int n, struct xdp_frame
**frames, u32 flags)
{
   ------
   ------

   sq_num = smp_processor_id();
   if (unlikely(sq_num >= priv->channels.num))
       return -ENXIO;

   --------
}


Doesn't this restrict all ports to be bound to the same CPUs via
smp_affinity? In my setup, one port has CPUs 1-63 and the other has
65-127 for a 63 queue configuration. XDP_REDIRECT will fail because
65-127 will exceed the channel count. Is that by design, or am I
missing something? We can find a similar implementation for the i40e
driver as well.

Regards,
Sanjay
