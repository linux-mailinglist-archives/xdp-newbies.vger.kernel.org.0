Return-Path: <xdp-newbies+bounces-51-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E786D968
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 03:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A35791C22970
	for <lists+xdp-newbies@lfdr.de>; Fri,  1 Mar 2024 02:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7993D3A1DB;
	Fri,  1 Mar 2024 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="mgyVZ2rz"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FC3A1D3
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Mar 2024 02:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709259047; cv=none; b=NYGUrc6cohCLJI5+HLp2ty4cgHJmRCtFSdYNeyjU/PrfTL0g3Gdf/0AfX5PQU2akkWUhw2CZoFrBv45Tr3B0c5jMelAYi9MdDzruSXCLz86D7tWjm7XOvvJ/NYE0ACdZqOra9FNv+c5lAz9O/QjrorSYYCp3URNQNHR9lFLUoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709259047; c=relaxed/simple;
	bh=JOfmQlomKqiTEi+h6mFsk+x/07p5GrwEsR4OhM2R1A8=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=E7vzqLeCiCv0UXDI+x9VOZtxuP620x0ENLwDTaaRHy2a0ZmRuuDS+lJyUKv8vGrfvS7X8dbTfKxOYja/tcfFLChg4jVcajBjLOz87c08Grhhrr53MW5UrvrI9TwnDByk7JOiNcNMyBCYwcgrEPsWUAVwtP6YmaWYxOM1IXPGMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=mgyVZ2rz; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D55EF3F684
	for <xdp-newbies@vger.kernel.org>; Fri,  1 Mar 2024 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1709259032;
	bh=pPE1JLy0D9d6ROCBn/xEN/06/1LSgCXEZb3UUUgmDhI=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=mgyVZ2rzhPeW9U1XQ5esrP//Ap7rdTKogYCaKdwRlE89G09zSONaes2ILVXdOZWBF
	 crHKYj+5FPBFa8OyhouQhAj0ONNsutnvxZjdIHa15F+OYyJov73wF8s35UiDlhemJl
	 K8vC6fw62FfsVDcHNUu32xD2nP2jB39Q4GBZdqQqdYq+Lnef1cOmJrkGqJ5wRyZsjf
	 f0kemu3ZNHql69mHMhyWUFS6L47DkLKV2ASY7aPUNjVBgSX55raivg+YC4eTnKCRpM
	 tfl4ScR8HryY8IMwIyRXx4THFxyT3PwJCUU5HnEum3tA/RYU795N4ENk63VorNjSJt
	 gYyZXw47icxEQ==
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6e50831226dso1145087b3a.2
        for <xdp-newbies@vger.kernel.org>; Thu, 29 Feb 2024 18:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709259031; x=1709863831;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPE1JLy0D9d6ROCBn/xEN/06/1LSgCXEZb3UUUgmDhI=;
        b=sWMc6wpnxxOwut2IC2NnMp2p5v1sfr4wkbHjrypGpRDoXbdiVwz2a0DSzI+KQVPJqH
         jfzB01yqXcUu3V9g662sOAwupK/PPwj9nteiSBxkOHnV4H0UElGjBxh03c3Lao4oEpLe
         GVgS+xtOOlF1zaUZYkUCfezlfEW0aX93boNusj4PeGp5Ld3b6oMjMn+8mhmRsy9s8RfN
         W5Ks7eSDc2nYKBwOMoemHTNkjtdw3epLwclB/Jsn+bDyfWXiPkxL1mfow4xuDlR2K0yf
         JcLRMSQHngqOT5Ts+0i3R2iV4uAMhOhOzlF5zgIGR0lj2/pUqnqSx91/5wZj5Za3ER2W
         Mztw==
X-Gm-Message-State: AOJu0YzDKWfrGNAMhaP2tcW8Z33i23y0jUU5uLe/1/Uz81/6bWMRj/zY
	FidbD5zZ17H4h4ejYxjjK/SQLpIYqQhQcij2n1sdVWmSL1Dfvtl4D3WAhyCQ6QkplPtUPE+ilCG
	6PezN5jM91RPBZhDtrr54KoGnKN0GmdClfIVqCQ97mKzpXosNwGip4nkbQNwyWjzimafPD1sTsG
	Zy
X-Received: by 2002:a05:6a00:cc5:b0:6e1:482b:8c8e with SMTP id b5-20020a056a000cc500b006e1482b8c8emr571571pfv.17.1709259031457;
        Thu, 29 Feb 2024 18:10:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJyc9N+U8zAy+uPB5ziFomMsatwS9PPUlmaPD2/VQOxee408Wsbo+leB23Bw6HS6LURhLrSw==
X-Received: by 2002:a05:6a00:cc5:b0:6e1:482b:8c8e with SMTP id b5-20020a056a000cc500b006e1482b8c8emr571555pfv.17.1709259031012;
        Thu, 29 Feb 2024 18:10:31 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id i29-20020a056a00005d00b006e5bed8dac0sm99067pfk.61.2024.02.29.18.10.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Feb 2024 18:10:30 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 2BF65604B6; Thu, 29 Feb 2024 18:10:30 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 24DA39FAAA;
	Thu, 29 Feb 2024 18:10:30 -0800 (PST)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: mr.bo.jangles3@gmail.com
cc: xdp-newbies@vger.kernel.org
Subject: Re: sizeof pointer vs sizeof struct
In-reply-to: <CAFR4CiudyKWsSe3xdaDTFn-zGS12w47tF8kKb8fd+s=cMsRA5A@mail.gmail.com>
References: <CAFR4CiudyKWsSe3xdaDTFn-zGS12w47tF8kKb8fd+s=cMsRA5A@mail.gmail.com>
Comments: In-reply-to Logan B <mrbojangles3@gmail.com>
   message dated "Thu, 29 Feb 2024 20:20:38 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24437.1709259030.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Feb 2024 18:10:30 -0800
Message-ID: <24438.1709259030@famine>

Logan B <mrbojangles3@gmail.com> wrote:

>Hello,
>I was recently working through the xdp tutorial and in the
>packet01-parsing lesson the sizeof a pointer to the ethernet header
>struct is used, not the sizeof the struct itself[0]. I peeked and the
>solution for this section also still uses the sizeof a pointer and not
>the struct so this isn't part of the tutorial and I was wondering what
>is going on? I don't think the verifier is re-writing these addresses,
>only those for the memory access into the packet data.

	The referenced code at [0] is:

	struct ethhdr *eth =3D nh->pos;
	int hdrsize =3D sizeof(*eth);

	"*eth" means "what eth points to," so this is indeed taking the
sizeof struct ethhdr.

	I suspect you missed the "*" in your reading of the code; in
this context, "*" is the indirection operator, per K&R 2, (The C
Programming Language, 2nd Edition), Appendix A 7.4.3.

	-J

>
>#include <stdio.h>
>#include <linux/if_ether.h>
>
>int main(void)
>
>       {
>
>                           struct ethhdr normal =3D {0};
>    struct ethhdr *eth_hdr_ptr;
>
>     printf("Size of struct %lu\n",sizeof(normal)); // prints 14
>    printf("Size of struct pointer %lu\n",sizeof(eth_hdr_ptr)); //
>prints 8
>    return 0;
>}
>
>
>[0]https://github.com/xdp-project/xdp-tutorial/blob/master/packet01-parsi=
ng/xdp_prog_kern.c#L34
>--
>Logan
>

---
	-Jay Vosburgh, jay.vosburgh@canonical.com

