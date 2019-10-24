Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F47CE3D65
	for <lists+xdp-newbies@lfdr.de>; Thu, 24 Oct 2019 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfJXUgE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 24 Oct 2019 16:36:04 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:39253 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbfJXUgD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 24 Oct 2019 16:36:03 -0400
Received: by mail-pf1-f173.google.com with SMTP id v4so14117pff.6
        for <xdp-newbies@vger.kernel.org>; Thu, 24 Oct 2019 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ej4xVLPfY3O2YMMKTBv0N93ee8XCBBmfcP5yXosNVyA=;
        b=ksCq9q0nZcN3VMqqrho1u+XWdAR4Eg73QRi9jQxA9dEFsfpaxNpJ4U892/Z/fYm+1V
         gfyFeQn70QKjAK/3j3IjB/Ej095KXrT2g8xsWQgQXnmcY+Wksog6SMZAEU67aSLzkjHD
         OGn9NTLCRgRAyK9LqG0SRxTRDbm5v39zfntSc9zOFeByDxZXgVy0vW7YbUx66h9jgQFE
         UDz0WT+SkWyd2Y4scw3nHDpPKgGCWfEQDk/nywc/Xk6arJqWpmABqMPSLXgEup/OoVDJ
         zHP5bufzlcwo7rso7X/RicD3X7Ok8WgZEz06SzFQcIuxmYYQJPBrbwuCGuQgEdm7EkxY
         6SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ej4xVLPfY3O2YMMKTBv0N93ee8XCBBmfcP5yXosNVyA=;
        b=MhxWlWWHI2WMLXYOAx2ROM/0184Z5gXbunfFUAMdOt9VSybOSAEvl6+Im/2GiUWlh5
         1iGR/XPAmLmtoDz9rLoVs+P7m6C8tUeAytUZgIisBOMz5As6VDAstQUzkKNE0FFDF28b
         V5Bu1GmN4ra0LgnvPOpapImQXLbOfdCfQxHJZdUL5y3AXeNaGvcgpAJa8f5zRBTsh0Y3
         oz9vpBnfZtF1hlFAmZFoBdjaqs2MhJdm0Piu/aVxriZt/KexVN9g+oDEggRhYznsgReC
         Isi+7uJWMAppOt3I0pChCyziSo7xgPKI3UcFQE1B3DCfEbQ7gixg1VpHRRLSKoOfLxew
         Fv5A==
X-Gm-Message-State: APjAAAXAhvrl79mmIf+aTfuYFILWl6iiAJ/wOHnspXVvhAFX8WzlZe8g
        OokE2rxgejJtxONegMLTqPFrMq5KFlZjaK48R4czUgh/
X-Google-Smtp-Source: APXvYqzJNjwdf9dfPMHBhdSIu8jahPQQSqat6kMALzNzkBlNUByVlPP663yP1RZzmj3noOg9EsbXKzTXWjTFyhu7Cd0=
X-Received: by 2002:a63:fe55:: with SMTP id x21mr18454051pgj.124.1571949361510;
 Thu, 24 Oct 2019 13:36:01 -0700 (PDT)
MIME-Version: 1.0
From:   Farid Zakaria <farid.m.zakaria@gmail.com>
Date:   Thu, 24 Oct 2019 13:35:50 -0700
Message-ID: <CACCo2jmAx7SGU_TNU8EhVCKumcb7gSiwF0wGYvbJ8Ld3Yqfdug@mail.gmail.com>
Subject: Useful request_id concept for bpf_debug_printk
To:     Xdp <xdp-newbies@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

I wanted to share an idiom we've used when first developing our ebpf filter:

When having first developed our ebpf filter we heavily leaned on
`bpf_trace_printk` and `/sys/kernel/debug/tracing/trace_pipe` for
debugging.

With any load on the filter however the messages become difficult to
parse as they are interleaved with other executions & the pid in the
message may be not enough to discern a single run of the filter.

I found the following macros useful:

#define REQUEST_ID() bpf_get_prandom_u32()
#define DEBUG(id, x, ...) bpf_debug_printk("[%u]" x, id, ##__VA_ARGS__)

unsigned long long request_id = REQUEST_ID();
DEBUG(request_id, "starting filter.\n");

After that you can easily pipe the output of trace_pipe through grep.

Cheers,
Farid Zakaria
