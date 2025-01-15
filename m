Return-Path: <xdp-newbies+bounces-171-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F85A11F96
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 11:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C313A5FA0
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA72244FAA;
	Wed, 15 Jan 2025 10:31:06 +0000 (UTC)
X-Original-To: xdp-newbies@vger.kernel.org
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB59244F9F;
	Wed, 15 Jan 2025 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.215.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937065; cv=none; b=NZbbOTq7XvSEC3yTAmLGNY/FKAEL7Tz6y29BMQu5/LRtfkK7oQ6h5QpH8Vi193sgs3zM/Q8/qfRf4fv9B1NtexZDtkabB0xiu4wOGqedWTgC/kvgaMlcDYQ4c/yz+Ed01ilmQRTdYrOuBXxhGl5b3T/aFXrspuyGI7/JmJLgTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937065; c=relaxed/simple;
	bh=8E5hlv0cWEIsrgiwDNJa4SSd5FTf4z8C2/u1E8DvAew=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=Ua0+pGeI7cYXZ4kgEQokDqYiM9vD0t4InlVuHm+r9IZpdzSmILvFghDB0z1U5YTuczVi0c1OLrTIBSKC8fcNNENZPXeHYDjHxzO8e26+Azd7pmqwcLrr4UjdnUyoVloGEM22Qppkd/zfTyd4rjOUpmQZ1WYn5KMATMXSH9vsuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de; spf=pass smtp.mailfrom=hetzner-cloud.de; arc=none smtp.client-ip=85.10.215.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hetzner-cloud.de
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by dediextern.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1tY0fr-000Ksr-5V; Wed, 15 Jan 2025 11:30:59 +0100
Received: from [2a0d:3344:1523:1f10:f118:b2d4:edbb:54af]
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <marcus.wichelmann@hetzner-cloud.de>)
	id 1tY0fq-000M8M-2x;
	Wed, 15 Jan 2025 11:30:58 +0100
Message-ID: <8f2e68bb-af19-4a65-8fe1-1a0f70c0caf5@hetzner-cloud.de>
Date: Wed, 15 Jan 2025 11:30:54 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jesper Dangaard Brouer <hawk@kernel.org>,
 Florian Kauer <florian.kauer@linutronix.de>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 xdp-hints@xdp-project.net, xdp-newbies@vger.kernel.org
Cc: Stanislav Fomichev <sdf@fomichev.me>, Arthur Fabre
 <afabre@cloudflare.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Netdev <netdev@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
 <87v86tg5qp.fsf@toke.dk> <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
 <a8f8d8af-0573-49dc-9ddb-1eadb8c31b7b@hetzner-cloud.de>
 <3c4192e4-0305-40f3-93ce-e2250d658c93@linutronix.de>
 <173693662447.106245.11283936919402528400@gauss>
