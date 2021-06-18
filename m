Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A4B3AD06D
	for <lists+xdp-newbies@lfdr.de>; Fri, 18 Jun 2021 18:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhFRQdc (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 18 Jun 2021 12:33:32 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:52804 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhFRQdc (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 18 Jun 2021 12:33:32 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id 5F6936690A73; Fri, 18 Jun 2021 13:31:13 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 5F6936690A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624033873;
        bh=Cg1S+KIMXdpSeuR6NS/f61APlGZR8RRGc2j5SOQo9bU=;
        h=Date:From:To:Subject:From;
        b=k33+IRpq46dtGNKyRQUSHw8sTOxv+tBI5ECCmVAYwQuYbva8KFMpAofMpxe0Q2D0I
         /0SYhiyheeLPpQn7bxHLdMz+zWpeOPkxRWel4GVlJ/XRJ1fgORWvkDlFz8gJfGznOB
         LPDDnlReAo3VzdUuTOREDHbN9dzV93k5d9SAjU/QBx4bYnun8STmQE4WNgthuY5MqC
         dQUkIO9knxNNu1lsKXkoPfKJN7XwnFu4H1jUEMOJuuanz3gDxFFdzj9H8wbGUAWy9m
         srGyjXcBdKKY5BBhpJ42D2Xp92+YowdDMn1qvjXoGu31+munnifNCxTI7NT2vAEXR6
         CD+9RtXt/az5A==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 0FD42669090D
        for <xdp-newbies@vger.kernel.org>; Fri, 18 Jun 2021 13:31:07 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 0FD42669090D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1624033867;
        bh=Cg1S+KIMXdpSeuR6NS/f61APlGZR8RRGc2j5SOQo9bU=;
        h=Date:From:To:Subject:From;
        b=sQ+weeBpY7lSMhERK8sAb+isMixa7CKZUGtOlx9xHiwIOpByOCWTeCoJwCIyhzUQR
         owc86IBXZG1ZIjGdS+OZx4/VcsTlUB2hFcGh9Bj+qGR/NskuX0jGomEv8xVRMOh4a0
         q7pGBJy/S3CokI2YCivsznOHFUlgNh963SuaS6hhItYXN3UaAyTwHFVc8xG4HuV40Z
         hDGF7pl2Gx6vpq769/dYbqsUT8W05ibabEYv58TdG+NkpPAWKj7EkKkNDlWi1hhwoo
         m2V8YdDq2jtMLiVnfkeXt5bjAErhezPSjP1NUs9FkDNwDyilvuYbXi+k55AOTUBDyZ
         eLl4gATw01rBw==
Date:   Fri, 18 Jun 2021 13:31:06 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Newbie questions
Message-ID: <20210618133106.01f2129b@babalu>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Hi All.

I've been doing some home work reading the docs and some doubts have raised.
For reference, my environment is 
	Ubuntu 20.04
	kernel 5.4.0-66 
	tc utility, iproute2-ss200127.

1) https://xdp-project.net/areas/cpumap.html#cpumap--Create-script-MQ-HTB-silo-setup says that: 
	"XPS (Transmit Packet Steering) will take precedence over any changes to 
	skb->queue_mapping. You need to disable *XDP* via mask=00 in files 
	/sys/class/net/DEV/queues/tx-*/xps_cpus"

Shouldn't it say I need to disable *XPS* (not XDP) using mask=00??

2) Taking tc_mq_htb_setup_example.sh as reference, how to enable XDP?
Since I have to disable XPS, I assume I have to enable something in replacement, right?
How to set that CPU-0 will deal with mq queue 7FFF:1, CPU-1 will deal with 7FFF:2, and so on?

3) Is XDP available in kernel 5.4.0 ?

4) Is XPS a suitable "substitute" for XDP ?

Thank you for your time.

Regards Ethy
