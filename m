Return-Path: <xdp-newbies+bounces-45-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D698537FC
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 18:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12D3D1C21E14
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 17:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75885FDDF;
	Tue, 13 Feb 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML3ScIRq"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E885FF04
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707845506; cv=none; b=T+oKa1wopH8THTbM2x8LHh5FoSwDjl2v8XJxnu09dZhoApV1iVcaH7109IwYzocJJ3sS9+YIebvqPAYUudV7vejtemwm4nkfsBZvZ6j0I0tf9Ki6B8McuXxENZqHLsGBiBVD50VpcrFc31Bu9DTc+2hQUGtYDTQMRRxzczYitOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707845506; c=relaxed/simple;
	bh=KdTCEdYP5Q8bxB+l82hXEFBjxp3M4wqyRt01dp7tWsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KJS4H47BpND3LE2KjAEwB41+TLLRIFUsdFbSZ7PCnn5iJ3KzlksS0Z04IVyuea/YurFAHZdUeAZ2QWWl8n5hov88kjXRi3YrljgGAUI2dbuagWUnu/LL3JEmARrz9/qZeR4bNYvxx3psDWkKeId9U377L2x06DzdatBqIhRxfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ML3ScIRq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5119da22560so811692e87.2
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 09:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707845503; x=1708450303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+3/3KxMmdWH90S+4vOrIUbr9Bwl27gimAzgHHO2+/w=;
        b=ML3ScIRqqN2ZyhfG4gbKW+NklySJXZ5UNgCOP09y1ne3gtdprGr9AKNRG1jRsl8A8Z
         N/ywetE3cqH8Co86i9ovSeu80ajAzyWtGXB3hbhUenEK4VWaAipqvuAUn+IvU/CXRag7
         Eb+sYY8U9/0Tb82Y/pydd71sy6cDW6zaEmJXU+G9hS30K/baBBK+Q7ahBBetSuAyYhf1
         iIckZcUhnAuaLWR1HMNXYgGz1IKX81RyBJS1YL+vUpd7f9JUS7FbfjB8YMDnP76fP3MZ
         59KKP+vbZ/Nyt6GkIkUU7PloulY8X03qX2waRXGTpSQ7jxWXMaE8fUBLqaYmnR6KSJy/
         uHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707845503; x=1708450303;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+3/3KxMmdWH90S+4vOrIUbr9Bwl27gimAzgHHO2+/w=;
        b=rdwP0d79/HV1/a760ux8iwWCbnWB6bJkyT9jaj9JoiVKXSouaHQ89Xu7aizK/H2OOJ
         2DN6/K/MEjwKvJQrWz1STkdwb2OIuAQPOwBlVpr8dMZNFWrwr5+9xKun/7jdO5T+tXAy
         Pqy395ayeNz1SPIpnYGWqgkJOTA9Z77Mk8tTMeztV5X3nin4OBAyhW9comQUPNObbM26
         M8TjPERx9y2+U/DtjWQHanm2Xs91Ua5jKmze25gwLxv/pLFKE6M7aRWDOHnF7GxAgcTu
         HL96r4y3MM7lqy8MmjMYt1K5F8KSu4Ltcal4K95BqS9x9YoYSYYnuF1dhEEJlglg7Dbc
         A+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPM/5Kc43Ul+cOuMuWM62tBHw+n4glus7fFnv0AU0V1a+t1SOpoDSfO7NeQK1hgP/NQqeTMSR0oUtrSVAHL3oxARpxYvI5aiZUN4I=
X-Gm-Message-State: AOJu0YxG43YNrsGwN5UZdIaTdUEI3x+G8Z6cjgDKS434rxskL5+HP9+g
	DSrBB+/lilpMnWuHq7qzUV3CYDCh1EsFA7l0RPlleTNoLfsTIdeL
