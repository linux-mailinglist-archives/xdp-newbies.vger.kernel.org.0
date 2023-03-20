Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE096C1DAD
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Mar 2023 18:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCTRVl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Mar 2023 13:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjCTRVI (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Mar 2023 13:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7684C3E
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679332532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2njdQkRq87hIs+5/DQ26MB8BWF7kKnsyfoV/SZ90G/E=;
        b=C0lLLJCnDCmNBFnkSTbL65f3CzJR9NEJEyHn7wOpW0iw5N0K+6svOpfZ17tA7d+cGg3PAP
        lfnQJriQN6pjuuhdkezlLqcoXaZGxDUWULwPdLasISWZ8qaJtMCu69CGP/7/H8UCq1RHMr
        JzWMkyapwdgg4t/OOw0FOklR23gjhE0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-XO82iZmPMgynkImuQrcEuw-1; Mon, 20 Mar 2023 13:15:30 -0400
X-MC-Unique: XO82iZmPMgynkImuQrcEuw-1
Received: by mail-ed1-f71.google.com with SMTP id en6-20020a056402528600b004fa01232e6aso18488839edb.16
        for <xdp-newbies@vger.kernel.org>; Mon, 20 Mar 2023 10:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332529;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2njdQkRq87hIs+5/DQ26MB8BWF7kKnsyfoV/SZ90G/E=;
        b=BfOiBuPct2uMRsG4SHV3P09VA0kHglUqqMG49MUl9Zmpknxf9hwI5IJUyy5vLOKHCj
         mMm1rZxpiOFgxovlfoXTnJx7VAJQ/5PegQSU/aQ7LrYS+OKKKWoXHA8PmDL35Mx3EMOS
         N/bcgJW0BKSTldQo4FKD53px4PjlJ24trnBxTTAF992xDH6DXZoHa1fgRdXlrKuZAy98
         lYGDQnDKiInB9J5hf5rI26EURnVxZxptcFf4VmeGymZ4uonMs7TGR/8um0evWCF0ZM5f
         47qUwBGk9K02SZaVY4DCsUGrAJKVRHi+PwlVXoTPARiH9xVljhp+fN9/cr6BpJ0GGTH2
         AYyg==
X-Gm-Message-State: AO0yUKVFQB0wrex8ORNwIzBdwZmz+1El1SIwfLChCLMaHrosK3+NCjyl
        4p3Yjnf/2rw0AJq6aHUgrCsaW3i54luOUHViyc0dCUDeTAxCgB8T9c1+dvL3Yha/A3QjjWjCcvd
        WoODTewwKk7hISQFQpeMXJQs=
X-Received: by 2002:a17:906:36d3:b0:932:4378:b237 with SMTP id b19-20020a17090636d300b009324378b237mr9602364ejc.77.1679332529148;
        Mon, 20 Mar 2023 10:15:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Jl06k/f6vnyKUeJHp+r37ftEeI93pbFSVCP6HoBahpFgyUHnuN5X3xdSC1UE2rIvWVBNJgA==
X-Received: by 2002:a17:906:36d3:b0:932:4378:b237 with SMTP id b19-20020a17090636d300b009324378b237mr9602349ejc.77.1679332528912;
        Mon, 20 Mar 2023 10:15:28 -0700 (PDT)
Received: from [192.168.42.100] (194-45-78-10.static.kviknet.net. [194.45.78.10])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090680cb00b00930d22474dbsm4693217ejx.97.2023.03.20.10.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:15:28 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <a045e35f-f581-df44-2ece-55a30b8b3387@redhat.com>
Date:   Mon, 20 Mar 2023 18:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc:     brouer@redhat.com
Subject: Re: How to get system localtime/wall time from eBPF?
Content-Language: en-US
To:     Vincent Li <vincent.mc.li@gmail.com>, xdp-newbies@vger.kernel.org
References: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
In-Reply-To: <CAK3+h2xYCBmP-0=uDUm1uKgfP8-v3KtG8Sy7Y0YR2x1gitHZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 20/03/2023 16.33, Vincent Li wrote:
> 
> if I have a XDP based firewall to block ip  access based on system
> localtime/wall time, is it still impossible like what mentioned here
> https://github.com/xdp-project/xdp-tutorial/issues/204#issuecomment-819419800?
> If so, is there any way to workaround this?

You could use the BPF-helper named: bpf_ktime_get_tai_ns()

See man clock_gettime(2). It is the same as CLOCK_TAI, which is
(currently) offset with 37 sec to CLOCK_REALTIME which is wall-clock.

Perhaps kernel should be extended with a bpf_ktime_get_wall_ns() ?

--Jesper

