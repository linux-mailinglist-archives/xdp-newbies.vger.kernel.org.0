Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513F163102A
	for <lists+xdp-newbies@lfdr.de>; Sat, 19 Nov 2022 18:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbiKSRq0 (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Sat, 19 Nov 2022 12:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbiKSRqW (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Sat, 19 Nov 2022 12:46:22 -0500
Received: from mx-relay12-hz2.antispameurope.com (mx-relay12-hz2.antispameurope.com [83.246.65.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42601AF0C
        for <xdp-newbies@vger.kernel.org>; Sat, 19 Nov 2022 09:46:19 -0800 (PST)
Received: from ip-092-050-072-125.um29.pools.vodafone-ip.de ([92.50.72.125]) by mx-relay12-hz2.antispameurope.com;
 Sat, 19 Nov 2022 18:46:17 +0100
Received: from [192.168.200.100] (192.168.200.100) by eks-ex.eks-engel.local
 (192.168.100.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sat, 19 Nov
 2022 18:46:13 +0100
Message-ID: <35f6717a-c032-444c-f3e4-a479b1f91a3c@eks-engel.de>
Date:   Sat, 19 Nov 2022 18:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: static variable in xdp
To:     =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
        <xdp-newbies@vger.kernel.org>
References: <9b477561-0318-4c2a-e758-63fb4c3ec058@eks-engel.de>
 <874juvxhs6.fsf@toke.dk>
Content-Language: en-US
From:   Benjamin Beckmeyer <beb@eks-engel.de>
In-Reply-To: <874juvxhs6.fsf@toke.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.200.100]
X-ClientProxiedBy: eks-ex.eks-engel.local (192.168.100.30) To
 eks-ex.eks-engel.local (192.168.100.30)
X-C2ProcessedOrg: 290e847d-2dbf-4126-92e5-262e4c411ebf
X-cloud-security-sender: beb@eks-engel.de
X-cloud-security-recipient: xdp-newbies@vger.kernel.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay12-hz2.antispameurope.com with 921F214A0030
X-cloud-security-connect: ip-092-050-072-125.um29.pools.vodafone-ip.de[92.50.72.125], TLS=1, IP=92.50.72.125
X-cloud-security-Digest: f13887cd7bc47def198ede9657748481
X-cloud-security: scantime:1.531
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

Hi Toke,

>> Hi all,
>>
>> I hope you could help me with a static variable problem in xdp.
>> Here is my source:
>>
>> static __u32 last_xid = 0;
>>
>> static __always_inline int profinet_process_packet(struct xdp_md *ctx, __u64 off) {
>>     void *data_end = (void *)(long)ctx->data_end;
>>     void *data = (void *)(long)ctx->data;
>>     struct profinet_hdr *p_hdr;
>>     __u16 profinet_frame_id;
>> //  static __u32 last_xid;
>>
>>     p_hdr = data + off;
>>
>>     if (p_hdr + 1 > data_end)
>>         return XDP_DROP;
>>
>>     profinet_frame_id = bpf_htons(p_hdr->frame_id);
>>
>>     if ((profinet_frame_id >= 0x0100 && profinet_frame_id <=0x7fff) ||
>>         (profinet_frame_id == 0x0020) ||
>>         (profinet_frame_id == 0xbbff) ||
>>         (profinet_frame_id == 0xfefc) ||
>>         (profinet_frame_id == 0xf7ff))
>>             return XDP_DROP;
>>
>>     if (p_hdr->xid == last_xid)
>>         return XDP_DROP;
>>     else
>>         last_xid = p_hdr->xid;
>>
>>     return XDP_PASS;
>> }
>>
>> At the moment I'm using kernel version 6.0.2 and iproute2-6.0.0.
>> I also tried to load the the filter with xdp_loader (xdp_tools).
>>
>> Output from ip:
>> $ ip link set dev eth0 xdpgeneric obj xdp_prog_kern.o sec
>>  eks_filter
>>
>> Prog section 'eks_filter' rejected: Permission denied (13)!
>>  - Type:         6
>>  - Instructions: 48 (0 over limit)
>>  - License:      GPL
>>
>> Verifier analysis:
>>
>> Error fetching program/map!
>>
>> Output from xdp_loader:
>> $ ./xdp_loader -deth0 -A --filename xdp_prog_kern.o --pro
>> gsec eks_filter
>> libbpf: failed to guess program type based on ELF section name 'eks_filter'
>> libbpf: supported section(type) names are: socket kprobe/ uprobe/ 
>> kretprobe/ uretprobe/ classifier action tracepoint/ tp/ raw_tracepoint/ 
>> raw_tp/ tp_btf/ xdp perf_event lwt_in lwt_out lwt_xmit lwt_seg6local 
>> cgroup_skb/ingress cgroup_skb/egress cgroup/skb cgroup/sock 
>> cgroup/post_bind4 cgroup/post_bind6 cgroup/dev sockops sk_skb/stream_parser 
>> sk_skb/stream_verdict sk_skb sk_msg lirc_mode2 flow_dissector cgroup/bind4 
>> cgroup/bind6 cgroup/connect4 cgroup/connect6 cgroup/sendmsg4 
>> cgroup/sendmsg6 cgroup/recvmsg4 cgroup/recvmsg6 cgroup/sysctl 
>> cgroup/getsockopt cgroup/setsockopt
>> Success: Loaded BPF-object(xdp_prog_kern.o) and used section(eks_filter)
>>  - XDP prog attached on device:eth0(ifindex:2)
>>  - Pinning maps in /sys/fs/bpf/eth0/
>> libbpf: failed to pin map: Operation not permitted
>> ERR: pinning maps
> This does not look like the output of the xdp-loader from xdp-tools; are
> you using the code from the xdp-tutorial? Try using the one from
> xdp-tools instead...
>
> Also, there's a hint here:
>
>> libbpf: failed to guess program type based on ELF section name 'eks_filter'
> You should use SEC("xdp") for XDP programs instead of custom section
> names, those are deprecated...
>
> -Toke

thanks for your reply. I forget about one thing. I'm cross compiling the xdp-loader 
for armv7. So far it looks good. I had a little fight with the xdp-loader but it 
seems to work now. The hint with SEC was really good.

It seems that not the xdp program was the problem, it was more the problem which 
tool you use to load it. 

xdp-loader no problem, while ip throws still this output.

Anyways, it works. Thanks for your help.

Cheers 
Benjamin


