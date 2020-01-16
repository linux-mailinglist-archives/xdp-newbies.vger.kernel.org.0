Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1425913F5B7
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 19:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437183AbgAPS6W (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 13:58:22 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40938 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389523AbgAPS6W (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 13:58:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id k25so10357604pgt.7
        for <xdp-newbies@vger.kernel.org>; Thu, 16 Jan 2020 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=BI13oIQlSHuDsS81/cTMjX78Ik01oNH8NrOEYtTfHlc=;
        b=F/myoizur8gzAdXXZITN3J6WgkRP6CoLA/CannusR4xA/uezmtBkiJcmO+f2Kx+abr
         SzW2th9nGkHJhzp0avdKhncP1PPy30n9n3PodH4sPV5fqX6T9TYbtaOVFLKUfax91gUm
         9eKtPoNuTYpPjTbvyCj2CjB5IENARpUpyN/FNODx+Z9DvsmRU3I52uVD4PFTUyzpuLxo
         MCqmRNbNFnHA1vh83qA7CzdhiSPDeCT0JiiFrxP1+bIzIXCrCNT730rM3QQUseedBxN8
         V4CCqZr0sk5KQ52W3HITLTQNAJCu8h+fxHzaNN33Z53Pz9BdjVDm2tC3woGYkzwoGkgl
         UOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=BI13oIQlSHuDsS81/cTMjX78Ik01oNH8NrOEYtTfHlc=;
        b=Pmj3K4QhZob44Nh1dKRaUVBA/tBls1TdFUdEv4qbMuAykLQkXA0yvgTWdk4m170LqA
         K/g3uAqXvpI44t6V01oMP7kFcOvODztkUdH7M4X1DG7CkV/BrZvLRgdycGrkWU7QjCKI
         83ZNlizW5jAd//an2UbYGCvfKFLoExYmPrSF4tI0sj7Y+fi9APOwXDBXD/yEQ4vlQHcU
         jg/f98peIMC6iDdQy0x8nXpCc/GPTcWIKawHmeQUl11VyNLr/tQTFWj0oUElRYXB3CQH
         34iewCbn2qv1OeQmN2D9vM25GDXz1KM5viha4T3ZRhmeC3XxYb8XACcDU4Cho1bky5aF
         DiMg==
X-Gm-Message-State: APjAAAUK3nw4kQhCR3vwnhjTwA3lWtbHeecjSGDuUKVbT78ua8Qzwxtp
        YOf+SocwP6mjEIb9is58NEk=
X-Google-Smtp-Source: APXvYqx3iPMtrdvntDHBTYDBEdH6/bz9Gu5AIQEzpZCU5mJdBJEh/5bd7f7j7zVdlAwGv0No0WQawA==
X-Received: by 2002:a65:420d:: with SMTP id c13mr42028964pgq.101.1579201101352;
        Thu, 16 Jan 2020 10:58:21 -0800 (PST)
Received: from [192.168.1.25] (c-71-231-121-172.hsd1.wa.comcast.net. [71.231.121.172])
        by smtp.gmail.com with ESMTPSA id s22sm1044303pji.30.2020.01.16.10.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 10:58:20 -0800 (PST)
From:   Vincent Li <mchun.li@gmail.com>
X-Google-Original-From: Vincent Li <guzheng@gmail.com>
Date:   Thu, 16 Jan 2020 10:58:19 -0800 (PST)
X-X-Sender: guzheng@jiadeimac.local
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
cc:     Vincent Li <mchun.li@gmail.com>, xdp-newbies@vger.kernel.org,
        daniel@iogearbox.net, andriin@fb.com, dsahern@gmail.com
Subject: Re: XDP invalid memory access
In-Reply-To: <20200116022459.GA2853@ranger.igk.intel.com>
Message-ID: <alpine.OSX.2.21.2001161044590.5400@jiadeimac.local>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com> <20200116022459.GA2853@ranger.igk.intel.com>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On Thu, 16 Jan 2020, Maciej Fijalkowski wrote:

> 
> I see that optlen is a global variable. This line might be valid but
> you're using iproute2's loader for your XDP program, right? AFAIK it
> doesn't have support for BPF global variables, only libbpf does (Daniel,
> Andrii? is that true?).
> 

move optlen to local variable resolves the iproute2 loading problem. I 
tried libbpf way (xdp-loader load enp3s0 tcp_option.o) from 
https://github.com/xdp-project/xdp-tools to load the program, but it 
failed with "Couldn't load BPF program: Relocation failed". I will have 
more detail in email respond to Toke.  

