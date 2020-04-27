Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77541BA1A1
	for <lists+xdp-newbies@lfdr.de>; Mon, 27 Apr 2020 12:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgD0Kqq (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 27 Apr 2020 06:46:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56101 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726507AbgD0Kqp (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 27 Apr 2020 06:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587984404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iXAHTJdDS8jVfuTrf69GaAgsJlKDafNeOqid/tkn9Fg=;
        b=AoMEg04f8th9vfeFkPWz/46GHF+Ok2sHaY5QPd486+hvcM8zNzIJhgl6+dxuKusYCfH7xq
        VqTebBwRF+RAaNl3c72h4ch8fU2Z7v2UwlzsbVjPK01fiB/RW31TN+JSss8Q/cRuzxrlsG
        N7UcUxgTzG2UTKGsJRbnYDDTuwUUozY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-RRWjStgMMP-aCXsq9fbxjg-1; Mon, 27 Apr 2020 06:46:41 -0400
X-MC-Unique: RRWjStgMMP-aCXsq9fbxjg-1
Received: by mail-lf1-f69.google.com with SMTP id t11so7306693lfc.17
        for <xdp-newbies@vger.kernel.org>; Mon, 27 Apr 2020 03:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=iXAHTJdDS8jVfuTrf69GaAgsJlKDafNeOqid/tkn9Fg=;
        b=NHR+DDvh+1xuY7cv/TNf/hBnymwJ2wPu/61JRJYVz24vWzx71BCNLON4v2rRwqIcja
         unIBsfs7NjjUaQWcl5aojNCDhXIcFCMLpa1LOavgdAxM6Hj26SmhChl3t3Bk59jWdrxJ
         bYBxzEp1ZZp7VdeF1aTvbDhUSte1iOjzSyuiNnjCCVKwapHgmkbxZCSF8aw2Y7vJ1RiR
         RT8gExEIAmIzCHwV0o6Yd/5U2/WIkj4393/CeubtpddCBt+6fGuB4ZiZF1LAPOX6Svuo
         NWxABE9dJx+nVdfERnd8iNRjdyc0rZ8wOcTNG0b7beIHx7WWfT1ub7zFxhAKU0jRVWM2
         bSQQ==
X-Gm-Message-State: AGi0PubXJZjDZa11ipeRYEhqh3eKZ2hjFMhMLunOkKOV7HCiQ4wW30+x
        j/ymOmTjmjDYpxEPxEZwPTpbG5LhZDvSVqxalkQTmifqUawOef5+pJeeARyaR7W8JLEUE0MOpgh
        ZjIEX6adisuQWMk9MeEOZjhg=
X-Received: by 2002:ac2:50ce:: with SMTP id h14mr14992249lfm.76.1587984399496;
        Mon, 27 Apr 2020 03:46:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQ1n93jHgUsHJBRSCe8cq5sQzOm11gHdFx9eaXCq9TO232Ar5sgLPM77yJc0XvjSd0LWGtRA==
X-Received: by 2002:ac2:50ce:: with SMTP id h14mr14992235lfm.76.1587984399216;
        Mon, 27 Apr 2020 03:46:39 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id y21sm9898107ljg.66.2020.04.27.03.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 03:46:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id D00C41814FF; Mon, 27 Apr 2020 12:46:37 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Sowmini Varadhan <sowmini05@gmail.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies\@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: building eBPF
In-Reply-To: <20200425163458.GB455@gmail.com>
References: <20200425122225.GA455@gmail.com> <20200425145619.4405a50d@carbon> <20200425163458.GB455@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 27 Apr 2020 12:46:37 +0200
Message-ID: <87o8rdyzn6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Sowmini Varadhan <sowmini05@gmail.com> writes:

> On (04/25/20 14:56), Jesper Dangaard Brouer wrote:
>> 
>> The kernel's samples/bpf/ should still builds with LLVM-9 (and lower).
>> Follow instructions in the README.rst file[1].
>> 
>> There are pre-build Debian and Ubuntu packages for LLVM-10 here:
>>  https://apt.llvm.org/
>
> thanks that helped me install llvm-10
>
> However, after all my adventures, I  end up with
> # ls /usr/bin/llc*
> /usr/bin/llc  /usr/bin/llc-10  /usr/bin/llc-5.0  /usr/bin/llc-6.0  /usr/bin/llc-7
> and the default points at 6.0 so I had to go and tweak Makefile
> to use clang-10 and llc-10

Note that you can just override them on the command line. E.g.,

make CLANG=clang-10 LLC=llc-10

-Toke

