Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 176BB107520
	for <lists+xdp-newbies@lfdr.de>; Fri, 22 Nov 2019 16:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKVPny (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 22 Nov 2019 10:43:54 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:44358 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfKVPny (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 22 Nov 2019 10:43:54 -0500
Received: by mail-io1-f42.google.com with SMTP id j20so8450027ioo.11
        for <xdp-newbies@vger.kernel.org>; Fri, 22 Nov 2019 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l0bO6lO+uu3c2C8T/fIWMTLp6yCKWh/tmiuGD2u1phA=;
        b=u07fyx1RcSiG2ZIoAFSuyNhZR9XMSf/+d/3TuoR2M3ezHfd5BBXeMBMWvFWmBTfHy3
         Q6z7X+MujtSsvslmQs+EnWK0MqekortFKdBn/V1zz2+huGCaoz/tDtk+eOMMpLK8f9LM
         y25glF3dBGcngFNb15/mGmosZ5iKMpUoP7JYP0j0GKMkqwYra9aRrS1CCswqRGOzx+WD
         5Bh+fLBXQd+nm2bg/ZXyflLE2VRTC8mfTZLbX9JyWz5lBF+F2rymLbQbZa97JxnJXrRU
         eKMh6m31smVxqVApQgxwSWeOBAfEaR6BmBA8yHqkA3AzF21AEPq6dOAtS6wPgAUMSFnW
         VMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l0bO6lO+uu3c2C8T/fIWMTLp6yCKWh/tmiuGD2u1phA=;
        b=spZCNz/Avuv9qJSLyRm0DUGegg10wR5gtyB0IpnnWfpq1vgYn/IRu0YRN94UOAjjh/
         gluaRH42xCQbiFvG8BFuSVD4yRs122nkB1GeytWtKJiEINzjEjKJ59jDVwVxXFBBT8aj
         sg6HEOym1AjrHhjvbreRqUVa5xwIzPx/SyFaTlooGSBqGuNDzNiHCApyilVsGvOBzOjB
         DdN0i9kpAJFfUmOogvPFEhiSMelwYImG8tVR+x2ZwJpg2Pf/vPw5/VTMYWn2p0bbFApb
         Vf1NhRPb36RWzS+oN721o5yiB/9NqSIaX/ANoM0C9sOV6hhsLSjcdjl2b9fx4/qAoFcJ
         xNlQ==
X-Gm-Message-State: APjAAAWvcLp9DiuvaqfENZ10eaT0BUE4XVWt0IxLyQl4OjoHBk17ASOG
        UxLtBiwb7z82gAUB/MLCKWtjWle/
X-Google-Smtp-Source: APXvYqyBOKEpmCC5SSL2tRnoMVinpbBTNyOilizcTZgE536ZKo31W4ml7bOHxieoN6hwk1j7Eo4oEA==
X-Received: by 2002:a5d:8195:: with SMTP id u21mr13357452ion.178.1574437432687;
        Fri, 22 Nov 2019 07:43:52 -0800 (PST)
Received: from dahern-DO-MB.local ([2601:282:800:fd80:b0cf:5043:5811:efe3])
        by smtp.googlemail.com with ESMTPSA id v16sm2357264iot.77.2019.11.22.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 07:43:51 -0800 (PST)
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
 <df4ae5e7-3f79-fd28-ea2e-43612ff61e6f@gmail.com>
 <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <8324a37e-5507-2ae6-53f6-949c842537e0@gmail.com>
Date:   Fri, 22 Nov 2019 08:43:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f7b19bae-a9cf-d4bf-7eee-bfe644d87946@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 11/21/19 11:09 PM, Jason Wang wrote:
>> Doubling the number of queues for each tap device adds overhead to the
>> hypervisor if you only want to allow XDP_DROP or XDP_DIRECT. Am I
>> understanding that correctly?
> 
> 
> Yes, but there's almost impossible to know whether or not XDP_TX will be
> used by the program. If we don't use per CPU TX queue, it must be
> serialized through locks, not sure it's worth try that (not by default,
> of course).
> 

This restriction is going to prevent use of XDP in VMs in general cloud
hosting environments. 2x vhost threads for vcpus is a non-starter.

If one XDP feature has high resource needs, then we need to subdivide
the capabilities to let some work and others fail. For example, a flag
can be added to xdp_buff / xdp_md that indicates supported XDP features.
If there are insufficient resources for XDP_TX, do not show support for
it. If a program returns XDP_TX anyways, packets will be dropped.
