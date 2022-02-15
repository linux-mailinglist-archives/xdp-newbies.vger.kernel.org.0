Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9CF4B77B6
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 21:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiBOSyR (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 13:54:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238973AbiBOSyR (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 13:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24F708D68E
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644951244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MTAmssfl3UGG6Z2RcE0A26KoIlLxK11Ro1X44XU8qdE=;
        b=aQM7mgjuhXfywd4VMgirYV8LNHmlEr0Gdsq+BNYHb9oKRvWXSsuodWgEsiycLMc2c23Rf7
        7mj733WuAvx2mXbH7KzqC0jO8hmSD53jf9LqYxMDz6ZnnoNIevAjlqcrNllO+rBChZoHGD
        E3KVVBZleXsUsZq+FCbYZiRW19ZMS6k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-n4W15XlEOmGLtEWWVTUgFA-1; Tue, 15 Feb 2022 13:54:02 -0500
X-MC-Unique: n4W15XlEOmGLtEWWVTUgFA-1
Received: by mail-ej1-f70.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so7668791ejn.13
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 10:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=MTAmssfl3UGG6Z2RcE0A26KoIlLxK11Ro1X44XU8qdE=;
        b=FEtu731iR6cr2SF6ENvHXRcrflbcYIIeslTjmoqkEc8tgQNRQengM7+AAvBzdvCrB2
         pIq2yD5EaQnBgLE5R5pidGQgH7DMWg57z0pIX+WWOYdyftVOL0WGqh9XwqkcYtC61dT4
         Hs92wjOKTwCH0BkksWwX/D0x9J+zCj+/IhkMe4JqBGcvBgIRs3ygIZxIx3/GaH78EjVb
         JF/r6ktSGr5S34F6lqwe/kFSUsQgH3pWV7iU+G3eal62vFsVQFg60c+ZTYEIgYHZkkaI
         bRR4KoV0Gln3aF5Qali4Fx2s0ClEi6TijKAKAEMM5K5A9h86eLZ6cynB6N21SMwHMSU0
         KxxA==
X-Gm-Message-State: AOAM532X+j0DpDcgSrlu+tadwEOfS4Z9DzNzUd1VRF69hm/CQx4ayO7z
        J55aANGCSt6tBe/uYHxrTT+xUElw4MlORK1eecgJcL8TV1hrboS0Ry90ornDCj55hks4lyZXvNW
        TM4eVkAllacRYNOkVZKGdnjk=
X-Received: by 2002:a05:6402:1806:: with SMTP id g6mr296354edy.259.1644951240917;
        Tue, 15 Feb 2022 10:54:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtXJkhjPWWMqxw9pcstJBsjE2An8PVVYwUxNGudYn9k2E7/+WNW/vz6UDcEeST7vZ0wyNXZQ==
X-Received: by 2002:a05:6402:1806:: with SMTP id g6mr296330edy.259.1644951240529;
        Tue, 15 Feb 2022 10:54:00 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id l9sm9829495ejn.164.2022.02.15.10.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 10:53:59 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 35FF812E4C2; Tue, 15 Feb 2022 19:53:59 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Sophia Yoo <sy6@princeton.edu>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
In-Reply-To: <CANLN0e7=Z8rHxmB5WEs4jFdaQ8sL2n_ckE-wcyURnfQHvgo45w@mail.gmail.com>
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk>
 <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
 <874k516q32.fsf@toke.dk>
 <CANLN0e6ersLvCSZSbxt6Roy2qJV2C90Y12RmEwQNtwyX2tURwQ@mail.gmail.com>
 <87mtis5fju.fsf@toke.dk>
 <CANLN0e7=Z8rHxmB5WEs4jFdaQ8sL2n_ckE-wcyURnfQHvgo45w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 15 Feb 2022 19:53:59 +0100
Message-ID: <87k0dw55bs.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sophia Yoo <sy6@princeton.edu> writes:

>> > This is a real use case as part of a larger design I am working on.
>> > However, given that redirect from TC egress to XDP_DRV_MODE ingress
>> > fundamentally doesn't work, I am rethinking other options to the
>> > design. Alternatively, it seems that support for XDP_REDIRECT from
>> > egress to ingress is currently in the works, although I don't believe
>> > the patch has yet been applied to the mainstream kernel.
>>
>> Huh, really? Haven't seen that, got a link?
>
> This is where I saw the discussion for adding XDP support in the
> egress path https://lwn.net/Articles/818591/, which if I am
> understanding correctly is also proposing to add the XDP_REDIRECT
> support on egress.

Ah, right, that series. There was extensive discussion on a later
version:

https://lore.kernel.org/r/20200513014607.40418-1-dsahern@kernel.org

we ended up dropping it in favour of having programs in devmap entries.
So that effort is abandoned, and I don't think you'll get very far
experimenting with that series.

> (Also, for completeness sake, this is the man page
> for bpf_redirect() that says currently XDP only supports redirection
> from ingress to egress, and does not have egress to ingress
> redirection. https://man7.org/linux/man-pages/man7/bpf-helpers.7.html)
> Do you have any insight into whether/when this XDP_REDIRECT
> functionality on egress will be added to the kernel?

It may happen eventually (there are use cases for some kind of egress
hook), but whether it will end up covering data coming from the host (as
opposed to XDP-forwarded traffic) is less certain, cf the discussion I
linked above... As for a timeline, just as soon as someone sits down and
adds it :)

-Toke

