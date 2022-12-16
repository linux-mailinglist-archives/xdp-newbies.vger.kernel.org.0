Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DF064EDA5
	for <lists+xdp-newbies@lfdr.de>; Fri, 16 Dec 2022 16:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiLPPNU (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 16 Dec 2022 10:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbiLPPNO (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 16 Dec 2022 10:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0520426A9C
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Dec 2022 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671203547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7wcBzGP6DyToh2AIpoKdmJDrOwa9C4WenYE0X9aZHdU=;
        b=B8pGNyresGRGp8kGg2yHj9Usy+YztJY6UmKNxfD8K7yCWyPA9CCDsb3cw89BxWziV9pp4z
        3vyp/umspxjV5wpv4Rtgpv7CFWYaVZIzFw/WwMTwkemgo7CS0n5KUsBh8fdBaLdvms6RMl
        fcZatNP0AkPcn+QIjqtpflDPGhdJCSk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-u1qhMK1BOJqcxedEYLM6bw-1; Fri, 16 Dec 2022 10:12:25 -0500
X-MC-Unique: u1qhMK1BOJqcxedEYLM6bw-1
Received: by mail-ed1-f69.google.com with SMTP id t4-20020a056402524400b004620845ba7bso2089210edd.4
        for <xdp-newbies@vger.kernel.org>; Fri, 16 Dec 2022 07:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wcBzGP6DyToh2AIpoKdmJDrOwa9C4WenYE0X9aZHdU=;
        b=IPJyNIlMnJCdFOVO6zR6GtG3WLXv9xWFQULq0ymq34Z2tZ8KDHeCi/TyZpM5vS79J7
         9EGHlgW76J/enKUuKLm5dmQaScPHp78sCGSj6kkZcVf2h7GFWTmgSoXZlRwj+ZiTGrSD
         fE5OglALCH/dcqzNpCEXdW0dRjEGHZuvU1o0SaV6su9/3W0y6IOPd413bEZ+m0PdNIIF
         dM4AjzPADiSsio5mt/yIgSqV6jb0cAgrxAxPXT0V2VWwrl6PufzSEgT7QU/8zeY0wVJX
         ZwEcxs5PPy6Hvg4QTTez7yKyCKFice3K9hgsySJd3mC0eO7xWb7kOxD+B9h8k0x+1oVO
         FFXg==
X-Gm-Message-State: ANoB5pn4FI6wrNCs0H3++SGiDg7XQS7taxSbWSIWjDgMoWv1gnqfbfmM
        98AUs875RJYzi5IQUpGOdUbZp5MDYnQGkiDitzekFcGi9NTX9A4Vzc7VH/jA9L2xwFXjhJEYhIr
        yXTsS6lDCooggajV4O1+ev9Q=
X-Received: by 2002:a17:906:ca54:b0:7c4:fa17:7202 with SMTP id jx20-20020a170906ca5400b007c4fa177202mr8207704ejb.33.1671203544438;
        Fri, 16 Dec 2022 07:12:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAMEf1yv6Kz1dB/jGcp/B70kHCReTl1Oi7Ws/S1mu7NHBELbdWUpj8lt1wZbdHCH1pSsnjkA==
X-Received: by 2002:a17:906:ca54:b0:7c4:fa17:7202 with SMTP id jx20-20020a170906ca5400b007c4fa177202mr8207687ejb.33.1671203544170;
        Fri, 16 Dec 2022 07:12:24 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id lb10-20020a170907784a00b0073de0506745sm925452ejc.197.2022.12.16.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 07:11:50 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 64F7782FA39; Fri, 16 Dec 2022 16:11:40 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Federico Parola <federico.parola@polito.it>,
        xdp-newbies@vger.kernel.org
Subject: Re: XDP and AF_XDP performance comparison
In-Reply-To: <f95f7f13-57a2-ba0f-3125-057d320f43cf@polito.it>
References: <26480f7b-44b4-c6d3-2376-9b4be8781645@polito.it>
 <87r103tfsw.fsf@toke.dk> <f95f7f13-57a2-ba0f-3125-057d320f43cf@polito.it>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 16 Dec 2022 16:11:40 +0100
Message-ID: <877cyrbcyb.fsf@toke.dk>
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

Hi Federico

Sorry for not replying to this sooner, I just fished it out of my pile
of unprocessed email while I was winding things down for the holidays...

>> Finally, since you seem to have your tests packaged up nicely, do you
>> think it would be possible to take (some of) them and turn them into a
>> kind of "performance CI" test suite, that can be run automatically, or
>> semi-automatically to catch future performance regressions in the XDP
>> stack? Such a test suite would be pretty great to have so we can avoid
>> the "death by a thousand paper cuts" type of gradual performance
>> degradation as we add new features...
>
> I would be very happy if my work could benefit the community. Please let 
> me know if you have any idea or guideline on how my testing suite could 
> be integrated in the XDP environment, I guess the xdp-tools repo could 
> be the ideal target?

I'd be happy to consider your tool for inclusion into xdp-tools, or into
a separate repository under the xdp-project github organisation if that
fits better. I think that will mostly depend on how much surrounding
setup code is needed to run the experiments: the utilities in xdp-tools
are mostly fairly lightweight standalone binaries, so if something more
is needed a separate repository may be better.

As for how to structure the test utility, that's hard to say off-hand.
But one important consideration is making it easy to run (so as few
assumptions on the environment as possible), and easy to automate (so
that we ideally can use it as an automated CI-style test for performance
regressions).

Hope that helps! :)

-Toke

