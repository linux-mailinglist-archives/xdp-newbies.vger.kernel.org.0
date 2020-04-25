Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73C31B86A4
	for <lists+xdp-newbies@lfdr.de>; Sat, 25 Apr 2020 14:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgDYM4c (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 25 Apr 2020 08:56:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55518 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726060AbgDYM4c (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 25 Apr 2020 08:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587819390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PTG0va+xRB1zUcTyxfPADJc1ZThvARECGKOwR6jLuns=;
        b=W2QcLI5iwEsYayXRaA+FpC7dUGX6wpGuTIAsWNGL8wIOR3I4ZXN+dCSXkglgGE2rn7cBcI
        3m7MzjR9xTtjDo/GaMsPH9fScVFD936Njhvfi7wyJsYjRQiGrOfq5ib/XG13M241f+rQCR
        6ojaa4p/x6VjRmmP55R2Ij11TMRIkqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-KACMmJfHP02mPEe2H01kvg-1; Sat, 25 Apr 2020 08:56:26 -0400
X-MC-Unique: KACMmJfHP02mPEe2H01kvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8726D100CCC0;
        Sat, 25 Apr 2020 12:56:25 +0000 (UTC)
Received: from carbon (unknown [10.40.208.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 636881002380;
        Sat, 25 Apr 2020 12:56:21 +0000 (UTC)
Date:   Sat, 25 Apr 2020 14:56:19 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Sowmini Varadhan <sowmini05@gmail.com>
Cc:     brouer@redhat.com,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: building eBPF
Message-ID: <20200425145619.4405a50d@carbon>
In-Reply-To: <20200425122225.GA455@gmail.com>
References: <20200425122225.GA455@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


Cc XDP-newbies, as I cannot scale by doing individual "support".

On Sat, 25 Apr 2020 08:22:25 -0400 Sowmini Varadhan <sowmini05@gmail.com> wrote:

> Hi Jesper, 
> 
> I am trying to get some basic eBPF examples up and running and I ran
> into the problem you describe at https://lkml.org/lkml/2020/2/19/433

Yes, building kernel bpf selftests requires latest LLVM, currently
works with LLVM-10.

> I dont want to deal with building my own llvm (looks like it needs
> more disk space than is available in my test mmachine, and I dont
> want to go hunting for space just yet) so do you have some suggestions
> on how I can work around this (maybe skip some of the advanced
> tests?

The kernel's samples/bpf/ should still builds with LLVM-9 (and lower).
Follow instructions in the README.rst file[1].

There are pre-build Debian and Ubuntu packages for LLVM-10 here:
 https://apt.llvm.org/

> I am just trying to play with basic examples at this point)

I suggest you start with the XDP-tutorial[2], it (still) works with older
LLVM versions: [2] https://github.com/xdp-project/xdp-tutorial


[1] https://github.com/torvalds/linux/blob/master/samples/bpf/README.rst
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

