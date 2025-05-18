Return-Path: <xdp-newbies+bounces-178-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9FABB0C9
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 18:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B25A18944C6
	for <lists+xdp-newbies@lfdr.de>; Sun, 18 May 2025 16:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0561DE2CE;
	Sun, 18 May 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K4Ijq1I5"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C102CCC0
	for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747585185; cv=none; b=XKvywTS8KziNlVrfozPM3tD+BFlBvVL1fyUWDQA8LUmTKEbPT548GRXn7k68uTGQFRJN+yfc1osmixoPTIcb7aQsHRR4kgRPcdJ/nFvspxin6O6K4mY9GQbR8JfJpFBG7WdCCEs9tbkkHCxSNGk2lQ7Ntfdjbn4lKmO3mY+7K1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747585185; c=relaxed/simple;
	bh=ZBwwIfFVzApqW5A0Az8MO0rIeh5xIs8ajVzeILuEl6I=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RzWb3RXxX1hrCRpcpepT1Xg+eRg+2kCFVv0G/o3lUY2DhXwTTBH5NVP2zSHWWpgqvAlT7CbwLnpMIjX2aXTdyrKCyIIK7OyUP4U9v/Gc3BPpbyLBCB69R6qprX8wqdzi8wUJ3KGUpoY8K2dEjDKSxf6u4k+uT5CfMr0DtiN7xZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K4Ijq1I5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747585182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjnGc43xxjYpzrl81jlQq7QUR1QB8tZxlg9JNVlTa7s=;
	b=K4Ijq1I5Hy0Syj+jhRRaaAMDqebjBaTbWHPVDiIrtNCjPXLgxFcaFaQG8OndJL8uVo2k1U
	bRfJGK+lYGuj+uCuYat1MCcpBJ8PfCu2mRcsCLfMTXasf7UuMOqKkO2lvUo6Z88GKMmeup
	7HU+7FibYOa8aFXak5rHuMG1SBUN15o=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-Ejg3rgAWOzqBuF2LURk6ng-1; Sun, 18 May 2025 12:19:41 -0400
X-MC-Unique: Ejg3rgAWOzqBuF2LURk6ng-1
X-Mimecast-MFC-AGG-ID: Ejg3rgAWOzqBuF2LURk6ng_1747585180
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3290a532443so4715791fa.3
        for <xdp-newbies@vger.kernel.org>; Sun, 18 May 2025 09:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747585179; x=1748189979;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjnGc43xxjYpzrl81jlQq7QUR1QB8tZxlg9JNVlTa7s=;
        b=J/L9GYPEfWUpnxhgXG07DclFH1ugrk1b7dbUU3u1LqeEvvSF2eEPmoJmf3IFvCJSmG
         9tYlR/o8hOQUNRW2O7kpCYkNQR9o87NmEMOSwv6brVpXnIhfKjegV+CG2NLXWN+Ix+Ah
         qua8AAUyKnmVDesFgA6wrtLbnfrhGMN+92XG23l+Hj7KvhcPJZMEQKZPMGpCCvJaCDNg
         NlWlxCu7/RaIwsV7svTEZrYxsITWKO4L+MhalqWp8uVIlQs1+m6ApS2qt6AR3c9n00cZ
         4j+ZXvE2klKHO/CArE/ZgwVhAL95EfgTmzuNzHuag6wKsNGRtju8DXo1UIwC5dArc2zc
         ckhg==
X-Forwarded-Encrypted: i=1; AJvYcCUdKSaMXX8p6SPfFCV8eQQm0rMIkxCmlLN7HDC6Z+VlXxiIFC8YtHicKzoMrBKowvlDsuEEw0kYBQCLXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7gtG+UoA9ZgomfbHw3D29K2yazHDS0VzYxw7uu3ZhTkWVKcu
	6niouQjSyFZnFAADIbnEsudEYGJ71caoE9wxvMhnC3bc1Nk6uPoxRjMX1S4vY4oUjspdpATBgN2
	S9nqcwL2at71InPgneeFYXZhLb1LdGhv1Vala4B17Bw18QO3DM98V0CELJpe21tu0/vdU2r2p
