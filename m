Return-Path: <xdp-newbies+bounces-143-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B57974E71
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 11:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80E81B21B24
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 09:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196D215E5B8;
	Wed, 11 Sep 2024 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ajpMyN9I"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0814EC59
	for <xdp-newbies@vger.kernel.org>; Wed, 11 Sep 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726046746; cv=none; b=HiLDoXDsHtHfAg1ngdKod1yY3Rp216Kc9n/+ffYDNn3cObLNkG7uYGrLhrBNKPHi35fd5tJqqseC3vHKSE7koQfMZFT/LjsS6RASIxfLHgVW39yvtMFWVmXbU7fXqTLlwO9FOJbwPFe3Dml7vkAY/aAQBlaVMVDmU1DHfw2vVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726046746; c=relaxed/simple;
	bh=/5Yv034N0+269E3tISw/MhNjR68b+NBSBxKDFJqLkuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nBst58buPfl/ot4mOgUcZL5QGmBxuepXnIN8aJPmA4rZuEiE/DdHun8dEsI9d3Wuk9oiMBIDGSsikmw/QgnrIFZctQIfOdbwr67n3zDCi3ig6PVhQq3U5wtIqUf/n1vHte3oB6hZsBRMGPOfITAGrI6WN7PDyXLEKXilGIOYrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ajpMyN9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726046743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsuvRxksm0L1hDJW3aBh0QvOAi0rqzeWtG9TboAY7Y4=;
	b=ajpMyN9IYw40IWBgfVIHnCqKUJ0umFrWpqi5PI2k1fZhbgigoMiOkAtZQi8dwvvFbJn164
	OEjkbDtKtwWuo5K5tszL4DZMNaNwKK+xwh1KSfvHcTyzWmdBJfM41LCmR05U/pLmg9zBPz
	/yDrtHa3EUi5ejaM9ARmtq/YIvB1ULs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-bOXNwT_6N5KsOatLqzjDnw-1; Wed, 11 Sep 2024 05:25:42 -0400
X-MC-Unique: bOXNwT_6N5KsOatLqzjDnw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8d3085ab6fso226219666b.0
        for <xdp-newbies@vger.kernel.org>; Wed, 11 Sep 2024 02:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726046741; x=1726651541;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsuvRxksm0L1hDJW3aBh0QvOAi0rqzeWtG9TboAY7Y4=;
        b=T0/ouXMogQxbm0JoKfB6AS6t0c+TbS+xuucujFVOWJkKxkn2M5oPS0BgORXj+/Cx3n
         MLbvUCa+4nkEOiEgGwKqoO/hlSKaNk9ugUa3Uj5bhnhsH9a2t5kinnnpKG/k1vRQa65M
         KyerOpMydSm+St2hgqRzPm6xhWnLnIzfc/M0XmpaBQqzwygqH7nBElN83QHBntZ4S7H/
         nDU1KL/zDRVDsme4BBiPUmO+9QGsUYiD1DMXPND0Sg1MlcFMaJ5BsDoas9JNfn3/GiH3
         5R9F9CaxDB0M6lZjLFjIA0o8/40lhPM7eB/BFbVhyJ5WuBZhH+KMSrKI0HOHlCpPKDgS
         CSAw==
X-Forwarded-Encrypted: i=1; AJvYcCU4BKYqp9vmipB3dvuzL7laxKk+tBE8mTbcoCFu2h89H487owQWgh/uXwUFsKeDm+4bGtQYO+6SlpK9Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SNNkzVHaiO09CKOkz3rUZ/E/WP5QZZhFgECepzwv9dF0d1e1
	fF92qi1N5/Bvfg1LpkZEPgxv9Vi+cBfuuV+xvAC/vVQ6nq+Ofz5GEsNe9gwx7oBevG379hjKX92
	eCMq3tlQ8+K+qYbzYcChfLZyCkAjtsaGRJh1R/w/tqSMyvzsPoSK0bu106oOM
