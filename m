Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA404250DA8
	for <lists+xdp-newbies@lfdr.de>; Tue, 25 Aug 2020 02:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgHYAeQ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 24 Aug 2020 20:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgHYAeM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 24 Aug 2020 20:34:12 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55362C061574
        for <xdp-newbies@vger.kernel.org>; Mon, 24 Aug 2020 17:34:11 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 5so6181950otp.12
        for <xdp-newbies@vger.kernel.org>; Mon, 24 Aug 2020 17:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H0gJr9StcW4x+EiDERn7YSYIEZ7D/FsVii4RjgrMYSM=;
        b=BZJ8KBFqtmPLaNyPyJi6S+LUCgxEEgvx8YtLQmdIK1Ct8H7ghMhvUxYZjoAKIqhetV
         gJRtjgxM83OseVugIk5oF8ycKHehv3uAgTrLGVaHlrIvVO6DmPjMuQtvGOhXsy6uY0PO
         +BFwbZ+wa2nsLuHcY6GvI27k/Jvj7/SOm8koYyY/o8n4nqsByHi3qekIBZgJsgy+ywsf
         orhXVDVQtpp1Q1gTlbjZ03aOK4OyfJwQFGXCq6Ko1oljzx/CKkSMvGtjYh4EfB694gaa
         +kQ0ORePGrjE1d9jQ9aaWsMzcesjfStyIu9AD6uTEfVHrCzVEn8K2pwlmDjC+LGDTDMh
         awCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H0gJr9StcW4x+EiDERn7YSYIEZ7D/FsVii4RjgrMYSM=;
        b=ch5DPi0vDLXTnPJeWoyMCkNIVJWbsMDySlYM/dQw8td/L+SldQUyCoactCD41WBTmW
         TKZsvdPAYVtuXoEW64F2Kjjq9fTBFb4Lcki5ZGT/TG5LHdH6aDFMmVkSBT1mjkdYJLv7
         KXcJjA5du6rwiiCYuI8/MK6EJACO63AxoLnsJwv4yEI7pZgMKYSc4cFqcWZNgKUp//+q
         oFNWVZ5wNaQ/fOvoCGjJlX3Jfe2vx3J75M/7Gu5ZBbAaofIqE+Rr7yR7qP00CImH2VB6
         3aWDtu9SzxFPlLhualZfPCLx4d+AaGQ92M78UA9haB2U4BvFplAYWEk+spjfDTHCw+Xt
         ZUxQ==
X-Gm-Message-State: AOAM532zm/NThOZTm18q1GhELnsJhWHYpPYgZw1C/4uRSTm9sLFLInzv
        7NgXl7DlPm7KWdVbZW2kjEY=
X-Google-Smtp-Source: ABdhPJxk0wJAgLnlL/1d8KHg8PYfv1aPPk3uFYMLYre55NIZecb/da5OmOwwD4NIAcPTMKf6OFHalw==
X-Received: by 2002:a9d:2784:: with SMTP id c4mr5588870otb.30.1598315650730;
        Mon, 24 Aug 2020 17:34:10 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([2601:282:803:7700:12c:2110:d2ae:4b39])
        by smtp.googlemail.com with ESMTPSA id c3sm2592995oov.17.2020.08.24.17.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 17:34:10 -0700 (PDT)
Subject: Re: Using XDP for Cloud VMs by David Ahern
To:     Stephen Hemminger <stephen@networkplumber.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        David Ahern <dsahern@kernel.org>,
        Anton Protopopov <aspsk2@gmail.com>
References: <20200821115614.40fa7eb0@carbon>
 <20200824171418.1b2cffa0@hermes.lan>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <3251d735-9893-d092-e749-1fa3ef210d99@gmail.com>
Date:   Mon, 24 Aug 2020 18:34:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824171418.1b2cffa0@hermes.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 8/24/20 6:14 PM, Stephen Hemminger wrote:
> On Fri, 21 Aug 2020 11:56:14 +0200
> Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> 
>> is measured read [Blogpost#1]. He have even released the [Code] on GitHub,
>> and encourage people to reproduce his results.
>>
>> I encourage other cloud providers to collaborate with Ahern. XDP is a core
>> kernel building block, but we need to create FOSS projects that explore
>> different use-case (e.g xdp-cloud-provider). XDP is still early days, and as
>> Ahern already discovered, trying out this Cloud-VMs use-case have identified
>> several gotchas and missing XDP features that we should work on
>> adding/fixing in upstream kernels.
>>
>>  --
> 
> Was this normal OVS (kernel based) or OVS-DPDK (userspace).
> OVS-DPDK is much faster if you can afford to burn CPU.

It is not always about fastest; resource consumption on a host matters
as well. The investigation was focused on CPU cycles to process a packet
load. With kernel based OVS, you are sacrificing ~1 core (2 hardware
threads) per ~1M pps.

> 
> Also would be interesting to compare XDP vs VPP but this is very much
> an apples to orange kind of exercise.
> 

Endless interesting comparisons. People with the relevant knowledge and
setups will need to step up and do the tests. The source code and
scripts are available so others can do these comparisons.
