Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543B466112A
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Jan 2023 19:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjAGSuK (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Jan 2023 13:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjAGStv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Jan 2023 13:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CBFBF4B
        for <xdp-newbies@vger.kernel.org>; Sat,  7 Jan 2023 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673117342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6HHLzKWF7oTmdlJ4N4NLyzD0Y4y9Cs9ns8nguRyOKzc=;
        b=HUPSn7pdI0gmroob9fwmwlqX0FUlCHe+U0KvilDJysEmNcJSS2Q7rRU4XbwFfb5/J/kKyv
        bwX3Ii7uzL7gkQzEjCAgH8Ddl0YP79NzaLPebXPy9HHetz2nSfz5CCS0GwSD9ea2hF8SUq
        6OHS5rV0cK92EQzS3jJ+Fb0/ZBbJ4tY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-6D5Pl86XPPq3zbz_WcfA-A-1; Sat, 07 Jan 2023 13:49:00 -0500
X-MC-Unique: 6D5Pl86XPPq3zbz_WcfA-A-1
Received: by mail-ed1-f72.google.com with SMTP id y21-20020a056402359500b0048123f0f8deso3127707edc.23
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Jan 2023 10:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HHLzKWF7oTmdlJ4N4NLyzD0Y4y9Cs9ns8nguRyOKzc=;
        b=IcSagu+lUCm19Q8tWueFA7Gdn9FEE//9fcJWHK4XEJARkyRdrtzktuhXpWAvujpTRE
         MywQci3VYZs1P1YShrz4biz5HP8WBEh/UwsQEAM6SHuKWHT/0GynGi6IDdg8JHy3ZkOq
         XC1WxE86Jh57Q5ad7EoJoewrLsWDVnFnMN75CoTR4E+I1BkPb63/R8XqY34p1PoTCibV
         sPjQkEgUZVj93qb21RuNIZ3fY7lMJOpRMqCTatbKX0GeK+fNUFWmfjdFGDZEhplqcQAV
         9ex2gATCOUsLG3YSkCG+YGSSK/X1L60HW49QIAhe4YHr17BPy7yxARIjiFKgc563Ti7s
         MbMw==
X-Gm-Message-State: AFqh2krO8pCed7U7eqHV54AlrSVkY5K6Wsj3VZwOLUB9lly7Z/+cJA2n
        Mh2TDQwCbHtj0s+7THc3+gOD+pPGvCjKwuCkRDWF3N2cy8gWwymYFaYGVUwpdOC6QlAm5vjTSjI
        9DfEwgiSqD0SwiIv5MSlDqKA=
X-Received: by 2002:aa7:dd45:0:b0:494:fae3:c0df with SMTP id o5-20020aa7dd45000000b00494fae3c0dfmr6489802edw.12.1673117338776;
        Sat, 07 Jan 2023 10:48:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvDLfR2b190OpE9raCZu23jMNIgCNQGvQm1b5E8FgE9APKcSw9ji57ZieFJt3a7yxLKcbpCg==
X-Received: by 2002:aa7:dd45:0:b0:494:fae3:c0df with SMTP id o5-20020aa7dd45000000b00494fae3c0dfmr6489779edw.12.1673117338026;
        Sat, 07 Jan 2023 10:48:58 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b00457b5ba968csm1750401edq.27.2023.01.07.10.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 10:48:57 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id F40238DA324; Sat,  7 Jan 2023 19:48:56 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Dave Taht <dave.taht@gmail.com>, team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Pause and unpause queue
In-Reply-To: <CAA93jw5EJ7OEo9hDJNWn8nLQhO+WezDs-rf+V0mOqUZ8ExAuLQ@mail.gmail.com>
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
 <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
 <CAA93jw5EJ7OEo9hDJNWn8nLQhO+WezDs-rf+V0mOqUZ8ExAuLQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 07 Jan 2023 19:48:56 +0100
Message-ID: <87cz7qyycn.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Dave Taht <dave.taht@gmail.com> writes:

> On Sat, Jan 7, 2023 at 10:08 AM team lnx <teamlnxi8@gmail.com> wrote:
>>
>> sure, during xdp redirect i found that sometimes the number of packets
>> arrived are too many for an interface
>
> That is often the case.
>
>> to handle in which case. Hence thought to experiment with tx pause to
>> make room for successive packets and then unpause !
>
> "pauses" are really not how the internet works, there needs to be end
> to end signalling to "slow down", either via packet loss, or marking.
> RFC970 is a good read here.

Actually it is, kinda, at this level: Pausing the TX interface (when the
HWQ is full) is how the regular network stack creates backpressure
against the qdisc, which is what allows fq_codel and friends to
function. This is missing entirely from the XDP redirect path, which is
what we're trying to fix...

-Toke

