Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C421110ED3B
	for <lists+xdp-newbies@lfdr.de>; Mon,  2 Dec 2019 17:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfLBQe1 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Mon, 2 Dec 2019 11:34:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28133 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727418AbfLBQe0 (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Mon, 2 Dec 2019 11:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575304465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nXpmMZJbPwCbDQ7dVPq1aKbkyPJvrVuVGGVc/tWemL4=;
        b=ZAKIvxOMit3FzSUTUm/chj95jMC/IoVgB6eNXulQmAnRMaXX/MexYat3ddDBfMnL+57kn+
        lk06bECR2x4JxCZh8WsYi1QVIj8btOHBdJ0VhGbDaQtkn1iRg0hunvk4NKt7BIJU9IeALv
        Wfawlo3oI7ZJz6N6CYNEHFn7s73DqEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-ZzEnnEl8MdW9kqGL5YK6rQ-1; Mon, 02 Dec 2019 11:34:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA17D1099125;
        Mon,  2 Dec 2019 16:34:19 +0000 (UTC)
Received: from [10.36.116.250] (ovpn-116-250.ams2.redhat.com [10.36.116.250])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E8A5D6A0;
        Mon,  2 Dec 2019 16:34:18 +0000 (UTC)
From:   "Eelco Chaudron" <echaudro@redhat.com>
To:     "Yonghong Song" <yhs@fb.com>
Cc:     "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
        Xdp <xdp-newbies@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Subject: Re: Trying the bpf trace a bpf xdp program
Date:   Mon, 02 Dec 2019 17:34:16 +0100
Message-ID: <056E9F5E-4FDD-4636-A43A-EC98A06E84D3@redhat.com>
In-Reply-To: <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
References: <E53E0693-1C3A-4B47-B205-DC8E5DAF3619@redhat.com>
 <CAADnVQKkLtG-QCZwxx-Bpz8-goh-_mSTtUSzpb_oTv9a-qLizg@mail.gmail.com>
 <3AC9D2B7-9D2F-4286-80A2-1721B51B62CF@redhat.com>
 <CAADnVQJKSnoMVpQ3F86zBhFyo8WQ0vi65Z4QDtopLRrpK4yB8Q@mail.gmail.com>
 <4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com>
 <d588c894-a4e0-8b99-72a9-4429b27091df@fb.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ZzEnnEl8MdW9kqGL5YK6rQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org



On 29 Nov 2019, at 17:52, Yonghong Song wrote:

> On 11/29/19 8:30 AM, Eelco Chaudron wrote:
>>
>>
>> On 28 Nov 2019, at 20:47, Alexei Starovoitov wrote:
>>
>>> On Thu, Nov 28, 2019 at 11:16 AM Eelco Chaudron=20
>>> <echaudro@redhat.com>
>>> wrote:
>>>>
>>>>
>>>>
>>>> On 28 Nov 2019, at 19:18, Alexei Starovoitov wrote:
>>>>
>>>>> On Thu, Nov 28, 2019 at 9:20 AM Eelco Chaudron=20
>>>>> <echaudro@redhat.com>
>>>>> wrote:
>>>>>>
>>>>>> Trying out the BPF trace to trace a BPF program, but I=E2=80=99m=20
>>>>>> already
>>>>>> getting stuck loading the object with the fexit=C2=A0 :(
>>>>>
>>>>> I can take a look after holidays.
>>>>
>>>> Enjoy the Holidays!! I figured out my auto kernel install script=20
>>>> failed
>>>> whiteout me noticing, and I was running an old kernel :(
>>>>
>>>> I will try tomorrow with the correct kernel=E2=80=A6
>>>
>>> Please also check that you have the latest llvm and pahole.
>>> pahole version should be >=3D 1.13.
>>> clang ideally from master.
>>> If all that is working then downgrade one by one and bisect whether
>>> the bug is.
>>>
>>
>> I tried it with the latest kernel loaded but still I got some errors=20
>> on
>> bpf_object__load_xattr():
>>
>> $ sudo ./xdp_sample_fentry_fexit_user
>> libbpf: Cannot find bpf_func_info for main program sec
>> fexit/xdp_prog_simple. Ignore all bpf_func_info.
>> libbpf: load bpf program failed: Operation not permitted
>> libbpf: failed to load program 'fexit/xdp_prog_simple'
>> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
>> ERROR: Failed to load object file: Operation not permitted
>>
>>
>> With strace:
>>
>> [vagrant@xdp-tutorial tracing05-xdp-fentry]$ sudo
>> /home/vagrant/strace/strace -e bpf ./xdp_sample_fentry_fexit_user
>> bpf(BPF_PROG_GET_FD_BY_ID, {prog_id=3D36, next_id=3D0, open_flags=3D0},=
=20
>> 120) =3D 3
>> bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER,=20
>> insn_cnt=3D2,
>> insns=3D0x7ffcaedfd4f0, license=3D"GPL", log_level=3D0, log_size=3D0,
>> log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,
>> prog_name=3D"", prog_ifindex=3D0,
>> expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,
>> func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,
>> line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 5
>> bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER,=20
>> insn_cnt=3D2,
>> insns=3D0x7ffcaedfd4f0, license=3D"GPL", log_level=3D0, log_size=3D0,
>> log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,
>> prog_name=3D"test", prog_ifindex=3D0,
>> expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,
>> func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,
>> line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 5
>> bpf(BPF_MAP_CREATE, {map_type=3DBPF_MAP_TYPE_ARRAY, key_size=3D4,
>> value_size=3D32, max_entries=3D1, map_flags=3D0, inner_map_fd=3D0,=20
>> map_name=3D"",
>> map_ifindex=3D0, btf_fd=3D0, btf_key_type_id=3D0, btf_value_type_id=3D0}=
,=20
>> 120) =3D 5
>> bpf(BPF_PROG_LOAD, {prog_type=3DBPF_PROG_TYPE_SOCKET_FILTER,=20
>> insn_cnt=3D5,
>> insns=3D0x7ffcaedfd490, license=3D"GPL", log_level=3D0, log_size=3D0,
>> log_buf=3DNULL, kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,
>> prog_name=3D"", prog_ifindex=3D0,
>> expected_attach_type=3DBPF_CGROUP_INET_INGRESS, prog_btf_fd=3D0,
>> func_info_rec_size=3D0, func_info=3DNULL, func_info_cnt=3D0,
>> line_info_rec_size=3D0, line_info=3DNULL, line_info_cnt=3D0}, 120) =3D 6
>> bpf(BPF_BTF_LOAD,
>> {btf=3D"\237\353\1\0\30\0\0\0\0\0\0\0000\0\0\0000\0\0\0\t\0\0\0\1\0\0\0\=
0\0\0\1"...,
>> btf_log_buf=3DNULL, btf_size=3D81, btf_log_size=3D0, btf_log_level=3D0},=
 120)=20
>> =3D 5
>> bpf(BPF_BTF_LOAD,
>> {btf=3D"\237\353\1\0\30\0\0\0\0\0\0\08\0\0\08\0\0\0\t\0\0\0\0\0\0\0\0\0\=
0\1"...,
>> btf_log_buf=3DNULL, btf_size=3D89, btf_log_size=3D0, btf_log_level=3D0},=
 120)=20
>> =3D 5
>> bpf(BPF_MAP_CREATE, {map_type=3DBPF_MAP_TYPE_ARRAY, key_size=3D4,
>> value_size=3D4, max_entries=3D1, map_flags=3D0x400 /* BPF_F_??? */,
>> inner_map_fd=3D0, map_name=3D"", map_ifindex=3D0, btf_fd=3D0,=20
>> btf_key_type_id=3D0,
>> btf_value_type_id=3D0}, 120) =3D -1 EPERM (Operation not permitted)
>> bpf(BPF_BTF_LOAD,
>> {btf=3D"\237\353\1\0\30\0\0\0\0\0\0\0`\1\0\0`\1\0\0\236\0\0\0\0\0\0\0\0\=
0\0\3"...,
>> btf_log_buf=3DNULL, btf_size=3D534, btf_log_size=3D0, btf_log_level=3D0}=
,=20
>> 120) =3D 5
>> bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D3, info_len=3D208,
>> info=3D0x7ffcaedfd4a0}}, 120) =3D 0
>> bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D3, info_len=3D208,
>> info=3D0x2018c30}}, 120) =3D 0
>> bpf(BPF_BTF_GET_FD_BY_ID, {btf_id=3D3}, 120) =3D 4
>> bpf(BPF_OBJ_GET_INFO_BY_FD, {info=3D{bpf_fd=3D4, info_len=3D16,
>> info=3D0x7ffcaedfd5a0}}, 120) =3D 0
>> libbpf: Cannot find bpf_func_info for main program sec
>> fexit/xdp_prog_simple. Ignore all bpf_func_info.
>> bpf(BPF_PROG_LOAD, {prog_type=3D0x1a /* BPF_PROG_TYPE_??? */,=20
>> insn_cnt=3D30,
>> insns=3D0x20191f0, license=3D"GPL", log_level=3D7, log_size=3D16777215,
>> log_buf=3D"", kern_version=3DKERNEL_VERSION(0, 0, 0), prog_flags=3D0,
>> prog_name=3D"trace_on_exit", prog_ifindex=3D0, expected_attach_type=3D0x=
19=20
>> /*
>> BPF_??? */, prog_btf_fd=3D5, func_info_rec_size=3D0, func_info=3DNULL,
>> func_info_cnt=3D0, line_info_rec_size=3D0, line_info=3DNULL,=20
>> line_info_cnt=3D0,
>> ...}, 120) =3D -1 EPERM (Operation not permitted)
>> libbpf: load bpf program failed: Operation not permitted
>> libbpf: failed to load program 'fexit/xdp_prog_simple'
>> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
>> ERROR: Failed to load object file: Operation not permitted
>> +++ exited with 0 +++
>>
>> And with full libbpf print debugging:
>>
>> libbpf: loading ./xdp_sample_fentry_fexit_kern.o
>> libbpf: section(1) .strtab, size 250, link 0, flags 0, type=3D3
>> libbpf: skip section(1) .strtab
>> libbpf: section(2) .text, size 0, link 0, flags 6, type=3D1
>> libbpf: skip section(2) .text
>> libbpf: section(3) fexit/xdp_prog_simple, size 240, link 0, flags 6,=20
>> type=3D1
>> libbpf: found program fexit/xdp_prog_simple
>> libbpf: section(4) license, size 4, link 0, flags 3, type=3D1
>> libbpf: license of ./xdp_sample_fentry_fexit_kern.o is GPL
>> libbpf: section(5) .rodata.str1.1, size 52, link 0, flags 32, type=3D1
>> libbpf: skip section(5) .rodata.str1.1
>> libbpf: section(6) .debug_str, size 344, link 0, flags 30, type=3D1
>> libbpf: skip section(6) .debug_str
>> libbpf: section(7) .debug_loc, size 70, link 0, flags 0, type=3D1
>> libbpf: skip section(7) .debug_loc
>> libbpf: section(8) .debug_abbrev, size 297, link 0, flags 0, type=3D1
>> libbpf: skip section(8) .debug_abbrev
>> libbpf: section(9) .debug_info, size 403, link 0, flags 0, type=3D1
>> libbpf: skip section(9) .debug_info
>> libbpf: section(10) .rel.debug_info, size 528, link 21, flags 0,=20
>> type=3D9
>> libbpf: skip relo .rel.debug_info(10) for section(9)
>> libbpf: section(11) .debug_ranges, size 96, link 0, flags 0, type=3D1
>> libbpf: skip section(11) .debug_ranges
>> libbpf: section(12) .debug_macinfo, size 1, link 0, flags 0, type=3D1
>> libbpf: skip section(12) .debug_macinfo
>> libbpf: section(13) .BTF, size 534, link 0, flags 0, type=3D1
>> libbpf: section(14) .rel.BTF, size 16, link 21, flags 0, type=3D9
>> libbpf: skip relo .rel.BTF(14) for section(13)
>> libbpf: section(15) .BTF.ext, size 152, link 0, flags 0, type=3D1
>> libbpf: section(16) .rel.BTF.ext, size 96, link 21, flags 0, type=3D9
>> libbpf: skip relo .rel.BTF.ext(16) for section(15)
>> libbpf: section(17) .debug_frame, size 40, link 0, flags 0, type=3D1
>> libbpf: skip section(17) .debug_frame
>> libbpf: section(18) .rel.debug_frame, size 32, link 21, flags 0,=20
>> type=3D9
>> libbpf: skip relo .rel.debug_frame(18) for section(17)
>> libbpf: section(19) .debug_line, size 206, link 0, flags 0, type=3D1
>> libbpf: skip section(19) .debug_line
>> libbpf: section(20) .rel.debug_line, size 16, link 21, flags 0,=20
>> type=3D9
>> libbpf: skip relo .rel.debug_line(20) for section(19)
>> libbpf: section(21) .symtab, size 792, link 1, flags 0, type=3D2
>> libbpf: Cannot find bpf_func_info for main program sec
>> fexit/xdp_prog_simple. Ignore all bpf_func_info.
>> libbpf: load bpf program failed: Operation not permitted
>> libbpf: failed to load program 'fexit/xdp_prog_simple'
>> libbpf: failed to load object './xdp_sample_fentry_fexit_kern.o'
>> ERROR: Failed to load object file: Operation not permitted
>>
>> I=E2=80=99m using the latest pahole, but standard llvm 9.0.0 from Fedora=
.

