Return-Path: <xdp-newbies+bounces-42-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A268785333A
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 15:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405501F212A6
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 14:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268CD26AD4;
	Tue, 13 Feb 2024 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF6zq0U2"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE11DFE3
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834796; cv=none; b=q/z13xtG7qI5mQ9VVEIsHEYcmUjSJNYffxIIOQqw5CaiFLUeeijk/jd0lTn8u0RTcs05nH1maISr4fP2Au/mL8WYatdLX/VTvpQnk7lSvYsdVY1qzpb1bcnxTvvc0Bfwz9IGjETmSRwOFLZOL8rsyh4dQjvjtFCiDjDjOqAvDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834796; c=relaxed/simple;
	bh=1f0cxsv04ej71EFOMQE70FMrxzeQXpKR8DV0kZCoGck=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iGGHL0jnCuYsCeci5qzeziv3dRZSXWgOq+fqcvx/mTnNFtWHuWAodQhlzxZ2f4KXDRctBE5bLIQM2dQ2UHnzwnFOBtNomeQ9KhwTT4MTf31UX+rIXgRpV4sGUwho7b20W0LmOmGZmBPIpdscamPTiK1227aApLisl93j5Ar0PEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF6zq0U2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-411d5dd7924so565085e9.2
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707834793; x=1708439593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQkLWWj/oCWP2O0Uk8x3BIAzkUpa8C2R67q/NaTn0dg=;
        b=lF6zq0U25IkBpvVu1vqXvTnmxC6/zL9SwGYvjKcsk+PKgfYNWZMVaip5WkZGWQUtIV
         6TQvlnrDFsNEL4xCn07gBbxSXPYEeQB0vPHtrMniMF38Mg5OH4cGUOSvM5NrAFXYGbN9
         22O9co5bC3lrDRpKUfvUP9pvoxjz6TeB3JJ15i+Hew34kWTuyuc6A1cT69hUr0dAac/r
         MCpGUxIxDCcGv7vxMMu397AO0frmjNGovYSCTaEr7OCHJrwQeZED7Cx7MVnk6TNJngGO
         bo2xd5+rm1ZnysY3a4hVwtqMKIWCFBFEX1gyxL8HhAsTuFfOdCMA7eJI1Nm7Awp+poF2
         WMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834793; x=1708439593;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQkLWWj/oCWP2O0Uk8x3BIAzkUpa8C2R67q/NaTn0dg=;
        b=iEkL4E60kZR4IubmiOOATc0qWB9MFTP2NvehbjUt8N8m6YsysH4zK7n7eSf0zWNWMD
         lWWiIgUVxG12p9pI5VJOdorkT+F6o1MjbRqb7BYWpDrLGhlWkIt0BdUqCRDU2ssI21X3
         ArnaAqHcJ3cic4glE6k+vnTg1FyKpi8CRMI/owccoACzf1pk+9KkU6fa2ojNzsHKGVPZ
         MLHY9mAl4rpqcZgSfPH4gGib/e68EOepXZf1A+l0o5eFKIUQe+1Y7ioOGm2/h/gfNac+
         lmEMQ082Vg191Vv16/0yaKYihzpC9xlbHv0pN4lAXxjzruVX3LBNPJ6uEJ+SGAVxizik
         6Sqw==
X-Forwarded-Encrypted: i=1; AJvYcCXob4kSsMXDAfvY1e0rr3FeQcVC9MOpmAeJimh3Pt61sO9jSPzka+E/Ea4/Y4yU2cBPVAQHJDUDh2Q1JrNa6F5yIt0IIl8NB1SaLgM=
X-Gm-Message-State: AOJu0Yyfd4j4zmz82xOI3R3/MRL4eqHPyalfroWKjtfARJe9mhVAlaox
	2bMx1xLtSMyES3yU8JHgUyEJyhJvrU2eYPgYUDszWp1oBAMs9vVT
X-Google-Smtp-Source: AGHT+IETf8uis4tgkF9axU7T3nKbjvANYohijn/TX4uB1WsMXx0WpSE8Y5tbxlowDyUhiN+kIJAn1w==
X-Received: by 2002:a05:600c:350a:b0:410:8092:99f7 with SMTP id h10-20020a05600c350a00b00410809299f7mr8836063wmq.31.1707834793085;
        Tue, 13 Feb 2024 06:33:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpGWq4Onsj2vYP7bRFeNfGoaKm+yUW0eL369qkImrn+48lBw0+mYkrf2RFWHCe5WaWoMKyKLCeD+RAdfB68nnj6pqYN5CY/fQheHVWFqCsT/0+kF0Hu1T8o/5nib9xnSc=
Received: from [192.168.1.56] ([82.66.150.212])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05600c1e1400b00411a6ce0f99sm3593889wmb.24.2024.02.13.06.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:33:12 -0800 (PST)
Message-ID: <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
Date: Tue, 13 Feb 2024 15:33:11 +0100
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
 <87le7ofre3.fsf@toke.dk>
From: Alexandre Cassen <acassen@gmail.com>
In-Reply-To: <87le7ofre3.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Toke,

here is a target with lot of interest for it : www.gtp-guard.org

When dealing with mobile network data-plane, at some point you have 
ordering issues and shaping needs, so queuing is truly needed.
Alternatively ones can  implement PIFO or others built on AF_XDP but if 
dedicated bpf map covers the use-case, would be nice.

Watching at your LPC 2022 presentation, at the end, discussions where 
made around using existing Qdisc kernel framework and find
a way to share the path between XDP and netstack. Is it a target for 
adding PIFO, or more generally getting queuing support for XDP ?

regs,
Alexandre


On 13/02/2024 14:03, Toke Høiland-Jørgensen wrote:
> team lnx <teamlnxi8@gmail.com> writes:
> 
>> Hello everyone,
>>
>> https://lwn.net/Articles/901046/
>> would this be resumed any time soon this year ?
> 
> The latest version of those patches are here:
> https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/log/?h=xdp-queueing-08
> 
> They are a bit rough around the edges, and there are some missing pieces
> still; I'm working on getting a userspace/BPF implementation to the
> point where those can be filled in. After that, and some thorough
> testing, it should be possible to post another revision.
> 
> What's your interest in this? I.e., what do you want to use them for?
> Would be useful to know so I can make sure this is covered :)
> 
> -Toke
> 
> 

