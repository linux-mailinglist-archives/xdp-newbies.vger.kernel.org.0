Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447D936CC35
	for <lists+xdp-newbies@lfdr.de>; Tue, 27 Apr 2021 22:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhD0UPr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 27 Apr 2021 16:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235401AbhD0UPq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 27 Apr 2021 16:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619554502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=E45NRNfr53k3VqQ946JiSoOGt9NJ3BEIPDTe6a+dIXQ=;
        b=dSAV2ixlNWrPkzmoB1OBbseHwiPk/bbtybflH+YTAUyMsvD7jEvzwHvNYmex3iGJEJSqLG
        VDOPl6Z7SohpEriQ1J9jqLVuS5Jc3RuhDv2j/NtuMxx9bqmmM/ATnn1iIJrM04IyDOVhVX
        rIvHrEf27Pz/odwvFs0JuTy+brbykKY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-x9rMneGBPqK8sRJ3vS8K3w-1; Tue, 27 Apr 2021 16:14:59 -0400
X-MC-Unique: x9rMneGBPqK8sRJ3vS8K3w-1
Received: by mail-ed1-f72.google.com with SMTP id h13-20020a05640250cdb02903790a9c55acso25493782edb.4
        for <xdp-newbies@vger.kernel.org>; Tue, 27 Apr 2021 13:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=E45NRNfr53k3VqQ946JiSoOGt9NJ3BEIPDTe6a+dIXQ=;
        b=LqGdm134D7FFMxsiL8sD1sQ8GZP/SWTCxkbBQjEXhtxhXFs58ACb6jX16s2XkPXqzu
         hKjgYi4h6SeWDJllOQK76dYnBycjjHDFj6BqJW52Jy6igLmQlIJZBDDJv5GVy2UjjtNc
         zrYe2X1amgdDV4OyndfCx958UhiSYGknzIgrPiBguhO72E4oaZiy3BwDP5J6d3ifca81
         iL08iNrJGRS89OmPsJ9zH6XaeWYLIwcokJryHpxfRknZSTmSii1Jgk2oKbmBwnGKWwFn
         yo558u+Jt73yx5P5Nt9Sj/vC0VqH58oCzIvTp2vnPQHRxnONAlYpuOVvwrAMkcoztaQl
         06WA==
X-Gm-Message-State: AOAM531Y7k0GoVcgVc602DbEEQng84WMdQYG02l5MIsrTpkNJd7KJVQ4
        KMpvi9kDFvguoou0YVqxchIZgEMGfKpDmAjtjCb5Veul3vlzQnFyRDohUsdUpKipgSrVyEkXyUi
        N3p8cWLDccnLDWPbzNeQotFw=
X-Received: by 2002:a17:906:364d:: with SMTP id r13mr3720611ejb.250.1619554498509;
        Tue, 27 Apr 2021 13:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwOho3GPg8hHnExT3wpdBsFFPnQEcv3WUPCh7C6XbFLkxIJRHSlfxD/LqUwk0l5otzhVZo0Q==
X-Received: by 2002:a17:906:364d:: with SMTP id r13mr3720598ejb.250.1619554498128;
        Tue, 27 Apr 2021 13:14:58 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id y10sm501414ejh.105.2021.04.27.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 13:14:57 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id C7192180615; Tue, 27 Apr 2021 22:14:56 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>,
        xdp-newbies@vger.kernel.org
Subject: Re: Sending A Separate Packet Out The TX Path In XDP
In-Reply-To: <d153ed73-3a46-cbf9-c9b7-947926083027@gflclan.com>
References: <d153ed73-3a46-cbf9-c9b7-947926083027@gflclan.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 27 Apr 2021 22:14:56 +0200
Message-ID: <87wnsn8oxr.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Christian Deacon <gamemann@gflclan.com> writes:

> Hey everyone,
>
>
> I had a quick question. Is it possible to send a packet separate from 
> the original out of the TX path within an XDP program? I would imagine 
> this isn't possible, but I just wanted to make sure.

Not from within XDP, no...

> If this isn't possible within the XDP program itself, is it possible to 
> do this with AF_XDP sockets or can AF_XDP sockets only handle packets 
> redirected via the fast-path XDP creates? I wasn't sure if I'd need to 
> make another Linux socket inside of the AF_XDP program in this case to 
> send a separate packet out.

...but AF_XDP sockets can send whatever you want :)

-Toke

