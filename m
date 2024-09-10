Return-Path: <xdp-newbies+bounces-139-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C0972C38
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 10:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 705191F21C5E
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Sep 2024 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D202186610;
	Tue, 10 Sep 2024 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djTiCZCC"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4C183CDD
	for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957280; cv=none; b=eODVGM8m7NFqJMCHzgmD9t9vLmUz9Uv64kIrCRkx6g4JD5qvepoa9QN5zxbgVRatCQJ5DrixbC6nOZnfgi+0pwYN5LBeykoReboV9gsbmUvyIkYX7vaJAgZTOoy4hPwylQPcStMXF0xgT0dynfQWYgQaJ1SELpnxG2fwaoICOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957280; c=relaxed/simple;
	bh=dlk4YBozOg2tMtUlyXa5BdmebhAbduVWruAiq/v+mTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o33wQpS8+4RZss1XK8HyINoX9V/+AKkGTO7wihm1rJHMEpobQcaZLQDsmUdQ6wppxiekYQTUEA+HHczAZRyX62OX4HQ8MImKAkR1Q9H48tmdLr+xZ5jmWgrtwDg5dMPxANBEb+2Ky7OSjkSuKABc8DaIy2/IVwsmuRBrIAUr5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=djTiCZCC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725957276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fPYNzrJXKT6Kf3pTlS4+RlP9ivHOL9p8abtIufwok5s=;
	b=djTiCZCCk/WE91tIM2oj1lIsiwP1Ol9M4rzyeCZpz+hfSuJW/qWNKhugBh6hT+dcWiNjS5
	3wmnTK8veZjlrHlMSUvDJ0NKlxna/janDmnxjaGBMfNlSNsYSrytZjAq/uWzMNrVXQzpJH
	4w8L/Z4GxvwL9TvZpJIh/bm+INlEhU0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-NPnZqruiPnSDQ-9MObOgnw-1; Tue, 10 Sep 2024 04:34:35 -0400
X-MC-Unique: NPnZqruiPnSDQ-9MObOgnw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7d2d414949so425224166b.0
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Sep 2024 01:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725957274; x=1726562074;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPYNzrJXKT6Kf3pTlS4+RlP9ivHOL9p8abtIufwok5s=;
        b=OEurXl9P8SfPZJP8ohmmPDje/iBayQ2seZ3OgKXNosX9k+IdJWJfMnicukUuKFzPL/
         y2doPP8Mw0o4b5//HZalJiZLzUcOFpoH2pliH89YE/VlfzSWEXDiT4pimmuLwUkywOJu
         32ESoKVXa63Et+VsZSTEQtJbgZndPOlWef94R2MqPLgzINtoC8KX5NnKNET1OBNoEl2M
         mxTPEBxECAle8S669MnzEvEK0uf4JwY2rhr5Ss88r4RnPoDnmrZUDYQ8vOxynyzxCVrh
         ToNyJ/sFEkLL3yHT7AuAfein4BfwrqaEa5JOO9NKg3IkYXdZEPd+unPhuFKx/zkk/Tjo
         swYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4b6FiwCUCNyMXj2KSEjey48tQEoWQTtotEi/vopSED5rdbYMI3I59joOyyQJJtTnmdtw2Zg+1ikjWeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dLtC9EaGfA/3fgUSAkBrtgncXqoyW1joGBiOVnFvBpFgAG4z
	MW3XhvpoAhNGiuQRwtMSlKPfVcVxhSEWWInN/LvBOomB4MhVGDfVS/UWWDrUPgO9GUcpI6CENuj
	LRHzIZbT7BpnwuLwrDWE7wTZx+91hhOfzmPRdfenfYcJ6vREFsV/kvfwgHjEy
X-Received: by 2002:a17:907:9606:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a8a885fb742mr1368555666b.26.1725957273980;
        Tue, 10 Sep 2024 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEUNgellNHBmpptv3zgRsuLzJKA6icHROlhYgaWOH/Aqa9HUJUiOvkEGLfvSN7nWhgwauO1Q==
X-Received: by 2002:a17:907:9606:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a8a885fb742mr1368547466b.26.1725957272656;
        Tue, 10 Sep 2024 01:34:32 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25833955sm449555866b.32.2024.09.10.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 01:34:32 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 42A6F152C377; Tue, 10 Sep 2024 10:34:31 +0200 (CEST)
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
 xdp-newbies@vger.kernel.org, Florian Kauer <florian.kauer@linutronix.de>
