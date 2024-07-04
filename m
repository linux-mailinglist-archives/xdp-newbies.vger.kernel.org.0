Return-Path: <xdp-newbies+bounces-101-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512C927605
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 14:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738341F24090
	for <lists+xdp-newbies@lfdr.de>; Thu,  4 Jul 2024 12:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358381AD9DE;
	Thu,  4 Jul 2024 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFaqepfb"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C61AAE3B
	for <xdp-newbies@vger.kernel.org>; Thu,  4 Jul 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720096211; cv=none; b=K0JsypoIcEgzpRsWcKzqOR1yqvXp9cz07mIleatrHz3mlT78Zcumfy7ljHZQr+LC6kZTylTwCNLIU/rdIc0eTzThN9FJrW3eM0M4WbFs7P44U2VU6mQ/zfS6htfrhpOR51cFIJYRgHEDhzeORDNWDDYaORzWUMueGvvFQjKQAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720096211; c=relaxed/simple;
	bh=hN6ZgXzFh9Tx3bXsDAah7G7f9ZLaI2VMPf+iygQV/+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iv+PldO7khM352TUg4JRQMbPf1xtBAfH9ZZI8TrXchkkVlw5FD1INWVi1GmIrSoNd0k5RdONU3jk7JYhgF1owf53zvGG4D8ssCTc5RLOkFar3znwaJutCI7uWf+t5rIMKWUV/CY+LJMv/vw5gwq51PgISSNh66uUHgFRw+svucU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFaqepfb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720096208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKtq9iJtPN3bvjKF1yqxiDj3BAV6IpAvL+50ujAN5Q=;
	b=WFaqepfbNFajCU5GDzcaARFfeRc5Hm7vvldqg0SkgbbbV3kWFFjrd/oMEYNlJD5+QVA+XY
	/bOYgriifLagIgGEqgnJclDi5Kg2coWjUnjqX4Vv9Ga6izJVB4QIlD2Qd+fSR4lCTfHEQM
	RMfBbANwBECmtWkkWaPNEyDaEDW9RjE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-23sQovGFP2KnG0GRvWZKZg-1; Thu, 04 Jul 2024 08:30:06 -0400
X-MC-Unique: 23sQovGFP2KnG0GRvWZKZg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52e9a575353so680785e87.3
        for <xdp-newbies@vger.kernel.org>; Thu, 04 Jul 2024 05:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096205; x=1720701005;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TKtq9iJtPN3bvjKF1yqxiDj3BAV6IpAvL+50ujAN5Q=;
        b=Hu00VMacPKIQn4F0juM4u6nsotoeLzdMZwdNDRRd1+Saz1fmwICw/Q3/qEf8w1nRcC
         ll1GRoephcUBzxqTA+WoHXqK+IAzeMfNvFu1uYS1iBk5HvtifRnP8Iplp9SebOKOwYdt
         yj13jCutGC9ivHzkzgB2t1LitWvWktPt0dxqcQgoqPwp73BErxbWgh372sElg/LdIDPZ
         X1JGq0vLLq5eGsZNivWeT8th4qlZzd7Nlni4EYAQftMxMiuFrE5aGozNNVCwetgXvSHD
         itM8JCQDqlLDwHaRC6pPfvXlay9zMuWfCmsUWI0P6D8GCFEcKHqZlpOI1aN8zxkWie3Z
         cyJA==
X-Forwarded-Encrypted: i=1; AJvYcCWeBxYZqqUS4XSduGxKfaKe/bxQWQqDKE2QwrN9yQazEw0V0xUHGa/FdLMctfcrZ4nUdTuKG02GsbmDlTCaQ9qEnBVOFuvvUYaNZ0k=
X-Gm-Message-State: AOJu0YzMrW83HaH4EtT3+7bC2U983SlcZIsylsxClPZXal4vDtAUXN0P
	0TH4bK9HnqGgPJkkY1uPYaxz65wpWLZfMSch+/I+6V1SkdQKNOSbOoXxRFOKb8ZWmJn/gOmcOyT
	yckj9wrTN0rpjJHV/qAyLoya/jZyVU14SEBl6a+AlJKd6Wxo43xgDmNFL6tC+
