Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2154340D774
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Sep 2021 12:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbhIPKdo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Sep 2021 06:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42658 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236585AbhIPKdn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Sep 2021 06:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631788342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1F9D+jcsmFH+GTmkJSIypbVMc4aHFDaO2PuPwlrPH+o=;
        b=Nf5H/P8TH7vfSPOAGslsK/QW/ty2T2eG1eWpnP9P0XkRpD4gEVU7aHpVqaL9wIEwt+kyrw
        XuoH4EEVhvb+cJnsOzcE9talg5bc2IoEyKK5rz/IC3r35XNbNHhW8Idz5yWBcw4LyJidO4
        UL440pSZ1NWkdw/B45vJAdMQskOYt68=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-CuGyHS74NhWt5OgEnhaYzw-1; Thu, 16 Sep 2021 06:32:21 -0400
X-MC-Unique: CuGyHS74NhWt5OgEnhaYzw-1
Received: by mail-ed1-f70.google.com with SMTP id r7-20020aa7c147000000b003d1f18329dcso4940769edp.13
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Sep 2021 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=1F9D+jcsmFH+GTmkJSIypbVMc4aHFDaO2PuPwlrPH+o=;
        b=pThutyJzfHftoyBoMwV3IOG2fNvmkBs37jGbDAsztg68dRXLzp2tt2wXb9EUjCJIdn
         t5NsqaM6A1V3M79jH5K5i0T+FU4MejUX2GBop7qsFp3qTYKA8qqjceLix/lsLDhkDxfO
         jilGTKZc0N2u0CdFeKGFT4qM9XKeKnznFosNRSf7ZEzABwGviC0F02C0toWYaxeqVZyj
         2Q0Sdw0Kx3U/DY/qgAkhB5e7qOCh365arj3pUPdgg1wsxZVT0xGK8O+R1nfaXemts52G
         kxhcMJVK+40o8k8OM/wcFPOYxGvdOI1YERxn5J/Vbm+1wYBQeDcmpF1pmLOZIzyWjY+a
         RZng==
X-Gm-Message-State: AOAM530cm4kDAdykk5p16UlYJrzxojwhskGXKlNJzt6Jyd21JIG4YRdv
        Ch1zHTgrBXPK/Yf/5/yXGW39HDTMBj7lDRSE0w5xZTttDu8tOGXHObOBfP79obvKJ1d8jHH+3f9
        zJwk9zDbn8nZDqibc4JI3E5w=
X-Received: by 2002:a17:907:75da:: with SMTP id jl26mr5491724ejc.300.1631788340116;
        Thu, 16 Sep 2021 03:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYwlbnJwo+aaxuQo8CHEC0J5Johnjc3P9S5NH2lLcmfn2pAHx8Ss+DLze9AZW9UOlKUMejbQ==
X-Received: by 2002:a17:907:75da:: with SMTP id jl26mr5491702ejc.300.1631788339886;
        Thu, 16 Sep 2021 03:32:19 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id b3sm1033666ejb.7.2021.09.16.03.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 03:32:19 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id AE0CD18033D; Thu, 16 Sep 2021 12:32:18 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Parsing TCP Header Options In XDP/BPF
In-Reply-To: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
References: <6deabc36-8ee6-f2af-b5ab-08e740f35d1c@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 16 Sep 2021 12:32:18 +0200
Message-ID: <87h7ek6cb1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hi everyone,
>
>
> I wasn't sure whether to submit this under XDP's mailing list or BPF's. 
> However, since it's an XDP program, I figured I'd start here. The issue 
> has to do with the BPF verifier, though.
>
>
> I am trying to parse TCP header options within XDP/BPF. In my case, I 
> want to locate the 'timestamps' option and read/write to the sender and 
> receive timestamps (the option's data, which is eight bytes in total I 
> believe).

We're doing just this in the 'pping' utility, see code here:
https://github.com/xdp-project/bpf-examples/blob/master/pping/pping_kern.c#L83

-Toke

