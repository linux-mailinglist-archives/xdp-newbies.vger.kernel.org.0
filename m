Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC876F13A1
	for <lists+xdp-newbies@lfdr.de>; Fri, 28 Apr 2023 10:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345452AbjD1Ixt (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 28 Apr 2023 04:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345607AbjD1Ixc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 28 Apr 2023 04:53:32 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2749D6183
        for <xdp-newbies@vger.kernel.org>; Fri, 28 Apr 2023 01:52:57 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6a5f03551fdso7200372a34.0
        for <xdp-newbies@vger.kernel.org>; Fri, 28 Apr 2023 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671960; x=1685263960;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVU03kRNS3s05bMbtN2tGD02CLGjL7t7hvMi1z7794Q=;
        b=H4OlYDM/9uPLri13FjKg40DHGaczSKGeixs4Z/Yno87Y64uGpHypwsd7ktd3Z4cCJh
         EjT70MpH8OhsvRqId3SOc7//BMwp52xMKcI2zcCzSjbLihyJzKaGRfJQ+5iL9TFZT4MG
         7TKh3RUfyGAmhblMr2tigLtdDL+yVl9U/nSBpYx7hnsS0KFqDsqIw/lhC/xyyq5mBaz8
         LZclvUdG7VNmbtNuNbhq6wa6Rb9W8jVBVm6c30/JD7wUcYbpQw53WSWegGo9RANTWZOI
         QTILoBoGmGI9qcI5q7GKXH5Y4v1qE34hzuTqLESBZzshIF9LKSdkYwiSOK7HPuy5xcy+
         lxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671960; x=1685263960;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVU03kRNS3s05bMbtN2tGD02CLGjL7t7hvMi1z7794Q=;
        b=ULtsT3tetnKVGvXbEUfXqh4TFFWwTUYFSYfBtOjqz8tOPXwX0ldp7xIwwimWZQ07If
         KZmonql1z8ZPZi7eLiA0CzsiKxgGVV7QGJ+PBFMhK4beZGL2dzZ8guQm/U38+fJcfnH7
         nkzHaCUMxbK2XLAX8kdGV8u/XI2pwgYxbGgp/7yqDK9RX0G46rfi0zyNriAuWHcFhE3a
         +Yl8Q5UYhjJAF5UNG5QZNicLhZD2CLlwoqEZAvBBJBnz7djcIdSQ1EpN1Yh5YzSz3foK
         lTpYhc8INCDfvcR0sRSa+uKGq6N/YfewXiO89rF9Y8BGD9Z7RA2e6Y1GGVMPyLqAzd0X
         9KAg==
X-Gm-Message-State: AC+VfDwPPpr2Cj7X1d81iGKuYEfK2efZIkl5YmI01vUWWQJtZQ5kaFll
        ysAlIE4OrZ5wXJUWeiQNtcB1nf9FvSSgLyNjYOfDkw+Q6trNLw==
X-Google-Smtp-Source: ACHHUZ7Kb1MR8sWuSl+7LJEN/oniweRJhlqUn97bgKi3Hqe1PzQoO3550JTZzwrncWKrrl0u8ZU0nKhHsAt9irVM2AQ=
X-Received: by 2002:aca:2212:0:b0:38c:66d3:67bf with SMTP id
 b18-20020aca2212000000b0038c66d367bfmr2006745oic.4.1682671960023; Fri, 28 Apr
 2023 01:52:40 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ctxspi@gmail.com
From:   Marco <ctxspi@gmail.com>
Date:   Fri, 28 Apr 2023 11:55:17 +0200
Message-ID: <CAAVAo4MCYB9LKeDVJ=5Eaiy2gJ00bEvbvnE6PzQEc=U67WPQ4A@mail.gmail.com>
Subject: Ebpf map question
To:     xdp-newbies@vger.kernel.org
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

Hi

Assuming to have this struct:

struct hash_elem {
    int cnt;
    };

and kernel space program want read cnt value:

struct hash_elem *val = bpf_map_lookup_elem(&hash_map, &key);

    if (val)
   {

# time fraction

    bpf_printk("My value %d", val->cnt);
    }

What happens if the hash_map is a pinned map and in the same time
space of 'time fraction" a user program deletes the element of the
key?
What happen at val pointer?


Thanks.

Marco
