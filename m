Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB8014DDE5
	for <lists+xdp-newbies@lfdr.de>; Thu, 30 Jan 2020 16:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgA3Pcm (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 30 Jan 2020 10:32:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38831 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727193AbgA3Pcm (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 30 Jan 2020 10:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580398360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=wuSofTzoyHUDzwZZk4h3g2ZgGYMPfFfVeX6beL+UbnU=;
        b=ifqSJtae3rb6LSjoLWl7LFzJX6U6CRokF8zQvlCsHhOUEUnEYgWxjg6ZlFLu7cjSQEnYHd
        sssdsfeIJnevRRCAbT7vo0PlJqMFbYWDvZFTdH3Q+ex/hBe2pnQonVy3Ig5zgEWbZSP4wv
        R7xX4HKLC3ovT7zr4WfHA2mhxLPpT3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-dnANzQhXN4-I-x_EsxlyTA-1; Thu, 30 Jan 2020 10:32:24 -0500
X-MC-Unique: dnANzQhXN4-I-x_EsxlyTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3AD1922960
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jan 2020 15:32:23 +0000 (UTC)
Received: from [10.36.116.53] (ovpn-116-53.ams2.redhat.com [10.36.116.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E4FA6859DA
        for <xdp-newbies@vger.kernel.org>; Thu, 30 Jan 2020 15:32:22 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     xdp-newbies@vger.kernel.org
Subject: Need a way to modify the section name for a read program object
Date:   Thu, 30 Jan 2020 16:32:20 +0100
Message-ID: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi All,

I'm trying to write an xdpdump like utility and have some missing part 
in libbpf to change the fentry/FUNCTION section name before loading the 
trace program.

In short, I have an eBPF program that has a section name like 
"fentry/FUNCTION" where FUNCTION needs to be replaced by the name of the 
XDP program loaded in the interfaces its start function.

The code for loading the ftrace part is something like:

	open_opts.attach_prog_fd = bpf_prog_get_fd_by_id(info.id);
	trace_obj = bpf_object__open_file("xdpdump_bpf.o", &open_opts);

	trace_prog_fentry = bpf_object__find_program_by_title(trace_obj, 
"fentry/FUNCTION");

	/* Here I need to replace the trace_prog_fentry->section_name = 
"fentry/<INTERFACE PROG NAME> */

	bpf_object__load(trace_obj);
	trace_link_fentry = bpf_program__attach_trace(trace_prog_fentry);


See the above, I would like to change the section_name but there is no 
API to do this, and of course, the struct bpf_program is 
implementation-specific.

Any idea how I would work around this, or what extension to libbpf can 
be suggested to support this?

Cheers,

Eelco

