Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF41C2DCDE0
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Dec 2020 09:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgLQIwD (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Dec 2020 03:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51232 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgLQIwC (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Dec 2020 03:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608195036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=//iok/cNSbIwLGQLEibinUwlZoHqQbQ6gcRnT+3N6Gg=;
        b=RAnB2UzP7ZAGXj+lUZU43zfEy4rdfpz4u0MEs05craohrpYq6gZ9rKv9L6VrRVM9GsvI+g
        /cnjWTT2GTtmZsMbWldAxkB3kFssMdffGXyuWk3bMp1E99asl+N/ui0TgLbJtw7lkAdyA2
        T7qnGH/XIperDj3DZb5XTUaHuuUqz9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-LY0Aeku6P5qFAA3qPSjiYA-1; Thu, 17 Dec 2020 03:50:34 -0500
X-MC-Unique: LY0Aeku6P5qFAA3qPSjiYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 128A51005504;
        Thu, 17 Dec 2020 08:50:33 +0000 (UTC)
Received: from carbon (unknown [10.36.110.6])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07F0560C15;
        Thu, 17 Dec 2020 08:50:28 +0000 (UTC)
Date:   Thu, 17 Dec 2020 09:50:26 +0100
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Christian Deacon <gamemann@gflclan.com>
Cc:     brouer@redhat.com, xdp-newbies@vger.kernel.org
Subject: Re: XDP BPF Stack Limit Issues
Message-ID: <20201217095016.1f38e06c@carbon>
In-Reply-To: <ad6ea0ec-c5ce-2887-6f4c-7ed762a0f130@gflclan.com>
References: <ad6ea0ec-c5ce-2887-6f4c-7ed762a0f130@gflclan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 16 Dec 2020 09:29:05 -0600
Christian Deacon <gamemann@gflclan.com> wrote:

> Hey everyone,
> 
> I've been trying to implement IPv6 support into an XDP Firewall which 
> can be found below.
> 
> https://github.com/gamemann/XDP-Firewall
> 
> Unfortunately, I've been fighting with the BPF verifier and I'm 
> exceeding the BPF stack size of 512 bytes. I linked the above in the 
> case others want to see the headers that define things like 
> `MAX_FILTERS` inside the XDP program. The error I am receiving is:
> 
> ```
> error: <unknown>:0:0: in function xdp_prog_main i32 (%struct.xdp_md*): 
> Looks like the BPF stack limit of 512 bytes is exceeded. Please move 
> large on stack variables into BPF per-cpu array map.
> ```
> 
> Which spams anywhere from 3 - 10 times depending on what I try to 
> resolve the issue.
> 
> I ended up re-writing the entire program trying to use as little 
> variables as possible and I got very close to getting the program to 
> compile until I added support for the ICMPv6 protocol (once I remove 
> this, it compiles and runs without any issues). I'm at a loss on what I 
> can do now, though.
> 
> The current XDP program code is the following.
> 
> https://gist.github.com/gamemann/a0acd9603405c3d7b3c792b5429ced38
> 
>  From what the error states, I could try storing variables into a 
> per-CPU BPF map. Therefore, I tried storing the ICMP (and at one point 
> TCP) information into a BPF map and used the data later on which can be 
> found below.
> 
> https://gist.github.com/gamemann/663674924e16286b02a835637912c2a5
> 
> This still exceeded the BPF stack size. 

I have to look elsewhere[2] to see that:
 #define MAX_FILTERS 55

Your problem is that you create an array with 55 pointers each 8 bytes
equal 440 bytes on the stack (max stack is 512).  Why do you need to
lookup all 55 map elements in a loop before using them?

https://gist.github.com/gamemann/663674924e16286b02a835637912c2a5#file-xdp_fw_ipv6_maps-c-L267

 struct filter *filter[MAX_FILTERS];
 for (uint8_t i = 0; i < MAX_FILTERS; i++)
    {
        key = i;
        
        filter[i] = bpf_map_lookup_elem(&filters_map, &key);
    }
 [...]
 for (uint8_t i = 0; i < MAX_FILTERS; i++)
    {
        // Check if ID is above 0 (if 0, it's an invalid rule).
        if (!filter[i] || filter[i]->id < 1)
  [...]

> With that said, I'd assume 
> performance would be heavily impacted if we stored everything inside a 
> BPF map. To my understanding, per-CPU maps cannot be reliably read 
> within the XDP program. Therefore, if this would have worked, I'd 
> probably want to use a regular non per-CPU map anyways which would 
> impact performance.
> 
> I also tried BPF calls without luck and was thinking about trying BPF 
> tail calls. Though, I don't think this would help. BPF tail calls use 
> the same BPF stack to my understanding.
> 
> I could try adding even more variables inside the program to a BPF map 
> such as the PPS and BPS variables. However, I wanted to see if there 
> were any other suggestions from the mailing list on this. I plan to 
> write another firewall that'll have a lot more functionality than this 
> firewall in XDP and I'm worried I'd run into similar issues there.
> 
> Any help would be highly appreciated and thank you for your time!
> 



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

