Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2297A283585
	for <lists+xdp-newbies@lfdr.de>; Mon,  5 Oct 2020 14:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgJEMNr (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 5 Oct 2020 08:13:47 -0400
Received: from cornalina.dcc.ufmg.br ([150.164.0.155]:53564 "EHLO
        cornalina.dcc.ufmg.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgJEMNr (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Mon, 5 Oct 2020 08:13:47 -0400
Received: from turquesa.dcc.ufmg.br (turquesa.dcc.ufmg.br [IPv6:2001:12f0:601:a902::150])
        by cornalina.dcc.ufmg.br (Postfix) with ESMTPS id 6AF8A20F02E;
        Mon,  5 Oct 2020 09:13:44 -0300 (-03)
Received: from [IPv6:2804:431:c7f0:f365:e030:f74f:9e1d:133e] (unknown [IPv6:2804:431:c7f0:f365:e030:f74f:9e1d:133e])
        by turquesa.dcc.ufmg.br (Postfix) with ESMTPSA id 6C505C530A;
        Mon,  5 Oct 2020 09:13:43 -0300 (-03)
Subject: Re: Create copy of packate given to BPF
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        xdp-newbies@vger.kernel.org
References: <CAPyJoHk74hN6roX+-66fU1H03ZRsO5qtpGiH9mwiXzdzqqYpQw@mail.gmail.com>
 <87sgatpu1a.fsf@toke.dk>
From:   Matheus Castanho <matheus.castanho@dcc.ufmg.br>
Message-ID: <34ee1d9e-c7be-5ff6-59bf-df0c93d5901e@dcc.ufmg.br>
Date:   Mon, 5 Oct 2020 09:13:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87sgatpu1a.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 10/4/20 6:20 PM, Toke Høiland-Jørgensen wrote:
> Matheus Salgueiro Castanho <matheus.castanho@dcc.ufmg.br> writes:
>
>> Hi,
>>
>> I'd like to create a copy of a packet inside a BPF program, alter some
>> of its headers and redirect it and the original packet to different
>> interfaces, either on XDP or TC layers.
>>
>> By taking a look at the helpers list, I have the impression this is
>> not currently supported, but as things evolve rapidly in the BPF area,
>> I want to make sure I'm not overlooking anything.
>>
>> So, is there a way to do this today?
> You're quite right, there isn't. There's work in progress, though, which
> will eventually allow this (for XDP):
>
> https://lore.kernel.org/bpf/20200907082724.1721685-1-liuhangbin@gmail.com/
>
> -Toke
>
Thanks for the confirmation, Toke. I'll keep an eye on that patch then.

Thanks,
Matheus Castanho

