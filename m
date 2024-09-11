Return-Path: <xdp-newbies+bounces-145-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E397550F
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 16:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2254B1F24163
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C1B19DF85;
	Wed, 11 Sep 2024 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eH0/mRoP"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07756187543
	for <xdp-newbies@vger.kernel.org>; Wed, 11 Sep 2024 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726064074; cv=none; b=mWWB2VUmXhiC95UGDtZVacAt89aTcRVDWtepea80mkR0AfJYkcPREBpjdqVl3lcNH4nu05zlKFCSjg/k/Zc7zOg+wMJMdrgTc7bbQRF1b/2K+yH05p49YRv/m0VdevpXS1m1sXTx8v5kVGHh79YpdRv6jq8vX1cmcqgwwpCZxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726064074; c=relaxed/simple;
	bh=TUc1KU1MznrzkuTWKQ5eAxqyDQii8n9dhK3yZQ9zBSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g7RynXAAIL588TXw9F3/9Zm/CTD21Dt+3O5kC63/qGUSj4ektCOLahRhUw3YID1qZ0tRsH5LY6rDWNMrvGe2Fzyq30C0PW66NR3qt/JyZgsRYZ7w7Lk4nHT4a4TBhIHo06obx5avuIxIgVY14zOZz7Sm1HczMobVbVUUEO3VN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eH0/mRoP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726064070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niG1SRTvrtaYVmXDD+x0Lv431jhZ7HP+deUzZrsxCVM=;
	b=eH0/mRoPxdEmm17m4rvpC5jgRGS5ZyRB89QU9XIszXVSoIiS1PyDbCdqz2Zee5B9BLYVVd
	dZYWKKrcqXPv/nUlGHFJHRtRMgdo7a9WUY9gkjY3luTZngKJTtv75Kwylle683luz5raLK
	Vyp4oM0ZxZyn2eoRw1bbPZvtAXvbJKE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-px6Nsu5APZS3qJXhzI_jng-1; Wed, 11 Sep 2024 10:14:28 -0400
X-MC-Unique: px6Nsu5APZS3qJXhzI_jng-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c25cf44030so4580931a12.0
        for <xdp-newbies@vger.kernel.org>; Wed, 11 Sep 2024 07:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726064067; x=1726668867;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niG1SRTvrtaYVmXDD+x0Lv431jhZ7HP+deUzZrsxCVM=;
        b=v/cB/rdVBCJbLwYvQM/nAQ8wv4ASI7s501bw2fneErGw2DtuBNgsRXimn0Bowam8/8
         1Iv/BhZ9JvWgcxOj4Ezb6YQCfQjH6Aat1cvX5SkhG/ny4U8eze1C/0s7CVCvUdtBKPZV
         SmiVwAjqv+ajZ2BWJXRTTh1YrRr8HHp8jAK0dpHSIXrRpwGkmfPv0ma6XoWQexZMh6x2
         GC+QxMUy6dsynr965PHq/r9eX1w5I+DtTw6J6wCP+6opWQdzwXQIIMgch5EZBf8YcllD
         PNBizMD8eY1ooPHWTVZYUIil7kDbGc/+f0reaxNW40UJ37IYqunziCN9FiTf4SVikbqm
         YxnA==
X-Forwarded-Encrypted: i=1; AJvYcCXtgYdrHsrpn9d5EBNZrcRfLLMLaURbjF9Aglx9BzX+37KJgDlbwSX0yL4BKtvR6iol6twbiDnjQTHjww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wvASl7NGoilTDs5Ga0BUmdEWB4pyhVAuxyxDlg7mDtVNJmgq
	QLa7QMn3yWtMEzaS9BrXiPg8MH7tpFsfbjEyep+JZ5VkaVj4UxsBs78/7g6g43gpjH11wdIFWMX
	t3+4oyStsOfC4OMDFwxfepL1/uisJyeBLoTdgi4SYVC6x6wEZ+KuXREcaSVRL
X-Received: by 2002:a05:6402:3596:b0:5c2:112f:aa77 with SMTP id 4fb4d7f45d1cf-5c3dc7c6f49mr16198953a12.31.1726064067145;
        Wed, 11 Sep 2024 07:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcxfrSTFiuJc4PQYb7wZ+3L9gcS01qdsW5TOGaLxsUChyXjaeKiLlD/bwsQqajw/Uv5XqzNw==
