Return-Path: <xdp-newbies+bounces-142-lists+xdp-newbies=lfdr.de@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9101974C96
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 10:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365651F242E6
	for <lists+xdp-newbies@lfdr.de>; Wed, 11 Sep 2024 08:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEC614F9CC;
	Wed, 11 Sep 2024 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lagfp2Ap";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0AMyJ6w2"
X-Original-To: xdp-newbies@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4316AD24;
	Wed, 11 Sep 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043201; cv=none; b=ORRfh50ns/HnTGw9e54x5KUYo09KpS6qi+ixzceQjsrXY2hiDZ76pS3yPpPQpmNFA0LC3ry2kThRLfeENuyrJ2O8zH0rwJJMPBkx9AZH41AaOQ1eqR50yUETyX+6RyiF5zIAnR146gNBgUwTrxO1eBbWGKEihMgfxojfAzLcSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043201; c=relaxed/simple;
	bh=yA6jmdtSjQQaIX04R7mnMbqDET0LfJ9LtFp2aJegwJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpGAGz/hzdV2qGZmdk5OLmbq/CNWaBNuVRSAlKdliJSpY9pcOl5r7tXKqVr79+sqlvKMZvZehrV3m8hP3AWLCny6F7D8YGJUkuVbe177nIBp0zQIthVLa8tfzk3pQvWCftvzLuSuiAXGnSiTzeTJ7ME33g+6/9Zb4rm6sL6gn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lagfp2Ap; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0AMyJ6w2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Message-ID: <098b5603-0feb-4013-a9ee-8d1c8edaf4f8@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726043191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SsfYE65U2nqKcWCa6rTEwMY0IWW4+DzbJYEnVT2m3yk=;
	b=lagfp2ApUcCs1iS8oyQrkGA3PnIevA4slQhIh5okE+1mnURETYrbRml8uImtbCa3g0hhut
	1yhOUoN2hAV0fHKINMC/Mgdmwn9eiCXy+9gr7G9PqtOSRq35JnRxGkGeuW5UoqryxRxNdT
	E0mAZDh8QSlhpmg45CnthH8lcQqMDMAnuDnRi0jELKS4WgWQS2yHQSCisSXSSMtSRdmGFK
	yF1i4oZVHmBKIW5b7rQhip+YfnnEotAKnj4KUPG43bvbx94NLrWXov0bVjhPjx0oNJMAU5
	xM/eDPUg7z9vhscrMblHW6eAK+YmLJOiz+cey6lkFAw6NLZO/P31nzgbLQ10Vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726043191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SsfYE65U2nqKcWCa6rTEwMY0IWW4+DzbJYEnVT2m3yk=;
	b=0AMyJ6w2NFYIfY5m2362t8z5mXWdRmY2ZLFUWwqk/mW4FcXls8/8zaifvlwc1ovHsq7vMx
	CT7C6Nzx/mENQGAw==
Date: Wed, 11 Sep 2024 10:26:29 +0200
Precedence: bulk
X-Mailing-List: xdp-newbies@vger.kernel.org
List-Id: <xdp-newbies.vger.kernel.org>
List-Subscribe: <mailto:xdp-newbies+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:xdp-newbies+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] bpf: devmap: allow for repeated redirect
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 xdp-newbies@vger.kernel.org
References: <20240909-devel-koalo-fix-redirect-v1-1-2dd90771146c@linutronix.de>
 <87o74vewko.fsf@toke.dk>
Content-Language: en-US
From: Florian Kauer <florian.kauer@linutronix.de>
Autocrypt: addr=florian.kauer@linutronix.de; keydata=
 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
 ugsSqUGtSA==
In-Reply-To: <87o74vewko.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Toke,

