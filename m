Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0551E661126
	for <lists+xdp-newbies@lfdr.de>; Sat,  7 Jan 2023 19:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjAGSsA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 7 Jan 2023 13:48:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbjAGSr4 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Sat, 7 Jan 2023 13:47:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DA4625A
        for <xdp-newbies@vger.kernel.org>; Sat,  7 Jan 2023 10:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673117228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7fEPRK/HuU3iygPpcGlBH8jvhOAfYDXsOHVmXEE9r6o=;
        b=JH2vDgWrobCB7CB9APBzXu7JEpQ9KVyOh6qZSFfWcsEz6u9Ahb8CDXCNHHGfXKVcq7NcqE
        1VqXtxPoTMPmyEDs/DbBI98XB/iDsNAvVrXkP290GJeDbdxeOKGQfo8e7Ux0NoZ+D8LqgE
        sWmX2DQ45qxdplEwGWQ9ToGNasvR1lE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-sSUm4JKXMwGxr1HlyW4kzA-1; Sat, 07 Jan 2023 13:47:07 -0500
X-MC-Unique: sSUm4JKXMwGxr1HlyW4kzA-1
Received: by mail-ej1-f72.google.com with SMTP id sd1-20020a1709076e0100b00810be49e7afso3055336ejc.22
        for <xdp-newbies@vger.kernel.org>; Sat, 07 Jan 2023 10:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fEPRK/HuU3iygPpcGlBH8jvhOAfYDXsOHVmXEE9r6o=;
        b=0TjZ2IntO1BKNUE9cbWcHWA6pthK6p7wbLcFPVZcnrk0uqdCLUD+Krkibx4WE3m/NR
         lGT5WyqhZ6O0igT4Ln09FaUuvZa7nsBIfkKlHdYCifsTDRbGkmG/BNkyv0NkWjtmiLmp
         96GreLB9RfJ6X5/+dFtL9St5g4bWeXIj46W2CiGueaR6emLAEO22lTMiv8YCrzESO4YX
         VyIZKyiMzJB+5S7u1zCmhirGc/BZbSqEahwJ9Fl2OpQ+lDzGc5dISiBsrX+4+kZ2Kjdy
         /vf1D0sEs4JHc05MRVqtnVmKoCRHQL2OpVM8BCt2PrpegpTj7WboeXOzW6umgzTxwWIh
         zVEQ==
X-Gm-Message-State: AFqh2koek6zGYBVOwnS1qBn3zI0id0hR79lU0TwshLJHclhgC6vJj6VH
        RXJWh1YSFdTBTZnHoxwPm7DNo2dmv7rGpG5h2D+pM62E7pfQ+nWx1fZBxR83WAfU5RSwk36h/3n
        xXKfBFz+TGH24mKUwbdWyQoI=
X-Received: by 2002:a05:6402:2907:b0:497:1787:13af with SMTP id ee7-20020a056402290700b00497178713afmr4307487edb.32.1673117225572;
        Sat, 07 Jan 2023 10:47:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJYcU60pXavLJwW5ho1uZ+g8fEeuQcbbXGw22f0fFzpkVGnP44MK7t0O4WLSLYgfXkqvz+NQ==
X-Received: by 2002:a05:6402:2907:b0:497:1787:13af with SMTP id ee7-20020a056402290700b00497178713afmr4307479edb.32.1673117225277;
        Sat, 07 Jan 2023 10:47:05 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id fj20-20020a0564022b9400b0048ee88aa4d0sm1719593edb.56.2023.01.07.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 10:47:04 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 14A358DA322; Sat,  7 Jan 2023 19:47:04 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Pause and unpause queue
In-Reply-To: <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
 <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Sat, 07 Jan 2023 19:47:04 +0100
Message-ID: <87fscmyyfr.fsf@toke.dk>
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

team lnx <teamlnxi8@gmail.com> writes:

> sure, during xdp redirect i found that sometimes the number of packets
> arrived are too many for an interface
> to handle in which case. Hence thought to experiment with tx pause to
> make room for successive packets and then unpause !

Right, so this is using XDP as a straight-forward forwarding
accelerator, redirecting from one interface to another? That will indeed
only work well if both interfaces are exactly the same link speed; this
is one of the motivating use cases for the queueing work :)

-Toke

