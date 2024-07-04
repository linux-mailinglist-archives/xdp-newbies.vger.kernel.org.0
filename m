Return-Path: <xdp-newbies+bounces-99-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E129274D3
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 13:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 456281C20B52
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 11:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7D71AB524;
	Thu,  4 Jul 2024 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJeZqr6W"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71D17556E
	for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2024 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092019; cv=none; b=uTE2fmRCM5jDBM72j0q0OC1fQddjPhuilNg6GgDQgIBAW4OU0Ip1qeXVHJt3PvUo9PM1gbtT87gYTcMdHvViISzatWyfwgThB0veC7pYT1+Q9P4TMo6FrRSh4EHFp8p3xI/HoZ6Itjs751ZvqHgz3CRGDvAhjNjFNWkAvnrV18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092019; c=relaxed/simple;
	bh=n76NseNACAb7c/hQsm42AbkVZyHRtMuUogpWEB4G6os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LxInz0z8L6LSKqGRNUXl5OmnMqX9rlxov90WZTva0k7uUooI+VslP7lVUtCcqbXlJKWBvKYiSBhowo6+DSQ41oOJDZANCPHZQCFRFOaBBa7mZW9XrMffmI72crpFks9UDwR2Xot1huCuoefvBSkWmAeyHMboWD4yGRxk0Ogd7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJeZqr6W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720092016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NY6V1vM9CkMONgqjhAYRyYOIDFjFNULbX8tvcz0HfRk=;
	b=GJeZqr6W00arccuw1HVL6NKIKnJ/j1iuTzsoILQ7rHhBTR/biqv8wKW2L/YaocAX2xpVfb
	YQChjwo+8qbDCrnzsHFldp2R9ofjk8gUvCpHBjT8ReYekk9qXDFOoHNwkavvFmkY69H6R9
	aWAKDDJfsCvc7Bf8nOSGMaVtY1pheho=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-GVIxqRAwN3K7B_u2lIO9fA-1; Thu, 04 Jul 2024 07:20:15 -0400
X-MC-Unique: GVIxqRAwN3K7B_u2lIO9fA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c20f3adcso16997966b.1
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2024 04:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720092014; x=1720696814;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY6V1vM9CkMONgqjhAYRyYOIDFjFNULbX8tvcz0HfRk=;
        b=dgG9v9lpDIumolTdeuljAismHvIIS6NNdUr+63zPLhM9AOHqW/LlA6aIigfI7vh1zf
         l/NA/MQCrEibY9100eJeq9SOPxnCwToa7rHuleuNCYuF2CycaVJLPZhk2qTonaG6/Vzt
         N/5R5mMsz9jQj5cC9Uv+dWKTo2nyfEAk98dj/6NgM2dGJj9tDCbID6F0nQ5nL8uhSA1t
         p+EQKCntEJrYwyTFa1/TfySkpR2Q039GheRC9jmfwqMUCOm/y4805smX1OU747RKIeXD
         3o58eaq6hdq9tGwMYev23O+VM9/OsZP4DD0adK0ove4dx27x+RBHDOvANbp+fnMytWT5
         Y9uw==
X-Forwarded-Encrypted: i=1; AJvYcCWibV1ys+1y9fG5Nl0DOYYXWYZQVrRTybgzlu/HL+xrzi4SaUJCemnJBlviwxu2pqKXO+RgXOwLBs+EYIdknEfxrG10IRXm9H1Bl9o=
X-Gm-Message-State: AOJu0YwXCq+ttlPrjLyBRIX9zsOzhdTVz7r+BQymmpMbD6n//Orb38/n
	tF+3rjOb4+pUwHBtl8x64ccJhVuCY4T2CLP6niMCznh+quVDu7wGFCdk+rLPzmFepn2+3Y/h+cy
	zgw88gWMXQ/QQZoUf+ITWGqmf5HpMezyASs8mwrPi9Bi50skKuQAIEUd+z331fwGQbATI
