Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F673B0939
	for <lists+xdp-newbies@lfdr.de>; Tue, 22 Jun 2021 17:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhFVPiZ (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 22 Jun 2021 11:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhFVPiX (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 22 Jun 2021 11:38:23 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8212CC061574
        for <xdp-newbies@vger.kernel.org>; Tue, 22 Jun 2021 08:36:07 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 53E286008826;
        Tue, 22 Jun 2021 16:36:02 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id WWtFVaXJccYv; Tue, 22 Jun 2021 16:35:59 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id A369D600881B;
        Tue, 22 Jun 2021 16:35:59 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1624376159;
        bh=dE9UvCoZAlCrR5FFauR+OEeeongAWMURVc958VgevVc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=ZMewrRScotoFAbm2WZFdNQWmnG/EStQ5pCC7G2m/t+ypNNduPLpGxQrB5OI1rZn32
         jPrhECCL9b5j7GKrV58WAplUXPk6AtouqmkHbnbHCf6Ry4bu/YzM/gvVOU9xSL85yg
         6xUzs8RGm0A6OeKuAbXZ3B1qcjMTdD6wOn+u0hkc=
Received: from webmail.tecnico.ulisboa.pt (webmail3.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::912f:b135])
        (Authenticated sender: ist426067)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6825D36006E;
        Tue, 22 Jun 2021 16:35:59 +0100 (WEST)
Received: from a79-168-76-74.cpe.netcabo.pt ([79.168.76.74])
 via vs1.ist.utl.pt ([2001:690:2100:1::33])
 by webmail.tecnico.ulisboa.pt
 with HTTP (HTTP/1.1 POST); Tue, 22 Jun 2021 16:35:59 +0100
MIME-Version: 1.0
Date:   Tue, 22 Jun 2021 16:35:59 +0100
From:   =?UTF-8?Q?Sebasti=C3=A3o_Santos_Boavida_Amaro?= 
        <sebastiao.amaro@tecnico.ulisboa.pt>
To:     =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc:     xdp-newbies@vger.kernel.org
Subject: Re: XDP in virtual Ethernet devices
In-Reply-To: <874kehd90a.fsf@toke.dk>
References: <9a3f2989ee83a43263efc9fce02fe63b@tecnico.ulisboa.pt>
 <874kehd90a.fsf@toke.dk>
Message-ID: <00b3a957e3d1dc3a0b22ef62cd0eddd8@tecnico.ulisboa.pt>
X-Sender: sebastiao.amaro@tecnico.ulisboa.pt
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Thank you for the reply!
After experimenting more the problem is not related to docker 
specifically but to the docker networks. When I run the same experiment 
outside a docker network I am able to capture packets, however, when the 
containers are deployed in a docker network I cannot capture packets. 
Does anyone know why this might happen? Or was able to capture the 
packets of docker containers inside networks?
Best Regards,
Sebastião Amaro

A 2021-06-01 14:12, Toke Høiland-Jørgensen escreveu:
> Sebastião Santos Boavida Amaro
> <sebastiao.amaro@tecnico.ulisboa.pt> writes:
> 
>> Hello!
>> I am trying to use xdp_stats[1] (this program prints packets
>> passed/dropped) on the ethernet devices created by docker
>> containers(veth). I have iperf exchanging messages between containers
>> but xdp_stats does not capture any of the packets (XDP_PASS values do
>> not change) and CPU usage goes to 100%. It works fine on my laptop's
>> network device, but I have these issues with the docker network 
>> devices
>> and I don't understand why.
> 
> I don't think there's anything special about the veth devices Docker
> creates; so my immediate thought would be that this is due to
> differences in the kernel versions you're running on your laptop vs on
> docker. Some more details on this would be required to say anything
> more, though...
> 
> -Toke
