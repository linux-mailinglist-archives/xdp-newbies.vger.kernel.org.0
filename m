Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0B9D10D86D
	for <lists+xdp-newbies@lfdr.de>; Fri, 29 Nov 2019 17:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfK2Qag (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Fri, 29 Nov 2019 11:30:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42101 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726608AbfK2Qag (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Fri, 29 Nov 2019 11:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575045034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q7c6oV7LPMu6sapUoYKPAz7zrNWRbVjfjg4ej1pUT3k=;
        b=DGSbME6mCC+hxz1fBK30CnBTyeA1eFRagfxtbIRVYHpk0NaVrFA1Udqtfj91lc+hFPRV1o
        LJ2QyYPSk6m0pyoaScmsEwr6nGM37joVPupyKWVjuoYZ8DYzXm7kskdjbOjzEVQ2qrsjH7
        EF370RkYJFeLszA1N9A0RdY8KzvxthM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-HNFu5eS2PdWZXVmfmf2uHQ-1; Fri, 29 Nov 2019 11:30:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C033184CAA0;
        Fri, 29 Nov 2019 16:30:30 +0000 (UTC)
Received: from [10.36.116.208] (ovpn-116-208.ams2.redhat.com [10.36.116.208])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D7DF608F8;
        Fri, 29 Nov 2019 16:30:29 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc:     Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: Trying the bpf trace a bpf xdp program
Date:   Fri, 29 Nov 2019 17:30:27 +0100
Message-ID: <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com>
In-Reply-To: <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
 <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: HNFu5eS2PdWZXVmfmf2uHQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 28 Nov 2019, at 20:47, Alexei Starovoitov wrote:

> On Thu, Nov 28, 2019 at 11:16 AM Eelco Chaudron <echaudro@redhat.com>=20
> wrote:
>>
>>
>>
>> On 28 Nov 2019, at 19:18, Alexei Starovoitov wrote:
>>
>>> On Thu, Nov 28, 2019 at 9:20 AM Eelco Chaudron <echaudro@redhat.com>
>>> wrote:
>>>>
>>>> Trying out the BPF trace to trace a BPF program, but I=E2=80=99m alrea=
dy
>>>> getting stuck loading the object with the fexit  :(
>>>
>>> I can take a look after holidays.
>>
>> Enjoy the Holidays!! I figured out my auto kernel install script=20
>> failed
>> whiteout me noticing, and I was running an old kernel :(
>>
>> I will try tomorrow with the correct kernel=E2=80=A6
>
> Please also check that you have the latest llvm and pahole.
> pahole version should be >=3D 1.13.
> clang ideally from master.
> If all that is working then downgrade one by one and bisect whether=20
> the bug is.
>

I tried it with the latest kernel loaded but still I got some errors on=20
bpf_object__load_xattr():

$ sudo ./xdp_sample_fentry_fexit_user
libbpf: Cannot find bpf_func_info for main program sec=20
fexit/xdp_prog_simple. Ignore all bpf_func_info.
libbpf: load bpf program failed: Operation not permitted
libbpf: failed to load program 'fexit/xdp_prog_simple'
libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
ERROR: Failed to load object file: Operation not permitted


With strace:

[vagrant@xdp-tutorial tracing05-xdp-fentry]$ sudo=20
/home/vagrant/strace/strace -e bpf ./xdp_sample_fentry_fexit_user
bpf(BPF_PROG_GET_FD_BY_ID, {prog_id=3D36, next_id=3D0, open_flags=3D0}, 120=
) =3D=20
3
bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=3D2,=
=20
insns=3D0x7ffcaedfd4f0, license=3D"GPL", log_level=3D0, log_size=3D0,=20
log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,=20
prog_name=3D"", prog_ifindex=3D0,=20
expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,=20
func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,=20
line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 5
bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=3D2,=
=20
insns=3D0x7ffcaedfd4f0, license=3D"GPL", log_level=3D0, log_size=3D0,=20
log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,=20
prog_name=3D"test", prog_ifindex=3D0,=20
expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,=20
func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,=20
line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 5
bpf(BPF_MAP_CREATE, {map_type=3DBPF_MAP_TYPE_ARRAY, key_size=3D4,=20
value_size=3D32, max_entries=3D1, map_flags=3D0, inner_map_fd=3D0, map_name=
=3D"",=20
map_ifindex=3D0, btf_fd=3D0, btf_key_type_id=3D0, btf_value_type_id=3D0}, 1=
20) =3D=20
5
bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER, insn_cnt=3D5,=
=20
insns=3D0x7ffcaedfd490, license=3D"GPL", log_level=3D0, log_size=3D0,=20
log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,=20
prog_name=3D"", prog_ifindex=3D0,=20
expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,=20
func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,=20
line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 6
bpf(BPF_BTF_LOAD,=20
{btf=3D"\237\353\1\0\30\0\0\0\0\0\0\0000\0\0\0000\0\0\0\t\0\0\0\1\0\0\0\0\0=
\0\1"...,=20
btf_log_buf=3DNULL, btf_size=3D81, btf_log_size=3D0, btf_log_level=3D0}, 12=
0) =3D=20
5
bpf(BPF_BTF_LOAD,=20
{btf=3D"\237\353\1\0\30\0\0\0\0\0\0\08\0\0\08\0\0\0\t\0\0\0\0\0\0\0\0\0\0\1=
"...,=20
btf_log_buf=3DNULL, btf_size=3D89, btf_log_size=3D0, btf_log_level=3D0}, 12=
0) =3D=20
5
bpf(BPF_MAP_CREATE, {map_type=3DBPF_MAP_TYPE_ARRAY, key_size=3D4,=20
value_size=3D4, max_entries=3D1, map_flags=3D0x400 /* BPF_F_??? */,=20
inner_map_fd=3D0, map_name=3D"", map_ifindex=3D0, btf_fd=3D0, btf_key_type_=
id=3D0,=20
btf_value_type_id=3D0}, 120) =3D -1 EPERM (Operation not permitted)
bpf(BPF_BTF_LOAD,=20
{btf=3D"\237\353\1\0\30\0\0\0\0\0\0\0`\1\0\0`\1\0\0\236\0\0\0\0\0\0\0\0\0\0=
\3"...,=20
btf_log_buf=3DNULL, btf_size=3D534, btf_log_size=3D0, btf_log_level=3D0}, 1=
20) =3D=20
5
bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D3, info_len=3D208,=20
info=3D0x7ffcaedfd4a0}}, 120) =3D 0
bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D3, info_len=3D208,=20
info=3D0x2018c30}}, 120) =3D 0
bpf(BPF_BTF_GET_FD_BY_ID, {btf_id=3D3}, 120) =3D 4
bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D4, info_len=3D16,=20
info=3D0x7ffcaedfd5a0}}, 120) =3D 0
libbpf: Cannot find bpf_func_info for main program sec=20
fexit/xdp_prog_simple. Ignore all bpf_func_info.
bpf(BPF_PROG_LOAD, {prog_type=3D0x1a /* BPF_PROG_TYPE_??? */, insn_cnt=3D30=
,=20
insns=3D0x20191f0, license=3D"GPL", log_level=3D7, log_size=3D16777215,=20
log_buf=3D"", kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,=20
prog_name=3D"trace_on_exit", prog_ifindex=3D0, expected_attach_type=3D0x19 =
/*=20
BPF_??? */, prog_btf_fd=3D5, func_info_rec_size=3D0, func_info=3DNULL,=20
func_info_cnt=3D0, line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=
=3D0,=20
...}, 120) =3D -1 EPERM (Operation not permitted)
libbpf: load bpf program failed: Operation not permitted
libbpf: failed to load program 'fexit/xdp_prog_simple'
libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
ERROR: Failed to load object file: Operation not permitted
+++ exited with 0 +++