X-Received: by 2002:a05:6402:3596:b0:5c2:112f:aa77 with SMTP id 4fb4d7f45d1cf-5c3dc7c6f49mr16198881a12.31.1726064066145;
        Wed, 11 Sep 2024 07:14:26 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5215asm5491230a12.56.2024.09.11.07.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:14:25 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 95E09152C52E; Wed, 11 Sep 2024 16:14:24 +0200 (CEST)
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
In-Reply-To: <93a97de4-a93d-4d5b-841d-c2f95dcedb0f@linutronix.de>
References: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
 <87o74vewko.fsf@toke.dk>
 <098b5603-0feb-4013-a9ee-8d1c8edaf4f8@linutronix.de>
 <877cbiee3y.fsf@toke.dk>
 <93a97de4-a93d-4d5b-841d-c2f95dcedb0f@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 11 Sep 2024 16:14:24 +0200
Message-ID: <87ttemcm67.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Florian Kauer <florian.kauer@linutronix.de> writes:

> On 9/11/24 11:25, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>=20
>>> Hi Toke,
>>>
>>> On 9/10/24 10:34, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>>>> Florian Kauer <florian.kauer@linutronix.de> writes:
>>>>
>>>>> Currently, returning XDP_REDIRECT from a xdp/devmap program
>>>>> is considered as invalid action and an exception is traced.
>>>>>
>>>>> While it might seem counterintuitive to redirect in a xdp/devmap
>>>>> program (why not just redirect to the correct interface in the
>>>>> first program?), we faced several use cases where supporting
>>>>> this would be very useful.
>>>>>
>>>>> Most importantly, they occur when the first redirect is used
>>>>> with the BPF_F_BROADCAST flag. Using this together with xdp/devmap
>>>>> programs, enables to perform different actions on clones of
>>>>> the same incoming frame. In that case, it is often useful
>>>>> to redirect either to a different CPU or device AFTER the cloning.
>>>>>
>>>>> For example:
>>>>> - Replicate the frame (for redundancy according to IEEE 802.1CB FRER)
>>>>>   and then use the second redirect with a cpumap to select
>>>>>   the path-specific egress queue.
>>>>>
>>>>> - Also, one of the paths might need an encapsulation that
>>>>>   exceeds the MTU. So a second redirect can be used back
>>>>>   to the ingress interface to send an ICMP FRAG_NEEDED packet.
>>>>>
>>>>> - For OAM purposes, you might want to send one frame with
>>>>>   OAM information back, while the original frame in passed forward.
>>>>>
>>>>> To enable these use cases, add the XDP_REDIRECT case to
>>>>> dev_map_bpf_prog_run. Also, when this is called from inside
>>>>> xdp_do_flush, the redirect might add further entries to the
>>>>> flush lists that are currently processed. Therefore, loop inside
>>>>> xdp_do_flush until no more additional redirects were added.
>>>>>
>>>>> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
>>>>
>>>> This is an interesting use case! However, your implementation makes it
>>>> way to easy to end up in a situation that loops forever, so I think we
>>>> should add some protection against that. Some details below:
>>>>
>>>>> ---
>>>>>  include/linux/bpf.h        |  4 ++--
>>>>>  include/trace/events/xdp.h | 10 ++++++----
>>>>>  kernel/bpf/devmap.c        | 37 +++++++++++++++++++++++++++--------
>>>>>  net/core/filter.c          | 48 +++++++++++++++++++++++++++---------=
----------
>>>>>  4 files changed, 65 insertions(+), 34 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>>>>> index 3b94ec161e8c..1b57cbabf199 100644
>>>>> --- a/include/linux/bpf.h
>>>>> +++ b/include/linux/bpf.h
>>>>> @@ -2498,7 +2498,7 @@ struct sk_buff;
>>>>>  struct bpf_dtab_netdev;
>>>>>  struct bpf_cpu_map_entry;
>>>>>=20=20
>>>>> -void __dev_flush(struct list_head *flush_list);
>>>>> +void __dev_flush(struct list_head *flush_list, int *redirects);
>>>>>  int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>>>>>  		    struct net_device *dev_rx);
>>>>>  int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_frame *x=
dpf,
>>>>> @@ -2740,7 +2740,7 @@ static inline struct bpf_token *bpf_token_get_f=
rom_fd(u32 ufd)
>>>>>  	return ERR_PTR(-EOPNOTSUPP);
>>>>>  }
>>>>>=20=20
>>>>> -static inline void __dev_flush(struct list_head *flush_list)
>>>>> +static inline void __dev_flush(struct list_head *flush_list, int *re=
directs)
>>>>>  {
>>>>>  }
>>>>>=20=20
>>>>> diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
>>>>> index a7e5452b5d21..fba2c457e727 100644
>>>>> --- a/include/trace/events/xdp.h
>>>>> +++ b/include/trace/events/xdp.h
>>>>> @@ -269,9 +269,9 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>>>=20=20
>>>>>  	TP_PROTO(const struct net_device *from_dev,
>>>>>  		 const struct net_device *to_dev,
>>>>> -		 int sent, int drops, int err),
>>>>> +		 int sent, int drops, int redirects, int err),
>>>>>=20=20
>>>>> -	TP_ARGS(from_dev, to_dev, sent, drops, err),
>>>>> +	TP_ARGS(from_dev, to_dev, sent, drops, redirects, err),
>>>>>=20=20
>>>>>  	TP_STRUCT__entry(
>>>>>  		__field(int, from_ifindex)
>>>>> @@ -279,6 +279,7 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>>>  		__field(int, to_ifindex)
>>>>>  		__field(int, drops)
>>>>>  		__field(int, sent)
>>>>> +		__field(int, redirects)
>>>>>  		__field(int, err)
>>>>>  	),
>>>>>=20=20
>>>>> @@ -288,16 +289,17 @@ TRACE_EVENT(xdp_devmap_xmit,
>>>>>  		__entry->to_ifindex	=3D to_dev->ifindex;
>>>>>  		__entry->drops		=3D drops;
>>>>>  		__entry->sent		=3D sent;
>>>>> +		__entry->redirects	=3D redirects;
>>>>>  		__entry->err		=3D err;
>>>>>  	),
>>>>>=20=20
>>>>>  	TP_printk("ndo_xdp_xmit"
>>>>>  		  " from_ifindex=3D%d to_ifindex=3D%d action=3D%s"
>>>>> -		  " sent=3D%d drops=3D%d"
>>>>> +		  " sent=3D%d drops=3D%d redirects=3D%d"
>>>>>  		  " err=3D%d",
>>>>>  		  __entry->from_ifindex, __entry->to_ifindex,
>>>>>  		  __print_symbolic(__entry->act, __XDP_ACT_SYM_TAB),
>>>>> -		  __entry->sent, __entry->drops,
>>>>> +		  __entry->sent, __entry->drops, __entry->redirects,
>>>>>  		  __entry->err)
>>>>>  );
>>>>>=20=20
>>>>> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
>>>>> index 7878be18e9d2..89bdec49ea40 100644
>>>>> --- a/kernel/bpf/devmap.c
>>>>> +++ b/kernel/bpf/devmap.c
>>>>> @@ -334,7 +334,8 @@ static int dev_map_hash_get_next_key(struct bpf_m=
ap *map, void *key,
>>>>>  static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>>>>>  				struct xdp_frame **frames, int n,
>>>>>  				struct net_device *tx_dev,
>>>>> -				struct net_device *rx_dev)
>>>>> +				struct net_device *rx_dev,
>>>>> +				int *redirects)
>>>>>  {
>>>>>  	struct xdp_txq_info txq =3D { .dev =3D tx_dev };
>>>>>  	struct xdp_rxq_info rxq =3D { .dev =3D rx_dev };
>>>>> @@ -359,6 +360,13 @@ static int dev_map_bpf_prog_run(struct bpf_prog =
*xdp_prog,
>>>>>  			else
>>>>>  				frames[nframes++] =3D xdpf;
>>>>>  			break;
>>>>> +		case XDP_REDIRECT:
>>>>> +			err =3D xdp_do_redirect(rx_dev, &xdp, xdp_prog);
>>>>> +			if (unlikely(err))
>>>>> +				xdp_return_frame_rx_napi(xdpf);
>>>>> +			else
>>>>> +				*redirects +=3D 1;
>>>>> +			break;
>>>>
>>>> It's a bit subtle, but dev_map_bpf_prog_run() also filters the list of
>>>> frames in the queue in-place (the frames[nframes++] =3D xdpf; line abo=
ve),
>>>> which only works under the assumption that the array in bq->q is not
>>>> modified while this loop is being run. But now you're adding a call in
>>>> the middle that may result in the packet being put back on the same
>>>> queue in the middle, which means that this assumption no longer holds.
>>>>
>>>> So you need to clear the bq->q queue first for this to work.
>>>> Specifically, at the start of bq_xmit_all(), you'll need to first copy
>>>> all the packet pointer onto an on-stack array, then run the rest of the
>>>> function on that array. There's already an initial loop that goes
>>>> through all the frames, so you can just do it there.
>>>>
>>>> So the loop at the start of bq_xmit_all() goes from the current:
>>>>
>>>> 	for (i =3D 0; i < cnt; i++) {
>>>> 		struct xdp_frame *xdpf =3D bq->q[i];
>>>>
>>>> 		prefetch(xdpf);
>>>> 	}
>>>>
>>>>
>>>> to something like:
>>>>
>>>>         struct xdp_frame *frames[DEV_MAP_BULK_SIZE];
>>>>
>>>> 	for (i =3D 0; i < cnt; i++) {
>>>> 		struct xdp_frame *xdpf =3D bq->q[i];
>>>>
>>>> 		prefetch(xdpf);
>>>>                 frames[i] =3D xdpf;
>>>> 	}
>>>>
>>>>         bq->count =3D 0; /* bq is now empty, use the 'frames' and 'cnt'
>>>>                           stack variables for the rest of the function=
 */
>>>>
>>>>
>>>>
>>>>>  		default:
>>>>>  			bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
>>>>>  			fallthrough;
>>>>> @@ -373,7 +381,7 @@ static int dev_map_bpf_prog_run(struct bpf_prog *=
xdp_prog,
>>>>>  	return nframes; /* sent frames count */
>>>>>  }
>>>>>=20=20
>>>>> -static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>>>>> +static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags, in=
t *redirects)
>>>>>  {
>>>>>  	struct net_device *dev =3D bq->dev;
>>>>>  	unsigned int cnt =3D bq->count;
>>>>> @@ -390,8 +398,10 @@ static void bq_xmit_all(struct xdp_dev_bulk_queu=
e *bq, u32 flags)
>>>>>  		prefetch(xdpf);
>>>>>  	}
>>>>>=20=20
>>>>> +	int new_redirects =3D 0;
>>>>>  	if (bq->xdp_prog) {
>>>>> -		to_send =3D dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq=
->dev_rx);
>>>>> +		to_send =3D dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq=
->dev_rx,
>>>>> +				&new_redirects);
>>>>>  		if (!to_send)
>>>>>  			goto out;
>>>>>  	}
>>>>> @@ -413,19 +423,21 @@ static void bq_xmit_all(struct xdp_dev_bulk_que=
ue *bq, u32 flags)
>>>>>=20=20
>>>>>  out:
>>>>>  	bq->count =3D 0;
>>>>> -	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent, err);
>>>>> +	*redirects +=3D new_redirects;
>>>>> +	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent - new_redir=
ects,
>>>>> +			new_redirects, err);
>>>>>  }
>>>>>=20=20
>>>>>  /* __dev_flush is called from xdp_do_flush() which _must_ be signall=
ed from the
>>>>>   * driver before returning from its napi->poll() routine. See the co=
mment above
>>>>>   * xdp_do_flush() in filter.c.
>>>>>   */
>>>>> -void __dev_flush(struct list_head *flush_list)
>>>>> +void __dev_flush(struct list_head *flush_list, int *redirects)
>>>>>  {
>>>>>  	struct xdp_dev_bulk_queue *bq, *tmp;
>>>>>=20=20
>>>>>  	list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
>>>>> -		bq_xmit_all(bq, XDP_XMIT_FLUSH);
>>>>> +		bq_xmit_all(bq, XDP_XMIT_FLUSH, redirects);
>>>>>  		bq->dev_rx =3D NULL;
>>>>>  		bq->xdp_prog =3D NULL;
>>>>>  		__list_del_clearprev(&bq->flush_node);
>>>>> @@ -458,8 +470,17 @@ static void bq_enqueue(struct net_device *dev, s=
truct xdp_frame *xdpf,
>>>>>  {
>>>>>  	struct xdp_dev_bulk_queue *bq =3D this_cpu_ptr(dev->xdp_bulkq);
>>>>>=20=20
>>>>> -	if (unlikely(bq->count =3D=3D DEV_MAP_BULK_SIZE))
>>>>> -		bq_xmit_all(bq, 0);
>>>>> +	if (unlikely(bq->count =3D=3D DEV_MAP_BULK_SIZE)) {
>>>>> +		int redirects =3D 0;
>>>>> +
>>>>> +		bq_xmit_all(bq, 0, &redirects);
>>>>> +
>>>>> +		/* according to comment above xdp_do_flush() in
>>>>> +		 * filter.c, xdp_do_flush is always called at
>>>>> +		 * the end of the NAPI anyway, so no need to act
>>>>> +		 * on the redirects here
>>>>> +		 */
>>>>
>>>> While it's true that it will be called again in NAPI, the purpose of
>>>> calling bq_xmit_all() here is to make room space for the packet on the
>>>> bulk queue that we're about to enqueue, and if bq_xmit_all() can just
>>>> put the packet back on the queue, there is no guarantee that this will
>>>> succeed. So you will have to handle that case here.
>>>>
>>>> Since there's also a potential infinite recursion issue in the
>>>> do_flush() functions below, I think it may be better to handle this
>>>> looping issue inside bq_xmit_all().
>>>>
>>>> I.e., structure the code so that bq_xmit_all() guarantees that when it
>>>> returns it has actually done its job; that is, that bq->q is empty.
>>>>
>>>> Given the above "move all frames out of bq->q at the start" change, th=
is
>>>> is not all that hard. Simply add a check after the out: label (in
>>>> bq_xmit_all()) to check if bq->count is actually 0, and if it isn't,
>>>> start over from the beginning of that function. This also makes it
>>>> straight forward to add a recursion limit; after looping a set number =
of
>>>> times (say, XMIT_RECURSION_LIMIT), simply turn XDP_REDIRECT into drops.
>>>>
>>>> There will need to be some additional protection against looping forev=
er
>>>> in __dev_flush(), to handle the case where a packet is looped between
>>>> two interfaces. This one is a bit trickier, but a similar recursion
>>>> counter could be used, I think.
>>>
>>>
>>> Thanks a lot for the extensive support!
>>> Regarding __dev_flush(), could the following already be sufficient?
>>>
>>> void __dev_flush(struct list_head *flush_list)
>>> {
>>>         struct xdp_dev_bulk_queue *bq, *tmp;
>>>         int i,j;
>>>
>>>         for (i =3D 0; !list_empty(flush_list) && i < XMIT_RECURSION_LIM=
IT; i++) {
>>>                 /* go through list in reverse so that new items
>>>                  * added to the flush_list will only be handled
>>>                  * in the next iteration of the outer loop
>>>                  */
>>>                 list_for_each_entry_safe_reverse(bq, tmp, flush_list, f=
lush_node) {
>>>                         bq_xmit_all(bq, XDP_XMIT_FLUSH);
>>>                         bq->dev_rx =3D NULL;
>>>                         bq->xdp_prog =3D NULL;
>>>                         __list_del_clearprev(&bq->flush_node);
>>>                 }
>>>         }
>>>
>>>         if (i =3D=3D XMIT_RECURSION_LIMIT) {
>>>                 pr_warn("XDP recursion limit hit, expect packet loss!\n=
");
>>>
>>>                 list_for_each_entry_safe(bq, tmp, flush_list, flush_nod=
e) {
>>>                         for (j =3D 0; j < bq->count; j++)
>>>                                 xdp_return_frame_rx_napi(bq->q[i]);
>>>
>>>                         bq->count =3D 0;
>>>                         bq->dev_rx =3D NULL;
>>>                         bq->xdp_prog =3D NULL;
>>>                         __list_del_clearprev(&bq->flush_node);
>>>                 }
>>>         }
>>> }
>>=20
>> Yeah, this would work, I think (neat trick with iterating the list in
>> reverse!), but instead of the extra loop in the end, I would suggest
>> passing in an extra 'allow_redirect' parameter to bq_xmit_all(). Since
>> you'll already have to handle the recursion limit inside that function,
>> you can just reuse the same functionality by passing in the parameter in
>> the last iteration of the first loop.
>>=20
>> Also, definitely don't put an unconditional warn_on() in the fast path -
>> that brings down the system really quickly if it's misconfigured :)
>>=20
>> A warn_on_once() could work, but really I would suggest just reusing the
>> _trace_xdp_redirect_map_err() tracepoint with a new error code (just has
>> to be one we're not currently using and that vaguely resembles what this
>> is about; ELOOP, EOVERFLOW or EDEADLOCK, maybe?).
>
>
> The 'allow_redirect' parameter is a very good idea! If I also forward that
> to dev_map_bpf_prog_run and do something like the following, I can just
> reuse the existing error handling. Or is that too implict/too ugly?
>
> switch (act) {
> case XDP_PASS:
>         err =3D xdp_update_frame_from_buff(&xdp, xdpf);
>         if (unlikely(err < 0))
>                 xdp_return_frame_rx_napi(xdpf);
>         else
>                 frames[nframes++] =3D xdpf;
>         break;
> case XDP_REDIRECT:
>         if (allow_redirect) {
>                 err =3D xdp_do_redirect(rx_dev, &xdp, xdp_prog);
>                 if (unlikely(err))
>                         xdp_return_frame_rx_napi(xdpf);
>                 else
>                         *redirects +=3D 1;
>                 break;
>         } else
>                 fallthrough;
> default:
>         bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
>         fallthrough;

Yes, I was imagining something like this. Not sure if we want to turn it
into an "invalid action" this way (it should probably be a separate
tracepoint as I mentioned in the previous email). But otherwise, yeah!

> case XDP_ABORTED:
>         trace_xdp_exception(tx_dev, xdp_prog, act);
>         fallthrough;
> case XDP_DROP:
>         xdp_return_frame_rx_napi(xdpf);
>         break;
> }
>
>
>>=20
>>>> In any case, this needs extensive selftests, including ones with devmap
>>>> programs that loop packets (both redirect from a->a, and from
>>>> a->b->a->b) to make sure the limits work correctly.
>>>
>>>
>>> Good point! I am going to prepare some.
>>>
>>>
>>>>
>>>>> +	}
>>>>>=20=20
>>>>>  	/* Ingress dev_rx will be the same for all xdp_frame's in
>>>>>  	 * bulk_queue, because bq stored per-CPU and must be flushed
>>>>> diff --git a/net/core/filter.c b/net/core/filter.c
>>>>> index 8569cd2482ee..b33fc0b1444a 100644
>>>>> --- a/net/core/filter.c
>>>>> +++ b/net/core/filter.c
>>>>> @@ -4287,14 +4287,18 @@ static const struct bpf_func_proto bpf_xdp_ad=
just_meta_proto =3D {
>>>>>  void xdp_do_flush(void)
>>>>>  {
>>>>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>>>>> +	int redirect;
>>>>>=20=20
>>>>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>>>> -	if (lh_dev)
>>>>> -		__dev_flush(lh_dev);
>>>>> -	if (lh_map)
>>>>> -		__cpu_map_flush(lh_map);
>>>>> -	if (lh_xsk)
>>>>> -		__xsk_map_flush(lh_xsk);
>>>>> +	do {
>>>>> +		redirect =3D 0;
>>>>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>>>> +		if (lh_dev)
>>>>> +			__dev_flush(lh_dev, &redirect);
>>>>> +		if (lh_map)
>>>>> +			__cpu_map_flush(lh_map);
>>>>> +		if (lh_xsk)
>>>>> +			__xsk_map_flush(lh_xsk);
>>>>> +	} while (redirect > 0);
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(xdp_do_flush);
>>>>>=20=20
>>>>> @@ -4303,20 +4307,24 @@ void xdp_do_check_flushed(struct napi_struct =
*napi)
>>>>>  {
>>>>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>>>>>  	bool missed =3D false;
>>>>> +	int redirect;
>>>>>=20=20
>>>>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>>>> -	if (lh_dev) {
>>>>> -		__dev_flush(lh_dev);
>>>>> -		missed =3D true;
>>>>> -	}
>>>>> -	if (lh_map) {
>>>>> -		__cpu_map_flush(lh_map);
>>>>> -		missed =3D true;
>>>>> -	}
>>>>> -	if (lh_xsk) {
>>>>> -		__xsk_map_flush(lh_xsk);
>>>>> -		missed =3D true;
>>>>> -	}
>>>>> +	do {
>>>>> +		redirect =3D 0;
>>>>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>>>>> +		if (lh_dev) {
>>>>> +			__dev_flush(lh_dev, &redirect);
>>>>> +			missed =3D true;
>>>>> +		}
>>>>> +		if (lh_map) {
>>>>> +			__cpu_map_flush(lh_map);
>>>>> +			missed =3D true;
>>>>> +		}
>>>>> +		if (lh_xsk) {
>>>>> +			__xsk_map_flush(lh_xsk);
>>>>> +			missed =3D true;
>>>>> +		}
>>>>> +	} while (redirect > 0);
>>>>
>>>> With the change suggested above (so that bq_xmit_all() guarantees the
>>>> flush is completely done), this looping is not needed anymore. However,
>>>> it becomes important in which *order* the flushing is done
>>>> (__dev_flush() should always happen first), so adding a comment to note
>>>> this would be good.
>>>
>>>
>>> I guess, if we remove the loop here and we still want to cover the case=
 of
>>> redirecting from devmap program via cpumap, we need to fetch the lh_map=
 again
>>> after calling __dev_flush, right?
>>> So I think we should no longer use bpf_net_ctx_get_all_used_flush_lists=
 then:
>>>
>>>         lh_dev =3D bpf_net_ctx_get_dev_flush_list();
>>>         if (lh_dev)
>>>                 __dev_flush(lh_dev);
>>>         lh_map =3D bpf_net_ctx_get_cpu_map_flush_list();
>>>         if (lh_map)
>>>                 __cpu_map_flush(lh_map);
>>>         lh_xsk =3D bpf_net_ctx_get_xskmap_flush_list();
>>>         if (lh_xsk)
>>>                 __xsk_map_flush(lh_xsk);
>>>
>>> But bpf_net_ctx_get_all_used_flush_lists also includes additional checks
>>> for IS_ENABLED(CONFIG_BPF_SYSCALL) and IS_ENABLED(CONFIG_XDP_SOCKETS),
>>> so I guess they should be directly included in the xdp_do_flush and
>>> xdp_do_check_flushed?
>>> Then we could remove the bpf_net_ctx_get_all_used_flush_lists.
>>> Or do you have an idea for a more elegant solution?
>>=20
>> I think cpumap is fine because that doesn't immediately redirect back to
>> the bulk queue; instead __cpu_map_flush() will put the frames on a
>> per-CPU ring buffer and wake the kworker on that CPU. Which will in turn
>> do another xdp_do_flush() if the cpumap program does a redirect. So in
>> other words, we only need to handle recursion of devmap redirects :)
>
> I likely miss something here, but the scenario I am thinking about is the=
 following:
>
> 1. cpu_map and xsk_map flush list are empty, while the dev flush map has
>    a single frame pending, i.e. in the current implementation after
>    executing bpf_net_ctx_get_all_used_flush_lists:
>    lh_dev =3D something
>    lh_map =3D lh_xsk =3D NULL
>
> 2. __dev_flush gets called and executes a bpf program on the frame
>    that returns with "return bpf_redirect_map(&cpu_map, 0, 0);"
>    and that adds an item to the cpumap flush list.
>
> 3. Since __dev_flush is only able to handle devmap redirects itself,
>    the item is still on the cpumap flush list after __dev_flush
>    has returned.
>
> 4. lh_map, however, is still NULL, so __cpu_map_flush does not
>    get called and thus the kworker is never woken up.
>
> That is at least what I see on the running system that the kworker
> is never woken up, but I might have done something else wrong...

Ah, yes, I see what you mean. Yup, you're right,
bpf_net_ctx_get_all_used_flush_lists() will no longer work, we'll have
to get the others after __dev_flush()

-Toke


