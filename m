Return-Path: <xdp-newbies+bounces-50-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDA86D8AF
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 02:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 601091C21044
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 01:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C319D101EB;
	Fri,  1 Mar 2024 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+s5Op9Q"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73B2B9CF
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Mar 2024 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709256053; cv=none; b=Y/tQByhwp7pVEFls+dKFDJgPCBAA4/2qUVRNcOXlQVWcZaxsm9FxCOCEacS8IMba5SOnqsrgMKAI7Bsf75C5D75eNs2hQ4s8sGG5kvi84J2aNej6HbJMsir/jGfAxxr8Iyw4hW59nU4QWaS79vtBfAvrQrrkGuOW7/oNr5ajwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709256053; c=relaxed/simple;
	bh=hfzY6/QdVN9Kl9WhIdyLq2qhlJ9fdkA1aU6j3+eizlA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kFoRgDuE1rsvgYGi0GwJCBCPwDwckPw3NMuMITifQpEBldNLKNLCEdNlRw02DPCYJW1wpSRcEcPnPKG6g8jkr8pHKfm/ptnkGO83UGVyYq0nrdhVm5da9bKjlJfk2L1wz7ndTWdkKpWkej7ypBe94x3gQU2D62qyTTbLs+BISqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+s5Op9Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3f3d0d2787so234770866b.3
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Feb 2024 17:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709256050; x=1709860850; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oujhclUa/KwbuKdVKZthBeak1qSReuKZQQRoMd4a7Fc=;
        b=N+s5Op9QdUs4w/iqOK+SRsg3PdeglT+P6PzG61knTQ4bGdZNhsYeEl3BeDmR38zB6K
         EF3HiO7a5DjHbwewq/ZVVPLiA+qQLmsv4A4bsugYzZAzXOaJM7c+ztpgOe00U/HvJ0kV
         yT1P91Kqp2C0ymsOsieB0NoICt3800voWZDAk+uW6A3xLcDgGp6Mo1Gf5I1ElqbPXSmO
         DJQoLS4VbkgqCLp7WB4QufUUk/n3YrLJ0v3pz4EQ5CG7017nZ7uZr5HTNCbbVK7cQHnW
         Mzn2UPc/gQj+1dH7rMf1/Yr+endQ5tvGhQ8x+xAwSYRb4ROpgsvQtIiij5xR4zJz10cd
         JgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709256050; x=1709860850;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oujhclUa/KwbuKdVKZthBeak1qSReuKZQQRoMd4a7Fc=;
        b=YccB8KC6O+HN+V9aoEUB61ftLLB3r1iKUc2eKhIXx4K6FGq9yTLnQtbHSyP2WcfhTo
         NHgu3xGT45t3k9KJpEqMgvjanOTlvbmVh5E8M982gE7xXtwMjyyxY15MnEjEv2SItRBp
         6qg502TJeCQozEvd52Our85Ut2b+8t9dnA3pLmUFgauCeP02f6ZjnQxguI1aefWPzVgQ
         UYG4cFvs8Nx1OfcdcpqALovzSRsG6CQZhpmQ1YDvyYNmxMiwkxVAPutecZg+I1jKDxj5
         DTv4948IITl6dvoto/stT/eQ+4WeGg4BKZ4xz6x3l3dYQi3vll7dBkXHZv4tjxb3HfFw
         sLuQ==
X-Gm-Message-State: AOJu0YxZxn5Gz0KcThTZi0ezqVNsWjVSgOhB9hSmqk3WV4bOwXSV/IZ7
	0gmcAWwK5dEX6wKLLxbFs4qgMlhApkSVBxs+CTsclMKhvSl4DYBUzr82eIXtq8LGKOVGtESOWzE
	n6VkEtcgrSrb2iFzqpIr7O0iaLbDQTByw
X-Google-Smtp-Source: AGHT+IE+xOg0x8orxLz764DK3UOqYV1D7e4hxb6nKnB4VfqdJsZ3XcBOlwnm8MY1I4/cFEkpst4bHawFVaJZdFE8EfE=
X-Received: by 2002:a17:906:798:b0:a3f:6942:a213 with SMTP id
 l24-20020a170906079800b00a3f6942a213mr171641ejc.32.1709256049688; Thu, 29 Feb
 2024 17:20:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: mr.bo.jangles3@gmail.com
From: Logan B <mrbojangles3@gmail.com>
Date: Thu, 29 Feb 2024 20:20:38 -0500
Message-ID: <CAFR4CiudyKWsSe3xdaDTFn-zGS12w47tF8kKb8fd+s=cMsRA5A@mail.gmail.com>
Subject: sizeof pointer vs sizeof struct
To: xdp-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
I was recently working through the xdp tutorial and in the
packet01-parsing lesson the sizeof a pointer to the ethernet header
struct is used, not the sizeof the struct itself[0]. I peeked and the
solution for this section also still uses the sizeof a pointer and not
the struct so this isn't part of the tutorial and I was wondering what
is going on? I don't think the verifier is re-writing these addresses,
only those for the memory access into the packet data.

#include <stdio.h>
#include <linux/if_ether.h>

int main(void)

       {

                           struct ethhdr normal = {0};
    struct ethhdr *eth_hdr_ptr;

     printf("Size of struct %lu\n",sizeof(normal)); // prints 14
    printf("Size of struct pointer %lu\n",sizeof(eth_hdr_ptr)); //
prints 8
    return 0;
}


[0]https://github.com/xdp-project/xdp-tutorial/blob/master/packet01-parsing/xdp_prog_kern.c#L34
--
Logan

