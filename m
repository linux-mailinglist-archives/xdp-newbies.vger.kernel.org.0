Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB2A6A4360
	for <lists+xdp-newbies@lfdr.de>; Sat, 31 Aug 2019 10:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfHaIle (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 31 Aug 2019 04:41:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:33832 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfHaIle (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 31 Aug 2019 04:41:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Aug 2019 01:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,450,1559545200"; 
   d="scan'208";a="333099822"
Received: from monikash-mobl.ger.corp.intel.com (HELO btopel-mobl.ger.intel.com) ([10.252.39.33])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2019 01:41:30 -0700
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     Pavel Popa <pashinho1990@gmail.com>,
        William Tu <u9012063@gmail.com>
Cc:     =?UTF-8?Q?J=c3=balius_Milan?= <Julius.Milan@pantheon.tech>,
        =?UTF-8?Q?Marek_Z=c3=a1vodsk=c3=bd?= <marek.zavodsky@pantheon.tech>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Thomas F Herbert <therbert@redhat.com>
References: <889477ed79c44e6a9395cf961f782209@pantheon.tech>
 <CA+_TK733RPSU=sEqSFpk-La6RNuJJM4m7xsDgOZ-EnaRAwKwKA@mail.gmail.com>
 <20190823102224.16141c87@carbon>
 <87d6d1ccab164292bb050c55f2cd81f8@pantheon.tech>
 <CALDO+SZRLUopFfiP7C2_Q3LRHDMLQ6_BBN=xw+BQ6FQWGFpVQw@mail.gmail.com>
 <c58d5612-052c-cab1-ad9a-0e0e1a838f5b@intel.com>
 <97f984e84a7049bc80cdf6438d1f5f4d@pantheon.tech>
 <CALDO+SbQeRjrPg5jFEOesEjtAVZSKv8CWipnHOE6FX5CgXBbOw@mail.gmail.com>
 <CAHOxX0xC42SOrP9133QEHw19E4j3_6bPpRzj5jsOzH7TGvaC2Q@mail.gmail.com>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <aa9edd29-1833-90d8-61fc-6b2d50b8e4e1@intel.com>
Date:   Sat, 31 Aug 2019 10:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHOxX0xC42SOrP9133QEHw19E4j3_6bPpRzj5jsOzH7TGvaC2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2019-08-24 09:36, Pavel Popa wrote:
> I'd like to join the questions too, specifically more oriented towards
> AF_XDP devs.
> I understand why the choice of SPSC ring queue design, however what
> would be the cost of a MPSC design (Multiple Producer Single
> Consumer)? In order to have a single UMEM available to the entire net
> device (i.e. bound to all net device's hardware queues), imho this
> would have a huge impact because now, among other things, one wouldn't
> have to bother with ethtool. And do we really want to question the
> convenience of "UMEM per hardware queue" vs "UMEM per net device"?
> Btw, congrats for the great work guys.

Late on the ball...

A MPSC will definitely have a negative performance impact (let me see if
I can find some number from back when we started), but also open up
other issues like shared/multiple address spaces. We opted in for a
simple, performant model where filtering should be done in HW (zero-copy
mode).

What you're describing (SW based switching) might be a better fit for a
XDP + (say) tap with AF_XDP.

Most, if not all, users looking into AF_XDP do it for the zero-copy
performance, and going to the model you're describing will impact
performance too much.



Cheers,
Björn

