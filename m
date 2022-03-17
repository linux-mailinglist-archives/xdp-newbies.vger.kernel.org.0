Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413F94DCBEF
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 17:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbiCQRAl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 13:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiCQRAk (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 13:00:40 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AE417A2D3
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 09:59:22 -0700 (PDT)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 613223F07E
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647536361;
        bh=AN74wRHHWmJoTPyr3fviWWQ87neuxchskj/l6ZdNyhA=;
        h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
         Content-Type:Date:Message-ID;
        b=mLa7KOSgf89eq69F57LSFNgLUdXYcIoa1lBvJq44/4S0ESkgqJw11LNM70kumClYt
         PFSnLlNZlFibSn1ij1ARlsbgTNPt0ilIvzRMzHhqHxgU0PQ2+d+R+s+Oi2RdONKNhs
         fhwh2VI2PIAZu05ukud+nGSMv+Bn4oiEM4m+ZvpY/+dB/MGxjD15vLbSdu60UtrRXV
         kiyW58waC5kZ5GECSB+2lsMxy3VUwMDGDZYU59t5UfZp0eQfqWw0BU91a3yLiE+wX8
         1+26F7ulAyGIURiC2UTJNLwi/HGEjipfYRIHZDbmu8e1AuonsOM0DXDeUus7TRShFy
         yOD5esk7fkQ9w==
Received: by mail-pl1-f198.google.com with SMTP id c10-20020a170902d48a00b00151cf8ca3c7so3003814plg.0
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 09:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :comments:mime-version:content-id:date:message-id;
        bh=AN74wRHHWmJoTPyr3fviWWQ87neuxchskj/l6ZdNyhA=;
        b=fvTm4GIqC6Sl8MgOwsjG2XfGvnKYs5wovtKtRoHR1gKZDYRLQXvfkbghAZhouXZgek
         +cdZudWxwkst7TxFURNpyR4M/AI5UG6RCw/daM+FnJl5/+KXQPEPgHgly3t99WJtub8i
         sgrWvWCikMGVL1u8tfcdFIlGeh6F06OtnOJbAXeqnSvbrA/I8vBUOSidjbVCYdcGwRCx
         PNh/sQjDz5eIJToIPooz0YVqqRTOl/sLJrmTfFbBDUcLOYpg14BMMu1MMjoXYcnsZGk/
         bnNiXEeb1gZbREGj2UFAq9ktma881k4VuLNzbo99wBKhSX4La+gg+1t35AdxY94dv2EZ
         Y57A==
X-Gm-Message-State: AOAM530yvbobmgoDmOCWtwSMKwfGn9OHhZaR6gLUJNpAt2qkwRH2YDGr
        h0b4hHHnjj8JBK+rCUgfi3eQejtU3t9YiAg/VRDW8qyCqCHvVB6rBOXJnMYr45J8j0/oj/g7REL
        gvJpKJIrWKRHvB38/weMKS6wSeBiypTaHiA3jGWti
X-Received: by 2002:aa7:968b:0:b0:4f6:fa51:c239 with SMTP id f11-20020aa7968b000000b004f6fa51c239mr5415352pfk.48.1647536359940;
        Thu, 17 Mar 2022 09:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygmFLF4tzocnBCS6PglLFWDmLeFwcUnYTZTcrHm+b7cGGc3W2BAl6HsDTNp3VfC77Amx/0/A==
X-Received: by 2002:aa7:968b:0:b0:4f6:fa51:c239 with SMTP id f11-20020aa7968b000000b004f6fa51c239mr5415327pfk.48.1647536359547;
        Thu, 17 Mar 2022 09:59:19 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.157])
        by smtp.gmail.com with ESMTPSA id x11-20020a056a00188b00b004f9fc695a46sm7195223pfh.169.2022.03.17.09.59.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Mar 2022 09:59:19 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
        id D23655FDEE; Thu, 17 Mar 2022 09:59:18 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
        by famine.localdomain (Postfix) with ESMTP id CD001A0B18;
        Thu, 17 Mar 2022 09:59:18 -0700 (PDT)
