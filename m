Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68905105603
	for <lists+xdp-newbies@lfdr.de>; Thu, 21 Nov 2019 16:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUPuD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 21 Nov 2019 10:50:03 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]:44647 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfKUPuD (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 21 Nov 2019 10:50:03 -0500
Received: by mail-qt1-f174.google.com with SMTP id o11so4141656qtr.11
        for <xdp-newbies@vger.kernel.org>; Thu, 21 Nov 2019 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BaUkfl74wzMDELp0SC0EoTqLGJqA2Tb78CMhbpZODBE=;
        b=oh+b+xt9+pGWpuq3obkV2p5159hfCAtd0sxbjWTUCecLR0FhK8fnWASyk/CCgDzpN5
         SbwPZC27lNSbnwojoQe8wX5lAuHH3tPyiQziWavFAG3L30gGgd6MjqV9/prBy9YRtOJK
         xU3cD4vVLkLMiVzwtMBm1ZT8uOlXubJI7Wr4ZGmYhIy1hvBxNQjbBJLesjojThDESKNX
         p6DoVFpykpMiMW0YHBeXoyFZ0oqNKzSXhtlH2gSEhhIabsF9Gi2awgYk2PW0a3rGwUfn
         xhbi6ez26ECGpd0zPq0ct/SgzJNhtb5G3da+RPO3P1EQVCyy6izc9fKZiRYJ7mCnW3z6
         oqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BaUkfl74wzMDELp0SC0EoTqLGJqA2Tb78CMhbpZODBE=;
        b=N54qJSxg0PweI3+bASsDD5LDpk0jVd4lXOgPAiEL7jahWm+8IiQJ2nqOkbHlQuGUwj
         ZmHXgceo5ydxopQvem+8xN9Kc/1G4R0JzVMqRfpRMqLBgfT6fj999Afb//rvYqOTa7/a
         hAMI0rtYLfBD5+i719TchE6ANo/nZ1kqrh1DqAttj29iRGG+M6ymSgR2tmpOzgIuBGmV
         FQlco6J/1rgHHlXOdqVOvpjnGi/vjXLiPIYAc7iVDlZvFXTrvSU/e6l/HJQWEdXwso/j
         9m3bNv4fBYkiSZVvem6zf301NntZy9X2iUZ77EOCCSEaprAw6s86fRCdIifKorUo8XW7
         wAlw==
X-Gm-Message-State: APjAAAWfDA6/6setj3ICfVZ2Han0EH2QnYxOWtSVcaY9GgMJnpYaFQBy
        jdW4w174Ztg88n5Ondpso/KPW+fn
X-Google-Smtp-Source: APXvYqy69KmtRb1IqbKOreXN8QV8B1atcPT8b9ZTQQyvKCYloAe+1ijxzZVAwPTJXUp/bZZUhVHXHA==
X-Received: by 2002:ac8:502:: with SMTP id u2mr9188717qtg.122.1574351401468;
        Thu, 21 Nov 2019 07:50:01 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:b9b1:601f:b338:feda])
        by smtp.googlemail.com with ESMTPSA id l93sm1735376qtd.86.2019.11.21.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 07:50:00 -0800 (PST)
Subject: Re: error loading xdp program on virtio nic
To:     Jason Wang <jasowang@redhat.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
References: <c484126f-c156-2a17-b47d-06d08121c38b@gmail.com>
 <89f56317-5955-e692-fcf0-ee876aae068b@redhat.com>
 <3dc7b9d8-bcb2-1a90-630e-681cbf0f1ace@gmail.com>
 <18659bd0-432e-f317-fa8a-b5670a91c5b9@redhat.com>
 <f7b8df14-ef7f-be76-a990-b9d71139bcaa@gmail.com>
 <20191121072625.3573368f@carbon>
 <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com>
Date:   Thu, 21 Nov 2019 08:49:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4686849f-f3b8-dd1d-0fe4-3c176a37b67a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/21/19 12:02 AM, Jason Wang wrote:
> By specifying queues property like:
> 
> <devices>
> 
>   <interface type='network'>
>     <source network='default'/>
>     <target dev='vnet1'/>
>     <model type='virtio'/>
>     <driver name='vhost' txmode='iothread' ioeventfd='on'
> event_idx='off' queues='5' rx_queue_size='256' tx_queue_size='256'>

I can not check this because the 3.0 version of libvirt does not support
tx_queue_size. It is multiqueue (queues=5 in the example) setting that
needs to be set to 2*Nvcpus for XDP, correct?

>       <host csum='off' gso='off' tso4='off' tso6='off' ecn='off'
> ufo='off' mrg_rxbuf='off'/>
>       <guest csum='off' tso4='off' tso6='off' ecn='off' ufo='off'/>
>     </driver>
>     </interface>
> </devices>
> 
> 

The virtio_net driver suggests the queues are needed for XDP_TX:

       /* XDP requires extra queues for XDP_TX */
        if (curr_qp + xdp_qp > vi->max_queue_pairs) {
                NL_SET_ERR_MSG_MOD(extack, "Too few free TX rings
available");
                netdev_warn(dev, "request %i queues but max is %i\n",
                            curr_qp + xdp_qp, vi->max_queue_pairs);
                return -ENOMEM;
        }

Doubling the number of queues for each tap device adds overhead to the
hypervisor if you only want to allow XDP_DROP or XDP_DIRECT. Am I
understanding that correctly?