Content-Language: en-US
From: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
Autocrypt: addr=marcus.wichelmann@hetzner-cloud.de; keydata=
 xsFNBGJGrHIBEADXeHfBzzMvCfipCSW1oRhksIillcss321wYAvXrQ03a9VN2XJAzwDB/7Sa
 N2Oqs6JJv4u5uOhaNp1Sx8JlhN6Oippc6MecXuQu5uOmN+DHmSLObKVQNC9I8PqEF2fq87zO
 DCDViJ7VbYod/X9zUHQrGd35SB0PcDkXE5QaPX3dpz77mXFFWs/TvP6IvM6XVKZce3gitJ98
 JO4pQ1gZniqaX4OSmgpHzHmaLCWZ2iU+Kn2M0KD1+/ozr/2bFhRkOwXSMYIdhmOXx96zjqFV
 vIHa1vBguEt/Ax8+Pi7D83gdMCpyRCQ5AsKVyxVjVml0e/FcocrSb9j8hfrMFplv+Y43DIKu
 kPVbE6pjHS+rqHf4vnxKBi8yQrfIpQqhgB/fgomBpIJAflu0Phj1nin/QIqKfQatoz5sRJb0
 khSnRz8bxVM6Dr/T9i+7Y3suQGNXZQlxmRJmw4CYI/4zPVcjWkZyydq+wKqm39SOo4T512Nw
 fuHmT6SV9DBD6WWevt2VYKMYSmAXLMcCp7I2EM7aYBEBvn5WbdqkamgZ36tISHBDhJl/k7pz
 OlXOT+AOh12GCBiuPomnPkyyIGOf6wP/DW+vX6v5416MWiJaUmyH9h8UlhlehkWpEYqw1iCA
 Wn6TcTXSILx+Nh5smWIel6scvxho84qSZplpCSzZGaidHZRytwARAQABzTZNYXJjdXMgV2lj
 aGVsbWFubiA8bWFyY3VzLndpY2hlbG1hbm5AaGV0em5lci1jbG91ZC5kZT7CwZgEEwEIAEIW
 IQQVqNeGYUnoSODnU2dJ0we/n6xHDgUCYkascgIbAwUJEswDAAULCQgHAgMiAgEGFQoJCAsC
 BBYCAwECHgcCF4AACgkQSdMHv5+sRw4BNxAAlfufPZnHm+WKbvxcPVn6CJyexfuE7E2UkJQl
 s/JXI+OGRhyqtguFGbQS6j7I06dJs/whj9fOhOBAHxFfMG2UkraqgAOlRUk/YjA98Wm9FvcQ
 RGZe5DhAekI5Q9I9fBuhxdoAmhhKc/g7E5y/TcS1s2Cs6gnBR5lEKKVcIb0nFzB9bc+oMzfV
 caStg+PejetxR/lMmcuBYi3s51laUQVCXV52bhnv0ROk0fdSwGwmoi2BDXljGBZl5i5n9wuQ
 eHMp9hc5FoDF0PHNgr+1y9RsLRJ7sKGabDY6VRGp0MxQP0EDPNWlM5RwuErJThu+i9kU6D0e
 HAPyJ6i4K7PsjGVE2ZcvOpzEr5e46bhIMKyfWzyMXwRVFuwE7erxvvNrSoM3SzbCUmgwC3P3
 Wy30X7NS5xGOCa36p2AtqcY64ZwwoGKlNZX8wM0khaVjPttsynMlwpLcmOulqABwaUpdluUg
 soqKCqyijBOXCeRSCZ/KAbA1FOvs3NnC9nVqeyCHtkKfuNDzqGY3uiAoD67EM/R9N4QM5w0X
 HpxgyDk7EC1sCqdnd0N07BBQrnGZACOmz8pAQC2D2coje/nlnZm1xVK1tk18n6fkpYfR5Dnj
 QvZYxO8MxP6wXamq2H5TRIzfLN1C2ddRsPv4wr9AqmbC9nIvfIQSvPMBx661kznCacANAP/O
 wU0EYkascgEQAK15Hd7arsIkP7knH885NNcqmeNnhckmu0MoVd11KIO+SSCBXGFfGJ2/a/8M
 y86SM4iL2774YYMWePscqtGNMPqa8Uk0NU76ojMbWG58gow2dLIyajXj20sQYd9RbNDiQqWp
 RNmnp0o8K8lof3XgrqjwlSAJbo6JjgdZkun9ZQBQFDkeJtffIv6LFGap9UV7Y3OhU+4ZTWDM
 XH76ne9u2ipTDu1pm9WeejgJIl6A7Z/7rRVpp6Qlq4Nm39C/ReNvXQIMT2l302wm0xaFQMfK
 jAhXV/2/8VAAgDzlqxuRGdA8eGfWujAq68hWTP4FzRvk97L4cTu5Tq8WIBMpkjznRahyTzk8
 7oev+W5xBhGe03hfvog+pA9rsQIWF5R1meNZgtxR+GBj9bhHV+CUD6Fp+M0ffaevmI5Untyl
 AqXYdwfuOORcD9wHxw+XX7T/Slxq/Z0CKhfYJ4YlHV2UnjIvEI7EhV2fPhE4WZf0uiFOWw8X
 XcvPA8u0P1al3EbgeHMBhWLBjh8+Y3/pm0hSOZksKRdNR6PpCksa52ioD+8Z/giTIDuFDCHo
 p4QMLrv05kA490cNAkwkI/yRjrKL3eGg26FCBh2tQKoUw2H5pJ0TW67/Mn2mXNXjen9hDhAG
 7gU40lS90ehhnpJxZC/73j2HjIxSiUkRpkCVKru2pPXx+zDzABEBAAHCwXwEGAEIACYWIQQV
 qNeGYUnoSODnU2dJ0we/n6xHDgUCYkascgIbDAUJEswDAAAKCRBJ0we/n6xHDsmpD/9/4+pV
 IsnYMClwfnDXNIU+x6VXTT/8HKiRiotIRFDIeI2skfWAaNgGBWU7iK7FkF/58ys8jKM3EykO
 D5lvLbGfI/jrTcJVIm9bXX0F1pTiu3SyzOy7EdJur8Cp6CpCrkD+GwkWppNHP51u7da2zah9
 CQx6E1NDGM0gSLlCJTciDi6doAkJ14aIX58O7dVeMqmabRAv6Ut45eWqOLvgjzBvdn1SArZm
 7AQtxT7KZCz1yYLUgA6TG39bhwkXjtcfT0J4967LuXTgyoKCc969TzmwAT+pX3luMmbXOBl3
 mAkwjD782F9sP8D/9h8tQmTAKzi/ON+DXBHjjqGrb8+rCocx2mdWLenDK9sNNsvyLb9oKJoE
 DdXuCrEQpa3U79RGc7wjXT9h/8VsXmA48LSxhRKn2uOmkf0nCr9W4YmrP+g0RGeCKo3yvFxS
 +2r2hEb/H7ZTP5PWyJM8We/4ttx32S5ues5+qjlqGhWSzmCcPrwKviErSiBCr4PtcioTBZcW
 VUssNEOhjUERfkdnHNeuNBWfiABIb1Yn7QC2BUmwOvN2DsqsChyfyuknCbiyQGjAmj8mvfi/
 18FxnhXRoPx3wr7PqGVWgTJD1pscTrbKnoI1jI1/pBCMun+q9v6E7JCgWY181WjxgKSnen0n
 wySmewx3h/yfMh0aFxHhvLPxrO2IEQ==
