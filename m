Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F253396556
	for <lists+xdp-newbies@lfdr.de>; Mon, 31 May 2021 18:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhEaQb7 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 31 May 2021 12:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbhEaQ36 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 31 May 2021 12:29:58 -0400
X-Greylist: delayed 338 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 31 May 2021 07:58:11 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20976C061233
        for <xdp-newbies@vger.kernel.org>; Mon, 31 May 2021 07:58:09 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 09A8160029A9
        for <xdp-newbies@vger.kernel.org>; Mon, 31 May 2021 15:52:19 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id cBXktwV2lFeL for <xdp-newbies@vger.kernel.org>;
        Mon, 31 May 2021 15:52:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2DBA16001416
        for <xdp-newbies@vger.kernel.org>; Mon, 31 May 2021 15:52:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1622472736;
        bh=IQ3mhvYgx3lEgU44aZ9N+aOCzHP0QdVE21swBaGtroA=;
        h=Date:From:To:Subject;
        b=rR/bn+sou+3dKFvdNwpEeN6aQdPNMflsvwZlPH6/hRsBDte+C1POpHFImRQMXW783
         PGfjV5IwLR3i2sG+ve4ceNuc7G9F4kpNERVs7vh4OMdNZwG9aYPkUV9n2e3Ck1kedK
         YBj+0YYaQsj9kH45fGdfAVSYLBxNBG9QPMacdwbc=
Received: from webmail.tecnico.ulisboa.pt (webmail4.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::8a3:363d])
        (Authenticated sender: ist426067)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0EF72360072
        for <xdp-newbies@vger.kernel.org>; Mon, 31 May 2021 15:52:15 +0100 (WEST)
Received: from a79-168-76-74.cpe.netcabo.pt ([79.168.76.74])
 via vs1.ist.utl.pt ([2001:690:2100:1::33])
 by webmail.tecnico.ulisboa.pt
 with HTTP (HTTP/1.1 POST); Mon, 31 May 2021 15:52:15 +0100
MIME-Version: 1.0
Date:   Mon, 31 May 2021 15:52:15 +0100
From:   =?UTF-8?Q?Sebasti=C3=A3o_Santos_Boavida_Amaro?= 
        <sebastiao.amaro@tecnico.ulisboa.pt>
To:     xdp-newbies@vger.kernel.org
Subject: XDP in virtual Ethernet devices
Message-ID: <9a3f2989ee83a43263efc9fce02fe63b@tecnico.ulisboa.pt>
X-Sender: sebastiao.amaro@tecnico.ulisboa.pt
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hello!
I am trying to use xdp_stats[1] (this program prints packets 
passed/dropped) on the ethernet devices created by docker 
containers(veth). I have iperf exchanging messages between containers 
but xdp_stats does not capture any of the packets (XDP_PASS values do 
not change) and CPU usage goes to 100%. It works fine on my laptop's 
network device, but I have these issues with the docker network devices 
and I don't understand why.

https://github.com/xdp-project/xdp-tutorial/tree/master/basic04-pinning-maps

Best Regards,
Sebastião Amaro
