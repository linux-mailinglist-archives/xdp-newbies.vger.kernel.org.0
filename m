Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A2A43CB79
	for <lists+xdp-newbies@lfdr.de>; Wed, 27 Oct 2021 16:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242334AbhJ0OFo (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 27 Oct 2021 10:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242366AbhJ0OFn (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 27 Oct 2021 10:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635343397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e2sLMfbmgVuqYIvg+4KyoEbVHfeaMqJw1Y6u1A4yAyg=;
        b=I4sJQYVs6YZTU/Txx+VpsbXjhZR6P0WUyEsESOVq3h7KTKz7PIQt6cZ2SYhqZaeABf9zvg
        cofijEa6rEUgOYCbHhKL5kY+dCq3uVFbMJXGOJ6r2f2knpjs0f5dpH49VAwCjMDiHeddMr
        a3Jm1kn1bE+RncF2ZEQF8OgRAsjOONY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-jmzRXff-Mwq-OSxc18P6Mw-1; Wed, 27 Oct 2021 10:03:16 -0400
X-MC-Unique: jmzRXff-Mwq-OSxc18P6Mw-1
Received: by mail-ed1-f69.google.com with SMTP id h16-20020a05640250d000b003dd8167857aso2460117edb.0
        for <xdp-newbies@vger.kernel.org>; Wed, 27 Oct 2021 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=e2sLMfbmgVuqYIvg+4KyoEbVHfeaMqJw1Y6u1A4yAyg=;
        b=MJ6WTqkuuZcfnUtorq/S0nioB3dpKI9ucJ/dwggdk0mQI9RjA1hm8SZCaQuQDk5AMR
         jN/rka+8xjhpyhXyavOoOmlaJLJkhdox9/kHxvpOIYqg/mrXSbqHaMsrom5YfhZjCRoH
         E7zzFVBBNIcbkQlfUQ/+QZCbJV1xLPKUXKfr5Y+YhNzYGTSYaupR70hkGmDnIae6jzaN
         rT4tTUt6Ofu4M5ao1dl7I6yBWc0P7wndopJTu6c4btyQJYCm5euwqE7UH4KBgmyGu5v8
         e9o25XQr1WYGemAvqP5tZOhHSslVcQDUkilzut0gj0/kGuMnuYHLgKXaOWxCcaxMsVfN
         OqgQ==
X-Gm-Message-State: AOAM531yiRqPBMyWY9XUKJiNLZ1WW8J/4hRDdRy/GeiMswGQuzLJj06o
        9ZSxTsVyOCPu3k0DwKES49MoD+kZ2nnVL3q4FLxx2LtXu2aTDIq9msbcxLp6mGkDLG9JX4MRJJ9
        px/w4a5Bj3r2M0b9PvYavQQ0=
X-Received: by 2002:a05:6402:34d2:: with SMTP id w18mr45072873edc.172.1635343394579;
        Wed, 27 Oct 2021 07:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzYtwPKUVu86WWI5XWAHFFuXqs5CBTeRW1vuOTxyxb8giBFDmu5mG8vCqxglCAMT2+B6wB5w==
X-Received: by 2002:a05:6402:34d2:: with SMTP id w18mr45072852edc.172.1635343394379;
        Wed, 27 Oct 2021 07:03:14 -0700 (PDT)
Received: from [192.168.42.238] (3-14-107-185.static.kviknet.dk. [185.107.14.3])
        by smtp.gmail.com with ESMTPSA id n10sm10840530ejk.86.2021.10.27.07.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 07:03:13 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <ee690d7f-322f-ab51-2c13-06919c10d3ad@redhat.com>
Date:   Wed, 27 Oct 2021 16:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org,
        "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
        Freysteinn Alfredsson <Freysteinn.Alfredsson@kau.se>
Subject: Re: AF_XDP socket TX path interact with TC?
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Jun Hu <hujun.work@gmail.com>, Konrad Zemek <konrad@zemek.io>
References: <CAEM4-kAvwt3y9i=bEzPahMhj8Lfvg8oYBsQF_5LcGBmH0CvEpw@mail.gmail.com>
 <875ytlcrdi.fsf@toke.dk>
 <CAEM4-kBWUK=BatL+CguHyey9S8Fb4dSD0-CvbvVT+JtaAn_sng@mail.gmail.com>
 <oM1Y-n6UaYUi_6m-lAXmxeqxarfyIBRoZcEpq5WObujvHCCFRZZNwjrBIn0ycTo5oevKJvw6JtlR2UeE2qqzwtKV_QNrpxHBfFgJ_EQLdfQ=@zemek.io>
 <CAEM4-kBho+aUNNSAoGWWF-Ou=2QC+7b6OD6m+JixOHCcye9RFw@mail.gmail.com>
 <87pmrqaeep.fsf@toke.dk>
In-Reply-To: <87pmrqaeep.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 27/10/2021 13.35, Toke Høiland-Jørgensen wrote:
> Jun Hu <hujun.work@gmail.com> writes:
> 
>> On Tue, Oct 26, 2021 at 4:08 AM Konrad Zemek <konrad@zemek.io> 
>> wrote:
>>> 
>>> On Monday, October 25th, 2021 at 8:26 PM, Jun Hu 
>>> <hujun.work@gmail.com> wrote:
>>> 
>>>> On Mon, Oct 25, 2021 at 3:48 AM Toke Høiland-Jørgensen 
>>>> toke@redhat.com wrote:
>>>> 
>>>>> Jun Hu hujun.work@gmail.com writes:
>>>>> 
>>>>>> Hi,
>>>>>> 
>>>>>> I want to put a timestamp in the egress packets, and I
>>>>>> want to use
>>>>>> 
>>>>>> AF_XDP socket for both sending and receiving packets;
>>>>>> since a XDP
>>>>>> 
>>>>>> kernel program only work in ingress direction, I wonder if 
>>>>>> I could use
>>>>>> 
>>>>>> a tc kernel program to change a packet sent out via an 
>>>>>> AF_XDP socket?
>>>>>> 
>>>>>> I searched around, but couldn't find any direct answer...
>>>>> 
>>>>> Nope, AF_XDP bypasses the stack completely, so TC won't see 
>>>>> the packet
>>>>> 
>>>>> on egress...
>>>>> 
>>>>> -Toke
>>>> 
>>>> Ok, thanks for the clarification, I guess I have to wait for 
>>>> the XDP
>>>> 
>>>> egress support ...
>>> 
>>> You can also directly modify the packet that you send out
>>> through an AF_XDP socket, before putting it on the outgoing
>>> queue. Is there anything specific that you would want to do in
>>> an egress-attached BPF program that you would not be able to do
>>> in the userspace program that manages your AF_XDP socket?
>>> 
>>> Konrad
>> 
>> Yes, that's what I am doing right now, however ideally I want to 
>> add a timestamp to the packet as close as it egress the NIC; since 
>> AF_XDP doesn't have access to hardware timestamp, that's why I was 
>> searching for an alternative solution.
> 
> Cc. Jesper, as I believe timestamps is one of his initial use cases 
> for xdp-hints (hardware metadata).

Correct, Toke.  I have a use-case/customer that want timestamps working
with AF_XDP.
And yes the plan is to leverage XDP-hints (via XDP metadata area) to
expose/export these different packet timestamps.

I have two use-case for timestamps:
  (1) RX-timestamping.
  (2) TX-launch-time.

This week, I have promised to implement a software version of (1)
RX-timestamping, where XDP will add ktime into the metadata area and
AF_XDP userspace program will consume this.  It is rather trivial to do,
but I want extend it and use it to build a flexible BTF-info variant
on-top (which doesn't requires any kernel changes).
The goal is to get the hardware RX-timestamp, via changing the NIC
driver to populate the XDP-hints in metadata areas (from
HW-RX-descriptor).  Again using BTF to describe XDP-hints contents, then
AF_XDP userspace prog can hopefully use the same code to find and
extract members related to the HW
RX-timestamp.

For (2) TX-launch-time, as you mention XDP is missing an egress hook or
queueing layer.  Thus, there are some kernel work a-head.  Toke and a 
PhD stud is looking into this area.
As discussed/described before on xdp-hints mailing list[1] (cc'ed), in
this step it is the AF_XDP program that updates the XDP-hints area
before sending it, and the (non-existing XDP egress) driver hook moves 
requested LaunchTime into the HW-TX-descriptor.


  [1] 
https://lists.xdp-project.net/postorius/lists/xdp-hints.xdp-project.net/

What is your use-case for adding a TX-timestamp to the packet?

--Jesper