X-Received: by 2002:a17:907:118e:b0:a72:7c0d:8fdc with SMTP id a640c23a62f3a-a77ba45525dmr99545066b.14.1720092014085;
        Thu, 04 Jul 2024 04:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoc986V3mdIFyPkbzaR/XI4GvgBs58qMk3ZHYJINYOfgy/AGsq0g+SY+F7hksZZ0KZDLrvDQ==
X-Received: by 2002:a17:907:118e:b0:a72:7c0d:8fdc with SMTP id a640c23a62f3a-a77ba45525dmr99543066b.14.1720092013618;
        Thu, 04 Jul 2024 04:20:13 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0b7ff4sm586830066b.220.2024.07.04.04.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:20:13 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 733E313FDB35; Thu, 04 Jul 2024 13:20:12 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-newbies@vger.kernel.org
Cc: Ferenc Fejes <ferenc.fejes@ericsson.com>
Subject: Re: Different packet handling after bpf_redirect_map with
 BPF_F_BROADCAST
In-Reply-To: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
References: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 04 Jul 2024 13:20:12 +0200
Message-ID: <87msmx1k0j.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Florian Kauer <florian.kauer@linutronix.de> writes:

> Hi,
> we are currently using bpf_redirect_map with BPF_F_BROADCAST to replicate frames for sending traffic over redundant paths.
>
> See for example https://www.rfc-editor.org/rfc/rfc8655.html#section-3.2.2.2 for background
> and https://github.com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325f0e77df3020526ad992aff/src/xdpfrer.bpf.c#L393 for the current implementation.
>
> However, we want to modify the frame after the replication. In the easiest case this means to change the VLAN tag to route the traffic over different VLANs. This is currently done by taking a different egress_ifindex into account after the replication and that works well so far ( https://github.com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325f0e77df3020526ad992aff/src/xdpfrer.bpf.c#L399 ).
>
> BUT there are cases where the egress_interface for both replicated packets shall be the same and the different path of the replicated frames is only taken on a subsequent switch based on a different VLAN tag. So how could the XDP program differentiate between the different replicated frames if the egress_interface is the same?
>
> So my basic idea would be to add two (or more) DEVMAP entries with the same ifindex into the same map. And then either
>
> 1. Add several xdp/devmap progs to the same loaded bpf and reference them in the DEVMAP entry, like
>
> SEC("xdp/devmap")
> int replicate_postprocessing_first(struct xdp_md *pkt)
> {
>     int ret = change_vlan(pkt, 0, true);
>     ...
> }
>
> SEC("xdp/devmap")
> int replicate_postprocessing_second(struct xdp_md *pkt)
> {
>     int ret = change_vlan(pkt, 1, true);
>     ...
> }
>
> This, however, would be quite unflexible.

Having multiple entries in the devmap entry corresponds roughly to how
the stack handles VLANs. I.e., when configuring a VLAN, you create a new
netdevice (which you would then put into the devmap). Unfortunately, XDP
doesn't really know how to deal with stacked devices like VLANs, so you
can't actually add a VLAN device into a devmap. But creating an
interface for this would be one way of dealing with a situation like
this, without having to hardcode things into a BPF program.

> 2. Load the same bpf several times without attaching it to an
> interface and set e.g. a const to a different value after loading.

This would work, I think. Something like:

static volatile const vlan_id = 1;

SEC("xdp/devmap")
int replicate_postprocessing_second(struct xdp_md *pkt)
{
    int ret = change_vlan(pkt, vlan_id, true);
    ...
}

and then the loader would replace the value of vlan_id before loading;
using skeletons this would look something like:

skel = xdp_program_skeleton__open();
skel->rodata->vlan_id = 2;
xdp_program_skeleton__load();

/* attach to devmap */

> But can I even reference a xdp/devmap prog from a different loaded
> bpf, especially when it is not attached?

Why do you need to reference it from a different BPF program? The
userspace program just attaches it to the right devmap entry?

> 3. Extend the kernel with a way to let the xdp/devmap prog know from
> which DEVMAP entry its execution originates (like an additional entry
> in the bpf_devmap_val that is then set in the xdp_md).

This could be useful in any case, so I would personally be fine with
adding something like this (for both devmap and cpumap) :)

-Toke


