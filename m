Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D834519A758
	for <lists+xdp-newbies@lfdr.de>; Wed,  1 Apr 2020 10:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgDAIdW (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 1 Apr 2020 04:33:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50018 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726197AbgDAIdV (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 1 Apr 2020 04:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585730001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DSvm1xZXnG2GtA2xSDz85VIh6QSZYxr7GFUdclFbeHA=;
        b=Telhq2k7LOhMzICy2ZrumE5C655hggHE8Gqxn7Cbp32xRtdvvS3y3dhzdkcRakat2V6nHL
        0L07q1s1lfZk5NWmUs+YdIwSHU7cqO0ZqLeeGWtCkwltJjFioDaK0xwrHsU2IqlxkyDP7g
        ZW86NO7IRZBll0NHi+kbRWEKG4N4KPU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-RhHtwxDtPQe-zQrnG6y4Gw-1; Wed, 01 Apr 2020 04:33:19 -0400
X-MC-Unique: RhHtwxDtPQe-zQrnG6y4Gw-1
Received: by mail-lf1-f72.google.com with SMTP id m12so9941742lfj.5
        for <xdp-newbies@vger.kernel.org>; Wed, 01 Apr 2020 01:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=DSvm1xZXnG2GtA2xSDz85VIh6QSZYxr7GFUdclFbeHA=;
        b=ZIe+KcHla+nTkx4OXLlFjPaU8OaLj5pFL8iq1JANc4/NFuRjh3+CUqA0byOiAZZl2k
         D/OIyt8umUi25cVgC+KLBcHhqmDd+oR+UZgRV3AQFDMfImanUx+0DP0QXiZA2sASik/T
         bPddGiXS/Q3yAtyiS84+jxFTU2ue1jslkqN0RX7Ovf490ryBx5e0dvCYghH4GfqxYszN
         i3tCD3yY/RIJVPqCwK7D/O7OWj9SE/QerSvUkdQdGWfdpAvwGJe13lSbcg+2KR5u/Yqv
         F163gYjVXvR19Z34uJrZK0YqvkVIunYWz62Y7PrM/uT8PA/VzcII7Psy5787MX220PuP
         3d6A==
X-Gm-Message-State: AGi0Pub3mLjkes9kt5ivuTdKZlFaEtF8HYYa83GJf1W9gYygK7qpY7rJ
        EHyi+eysQqo3p7bxX+jfPwkVZwkFYUE1SZv0l4FV4hSrCAowtiEl08ZRth+y0Sz1h2XQsdBMdsL
        NO2xddRHWgo4AWbkAhfkUHHw=
X-Received: by 2002:a2e:9585:: with SMTP id w5mr12958840ljh.178.1585729998043;
        Wed, 01 Apr 2020 01:33:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypLqXgeLgVll344CdOICgQ282ELQGc/pldV6sAGiKdVoRDGEszhwXIdrmvCEAMZ3J2UFGzYtoA==
X-Received: by 2002:a2e:9585:: with SMTP id w5mr12958823ljh.178.1585729997825;
        Wed, 01 Apr 2020 01:33:17 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id y24sm1046170lfk.87.2020.04.01.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 01:33:16 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B69AC18158D; Wed,  1 Apr 2020 10:33:11 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: Using AF_XDP To Modify Outgoing Packets
In-Reply-To: <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
References: <7902d2f1-1c21-f3e8-5035-352bba130d50@gflclan.com> <20200330111048.1167e6f4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <dd0d11d8-29ff-18c5-85b2-d566d2bba2ea@gflclan.com> <87sghoj2jf.fsf@toke.dk> <8013b38c-696c-cadd-a4cd-756eca658215@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Wed, 01 Apr 2020 10:33:11 +0200
Message-ID: <871rp7ip14.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey Toke,
>
>
> Thank you for your reply and information!
>
>
> After looking into the TC Hook, it looks like this will work for my 
> case. I'll try to get a program made in the next few days or so.
>
> Thank you for the help!

Awesome! You're welcome :)

-Toke