Subject: Re: [xdp-hints] Re: XDP Redirect and TX Metadata
In-Reply-To: <173693662447.106245.11283936919402528400@gauss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27518/Tue Jan 14 10:36:30 2025)

Hi!

Am 15.01.25 um 11:23 schrieb Jesper Dangaard Brouer via xdp-hints:
> 
> On 14/01/2025 19.07, Florian Kauer wrote:
>> Hi Marcus,
>>
>> On 1/14/25 17:47, Marcus Wichelmann wrote:
>>> Am 12.02.24 um 15:35 schrieb Florian Kauer:
>>>> On 12.02.24 14:41, Toke Høiland-Jørgensen wrote:
>>>>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>>>>
>>>>>> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
>>>>>> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
>>>>>> TX it is "AF_XDP TX Metadata"
>>>>>> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
>>>>>> That seems to imply that TX metadata only works for AF_XDP, but not
>>>>>> for direct redirection. Is there a reason for that?
>>>>>
>>>>> Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
>>>>> around to extending this to the regular XDP forwarding path yet.
>>>>
>>>> Ok, that is fine. I had the fear that there is some fundamental problem
>>>> that prevents to implement this.
>>>
>>> Hi,
>>> are there any updates on this? I'm currently looking into this as well.
>>
>> I am still interested, but have no implementation planned short- or mid-term.
>> So, looking forward to your implementation 🙂
>>
>> Greetings,
>> Florian
>>
>>>
>>> I'd like to have a way to enable the TX checksum offload when redirecting from
>>> one device to another.
>>> Stanislav Fomichev already implemented [1] the TX offload support for the AF_XDP
>>> use case (thanks for that), but for now, this cannot be used for "regular"
>>> redirects.
>>>
>>> I'm currently in a position where I can invest some work into this, but figured
>>> it would make sense to ask you first:
>>>
>>> Do you already have concrete plans or ideas in mind, how the API to trigger the
>>> TX offloads should look like?
>>> I have seen the talk [2] from Jesper about this, but I'm not sure if the
>>> proposals in there are still up to date.
> 
> My talk is outdated. My co-workers Arthur and Jakub did a
> presentation[3] at LPC2024.  Alexei liked the Compressed Key-Value store
> idea from that presentation[3].   So, we are currently working on a
> Compressed Key-Value store that Arthur named "traits".  We are almost
> done benchmarking this, see traits0N_* documents in [4].
> 
> [3] https://lpc.events/event/18/contributions/1935/
> [4] https://github.com/xdp-project/xdp-project/blob/main/areas/hints/

Ah, thanks, I will look into this. I have seen some patches about the traits but had not realized what this is for. Great!

> Our implementation is primarily focused on the RX side, and transferring  RX hardware metadata to CPUMAP+veth when doing XDP_REDIRECT.
> 
> You ask is about TX side, right?

Yes. Would the traits work for the TX metadata as well?

I should probably wait for it then and implement a temporary solution for our use cases in the meantime.

> 
>>> I think it could be possible to introduce a program flag, just like
>>> `BPF_F_XDP_HAS_FRAGS`, and if this flag is set, interpret a part of the
>>> metadata area as a `struct xsk_tx_metadata`. Then, the code to apply the
>>> offloads from that struct when xmit-ing the frame could be reused, as it
>>> is already implemented in `mlx5e_xmit_xdp_frame` for example.
>>> But the "xsk" in the struct name may be a bit confusing. :/
>>>
>>> Do you think this could work or could you guide me into a direction that may
>>> have a chance to be upstreamable? Also, is there any recent work on this that
>>> I should know off?
>>>
>>> Thanks!
>>>
>>> Marcus Wichelmann
>>> Hetzner Cloud GmbH
>>>
>>> [1] https://lore.kernel.org/bpf/20231127190319.1190813-3-sdf@google.com/
>>> [2] https://lpc.events/event/16/contributions/1362/attachments/1056/2017/xdp-hints-lpc2022.pdf
>>>

Marcus

