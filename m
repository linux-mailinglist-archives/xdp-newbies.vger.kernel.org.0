Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D243BDA64
	for <lists+xdp-newbies@lfdr.de>; Tue,  6 Jul 2021 17:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhGFPo0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 6 Jul 2021 11:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhGFPo0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 6 Jul 2021 11:44:26 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D86C061574
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Jul 2021 08:41:47 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D595B6004435
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Jul 2021 16:41:40 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id 4fh_zlmZwWX9 for <xdp-newbies@vger.kernel.org>;
        Tue,  6 Jul 2021 16:41:38 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0CC366000438
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Jul 2021 16:41:38 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1625586098;
        bh=sbIpAikJ/1aO/s/UX+s4sGsvRAVBoM31aRAbNVSllGc=;
        h=Date:From:To:Subject;
        b=jmwFUkQlw+2QMhNyBvJoLpCndQC9m5qxm4qnSWRPfHN9vAYy8MtiAFtsGGTjKcFyG
         GsuzEl95h7Q/ooS/2+rbWFlBMQpIQ9Lc3xlsdBw2SdZY5yYDyYImkj2ZnZ7Zx+h1e2
         eq6Rfkmw2UGS5XKMo8hy98+hSvZcIAqdQ10tPWWQ=
Received: from webmail.tecnico.ulisboa.pt (webmail4.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::8a3:363d])
        (Authenticated sender: ist426067)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EC93A360077
        for <xdp-newbies@vger.kernel.org>; Tue,  6 Jul 2021 16:41:37 +0100 (WEST)
Received: from a79-168-76-74.cpe.netcabo.pt ([79.168.76.74])
 via vs1.ist.utl.pt ([2001:690:2100:1::33])
 by webmail.tecnico.ulisboa.pt
 with HTTP (HTTP/1.1 POST); Tue, 06 Jul 2021 16:41:37 +0100
MIME-Version: 1.0
Date:   Tue, 06 Jul 2021 16:41:37 +0100
From:   =?UTF-8?Q?Sebasti=C3=A3o_Santos_Boavida_Amaro?= 
        <sebastiao.amaro@tecnico.ulisboa.pt>
To:     xdp-newbies@vger.kernel.org
Subject: Using XDP in docker swarm to track outgoing traffic
Message-ID: <36491a913ed7da582ef3d264de1a8046@tecnico.ulisboa.pt>
X-Sender: sebastiao.amaro@tecnico.ulisboa.pt
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi everyone,
I am trying to use XDP to track outgoing traffic from docker containers 
deployed using docker swarm and running in a network using the driver 
overlay. I am using a simple xdp program based on [1], and I run this 
program on the network namespace of the container using nsenter and 
attach it to its eth0.
However, I am only able to detect the incoming packets and not the 
outgoing ones. When running tcpdump on the container network namespace I 
can see both incoming and outgoing packets. So I am a bit confused as to 
why XDP would not detect the outgoing ones.
Does anyone know why the reason for this or a general idea as to why 
this might happen?

[1]https://github.com/iovisor/bcc/blob/master/examples/networking/xdp/xdp_drop_count.py

Best Regards,
Sebastião Amaro
