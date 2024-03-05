Return-Path: <xdp-newbies+bounces-54-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F8872534
	for <lists+xdp-newbies@lfdr.de>; Tue,  5 Mar 2024 18:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4F5B1C22EAB
	for <lists+xdp-newbies@lfdr.de>; Tue,  5 Mar 2024 17:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F3D13FE7;
	Tue,  5 Mar 2024 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEssl2B/"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BC8F70
	for <xdp-newbies@vger.kernel.org>; Tue,  5 Mar 2024 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658493; cv=none; b=jiG2e5XJOnMVWDE4OkJ65OEqEcT0tmqfi8rYiFyzOLbfDo/GDpy8bUkiltfiX/+sMqeEEVARdu3Wh7Ow1JB84ys+989f1NRGrhwAbthMesHvUGP3urwSF3Y73qIrIWvbazQMjrdwYPg1pvm/sqoBEyPSTOZdUZ+JvKjshoZLNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658493; c=relaxed/simple;
	bh=h5DCyGJ9gLOXrOQsf7UfG4ISraN9SJq0wH8FLGYO//s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gWowE3FNTfpg8bVvQ6braPBxDBBzjg7Eabjvzh9XIUgXy3iMQZv7z1k6+R5aVUGTOf7K1U3N4sR88Knko7ezyodxK5feUnjWGH2Uvm26s4hQ+KouK6jwFIM/ElwsE9gWJ28H1lCdNCrzMbM9VZg4+nCb/T3HXSBcjkH35NqewnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEssl2B/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709658490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5DCyGJ9gLOXrOQsf7UfG4ISraN9SJq0wH8FLGYO//s=;
	b=fEssl2B/ahubFMrFCanh0N4zXAp7nTZE8FTNHgYDezX3kQq0FlIeShoGO9qE33z/2UN471
	oIXdSuLmJW1wF/eb3IYXow6nAWOiVjPnO0UW7l6O5GM2/MSlgGsgR1+idpg/w2qlNSC27I
	otdmvvACgjAb0yFQtgcZJYL8CcpmPLg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-yVFtRe-3POSf9UnHd-xyaQ-1; Tue, 05 Mar 2024 12:08:09 -0500
X-MC-Unique: yVFtRe-3POSf9UnHd-xyaQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-567dcad189bso15235a12.0
        for <xdp-newbies@vger.kernel.org>; Tue, 05 Mar 2024 09:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658487; x=1710263287;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5DCyGJ9gLOXrOQsf7UfG4ISraN9SJq0wH8FLGYO//s=;
        b=iXKmZxLi/0ASVcDamVJdyZ+j2lMZVhH8uMuU9141DN2Qmc1JZM/3v5iFDBRDJgJikn
         7PWhuh1NGpESnvBNa58Fh2DAoKvdtKunNpKEzvayunFuNBHmiRD+iXvd3Qs7d1cygr15
         UTxPert4/Y1kGrMlc/n/UTKsae0L5oJJs2qGoePXb8y0nJ2EjKy5Gb7vgtKFnpJ9GlXA
         ZkPlgnP/9tZbSGj14aw3FwFMH8rU2droAQgsklUu3MkXjslCS8ncboeP5pTsEChlr1B7
         4SX0Cp8gFwjseiAQfbQcRb+gg9H5drPlFauXchFtZKzQUvyEfrKSdtcOpiLsFOZpIfgg
         QKow==
X-Forwarded-Encrypted: i=1; AJvYcCWJkvJz8h8z4F3xz1/RFbl3rqmOVasslAl5DJt4zpJUAEXeGN25r3QDwkrXA6PBiakJSkkboXeyYRpQ1Zs9sNKnAo5iHz7e4CZ01ng=
X-Gm-Message-State: AOJu0YzBvsgzYbS4sSZg3XFg57uxLl483vu5/j4vWe4BlPGmHslQZKN3
	Gd4re2Jp6/Q23jtUxSH6mF4nZoi3rsrCCYusjutTyLXOhiv5u/vbqXfMMyM7feD+kiACxCUNMgi
	lCKvUVje2XqxdOqQIs/7qj0eUMG0L4FIurl89hhtLlZsF6Yli3uPPhAzay/U1ma9/Q6ks
X-Received: by 2002:a05:6402:2267:b0:566:d333:45e8 with SMTP id du7-20020a056402226700b00566d33345e8mr9448364edb.20.1709658487506;
        Tue, 05 Mar 2024 09:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGurPWIkjTbSmdy3uKK88Zt4wvgIdk48kidXsPpySWE1+mPGrNIdmH4yy2rQpR9SXvJMVDnlQ==
X-Received: by 2002:a05:6402:2267:b0:566:d333:45e8 with SMTP id du7-20020a056402226700b00566d33345e8mr9448345edb.20.1709658487133;
        Tue, 05 Mar 2024 09:08:07 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id cs4-20020a0564020c4400b00566a4dec01fsm5876818edb.11.2024.03.05.09.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:08:06 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 6DCA6112EF23; Tue,  5 Mar 2024 18:08:06 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Tobias =?utf-8?Q?B=C3=B6hm?= <tobias@aibor.de>,
 xdp-newbies@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: cpumap infinite loop
In-Reply-To: <xgct6vpbwh6c5zjljdc6ypa5hbmcw4bapebdh4eetxwjama3so@iq3xdtavnq4g>
References: <xgct6vpbwh6c5zjljdc6ypa5hbmcw4bapebdh4eetxwjama3so@iq3xdtavnq4g>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 05 Mar 2024 18:08:06 +0100
Message-ID: <871q8od2tl.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tobias B=C3=B6hm <tobias@aibor.de> writes:

> Hello,
>
> I was playing around a bit with cpumaps and wondered what happens when
> the attached program just does another CPU redirect to itself.
>
> I ended up having an infinite loop. The working example can be found
> here: https://github.com/aibor/cpumap-loop
>
> Now, I wonder if there is a way to detect and break this loop. I took a
> look at the xdp_md->rx_queue_index values. When executed by a NIC event,
> the value is the NIC ID, so a fairly low number. After CPU redirection
> the values I saw were far above the range of NIC queue IDs. I couldn't
> figure out if it is just a random memory value or if this value still=20
> has a (maybe different) meaning after CPU redirection. Maybe somehow
> related to the CPU queue?

It's random. The rxq data structure is not initialised on the stack, so
it's basically whatever was in that memory. Interestingly, there's a
TODO comment in there to fix this:

https://elixir.bootlin.com/linux/latest/source/kernel/bpf/cpumap.c#L195

Not sure what the intention was here. +Lorenzo, who wrote that code.
Returning the contents of a random uninitialised stack variable is
probably not a good idea, though, we should zero out the data structure.
I'll send a patch for that.

> If the field is set to a meaningful value I can make assumptions about
> it and would be able to detect previous CPU redirection, I guess.
>
> I'd appreciate any pointers and tips how I could detect such a loop. Or
> maybe there is a way to prevent it in the first place other than "just
> being careful"?

Well, you kinda have to go out of your way to construct a loop like
this. How are you envisioning this would happen accidentally? :)

-Toke