X-Gm-Gg: ASbGncsYTCx0e8TaHiqxWZEQ5+EbvjX8rF1rflcWcEJWzQjpk2rQctV4VNU+Da0p+s5
	evKlnBK14I1FunN5G16e4/F8N9DYd9h/COIwnNxHhmUa9/iaBH5fvTfijiUG0v+4VWPhlJXOoAo
	zucwxJ4ywjWoJiuE4vOd6OylCICxFSHm8bIruP/JPyExE3CzGaiPXZmQ4k0Bx41oY4V91MYV8zl
	felNTD4nT8IUL6x5CAjPkwPJT2xOtV1i24GakUUU7Ll4KZrQpdgZIm980srraf7u/5gyLSSRkqZ
	emP6B4prSEo0S0LK/Vb/mC/8jJcXQQ4Ar2lf
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id 38308e7fff4ca-328077a2e75mr33284471fa.29.1747585179191;
        Sun, 18 May 2025 09:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCOpIJOSr4tAGzfRuuZS+X/2y3OELPxZD0VCMHWLlyR4YF49YABeKhGaIjH98ADyJ55UZpeQ==
X-Received: by 2002:a2e:8a87:0:b0:30b:d05a:c103 with SMTP id 38308e7fff4ca-328077a2e75mr33284431fa.29.1747585178728;
        Sun, 18 May 2025 09:19:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b4becsm15485121fa.12.2025.05.18.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 09:19:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id EE8081A73C9D; Sun, 18 May 2025 18:19:36 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Edvard Fagerholm <edvard.fagerholm@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: Expiring flows in an XDP based router
In-Reply-To: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
References: <CAMF0iZ4tUEsoVj3ZTYwUxEONj-9n61qw4N-Owp_ZQC4Qp3dE1Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Sun, 18 May 2025 18:19:36 +0200
Message-ID: <87ecwlki1z.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Edvard Fagerholm <edvard.fagerholm@gmail.com> writes:

> Hi,
>
> I'm working on an in-house router and I'm looking for some advice on
> whether to try to implement some functionality directly in an XDP
> program or instead use AF_XDP sockets with the additional flexibility
> provided by userspace.
>
> We basically have a flow table, which contains entries of the form:
>
>   (source ip, source port) -> (action, timestamp)
>
> Every time we see a packet belonging to a flow, the timestamp is
> updated and if the flow has been inactive for e.g. 10 seconds, the
> flow is considered inactive and should be deleted. Actions are of the
> form:
>
>   "forward packet to a.b.c.d port X using source port Y"
>
> The challenge that I have is how to clean up expired flows. Built-in
> options would be BPF_MAP_TYPE_LRU_PERCPU_HASH. However, dropping an
> active flow would be unacceptable.
>
> I'm looking at at most 10k new flow entries being added per second per
> router with a maximum number of concurrent flows at around 256k. Each
> flow sends a packet at least every 5 seconds, but most every 50ms.
> Does this allow me to tune the table size in such a way that no active
> flows can be evicted? If not, are there any other reasonable
> approaches for cleaning up the flows?

Well, hard to tell with only the number of additions. I mean, 256.000 +
10.000 * 10 seconds means you'd need on the order of 356k entries in the
map, assuming flows expire at the same rate as they are added. Do you
assume any such guarantee?

Alternatively, you could have your XDP program start a BPF timer and
perform the periodic cleanup from that. There will be some overhead from
walking the map, and a potential for racy behaviour if the same flow is
expired and re-added frequently, but otherwise this should be quite
doable.

In any case, you'd need to size your map so that it doesn't fill up
before flows expire. So whether to use an LRU map is a case of whether
overflowing the map will result in overwriting existing entries, or
blocking the addition of new ones.

-Toke


