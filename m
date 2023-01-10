Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D73663E96
	for <lists+xdp-newbies@lfdr.de>; Tue, 10 Jan 2023 11:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjAJKud (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 10 Jan 2023 05:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238272AbjAJKuP (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 10 Jan 2023 05:50:15 -0500
X-Greylist: delayed 1058 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Jan 2023 02:49:45 PST
Received: from dediextern.your-server.de (dediextern.your-server.de [85.10.215.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D370076204
        for <xdp-newbies@vger.kernel.org>; Tue, 10 Jan 2023 02:49:45 -0800 (PST)
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by dediextern.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1pFBvI-000AEi-MU; Tue, 10 Jan 2023 11:32:04 +0100
Received: from [2a01:c22:89fb:d510:ff:466b:de31:903c]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <marcus.wichelmann@hetzner-cloud.de>)
        id 1pFBvI-000PjU-Mi; Tue, 10 Jan 2023 11:32:04 +0100
Message-ID: <e4d0fc96-d897-c41c-8da2-f9c13725c2bf@hetzner-cloud.de>
Date:   Tue, 10 Jan 2023 11:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Pause and unpause queue
Content-Language: en-US
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        team lnx <teamlnxi8@gmail.com>
Cc:     xdp-newbies@vger.kernel.org
References: <CAOLRUnCA-D-P4FQiHTGXypXRv+O+rRg2Pe4z=0Zz6hCDZkG=vw@mail.gmail.com>
 <87sfgnzukv.fsf@toke.dk>
 <CAOLRUnA=OMPWyVkMOQ2zmGKRYE0A246DNNg4AqFbGbTHz7X6Mw@mail.gmail.com>
 <87fscmyyfr.fsf@toke.dk>
From:   Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>
In-Reply-To: <87fscmyyfr.fsf@toke.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: marcus.wichelmann@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26777/Tue Jan 10 10:10:20 2023)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Am 07.01.23 um 19:47 schrieb Toke Høiland-Jørgensen:
> team lnx <teamlnxi8@gmail.com> writes:
> 
>> sure, during xdp redirect i found that sometimes the number of packets
>> arrived are too many for an interface
>> to handle in which case. Hence thought to experiment with tx pause to
>> make room for successive packets and then unpause !
> 
> Right, so this is using XDP as a straight-forward forwarding
> accelerator, redirecting from one interface to another? That will indeed
> only work well if both interfaces are exactly the same link speed; this
> is one of the motivating use cases for the queueing work :)
> 
> -Toke
> 

Hi,

I saw your talk and the patch set from july about this. What is blocking 
things right now from getting into the kernel?

XDP queuing support would be really nice to have. ;)

Thanks for your work!
Marcus
