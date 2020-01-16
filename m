Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B5113D134
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 01:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgAPAku (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 15 Jan 2020 19:40:50 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:35961 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgAPAku (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 15 Jan 2020 19:40:50 -0500
Received: by mail-qk1-f180.google.com with SMTP id a203so17621866qkc.3
        for <xdp-newbies@vger.kernel.org>; Wed, 15 Jan 2020 16:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0no47CAwr1lFxkCBBF0APpRlRRo7mTb9myWNZVLqJ/k=;
        b=MBHTBKNtudM8Z2U53xQ9+61PJ4EJ/lfoo7zgC00v5by76KRKljUtf1fbgEFAu27XD4
         nm9yN5bXgFsZo8F2lKUBSM9i7zzX4InAGjt9qKxGo1VdBq2HIZ+fOHKEkzc8avgRjinA
         v/JWrWcI/2/mrgL5F1s55rkd2q629BhLuIS585rfS2jqRkT8K0nXNJhC0oI/iwJKHlMk
         L9CIWOR35JUzolWer5P+VvbJIiLNA7A7gPnhHfCIhFZ/6gBZTp2UmJWQUadOBNISG1ip
         2FJ6n8wUGUuPRr9IL7DOOB1QwvuFIDCMbt2ERyCSbSpq9GC9NFkQwp4m03PFK6EkIQdZ
         8BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0no47CAwr1lFxkCBBF0APpRlRRo7mTb9myWNZVLqJ/k=;
        b=ZE41f3nR8RUt0sqGIerbHd3nfmxdK+2pHxB4KxyvVpzImGHsDaYnjRM/U/0cgSLjqw
         LOoYW0jjH7bPmR4GBWyjwhzwm9bh+AqbO0StXLCGSFQSVToE3c7bEsfcJLtNJfBNTqvB
         7h8mR9Nr4XHmOwXBRAAnVz6CQjgs2xnDFmiHWuH+3am+mudLvckfpcH6wu3yvAV9wXXM
         HTO0ERD96Cpl5HYvrULGos7TMLnhaCVMBh6SjR/hCIpTqrDYhs5+HrP5aFhCAI7aNInV
         +nZqGmF8bm9U2gpAxCJOb5hHzkRm6gEM5XbcBL5UTqW5noLVAZlKoRlWelc3p5YtFgmE
         HzbA==
X-Gm-Message-State: APjAAAXZ/Sm+5SmlS0Vxr0KTytWgmlSB/rKyayUZ66B3zIGNzw9COp05
        1mt5F9YX+WlLbVJI4oMIHT3fKOYg
X-Google-Smtp-Source: APXvYqxPMJTQExDIJ6mGYq7BqPW+BCXFPzC7CL91W/xtWJLeg3zM4yTmX/0LG3+2Z1+LuamHbToCbQ==
X-Received: by 2002:a05:620a:138d:: with SMTP id k13mr24751838qki.239.1579135248985;
        Wed, 15 Jan 2020 16:40:48 -0800 (PST)
Received: from ?IPv6:2601:282:800:7a:70bc:64e8:aa8d:5a7c? ([2601:282:800:7a:70bc:64e8:aa8d:5a7c])
        by smtp.googlemail.com with ESMTPSA id n55sm3529218qta.91.2020.01.15.16.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 16:40:48 -0800 (PST)
Subject: Re: XDP invalid memory access
To:     Vincent Li <mchun.li@gmail.com>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?= =?UTF-8?Q?sen?= 
        <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <87ftggtl7t.fsf@toke.dk>
 <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <99fe90fe-cbb4-1ff1-156b-bd8053293aca@gmail.com>
Date:   Wed, 15 Jan 2020 17:40:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAK86TEcyRqVrB-OOiCxtM6WLMp-Sr_+eO9G70+T=OMpF2KBrgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 1/15/20 3:31 PM, Vincent Li wrote:
> On Wed, Jan 15, 2020 at 2:21 PM Toke Høiland-Jørgensen <toke@redhat.com> wrote:
> 
>> You have to check that you're not reading out of bounds before
>> dereferencing the bytes in the TCP header...
>>
> 
> I have below before the optlen
> 
>    47 /* sanity check needed by the eBPF verifier */
> 
>     48 if ((void *)(tcphdr + 1) > data_end)
> 
>     49 return 0;
> 
> this is not enough, how do I check the out of bounds properly?
> 

options are optional and after 'struct tcphdr' you need to do something
like:

   if ((void *)(tcphdr + 1) + tcphdr->doff > data_end)
       return XDP_....
