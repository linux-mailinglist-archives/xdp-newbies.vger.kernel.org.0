Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA98514306A
	for <lists+xdp-newbies@lfdr.de>; Mon, 20 Jan 2020 18:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgATRET (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 20 Jan 2020 12:04:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:54804 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgATRET (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 20 Jan 2020 12:04:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 09:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="426810785"
Received: from nmilosev-mobl2.ger.corp.intel.com (HELO btopel-mobl.ger.intel.com) ([10.252.51.72])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2020 09:04:16 -0800
Subject: Re: zero-copy between interfaces
To:     Ryan Goodfellow <rgoodfel@isi.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "Karlsson, Magnus" <magnus.karlsson@intel.com>,
        intel-wired-lan <intel-wired-lan@lists.osuosl.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
References: <14f9e1bf5c3a41dbaec53f83cb5f0564@isi.edu>
 <CAJ+HfNhdPEe34DVUAj4eHxLkBUSTo2CXbLHoWu+dwFCp753oMg@mail.gmail.com>
 <20200117171637.GB69024@smtp.ads.isi.edu>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <a0f645bc-82b6-5b14-4608-bfde991a6678@intel.com>
Date:   Mon, 20 Jan 2020 18:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117171637.GB69024@smtp.ads.isi.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org


On 2020-01-17 18:16, Ryan Goodfellow wrote:
[...]
> 
> https://gitlab.com/mergetb/tech/network-emulation/kernel/snippets/1931080
> 

Ryan, thanks a lot for the detailed report! Much appreciated!

Long story short, the i40e crash is that the drivers tries to allocate 
256 queues, but the HW is short on queues. The drivers enters a broken 
state, which triggers the crash.

I'll make sure we'll get a patch for this.


Björn
