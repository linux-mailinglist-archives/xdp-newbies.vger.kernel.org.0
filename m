Return-Path: <xdp-newbies+bounces-166-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56B9E580D
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Dec 2024 15:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACD1228BE62
	for <lists+xdp-newbies@lfdr.de>; Thu,  5 Dec 2024 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEEF21A44E;
	Thu,  5 Dec 2024 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="i5g15OlF"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-108-mta60.mxroute.com (mail-108-mta60.mxroute.com [136.175.108.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE328219A68
	for <xdp-newbies@vger.kernel.org>; Thu,  5 Dec 2024 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733407203; cv=none; b=N08aem7sYe+rd1NMwdBe7pjSEVujBdNTMcF79XBvKlc1T0PQaAbnlAjpabN9/KpBUPjl+K/rzICegiwEUbm7PTH9vqsLWq8t3lyw/zUQc/z/oF+Yp9Ynt3Yt4Ro8t60LvZhhlwjcspqIbHESmx1yDhGSzL3XXRvmgaz6b92OZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733407203; c=relaxed/simple;
	bh=fVjIRRNj6f3WD8yEGu/syh4XhmuZxDWEx557kgBcy44=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=c0xMne0IgAnFn1eBSujRJavDkfyfHYbhbIw6N7cQwyqU8qRA0QmbFDLJL16plz900PewDDqzxg+/7jBKdShXIbTMOW/wHmcgPMXERHjdczB8+ym8yC+obsN8KZm7HKRFB1wKRqUUppIbgeKKmZeUoM1pYonOlmovG7t/c3L2xA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=i5g15OlF reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta60.mxroute.com (ZoneMTA) with ESMTPSA id 193971eb1ce0003e01.001
 for <xdp-newbies@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Dec 2024 13:59:51 +0000
X-Zone-Loop: c44e9c5decae717761c4251039398d0df01822697e0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=To:Date:Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:
	Content-Type:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fVjIRRNj6f3WD8yEGu/syh4XhmuZxDWEx557kgBcy44=; b=i5g15OlFp7kThK+QUoOE6b1ACz
	td9o6telWe5CzPVqrEB+RvEWyz8H7utW7QzKYD+UvEdJQYIAE73aL8G+NZR1dgj9UvtH03At3Pwds
	Swc1uK6LeXjM3sPoiO1yj0jVPiV6MjvYGK7yFz4cS9bKPBYjqMcX6YKGa1x3RbuyPG5pCTsqseyOi
	A5f9YCg0tusuzrwO/IxTyWcJSU8O0sDuRib1r8YmbXMmv32+Kf6wL1AQcODFXISjkaN/vEM2X9DBn
	ypb0NYBhTtEQ0iHf/ZDp49p6pJ6YzBYT7KwFjp93cCzHlvouuZIb6KVvECegBGCgrMu3x4jG0ofbN
	5tkQ5h1A==;
From: Richard Patel <ripatel@wii.dev>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Sharing UMEM without XDP_SHARED_UMEM
Message-Id: <B0A503CC-2BE2-420C-A032-EF3966FE0E88@wii.dev>
Date: Thu, 5 Dec 2024 14:59:38 +0100
To: xdp-newbies@vger.kernel.org
X-Authenticated-Id: ripatel@wii.dev

Hello,

Is it safe to share the same virtual memory region as UMEM between two =
zero-copy XSKs without setting XDP_SHARED_UMEM?
The XSKs do not share the same (dev, queue) pair. They are backed by =
separate receive queues and have separate fill and completion rings.

I have an application receiving and sending packets via two such XSKs on =
the same thread.
I=E2=80=99d like to reuse buffers across both XSKs while ensuring each =
chunk is only submitted to one of the fill or TX rings.

In principle, this seems safe but undocumented.
If queue IDs or devices between two XSKs differ, the only notable =
difference in behavior when setting XDP_SHARED_UMEM is that =
xp_assign_dev_shared is called instead of xp_assign_dev. However, =
xdp_assign_dev_shared only copies XSK flags and then tail calls to =
xp_assign_dev.

Is there any special behaviour introduced by XDP_SHARED_UMEM in this =
case that I=E2=80=99m missing?
(Perhaps something to do with ref counting of memory pinning, or support =
for simultaneous DMAs from different devices into the same page?)
And is it possible that future changes to the kernel AF_XDP code or =
kernel drivers might break such operation without XDP_SHARED_UMEM?

Thanks
Richard=

