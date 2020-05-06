Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC9F1C6CEC
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 May 2020 11:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgEFJ26 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 6 May 2020 05:28:58 -0400
Received: from www62.your-server.de ([213.133.104.62]:48428 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgEFJ26 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Wed, 6 May 2020 05:28:58 -0400
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1jWGML-0002Ra-51; Wed, 06 May 2020 11:28:57 +0200
Received: from [178.195.186.98] (helo=pc-9.home)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1jWGMK-000CbR-RS; Wed, 06 May 2020 11:28:56 +0200
Subject: Re: Fighting BPF verifier to reach end-of-packet with XDP
To:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     BPF-dev-list <bpf@vger.kernel.org>,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        Matteo Croce <mcroce@redhat.com>,
        Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <20200501174132.4388983e@carbon> <20200506110825.2079224f@carbon>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <9d7f422d-8d52-df5d-c1a5-8fd871aa6499@iogearbox.net>
Date:   Wed, 6 May 2020 11:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200506110825.2079224f@carbon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.2/25803/Tue May  5 14:19:25 2020)
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 5/6/20 11:08 AM, Jesper Dangaard Brouer wrote:
> On Fri, 1 May 2020 17:41:32 +0200
> Jesper Dangaard Brouer <brouer@redhat.com> wrote:
> 
>> Hi Daniel,
>>
>> One use-case for tail grow patchset, is to add a kernel timestamp at
>> XDP time in the extended tailroom of packet and return XDP_PASS to let
>> packet travel were it needs to go, and then via tcpdump we can extract
>> this timestamp. (E.g. this could improve on Ilias TSN measurements[2]).
>>
>> I have implemented it here[3]. It works, but it is really a hassle to
>> convince the BPF verifier, that my program was safe.  I use the
>> IP-headers total length to find the end-of-packet.
> 
> I moved the code example here experiment01-tailgrow[4]:
>   [4] https://github.com/xdp-project/xdp-tutorial/blob/master/experiment01-tailgrow/xdp_prog_kern.c
> 
> People can follow the changes via PR# [123].
>   [123] https://github.com/xdp-project/xdp-tutorial/pull/123
> 
>> Is there an easier BPF way to move a data pointer to data_end?
> 
> I've also added some "fail" examples[5]:
>   [5] https://github.com/xdp-project/xdp-tutorial/tree/master/experiment01-tailgrow
> 
> That I will appreciate someone to review my explaining comments, on why
> verifier chooses to fail these programs... as they might be wrong.
>   
>> Any suggestion on how I could extend the kernel (or verifier) to
>> provide easier access to the tailroom I grow?
> 
> Is it possible to use the cls_bpf older style load_byte() helpers?

In cls_bpf we use the tailroom grow for slow-path icmp [0], which may be the
primary use-case from my PoV for the tailroom grow. We haven't had a case where
we need it for crafting custom DNS replies though (it looks like you have one in
XDP (?), so may be good to add a sample code w/ your XDP series on this).

The issue from your fail1 example should very likely be that the offset in your
case is unbounded so verifier cannot do anything with this information. You would
need to make the offset bounded, add it to data and then open the range in the
data/data_end test with the constant you're accessing later, see my comment. I
haven't run your example, but that is what I'd probably try first.

Thanks,
Daniel

   [0] https://github.com/cilium/cilium/blob/master/bpf/lib/icmp6.h#L209
