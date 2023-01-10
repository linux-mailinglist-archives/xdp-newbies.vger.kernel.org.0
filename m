Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED2B6643EC
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Jan 2023 16:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbjAJPCL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 10:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233939AbjAJPBw (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 10:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4811D0CC
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673362862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VntR9u9vzhaA0z3n01sbQKP6Jdj+IW0P1LXfsf/zRpU=;
        b=M+ItQ3lIr30HQt0vQkZ1sm8ojw5hz91I5M1kW1oYp08jW7ZcxvgZDAByNprlumqaqSP/i/
        308kc4mexCfYWXY7zYY+nFo6GGM2za63OXpL3FUP1a/xiwL8u0xphCRG7IT8XujcFZpa+t
        +tlTJSjkm2VyTxXK7si1ffXJkfgObgM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-TAnyIXN-O5qRNEvUMvNKJg-1; Tue, 10 Jan 2023 10:01:00 -0500
X-MC-Unique: TAnyIXN-O5qRNEvUMvNKJg-1
Received: by mail-ej1-f71.google.com with SMTP id dr5-20020a170907720500b00808d17c4f27so7875185ejc.6
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 07:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VntR9u9vzhaA0z3n01sbQKP6Jdj+IW0P1LXfsf/zRpU=;
        b=snS+PFm9+yxmHAe7DqWy4StON1un3qAZSe9moOVtKqh3+4TxBKz3Krc6BvbRaN/w9a
         RZ2ck54YwqpGQX0c7sQnXFMcE9RSDOoTaKnr6u4CnGUQAKvDqt9tOrNJNhCmBkmCp+/O
         FHVyAJQi7cmDqMsLsWw54cn1moZsYrgT8UXKWxSiFkWb/+/h+MXrCCg0g8zQPkbVVwuj
         6ZLtH5WAqUNppSjKCr4j/Dytdd22ia0lvn1a/m6RXqzum/9simikhzAmQk7TpMi2bxoe
         jMAOWG/QMaQjGcVOh+f//nIVm6raaR+T+SsvgKGGklmnGJX8nt5M8SIFcURoNG/TePxz
         N9nA==
X-Gm-Message-State: AFqh2kqqjOAIyy4QuMq+xGIA0NCOAHE6lnejlmaNMtQ13BpVMWfDrko0
        ATQNpEFna8LrzfhEMGQoJyZpXaGelwWYu04ZXoq/zncdlRUxmOWJiLlvxI03ER4T6pVG5DWq8rX
        IlElTTvk4w74vU9ZN69e3rqM=
X-Received: by 2002:a05:6402:194d:b0:48a:518:77f2 with SMTP id f13-20020a056402194d00b0048a051877f2mr38782170edz.36.1673362859509;
        Tue, 10 Jan 2023 07:00:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg6gzBPCvDEbXnK0k9Op1F5VMqVuzANB+7Vra2H2ZheQkVLR6KImYz1eMvvXOOcnt9H63iyg==
X-Received: by 2002:a05:6402:194d:b0:48a:518:77f2 with SMTP id f13-20020a056402194d00b0048a051877f2mr38782139edz.36.1673362859197;
        Tue, 10 Jan 2023 07:00:59 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906218900b0084cb4d37b8csm5015383eju.141.2023.01.10.07.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 07:00:58 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 0E52B900241; Tue, 10 Jan 2023 16:00:58 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
        team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Pause and unpause queue
In-Reply-To: <e4d0fc96-d897-c41c-8da2-f9c13725c2bf@hetzner-cloud.de>
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
 <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
 <87fscmyyfr.fsf@toke.dk>
 <e4d0fc96-d897-c41c-8da2-f9c13725c2bf@hetzner-cloud.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 10 Jan 2023 16:00:58 +0100
Message-ID: <87wn5uh1sl.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de> writes:

> Am 07.01.23 um 19:47 schrieb Toke H=C3=B8iland-J=C3=B8rgensen:
>> team lnx <teamlnxi8@gmail.com> writes:
>>=20
>>> sure, during xdp redirect i found that sometimes the number of packets
>>> arrived are too many for an interface
>>> to handle in which case. Hence thought to experiment with tx pause to
>>> make room for successive packets and then unpause !
>>=20
>> Right, so this is using XDP as a straight-forward forwarding
>> accelerator, redirecting from one interface to another? That will indeed
>> only work well if both interfaces are exactly the same link speed; this
>> is one of the motivating use cases for the queueing work :)
>>=20
>> -Toke
>>=20
>
> Hi,
>
> I saw your talk and the patch set from july about this. What is blocking=
=20
> things right now from getting into the kernel?

Well, the immediate blocker is me getting around to revising the patch
set and incorporating feedback + some other ideas for how to do it
properly. I managed to get awfully sidetracked before the holidays, but
it's on my list of things to pick back up this year :)

> XDP queuing support would be really nice to have. ;)

Knowing that there's interest in this certainly helps motivation-wise,
so thanks for that!

-Toke

