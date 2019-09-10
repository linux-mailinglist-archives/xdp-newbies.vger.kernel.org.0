Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA8C9AED00
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2019 16:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfIJOcH (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Sep 2019 10:32:07 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:33368 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388473AbfIJOcF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Sep 2019 10:32:05 -0400
Received: from mxback26o.mail.yandex.net (mxback26o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::77])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 8AD5C5061BB2;
        Tue, 10 Sep 2019 17:32:02 +0300 (MSK)
Received: from smtp3o.mail.yandex.net (smtp3o.mail.yandex.net [2a02:6b8:0:1a2d::27])
        by mxback26o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id o4JLpugAzb-W2Uq7qVU;
        Tue, 10 Sep 2019 17:32:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1568125922;
        bh=hSWApemodEh8cAXcLDQYwwMHqDfc7SpbI7bovEBQgFY=;
        h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
        b=PGutOSpPRCudz1llLUuLJfoh3rR6FheBuMVrXRYTPo5SRxh4Ha2Z6kJB7u23jv2+s
         /uhX/pskCzIv2N3j+Et/o/grnbfBvn5PQb7clJq1EWyFqu5gD7+bcbZqS4neL6Ld8i
         qfV+909yE8EjgNL+OZ55cSReqzvShv1uady2ymoA=
Authentication-Results: mxback26o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by smtp3o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id cp4VIGwOAz-W1oKuVI8;
        Tue, 10 Sep 2019 17:32:01 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Subject: Re: bidirectional: => AF_XDP , <= XDP_REDIRECT
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <d52b5b48-06cf-42dc-180d-896601cf3efb@yandex.ru>
 <87imq0ut8l.fsf@toke.dk>
From:   Ilya Goslhtein <ilejn@yandex.ru>
Message-ID: <e83a6f5d-785e-d3c7-6bd8-63d972973427@yandex.ru>
Date:   Tue, 10 Sep 2019 17:32:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87imq0ut8l.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello Toke,

thanks for the response.

I do not think that it is the case.

The interface I am trying to share is outgoing for xdpbridge and 
incoming for xdp_bridge_map.

xdpbridge does not load xdp program for outgoing interface (while loads 
for incoming).

xdp_bridge_map loads dummy XDP program for outgoing redirect, while it 
is Ok if it is already exists.


It seems that if I use different queues for incoming and outgoing 
packets, everything is Ok, while I am not 100% sure yet. Does it look 
realistic?



On 10.09.2019 17:21, Toke Høiland-Jørgensen wrote:
> Ilya Goslhtein <ilejn@yandex.ru> writes:
>
>> Hello,
>>
>> I am trying to use a network interface to
>> (1) send packets via AF_XDP
>> (2) receive packets and redirect to another interface via xdp_redirect_map
>>
>> Basically, I am making xdpbridge https://github.com/ilejn/xdpbridge.
>>    bidirectional. My goal is to process packets in one direction in
>> kernelspace (xdp_redirect_map) and to pass packets in opposite direction
>> via userspace (recieve via AF_XDP then send via AF_XDP, rings are not
>> shared, so I perform memcpy).
>>
>> For test purposes I ran two applications: my xdpbridge and
>> xdp_redirect_map bpf sample.
>>
>> It does not work. Only few packets are received, then the thing stops.
>> Redirecting works until xdpbridge does 'bind' against the interface.
> This is because the AF_XDP application loads another XDP program on the
> interface that redirects the traffic into the socket. It is possible to
> write an XDP program that can do both (i.e., for each packet, decide
> whether to redirect it into the AF_XDP socket, or to another interface),
> but obviously none of the example programs know how to do this, so they
> end up stepping on each other's toes...
>
> -Toke

-- 
Best regards,
Ilya Golshtein