X-Received: by 2002:a17:907:8688:b0:a8a:86f8:4eed with SMTP id a640c23a62f3a-a8ffaa92959mr335068266b.10.1726046741087;
        Wed, 11 Sep 2024 02:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcR53mLJOm6Z5mprw2wHqsWADlsjwEhsRn2jpuEb9Na59TrM/7vBeMhbnFjnzHuTgklLSlBA==
X-Received: by 2002:a17:907:8688:b0:a8a:86f8:4eed with SMTP id a640c23a62f3a-a8ffaa92959mr335059966b.10.1726046739937;
        Wed, 11 Sep 2024 02:25:39 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c80a24sm592575966b.137.2024.09.11.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:25:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9BB69152C4FC; Wed, 11 Sep 2024 11:25:37 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Florian Kauer <florian.kauer@linutronix.de>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 xdp-newbies@vger.kernel.org
Subject: Re: [PATCH] bpf: devmap: allow for repeated redirect
In-Reply-To: <098b5603-0feb-4013-a9ee-8d1c8edaf4f8@linutronix.de>
References: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
 <87o74vewko.fsf@toke.dk>
 <098b5603-0feb-4013-a9ee-8d1c8edaf4f8@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 11 Sep 2024 11:25:37 +0200
Message-ID: <877cbiee3y.fsf@toke.dk>
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
>
> On 9/10/24 10:34, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>> Currently, returning XDP_REDIRECT from a xdp/devmap program
>>> is considered as invalid action and an exception is traced.
>>>
>>> While it might seem counterintuitive to redirect in a xdp/devmap
>>> program (why not just redirect to the correct interface in the
>>> first program?), we faced several use cases where supporting
>>> this would be very useful.
>>>
>>> Most importantly, they occur when the first redirect is used
>>> with the BPF_F_BROADCAST flag. Using this together with xdp/devmap
>>> programs, enables to perform different actions on clones of
>>> the same incoming frame. In that case, it is often useful
>>> to redirect either to a different CPU or device AFTER the cloning.
>>>
>>> For example:
>>> - Replicate the frame (for redundancy according to IEEE 802.1CB FRER)
>>>   and then use the second redirect with a cpumap to select
>>>   the path-specific egress queue.
>>>
>>> - Also, one of the paths might need an encapsulation that
>>>   exceeds the MTU. So a second redirect can be used back
>>>   to the ingress interface to send an ICMP FRAG_NEEDED packet.
>>>
>>> - For OAM purposes, you might want to send one frame with
>>>   OAM information back, while the original frame in passed forward.
>>>
>>> To enable these use cases, add the XDP_REDIRECT case to
>>> dev_map_bpf_prog_run. Also, when this is called from inside
>>> xdp_do_flush, the redirect might add further entries to the
>>> flush lists that are currently processed. Therefore, loop inside
>>> xdp_do_flush until no more additional redirects were added.
>>>
>>> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
>>=20
>> This is an interesting use case! However, your implementation makes it
>> way to easy to end up in a situation that loops forever, so I think we
>> should add some protection against that. Some details below:
>>=20
>>> ---
>>>  include/linux/bpf.h        |  4 ++--
>>>  include/trace/events/xdp.h | 10 ++++++----
>>>  kernel/bpf/devmap.c        | 37 +++++++++++++++++++++++++++--------
>>>  net/core/filter.c          | 48 +++++++++++++++++++++++++++-----------=
--------
>>>  4 files changed, 65 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>>> index 3b94ec161e8c..1b57cbabf199 100644
>>> --- a/include/linux/bpf.h
>>> +++ b/include/linux/bpf.h
>>> @@ -2498,7 +2498,7 @@ struct sk_buff;
>>>  struct bpf_dtab_netdev;
>>>  struct bpf_cpu_map_entry;
>>>=20=20
>>> -void __dev_flush(struct list_head *flush_list);
>>> +void __dev_flush(struct list_head *flush_list, int *redirects);
>>>  int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>>>  		    struct net_device *dev_rx);
>>>  int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_frame *xdp=
f,
>>> @@ -2740,7 +2740,7 @@ static inline struct bpf_token *bpf_token_get_fro=
m_fd(u32 ufd)
>>>  	return ERR_PTR(-EOPNOTSUPP);
>>>  }
>>>=20=20
>>> -static inline void __dev_flush(struct list_head *flush_list)
>>> +static inline void __dev_flush(struct list_head *flush_list, int *redi=
rects)
>>>  {
>>>  }
>>>=20=20
>>> diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
>>> index a7e5452b5d21..fba2c457e727 100644
>>> --- a/include/trace/events/xdp.h
>>> +++ b/include/trace/events/xdp.h
>>> @@ -269,9 +269,9 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>=20=20
>>>  	TP_PROTO(const struct net_device *from_dev,
>>>  		 const struct net_device *to_dev,
>>> -		 int sent, int drops, int err),
>>> +		 int sent, int drops, int redirects, int err),
>>>=20=20
>>> -	TP_ARGS(from_dev, to_dev, sent, drops, err),
>>> +	TP_ARGS(from_dev, to_dev, sent, drops, redirects, err),
>>>=20=20
>>>  	TP_STRUCT__entry(
>>>  		__field(int, from_ifindex)
>>> @@ -279,6 +279,7 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>  		__field(int, to_ifindex)
>>>  		__field(int, drops)
>>>  		__field(int, sent)
>>> +		__field(int, redirects)
>>>  		__field(int, err)
>>>  	),
>>>=20=20
>>> @@ -288,16 +289,17 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>  		__entry->to_ifindex	=3D to_dev->ifindex;
>>>  		__entry->drops		=3D drops;
>>>  		__entry->sent		=3D sent;
>>> +		__entry->redirects	=3D redirects;
>>>  		__entry->err		=3D err;
>>>  	),
>>>=20=20
>>>  	TP_printk("ndo_xdp_xmit"
>>>  		  " from_ifindex=3D%d to_ifindex=3D%d action=3D%s"
>>> -		  " sent=3D%d drops=3D%d"
>>> +		  " sent=3D%d drops=3D%d redirects=3D%d"
>>>  		  " err=3D%d",
>>>  		  __entry->from_ifindex, __entry->to_ifindex,
>>>  		  __print_symbolic(__entry->act, __XDP_ACT_SYM_TAB),
>>> -		  __entry->sent, __entry->drops,
>>> +		  __entry->sent, __entry->drops, __entry->redirects,
>>>  		  __entry->err)
>>>  );
>>>=20=20
>>> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
>>> index 7878be18e9d2..89bdec49ea40 100644
>>> --- a/kernel/bpf/devmap.c
>>> +++ b/kernel/bpf/devmap.c
>>> @@ -334,7 +334,8 @@ static int dev_map_hash_get_next_key(struct bpf_map=
 *map, void *key,
>>>  static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>>>  				struct xdp_frame **frames, int n,
>>>  				struct net_device *tx_dev,
>>> -				struct net_device *rx_dev)
>>> +				struct net_device *rx_dev,
>>> +				int *redirects)
>>>  {
>>>  	struct xdp_txq_info txq =3D { .dev =3D tx_dev };
>>>  	struct xdp_rxq_info rxq =3D { .dev =3D rx_dev };
>>> @@ -359,6 +360,13 @@ static int dev_map_bpf_prog_run(struct bpf_prog *x=
dp_prog,
>>>  			else
>>>  				frames[nframes++] =3D xdpf;
>>>  			break;
>>> +		case XDP_REDIRECT:
>>> +			err =3D xdp_do_redirect(rx_dev, &xdp, xdp_prog);
>>> +			if (unlikely(err))
>>> +				xdp_return_frame_rx_napi(xdpf);
>>> +			else
>>> +				*redirects +=3D 1;
>>> +			break;
>>=20
>> It's a bit subtle, but dev_map_bpf_prog_run() also filters the list of
>> frames in the queue in-place (the frames[nframes++] =3D xdpf; line above=
),
>> which only works under the assumption that the array in bq->q is not
>> modified while this loop is being run. But now you're adding a call in
>> the middle that may result in the packet being put back on the same
>> queue in the middle, which means that this assumption no longer holds.
>>=20
>> So you need to clear the bq->q queue first for this to work.
>> Specifically, at the start of bq_xmit_all(), you'll need to first copy
>> all the packet pointer onto an on-stack array, then run the rest of the
>> function on that array. There's already an initial loop that goes
>> through all the frames, so you can just do it there.
>>=20
>> So the loop at the start of bq_xmit_all() goes from the current:
>>=20
>> 	for (i =3D 0; i < cnt; i++) {
>> 		struct xdp_frame *xdpf =3D bq->q[i];
>>=20
>> 		prefetch(xdpf);
>> 	}
>>=20
>>=20
>> to something like:
>>=20
>>         struct xdp_frame *frames[DEV_MAP_BULK_SIZE];
>>=20
>> 	for (i =3D 0; i < cnt; i++) {
>> 		struct xdp_frame *xdpf =3D bq->q[i];
>>=20
>> 		prefetch(xdpf);
>>                 frames[i] =3D xdpf;
>> 	}
>>=20
>>         bq->count =3D 0; /* bq is now empty, use the 'frames' and 'cnt'
>>                           stack variables for the rest of the function */
>>=20
>>=20
>>=20
>>>  		default:
>>>  			bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
>>>  			fallthrough;
>>> @@ -373,7 +381,7 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xd=
p_prog,
>>>  	return nframes; /* sent frames count */
>>>  }
>>>=20=20
>>> -static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>>> +static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags, int =
*redirects)
>>>  {
>>>  	struct net_device *dev =3D bq->dev;
>>>  	unsigned int cnt =3D bq->count;
>>> @@ -390,8 +398,10 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue =
*bq, u32 flags)
>>>  		prefetch(xdpf);
>>>  	}
>>>=20=20
>>> +	int new_redirects =3D 0;
>>>  	if (bq->xdp_prog) {
>>> -		to_send =3D dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->=
dev_rx);
>>> +		to_send =3D dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->=
dev_rx,
>>> +				&new_redirects);
>>>  		if (!to_send)
>>>  			goto out;
>>>  	}
>>> @@ -413,19 +423,21 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue=
 *bq, u32 flags)
