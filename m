Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF79DBD94F
	for <lists+xdp-newbies@lfdr.de>; Wed, 25 Sep 2019 09:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442574AbfIYHsJ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 25 Sep 2019 03:48:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442570AbfIYHsI (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 25 Sep 2019 03:48:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 44B1E18C8909;
        Wed, 25 Sep 2019 07:48:08 +0000 (UTC)
Received: from [10.36.116.24] (ovpn-116-24.ams2.redhat.com [10.36.116.24])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E0460872;
        Wed, 25 Sep 2019 07:48:02 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "=?utf-8?q?J=C3=BAlius?= Milan" <Julius.Milan@pantheon.tech>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>
Cc:     "Magnus Karlsson" <magnus.karlsson@gmail.com>,
        "William Tu" <u9012063@gmail.com>,
        "=?utf-8?b?QmrDtnJuIFTDtnBlbA==?=" <bjorn.topel@intel.com>,
        "Marek =?utf-8?b?WsOhdm9kc2vDvQ==?=" <marek.zavodsky@pantheon.tech>,
        "Jesper Dangaard Brouer" <brouer@redhat.com>,
        xdp-newbies@vger.kernel.org,
        "Thomas F Herbert" <therbert@redhat.com>,
        "Kevin Laatz" <kevin.laatz@intel.com>
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
Date:   Wed, 25 Sep 2019 09:48:01 +0200
Message-ID: <565AE8A9-8A0D-4582-A3C5-D317F4DA0C9F@redhat.com>
In-Reply-To: <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon>
 <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com>
 <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
 <CALDO+SZsbbHL8ndhQiwb3EAEY22ucTYy5yy0xo_Ng3EzGisj1w@mail.gmail.com>
 <6a4ee5d2cc88403bafc749f7b855b597@pantheon.tech>
 <CAJ8uoz23kBsAsmO4qGpx=0fK8_vqgXv4a-jJfy_qfSSnVsgauQ@mail.gmail.com>
 <966e40dda4654444a420b935ad970d18@pantheon.tech>
 <9B039211-EEAA-4D1E-8DCE-7F210987A609@redhat.com>
 <8edc60b1946c404c81ff43e5d0d4a63c@pantheon.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Wed, 25 Sep 2019 07:48:08 +0000 (UTC)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 25 Sep 2019, at 8:46, Július Milan wrote:

> Hi Eelco
>
>> Currently, OVS uses the mmaped memory directly, however on egress, it 
>> is copying the memory to the egress interface it’s mmaped memory.
> Great, thanks for making this clear to me.
>
>> Currently, OVS uses an AF_XDP memory pool per interface, so a further 
>> optimization could be to use a global memory pool so this extra copy 
>> is not needed.
> Is it even possible to make this further optimization? Since every 
> interface has it's own non-shared umem, so from my point of view, at 
> least one
> copy for case as you described above (when RX interface is different 
> then TX interface) is necessery. Or am I missing something?

Some one @Intel told me it would be possible to have one huge mempool 
that can be shared between interfaces. However I have not 
researched/tried it.
Maybe Magnus can confirm?


> Július
>
> -----Original Message-----
> From: Eelco Chaudron [mailto:echaudro@redhat.com]
> Sent: Monday, September 23, 2019 3:02 PM
> To: Július Milan <Julius.Milan@pantheon.tech>
> Cc: Magnus Karlsson <magnus.karlsson@gmail.com>; William Tu 
> <u9012063@gmail.com>; Björn Töpel <bjorn.topel@intel.com>; Marek 
> Závodský <marek.zavodsky@pantheon.tech>; Jesper Dangaard Brouer 
> <brouer@redhat.com>; xdp-newbies@vger.kernel.org; Karlsson, Magnus 
> <magnus.karlsson@intel.com>; Thomas F Herbert <therbert@redhat.com>; 
> Kevin Laatz <kevin.laatz@intel.com>
> Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about 
> XDP)
>
>
>
> On 23 Sep 2019, at 11:00, Július Milan wrote:
>
>> Many Thanks Magnus
>>
>>>> I have next 2 questions:
>>>>
>>>> 1] When I use xsk_ring_prod__reserve and successive
>>>> xsk_ring_prod__submit. Is it correct to submit also less than I
>>>> reserved?
>>>>     In some cases I can't exactly determine how much to reserve in
>>>> advance, since vpp buffers have different size than xdp frames.
>>>
>>> Let me see so I understand this correctly. Ponder you reserve 10
>>> slots and later submit 4. This means you have reserved 6 more than
>>> you need.
>>> Do you want to "unreserve" these and give them back to the ring? 
>>> This
>>> is not supported by the interface today. Another way of solving this
>>> (if this is your problem and I am understanding it correctly, that
>>> is) is that you in the next iteration only reserve 10 - 6 = 4 slots
>>> because you already have 6 slots available from the last iteration.
>>> You could still submit 10 after this. But adding something like an
>>> unreserve option would be easy as long as we made sure it only
>>> affected local ring state. The global state seen in the shared
>>> variables between user space and kernel would not be touched, as 
>>> this
>>> would affect performance negatively. Please let me know what you
>>> think.
>>>
>> Yes, You understand it correctly, I implemented it the way you
>> suggested, i.e. by marking index and count of reserved slots (not
>> committed yet, but works well), thanks again.
>>
>>>> 2] Can I use hugepage backed memory for umem? If not, is it planned
>>>> for future?
>>>>     Yet it does copy pakets from rx rings to vpp buffers, but
>>>> speculating about straight zerocopy way.
>>>
>>> Yes you can use huge pages today, but the internal AF_XDP code has
>>> not been optimized to use huge pages, so you will not get the full
>>> benefit from them today. Kevin Laatz, added to this mail, is working
>>> on optimizing the AF_XDP code for huge pages. If you want to know
>>> more or have some requirements, do not hesitate to contact him.
>>>
>> Kevin will the API for using hugepages change while optimization
>> process significantly or can I already start to rewrite my vpp driver
>> to use hugepages backed memory?
>> Also please let me know, when you consider AF_XDP code optimized to
>> use huge pages.
>>
>> William, if I may ask next question.
>> Does OVS implementation of af_xdp driver copy paket data from af_xdp
>> mmaped ring buffers into OVS "buffers" (some structure to represent
>> the packet in OVS) or is it zerocopy in this manner, i.e. OVS
>> "buffers" mempool is directly mmaped as ring and so no copy on RX is
>> needed. Since in 2nd case it would be very valuable for me as
>> inspiration.
>
> Currently, OVS uses the mmaped memory directly, however on egress, it 
> is copying the memory to the egress interface it’s mmaped memory.
> Currently, OVS uses an AF_XDP memory pool per interface, so a further 
> optimization could be to use a global memory pool so this extra copy 
> is not needed.
>
>>
>>> /Magnus
>>>
>>
>> Thanks a lot,
>>
>> Július
