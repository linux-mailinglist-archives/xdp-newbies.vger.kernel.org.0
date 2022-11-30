Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7082D63D65E
	for <lists+xdp-newbies@lfdr.de>; Wed, 30 Nov 2022 14:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbiK3NMN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 30 Nov 2022 08:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiK3NMM (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 30 Nov 2022 08:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07146C709
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Nov 2022 05:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669813870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YS9P949c0geSHbhdCT8jL+d2LVdKB4QvQxoLsJGVmr4=;
        b=DV/HrtKSiy76eb2gD8GU5q4GIJajWaCZYGKz/t08W4C5lnjk9uXsUxGEEQFlNJEk5Nb5/z
        BBKszlMB6MzWl8o01VmXX/t185q2vhT6an9JNCAQ5xOUtohAOuglLBsnaz4vYOS+IM+kPE
        Yet0RfHGIBst5E93vWj5VsAcqGccrfk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-xVL9gSegOLq-B9YbLaZvgQ-1; Wed, 30 Nov 2022 08:11:09 -0500
X-MC-Unique: xVL9gSegOLq-B9YbLaZvgQ-1
Received: by mail-ed1-f69.google.com with SMTP id j9-20020a05640211c900b004698365dc84so9601614edw.0
        for <xdp-newbies@vger.kernel.org>; Wed, 30 Nov 2022 05:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YS9P949c0geSHbhdCT8jL+d2LVdKB4QvQxoLsJGVmr4=;
        b=ZXwF8fk1QuhV4tAcW5UmU/FE5LzWoJ3E4Njjs9s3i1je9TLFvgSU2e+f09Aqoeie0u
         V/hJSSxGkRYJ2ZtxeKrv/vIK9M8k/Jz6/iSKpj5mxHtdFSvwq9ZCcSuC4EaGbvilTay4
         Q/SSjg0aVZ7ubIM7eGOw7riKwJPvMw4GLASEEwCU7Gi05vOWZ7GcGL/MwhTJjcHHk72e
         ptW3v8weU+zEm4fGsL3CwQyE9L88mLtqU6F51/FhBvUBwAsLKodjCUdV38I64Pf1pGUj
         YW/dzZVAgQwzeVZxvtEdT3JPdGfNi/bmS1E87upQkwFFcBhiGwKA29zwnMP8KRToC55d
         fGXA==
X-Gm-Message-State: ANoB5pmjYNWOnQMw2mUN7BVq2d9DBe4TVsa0NS7Kk8eIcfSrx0o3+H5u
        Jhp2NAJ8IE0fGNZadNXmLYqzablPrpBEGLpGm7Li48WXxly515CXaNs4u3q8yCgdBZ3C8N5Q+/a
        VT9kHIpUGZ6+J0U6b585UjIs=
X-Received: by 2002:aa7:d984:0:b0:46b:64a6:7e0a with SMTP id u4-20020aa7d984000000b0046b64a67e0amr9074568eds.324.1669813867007;
        Wed, 30 Nov 2022 05:11:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53vCRkSAU4cuTcwBft4qgXbEDq50eYk4hao73edet7sK7dRfp1LLuJr8tyrR0W+vjtJWTq+g==
X-Received: by 2002:aa7:d984:0:b0:46b:64a6:7e0a with SMTP id u4-20020aa7d984000000b0046b64a67e0amr9074426eds.324.1669813864597;
        Wed, 30 Nov 2022 05:11:04 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id w18-20020aa7dcd2000000b0045c3f6ad4c7sm609377edu.62.2022.11.30.05.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:11:04 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5D14380ADD9; Wed, 30 Nov 2022 14:11:03 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Henning Fehrmann <henning.fehrmann@aei.mpg.de>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Cc:     Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: make XDP program aware of multi buffer
In-Reply-To: <Y4caS5Bh7M9SDJf9@mephisto.aei.uni-hannover.de>
References: <Y4X3u39irCVmVxZx@mephisto.aei.uni-hannover.de>
 <87cz95zyen.fsf@toke.dk> <Y4caS5Bh7M9SDJf9@mephisto.aei.uni-hannover.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 30 Nov 2022 14:11:03 +0100
Message-ID: <87wn7cy4d4.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Henning Fehrmann <henning.fehrmann@aei.mpg.de> writes:

>> You just replace:
>> 
>> SEC("xdp")
>> 
>> with
>> 
>> SEC("xdp.frags")
>> 
>> in your source file and, assuming your libbpf version is up-to-date,
>> that should be it as far as the kernel is concerned.
>
> Nice. It loads now. I appreciate the work done for multi buffer packets.

Cool!

>> However, you obviously also need to make sure there are no semantic
>> issues in your program before doing this. I.e., data_end is no longer
>> the end of your packet, so if you are using data_end-data to calculate
>> the packet len, that will no longer be accurate. If you need to access
>> data beyond the first frag you'll need to use the
>> xdp_{load,store}_bytes() helpers.
>
> I guess, this is not the case or does bpf_redirect needs it if I have
> multi frame packets?
> I realized that redirection actually doesn't happen if the packets
> exceed the page size.

No, XDP_REDIRECT is not supported at all for multi-frame packets:
https://elixir.bootlin.com/linux/latest/source/net/core/filter.c#L4278

Cc Lorenzo who was looking into enabling this at some point...

-Toke

