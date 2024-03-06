Return-Path: <xdp-newbies+bounces-56-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D11873452
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 Mar 2024 11:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17BF9B2EEE4
	for <lists+xdp-newbies@lfdr.de>; Wed,  6 Mar 2024 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BE65F869;
	Wed,  6 Mar 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvwiQKsY"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDCB5E206
	for <xdp-newbies@vger.kernel.org>; Wed,  6 Mar 2024 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720448; cv=none; b=gFmbcw+4E10mzzCOIJtwYHSoyDZK2yUL/FlF6DueZVclNJsv+YzpvjMT6Ed+APMrDecsmXUFCS27PkSumnoYxU5a3wI9Z79EF1UXTtbZsTqYbQXMehj/W/xZAft6S5WI1VIGD5xT3a24ANV4QBRf6DQ9liZfaQjL8+SOVAQz+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720448; c=relaxed/simple;
	bh=I6OejaHo3clZREeFvYsGroEhTs7XuntGvUsGvtNseUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iYdelp7B7/DfDgvS47IFwW0SAhwtVrm4nAtNHN6dSTht5tyb6eua8bKWO6Y3PbEWBIYUKCUA2FXBAG2HvkC0ba8HSsq9mzrH7Fa45XiJ/uARHygHf61RRsofySvwfnPAxD8EVB4nhD9KGaUfdRE0DIWzFli/aoGll1545IgnM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvwiQKsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709720445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnW63qvpp0sJSGYhmCpfhS9eYpjvSQJp1RR5X3jiLz4=;
	b=QvwiQKsYCC7LKzJ1DIB6JixrXd0c4Oa0JUYHDsbzVXyYnITR9vI3IleP0ulpPTvXNBYQeH
	28gNdm/N+deM2tWPyzFv9FYxdavbtRPLzFtVEh1msB9Z4Oj8FpDQmjXPV6Svh8XUhDo3Go
	nBsvN9ux0cgj9ha20CMyOkvS4nNXwoM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-Nh35oA7zOJaO3chb5_XszQ-1; Wed, 06 Mar 2024 05:20:44 -0500
X-MC-Unique: Nh35oA7zOJaO3chb5_XszQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4531df8727so130486666b.2
        for <xdp-newbies@vger.kernel.org>; Wed, 06 Mar 2024 02:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720442; x=1710325242;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnW63qvpp0sJSGYhmCpfhS9eYpjvSQJp1RR5X3jiLz4=;
        b=EzEfQVUvGyXUgFWrLKTIUY2orHWFwRTinBjliG3m1ru6wHdQ0y1b3bbPP/uHMi7S3e
         ZsgJQGtDTE3mhDul6ILANv+/AayW5uG+610zlEhHNJva2na1umIbVqLeSCcbtuYtK9OO
         m2BzfnVkYe7lMKSexpfXXuxoPZyXiDOEY2x4K2Q7zgDJaKoZbS3WUjjlQeYbvniG/dpu
         mG6Ic/Fhcxq9rIwz/Z5weX4jXzZd7k6ZmOIFm5Ua91JEqZPWwx7KrdemZpOqeGuaw8sl
         kjLQok7s/zMYoWeH4o6IEhauv1ziByUECakjgsPhoAZUmWxlSflp0UlwjhsMhh/nI3IB
         0ssg==
X-Gm-Message-State: AOJu0YzYgjDG4BbN4iCy5u9x80zXgClVc/b7w0hnyG/cpRULySViOo8u
	7IaB50+ZyQHegxQ32G2kN/87rkrmvTp4b+dDyoRryqx20LRabfQjGyfKZQOIzf8+9vcc6uV+4Oj
	A8w9r1TV1rBhF+OTMkNDawiNxCyDdzjHZx8JNE291YsWFCcuUsUMhu6ZpUep1tOnxS1nD
X-Received: by 2002:a17:906:8da:b0:a3f:ab4d:f7e3 with SMTP id o26-20020a17090608da00b00a3fab4df7e3mr10892760eje.0.1709720442173;
        Wed, 06 Mar 2024 02:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNWRO4zLdbCNaHAxOOv5FMXHG0ZiRS7d5lLmTQ0YovtnwCYUj75kjb52FLkLWhc9aHowZqmA==
