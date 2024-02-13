Return-Path: <xdp-newbies+bounces-43-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D3853419
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 16:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998C328E607
	for <lists+xdp-newbies@lfdr.de>; Tue, 13 Feb 2024 15:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA3922319;
	Tue, 13 Feb 2024 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGtmzfu5"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292B5F476
	for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836477; cv=none; b=qEWC1dDlixljwUgg/zsbtxCiF+q+kb6FlGcQBt/KJKoG+qmLM0EhTwSg9qBOmUyJv3QyZqbg96mZdzA91iI3VexCm8Uv4Tu18CALTlDLw/8C3pKSdwOXamB4tA/e2B/7aPiGjB9oNngYSrg+vS+Vf9tU7N6t/lnuCsRlP/6oOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836477; c=relaxed/simple;
	bh=m+85mEzDm3Rzs4McqmYVlhm+q6qiNrGTvn/HSMn/eD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwGXi94DTvDNyq6mIHKQnutY9MW7RIaiu0YvBVvKqiJcXkyc+i5r76C41Ixn/iomOz/gtqZB9VWQudD9PY1UtXcC1xxnrM6z2mKkX3JNq8EkVdKDmz1rLs8gnHa901MkQsvQ/eHcxWeEH6z6M8K9eGHYpFKNM0BQlUOdFEznWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGtmzfu5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2971562c3ceso2244682a91.1
        for <xdp-newbies@vger.kernel.org>; Tue, 13 Feb 2024 07:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707836475; x=1708441275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vv5qNXTdl5JQbgjNJ7kwFw5x6QseFvrHqVomtjfH1g=;
        b=BGtmzfu5doNQMINXJFcZ6X5bM3NS4ydxumpTF+93oShRiIhOQ3aXB/HzV1cr4DpMf/
         pzQ1TO+5oTSwK6lzAFbk2q4M+fuYpNdohPECWdg+wGHsZRSpfpFV+Q25MT3Ys1Fjqrao
         jt4l8CnbC6XLV4TbyUWPnAw1YY8AS12KW9JXLKMLxTp1cx+4h1WLVePK7SiylE6QjNGY
         RgzwX+XXlVflqzOnahsR20QjdgITdAu00e701PjymkXhBVMe1ZliBC/GZzq3bTq5qWOr
         bBmz3aiaEFqJ2U8vp1e71w9JRm8vR/n8QAdTu4hqHCGENY8RpcaFtYY10+SOp5wBQ0Fj
         XBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836475; x=1708441275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vv5qNXTdl5JQbgjNJ7kwFw5x6QseFvrHqVomtjfH1g=;
        b=k0hu0l3efEmZNDINXGT+y4RJ+qGaoCxsjDG9BU08LQWTU+db4at64TbMPTpa/dSxzE
         0xZfyMQzqNlUwnFSiFBJRYJju2FpUpbeaBTmXscbH34wzhM6kAGSlL428WASok/77SJZ
         0CGVFuc0M89X+60BxX/HOnXG78sDmyx9bLIkI7BpZyu/HdcnpHfA30IQQKjvnIlwYk53
         VtHwF6vhQv1u3hnnYWEovdRg+bR4HAd3t7954VHkyPR2yUeko209uRs418EaXqVtNDT7
         xEca8PsqK5rEdC98mb8K7DoBqx7XkVwQVPwbaSq+/U9m4O1lrhj5W+yQR1BMJDoWifeL
         X4ng==
X-Forwarded-Encrypted: i=1; AJvYcCVKL3YA88RxawfIjdjoFCeBh+1siPjwwhFeK/R+xSsRBtp+rzULOIx19WEzdgK4IDeao4HJFVyhcfPm0nVMPRB/llDbuvymd207B3Y=
X-Gm-Message-State: AOJu0YxLrCD/kMjsBHa7A6M9YqYIZbMzjKlIB15Y9joQRYvZSaz68NXm
	4lcCLcppqXo12eiK9b8d64vvI2sp7lWUQ2hPbjeyamRliFflGaL0KT24zQM6vNmcSR+tQkt2+2J
	VS3rCxjcqeXGjorpsFwn3U4Veap4=
X-Google-Smtp-Source: AGHT+IGG/2z1fEeDFFWOdMIh3ja3hGcm0H8l9bhFJkfqXFU6+FD5mCk1GCmU1e4uv4hdDnpOH5OYFr707CAAAzeeLBE=
X-Received: by 2002:a17:90a:f0d2:b0:296:344d:5a0b with SMTP id
 fa18-20020a17090af0d200b00296344d5a0bmr6961769pjb.15.1707836474716; Tue, 13
 Feb 2024 07:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLRUnCd4obob4vRbK9jmOEA-dkZHfaQcOd2sqesJaH=bKpaZw@mail.gmail.com>
 <87le7ofre3.fsf@toke.dk> <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
In-Reply-To: <d9da33bf-ecef-4470-9a8d-1b638a5ffa24@gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Tue, 13 Feb 2024 10:01:01 -0500
Message-ID: <CAA93jw4jhmEZxo+p9Yp=N=saLaUvbcAhFFn9btoSxVQ7Smi9oQ@mail.gmail.com>
Subject: Re: XDP packet queueing and scheduling capabilities
To: Alexandre Cassen <acassen@gmail.com>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	team lnx <teamlnxi8@gmail.com>, xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 9:33=E2=80=AFAM Alexandre Cassen <acassen@gmail.com=
> wrote:
>
> Hi Toke,
>
> here is a target with lot of interest for it : www.gtp-guard.org

Occasionally I point at the complementary use case that is libreqos. I
would love to make a dent in the 5G world.

> When dealing with mobile network data-plane, at some point you have
> ordering issues and shaping needs, so queuing is truly needed.

yep. But see libreqos.

> Alternatively ones can  implement PIFO or others built on AF_XDP but if
> dedicated bpf map covers the use-case, would be nice.
>
> Watching at your LPC 2022 presentation, at the end, discussions where
> made around using existing Qdisc kernel framework and find
> a way to share the path between XDP and netstack. Is it a target for
> adding PIFO, or more generally getting queuing support for XDP ?
>
> regs,
> Alexandre
>
>
> On 13/02/2024 14:03, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > team lnx <teamlnxi8@gmail.com> writes:
> >
> >> Hello everyone,
> >>
> >> https://lwn.net/Articles/901046/
> >> would this be resumed any time soon this year ?
> >
> > The latest version of those patches are here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/log/?h=
=3Dxdp-queueing-08
> >
> > They are a bit rough around the edges, and there are some missing piece=
s
> > still; I'm working on getting a userspace/BPF implementation to the
> > point where those can be filled in. After that, and some thorough
> > testing, it should be possible to post another revision.
> >
> > What's your interest in this? I.e., what do you want to use them for?
> > Would be useful to know so I can make sure this is covered :)
> >
> > -Toke
> >
> >
>


--=20
40 years of net history, a couple songs:
https://www.youtube.com/watch?v=3DD9RGX6QFm5E
Dave T=C3=A4ht CSO, LibreQos