>>>=20=20
>>>  out:
>>>  	bq->count =3D 0;
>>> -	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent, err);
>>> +	*redirects +=3D new_redirects;
>>> +	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent - new_redirec=
ts,
>>> +			new_redirects, err);
>>>  }
>>>=20=20
>>>  /* __dev_flush is called from xdp_do_flush() which _must_ be signalled=
 from the
>>>   * driver before returning from its napi->poll() routine. See the comm=
ent above
>>>   * xdp_do_flush() in filter.c.
>>>   */
>>> -void __dev_flush(struct list_head *flush_list)
>>> +void __dev_flush(struct list_head *flush_list, int *redirects)
>>>  {
>>>  	struct xdp_dev_bulk_queue *bq, *tmp;
>>>=20=20
>>>  	list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
>>> -		bq_xmit_all(bq, XDP_XMIT_FLUSH);
>>> +		bq_xmit_all(bq, XDP_XMIT_FLUSH, redirects);
>>>  		bq->dev_rx =3D NULL;
>>>  		bq->xdp_prog =3D NULL;
>>>  		__list_del_clearprev(&bq->flush_node);
>>> @@ -458,8 +470,17 @@ static void bq_enqueue(struct net_device *dev, str=
uct xdp_frame *xdpf,
>>>  {
>>>  	struct xdp_dev_bulk_queue *bq =3D this_cpu_ptr(dev->xdp_bulkq);
>>>=20=20
>>> -	if (unlikely(bq->count =3D=3D DEV_MAP_BULK_SIZE))
>>> -		bq_xmit_all(bq, 0);
>>> +	if (unlikely(bq->count =3D=3D DEV_MAP_BULK_SIZE)) {
>>> +		int redirects =3D 0;
>>> +
>>> +		bq_xmit_all(bq, 0, &redirects);
>>> +
>>> +		/* according to comment above xdp_do_flush() in
>>> +		 * filter.c, xdp_do_flush is always called at
>>> +		 * the end of the NAPI anyway, so no need to act
>>> +		 * on the redirects here
>>> +		 */
>>=20
>> While it's true that it will be called again in NAPI, the purpose of
>> calling bq_xmit_all() here is to make room space for the packet on the
>> bulk queue that we're about to enqueue, and if bq_xmit_all() can just
>> put the packet back on the queue, there is no guarantee that this will
>> succeed. So you will have to handle that case here.
>>=20
>> Since there's also a potential infinite recursion issue in the
>> do_flush() functions below, I think it may be better to handle this
>> looping issue inside bq_xmit_all().
>>=20
>> I.e., structure the code so that bq_xmit_all() guarantees that when it
>> returns it has actually done its job; that is, that bq->q is empty.
>>=20
>> Given the above "move all frames out of bq->q at the start" change, this
>> is not all that hard. Simply add a check after the out: label (in
>> bq_xmit_all()) to check if bq->count is actually 0, and if it isn't,
>> start over from the beginning of that function. This also makes it
>> straight forward to add a recursion limit; after looping a set number of
>> times (say, XMIT_RECURSION_LIMIT), simply turn XDP_REDIRECT into drops.
>>=20
>> There will need to be some additional protection against looping forever
>> in __dev_flush(), to handle the case where a packet is looped between
>> two interfaces. This one is a bit trickier, but a similar recursion
>> counter could be used, I think.
>
>
> Thanks a lot for the extensive support!
> Regarding __dev_flush(), could the following already be sufficient?
>
> void __dev_flush(struct list_head *flush_list)
> {
>         struct xdp_dev_bulk_queue *bq, *tmp;
>         int i,j;
>
>         for (i =3D 0; !list_empty(flush_list) && i < XMIT_RECURSION_LIMIT=
; i++) {
>                 /* go through list in reverse so that new items
>                  * added to the flush_list will only be handled
>                  * in the next iteration of the outer loop
>                  */
>                 list_for_each_entry_safe_reverse(bq, tmp, flush_list, flu=
sh_node) {
>                         bq_xmit_all(bq, XDP_XMIT_FLUSH);
>                         bq->dev_rx =3D NULL;
>                         bq->xdp_prog =3D NULL;
>                         __list_del_clearprev(&bq->flush_node);
>                 }
>         }
>
>         if (i =3D=3D XMIT_RECURSION_LIMIT) {
>                 pr_warn("XDP recursion limit hit, expect packet loss!\n");
>
>                 list_for_each_entry_safe(bq, tmp, flush_list, flush_node)=
 {
>                         for (j =3D 0; j < bq->count; j++)
>                                 xdp_return_frame_rx_napi(bq->q[i]);
>
>                         bq->count =3D 0;
>                         bq->dev_rx =3D NULL;
>                         bq->xdp_prog =3D NULL;
>                         __list_del_clearprev(&bq->flush_node);
>                 }
>         }
> }

Yeah, this would work, I think (neat trick with iterating the list in
reverse!), but instead of the extra loop in the end, I would suggest
passing in an extra 'allow_redirect' parameter to bq_xmit_all(). Since
you'll already have to handle the recursion limit inside that function,
you can just reuse the same functionality by passing in the parameter in
the last iteration of the first loop.

Also, definitely don't put an unconditional warn_on() in the fast path -
that brings down the system really quickly if it's misconfigured :)

A warn_on_once() could work, but really I would suggest just reusing the
_trace_xdp_redirect_map_err() tracepoint with a new error code (just has
to be one we're not currently using and that vaguely resembles what this
is about; ELOOP, EOVERFLOW or EDEADLOCK, maybe?).

>> In any case, this needs extensive selftests, including ones with devmap
>> programs that loop packets (both redirect from a->a, and from
>> a->b->a->b) to make sure the limits work correctly.
>
>
> Good point! I am going to prepare some.
>
>
>>=20
>>> +	}
>>>=20=20
>>>  	/* Ingress dev_rx will be the same for all xdp_frame's in
>>>  	 * bulk_queue, because bq stored per-CPU and must be flushed
>>> diff --git a/net/core/filter.c b/net/core/filter.c
>>> index 8569cd2482ee..b33fc0b1444a 100644
>>> --- a/net/core/filter.c
>>> +++ b/net/core/filter.c
>>> @@ -4287,14 +4287,18 @@ static const struct bpf_func_proto bpf_xdp_adju=
st_meta_proto =3D {
>>>  void xdp_do_flush(void)
>>>  {
>>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>>> +	int redirect;
>>>=20=20
>>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>> -	if (lh_dev)
>>> -		__dev_flush(lh_dev);
>>> -	if (lh_map)
>>> -		__cpu_map_flush(lh_map);
>>> -	if (lh_xsk)
>>> -		__xsk_map_flush(lh_xsk);
>>> +	do {
>>> +		redirect =3D 0;
>>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>> +		if (lh_dev)
>>> +			__dev_flush(lh_dev, &redirect);
>>> +		if (lh_map)
>>> +			__cpu_map_flush(lh_map);
>>> +		if (lh_xsk)
>>> +			__xsk_map_flush(lh_xsk);
>>> +	} while (redirect > 0);
>>>  }
>>>  EXPORT_SYMBOL_GPL(xdp_do_flush);
>>>=20=20
>>> @@ -4303,20 +4307,24 @@ void xdp_do_check_flushed(struct napi_struct *n=
api)
>>>  {
>>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>>>  	bool missed =3D false;
>>> +	int redirect;
>>>=20=20
>>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>> -	if (lh_dev) {
>>> -		__dev_flush(lh_dev);
>>> -		missed =3D true;
>>> -	}
>>> -	if (lh_map) {
>>> -		__cpu_map_flush(lh_map);
>>> -		missed =3D true;
>>> -	}
>>> -	if (lh_xsk) {
>>> -		__xsk_map_flush(lh_xsk);
>>> -		missed =3D true;
>>> -	}
>>> +	do {
>>> +		redirect =3D 0;
>>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>> +		if (lh_dev) {
>>> +			__dev_flush(lh_dev, &redirect);
>>> +			missed =3D true;
>>> +		}
>>> +		if (lh_map) {
>>> +			__cpu_map_flush(lh_map);
>>> +			missed =3D true;
>>> +		}
>>> +		if (lh_xsk) {
>>> +			__xsk_map_flush(lh_xsk);
>>> +			missed =3D true;
>>> +		}
>>> +	} while (redirect > 0);
>>=20
>> With the change suggested above (so that bq_xmit_all() guarantees the
>> flush is completely done), this looping is not needed anymore. However,
>> it becomes important in which *order* the flushing is done
>> (__dev_flush() should always happen first), so adding a comment to note
>> this would be good.
>
>
> I guess, if we remove the loop here and we still want to cover the case of
> redirecting from devmap program via cpumap, we need to fetch the lh_map a=
gain
> after calling __dev_flush, right?
> So I think we should no longer use bpf_net_ctx_get_all_used_flush_lists t=
hen:
>
>         lh_dev =3D bpf_net_ctx_get_dev_flush_list();
>         if (lh_dev)
>                 __dev_flush(lh_dev);
>         lh_map =3D bpf_net_ctx_get_cpu_map_flush_list();
>         if (lh_map)
>                 __cpu_map_flush(lh_map);
>         lh_xsk =3D bpf_net_ctx_get_xskmap_flush_list();
>         if (lh_xsk)
>                 __xsk_map_flush(lh_xsk);
>
> But bpf_net_ctx_get_all_used_flush_lists also includes additional checks
> for IS_ENABLED(CONFIG_BPF_SYSCALL) and IS_ENABLED(CONFIG_XDP_SOCKETS),
> so I guess they should be directly included in the xdp_do_flush and
> xdp_do_check_flushed?
> Then we could remove the bpf_net_ctx_get_all_used_flush_lists.
> Or do you have an idea for a more elegant solution?

I think cpumap is fine because that doesn't immediately redirect back to
the bulk queue; instead __cpu_map_flush() will put the frames on a
per-CPU ring buffer and wake the kworker on that CPU. Which will in turn
do another xdp_do_flush() if the cpumap program does a redirect. So in
other words, we only need to handle recursion of devmap redirects :)

-Toke