X-Received: by 2002:ac2:4306:0:b0:52e:933c:5a18 with SMTP id 2adb3069b0e04-52ea06e49ffmr1069198e87.56.1720096205171;
        Thu, 04 Jul 2024 05:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTVaBDg9RgDKPz8Ys5aaiW8wi4iM0qhRYOG14l1aab7lyqvnnM8y/nOqdh41ZYXscdbozC8A==
X-Received: by 2002:ac2:4306:0:b0:52e:933c:5a18 with SMTP id 2adb3069b0e04-52ea06e49ffmr1069167e87.56.1720096204723;
        Thu, 04 Jul 2024 05:30:04 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d169dsm23232295e9.5.2024.07.04.05.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:30:03 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DDED613FDB4B; Thu, 04 Jul 2024 14:30:02 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, xdp-newbies@vger.kernel.org
Cc: Ferenc Fejes <ferenc.fejes@ericsson.com>
Subject: Re: Different packet handling after bpf_redirect_map with
 BPF_F_BROADCAST
In-Reply-To: <81d6605e-f28f-4457-81f8-5f8b4b33e8ff@linutronix.de>
References: <5eb6070c-a12e-4d4c-a9f0-a6a6fafa41d1@linutronix.de>
 <87msmx1k0j.fsf@toke.dk>
 <81d6605e-f28f-4457-81f8-5f8b4b33e8ff@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 04 Jul 2024 14:30:02 +0200
Message-ID: <87ed891gs5.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Florian Kauer <florian.kauer@linutronix.de> writes:

> Hi Toke,
> thanks a lot for the prompt response!
>
> On 7/4/24 13:20, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>> Hi,
>>> we are currently using bpf_redirect_map with BPF_F_BROADCAST to replica=
te frames for sending traffic over redundant paths.
>>>
>>> See for example https://www.rfc-editor.org/rfc/rfc8655.html#section-3.2=
.2.2 for background
>>> and https://github.com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325=
f0e77df3020526ad992aff/src/xdpfrer.bpf.c#L393 for the current implementatio=
n.
>>>
>>> However, we want to modify the frame after the replication. In the easi=
est case this means to change the VLAN tag to route the traffic over differ=
ent VLANs. This is currently done by taking a different egress_ifindex into=
 account after the replication and that works well so far ( https://github.=
com/EricssonResearch/xdpfrer/blob/5f0845cb2e4c4da325f0e77df3020526ad992aff/=
src/xdpfrer.bpf.c#L399 ).
>>>
>>> BUT there are cases where the egress_interface for both replicated pack=
ets shall be the same and the different path of the replicated frames is on=
ly taken on a subsequent switch based on a different VLAN tag. So how could=
 the XDP program differentiate between the different replicated frames if t=
he egress_interface is the same?
>>>
>>> So my basic idea would be to add two (or more) DEVMAP entries with the =
same ifindex into the same map. And then either
>>>
>>> 1. Add several xdp/devmap progs to the same loaded bpf and reference th=
em in the DEVMAP entry, like
>>>
>>> SEC("xdp/devmap")
>>> int replicate_postprocessing_first(struct xdp_md *pkt)
>>> {
>>>     int ret =3D change_vlan(pkt, 0, true);
>>>     ...
>>> }
>>>
>>> SEC("xdp/devmap")
>>> int replicate_postprocessing_second(struct xdp_md *pkt)
>>> {
>>>     int ret =3D change_vlan(pkt, 1, true);
>>>     ...
>>> }
>>>
>>> This, however, would be quite unflexible.
>>=20
>> Having multiple entries in the devmap entry corresponds roughly to how
>> the stack handles VLANs. I.e., when configuring a VLAN, you create a new
>> netdevice (which you would then put into the devmap). Unfortunately, XDP
>> doesn't really know how to deal with stacked devices like VLANs, so you
>> can't actually add a VLAN device into a devmap. But creating an
>> interface for this would be one way of dealing with a situation like
>> this, without having to hardcode things into a BPF program.
>
> I see. That would be very nice in general, but for our specific applicati=
on
> likely still to unflexible to refer to a different VLAN interface
> (e.g. in addition to changing the VLAN tag we also might want to
> add/remove/modify MPLS labels and other headers).

Yeah, part of the reason this stacked device support never materialised
is that the way the kernel handles it requires a lot of indirection
(MPLS+VLAN would be two stacked devices on top of each other, say), and
for XDP you probably want to short-circuit this anyway. So that means
rolling your own abstraction here; but you can do that with the custom
devmap approach :)

