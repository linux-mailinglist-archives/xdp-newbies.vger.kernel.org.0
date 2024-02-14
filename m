Return-Path: <xdp-newbies+bounces-48-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA9854DFD
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 17:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD8DCB278F7
	for <lists+xdp-newbies@lfdr.de>; Wed, 14 Feb 2024 16:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC05760245;
	Wed, 14 Feb 2024 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ILZXxJ9z"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9260240
	for <xdp-newbies@vger.kernel.org>; Wed, 14 Feb 2024 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707927699; cv=none; b=P1M7pQx4G6ehUkZe4zL0a8IPaVnU1xhDweF+oLOs5lZ+xlYO+AqhXbvjK8ezanimZzsqN++YiEVZWSusjNOks24IsX+EEEKDM1Ov5TCFy38jzn1p5StaVPo2AlyGPcvI+zNQYKLwMcd8SpkjIk2D4GT1W3VISUsdaOd0klJwR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707927699; c=relaxed/simple;
	bh=8LgRuWDfMAZAwlfDngx4eWKBCuwALOYEmfYXahQxD8A=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MIjW56UUQtffvBleuZPm4jHCAdLFRQsBZipBQiSRd+LQ556nq982tggG9cwtm1DY4ctNAvyydDL1C/2IM+xJxMdS+wQV41xbdWY2xbQptkrMt3j7ZjWFgABzPD+N2Yn9rZBptZC7IU8dFv2SwOg0Y6mh9Jtukg+8WDo6Yhcj2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ILZXxJ9z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707927696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8LgRuWDfMAZAwlfDngx4eWKBCuwALOYEmfYXahQxD8A=;
	b=ILZXxJ9zTbp5GCtt+J6wJoVY6q/oi0Th3pCJB71TP0xtOBSkc6cbcD8zttioDp19/y+k5i
	bajZctQcHpohYTmSywnVbiWIqZ72IRjChTuVINwW8j7Jvzqonab879jOwOZR9DLjdhejRV
	Uad6jMiQTwcdbxa4pyfZk8bCSiMpu7M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-cbU0_dwyPa-Gg3T526sawg-1; Wed, 14 Feb 2024 11:21:35 -0500
X-MC-Unique: cbU0_dwyPa-Gg3T526sawg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3d4cfc543fso41215566b.2
        for <xdp-newbies@vger.kernel.org>; Wed, 14 Feb 2024 08:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707927693; x=1708532493;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8LgRuWDfMAZAwlfDngx4eWKBCuwALOYEmfYXahQxD8A=;
        b=lMLoH4vw4mI/V4Kjp7xHIYFzdSu4d9UtpXPVoitgDR5v/p9IfDOPYOZkYVsa1+MLko
         LHh8q3aGN2EbVPe582UJfgSPP6yTOvWDQ2RsYEWgSdXGY1Q8ptvjpcANv6X7fFj5S1YL
         HrnhdBu6Np9I7MzzOYkLROjnYtC1IqfrR/KzFbuDQE18A3uQdEcCZqSAbB+Bui+Z+PJ8
         xU93JumFlWRzaVT/vf4D9sMaj66rDhBxHz3YYPK9QfXmx5zfi/fBt5yQq0MlhH/Tb4JL
         gKllVUNiHNO3NZrmCnMwPWCOZH/vX+/rVBIUS0E0zbWkT+I7WYbGxsAzGsaI4NQYMx93
         UVEw==
X-Forwarded-Encrypted: i=1; AJvYcCVSfKB4k3Xu3rvH0GgRZFaEdutWS0AC7u2OFEbnpo7OTIar+ofwOdDUVP7jUtKQ5Z5Ktm5xqc4Q5zpR3NMVNr91cUIa023oBH6Yb0g=
X-Gm-Message-State: AOJu0YwcvePS/vMOAQbqvUu1Zi7HVTex5SozJP0u3isvSHIP2SfGzo07
	j5kjita3WoMCgN0Z37q1f9mDCg7bwvrSth635TNDvq2H9PcJANQx7FSV+yt3cWCIGGZxXngt6Vp
	flL81HZA4Jx2puSEA8ctgreN0/1ub/e4ZUgdj7S+l0OhtJ4buVztoFP6qKr/5
X-Received: by 2002:a17:906:6d54:b0:a3d:70ba:5988 with SMTP id a20-20020a1709066d5400b00a3d70ba5988mr402574ejt.40.1707927693159;
        Wed, 14 Feb 2024 08:21:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeLhJjpM+27nvQUXyGvvsrnGkQ3rEKmywR4zO4s1cr2T7Nf8EHq257U2BHqDVX9hv/jQ+upw==
X-Received: by 2002:a17:906:6d54:b0:a3d:70ba:5988 with SMTP id a20-20020a1709066d5400b00a3d70ba5988mr402567ejt.40.1707927692945;
        Wed, 14 Feb 2024 08:21:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6wV+K8+WGUJOuN+ouh1NibEZ8nxNvrUfPUFnq9BjwJTE5oJLAFvnrtzbLrsTEtdYG8/qEPeU5gCIA0f8aUkJ2UxeRg/Pm/W45eOU=
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id l25-20020a170906415900b00a3d2157e267sm1296818ejk.11.2024.02.14.08.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 08:21:32 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5719110F57F2; Wed, 14 Feb 2024 17:21:32 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>,
 xdp-newbies@vger.kernel.org
Subject: Re: XDP packet queueing and scheduling capabilities
In-Reply-To: <bcb43611-a463-4d1a-a6f6-dac340d571f8@hetzner-cloud.de>
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk>
 <bcb43611-a463-4d1a-a6f6-dac340d571f8@hetzner-cloud.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 14 Feb 2024 17:21:32 +0100
Message-ID: <877cj7dnjn.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de> writes:

> Am 13.02.24 um 14:03 schrieb Toke H=C3=B8iland-J=C3=B8rgensen:
>> What's your interest in this? I.e., what do you want to use them for?
>> Would be useful to know so I can make sure this is covered :)
>
> Hi, just wanting to let you know that we're also still very interested=20
> in this for our cloud-provider use case.
>
> We use XDP to route packets to and from VMs and want to also apply=20
> firewall rules on the way. For this, we need to buffer/delay reordered=20
> IP fragments that arrived before the first fragment until we have seen=20
> the required L4 header.
>
> Having a packet queue for this, like in your patch, that can also be=20
> dequeued again, would definitively be helpful for that.
>
> We'd also like to implement shaping in the future, so this is also very=20
> interesting for us.

Great, thanks for the feedback! Hadn't thought about frag reassembly,
but that should definitely be possible as well; will keep that in mind! :)

-Toke


