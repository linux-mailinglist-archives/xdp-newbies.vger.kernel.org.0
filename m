Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9808DD8736
	for <lists+xdp-newbies@lfdr.de>; Wed, 16 Oct 2019 06:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbfJPEVL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 16 Oct 2019 00:21:11 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42759 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389422AbfJPEVL (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 16 Oct 2019 00:21:11 -0400
Received: by mail-il1-f193.google.com with SMTP id o18so1163564ilo.9
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Oct 2019 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sage.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BS+e9nspz4f+pclOvBMrcga+no7MZ9imggzlFCjixoE=;
        b=ZsfPmdi5mxUBNEVl1PJ0bvF2jOuXjfOYYFA5qZbN0wa4dmKN0fSisq5TPQNbWnLtul
         vvZaooPcWN7CJUq8KEbdI1z5rIOI8vsz83uBev01KDFSW8hAYyOjl82U0VkSqYy+loaq
         dat9VIPH9ueq/R186IRbZCzEJJShx5grlMEIM2dcUOiTbX4mnBkwWgfbS36cuPcXIZgm
         L8eviH/l2cdNA1dI6OBRXLap5Qfye/Hex79v00wul9/QpCG4ik25oswPKLcsbnJbySel
         QYRgxTYK3iNGnxcxlfqFPjvhJqZC8KEVBdL59J1iCRMe4Ley0ZB35soRE3wuNlsPbFD1
         Knfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BS+e9nspz4f+pclOvBMrcga+no7MZ9imggzlFCjixoE=;
        b=j2/DGCdrsbqIHmMHT0+wb1Q4gq1nrPoZsOgxiAVJQ2fsIIaawpjRv7ZJp09+GSKCle
         avOcRtcmOwz65QzJ8Nvmha0dYYwgAra/wupR66hEI89Bb9+AF1QdCs7+g/EURipcH1cQ
         wZPDnAvwExrZL+kK/y/UVCOJvvI45/CPzFslIZSWOiEk3U9FKtkwgliQ0SV6A0dKIM2d
         WgV9JIZEYVEyNMUr/jznXFLOA+guIcdgyaVRF+sDR7uGRk2cxy2hYCY3zXz5ew2DhN0F
         esB59URSU5J97Ho2ucDWa1IKugPG2XBLGBI5zP3MxjBMEkasKqovpleLl9HmoufofS1G
         om5w==
X-Gm-Message-State: APjAAAVGoLqbOjrgqKrSRtXF1TbHZIBddlvJiQqS2zD8Rc1b3NgexzvE
        b5R4w9ICXTjLqiWSEaV5QMxK9A==
X-Google-Smtp-Source: APXvYqyJlIQHB/w9Yrey70BuZTussI2aVZEeUsMGdG1WP718FZvQABX+kAPni44WH3Ff4BUx514Uxg==
X-Received: by 2002:a92:ab08:: with SMTP id v8mr9846281ilh.231.1571199670277;
        Tue, 15 Oct 2019 21:21:10 -0700 (PDT)
Received: from wizard.attlocal.net ([2600:1700:4a30:fd70::13])
        by smtp.gmail.com with ESMTPSA id o16sm3701624ilf.80.2019.10.15.21.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 21:21:09 -0700 (PDT)
Date:   Tue, 15 Oct 2019 21:21:04 -0700
From:   Eric Sage <eric@sage.org>
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        xdp-newbies@vger.kernel.org, brouer@redhat.org,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH] samples/bpf: make xdp_monitor use raw_tracepoints
Message-ID: <20191016042104.GA27738@wizard.attlocal.net>
References: <20191007045726.21467-1-eric@sage.org>
 <20191007110020.6bf8dbc2@carbon>
 <CAEf4BzacEF0Ga921DCuYCVTxR4rFdOzmRt5o0T7HH-H38gEccg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzacEF0Ga921DCuYCVTxR4rFdOzmRt5o0T7HH-H38gEccg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I'm no longer able to build the samples with 'make M=samples/bpf'.

I get errors in task_fd_query_user.c like:

samples/bpf/task_fd_query_user.c:153:29: error: ‘PERF_EVENT_IOC_ENABLE’
undeclared.

Am I missing a dependancy?