Same error with latest llvm

>> So I decided to at least run the self-test and see if this passes,=20
>> and
>> work my way from there.
>> But it=E2=80=99s failing to build with errors like =E2=80=9Cuse of unkno=
wn=20
>> builtin
>> '__builtin_preserve_field_info=E2=80=99=E2=80=9D, so I=E2=80=99m assumin=
g my clang9=20
>> needs
>> upgrading=E2=80=A6
>
> Yes, please try latest llvm trunk. You can find the information on the
> web. Below is the instruction from iovisor/bcc repo.
> (https://github.com/iovisor/bcc/blob/master/INSTALL.md#older-instructions=
)
>
> git clone https://github.com/llvm/llvm-project.git
> mkdir -p llvm-project/llvm/build/install
> cd llvm-project/llvm/build
> cmake -G "Ninja" -DLLVM_TARGETS_TO_BUILD=3D"BPF;X86" \
>    -DLLVM_ENABLE_PROJECTS=3D"clang" \
>    -DCMAKE_BUILD_TYPE=3DRelease -DCMAKE_INSTALL_PREFIX=3D$PWD/install ..
> ninja && ninja install
> export PATH=3D$PWD/install/bin:$PATH
>

I tried compiling with the latest master llvm, but the selftest failed=20
for bpf2bpf (other fail to sudo ./test_progs, Summary: 44/138 PASSED, 1=20
SKIPPED, 16 FAILED)

