Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1232F4B5DA1
	for <lists+xdp-newbies@lfdr.de>; Mon, 14 Feb 2022 23:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiBNW2P (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 14 Feb 2022 17:28:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiBNW2P (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 14 Feb 2022 17:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B879CF70DB
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 14:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644877685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k2yHXtUnXq8bUAnO6g8YzMQRUwZepDECjUpELfNrwrw=;
        b=fVgWgctQ1eoGUEFS8xe4Vpe+tCcsJpUvJB/gm8JqnGYeUka3C+0QDGg6ld4cE+n3ydrV4Z
        73B079EW2M/ciIr2LinQMd0U1ahjlUNMQA12NzbuH2whsQ22cbj6UebRiC1HQWLoeNpdWU
        7u86LxVuxm5dQ6+2Fh76jrrnUZ9HWA4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-qer7BJahPY-wShpW1pq-GQ-1; Mon, 14 Feb 2022 17:28:04 -0500
X-MC-Unique: qer7BJahPY-wShpW1pq-GQ-1
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so6537359edw.23
        for <xdp-newbies@vger.kernel.org>; Mon, 14 Feb 2022 14:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=k2yHXtUnXq8bUAnO6g8YzMQRUwZepDECjUpELfNrwrw=;
        b=NAqrKyZjJUm22aKnMG7JhKbk5BwtcvDV2gMaaDyX+MqAzv6z3O0VJcI6Tw6O5t9qTw
         P8ELF3c3IWSicqfJtKcVTjvLXcLllzKie+HThOQAUwfaeRI6GZBDMDve8iJYNyYQBGvP
         THrsMSK6dpdfyvw83LhQ4Oxw5PE4F+vUxz3bn1EvAuWXZm8jiTLIoj+Cg+1Mzg+kryIa
         JOHG0c5wGt3X/9WhDWHyWkYVwVATSpocUbwLcxixuBSdyjwo/DIKBevcaionP4G3dMqC
         dpQuoeFy1OiSGt+3ehisYesuXddYHu1NH+VSI33dmYjjBTHJyEzmqSyzqCioxiGLUL8h
         m80w==
X-Gm-Message-State: AOAM5320xUntV8CmhYrzJxGYZM3k7MjOih8bAXSfsQp70hHaC678jIiZ
        oBQ0+BvrmJ5+Ot4I3FnOMXdHgSGW2qTCa7r1BPKHGaKzDNo9Dgd53joPvuyynmFnW4itGNobRCN
        AryuJ1fDm6klFZ2TV/KVXZGQ=
X-Received: by 2002:aa7:da9a:: with SMTP id q26mr1063535eds.288.1644877683173;
        Mon, 14 Feb 2022 14:28:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyExH6vLVed8NFWb2KqwZpelqmuY+w9kCqwU9Rt059hamP8U9q9tADiMuTEzaz1EvdHib/SDg==
X-Received: by 2002:aa7:da9a:: with SMTP id q26mr1063518eds.288.1644877682740;
        Mon, 14 Feb 2022 14:28:02 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id p24sm1994294ejx.53.2022.02.14.14.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 14:28:02 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 98DA612E2D0; Mon, 14 Feb 2022 23:28:01 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Sophia Yoo <sy6@princeton.edu>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP_REDIRECT not working in XDP_DRV_MODE with Intel xgbe driver
In-Reply-To: <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
References: <CANLN0e4cm__UeAP+TgxHH+Pg0f0aU6jN9-CCPf=O4crsonuynA@mail.gmail.com>
 <877d9x7168.fsf@toke.dk>
 <CANLN0e6d-=3SjX_VEOOVmPBfCy74KCSTwBCTFxyxEgczpQTwTA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 14 Feb 2022 23:28:01 +0100
Message-ID: <874k516q32.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> On Mon, Feb 14, 2022 at 1:28 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> Sophia Yoo <sy6@princeton.edu> writes:
>>
>> > Hello,
>> >
>> > I am relatively new to BPF/XDP, and I=E2=80=99m currently trying to us=
e a TC
>> > egress program to redirect a packet back to ingress, where I have an
>> > XDP program attached. When the XDP program is attached in generic mode
>> > (XDP_SKB_MODE), the redirect occurs properly and the packet is seen on
>> > the ingress of the interface, but when the program is attached in
>> > native mode (XDP_DRV_MODE), the packet never redirects and is just
>> > seen exiting the interface, even though the return code of the
>> > redirect function is =E2=80=9Csuccess=E2=80=9D.
>>
>> The difference between XDP generic and driver mode is that the generic
>> mode is hooked into the core networking stack whereas driver mode runs
>> in the driver as the very first thing after packets are physically
>> received from the network.
>>
>> This also explains why what you're trying to do doesn't work: the TC
>> hook runs in the core networking stack, and when it does a redirect, the
>> packet does not actually pass through the network driver, it appears
>> further up in the stack, where only the generic XDP hook will see it.
>>
> Thanks for your quick response! I see, I didn't realize that the
> packet was being redirected before it passed through the network
> driver. However, in this scenario, shouldn't the packets "disappear"
> after being redirected from tc egress to xdp ingress? In other words,
> even if the packet doesn't actually show up on the xdp ingress hook in
> driver mode, it should at least not be seen exiting on the egress path
> (e.g., on tcpdump)?

Is it possible the packet is looping? I.e., it goes out eth0, you
redirect it to egress on eth1, it goes all the way up the stack and the
kernel ends up forwarding it back out eth0?

>> So this has nothing to do with the support in the driver; XDP is simply
>> not suitable for what you're trying to do. Why are you trying to do this
>> in the first place? I.e., what's the higher-level use case here?
>
> The higher-level design goal (simplified to what's relevant) is that I
> am trying to perform a TCP 3WHS between the kernel network stack and
> my xdp ingress/tc egress hooks, where some trigger on xdp ingress
> sends a SYN packet to the network stack, and when the network stack
> returns a SYN-ACK packet the egress program redirects the packet to
> the ingress interface, where the XDP program converts the packet to an
> ACK packet, then completing the handshake with the network stack.

It's trying to handshake with itself (on the same box)? Why? Is this a
real use case, or a test for something else? If the latter, have you
considered using a veth pair in going to a different namespace (that
gets the "direction" right)?

> Initially, I had wanted to use an XDP program instead of a TC program
> on the egress path to do the redirect to ingress (which I believe
> would bypass the current issue if both ingress and egress xdp programs
> were attached in driver mode), but as of now it seems that redirect
> from egress to ingress simply isn't supported in XDP, which is why I'm
> using a TC program.

Well, there's also an ingress hook for TC you could look at (or just
stay with generic XDP).

-Toke

