Return-Path: <xdp-newbies+bounces-61-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE8892B85
	for <lists+xdp-newbies@lfdr.de>; Sat, 30 Mar 2024 15:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C211F21AC3
	for <lists+xdp-newbies@lfdr.de>; Sat, 30 Mar 2024 14:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917852C68A;
	Sat, 30 Mar 2024 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkuj6LFV"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB08BFC
	for <xdp-newbies@vger.kernel.org>; Sat, 30 Mar 2024 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711807734; cv=none; b=SeeifwnSwWfoD1z6j438HyTurV1Ddr1DlTr0m/sH7HXwe89flUsCwEab7lBRq/GZvPdXZb5slLAsQuJZHG6zpnUOKkqsuL6Qv453X3E4xGd+yRAwJ0Y9kLsjUazT79Q2tHcPtC/E7u5KUEeUgIdA1fIk466VRWOgj0ZnmhB8xrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711807734; c=relaxed/simple;
	bh=+NYd9nwpdd7DcCIlr1hHC+d+ak/qZu+wti8xxamvJhg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tauusH9zr8xw0Uz2PRwNPzg/AgTUnHxXvWKvRBksu6RA6JH8MsrI99FkSz5Ai6YFEIFVTnw69DnQEzHSvADKn/RgoA/FwDDodVH7/TqdbPpZJ2M+X1lNEJadGbRsmrcvSaj4JwMRKugy+LTkgxzjs/FSCYr7V5nLzmO4xJRfEXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkuj6LFV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so374600566b.0
        for <xdp-newbies@vger.kernel.org>; Sat, 30 Mar 2024 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711807731; x=1712412531; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJqwJ2EOhebMjowhgWp5a+SOc3MFWaQd5FqXDmiRvLA=;
        b=Fkuj6LFVd6bP1j4R1kXVoD18BykrZ3G8xPRHSR4Su4bV9o5s6G3XspS7xeKK4O1IsW
         aLa/ekvuPoscx0fzBzgCCuup2g8lkt/lgTzB+BbniAXIIzicCqv+17G3Hq1PojO8haEu
         z+j0BySXQm8ZRqMnGB75rw7nWKi3Ap7gGL3uQJcJ+deXG17eRGj0JMkAmc59tUTyu/cr
         XW48e3kKnxLHuRJ4WIqwYUFW00FJhFEU7pNr8CQGeTk7ftH6VI2d3pk3EwdTbw8Z/+YG
         VXgLeJSZpz6zY5XM/IFBs7kKCqdV1HZuEjKfzHnDeJBRUtf5KwRX6yaSzreoYgMwypkS
         qJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711807731; x=1712412531;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJqwJ2EOhebMjowhgWp5a+SOc3MFWaQd5FqXDmiRvLA=;
        b=J0EBKhyrSmyS30WQMKDe4NKuGkl/45psT2UJj+FdXfB4yfNOTBZ90ptYa7hFbSrx/V
         vfbk4iGy0oDsJ3Vwz0LtsC2948BiAN5P/a6iqPu7fRjlRTEp+KZglPi+mlPqfyQRuUWl
         h9HDoU/x6Q4dqWHqBCMS2B36SjTYOHi91dLvT40c4B/vWzvdUJGAOjIFWY1uGB8mIUXv
         Uk+GUZ6A5DqUYazQCZrt2KjOTefKz2Sezphq4T9Nwxb0ElspghCHDIVAQ4+pc8S7wSi3
         Fx5BKoiKT7DrwzQ9iGZpibI64fstYgHgJg9WOE3zRiHG/DtBhJ7/YJMsz6cDLdEw0aSG
         y9ng==
X-Gm-Message-State: AOJu0Yy9xqddUn9epdSMdiBOFTMVKf+vVssA0/ZnZX6Uo7BEQGQthgEZ
	6pVpPf7uvR0XraucrPO1DJpnAmHTF/zXaFVdQaqGyR/D9G5mHZan6/EgDuFxbjTFHOVJkL4a9jY
	xVKj/M+h3EHFSQfdTLcjUJIAYuntXLN5uHZw=
X-Google-Smtp-Source: AGHT+IHofxwUEtRDvSZJ9tJLKfQfiDKNjQHusEZpdTYb4uTzhOCG4tjA/FLp1KkhqVuCgUNio2mp7V7l8r/1aG9J4aw=
X-Received: by 2002:a17:906:f80d:b0:a47:66a:9c75 with SMTP id
 kh13-20020a170906f80d00b00a47066a9c75mr3012315ejb.28.1711807730805; Sat, 30
 Mar 2024 07:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ctxspi@gmail.com
From: Marco <ctxspi@gmail.com>
Date: Sat, 30 Mar 2024 15:08:39 +0100
Message-ID: <CAAVAo4MxNCmEi3A=V+oqyK9_qZ2CBSQAC28g6tAH2t535cSZ4Q@mail.gmail.com>
Subject: Global static volatile
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Helo

I tried to use a secondary variable fib_params_test as a global
variable at the beginning of my XDP program like this:

static volatile struct bpf_fib_lookup fib_params_test;
.
.
static __always_inline int function_process_packet(struct xdp_md *ctx,
u32 flags)
{
    const __u32 ifingress = ctx->ingress_ifindex;
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;
    void *l3hdr = NULL;
    struct bpf_fib_lookup fib_params;

    bpf_printk("Ingress interface %d", fib_params_test.ifindex); /*
the value displayed is always right */
.
.
}


Once "fib_params_test" was initialized with the first packet received,
upon subsequent packets coming from different incoming vlan
interfaces, "fib_params_test.ifindex" always returned the interface I
expected.
Obviously I have always done tests with little traffic so I have the
doubt that in a real situation there may be unexpected values for the
fib_params_test.ifindex variable. This is possible?

Thank you.

Marco

