Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F7F1F5DBA
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFJViC (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:38:02 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42086 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726134AbgFJViC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591825081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J3LtM2LEd2bQx83fx96JWg3WV4L6ZJHyjpyHItUBB0E=;
        b=EPP403xHKfuigxoRkAdkUsuEQy4tuaEEU1RiTVxPIgMGBtp8fYkVKwMZoVUPP1RrUpFfRo
        k+5wATUB5CEJodfZD9OSqnZxWRnd0IRWnPpyRuA5h2wnuNBRboEafuBUFGZkLbPjbDSNnL
        jZjpCWtnPS/inZc3/O/bO/cqeKZ26T0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-UvfLFf4tNpiYS5MxPe918A-1; Wed, 10 Jun 2020 17:37:59 -0400
X-MC-Unique: UvfLFf4tNpiYS5MxPe918A-1
Received: by mail-ej1-f72.google.com with SMTP id i17so1703924ejb.9
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=J3LtM2LEd2bQx83fx96JWg3WV4L6ZJHyjpyHItUBB0E=;
        b=pAbx6Kgk3IWefLBSpJHZebAK7MUuzDKJ+vYRabIIr9OjbbbR6SDIU/TGShU2mWFtmv
         Fufp8ff2cHtzYpfL/GPbjP+y9vduHS5ubqLLShYhow0wCHBKfUN0JaFCQH/Pm6NgYcAH
         0RwA1B1ftgSszZhOk0avjJsI3fJk4oYzeR8bERQoxRgl5Q3KWGkrS7bp9F0WQycO34Bo
         X5sA4qHqDno+hTBDKXH9yrWfrB9xNbb7zAcuUivq3WWCOhxRHuJQAOrcaE3oGhfEDqzG
         64B+hSrxJtycscK/ivAzgj5eUN3tx2HVjI/PHApgtNOq0RF5KJVq95yRzMLYVXdbUexc
         tf6A==
X-Gm-Message-State: AOAM532kF4lJk4ovKmt7Q0D804R2rVJtxqeYUrmiYed6XsD3b+QP5pWx
        XVZ6rTUL0vSgM3utu0czlEpxGFwBOf9KPxKx1ye/GR/bDo618CLAmvjur7yOl0DXYqwYpLFvxs7
        a6J1TxuXPqMmb1SATJkmmUcM=
X-Received: by 2002:a17:906:138b:: with SMTP id f11mr5272414ejc.288.1591825078337;
        Wed, 10 Jun 2020 14:37:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3MsIcjwX62IBPoAwV2E6BCQ4rSAjC5sjYGkRrhzCv62FZl0mWEwB9qr6qphx21UVglIt4Hg==
X-Received: by 2002:a17:906:138b:: with SMTP id f11mr5272403ejc.288.1591825078189;
        Wed, 10 Jun 2020 14:37:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id y2sm655768ejj.103.2020.06.10.14.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:37:57 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 2511A1814F0; Wed, 10 Jun 2020 23:37:57 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Elerion <elerion1000@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Error loading xdp program that worked with bpf_load
In-Reply-To: <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
References: <CAMDScmnpbPgs+mB_aMY16aXLMMWBgfu0sqna06MH8RPoGpw7_Q@mail.gmail.com> <87imfy7hrx.fsf@toke.dk> <CAMDScmm5nCzeffaeEuSFHATunsH36XW2VzbsFCuWhU5OYr_naA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 10 Jun 2020 23:37:57 +0200
Message-ID: <87a71a7gay.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Elerion <elerion1000@gmail.com> writes:

> [69] FUNC xdp_program type_id=68 vlen != 0

'vlen != 0' is the error. Not sure why you hit that; what's the output
of 'bpftool btf dump file yourprog.o' ?

-Toke

