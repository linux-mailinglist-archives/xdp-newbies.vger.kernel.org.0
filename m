Return-Path: <xdp-newbies+bounces-170-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36753A11F2F
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 11:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E893160ACE
	for <lists+xdp-newbies@lfdr.de>; Wed, 15 Jan 2025 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CE323F29D;
	Wed, 15 Jan 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCm3GTDP"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D252361C9;
	Wed, 15 Jan 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936622; cv=none; b=d1b5Oni+p937fJXuVcEKUxP5rsFDBrkA+l+lr1Um6qZVxplPXjWEPcPokMGM4a+Gpff8HmD89zsDsMNRfzpCL+UJYtv/x1lEne5P5TYhGNUu21AR3Lr4M8e+1Elyo2tjgxBN0DLD52v/45hKmRnTTAiejt+aPoDf8gSn8+jblLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936622; c=relaxed/simple;
	bh=ExcmRWQOBhtL7v61Lp5pLboXAkLM1EV+vtCHIDGJNPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bvyve83kXUvsspvSRbVCtOWPCRmDlf6Ec/wCB/+fWGkru9PjUVtTagzwW8jjLn2WhAmnJMvvAaa3+BvbjgDtm5GIWo6YidJ8zrRK6LzoTZYKcvh75e0x5O5j2YxVieh4J+I5efYWJI1kOXpx3Ven+tLgTH2gjmVXrQQQHnteBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCm3GTDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93A0C4CEDF;
	Wed, 15 Jan 2025 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736936622;
	bh=ExcmRWQOBhtL7v61Lp5pLboXAkLM1EV+vtCHIDGJNPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aCm3GTDPAnC5ZMu75sf1DhmV6alNXdQ7BTrEQpn5OvQxeMsRWkwHMlOv+ToTnksVx
	 WhGa3pUd6lx1s6cdAzvAOWMg3jEdZPfNwNBziKVIfRXqP7ttY7uppMW1er2IQR15R6
	 Te6Ndr0Eb3SmyT4G1goGO7RZFek/E5dfd+UiNJN5d5LwR9mvOSZ5qBUh56KyHHVwoK
	 DnKz9ZfDav0UGDXzarZAdVqtHi3z97KdkAIs7OSwdOYQF1H+mSQZPI//s92XjBTgvK
	 c42/rWyHhSNHUiY2nOzhF32na20KG1ErrfJmt+a+IkqBo/sURQAcNC23R1JF4lMOfV
	 2O1ekPTjCaUsw==
Message-ID: <74582905-b884-41f3-8c46-761631c06c22@kernel.org>
Date: Wed, 15 Jan 2025 11:23:37 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xdp-hints] Re: XDP Redirect and TX Metadata
To: Florian Kauer <florian.kauer@linutronix.de>,
 Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 xdp-hints@xdp-project.net, xdp-newbies@vger.kernel.org
Cc: Stanislav Fomichev <sdf@fomichev.me>, Arthur Fabre
 <afabre@cloudflare.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Netdev <netdev@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
References: <c8072891-6d5c-42c3-8b13-e8ca9ab6c43c@linutronix.de>
 <87v86tg5qp.fsf@toke.dk> <b3112980-1e58-4615-9a1e-9d8a01d364cc@linutronix.de>
 <a8f8d8af-0573-49dc-9ddb-1eadb8c31b7b@hetzner-cloud.de>
 <3c4192e4-0305-40f3-93ce-e2250d658c93@linutronix.de>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <3c4192e4-0305-40f3-93ce-e2250d658c93@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/01/2025 19.07, Florian Kauer wrote:
> Hi Marcus,
> 
> On 1/14/25 17:47, Marcus Wichelmann wrote:
>> Am 12.02.24 um 15:35 schrieb Florian Kauer:
>>> On 12.02.24 14:41, Toke Høiland-Jørgensen wrote:
>>>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>>>
>>>>> 2. For the RX side, the metadata is documented as "XDP RX Metadata"
>>>>> (https://docs.kernel.org/networking/xdp-rx-metadata.html), while for
>>>>> TX it is "AF_XDP TX Metadata"
>>>>> (https://www.kernel.org/doc/html/next/networking/xsk-tx-metadata.html).
>>>>> That seems to imply that TX metadata only works for AF_XDP, but not
>>>>> for direct redirection. Is there a reason for that?
>>>>
>>>> Well, IIRC, AF_XDP was the most pressing use case, and no one has gotten
>>>> around to extending this to the regular XDP forwarding path yet.
>>>
>>> Ok, that is fine. I had the fear that there is some fundamental problem
>>> that prevents to implement this.
>>
>> Hi,
>> are there any updates on this? I'm currently looking into this as well.
> 
> I am still interested, but have no implementation planned short- or mid-term.
> So, looking forward to your implementation :-)
> 
> Greetings,
> Florian
> 
>>
>> I'd like to have a way to enable the TX checksum offload when redirecting from
>> one device to another.
>> Stanislav Fomichev already implemented [1] the TX offload support for the AF_XDP
>> use case (thanks for that), but for now, this cannot be used for "regular"
>> redirects.
>>
>> I'm currently in a position where I can invest some work into this, but figured
>> it would make sense to ask you first:
>>
>> Do you already have concrete plans or ideas in mind, how the API to trigger the
>> TX offloads should look like?
>> I have seen the talk [2] from Jesper about this, but I'm not sure if the
>> proposals in there are still up to date.

My talk is outdated. My co-workers Arthur and Jakub did a
presentation[3] at LPC2024.  Alexei liked the Compressed Key-Value store
idea from that presentation[3].   So, we are currently working on a
Compressed Key-Value store that Arthur named "traits".  We are almost
done benchmarking this, see traits0N_* documents in [4].

[3] https://lpc.events/event/18/contributions/1935/
[4] https://github.com/xdp-project/xdp-project/blob/main/areas/hints/

Our implementation is primarily focused on the RX side, and transferring 
  RX hardware metadata to CPUMAP+veth when doing XDP_REDIRECT.

You ask is about TX side, right?

>> I think it could be possible to introduce a program flag, just like
>> `BPF_F_XDP_HAS_FRAGS`, and if this flag is set, interpret a part of the
>> metadata area as a `struct xsk_tx_metadata`. Then, the code to apply the
>> offloads from that struct when xmit-ing the frame could be reused, as it
>> is already implemented in `mlx5e_xmit_xdp_frame` for example.
>> But the "xsk" in the struct name may be a bit confusing. :/
>>
>> Do you think this could work or could you guide me into a direction that may
>> have a chance to be upstreamable? Also, is there any recent work on this that
>> I should know off?
>>
>> Thanks!
>>
>> Marcus Wichelmann
>> Hetzner Cloud GmbH
>>
>> [1] https://lore.kernel.org/bpf/20231127190319.1190813-3-sdf@google.com/
>> [2] https://lpc.events/event/16/contributions/1362/attachments/1056/2017/xdp-hints-lpc2022.pdf
>>
> 

