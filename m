Return-Path: <xdp-newbies+bounces-152-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1C9AC9B5
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 14:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738A81F2221B
	for <lists+xdp-newbies@lfdr.de>; Wed, 23 Oct 2024 12:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C621AB6F1;
	Wed, 23 Oct 2024 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCtMV77V"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF81ABEAD
	for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729685418; cv=none; b=qMZTMaLMRA9p057m9XJmHhat08BwiTAaX3JGCM5uyz2jMB3sTP51yr8qlMfEeInMrSoOH+2tJtYdBebeApffOL8XBWstMOy9TZkfbHc8MwwmKENtkci/OwA+u0OhP+YFIKiLqaY3ZBgiB8VojeyzMaRKfHTkeumXF0gW9bIPx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729685418; c=relaxed/simple;
	bh=5169YegMBeDwmca1NxWU6vySGzONgWk2FA3DvrO4N3E=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bW0neG9owGdOpB7qPsLLqPUqpJ8T8VqE6JkD+6YcbA3+z125qnXPrUUixo/zlvPp7qxfsHjCL78KcuTb0DOHKb0Da288C4OFuLTiXlFpB9BZKuZaEdo6RU7xYUazKOkxfNJo1vRdYyGC8Vb6nW9L0S7nsZJs43OkKi4KWKIgWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCtMV77V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729685415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5169YegMBeDwmca1NxWU6vySGzONgWk2FA3DvrO4N3E=;
	b=cCtMV77VybqTWTa6Q/9EYtKrydGsuWCEAjg3GrPWgMDV4N094GRzIy63lqt6Z1B/6Xp0nm
	+y0Q/DEAUPcaG2ZPj4XOcGq5p5wXkMTWibll89qSu2HX0Zsp/FOUiGHsBUnw/Y39bSIzEz
	WFKorJtQ2wj+5ielkvmumMomYRJb+dM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-ng7PR2_DNu6QYzPymUIJmg-1; Wed, 23 Oct 2024 08:10:14 -0400
X-MC-Unique: ng7PR2_DNu6QYzPymUIJmg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43152cd2843so49851005e9.3
        for <xdp-newbies@vger.kernel.org>; Wed, 23 Oct 2024 05:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685413; x=1730290213;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5169YegMBeDwmca1NxWU6vySGzONgWk2FA3DvrO4N3E=;
        b=njKzcwgct3mgxwDGz9kVXoQOUWEOQVNYKuuahf3Dhyf61zjkdtjkbvLbKHveyQlsA8
         vrzeiab3OYC89LCpRqxCVfma4QSgmewVDhF4Oepxyp/cqNHGPBuo2bk+ON/5qYut7SFO
         TEXO3fYRq9QnXbVg60MbZE9EMJL4rUyZJ8r9rZMcczvHsvlDfHwVF4qvpaBD1/aq2vl0
         UCUgCe0qPujGXoKvX/zaOHxWkRJcKpFiQOjWJ80TRBHIT1ATbE93atInKD0+1rhWMY5E
         Y3kDKn+QWnqlrL/JwCCkr8a5qzfFESzqCkBCPUzwDEbuOMtgPgRe/XFItZGLXJut8Htw
         alCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOuDpoPSf9tHcmP5A9kEB+euDEy82mZdEbx7+SvwWPtt6nyxWEiz6WpGSOtu8O+PhGl/CJqUiysBn5Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywplo7dpbqaBoVHIISm05LyXZKzK3RWqEhkpapuze4m72A7BhS9
	IEPsB0BNlLnPXZ3uEIW6dFNQEL83HrVR8nlPlI1rgx0AhMlaRWsWClhL/tUJZozyilNDHJfnvlj
	4s+fxFRe28g8+oA5uDgyr9rLXOrZiCJDkqR3C9/Jyg8JTC4vLSrsur3vJjWam
X-Received: by 2002:a05:600c:4f86:b0:431:5a93:4e3c with SMTP id 5b1f17b1804b1-4318415ae22mr21870765e9.16.1729685413351;
        Wed, 23 Oct 2024 05:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELnq13vQmBFXzlhhWlmm/ilGvsUYaKOZhal1AXFLS4PCrwZMMhsUwXDUkUxeRt95ZIKj7ImA==
X-Received: by 2002:a05:600c:4f86:b0:431:5a93:4e3c with SMTP id 5b1f17b1804b1-4318415ae22mr21870545e9.16.1729685412905;
        Wed, 23 Oct 2024 05:10:12 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a365b9sm8778551f8f.11.2024.10.23.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:10:12 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 78CA5160B3CA; Wed, 23 Oct 2024 14:10:11 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Vadim Goncharov <vadimnuclight@gmail.com>, xdp-newbies@vger.kernel.org
Subject: Re: XDP/eBPF map thread safety in kernel (e.g. lookup/delete)
In-Reply-To: <20241023145426.210fce4d@nuclight.lan>
References: <20241023145426.210fce4d@nuclight.lan>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 23 Oct 2024 14:10:11 +0200
Message-ID: <871q07ggv0.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vadim Goncharov <vadimnuclight@gmail.com> writes:

> Hello,
>
> Where to find exact documentation about what happens in kernel BPF
> helpers calls with respect to locking? For example, I have
> `bpf_map_lookup_elem()` in one thread, then work on pointer, and at this
> time, another thread does `bpf_map_delete_elem()` for exactly same key.
> What happens to memory the first thread still continue to work on? Is
> it now dangling pointer to nowhere?
>
> In my particular case it's a bpf_timer callback who does
> `bpf_map_delete_elem()`. I'd prefer for it to not delete entry if
> another thread did `lookup` and works already, is it possible to do so
> (in a performant way)?

Map elements are RCU protected, so you already get exactly the behaviour
you're after: if another thread deletes a map element that you already
looked up, the element is guaranteed to stick around in memory until the
BPF program exits.

It won't be valid anymore *after* that of course, so if you're doing
concurrent updates it's you own responsibility to sync appropriately.
But there is no risk of the pointer suddenly being invalid in the middle
of the program execution (so no crashes) :)

-Toke


