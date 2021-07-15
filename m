Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9223CAC3C
	for <lists+xdp-newbies@lfdr.de>; Thu, 15 Jul 2021 21:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245152AbhGOTbj (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 15 Jul 2021 15:31:39 -0400
Received: from telegrapho.inexo.com.br ([187.17.38.24]:38448 "EHLO
        telegrapho.inexo.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244368AbhGOT2z (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 15 Jul 2021 15:28:55 -0400
Received: by telegrapho.inexo.com.br (Postfix, from userid 1001)
        id C77F47AC4773; Thu, 15 Jul 2021 16:25:54 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br C77F47AC4773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1626377154;
        bh=10igCcdOJMDRYofpaV/Ef/1aLqludEDiHAIxhzyT9NM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U1Lj528i0wn4V9OlOtcm/hfBvbRmc1CZ+O4DUs+sRAzL+bQbfhat9RdjpLWLhH01n
         pS66t+qrHUHjdn4cn3cDePrzkSQeff2ArpbUghdWiyt1V5sm62jjvjdP4gti9xS+WM
         2lStyxOZIH00kVAelNRxnIYOQ2mwuH3Rz+K0SudyAk/hwUiBJhC4ERYTHgQlLI1gSL
         onMK5s/fl6DS7ZMBodt7+UMIMLrRDynCMSL7JKQnb/lWbIFalJ72hlmUf1fn3J5Siu
         htax/pdT0i9pU39TG+5d0NxCeOKXiFvsxO6cAlaBR0CMGQfmINH1q2/ek/GnIbDwYd
         UbYTaZizPmOtg==
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        telegrapho.inexo.com.br
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=ALL_TRUSTED,DKIM_INVALID,
        DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.4
Received: from babalu (unknown [187.17.36.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by telegrapho.inexo.com.br (Postfix) with ESMTPSA id 8C71F7AC4770;
        Thu, 15 Jul 2021 16:25:54 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 telegrapho.inexo.com.br 8C71F7AC4770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
        s=mail; t=1626377154;
        bh=10igCcdOJMDRYofpaV/Ef/1aLqludEDiHAIxhzyT9NM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U1Lj528i0wn4V9OlOtcm/hfBvbRmc1CZ+O4DUs+sRAzL+bQbfhat9RdjpLWLhH01n
         pS66t+qrHUHjdn4cn3cDePrzkSQeff2ArpbUghdWiyt1V5sm62jjvjdP4gti9xS+WM
         2lStyxOZIH00kVAelNRxnIYOQ2mwuH3Rz+K0SudyAk/hwUiBJhC4ERYTHgQlLI1gSL
         onMK5s/fl6DS7ZMBodt7+UMIMLrRDynCMSL7JKQnb/lWbIFalJ72hlmUf1fn3J5Siu
         htax/pdT0i9pU39TG+5d0NxCeOKXiFvsxO6cAlaBR0CMGQfmINH1q2/ek/GnIbDwYd
         UbYTaZizPmOtg==
Date:   Thu, 15 Jul 2021 16:25:53 -0300
From:   "Ethy H. Brito" <ethy.brito@inexo.com.br>
To:     Ivan Koveshnikov <ikoveshnik@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: bpf_debug output
Message-ID: <20210715162553.3e151bae@babalu>
In-Reply-To: <CAHQrGVPbu8WVEaGWV1ytuOwx=-yam0OHD2fpOQdVVHTUz9F2GQ@mail.gmail.com>
References: <20210714000804.426ed1f5@babalu>
        <CAHQrGVPbu8WVEaGWV1ytuOwx=-yam0OHD2fpOQdVVHTUz9F2GQ@mail.gmail.com>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 14 Jul 2021 22:06:48 +0500
Ivan Koveshnikov <ikoveshnik@gmail.com> wrote:

> Hi Ethy,

Hi Ivan (and others behind the bushes)

> 
> Correct. The output is available via file
> `/sys/kernel/debug/tracing/trace_pipe`. There are other helper
> programs that can also read it, like `bpftool prog tracelog` or `tc
> exec bpf dbg`.
> 
> But you need to pay attention, what you're trying to print, since
> `bpf_printk()` supports much fewer formats than usual `printk()`. I.e.
> only  `%d %i %u %x %ld %li %lu %lx %lld %lli %llu %llx %p %s`
> conversion specifiers are allowed. If an unsupported specifier is
> spotted, the string is silently dropped and never appears in trace
> log.

Very useful info. 
I couldn't see my logs just because of this: unsupported format.
Now it is OK.

> 
> Here you can find some examples:
> https://github.com/xdp-project/xdp-tutorial/tree/master/tracing03-xdp-debug-print

Thanx

Regards

Ethy



> 
> 
> Best regards,
> Ivan Koveshnikov
> 
> On Wed, 14 Jul 2021 at 08:08, Ethy H. Brito <ethy.brito@inexo.com.br> wrote:
> >
> >
> > Hi!
> >
> > I am working on some minor modifications in xdp-cpumap-tc to accommodate NAT at WAN side.
> > But the things are not working as expected.
> >
> > How can bpf_debug be used to help debugging?
> >
> > I read that its output ends-up in /sys/kernel/debug/tracing/trace_pipe.
> > But how can it be read?
> > I tried "cat trace_pipe" but this produced no output whatsoever.
> >
> > Any hints will be appreciated.
> >
> > Thanx
> >
> > Regards
> >
> > Ethy  


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
