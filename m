Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C01D1A4392
	for <lists+xdp-newbies@lfdr.de>; Sat, 31 Aug 2019 11:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbfHaJOA (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 31 Aug 2019 05:14:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:19885 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfHaJOA (ORCPT <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 31 Aug 2019 05:14:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Aug 2019 02:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,450,1559545200"; 
   d="scan'208";a="333103717"
Received: from monikash-mobl.ger.corp.intel.com (HELO btopel-mobl.ger.intel.com) ([10.252.39.33])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2019 02:13:57 -0700
Subject: Re: AF_XDP integration with FDio VPP? (Was: Questions about XDP)
To:     =?UTF-8?Q?J=c3=balius_Milan?= <Julius.Milan@pantheon.tech>,
        William Tu <u9012063@gmail.com>,
        =?UTF-8?Q?Marek_Z=c3=a1vodsk=c3=bd?= <marek.zavodsky@pantheon.tech>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
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
 <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
From:   =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <6a5a1ce1-29ff-0d11-1b07-8472d5e3f32d@intel.com>
Date:   Sat, 31 Aug 2019 11:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a6d5b3562fd148619c09ffbed54d84ea@pantheon.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 2019-08-30 18:37, Július Milan wrote:
> Hi all
> 
> Regarding 4K frame size constraint of AF_XDP, what does AF_XDP when receives frame bigger than 4K? Drops it or cut it or split it between more frames?
> Thinking about what to do with them on TX side.
>

AF_XDP stands on XDP's shoulders, and currently XDP does not support
frames larger than a page (4k). This will most likely change for AF_XDP.


> If you are interested in mentioned AF_XDP driver for vpp, here you can find it: https://gerrit.fd.io/r/c/vpp/+/21606
> It is still work in progress, I submitted it for review just yesterday and rebased it on recently found code in review of Damjan.
>

Very cool! Will check it out!


Cheers,
Björn

> To run it, you need to have compatible XDP program loaded on interface you want to attach to.
> This separation is here because we want user to be able to create custom XDP programs independently.
> We also consider automatic loading of some default XDP program (that just redirects) if none is loaded in time of interface creation, but that is of minor priority for us yet.
> For loading you can use attached loader (it will be added for review soon as well). It just loads the program and pins its maps.
> As XDP program, we use yet xdpsock_kern.c from kernel v5.0.0 sources (attached).
> XDP program compatibility requirements (from vpp point of view) are:
> having xskmap called "xsks_map" and pinned at /sys/fs/bpf/<ifname>/
> 
> I added support for multiple queues into my patch for vpp, as we discussed (1 NIC, n sockets on different queues), but I didn't test it yet. Other things should work fine.
> Tested on kernel 5.0.0.
> 
> Július
> 
>> Many thanks guys, very appretiated.
>>
>> Going to take a look at OVS implementation, but I would like to ensure something before.
>>
>>>> I took the _user part and split it into two:
>>>>
>>>> "loader" -  Executed once to setup environment and once to cleanup, loads _kern.o, attaches it to interface and pin maps under /sys/fs/bpf.
>>>>
>>>> and
>>>>
>>>> "worker" - Executed as many as required. Every instance loads maps from /sys/fs/bpf, create one AF_XDP sock, update xsks record and start listen/process packets from AF_XDP (in test scenario we are using l2fwd because of write-back). I had to add missing cleanups there( close(fd), munmap()). This should be vpp in final solution.
>>>>
>>>> So far so good.
>>>>
>>>> I'm unable to start more than one worker due to previously mentioned error. First instance works properly, every other fails on bind (lineno may not match due to local changes):
>>>>
>>>> xdpsock_user.c:xsk_configure:595: Assertion failed: bind(sfd, (struct sockaddr *)&sxdp, sizeof(sxdp)) == 0: errno: 16/"Device or resource busy"
>>>>
>>>>
>>> I don't think you can have multiple threads binding one XSK, see
>>> xsk_bind() in kernel source.
>>> For AF_XDP in OVS, we create multiple XSKs, non-shared umem and each
>>> has its thread.
>>
>> In OVS, can you bind two sockets with non-shared umem to the same interface?
>> Our goal is to have 2 or more processes (VPPs) listening on the same interface via XDP socket, while XDP program decides where to redirect the packets at the moment.
>>
>> Best Regards
>> Julius
> 
