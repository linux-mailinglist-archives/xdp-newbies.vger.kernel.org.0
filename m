Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D482513D31C
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 05:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgAPEWr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 23:22:47 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:45966 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729661AbgAPEWq (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 23:22:46 -0500
Received: by mail-io1-f54.google.com with SMTP id i11so20270414ioi.12
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 20:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJF/EJbQuPmPT7BLrY9aCp3mjf8rPeGARaX/PdhkDfg=;
        b=UQIGIG+xn7p/KQi1/JTDmOYMstPiulHVk+0ek9qtJxmR2L/boxeBYP1DbxK4pa6iGk
         eftaTuBlF+JjLLo3F9N7ldgQIuIrJP8MYIZf5p4tRaNiuQ835NVF9FVwjvIN7CdZEWEC
         3zmuJhg0z0wSQTi8T5iA+hRyB8NPsCPEVBHATSQqI2lmEMh7x56jTfqw8ch0TZpQH6bs
         7shTSZmk0Cx2DlDCYqmg75ydcRen7JMNfijRzUBB0wRRWRQ1rcOpxr+QY464fjmB9lnH
         m6jFNbQPNz2B4E7DK47gLk8gGlFtCB94X/KXbCsX7/aiVZButcxVilvMzDnbbnnfpuzk
         0OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJF/EJbQuPmPT7BLrY9aCp3mjf8rPeGARaX/PdhkDfg=;
        b=uWyDJ8NBIM/oDaY02dyMzhjFGIvOv6hJ+Etajzhx3bohsK4sz2hiYCtS2Yq1waLRg8
         DSpEW3Lk5j7ZMJ5ohUbnY7cq0H8s3GYFW6fVuTQkbaZtn2ShOBzVMkJpRO+Pyf5kHE/T
         +IJ0NM+wHgTEDPwCVp1KoW9mtKeELP2qkLMX+slPzmnlnM/6X3znBwLOBkWleTOfOkJL
         ziPbQJnOhWfOtL2xI3EpYI/DABBviXVnuYFKLd5FoJ5nzZpZ3UBbcW/wdvu3ToBR98Mg
         zuVaAIAVzXCA6Iei5mnY780Mt1TaKONQJ3gMriih46QacteV/Mfe4q1oSBcxufqCqJhV
         aUhA==
X-Gm-Message-State: APjAAAW6Kh5oZn/2AaBAZEiL2faobKukVhk/+ygsE6m8crUvouGJibvS
        1NgdXl3/au8fUI8PishtVAk61kjY
X-Google-Smtp-Source: APXvYqyOZXSujUZHGO9iRL7MhL/ii5YDQbjP790SQyGV6ghT3ypyvLf8oZWPKcGcrfftov5CCFBF3g==
X-Received: by 2002:a02:7f54:: with SMTP id r81mr27495166jac.121.1579148565751;
        Wed, 15 Jan 2020 20:22:45 -0800 (PST)
Received: from ?IPv6:2601:282:803:7700:5c84:fd9a:6187:58f5? ([2601:282:803:7700:5c84:fd9a:6187:58f5])
        by smtp.googlemail.com with ESMTPSA id i11sm4727564ion.1.2020.01.15.20.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 20:22:45 -0800 (PST)
Subject: Re: XDP invalid memory access
To:     Vincent Li <mchun.li@gmail.com>
Cc:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <87ftggtl7t.fsf@toke.dk>
 <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
 <99fe90fe-cbb4-1ff1-156b-bd8053293aca@gmail.com>
 <CAK86TEcGAkmPLeYACWGtLT0CJPZqGYCqZDpZSO=0x4_ph0qcUA@mail.gmail.com>
 <CAK86TEe8Je6NjLWzRHoMhDgqKyhqYd7pX2awmAUTQ7V3GCcKAA@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <ae0f349a-67a7-9c52-e48c-9c713e484af9@gmail.com>
Date:   Wed, 15 Jan 2020 21:22:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAK86TEe8Je6NjLWzRHoMhDgqKyhqYd7pX2awmAUTQ7V3GCcKAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 1/15/20 8:19 PM, Vincent Li wrote:
> 
>  59         if (tcphdr->syn) {
> 
>  60                 if (((void *)(tcphdr + 1) + tcphdr->doff*4) > data_end)
> 
>  61                         return 0;
> 
>  62                 optlen = tcphdr->doff*4 - sizeof(*tcphdr);
> 
>  63                 for (i = 0; i < optlen; ) {

A variable length loop counter. Change this to just look at i = 0 (no
loop) and see if it loads.

