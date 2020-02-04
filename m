Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D9C1518B2
	for <lists+xdp-newbies@lfdr.de>; Tue,  4 Feb 2020 11:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgBDKUF (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 4 Feb 2020 05:20:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32291 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726362AbgBDKUF (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>); Tue, 4 Feb 2020 05:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580811604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MA37R27p1GI9kDoyzbU77utZOAS0BVN1h6qrJs4GgKs=;
        b=PCo35W14jsdrGnTVB1TAewiuk8MmfOhmK1e19v5JV1zRLiUYPErCmaJnMB0iZWxRFMadio
        CPOQ1WMme/eiyEwxeKG3NSwZFx3fv6fdWZ2R2PRL3p+0Jzsr5CHsz1dsSW0ZOX+IS58rVT
        LztJt4X9LuiYz5nkfctjNHsRuF/Ht0I=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-PDllHhk1NOOFADcACJ3OLQ-1; Tue, 04 Feb 2020 05:19:59 -0500
X-MC-Unique: PDllHhk1NOOFADcACJ3OLQ-1
Received: by mail-lj1-f200.google.com with SMTP id l14so5106733ljb.10
        for <xdp-newbies@vger.kernel.org>; Tue, 04 Feb 2020 02:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=MA37R27p1GI9kDoyzbU77utZOAS0BVN1h6qrJs4GgKs=;
        b=bRV01gtSmDaVV93ZroaLDYG2eEFGzJ9QdH46/9tiVZ24yqvX9QLESY1zHeFaQNOVkH
         CsmQc6xBnx3og3qU1nTtAlJNP4YRr+93PRNQC/ejA9N7Bt+wFckPrZaARbqU/LoyjDRB
         d3bbxB91I3QKjOrPUcRRTa88qsBr6KIFBRUoq+Q1Qa1q+hI8xYicdw0NRn6yFyaXBzVU
         FLQW8vcj0MSNYqtzs8zG5qh/fIDtr6g11MV7he+aA1UGuwOQz298dY4DhggOGXtjyWDf
         hMqg9yWbtTWS7qCvQLGJcTrm6llyRIQNFDWnERrvoz8R2uQ2d2Ja8I+H59Ngrhu4dNjQ
         X2/g==
X-Gm-Message-State: APjAAAWBgHWqkhdYY/E+f9XCC3D9zcaV6uOzQ/wBiWRbhDLaQ1A+LO6E
        6TxM3oQP6DsZXcnUh/xobhiMpded4rSNdP/HoM/Nflx1hOT1R+K3HELhUNlw7o4+v/NFHC15Qoj
        Koo9j3OVypK1JSoviS/sgvSI=
X-Received: by 2002:a19:f80a:: with SMTP id a10mr14498305lff.107.1580811597871;
        Tue, 04 Feb 2020 02:19:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKJ5E02WVNIKwSSK2btBeMs/J4NB6kvu7SO6qqMHFLtYJDjIx0iiZE7pvg/xkJnP9raWL/aw==
X-Received: by 2002:a19:f80a:: with SMTP id a10mr14498295lff.107.1580811597657;
        Tue, 04 Feb 2020 02:19:57 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id e8sm13191461ljb.45.2020.02.04.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 02:19:56 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 95DFD1802CA; Tue,  4 Feb 2020 11:19:53 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Eelco Chaudron <echaudro@redhat.com>, xdp-newbies@vger.kernel.org,
        Andrii Nakryiko <andriin@fb.com>
Subject: Re: Need a way to modify the section name for a read program object
In-Reply-To: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com>
References: <D0F8E306-ABEE-480E-BDFD-D43E3A98DC5A@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 04 Feb 2020 11:19:53 +0100
Message-ID: <874kw664dy.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

"Eelco Chaudron" <echaudro@redhat.com> writes:

> Hi All,
>
> I'm trying to write an xdpdump like utility and have some missing part 
> in libbpf to change the fentry/FUNCTION section name before loading the 
> trace program.
>
> In short, I have an eBPF program that has a section name like 
> "fentry/FUNCTION" where FUNCTION needs to be replaced by the name of the 
> XDP program loaded in the interfaces its start function.
>
> The code for loading the ftrace part is something like:
>
> 	open_opts.attach_prog_fd = bpf_prog_get_fd_by_id(info.id);
> 	trace_obj = bpf_object__open_file("xdpdump_bpf.o", &open_opts);
>
> 	trace_prog_fentry = bpf_object__find_program_by_title(trace_obj, 
> "fentry/FUNCTION");
>
> 	/* Here I need to replace the trace_prog_fentry->section_name = 
> "fentry/<INTERFACE PROG NAME> */
>
> 	bpf_object__load(trace_obj);
> 	trace_link_fentry = bpf_program__attach_trace(trace_prog_fentry);
>
>
> See the above, I would like to change the section_name but there is no 
> API to do this, and of course, the struct bpf_program is 
> implementation-specific.
>
> Any idea how I would work around this, or what extension to libbpf can 
> be suggested to support this?

I think what's missing is a way for the caller to set the attach_btf_id.
Currently, libbpf always tries to discover this based on the section
name (see libbpf_find_attach_btf_id()). I think the right way to let the
caller specify this is not to change the section name, though, but just
to expose a way to explicitly set the btf_id (which the caller can then
go find on its own).

Not sure if it would be better with a new open_opt (to mirror
attach_prog_fd), or just a setter (bpf_program__set_attach_btf_id()?).
Or maybe both? Andrii, WDYT?

-Toke

