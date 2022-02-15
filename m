Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397884B716E
	for <lists+xdp-newbies@lfdr.de>; Tue, 15 Feb 2022 17:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbiBOPNZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 15 Feb 2022 10:13:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbiBOPNZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 15 Feb 2022 10:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F7391409A
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644937994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dm75LRPQO2FWFhU/fiq/I6Zn/LExPe1paxbPRHvNfBY=;
        b=aD4/Tn9BHYskSLOXdxEGdRZqq5IDgWSQetu4REJrEsBOguW5t1I7zEWzRT12nSa1rnGunN
        F5ChsKKsAwPaEKQQTX8rUg/YkFlbxVLNx0pu6KZZMscCT3L4vgveVy2vC9l3pUbh818aRQ
        V65Xd9b+V/L1WSPCcOAIzHrMW4KAB28=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-GYa4qbdHM3uqtGvaabgPKA-1; Tue, 15 Feb 2022 10:13:13 -0500
X-MC-Unique: GYa4qbdHM3uqtGvaabgPKA-1
Received: by mail-ej1-f69.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so7391329ejn.13
        for <xdp-newbies@vger.kernel.org>; Tue, 15 Feb 2022 07:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=dm75LRPQO2FWFhU/fiq/I6Zn/LExPe1paxbPRHvNfBY=;
        b=b1j23EXadvzyuQlRQ0PapDDxjxXNORONh+ngFbSNj3tJhHh/3wGo9H7byrL4r62mW1
         T8j1178CF8tB0D1ci8kqBNitL055grxx2YtHBoNAcCQ07aFicnIwmI8v0FZuzb706hvb
         XguhzpqVSfHIrX3qW/zlkDknJjC1lXH/bKlFALIcnPUDjIi0mkgxeeJfv5DaOZshzfCb
         96zh97JjQOTUNSQa0PZ7Is7YFcAMKj6XqiL08/h97Fv3Xwdntb08HBMemwRQ6f+NTefR
         h98NWDvt1B/nDqlpaQsBpH/fCzl4ZRGtUha9ScJY0ysukiv8N0IE5nT9RjXueP2X3lkO
         p5eA==
X-Gm-Message-State: AOAM531FKio/BHibbmbfCjbPWrXrbqm6giFl50eBXu6vkJQny2194CCm
        jEWQSPfCk/9RiRfwtFFCj2UXrvzFMi69zCTnwxpQPhMcAVYSbQqL3Mg4Zf5q1J05qLmuUFDCb4o
        uq/ykJjt/HHqyjZfurY1eIu0=
X-Received: by 2002:a17:906:3809:: with SMTP id v9mr3392921ejc.599.1644937991437;
        Tue, 15 Feb 2022 07:13:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ2bMGmcOJecUfD4VJFc9Fx+qQFKlaM79AMvuVQdcl2j7vh+T+3wwCJUEdauhIxgEpsua1mg==
X-Received: by 2002:a17:906:3809:: with SMTP id v9mr3392895ejc.599.1644937991048;
        Tue, 15 Feb 2022 07:13:11 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id v8sm24179edc.30.2022.02.15.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:13:10 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id CE6C712E48F; Tue, 15 Feb 2022 16:13:09 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Sophia Yoo <sy6@princeton.edu>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
In-Reply-To: <CANLN0e6ersLvCSZSbxt6Roy2qJV2C90Y12RmEwQNtwyX2tURwQ@mail.gmail.com>
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk>
 <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
 <874k516q32.fsf@toke.dk>
 <CANLN0e6ersLvCSZSbxt6Roy2qJV2C90Y12RmEwQNtwyX2tURwQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 15 Feb 2022 16:13:09 +0100
Message-ID: <87mtis5fju.fsf@toke.dk>
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

>> >> So this has nothing to do with the support in the driver; XDP is simply
>> >> not suitable for what you're trying to do. Why are you trying to do this
>> >> in the first place? I.e., what's the higher-level use case here?
>
>> > The higher-level design goal (simplified to what's relevant) is that I
>> > am trying to perform a TCP 3WHS between the kernel network stack and
>> > my xdp ingress/tc egress hooks, where some trigger on xdp ingress
>> > sends a SYN packet to the network stack, and when the network stack
>> > returns a SYN-ACK packet the egress program redirects the packet to
>> > the ingress interface, where the XDP program converts the packet to an
>> > ACK packet, then completing the handshake with the network stack.
>
>> It's trying to handshake with itself (on the same box)? Why? Is this a
>> real use case, or a test for something else? If the latter, have you
>> considered using a veth pair in going to a different namespace (that
>> gets the "direction" right)?
>
> This is a real use case as part of a larger design I am working on.
> However, given that redirect from TC egress to XDP_DRV_MODE ingress
> fundamentally doesn't work, I am rethinking other options to the
> design. Alternatively, it seems that support for XDP_REDIRECT from
> egress to ingress is currently in the works, although I don't believe
> the patch has yet been applied to the mainstream kernel.

Huh, really? Haven't seen that, got a link?

> So I will also try building the kernel myself with the patch and
> hopefully get the egress to ingress redirect working with 2 XDP
> programs attached in driver mode. Thank you very much for all your
> help!

You're welcome :)

-Toke