And with full libbpf print debugging:

libbpf: loading ./xdp_sample_fentry_fexit_kern.o
libbpf: section(1) .strtab, size 250, link 0, flags 0, type=3D3
libbpf: skip section(1) .strtab
libbpf: section(2) .text, size 0, link 0, flags 6, type=3D1
libbpf: skip section(2) .text
libbpf: section(3) fexit/xdp_prog_simple, size 240, link 0, flags 6,=20
type=3D1
libbpf: found program fexit/xdp_prog_simple
libbpf: section(4) license, size 4, link 0, flags 3, type=3D1
libbpf: license of ./xdp_sample_fentry_fexit_kern.o is GPL
libbpf: section(5) .rodata.str1.1, size 52, link 0, flags 32, type=3D1
libbpf: skip section(5) .rodata.str1.1
libbpf: section(6) .debug_str, size 344, link 0, flags 30, type=3D1
libbpf: skip section(6) .debug_str
libbpf: section(7) .debug_loc, size 70, link 0, flags 0, type=3D1
libbpf: skip section(7) .debug_loc
libbpf: section(8) .debug_abbrev, size 297, link 0, flags 0, type=3D1
libbpf: skip section(8) .debug_abbrev
libbpf: section(9) .debug_info, size 403, link 0, flags 0, type=3D1
libbpf: skip section(9) .debug_info
libbpf: section(10) .rel.debug_info, size 528, link 21, flags 0, type=3D9
libbpf: skip relo .rel.debug_info(10) for section(9)
libbpf: section(11) .debug_ranges, size 96, link 0, flags 0, type=3D1
libbpf: skip section(11) .debug_ranges
libbpf: section(12) .debug_macinfo, size 1, link 0, flags 0, type=3D1
libbpf: skip section(12) .debug_macinfo
libbpf: section(13) .BTF, size 534, link 0, flags 0, type=3D1
libbpf: section(14) .rel.BTF, size 16, link 21, flags 0, type=3D9
libbpf: skip relo .rel.BTF(14) for section(13)
libbpf: section(15) .BTF.ext, size 152, link 0, flags 0, type=3D1
libbpf: section(16) .rel.BTF.ext, size 96, link 21, flags 0, type=3D9
libbpf: skip relo .rel.BTF.ext(16) for section(15)
libbpf: section(17) .debug_frame, size 40, link 0, flags 0, type=3D1
libbpf: skip section(17) .debug_frame
libbpf: section(18) .rel.debug_frame, size 32, link 21, flags 0, type=3D9
libbpf: skip relo .rel.debug_frame(18) for section(17)
libbpf: section(19) .debug_line, size 206, link 0, flags 0, type=3D1
libbpf: skip section(19) .debug_line
libbpf: section(20) .rel.debug_line, size 16, link 21, flags 0, type=3D9
libbpf: skip relo .rel.debug_line(20) for section(19)
libbpf: section(21) .symtab, size 792, link 1, flags 0, type=3D2
libbpf: Cannot find bpf_func_info for main program sec=20
fexit/xdp_prog_simple. Ignore all bpf_func_info.
libbpf: load bpf program failed: Operation not permitted
libbpf: failed to load program 'fexit/xdp_prog_simple'
libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
ERROR: Failed to load object file: Operation not permitted

I=E2=80=99m using the latest pahole, but standard llvm 9.0.0 from Fedora.

So I decided to at least run the self-test and see if this passes, and=20
work my way from there.
But it=E2=80=99s failing to build with errors like =E2=80=9Cuse of unknown =
builtin=20
'__builtin_preserve_field_info=E2=80=99=E2=80=9D, so I=E2=80=99m assuming m=
y clang9 needs=20
upgrading=E2=80=A6

I quickly tried doing this while working on other stuff, but I failed to=20
multitask, so will continue with this next week.

Any ideas are welcome=E2=80=A6

Cheers,


Eelco