From:   Jay Vosburgh <jay.vosburgh@canonical.com>
To:     Federico Parola <federico.parola@polito.it>
cc:     xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
In-reply-to: <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it> <6736.1647529145@famine> <c974a564-0627-33f8-bcb9-9d77d8d1fdcf@polito.it>
Comments: In-reply-to Federico Parola <federico.parola@polito.it>
   message dated "Thu, 17 Mar 2022 16:34:10 +0100."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13623.1647536358.1@famine>
Date:   Thu, 17 Mar 2022 09:59:18 -0700
Message-ID: <13624.1647536358@famine>
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Federico Parola <federico.parola@polito.it> wrote:

>On 17/03/22 15:59, Jay Vosburgh wrote:
>> Federico Parola <federico.parola@polito.it> wrote:
>> 
>>> Hello everybody,
>>> I'm experiencing a strange problem when running an AF_XDP application with
>>> busy poll enabled on a Intel XL710 NIC (i40e driver).
>>> The problem can be replicated running the xdpsock kernel sample in rx or
>>> l2fwd mode.
>>> The first packet I send to the machine is correctly received by the
>>> application. After this, packets are only received in batches of 8.
>>> If I send 7 packets the application sees nothing, while the 8th one
>>> triggers the reception of all 8 packets.
>>> Disabling the busy poll mode everything works fine and packets are
>>> immediately received as they are sent.
>>>
>>> I tried changing kernel (5.12, 5.14 and 5.16) but all present the same
>>> problem.
>>> I also tried using another NIC, an Intel X540 with ixgbe driver and the
>>> problem isn't there, so I guess is NIC/driver related.
>>>
>>> I tried monitoring ethtool statistics. When sending packets between 1 and
>>> 7 these counters are increased:
>>> stat:           64 (             64) <= port.rx_bytes /sec
>>> stat:            1 (              1) <= port.rx_size_64 /sec
>>> stat:            1 (              1) <= port.rx_unicast /sec
>>> stat:            1 (              1) <= rx_unicast /sec
>>>
>>> While the 8th one triggers this updates:
>>> stat:           64 (             64) <= port.rx_bytes /sec
>>> stat:            1 (              1) <= port.rx_size_64 /sec
>>> stat:            1 (              1) <= port.rx_unicast /sec
>>> stat:          477 (            477) <= rx-0.bytes /sec
>>> stat:            8 (              8) <= rx-0.packets /sec
>>> stat:          477 (            477) <= rx_bytes /sec
>>> stat:            8 (              8) <= rx_packets /sec
>>> stat:            1 (              1) <= rx_unicast /sec
>>>
>>> As far as I understand the first set of counters are hardware counters, so
>>> it makes me think that packets are kept in the NIC and not even sent to
>>> memory.
>>>
>>> Does anyone have any suggestion on what could be causing this problem?
>>> Does enabling busy poll set some flag on the NIC?
>> 	We observed similar "batching" behavior on i40e devices late
>> last year in ordinary use (not XDP, but using SR-IOV VFs).  We
>> instrumented the drivers at the send and receive sides, and determined
>> that it appeared to be a behavior of the receiving device itself, i.e.,
>> packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
>> update of the RX ring pointers) until packet 8 arrives, at which point
>> all 8 were delivered simultaneously.
>> 	The issue was evidently in the firmware, and was resolved after
>> a firmware upgrade.
>
>Hi Jay,
>I just updated the firmware to the latest version (v8.50 from v8.30) but
>unfortunately the problem is still there.
>However I'm experiencing the problem only when using AF_XDP in busy poll
>mode, all other modes (standard AF_XDP and normal packet reception) work
>just fine.
>Maybe the two problems are correlated in some way.

	I don't have the firmware release versions for the issue we
looked into (it was at a customer of ours), but the fixed firmware was
provided by HPE/Intel via a support ticket.  Not all devices exhibited
the problem, even with identical firmware; the end solution was to
either apply the vendor's new firmware or replace the cards showing the
problem.  I also don't recall if the fix was the firmware, the NVM
image, or both (at probe time, the i40e driver prints firmware, api and
nvm versions into the kernel dmesg log).

	We saw packet "batches" of both 4 and 8.  Nevertheless, given
the very specific "batching packets into groups of N" behavior, it seems
unlikely to be an unrelated problem.

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
