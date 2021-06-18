Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0176F3AD3B6
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Jun 2021 22:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbhFRUja (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Jun 2021 16:39:30 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:57336 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233558AbhFRUj3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Jun 2021 16:39:29 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 68EA46690A9B; Fri, 18 Jun 2021 17:37:18 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 68EA46690A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624048638;
        bh=yd0vM/dGo0dQTH4AlWAUo7hIatq9HA+FACHTmqcqgnk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aEQN1w0IDjO22qvRwNKqnXqTRyIkb3ZJlyy9uh9+wrH31Hsx9YplHQRgS8qZbHZ6t
         uXNQZ+aZjAoO6hqkZxRa9Rw0vKU/JsbhcU1NZM4B/AF/SM5KtnPvQJE29f/JeDrT+d
         OlFe6vE4c6I1wDyhLPreb+IOTrZobaAs79yjQHy5AK4dMwSACNknl5qb/1GtgnZkQB
         1Rn97KbAeFc+O47dnF9YYU1O+PLC68z6iiwSdUaCj+M4lpjw2ErGJhP2mHgkbJzW4a
         jWgPZwB6mFLrdeHkNubs7KI5iUhG4GGW+q7FXm+UNtOZRPpoBason+E3FP4KsDPTwu
         RglVh+GbZrDZw==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id EF99B6690A94;
        Fri, 18 Jun 2021 17:37:17 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br EF99B6690A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624048638;
        bh=yd0vM/dGo0dQTH4AlWAUo7hIatq9HA+FACHTmqcqgnk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aEQN1w0IDjO22qvRwNKqnXqTRyIkb3ZJlyy9uh9+wrH31Hsx9YplHQRgS8qZbHZ6t
         uXNQZ+aZjAoO6hqkZxRa9Rw0vKU/JsbhcU1NZM4B/AF/SM5KtnPvQJE29f/JeDrT+d
         OlFe6vE4c6I1wDyhLPreb+IOTrZobaAs79yjQHy5AK4dMwSACNknl5qb/1GtgnZkQB
         1Rn97KbAeFc+O47dnF9YYU1O+PLC68z6iiwSdUaCj+M4lpjw2ErGJhP2mHgkbJzW4a
         jWgPZwB6mFLrdeHkNubs7KI5iUhG4GGW+q7FXm+UNtOZRPpoBason+E3FP4KsDPTwu
         RglVh+GbZrDZw==
Date:   Fri, 18 Jun 2021 17:37:17 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Newbie questions
Message-ID: <20210618173717.581e1058@babalu>
In-Reply-To: <20210618194007.4dfb838b@carbon>
References: <20210618133106.01f2129b@babalu>
        <20210618194007.4dfb838b@carbon>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Fri, 18 Jun 2021 19:40:17 +0200
Jesper Dangaard Brouer <brouer@redhat.com> wrote:

> On Fri, 18 Jun 2021 13:31:06 -0300
> "Ethy H. Brito" <ethy.brito@inexo.com.br> wrote:
> 
> > Hi All.
> > 
> > I've been doing some home work reading the docs and some doubts have raised.
> > For reference, my environment is 
> > 	Ubuntu 20.04
> > 	kernel 5.4.0-66 
> > 	tc utility, iproute2-ss200127.
> > 
> > 1) https://xdp-project.net/areas/cpumap.html#cpumap--Create-script-MQ-HTB-silo-setup says that: 
> > 	"XPS (Transmit Packet Steering) will take precedence over any changes to 
> > 	skb->queue_mapping. You need to disable *XDP* via mask=00 in files 
> > 	/sys/class/net/DEV/queues/tx-*/xps_cpus"
> > 
> > Shouldn't it say I need to disable *XPS* (not XDP) using mask=00??  
> 
> You are absolutely right it is a typo. Can I ask you to fix that and
> send a GitHub PR?
> 
> The file you need to change is:
>  https://github.com/xdp-project/xdp-project/blob/master/areas/cpumap.org
> 

I'll have to figure it out how to do that. 
Never edited a GitHub before.

>  
> > 2) Taking tc_mq_htb_setup_example.sh as reference, how to enable XDP?  
> 
> XDP gets enabled when you load an XDP program.

Ok.

> 
> > Since I have to disable XPS, I assume I have to enable something in
> > replacement, right?  
> 
> No, XPS is just a kernel feature you need to disable, because it
> conflicts with the TC-BPF program usage of skb->queue_mapping.

Pretty advanced topic. But I'll get there.

> 
> 
> > How to set that CPU-0 will deal with mq queue 7FFF:1, CPU-1 will deal
> > with 7FFF:2, and so on?  
> 
> That is the role of the XDP program that redirect into a cpumap, and
> the key in the cpumap is the CPU number.

You mean I have to master this tutorial:
https://github.com/xdp-project/xdp-tutorial/blob/master/setup_dependencies.org

right?

> 
>  
> > 3) Is XDP available in kernel 5.4.0 ?  
> 
> I think so.
> 
> The real question is what NIC card drivers are you using?

driver=i40e driverversion=2.8.20-k duplex=full firmware=8.15

Is it ok for xdp use?

> 
> 
> > 4) Is XPS a suitable "substitute" for XDP ?  
> 
> XPS and XDP are completely unrelated kernel features.

I thought their both primary goal was to redirect packets to be handled by a specific CPU.

The difference would be that XDP does this upstream compared with XPS.
At least, I understand this way reading
https://developers.redhat.com/blog/2021/05/13/receive-side-scaling-rss-with-ebpf-and-cpumap#
 at "Faster software receive steering with XDP" paragraph
Is my understanding incorrect?

Regards

Ethy


> 
> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer
> 


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