Subject: Re: [PATCH] bpf: devmap: allow for repeated redirect
In-Reply-To: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
References: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 10 Sep 2024 10:34:31 +0200
Message-ID: <87o74vewko.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Florian Kauer <florian.kauer@linutronix.de> writes:

> Currently, returning XDP_REDIRECT from a xdp/devmap program
> is considered as invalid action and an exception is traced.
>
> While it might seem counterintuitive to redirect in a xdp/devmap
> program (why not just redirect to the correct interface in the
> first program?), we faced several use cases where supporting
> this would be very useful.
>
> Most importantly, they occur when the first redirect is used
> with the BPF_F_BROADCAST flag. Using this together with xdp/devmap
> programs, enables to perform different actions on clones of
> the same incoming frame. In that case, it is often useful
> to redirect either to a different CPU or device AFTER the cloning.
>
> For example:
> - Replicate the frame (for redundancy according to IEEE 802.1CB FRER)
>   and then use the second redirect with a cpumap to select
>   the path-specific egress queue.
>
> - Also, one of the paths might need an encapsulation that
>   exceeds the MTU. So a second redirect can be used back
>   to the ingress interface to send an ICMP FRAG_NEEDED packet.
>
> - For OAM purposes, you might want to send one frame with
>   OAM information back, while the original frame in passed forward.
>
> To enable these use cases, add the XDP_REDIRECT case to
> dev_map_bpf_prog_run. Also, when this is called from inside
> xdp_do_flush, the redirect might add further entries to the
> flush lists that are currently processed. Therefore, loop inside
> xdp_do_flush until no more additional redirects were added.
>
> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>

This is an interesting use case! However, your implementation makes it
way to easy to end up in a situation that loops forever, so I think we
should add some protection against that. Some details below:

