Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7337E1DAB
	for <lists+xdp-newbies@lfdr.de>; Mon,  6 Nov 2023 10:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjKFJ5h (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 6 Nov 2023 04:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjKFJ5g (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 6 Nov 2023 04:57:36 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B1A6
        for <xdp-newbies@vger.kernel.org>; Mon,  6 Nov 2023 01:57:34 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5820299b99cso2583488eaf.1
        for <xdp-newbies@vger.kernel.org>; Mon, 06 Nov 2023 01:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wikimedia.org; s=google; t=1699264653; x=1699869453; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IKnkzws/m272TpjRjuPAIZKt/xs5OZvPaohgjd4v+ls=;
        b=FdjnjFzsMQgkWR5tdSFJ1YR7mVSGqdAu6PNX79WRDApaZIl1awGKdpEkgXGW7JOcXg
         YixgvH8Uyr0ZDj8Eig0vOEdg7w15ZRd0e9JvjG5xVVgwpmrWGpaSzK6lnGCiJ4qKhSBY
         yM+hrRmps2TK3ZZt4pSDyFIWMJVbm8Id0nKws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699264653; x=1699869453;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKnkzws/m272TpjRjuPAIZKt/xs5OZvPaohgjd4v+ls=;
        b=SvbmwYzrvCYYiQZaqwAxmVz3HjUrX9v+7NAYPIvygkAztzmjRBmRGD4oSlQS1+ccMk
         QK6vnNaNBd8/ulYT09AC5BxrGEO5aA5YA9+hB0akBwWrWObrW0NW3TthFmLDqcT9cXbY
         0XjPYCSDA3a1wGoirFFGuNSLgtTnQTy8zrP6dyH6iRBY8F6KzEEClGBAq/mKbR9CPzAS
         es2AjO16klaG7VZYN18BGAT3I1NvCMgshvY0IORFl4+3MQYynhD9SI6NrDVRyIi+pvVV
         vhrYdqvvNlcOmNoqTaSaQSX2Kh6VkiRka/x/zvFEKTdQ7RvEgSIMZRX4QNkdsuhxwm6I
         COdw==
X-Gm-Message-State: AOJu0Yx04VItnlfd1s7QYKkpE0yqFl9apwBaCvwDPzZqUFOM0nhUQzuC
        RCdY4zWdqcmE4HXBjA4YzwcfVwi3zhmE95afEvo6dlaDEh6hZGq1yg==
X-Google-Smtp-Source: AGHT+IEsTE8qRskPwUeHyorLbYUads+xjX47ILoF7FT7bbjs7YIH+Nc7MCqkHymvEue8HP7EV/8gaBie5ghrxR8+5aY=
X-Received: by 2002:a05:6870:724e:b0:1e9:6a4e:6b56 with SMTP id
 y14-20020a056870724e00b001e96a4e6b56mr6002225oaf.3.1699264653349; Mon, 06 Nov
 2023 01:57:33 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Valent=C3=ADn_Gutierrez?= <vgutierrez@wikimedia.org>
Date:   Mon, 6 Nov 2023 10:57:22 +0100
Message-ID: <CALQkE9a0VWPZs3cXmWCyd4TWp2uDzghfhd8-VAAAb2Gtc-5CgA@mail.gmail.com>
Subject: MSS clamping with XDP/eBPF
To:     xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi,

I'm trying to perform some basic TCP MSS clamping with eBPF and it's
being harder than expected:

* Parsing TCP options can be challenging for the eBPF verifier as it's
been shown in [1] by Christian Deacon.
* bpf_store_hdr_opt() introduced in [2] doesn't seem to be useful here
cause it refuses to overwrite an existing TCP option and MSS is
already set when BPF_SOCK_OPS_WRITE_HDR_OPT_CB is triggered.
* bpf_setsockopt() isn't able to set TCP_MAXSEG per [3].

Am I missing something?

Thanks,
Valentin Gutierrez

[1] https://github.com/gamemann/XDP-TCP-Header-Options/
[2] https://lore.kernel.org/bpf/20200730205748.3354954-1-kafai@fb.com/T/
[3] https://github.com/torvalds/linux/blob/d2f51b3516dade79269ff45eae2a7668ae711b25/net/core/filter.c#L5151
