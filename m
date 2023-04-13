Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF7D6E0C49
	for <lists+xdp-newbies@lfdr.de>; Thu, 13 Apr 2023 13:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjDMLRN (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 13 Apr 2023 07:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjDMLQ5 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 13 Apr 2023 07:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F10A76BB
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681384572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7nvnnLZTfiDhw6JIfkYMISDeKFbt8F8iNDWCEyl9qpA=;
        b=AaQJjteYr4VUF5bRwb3pXjrR1hAy4SduGbdrINbjzWl8tCSd4KSwz5hdktPd6A5aq9d+aw
        R0DhyCNpj+yQf2BjIXbeJnnXdrtbGjfoZmxNj+iJX/XS5qzo+NkKdbQ1AebREFnYIEN5yT
        GbKIPCnApfEo0KU7lgU1oilPmXuzQW4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-Pomx1PS6OtqdwoSW6RDsGA-1; Thu, 13 Apr 2023 07:16:11 -0400
X-MC-Unique: Pomx1PS6OtqdwoSW6RDsGA-1
Received: by mail-ej1-f72.google.com with SMTP id kr13-20020a1709079a0d00b0093be92e6ff4so5368743ejc.23
        for <xdp-newbies@vger.kernel.org>; Thu, 13 Apr 2023 04:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681384570; x=1683976570;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nvnnLZTfiDhw6JIfkYMISDeKFbt8F8iNDWCEyl9qpA=;
        b=ct7xblvgkOi8X8lIpd7CBhN+hm0fifl02AIQn/9XlpsVtXX+/90pa6NQof2YjGCGp0
         SnWU9cz43WQXrZ2EKuW+QsGYPYcKorn5fJMkVCYzvz0yFOJvW42OHgieQ1R6vSC7PpCE
         QRxkFXu4tpv3Y04sTd9gDooOxMoiOqjvssFg5RZufCbq2l3kDS/um0BkGQ8wd86Po1HS
         QRYini1Zh0P2UUalJ40uNEmUqP8XkBQnQiFmRLjbhA+pu4k/eMa8Vs8deNmv6TV5Mvo6
         dFNRu4sD8rvVi1hcwUCIvkNUtFICUqEmcIDeSToLwx/ZIMvCy3DREw880ReYRbjQ4XT8
         eAbw==
X-Gm-Message-State: AAQBX9cbqFrf3hxoxxhOUn4iryUA1OM8wwjLqzJxtfuAc98YemIe0Mko
        4Coq/tyFbM0R9jZlkVDzNHGbpO9VZJjKaDAlLDXVFbCPBOvpmu8nJF1ko+4it7p6Kf3hnWgsmBn
        2rG3o4e14oVq4GW7dr0IvJUw=
X-Received: by 2002:a17:906:b7d9:b0:94a:7716:e649 with SMTP id fy25-20020a170906b7d900b0094a7716e649mr2481318ejb.13.1681384569355;
        Thu, 13 Apr 2023 04:16:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350b/PCJ2m+XeFW0K5AUIipHYzRqAO4/ZjbMOSgRtBhAReBY14FISI3zSj+u34UPdKyQCtjEljg==
X-Received: by 2002:a17:906:b7d9:b0:94a:7716:e649 with SMTP id fy25-20020a170906b7d900b0094a7716e649mr2481261ejb.13.1681384568559;
        Thu, 13 Apr 2023 04:16:08 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id pg16-20020a170907205000b0094a85f6074bsm844024ejb.33.2023.04.13.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:16:07 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 4D5C3AA7AF5; Thu, 13 Apr 2023 13:16:07 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Qiongwen Xu <qx51@cs.rutgers.edu>,
        Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc:     "brouer@redhat.com" <brouer@redhat.com>,
        Srinivas Narayana Ganapathy <sn624@cs.rutgers.edu>,
        Tariq Toukan <tariqt@nvidia.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Question about xdp: how to figure out the throughput is limited
 by pcie
In-Reply-To: <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
References: <CH2PR14MB365761EDE0FB656784E79728E3969@CH2PR14MB3657.namprd14.prod.outlook.com>
 <b8fa06c4-1074-7b48-6868-4be6fecb4791@redhat.com>
 <CH2PR14MB3657EF09F9A2BE7C08E4C9DBE3989@CH2PR14MB3657.namprd14.prod.outlook.com>
 <7C8EC844-D2DF-4980-A178-30E2719E3575@cs.rutgers.edu>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 13 Apr 2023 13:16:07 +0200
Message-ID: <87fs94118o.fsf@toke.dk>
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

Qiongwen Xu <qx51@cs.rutgers.edu> writes:

> Hi Jesper,
>
> Thanks for the detailed reply and sharing these helpful
> materials/papers with us!

(Please don't top post on the mailing list).

> After enabling rx_cqe_compress, the throughput in our experiment increases from
> 70+Mpps to 85 Mpps. We also tried to use the counter "rx_discards_phy". The counter
> increases in both cpu-limited and pcie-limited experiments, i.e., in the experiment
> which is only cpu-limited can also increase the counter. We are looking for any
> counter that can separate cpu- and pcie-limited cases. Regarding the [pcie-bench] tool,
> unfortunately, we are not able to use it, as it requires fpga hardware.

Well, are your CPUs being maxed out? IIRC it was pretty obvious that
they weren't when we were running those tests, so just looking at
something like 'mpstat' should give you a hint. For more detailed
analysis you can use 'perf' to see exactly where the CPU is spending its
time.

-Toke