> ---
>  include/linux/bpf.h        |  4 ++--
>  include/trace/events/xdp.h | 10 ++++++----
>  kernel/bpf/devmap.c        | 37 +++++++++++++++++++++++++++--------
>  net/core/filter.c          | 48 +++++++++++++++++++++++++++-------------------
>  4 files changed, 65 insertions(+), 34 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3b94ec161e8c..1b57cbabf199 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2498,7 +2498,7 @@ struct sk_buff;
>  struct bpf_dtab_netdev;
>  struct bpf_cpu_map_entry;
>  
> -void __dev_flush(struct list_head *flush_list);
> +void __dev_flush(struct list_head *flush_list, int *redirects);
>  int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>  		    struct net_device *dev_rx);
>  int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_frame *xdpf,
> @@ -2740,7 +2740,7 @@ static inline struct bpf_token *bpf_token_get_from_fd(u32 ufd)
>  	return ERR_PTR(-EOPNOTSUPP);
>  }
>  
> -static inline void __dev_flush(struct list_head *flush_list)
> +static inline void __dev_flush(struct list_head *flush_list, int *redirects)
>  {
>  }
>  
> diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
> index a7e5452b5d21..fba2c457e727 100644
> --- a/include/trace/events/xdp.h
> +++ b/include/trace/events/xdp.h
> @@ -269,9 +269,9 @@ TRACE_EVENT(xdp_devmap_xmit,
>  
>  	TP_PROTO(const struct net_device *from_dev,
>  		 const struct net_device *to_dev,
> -		 int sent, int drops, int err),
> +		 int sent, int drops, int redirects, int err),
>  
> -	TP_ARGS(from_dev, to_dev, sent, drops, err),
> +	TP_ARGS(from_dev, to_dev, sent, drops, redirects, err),
>  
>  	TP_STRUCT__entry(
>  		__field(int, from_ifindex)
> @@ -279,6 +279,7 @@ TRACE_EVENT(xdp_devmap_xmit,
>  		__field(int, to_ifindex)
>  		__field(int, drops)
>  		__field(int, sent)
> +		__field(int, redirects)
>  		__field(int, err)
>  	),
>  
> @@ -288,16 +289,17 @@ TRACE_EVENT(xdp_devmap_xmit,
>  		__entry->to_ifindex	= to_dev->ifindex;
>  		__entry->drops		= drops;
>  		__entry->sent		= sent;
> +		__entry->redirects	= redirects;
>  		__entry->err		= err;
>  	),
>  
>  	TP_printk("ndo_xdp_xmit"
>  		  " from_ifindex=%d to_ifindex=%d action=%s"
> -		  " sent=%d drops=%d"
> +		  " sent=%d drops=%d redirects=%d"
>  		  " err=%d",
>  		  __entry->from_ifindex, __entry->to_ifindex,
>  		  __print_symbolic(__entry->act, __XDP_ACT_SYM_TAB),
> -		  __entry->sent, __entry->drops,
> +		  __entry->sent, __entry->drops, __entry->redirects,
>  		  __entry->err)
>  );
>  
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index 7878be18e9d2..89bdec49ea40 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -334,7 +334,8 @@ static int dev_map_hash_get_next_key(struct bpf_map *map, void *key,
>  static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>  				struct xdp_frame **frames, int n,
>  				struct net_device *tx_dev,
> -				struct net_device *rx_dev)
> +				struct net_device *rx_dev,
> +				int *redirects)
>  {
>  	struct xdp_txq_info txq = { .dev = tx_dev };
>  	struct xdp_rxq_info rxq = { .dev = rx_dev };
> @@ -359,6 +360,13 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>  			else
>  				frames[nframes++] = xdpf;
>  			break;
> +		case XDP_REDIRECT:
> +			err = xdp_do_redirect(rx_dev, &xdp, xdp_prog);
> +			if (unlikely(err))
> +				xdp_return_frame_rx_napi(xdpf);
> +			else
> +				*redirects += 1;
> +			break;

It's a bit subtle, but dev_map_bpf_prog_run() also filters the list of
frames in the queue in-place (the frames[nframes++] = xdpf; line above),
which only works under the assumption that the array in bq->q is not
modified while this loop is being run. But now you're adding a call in
the middle that may result in the packet being put back on the same
queue in the middle, which means that this assumption no longer holds.

So you need to clear the bq->q queue first for this to work.
Specifically, at the start of bq_xmit_all(), you'll need to first copy
all the packet pointer onto an on-stack array, then run the rest of the
function on that array. There's already an initial loop that goes
through all the frames, so you can just do it there.

So the loop at the start of bq_xmit_all() goes from the current:

	for (i = 0; i < cnt; i++) {
		struct xdp_frame *xdpf = bq->q[i];

		prefetch(xdpf);
	}


to something like:

        struct xdp_frame *frames[DEV_MAP_BULK_SIZE];

	for (i = 0; i < cnt; i++) {
		struct xdp_frame *xdpf = bq->q[i];

		prefetch(xdpf);
                frames[i] = xdpf;
	}

        bq->count = 0; /* bq is now empty, use the 'frames' and 'cnt'
                          stack variables for the rest of the function */



>  		default:
>  			bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
>  			fallthrough;
> @@ -373,7 +381,7 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>  	return nframes; /* sent frames count */
>  }
>  
> -static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
> +static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags, int *redirects)
>  {
>  	struct net_device *dev = bq->dev;
>  	unsigned int cnt = bq->count;
> @@ -390,8 +398,10 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>  		prefetch(xdpf);
>  	}
>  
> +	int new_redirects = 0;
>  	if (bq->xdp_prog) {
> -		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx);
> +		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx,
> +				&new_redirects);
>  		if (!to_send)
>  			goto out;
>  	}
> @@ -413,19 +423,21 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>  
>  out:
>  	bq->count = 0;
> -	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent, err);
> +	*redirects += new_redirects;
> +	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent - new_redirects,
> +			new_redirects, err);
>  }
>  
>  /* __dev_flush is called from xdp_do_flush() which _must_ be signalled from the
>   * driver before returning from its napi->poll() routine. See the comment above
>   * xdp_do_flush() in filter.c.
>   */
> -void __dev_flush(struct list_head *flush_list)
> +void __dev_flush(struct list_head *flush_list, int *redirects)
>  {
>  	struct xdp_dev_bulk_queue *bq, *tmp;
>  
>  	list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
> -		bq_xmit_all(bq, XDP_XMIT_FLUSH);
> +		bq_xmit_all(bq, XDP_XMIT_FLUSH, redirects);
>  		bq->dev_rx = NULL;
>  		bq->xdp_prog = NULL;
>  		__list_del_clearprev(&bq->flush_node);
> @@ -458,8 +470,17 @@ static void bq_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>  {
>  	struct xdp_dev_bulk_queue *bq = this_cpu_ptr(dev->xdp_bulkq);
>  
> -	if (unlikely(bq->count == DEV_MAP_BULK_SIZE))
> -		bq_xmit_all(bq, 0);
> +	if (unlikely(bq->count == DEV_MAP_BULK_SIZE)) {
> +		int redirects = 0;
> +
> +		bq_xmit_all(bq, 0, &redirects);
> +
> +		/* according to comment above xdp_do_flush() in
> +		 * filter.c, xdp_do_flush is always called at
> +		 * the end of the NAPI anyway, so no need to act
> +		 * on the redirects here
> +		 */

While it's true that it will be called again in NAPI, the purpose of
calling bq_xmit_all() here is to make room space for the packet on the
bulk queue that we're about to enqueue, and if bq_xmit_all() can just
put the packet back on the queue, there is no guarantee that this will
succeed. So you will have to handle that case here.

Since there's also a potential infinite recursion issue in the
do_flush() functions below, I think it may be better to handle this
looping issue inside bq_xmit_all().

I.e., structure the code so that bq_xmit_all() guarantees that when it
returns it has actually done its job; that is, that bq->q is empty.

Given the above "move all frames out of bq->q at the start" change, this
is not all that hard. Simply add a check after the out: label (in
bq_xmit_all()) to check if bq->count is actually 0, and if it isn't,
start over from the beginning of that function. This also makes it
straight forward to add a recursion limit; after looping a set number of
times (say, XMIT_RECURSION_LIMIT), simply turn XDP_REDIRECT into drops.

There will need to be some additional protection against looping forever
in __dev_flush(), to handle the case where a packet is looped between
two interfaces. This one is a bit trickier, but a similar recursion
counter could be used, I think.

In any case, this needs extensive selftests, including ones with devmap
programs that loop packets (both redirect from a->a, and from
a->b->a->b) to make sure the limits work correctly.

> +	}
>  
>  	/* Ingress dev_rx will be the same for all xdp_frame's in
>  	 * bulk_queue, because bq stored per-CPU and must be flushed
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 8569cd2482ee..b33fc0b1444a 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -4287,14 +4287,18 @@ static const struct bpf_func_proto bpf_xdp_adjust_meta_proto = {
>  void xdp_do_flush(void)
>  {
>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
> +	int redirect;
>  
> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
> -	if (lh_dev)
> -		__dev_flush(lh_dev);
> -	if (lh_map)
> -		__cpu_map_flush(lh_map);
> -	if (lh_xsk)
> -		__xsk_map_flush(lh_xsk);
> +	do {
> +		redirect = 0;
> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
> +		if (lh_dev)
> +			__dev_flush(lh_dev, &redirect);
> +		if (lh_map)
> +			__cpu_map_flush(lh_map);
> +		if (lh_xsk)
> +			__xsk_map_flush(lh_xsk);
> +	} while (redirect > 0);
>  }
>  EXPORT_SYMBOL_GPL(xdp_do_flush);
>  
> @@ -4303,20 +4307,24 @@ void xdp_do_check_flushed(struct napi_struct *napi)
>  {
>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>  	bool missed = false;
> +	int redirect;
>  
> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
> -	if (lh_dev) {
> -		__dev_flush(lh_dev);
> -		missed = true;
> -	}
> -	if (lh_map) {
> -		__cpu_map_flush(lh_map);
> -		missed = true;
> -	}
> -	if (lh_xsk) {
> -		__xsk_map_flush(lh_xsk);
> -		missed = true;
> -	}
> +	do {
> +		redirect = 0;
> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
> +		if (lh_dev) {
> +			__dev_flush(lh_dev, &redirect);
> +			missed = true;
> +		}
> +		if (lh_map) {
> +			__cpu_map_flush(lh_map);
> +			missed = true;
> +		}
> +		if (lh_xsk) {
> +			__xsk_map_flush(lh_xsk);
> +			missed = true;
> +		}
> +	} while (redirect > 0);

With the change suggested above (so that bq_xmit_all() guarantees the
flush is completely done), this looping is not needed anymore. However,
it becomes important in which *order* the flushing is done
(__dev_flush() should always happen first), so adding a comment to note
this would be good.

-Toke


