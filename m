Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1304D1DEB4F
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 May 2020 17:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbgEVO7v (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 May 2020 10:59:51 -0400
Received: from relay0196.mxlogin.com ([199.181.239.196]:36353 "EHLO
        relay0196.mxlogin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbgEVOuH (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 May 2020 10:50:07 -0400
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by relay0196.mxlogin.com (ZoneMTA) with ESMTPSA id 1723cdcce1700054f2.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 22 May 2020 14:50:03 +0000
X-Zone-Loop: 49fcfef24020d19789711ebe6f286aded0d547c545bd
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id 889EF60028
        for <xdp-newbies@vger.kernel.org>; Fri, 22 May 2020 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dvAaAux3OAaemrol1qmm/+Dz8L7AcQzqNfKOwFt85ys=; b=JPE16S47eNV9GPNU2JFUw07brl
        AjwF5Q1SN0LywpQlrjkxhYpKtTjsJVdh6mjBJpgWnt4D/6bPw7+cBN0HAonhEdYEnlqzd4pCOiBhv
        CjUNskZoYPNEn+6gNFHAbx/9R8RQBbrMpQfp+gSygKD6QRMu3TFb2vWRnqCV7urq6Gn3JxDvC9hjo
        gVRIOKk2ocSEoxG9lhoEo4zOKDVnmanp3CBaXJsQIVUeLhqx5nflA4JW8Hs0+V0uiFDERtUzDDBTr
        AajJbRlUogWVmwG6WiKzjddDpJxGbw9iqS//v5XWV2cc2WoS2Fg3aWlNvQc8EPws9ITEca/4cinLp
        8DDQflJg==;
Subject: Re: XDP Software Issue - Payload Matching
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com>
 <878shyg3e9.fsf@toke.dk> <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com>
 <87ftc5ut0q.fsf@toke.dk> <edbf300d-a687-7652-d702-d58be09fd541@gflclan.com>
 <874ksjuca6.fsf@toke.dk>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <a8acdb19-2d7d-43d6-67a7-3ad926ae27c4@gflclan.com>
Date:   Fri, 22 May 2020 09:49:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <874ksjuca6.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-10.0
X-AuthUser: gamemann@gflclan.com
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hey Toke,

I apologize for the delay on this. I've been working on a couple other 
XDP/BPF projects recently.

Thank you for the information you provided!

Do you know of any open-source projects/examples that uses the method 
you're suggesting to compare packet data without using for/while loops? 
I haven't tried implementing the code yet, but I'm not entirely sure how 
I am going to do so.

I will give it a shot and I'll also take a look at the pull requests 
Jesper made :)

Thank you again!


On 5/13/2020 9:42 AM, Toke Høiland-Jørgensen wrote:
> Christian Deacon <gamemann@gflclan.com> writes:
>
>> Hey Toke,
>>
>> Thank you for your response!
>>
>> Unfortunately, I still haven't been able to get the for loop to work
>> properly. I've also noticed if I use `iph->ihl * 4` when initializing
>> the `byte` pointer, it produces the following error:
>>
>> ```
>> R5 !read_ok
>> processed 732 insns (limit 1000000) max_states_per_insn 4 total_states
>> 16 peak_states 16 mark_read 10
>> ```
>>
>> It seems I need to use a static size such as `sizeof(struct iphdr)`.
>> Though, not all packets would have an IP header length of 20 bytes. I've
>> tried performing checks with the length as well:
>>
>> ```
>> uint8_t len = iph->ihl * 4;
>>
>> if (len < 20)
>> {
>>       return XDP_DROP;
>> }
>> else if (len > 36)
>> {
>>       return XDP_DROP;
>> }
>>
>> // Setting len to 20 or any other value works fine.
>> // len = 20;
>>
>> uint8_t *byte = data + sizeof(struct ethhdr) + len + l4headerLen;
>> ```
>>
>> However, no luck. I'm not sure what I can do to make BPF believe this is
>> safe.
> Hmm, maybe have a look at Jesper's experiments with getting to the end
> of the packet:
>
> https://github.com/xdp-project/xdp-tutorial/pull/123
> https://github.com/xdp-project/xdp-tutorial/pull/124
>
> Not sure if he ended up concluding anything definite about what the best
> technique is :)
>
>> I was also wondering about the following:
>>
>>   > Use a matching algorithm that doesn't require looping through the
>> packet byte-by-byte as you're doing now. For instance, you could have a
>> hash map that uses the payload you're trying to match as the key with an
>> appropriate chunk size.
>>
>> Do you know of any BPF Helper/kernel functions that can hash the
>> payload? I looked at the BPF Helpers function list, but wasn't able to
>> find anything for XDP sadly. I would like to attempt to implement
>> something like this to see if I can avoid for loops since they aren't
>> working well with BPF from what I've seen.
> No, there's no direct hashing helper for XDP. I just meant that you
> could use the (chunk of) the payload directly as a key in a hashmap.
> Something like:
>
> struct hash_key {
>         u8 payload[CHUNK_SIZE];
> }
>
> int xdp_main(ctx) {
>      struct hash_key lookup_key = {};
>      int *verdict;
>
>      [...]
>
>      memcpy(&lookup_key, ctx->data, CHUNK_SIZE);
>      verdict = bpf_map_lookup_elem(&lookup_key, ...);
>
>      if (verdict)
>        do_something_with(*verdict);
>
> }
>
> (You'd still need to convince the verifier that the memcpy from packet
> data is safe, of course).
>
> -Toke
>
