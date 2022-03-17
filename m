Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A264DC96B
	for <lists+xdp-newbies@lfdr.de>; Thu, 17 Mar 2022 15:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbiCQPA0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 17 Mar 2022 11:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbiCQPAZ (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 17 Mar 2022 11:00:25 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4FFE6175
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 07:59:09 -0700 (PDT)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 02B093F191
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647529148;
        bh=zfMcIkHm6OkaivkLe3yGylFFOiOl6a8pgRRHKRkx0X0=;
        h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
         Content-Type:Date:Message-ID;
        b=oUpESqeiiP1u1kxCKvMWbUutQv7VeMWQaThE2T3+DdcuAiu9mI4QQMSzUh1UPyITY
         PWnM8LFV6qYJcwLsqx4oLoty7/yS7nu8hcg5FgMorYV7CfZVHFYuu7PoWiH3N09mN4
         qvjVb9aZt7wBRfvZl1GbGVpVZj45BKysqKx+tmPh05Xt7AUgqUSeHL1z5+rRNU+xX8
         kXDn3LGZpdgVVCM/2AhEEjEQ0o87hqV7K7dlU5+8rZfKniEdazdRuksLA8gtZSgYoW
         pJ/f6UhTwkjXGh6gIsEj8+NpvjV/cssC3fMzebVORDL7D/LlTYEMuQ6kSnCK5ztCID
         OkA/0efZ7JSxg==
Received: by mail-pj1-f72.google.com with SMTP id t10-20020a17090a5d8a00b001bed9556134so6436135pji.5
        for <xdp-newbies@vger.kernel.org>; Thu, 17 Mar 2022 07:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :comments:mime-version:content-id:date:message-id;
        bh=zfMcIkHm6OkaivkLe3yGylFFOiOl6a8pgRRHKRkx0X0=;
        b=tqNQTYg9l33+iVDKZUjAQAvtsYuZ3E7pu4uBUqwkuKrSp4gBrHeXTunXKUl19G9Mb9
         cRuhtbftpfRSuOMd6rzZ9MBZLZ7aiz67HwdU0yW8Pte/O4hjxSrn/uLdUAn6sFGnlIIF
         JnPNjTM7Ru+iIjP5FKwh1hbYJYlbidDamu/TqraeVrVn1o6js0nztMdUkeiEzX1rb7vd
         3YqCZweU/JertifBk0Ozbw40M7ylAoZ4pCwB1sfkVun/vVwoQYgJ3IKQrzneJCyJ8LvZ
         mkLHeGyM5IiG+X3UwHhjdVL3oo5+rVeQj6FbP9r0RaCveIbdstRACEnOzip09C3XZ8Ml
         kadA==
X-Gm-Message-State: AOAM533n+nYiPNut97XULLVHlL3G/tIBk+3S7Zj4M22rVYFPMVLzQXRJ
        9XA+55Y5aK1vKLtgot0WotBgXS7xynfspZDXzjZlTafEAeSWbVENNoau5xnHlMkmXT67awLA7ve
        zmvpIZxopgtSCOY/asl6xPQzBYbhyjH7lk9YB6UeB
X-Received: by 2002:a05:6a00:23d1:b0:4f7:109d:a1c1 with SMTP id g17-20020a056a0023d100b004f7109da1c1mr5422801pfc.2.1647529146463;
        Thu, 17 Mar 2022 07:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNuyGca6s56ZjJb6WJ0KusrPoFqJj3VuhRiUoQducd+ySfF8PdMT4vBOu8MgJwWzCq165crg==
X-Received: by 2002:a05:6a00:23d1:b0:4f7:109d:a1c1 with SMTP id g17-20020a056a0023d100b004f7109da1c1mr5422770pfc.2.1647529146107;
        Thu, 17 Mar 2022 07:59:06 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.157])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a00162a00b004f6fc39c081sm6311852pfc.211.2022.03.17.07.59.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Mar 2022 07:59:05 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
        id 5203A5FDEE; Thu, 17 Mar 2022 07:59:05 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
        by famine.localdomain (Postfix) with ESMTP id 49F0DA0B18;
        Thu, 17 Mar 2022 07:59:05 -0700 (PDT)
From:   Jay Vosburgh <jay.vosburgh@canonical.com>
To:     Federico Parola <federico.parola@polito.it>
cc:     xdp-newbies@vger.kernel.org
Subject: Re: AF_XDP busy poll receives packets in batches of 8 on i40e
In-reply-to: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
References: <75e41d4c-a5be-bbdc-16cd-379b79e88c5b@polito.it>
Comments: In-reply-to Federico Parola <federico.parola@polito.it>
   message dated "Thu, 17 Mar 2022 15:36:27 +0100."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6735.1647529145.1@famine>
Date:   Thu, 17 Mar 2022 07:59:05 -0700
Message-ID: <6736.1647529145@famine>
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

>Hello everybody,
>I'm experiencing a strange problem when running an AF_XDP application with
>busy poll enabled on a Intel XL710 NIC (i40e driver).
>The problem can be replicated running the xdpsock kernel sample in rx or
>l2fwd mode.
>The first packet I send to the machine is correctly received by the
>application. After this, packets are only received in batches of 8.
>If I send 7 packets the application sees nothing, while the 8th one
>triggers the reception of all 8 packets.
>Disabling the busy poll mode everything works fine and packets are
>immediately received as they are sent.
>
>I tried changing kernel (5.12, 5.14 and 5.16) but all present the same
>problem.
>I also tried using another NIC, an Intel X540 with ixgbe driver and the
>problem isn't there, so I guess is NIC/driver related.
>
>I tried monitoring ethtool statistics. When sending packets between 1 and
>7 these counters are increased:
>stat:           64 (             64) <= port.rx_bytes /sec
>stat:            1 (              1) <= port.rx_size_64 /sec
>stat:            1 (              1) <= port.rx_unicast /sec
>stat:            1 (              1) <= rx_unicast /sec
>
>While the 8th one triggers this updates:
>stat:           64 (             64) <= port.rx_bytes /sec
>stat:            1 (              1) <= port.rx_size_64 /sec
>stat:            1 (              1) <= port.rx_unicast /sec
>stat:          477 (            477) <= rx-0.bytes /sec
>stat:            8 (              8) <= rx-0.packets /sec
>stat:          477 (            477) <= rx_bytes /sec
>stat:            8 (              8) <= rx_packets /sec
>stat:            1 (              1) <= rx_unicast /sec
>
>As far as I understand the first set of counters are hardware counters, so
>it makes me think that packets are kept in the NIC and not even sent to
>memory.
>
>Does anyone have any suggestion on what could be causing this problem?
>Does enabling busy poll set some flag on the NIC?

	We observed similar "batching" behavior on i40e devices late
last year in ordinary use (not XDP, but using SR-IOV VFs).  We
instrumented the drivers at the send and receive sides, and determined
that it appeared to be a behavior of the receiving device itself, i.e.,
packets 1 - 7 would be held indefinitely (as I recall, no interrupt or
update of the RX ring pointers) until packet 8 arrives, at which point
all 8 were delivered simultaneously.

	The issue was evidently in the firmware, and was resolved after
a firmware upgrade.

	-J

>
>Best regards,
>Federico Parola

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