X-Google-Smtp-Source: AGHT+IGbYvii4IQQdalQ8tgNoy/PjFLzQ5zsXqPDBSFID4Xe2WOYa2QryGb1WeKNqzqOdtD6wQGEeg==
X-Received: by 2002:a19:f811:0:b0:511:83b3:a9a9 with SMTP id a17-20020a19f811000000b0051183b3a9a9mr186901lff.14.1707845502701;
        Tue, 13 Feb 2024 09:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7XzFuMXRPPkAzWV3vCCvF4rNUAzWDtk/ww4SN+VjBq5DN/U/2RTideSDUY0nv640gTOAqb3jW+9e+moHUyzRTS3P44+GDO0K5UKRv+iGs1Z3WL/+x4BnYDtvFRB9/dlk=
Received: from [192.168.1.56] ([82.66.150.212])
        by smtp.gmail.com with ESMTPSA id ti13-20020a170907c20d00b00a3ce3c5b2a4sm1304917ejc.195.2024.02.13.09.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:31:42 -0800 (PST)
Message-ID: <e4086e04-ca73-439c-8a77-529c2f3562af@gmail.com>
Date: Tue, 13 Feb 2024 18:31:41 +0100
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: XDP packet queueing and scheduling capabilities
Content-Language: en-GB
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk> <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
 <87il2sfivb.fsf@toke.dk>
From: Alexandre Cassen <acassen@gmail.com>
In-Reply-To: <87il2sfivb.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/02/2024 17:07, Toke Høiland-Jørgensen wrote:
> Alexandre Cassen <acassen@gmail.com> writes:
> 
>> Hi Toke,
>>
>> here is a target with lot of interest for it : www.gtp-guard.org
> 
> Ah, seems like a cool project; thanks for the pointer!

Well, right now focus is much more on code rather than documentation :D

but doc will happen at one time. In a hurry right now adding support to 
XDP routing data-path that will deal with GTP-U decap on one side and 
PPPoE encap the other side, and reciprocally. This is one use-case to 
make mobile access network converge to existing isp access network 
infrastructure (not L2TP since it just create scalling issues for bunch 
of customers). another one will be SRv6 later on... Anyway, having fun 
hacking around on it :)


>> When dealing with mobile network data-plane, at some point you have
>> ordering issues and shaping needs, so queuing is truly needed.
>> Alternatively ones can implement PIFO or others built on AF_XDP but if
>> dedicated bpf map covers the use-case, would be nice.
> 
> Right, I'm kinda thinking about the map type that is part of the XDP
> queueing series as a general-purpose packet buffer that will enable all
> kinds of features, not just queueing for forwarding. Whether it'll end
> up being the PIFO map type, or a simpler one, I'm less certain about.
> The PIFO abstraction may end up being too special-purpose. Opinions
> welcome!


Read the code last night, that is exactly what is required here, 
bpf_timer trick is fun.

(IP fragmentation in gtp-guard is using bpf_timer for ephemeral id 
tracking handling, this is just here re-ordering pop-up... on 
constructor vendors equipements where normal path is using diffrent 
processing-unit than frag handling this happen !)

Agreed on your point, having a general purpose map type enable 
inheritage option for specific feature instead of multiplying meaningful 
map type for each feature/use-case.


>> Watching at your LPC 2022 presentation, at the end, discussions where
>> made around using existing Qdisc kernel framework and find a way to
>> share the path between XDP and netstack. Is it a target for adding
>> PIFO, or more generally getting queuing support for XDP ?
> 
> I don't personally consider it feasible to have forwarded XDP frames
> share the qdisc path. The presence of an sk_buff is too simply too
> fundamentally baked into the qdisc layer. I'm hoping that the addition
> of an eBPF-based qdisc will instead make it feasible to share queueing
> algorithm code between the two layers (and even build forwarding paths
> that can handle both by having the different BPF implementations
> cooperate). And of course co-existence between XDP and stack forwarding
> is important to avoid starvation, but that is already an issue for XDP
> forwarding today.

Agreed too, eBPF backed Qdisc 'proxy' sounds great idea. latency 
forecast impact ?


- Alexandre

