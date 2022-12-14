Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3BE64D2A0
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Dec 2022 23:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiLNWye (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 14 Dec 2022 17:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiLNWyd (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 14 Dec 2022 17:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417D1379FC
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 14:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671058426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=67DaFigB41HSWopzlq9WxD5zzUpYUH2iLooM8jt7dl4=;
        b=G7d20jd5iBErvR5td3iXk+RThy4vAm2j86HTgImPKp97mmbEi2KNZTBRRw6AE76kk8XHg8
        M+abg3bFq3dRfu9j5VZLK7extwDrTUe0NbgfSU82ZWmNUtAaY808YCHcuAn3wWWmZUVS1P
        Qsphux+8gVFrzmk50Yf/Y0syrMtqYeo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-vp8sw7mkNvaLMWXljwJSiA-1; Wed, 14 Dec 2022 17:53:45 -0500
X-MC-Unique: vp8sw7mkNvaLMWXljwJSiA-1
Received: by mail-ed1-f72.google.com with SMTP id t4-20020a056402524400b004620845ba7bso10451820edd.4
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Dec 2022 14:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67DaFigB41HSWopzlq9WxD5zzUpYUH2iLooM8jt7dl4=;
        b=cAVviCNADv9/QJxK70eyGTfIYFscsZXvY29dEZ0RlytpYol8Qbjns6kpBhq8Ob7gR+
         Mjz3Sz0hOoynx709RyUX5uIuinFUMJrxqQ2Hbw6YEqgRuKyNGYvdmo7Fmt6kmaBefoK0
         wre9yyvIFnCMqSQ49y1w0P1yBNr0VeVmnIZogW+wttwgUEpqCw0m2cjyUXQovEMQTQqY
         MAbDWOB6ZzBKBdvFZnlmDsbq8ur0+fouJYaEHHChUgbgCLMN9xxpr1KRBYdnT0XHFxBJ
         Wqxh7DDJafr2WnxMfyTXpD/X+NPPIzME4Q/KbdbgX9S85VeTTog+7zdJSLKU6l6fXB/+
         8OIg==
X-Gm-Message-State: ANoB5pmraiX+7gJX0jR+eiszwQYvDwuUL1yDVLqB7DMhFNEobwql6TdQ
        tA2LAsecx+WYyBJA8UbfvqBOcjoHmPd//WG5rGAQMku4efDkNijfqOU58Qdy6+4yR7wuHsz9XW3
        3Sm0YQqGia6a8BZfZq8pVYSo=
X-Received: by 2002:a17:907:d40b:b0:7c0:dd55:1dd4 with SMTP id vi11-20020a170907d40b00b007c0dd551dd4mr4725667ejc.42.1671058422860;
        Wed, 14 Dec 2022 14:53:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugUG7pHevbeTZ8SYl6RAVx1tky+B1pM/56z5QgoMXuYoYh8Yx56etaS3j9TU9+Khs98+HDCQ==
X-Received: by 2002:a17:907:d40b:b0:7c0:dd55:1dd4 with SMTP id vi11-20020a170907d40b00b007c0dd551dd4mr4725614ejc.42.1671058422090;
        Wed, 14 Dec 2022 14:53:42 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709063e4d00b007933047f923sm6234320eji.118.2022.12.14.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 14:53:40 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D154182F64B; Wed, 14 Dec 2022 23:53:39 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Vincent Li <vincent.mc.li@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Redirect packet back to host stack after AF_XDP?
In-Reply-To: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
References: <CAK3+h2xC1-5RgbT5FTKSMVopjHr_SuuU=E-bsvoCQYbVA5cn3w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 14 Dec 2022 23:53:39 +0100
Message-ID: <875yedfvgs.fsf@toke.dk>
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

Vincent Li <vincent.mc.li@gmail.com> writes:

> Hi,
>
> If I have an user space stack like mTCP works on top of AF_XDP as tcp
> stateful packet filter to drop tcp packet like tcp syn/rst/ack flood
> or other tcp attack, and redirect good tcp packet back to linux host
> stack after mTCP filtering, is that possible?

Not really, no. You can inject it using regular userspace methods (say,
a TUN device), or using AF_XDP on a veth device. But in both cases the
packet will come in on a different interface, so it's not really
transparent. And performance is not great either.

In general, if you want to filter traffic before passing it on to the
kernel, the best bet is to implement your filtering in BPF and run it as
an XDP program.

-Toke