X-Received: by 2002:a17:906:8da:b0:a3f:ab4d:f7e3 with SMTP id o26-20020a17090608da00b00a3fab4df7e3mr10892749eje.0.1709720441727;
        Wed, 06 Mar 2024 02:20:41 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id lb10-20020a170906adca00b00a45380dfd09sm3504043ejb.105.2024.03.06.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:20:41 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DE471112F15C; Wed,  6 Mar 2024 11:20:40 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Tobias =?utf-8?Q?B=C3=B6hm?= <tobias@aibor.de>
Cc: xdp-newbies@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: cpumap infinite loop
In-Reply-To: <72h5h7dwvgim5hephweenq63wsqbdaseeu2rimdog2yzlyouqx@e5z5di3v6k7l>
References: <xgct6vpbwh6c5zjljdc6ypa5hbmcw4bapebdh4eetxwjama3so@iq3xdtavnq4g>
 <871q8od2tl.fsf@toke.dk>
 <72h5h7dwvgim5hephweenq63wsqbdaseeu2rimdog2yzlyouqx@e5z5di3v6k7l>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 06 Mar 2024 11:20:40 +0100
Message-ID: <87wmqfu0ef.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tobias B=C3=B6hm <tobias@aibor.de> writes:

> On Tue, 05 Mar 2024 at 06:08 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Tobias B=C3=B6hm <tobias@aibor.de> writes:
>>=20
>> > Hello,
>> >
>> > I was playing around a bit with cpumaps and wondered what happens when
>> > the attached program just does another CPU redirect to itself.
>> >
>> > I ended up having an infinite loop. The working example can be found
>> > here: https://github.com/aibor/cpumap-loop
>> >
>> > Now, I wonder if there is a way to detect and break this loop. I took a
>> > look at the xdp_md->rx_queue_index values. When executed by a NIC even=
t,
>> > the value is the NIC ID, so a fairly low number. After CPU redirection
>> > the values I saw were far above the range of NIC queue IDs. I couldn't
>> > figure out if it is just a random memory value or if this value still=
=20
>> > has a (maybe different) meaning after CPU redirection. Maybe somehow
>> > related to the CPU queue?
>>=20
>> It's random. The rxq data structure is not initialised on the stack, so
>> it's basically whatever was in that memory. Interestingly, there's a
>> TODO comment in there to fix this:
>>=20
>> https://elixir.bootlin.com/linux/latest/source/kernel/bpf/cpumap.c#L195
>>=20
>> Not sure what the intention was here. +Lorenzo, who wrote that code.
>> Returning the contents of a random uninitialised stack variable is
>> probably not a good idea, though, we should zero out the data structure.
>> I'll send a patch for that.
>
> Thank you for the explanation and the patch. :)

You're welcome :)

>> > If the field is set to a meaningful value I can make assumptions about
>> > it and would be able to detect previous CPU redirection, I guess.
>> >
>> > I'd appreciate any pointers and tips how I could detect such a loop. Or
>> > maybe there is a way to prevent it in the first place other than "just
>> > being careful"?
>>=20
>> Well, you kinda have to go out of your way to construct a loop like
>> this. How are you envisioning this would happen accidentally? :)
>
> I totally agree that it is pretty unlikely to create such a loop by accid=
ent.
> Especially since the map programs usually are rather simple.
> My example was driven by pure curiosity, exploring the possibilities of
> redirect map programs. And since I saw infinite recursion is possible I
> was looking for options for reliable termination conditions. This made me
> wonder if I can detect if the program was invoked by the device or by map
> redirection.

I don't think there's any direct way to detect this; after the patch I
sent you could look for queue index =3D=3D 0, but I am not quite sure if
there are any legitimate devices that would have that as well, so not
sure if it's reliable. The most reliable is probably to resort to the
kind of wrapping you're doing: you know where you attach the program, so
the cpumap program type can pass additional parameters to the functions
that contain the main logic bits, like:

SEC("xdp")
int my_xdp_prog(struct xdp_md *ctx)
{
  return my_real_prog(ctx, false);
}

SEC("xdp/cpumap")
int my_cpumap_prog(struct xdp_md *ctx)
{
  return my_real_prog(ctx, true);
}


-Toke