#5 core_reloc:FAIL
test_fentry_fexit:PASS:prog_load sched cls 32573 nsec
libbpf: failed to find valid kernel BTF
libbpf: vmlinux BTF is not found
libbpf: fentry/bpf_fentry_test1 is not found in vmlinux BTF
test_fentry_fexit:FAIL:prog_load fail err -2 errno 2
#6 fentry_fexit:FAIL
test_fentry_test:PASS:prog_load sched cls 0 nsec
libbpf: failed to find valid kernel BTF
libbpf: vmlinux BTF is not found
libbpf: fentry/bpf_fentry_test1 is not found in vmlinux BTF
test_fentry_test:FAIL:prog_load fail err -2 errno 2
#7 fentry_test:FAIL
test_fexit_bpf2bpf:PASS:prog_load sched cls 32764 nsec
test_fexit_bpf2bpf:PASS:obj_open 32764 nsec
libbpf: failed to find valid kernel BTF
libbpf: failed to get target BTF: -3
libbpf: failed to perform CO-RE relocations: -3
libbpf: failed to load object './fexit_bpf2bpf.o'
test_fexit_bpf2bpf:FAIL:obj_load err -3
#8 fexit_bpf2bpf:FAIL

Is there more I need to re-compile other than the test directory?
Or do I need additional configure flags?

$ grep -E -i "btf|bpf" .config
CONFIG_CGROUP_BPF=3Dy
CONFIG_BPF=3Dy
CONFIG_BPF_SYSCALL=3Dy
CONFIG_BPF_JIT_ALWAYS_ON=3Dy
CONFIG_IPV6_SEG6_BPF=3Dy
CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
# CONFIG_BPFILTER is not set
CONFIG_NET_CLS_BPF=3Dm
CONFIG_NET_ACT_BPF=3Dm
CONFIG_BPF_JIT=3Dy
CONFIG_BPF_STREAM_PARSER=3Dy
CONFIG_LWTUNNEL_BPF=3Dy
CONFIG_HAVE_EBPF_JIT=3Dy
CONFIG_BPF_LIRC_MODE2=3Dy
CONFIG_VIDEO_SONY_BTF_MPX=3Dm
# CONFIG_DEBUG_INFO_BTF is not set
CONFIG_BPF_EVENTS=3Dy
# CONFIG_BPF_KPROBE_OVERRIDE is not set
# CONFIG_TEST_BPF is not set

Cheers,

Eelco


