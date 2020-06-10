Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514D01F5D8C
	for <lists+xdp-newbies@lfdr.de>; Wed, 10 Jun 2020 23:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgFJVJl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 10 Jun 2020 17:09:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21351 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgFJVJl (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 10 Jun 2020 17:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591823380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a2LylM1wT0KjwF2UE5QpAPOTMzd8FxUepoAAPwcKBMQ=;
        b=Rhph/jPpuosrP/Mqiht2NsH+YhaxrXuwVMkNgT9rsCpfT9lGyrGKwVMsGIYHNE2DxZI3Ne
        mdbuBtEdUSo9kklxn2DOOJmK6E+EmfNnWTii/0DSR37VxZBkrzCCCL4GnHcCq9D3iWc4xp
        Wa6DbF+WyzoxuJxKeGLzOHiyvHNO7bU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-nk7Xli6qOiiLKWPS3QwPcw-1; Wed, 10 Jun 2020 17:09:38 -0400
X-MC-Unique: nk7Xli6qOiiLKWPS3QwPcw-1
Received: by mail-ej1-f70.google.com with SMTP id p27so1682866ejn.5
        for <xdp-newbies@vger.kernel.org>; Wed, 10 Jun 2020 14:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=a2LylM1wT0KjwF2UE5QpAPOTMzd8FxUepoAAPwcKBMQ=;
        b=rSdFWg0qrXirUDhoaCqVXf5oGbikEft3ACn/ujSuG6yrnElMaZMgahBCZ8+qgPmcXG
         uznSy7mE9FrK0xWB6dO5J2jXoeKeWnjl4d9rhVbVY/zWx3VL28OpI6BSdfeTjwOYoYl0
         kpKsmp9178zd6ERiCj8D/iY33DsSjiqCeCI8LswMyEs+MvGPJLU1rGxbRyCO58o86gnD
         H1GSvzQNm6TBT4+YCHanQ19wLua6V5dWuhxQ0To6J2jrctNnr8n0//Wdh0NjNt4/HLQ9
         PUnBKfoV+uYlDwDysTi4KpGrI7AosJOhLJan+xKqkrJG/IM/2Nzi4UeY6f1ueGxa4ikE
         tfIA==
X-Gm-Message-State: AOAM533VuYunRzq+YT/ZPkkNqQdUEaN+Vca09uTLDXGK9+gJu30aV1FE
        slEsQWAS1ypuSJbtWVxQ2M5uUS8clnz8v1IRNfh8RW+LgbsM2DhYuNqotafDmhoAn7vIl+5vidC
        IQm+aFObK72srHqJamQRvrtM=
X-Received: by 2002:a17:906:1496:: with SMTP id x22mr5071177ejc.161.1591823376418;
        Wed, 10 Jun 2020 14:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnRVitp3xU58l035gz9ZSFViHTMg2tl4w9iIuqjd5Scy+mUeGe4SGqMCJvApBQB0MnR9PCQQ==
X-Received: by 2002:a17:906:1496:: with SMTP id x22mr5071165ejc.161.1591823376203;
        Wed, 10 Jun 2020 14:09:36 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id v5sm450223edl.51.2020.06.10.14.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:09:35 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A68471814F0; Wed, 10 Jun 2020 23:09:34 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Federico Parola <fede.parola@hotmail.it>,
        xdp-newbies@vger.kernel.org
Subject: Re: Lightweight packet timestamping
In-Reply-To: <DB7PR08MB31304BCD517885F0E1C063F69E830@DB7PR08MB3130.eurprd08.prod.outlook.com>
References: <DB7PR08MB3130BDD01387627E7FAD775F9E890@DB7PR08MB3130.eurprd08.prod.outlook.com> <DB7PR08MB3130C02AB04133E07146F40D9E890@DB7PR08MB3130.eurprd08.prod.outlook.com> <DB7PR08MB3130BA2C0F90E0819577C5289E890@DB7PR08MB3130.eurprd08.prod.outlook.com> <b712de09-fd35-1d5e-1842-31bb3b2e163d@gmail.com> <DB7PR08MB31304BCD517885F0E1C063F69E830@DB7PR08MB3130.eurprd08.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 10 Jun 2020 23:09:34 +0200
Message-ID: <87d0667hm9.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Federico Parola <fede.parola@hotmail.it> writes:

> On 06/06/20 01:34, David Ahern wrote:
>> On 6/4/20 7:30 AM, Federico Parola wrote:
>>> Hello everybody,
>>> I'm implementing a token bucket algorithm to apply rate limit to traffic and I need the timestamp of packets to update the bucket. To get this information I'm using the bpf_ktime_get_ns() helper but I've discovered it has a non negligible impact on performance. I've seen there is work in progress to make hardware timestamps available to XDP programs, but I don't know if this feature is already available. Is there a faster way to retrieve this information?
>>> Thanks for your attention.
>>>
>> bpf_ktime_get_ns should be fairly light. What kind of performance loss
>> are you seeing with it?
> I've run some tests on a program forwarding packets between two 
> interfaces and applying rate limit: using the bpf_ktime_get_ns() I can 
> process up to 3.84 Mpps, if I replace the helper with a lookup on a map 
> containing the current timestamp updated in user space I go up to 4.48
> Mpps.

Can you share more details on the platform you're running this on? I.e.,
CPU and chipset details, network driver, etc.

-Toke

