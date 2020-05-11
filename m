Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505F11CE2FA
	for <lists+xdp-newbies@lfdr.de>; Mon, 11 May 2020 20:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgEKSp6 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 11 May 2020 14:45:58 -0400
Received: from relay0159.mxlogin.com ([199.181.239.159]:38281 "EHLO
        relay0159.mxlogin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgEKSp6 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 11 May 2020 14:45:58 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 May 2020 14:45:57 EDT
Received: from filter003.mxroute.com ([168.235.111.26] 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by relay0159.mxlogin.com (ZoneMTA) with ESMTPSA id 172050a2a43000167e.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 11 May 2020 18:40:51 +0000
X-Zone-Loop: f6b33a31eadc0b282822b41bc1b362c8f7662d541f62
X-Originating-IP: [168.235.111.26]
Received: from ocean.mxroute.com (ocean.mxroute.com [195.201.59.214])
        by filter003.mxroute.com (Postfix) with ESMTPS id BCECF60050
        for <xdp-newbies@vger.kernel.org>; Mon, 11 May 2020 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gflclan.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rOKYslMleLtyOYho7ko+hI303yq8MqEUVu4kkVUsIug=; b=SlSSQnKK1Rw7zTYjrAye1FEopT
        KiFCiMVbMDg9Akttr6V+GXjlQNnAeyta1aY5BqGVrFX/wVyYif7ZUfcxFoyBmXSdwfuP5gzha1Gj1
        n0YbA91Ic+o09WTI5EuBMKN/DD1Siu2Q3AY8QA8TDTkhuPl7h8GMivaMrNJ1l7nEynCf1wqCEgy/A
        MukUayT5Z4ca5XU24y4n94S4w2rPpeGGnEgjqNJOQhGAv6zCKGij17JmpakPF30HqXDFEtL5dgQu6
        WP4zu/VsshuMwf/LVwjZDXorXULzvVzfry8G8wIhxKs8F7fUF2AiZkkovfWF+W3sBKFRjTcs0tV7d
        yIQXrDrQ==;
Subject: Re: XDP Software Issue - Payload Matching
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <9f91026d-e3da-ff7c-b2dd-a4a795e6975b@gflclan.com>
 <878shyg3e9.fsf@toke.dk>
From:   Christian Deacon <gamemann@gflclan.com>
Message-ID: <bbf21c58-09b3-b80f-11ab-548b229b9bdb@gflclan.com>
Date:   Mon, 11 May 2020 13:40:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <878shyg3e9.fsf@toke.dk>
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

Thank you for your response and the information!

I actually found out last night about this as well, but when setting the 
max payload match length to 1500 bytes (instead of 65535), I receive a 
new error:

```
invalid read from stack off -488+0 size 8
processed 46277 insns (limit 1000000) max_states_per_insn 4 total_states 
617 peak_states 617 mark_read 599
```

Here's the new code:

```
if (filter[i]->payloadLen > 0)
{
     uint8_t found = 1;

     // MAX_PAYLOAD_LENGTH = 1500
     for (uint16_t j = 0; j < MAX_PAYLOAD_LENGTH; j++)
     {
         if ((j + 1) > filter[i]->payloadLen)
         {
             break;
         }

         uint8_t *byte = data + sizeof(struct ethhdr) + (iph->ihl * 4) + 
l4headerLen + j;

         if (byte + 1 > (uint8_t *)data_end)
         {
             break;
         }

         if (*byte == filter[i]->payloadMatch[j])
         {
             continue;
         }

         found = 0;

         break;
     }

     if (!found)
     {
         continue;
     }
}
```

This error occurs when initializing the `byte` pointer (if I comment out 
any lines with the `byte` pointer, the XDP program runs without 
crashing). Though, to my understanding, I am doing things correctly here 
along with ensuring the `byte` pointer is within the packet's range.

I am also going to look into implementing your second suggestion! I've 
been trying to think of ways to improve performance with the software 
and initially, I planned to only have filtering rules activated after a 
certain global PPS/BPS threshold is met (specified in the config file). 
However, it sounds like your suggestion would be more efficient.

Thank you for all your help!


On 5/11/2020 5:41 AM, Toke Høiland-Jørgensen wrote:
> Christian Deacon <gamemann@gflclan.com> writes:
>
>> Hey everyone,
>>
>> I apologize if this isn't the correct place to discuss an issue with XDP
>> software I'm attempting to create. I'm not sure where else I can request
>> help on this since it may be related to BPF/XDP itself.
>>
>> I've made an XDP Firewall project on GitHub here:
>>
>> https://github.com/gamemann/XDP-Firewall
>>
>> I am still fairly new to C and XDP. Therefore, I'm sure many
>> improvements could be made to the software. However, everything besides
>> the payload matching is working correctly from what I've tested.
>>
>> Basically, this program transfers filtering rules from a config file in
>> the user space to the XDP program via BPF maps. The XDP program then
>> performs checks against each filter specified. I'm trying to implement
>> payload matching into this project and I got the user-space side working
>> properly. However, when I attempt to check the payload within the XDP
>> program, I keep receiving errors either when compiling (stating the BPF
>> stack has been exhausted) or the following error when attaching the XDP
>> program:
>>
>> ```
>> The sequence of 8193 jumps is too complex.
>> processed 100132 insns (limit 1000000) max_states_per_insn 4
>> total_states 1279 peak_states 1279 mark_read 97
>> ```
>>
>> There is a very long BPF stack trace that I can attach if need to be.
>> The following is the part of code causing this issue (it's not commented
>> out on my development VM):
>>
>> https://github.com/gamemann/XDP-Firewall/blob/master/src/xdpfw_kern.c#L306
>>
>> If I comment out line 332 or set `found` to 1, the XDP program does not
>> crash. I've tried a `goto` approach as well which is available here:
>>
>> https://gist.github.com/gamemann/9f0d42c25151d0f2e1630840d04fd599
>>
>> However, this causes the following error when starting the XDP program:
>>
>> ```
>> invalid read from stack off -488+0 size 8
>> processed 844 insns (limit 1000000) max_states_per_insn 4 total_states
>> 28 peak_states 28 mark_read
>> ```
>>
>> If I comment out line 27 from that Gist (`continue;`), the program runs
>> properly. I've also tried moving the code into its own for loop by
>> making some modifications. However, I get the same results. I'd assume
>> this is some sort of BPF limitation with for loops and jumps. However,
>> I'm sure there's a strong possibility I'm just not doing something right
>> when attempting to match the payload.
> Yeah, you're right, the verifier caps the size of the tree of branches
> it'll explore at 8192 entries (which is why your error triggers at
> 8193). So to get past the verifier you'll simply have to limit the
> complexity of your program.
>
> A few techniques come to mind to achieve this:
>
> - Limit the length of the loop (you have MAX_PCKT_LENGTH at 64k, which
>    is never going to be the case since XDP doesn't support jumboframes).
>
> - Split up your program into smaller components and use tail calls or
>    non-inlined functions to call through to them (though not sure how far
>    per-function verification has come, so the latter may not give you
>    much benefit yet). Splitting up the code also helps with not running
>    the bits that are not needed in a current filter configuration, which
>    is an important way to improve performance of XDP programs. See
>    xdp-filter[0] for an example of how to conditionally load different
>    code subsets as needed.
>
> - Use a matching algorithm that doesn't require looping through the
>    packet byte-by-byte as you're doing now. For instance, you could have
>    a hash map that uses the payload you're trying to match as the key
>    with an appropriate chunk size.
>
> -Toke
>
> [0] https://github.com/xdp-project/xdp-tools/tree/master/xdp-filter
>