On 9/10/24 10:34, Toke Høiland-Jørgensen wrote:
> Florian Kauer <florian.kauer@linutronix.de> writes:
> 
>> Currently, returning XDP_REDIRECT from a xdp/devmap program
>> is considered as invalid action and an exception is traced.
>>
>> While it might seem counterintuitive to redirect in a xdp/devmap
>> program (why not just redirect to the correct interface in the
>> first program?), we faced several use cases where supporting
>> this would be very useful.
>>
>> Most importantly, they occur when the first redirect is used
>> with the BPF_F_BROADCAST flag. Using this together with xdp/devmap
>> programs, enables to perform different actions on clones of
>> the same incoming frame. In that case, it is often useful
>> to redirect either to a different CPU or device AFTER the cloning.
>>
>> For example:
>> - Replicate the frame (for redundancy according to IEEE 802.1CB FRER)
>>   and then use the second redirect with a cpumap to select
>>   the path-specific egress queue.
>>
>> - Also, one of the paths might need an encapsulation that
>>   exceeds the MTU. So a second redirect can be used back
>>   to the ingress interface to send an ICMP FRAG_NEEDED packet.
>>
>> - For OAM purposes, you might want to send one frame with
>>   OAM information back, while the original frame in passed forward.
>>
>> To enable these use cases, add the XDP_REDIRECT case to
>> dev_map_bpf_prog_run. Also, when this is called from inside
>> xdp_do_flush, the redirect might add further entries to the
>> flush lists that are currently processed. Therefore, loop inside
>> xdp_do_flush until no more additional redirects were added.
>>
>> Signed-off-by: Florian Kauer <florian.kauer@linutronix.de>
> 
> This is an interesting use case! However, your implementation makes it
> way to easy to end up in a situation that loops forever, so I think we
> should add some protection against that. Some details below:
> 
>> ---
>>  include/linux/bpf.h        |  4 ++--
>>  include/trace/events/xdp.h | 10 ++++++----
>>  kernel/bpf/devmap.c        | 37 +++++++++++++++++++++++++++--------
>>  net/core/filter.c          | 48 +++++++++++++++++++++++++++-------------------
>>  4 files changed, 65 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>> index 3b94ec161e8c..1b57cbabf199 100644
>> --- a/include/linux/bpf.h
>> +++ b/include/linux/bpf.h
>> @@ -2498,7 +2498,7 @@ struct sk_buff;
>>  struct bpf_dtab_netdev;
>>  struct bpf_cpu_map_entry;
>>  
>> -void __dev_flush(struct list_head *flush_list);
>> +void __dev_flush(struct list_head *flush_list, int *redirects);
>>  int dev_xdp_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>>  		    struct net_device *dev_rx);
>>  int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_frame *xdpf,
>> @@ -2740,7 +2740,7 @@ static inline struct bpf_token *bpf_token_get_from_fd(u32 ufd)
>>  	return ERR_PTR(-EOPNOTSUPP);
>>  }
>>  
>> -static inline void __dev_flush(struct list_head *flush_list)
>> +static inline void __dev_flush(struct list_head *flush_list, int *redirects)
>>  {
>>  }
>>  
>> diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
>> index a7e5452b5d21..fba2c457e727 100644
>> --- a/include/trace/events/xdp.h
>> +++ b/include/trace/events/xdp.h
>> @@ -269,9 +269,9 @@ TRACE_EVENT(xdp_devmap_xmit,
>>  
>>  	TP_PROTO(const struct net_device *from_dev,
>>  		 const struct net_device *to_dev,
>> -		 int sent, int drops, int err),
>> +		 int sent, int drops, int redirects, int err),
>>  
>> -	TP_ARGS(from_dev, to_dev, sent, drops, err),
>> +	TP_ARGS(from_dev, to_dev, sent, drops, redirects, err),
>>  
>>  	TP_STRUCT__entry(
>>  		__field(int, from_ifindex)
>> @@ -279,6 +279,7 @@ TRACE_EVENT(xdp_devmap_xmit,
>>  		__field(int, to_ifindex)
>>  		__field(int, drops)
>>  		__field(int, sent)
>> +		__field(int, redirects)
>>  		__field(int, err)
>>  	),
>>  
>> @@ -288,16 +289,17 @@ TRACE_EVENT(xdp_devmap_xmit,
>>  		__entry->to_ifindex	= to_dev->ifindex;
>>  		__entry->drops		= drops;
>>  		__entry->sent		= sent;
>> +		__entry->redirects	= redirects;
>>  		__entry->err		= err;
>>  	),
>>  
>>  	TP_printk("ndo_xdp_xmit"
>>  		  " from_ifindex=%d to_ifindex=%d action=%s"
>> -		  " sent=%d drops=%d"
>> +		  " sent=%d drops=%d redirects=%d"
>>  		  " err=%d",
>>  		  __entry->from_ifindex, __entry->to_ifindex,
>>  		  __print_symbolic(__entry->act, __XDP_ACT_SYM_TAB),
>> -		  __entry->sent, __entry->drops,
>> +		  __entry->sent, __entry->drops, __entry->redirects,
>>  		  __entry->err)
>>  );
>>  
>> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
>> index 7878be18e9d2..89bdec49ea40 100644
>> --- a/kernel/bpf/devmap.c
>> +++ b/kernel/bpf/devmap.c
>> @@ -334,7 +334,8 @@ static int dev_map_hash_get_next_key(struct bpf_map *map, void *key,
>>  static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>>  				struct xdp_frame **frames, int n,
>>  				struct net_device *tx_dev,
>> -				struct net_device *rx_dev)
>> +				struct net_device *rx_dev,
>> +				int *redirects)
>>  {
>>  	struct xdp_txq_info txq = { .dev = tx_dev };
>>  	struct xdp_rxq_info rxq = { .dev = rx_dev };
>> @@ -359,6 +360,13 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>>  			else
>>  				frames[nframes++] = xdpf;
>>  			break;
>> +		case XDP_REDIRECT:
>> +			err = xdp_do_redirect(rx_dev, &xdp, xdp_prog);
>> +			if (unlikely(err))
>> +				xdp_return_frame_rx_napi(xdpf);
>> +			else
>> +				*redirects += 1;
>> +			break;
> 
> It's a bit subtle, but dev_map_bpf_prog_run() also filters the list of
> frames in the queue in-place (the frames[nframes++] = xdpf; line above),
> which only works under the assumption that the array in bq->q is not
> modified while this loop is being run. But now you're adding a call in
> the middle that may result in the packet being put back on the same
> queue in the middle, which means that this assumption no longer holds.
> 
> So you need to clear the bq->q queue first for this to work.
> Specifically, at the start of bq_xmit_all(), you'll need to first copy
> all the packet pointer onto an on-stack array, then run the rest of the
> function on that array. There's already an initial loop that goes
> through all the frames, so you can just do it there.
> 
> So the loop at the start of bq_xmit_all() goes from the current:
> 
> 	for (i = 0; i < cnt; i++) {
> 		struct xdp_frame *xdpf = bq->q[i];
> 
> 		prefetch(xdpf);
> 	}
> 
> 
> to something like:
> 
>         struct xdp_frame *frames[DEV_MAP_BULK_SIZE];
> 
> 	for (i = 0; i < cnt; i++) {
> 		struct xdp_frame *xdpf = bq->q[i];
> 
> 		prefetch(xdpf);
>                 frames[i] = xdpf;
> 	}
> 
>         bq->count = 0; /* bq is now empty, use the 'frames' and 'cnt'
>                           stack variables for the rest of the function */
> 
> 
> 
>>  		default:
>>  			bpf_warn_invalid_xdp_action(NULL, xdp_prog, act);
>>  			fallthrough;
>> @@ -373,7 +381,7 @@ static int dev_map_bpf_prog_run(struct bpf_prog *xdp_prog,
>>  	return nframes; /* sent frames count */
>>  }
>>  
>> -static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>> +static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags, int *redirects)
>>  {
>>  	struct net_device *dev = bq->dev;
>>  	unsigned int cnt = bq->count;
>> @@ -390,8 +398,10 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>>  		prefetch(xdpf);
>>  	}
>>  
>> +	int new_redirects = 0;
>>  	if (bq->xdp_prog) {
>> -		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx);
>> +		to_send = dev_map_bpf_prog_run(bq->xdp_prog, bq->q, cnt, dev, bq->dev_rx,
>> +				&new_redirects);
>>  		if (!to_send)
>>  			goto out;
>>  	}
>> @@ -413,19 +423,21 @@ static void bq_xmit_all(struct xdp_dev_bulk_queue *bq, u32 flags)
>>  
>>  out:
>>  	bq->count = 0;
>> -	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent, err);
>> +	*redirects += new_redirects;
>> +	trace_xdp_devmap_xmit(bq->dev_rx, dev, sent, cnt - sent - new_redirects,
>> +			new_redirects, err);
>>  }
>>  
>>  /* __dev_flush is called from xdp_do_flush() which _must_ be signalled from the
>>   * driver before returning from its napi->poll() routine. See the comment above
>>   * xdp_do_flush() in filter.c.
>>   */
>> -void __dev_flush(struct list_head *flush_list)
>> +void __dev_flush(struct list_head *flush_list, int *redirects)
>>  {
>>  	struct xdp_dev_bulk_queue *bq, *tmp;
>>  
>>  	list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
>> -		bq_xmit_all(bq, XDP_XMIT_FLUSH);
>> +		bq_xmit_all(bq, XDP_XMIT_FLUSH, redirects);
>>  		bq->dev_rx = NULL;
>>  		bq->xdp_prog = NULL;
>>  		__list_del_clearprev(&bq->flush_node);
>> @@ -458,8 +470,17 @@ static void bq_enqueue(struct net_device *dev, struct xdp_frame *xdpf,
>>  {
>>  	struct xdp_dev_bulk_queue *bq = this_cpu_ptr(dev->xdp_bulkq);
>>  
>> -	if (unlikely(bq->count == DEV_MAP_BULK_SIZE))
>> -		bq_xmit_all(bq, 0);
>> +	if (unlikely(bq->count == DEV_MAP_BULK_SIZE)) {
>> +		int redirects = 0;
>> +
>> +		bq_xmit_all(bq, 0, &redirects);
>> +
>> +		/* according to comment above xdp_do_flush() in
>> +		 * filter.c, xdp_do_flush is always called at
>> +		 * the end of the NAPI anyway, so no need to act
>> +		 * on the redirects here
>> +		 */
> 
> While it's true that it will be called again in NAPI, the purpose of
> calling bq_xmit_all() here is to make room space for the packet on the
> bulk queue that we're about to enqueue, and if bq_xmit_all() can just
> put the packet back on the queue, there is no guarantee that this will
> succeed. So you will have to handle that case here.
> 
> Since there's also a potential infinite recursion issue in the
> do_flush() functions below, I think it may be better to handle this
> looping issue inside bq_xmit_all().
> 
> I.e., structure the code so that bq_xmit_all() guarantees that when it
> returns it has actually done its job; that is, that bq->q is empty.
> 
> Given the above "move all frames out of bq->q at the start" change, this
> is not all that hard. Simply add a check after the out: label (in
> bq_xmit_all()) to check if bq->count is actually 0, and if it isn't,
> start over from the beginning of that function. This also makes it
> straight forward to add a recursion limit; after looping a set number of
> times (say, XMIT_RECURSION_LIMIT), simply turn XDP_REDIRECT into drops.
> 
> There will need to be some additional protection against looping forever
> in __dev_flush(), to handle the case where a packet is looped between
> two interfaces. This one is a bit trickier, but a similar recursion
> counter could be used, I think.


Thanks a lot for the extensive support!
Regarding __dev_flush(), could the following already be sufficient?

void __dev_flush(struct list_head *flush_list)
{
        struct xdp_dev_bulk_queue *bq, *tmp;
        int i,j;

        for (i = 0; !list_empty(flush_list) && i < XMIT_RECURSION_LIMIT; i++) {
                /* go through list in reverse so that new items
                 * added to the flush_list will only be handled
                 * in the next iteration of the outer loop
                 */
                list_for_each_entry_safe_reverse(bq, tmp, flush_list, flush_node) {
                        bq_xmit_all(bq, XDP_XMIT_FLUSH);
                        bq->dev_rx = NULL;
                        bq->xdp_prog = NULL;
                        __list_del_clearprev(&bq->flush_node);
                }
        }

        if (i == XMIT_RECURSION_LIMIT) {
                pr_warn("XDP recursion limit hit, expect packet loss!\n");

                list_for_each_entry_safe(bq, tmp, flush_list, flush_node) {
                        for (j = 0; j < bq->count; j++)
                                xdp_return_frame_rx_napi(bq->q[i]);

                        bq->count = 0;
                        bq->dev_rx = NULL;
                        bq->xdp_prog = NULL;
                        __list_del_clearprev(&bq->flush_node);
                }
        }
}


> 
> In any case, this needs extensive selftests, including ones with devmap
> programs that loop packets (both redirect from a->a, and from
> a->b->a->b) to make sure the limits work correctly.


Good point! I am going to prepare some.


> 
>> +	}
>>  
>>  	/* Ingress dev_rx will be the same for all xdp_frame's in
>>  	 * bulk_queue, because bq stored per-CPU and must be flushed
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 8569cd2482ee..b33fc0b1444a 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -4287,14 +4287,18 @@ static const struct bpf_func_proto bpf_xdp_adjust_meta_proto = {
>>  void xdp_do_flush(void)
>>  {
>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>> +	int redirect;
>>  
>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>> -	if (lh_dev)
>> -		__dev_flush(lh_dev);
>> -	if (lh_map)
>> -		__cpu_map_flush(lh_map);
>> -	if (lh_xsk)
>> -		__xsk_map_flush(lh_xsk);
>> +	do {
>> +		redirect = 0;
>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>> +		if (lh_dev)
>> +			__dev_flush(lh_dev, &redirect);
>> +		if (lh_map)
>> +			__cpu_map_flush(lh_map);
>> +		if (lh_xsk)
>> +			__xsk_map_flush(lh_xsk);
>> +	} while (redirect > 0);
>>  }
>>  EXPORT_SYMBOL_GPL(xdp_do_flush);
>>  
>> @@ -4303,20 +4307,24 @@ void xdp_do_check_flushed(struct napi_struct *napi)
>>  {
>>  	struct list_head *lh_map, *lh_dev, *lh_xsk;
>>  	bool missed = false;
>> +	int redirect;
>>  
>> -	bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>> -	if (lh_dev) {
>> -		__dev_flush(lh_dev);
>> -		missed = true;
>> -	}
>> -	if (lh_map) {
>> -		__cpu_map_flush(lh_map);
>> -		missed = true;
>> -	}
>> -	if (lh_xsk) {
>> -		__xsk_map_flush(lh_xsk);
>> -		missed = true;
>> -	}
>> +	do {
>> +		redirect = 0;
>> +		bpf_net_ctx_get_all_used_flush_lists(&lh_map, &lh_dev, &lh_xsk);
>> +		if (lh_dev) {
>> +			__dev_flush(lh_dev, &redirect);
>> +			missed = true;
>> +		}
>> +		if (lh_map) {
>> +			__cpu_map_flush(lh_map);
>> +			missed = true;
>> +		}
>> +		if (lh_xsk) {
>> +			__xsk_map_flush(lh_xsk);
>> +			missed = true;
>> +		}
>> +	} while (redirect > 0);
> 
> With the change suggested above (so that bq_xmit_all() guarantees the
> flush is completely done), this looping is not needed anymore. However,
> it becomes important in which *order* the flushing is done
> (__dev_flush() should always happen first), so adding a comment to note
> this would be good.


I guess, if we remove the loop here and we still want to cover the case of
redirecting from devmap program via cpumap, we need to fetch the lh_map again
after calling __dev_flush, right?
So I think we should no longer use bpf_net_ctx_get_all_used_flush_lists then:

        lh_dev = bpf_net_ctx_get_dev_flush_list();
        if (lh_dev)
                __dev_flush(lh_dev);
        lh_map = bpf_net_ctx_get_cpu_map_flush_list();
        if (lh_map)
                __cpu_map_flush(lh_map);
        lh_xsk = bpf_net_ctx_get_xskmap_flush_list();
        if (lh_xsk)
                __xsk_map_flush(lh_xsk);

But bpf_net_ctx_get_all_used_flush_lists also includes additional checks
for IS_ENABLED(CONFIG_BPF_SYSCALL) and IS_ENABLED(CONFIG_XDP_SOCKETS),
so I guess they should be directly included in the xdp_do_flush and
xdp_do_check_flushed?
Then we could remove the bpf_net_ctx_get_all_used_flush_lists.
Or do you have an idea for a more elegant solution?

Thanks,
Florian

