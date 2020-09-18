Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5B726FA7E
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Sep 2020 12:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgIRKVx (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Sep 2020 06:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27021 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgIRKVx (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Sep 2020 06:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600424512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sS+8PQs4IYXiHDTcvLHBLWWa41MniAx2QGiRAct/0pw=;
        b=Cp0eTJG/IwdzzfNhvcobMLDC6mTNOMh/Wvedg2KghUBTa5x8yIhtYkuJFB26cVdM2BqIqd
        UiTODDmp6JLAMKLBqOhQja1tjOZ8lmFGJrOri4rMKrYtjJhAHfaRmExxSJfkj0b+MvfC8k
        aX9U78tscbHVUlRnJKelqeATDLwyyvA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-Voq-dieQPOyLDGd5r2D7nQ-1; Fri, 18 Sep 2020 06:21:50 -0400
X-MC-Unique: Voq-dieQPOyLDGd5r2D7nQ-1
Received: by mail-ed1-f70.google.com with SMTP id r19so2086859edq.12
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Sep 2020 03:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=sS+8PQs4IYXiHDTcvLHBLWWa41MniAx2QGiRAct/0pw=;
        b=FJCjK23Mi/mGQIhsaB6BTXrbqXp539bbzOvVX890s8kJ6W7xI3wDTLiYo5hQdiCERG
         447L5gktBAc63Y9VKHvQIHFPiwth7HzTFNP0HrewPLN3+pVzndgGEBQxDq/nUs0adIEZ
         GV/mm5R17zeZbSN+lydswU68Ny6I+DWg51KmoSR6rgZeQlVqtd+NFxbPi0NDREzplVPx
         /4ofpXRuJKupn6re1aErrxzmQ23J3KiIgNxzBKydsV9bFLPYVwoeKtw+QGEBBtWpPBhA
         tdPnE3tVu0CZvmaOM8kr3Eh8++TQYhzwTW8q2nEEDn8K1JN8IpxlrY1okrt31jewUa4V
         vEew==
X-Gm-Message-State: AOAM532/KLulBza7kpKXtiuBP4yjmsim2OnS/WBnejaUyKAmSjTngvVq
        9XrUlkAtZS7VQ8W1MjyFGve6wo+RMZoOifUp9v24w5GanB7fOvW8g96HvOk33TbhnlIk5NklabH
        PCmV1L7QxNWNboIS0VHyrkU8=
X-Received: by 2002:a17:906:f6c9:: with SMTP id jo9mr34947913ejb.233.1600424508936;
        Fri, 18 Sep 2020 03:21:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM+rpby3p/6OMwGp9jmX0hq2fLZzvID3gum3G7ynirbkI8WakbuzXnhFHpWbUYebjQEQ/bvg==
X-Received: by 2002:a17:906:f6c9:: with SMTP id jo9mr34947899ejb.233.1600424508699;
        Fri, 18 Sep 2020 03:21:48 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id v17sm1927005ejj.55.2020.09.18.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:21:48 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 88C48183A90; Fri, 18 Sep 2020 12:21:47 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     ThomasPtacek@gmail.com, xdp-newbies@vger.kernel.org
Subject: Re: bpf_redirect and xdpgeneric
In-Reply-To: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
References: <CANDGNvbX+BwA_ZUmw2rxH5FGLFsCVH33Tw3RCk3e3Qo69J+4qw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 18 Sep 2020 12:21:47 +0200
Message-ID: <87lfh7fkqs.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thomas Ptacek <thomasptacek@gmail.com> writes:

> Weird question:
>
> Should there be a reason for me to expect bpf_redirect to fail when
> redirecting, in XDP, to the egress of an xdpgeneric device?

What does 'the egress of an xdpgeneric device' mean, exactly? I.e.,
could you share some more details of your setup, please?

In general, mixing native and generic mode XDP is not likely to work
well...

-Toke

