Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499E643CDF1
	for <lists+xdp-newbies@lfdr.de>; Wed, 27 Oct 2021 17:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242842AbhJ0Pvf (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 27 Oct 2021 11:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242838AbhJ0Pve (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 27 Oct 2021 11:51:34 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F983C061570
        for <xdp-newbies@vger.kernel.org>; Wed, 27 Oct 2021 08:49:09 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 67so7419166yba.6
        for <xdp-newbies@vger.kernel.org>; Wed, 27 Oct 2021 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGvF9Kds9vuiIHNhmnZscjYTUsrKof0kBkN4BlKFF64=;
        b=T5r1SdvPJcJDk2E2BjePGqpJc+I1lq6P/no8GdYSMt5FsgDmUHUKZJBib3BLP88ky0
         wUtdrqlgxxuRIquN0TH6BQ0VgbTouSayQZexfy3kqvalV5EzjDsnbNlxaQGZoHjql/Ol
         9zKucKC3a/ZqDXXR8Z5uafib/uhzg1oXC4xFGqrAQmmA5sdEfomzYfNvQNc68zZVo0DW
         RFMNrjS8LX8kDl/rp4DZFuebzM3i5FNd6nEOvOk1FLldEUk/R3EAJOSxOjDqIpaICKVw
         opGUkWewfYAYR15/VULhmb1VRi+U60YGFJRxIhL9S35/f09xxGPzc6tnYz+xggpnjgpY
         3Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGvF9Kds9vuiIHNhmnZscjYTUsrKof0kBkN4BlKFF64=;
        b=DbAGTKWf9HJa71dSu0kOGGpzZbX45PKMfuIj61uM54ZwEshmmDvBd//kSlw77zs2nN
         jUuz12twapfs0H4Y2JWjaMqfSZSLQhWKx7V9JOVc7/rF6VT/CAxWRpcnWVE27K4wwwcT
         4twiCFiAItHsMnkGpRv7SRxaUW8SGSngjvWvnX6y3VsVy8UTsx8Uslx0tCH4vnep2RwJ
         9eg4ewxA7VEYhx6ELJ7j7z/VQBsHOznJ8KAiYxLIfoHQQoD8FXMoLpXqJSYl6snPdY56
         rikA0W54no0mY6zJbWu9Jz5/DGxqHPgfmzatkvMPA8zzNpeiqUeH0i7SPoXaaSv2gUqh
         4sFw==
X-Gm-Message-State: AOAM5326ARzOURarGf4KJXJRf8VfasElg6vIvHv2rUbtsC7djlqCD5rn
        pPGNO7BSuksrlQ5TdW/gh0HG1mUeNfKadcxn+CU=
X-Google-Smtp-Source: ABdhPJyIz3A9jsRqOaAM3suM4caICBG3fMljaUNSdKNBQtncNTzZqkMWwGZ88e+GjponJHJ6Dk14kVocsz6rYfQNOxw=
X-Received: by 2002:a25:5ec1:: with SMTP id s184mr33218608ybb.11.1635349748283;
 Wed, 27 Oct 2021 08:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
 <875ytlcrdi.fsf@toke.dk> <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
 <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
 <CAEM4-kBho+aUNNSAoGWWF-Ou=2QC+7b6OD6m+JixOHCcye9RFw@mail.gmail.com>
 <87pmrqaeep.fsf@toke.dk> <ee690d7f-322f-ab51-2c13-06919c10d3ad@redhat.com>
In-Reply-To: <ee690d7f-322f-ab51-2c13-06919c10d3ad@redhat.com>
From:   Jun Hu <hujun.work@gmail.com>
Date:   Wed, 27 Oct 2021 08:48:58 -0700
Message-ID: <CAEM4-kBiUPF67pnHo3O+7dC8yE8eSgiJ9ZOa4T1MwS-E+wmc6Q@mail.gmail.com>
Subject: Re: AF_XDP socket TX path interact with TC?
To:     Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Konrad Zemek <konrad@zemek.io>, brouer@redhat.com,
        xdp-newbies@vger.kernel.org,
        "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
        Freysteinn Alfredsson <Freysteinn.Alfredsson@kau.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

> What is your use-case for adding a TX-timestamp to the packet?
>
> --Jesper
my use case is rather simple, I want to use AF_XDP for traffic tester
type of application, essentially, this application generates testing
traffic, egress via NIC-1, goes into a DUT, and DUT forward the
traffic back into NIC-2, the application need to measure the DUT's
forwarding latency for each packet, so it needs to know the timestamp
of test traffic TX on NIC-1 and RX on NIC-2

                  +-----+
|---------------- | DUT |----------------|
|                 +-----+                |
|                                        |
|          +-------------------+         |
|  <-----  |                   |  <----  |
+----------|NIC-1        NIC-2 |---------+
           |                   |
           +-------------------+