>>> 2. Load the same bpf several times without attaching it to an
>>> interface and set e.g. a const to a different value after loading.
>>=20
>> This would work, I think. Something like:
>>=20
>> static volatile const vlan_id =3D 1;
>>=20
>> SEC("xdp/devmap")
>> int replicate_postprocessing_second(struct xdp_md *pkt)
>> {
>>     int ret =3D change_vlan(pkt, vlan_id, true);
>>     ...
>> }
>>=20
>> and then the loader would replace the value of vlan_id before loading;
>> using skeletons this would look something like:
>>=20
>> skel =3D xdp_program_skeleton__open();
>> skel->rodata->vlan_id =3D 2;
>> xdp_program_skeleton__load();
>>=20
>> /* attach to devmap */
>
> Yes, that is exactly what I was imagining, thanks!
>
>>=20
>>> But can I even reference a xdp/devmap prog from a different loaded
>>> bpf, especially when it is not attached?
>>=20
>> Why do you need to reference it from a different BPF program? The
>> userspace program just attaches it to the right devmap entry?
>
> What I wanted to imply with this is that the lifetime of the different BPF
> programs is unclear to me. So AFAIK (but I might be totally wrong) an
> XDP program has the lifetime of the process that loaded the program
> (i.e. called xdp_program_skeleton__load()) so it is destroyed/unloaded
> as soon as the process ends, UNLESS it is explicitly attached to an inter=
face
> by which it inherits the lifetime of the interface it was attached to
> (i.e. might outlive the loading process).
>
> If I do what you sketched above, where we do not attach the program expli=
citly
> to an interface but only directly to the devmap, does it then inherit the
> lifetime of the interface of the BPF program the devmap belongs to or is
> it destroyed as soon as the loading process end?

Ah, right. Devmap attachment works similar to netlink attachment to an
interface: you pass in an fd as part of the bpf_map_update() from
userspace, and the devmap takes a reference on the BPF program when
inserting it into the map. So the BPF program inserted this way stays
alive as long as the map does, unless it is explicitly removed by
another bpf_map_update().

Normally, the map itself will be referenced by the XDP program running
on ingress, so as long as that stays attached, the map will stay alive.
And when the (ingress) XDP program is removed, it will release its
reference on the map, which in turn will cause the map to release all
references to other BPF programs inserted into it.

So in other words, there is no direct reference between the two XDP
programs, but things should mostly keep working the way you expect them
to...

>>> 3. Extend the kernel with a way to let the xdp/devmap prog know from
>>> which DEVMAP entry its execution originates (like an additional entry
>>> in the bpf_devmap_val that is then set in the xdp_md).
>>=20
>> This could be useful in any case, so I would personally be fine with
>> adding something like this (for both devmap and cpumap) :)
>
> Would you prefer a simple u32 (or similar) that could then be used as
> index for an array or a more complex data structure/void* to fill
> with arbitrary data?

Well, the API for map indexing specifies a u64 map index, so just
reusing that would be the simplest :)

-Toke


