Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A53214D733
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2020 09:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgA3IC3 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Jan 2020 03:02:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58531 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726397AbgA3IC3 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Jan 2020 03:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580371348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eMSfCthzNaB5b8WWxBTlfK8XnC7VT5Bgq+/fKzCe50M=;
        b=CrQScLnADSqdO4NvSm4Bo86SjBn5BnWAYzaTJRs6AJ8Exjca10DtpL4X9DnICe5toGSrAC
        AM3cnWlypcbRc+pYvz4mAzSS32lyJI4GvFWMM1nUe22OZ7vb5XoB2Qe7LSH9FXR2MIOkmv
        FE2LCf8OmDhe9U/+UVEe/w6PMk/tkEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Z03drSlePO2xWgg4OBTCZw-1; Thu, 30 Jan 2020 03:02:10 -0500
X-MC-Unique: Z03drSlePO2xWgg4OBTCZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99786108BD16;
        Thu, 30 Jan 2020 08:02:09 +0000 (UTC)
Received: from carbon (ovpn-200-56.brq.redhat.com [10.40.200.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9E0C960C05;
        Thu, 30 Jan 2020 08:02:07 +0000 (UTC)
Date:   Thu, 30 Jan 2020 09:02:03 +0100
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
To:     David Ahern <dsahern@gmail.com>
Cc:     Cameron Elliott <cameron@cameronelliott.com>,
        Xdp <xdp-newbies@vger.kernel.org>,
        Magnus Karlsson <magnus.karlsson@gmail.com>
Subject: Re: xdpsock ... -N -z and AF_XDP XDP_ZEROCOPY not working:
 RESOLVED!
Message-ID: <20200130090203.71b475a0@carbon>
In-Reply-To: <c45f64a7-ffff-a123-818c-4dc127cd3ff4@gmail.com>
References: <CAMyc9bVpR9thvVsa-LWNg6BPwkqNcL-W-FuEXdfXgGxCUUn3jA@mail.gmail.com>
        <c45f64a7-ffff-a123-818c-4dc127cd3ff4@gmail.com>
Organization: Red Hat Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, 29 Jan 2020 21:41:57 -0700
David Ahern <dsahern@gmail.com> wrote:

> On 1/29/20 6:02 PM, Cameron Elliott wrote:
> > With this command:
> > git clone git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> > More info: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/
> > 
> > I built the kernel using these directions:
> > https://wiki.ubuntu.com/KernelTeam/GitKernelBuild
> > 
> > And after rebooting and running on the 5.5 bpf-next kernel, -z and
> > XDP_ZEROCOPY were working fine!  
> 
> since this is literally bleeding edge, is there a wiki/doc/other for
> kernel versions and supported features? Something similar to what MLX
> does for switchdev [1] would be really helpful.
> 
> [1] https://github.com/Mellanox/mlxsw/wiki

The IOvisor BCC project tries to keep track of kernel version and BPF +
XDP features, here[2]:

[2] https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md 

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

