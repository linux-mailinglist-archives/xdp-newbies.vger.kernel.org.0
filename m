Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF13613F8BB
	for <lists+xdp-newbies@lfdr.de>; Thu, 16 Jan 2020 20:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgAPTUl (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Thu, 16 Jan 2020 14:20:41 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:42950 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437583AbgAPTUg (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Thu, 16 Jan 2020 14:20:36 -0500
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00GJGk6s009906;
        Thu, 16 Jan 2020 11:20:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=t0VzCKttewg+p0C6HOm4vfot/g7VHLccfYjBKW9l1Vg=;
 b=Q95PmoBbYQ7aRM38lRbWd/2wFw/d524/+fSQd2w5CM3TaZNk4fjTwTxEx0fuK9XF6pqA
 wC2yQu0+BVQjzYy7n+cNnTijHCCSJrxZD9XJiL7nerVygwjSnUT7mmWIg0jiXjEc2HWK
 QG7rQDAPyRVXOCUns2rOw46V1ODJJW0huYo= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2xjc3wcc2s-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jan 2020 11:20:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jan 2020 11:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAgPm1cCBJ3S/FJlWc5IX88iOei/95ewyhOiSFWj34ouwTlVX4Np17yOiYIhib/LFP+Wkr1xCeUIVTAKWff/6HMB1ZPwDC2RummjdjArlusBX+uYOBC4Fj/FqDrOJlHmKu7da+RKecReJxFMeIJtFH08EEQNuYxpvHtsSJaU+j5925ZzANERD/utizhzWRZBxXtEt/cXN8Napnkt2A1y8ouyuAtM7jZaGeu+d2n7C5E7qqmlN5z6Yj5s9Xn65pQpzTheUKxk+WLFP+aRXH80xoRC7gu7QDRejLdE1EGVDGPFpoL3b5EgI8qHwKKGbEN69hQn+L/eprffynMj6AniHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0VzCKttewg+p0C6HOm4vfot/g7VHLccfYjBKW9l1Vg=;
 b=h1CFSc2naKwDSqzYFIWGZ1CWi4LYY0dx6CWYfQM7LsmEVEqAHdZ0oSbp7vam1j/4MxGzMxItThJXXwoPzUGU/nAGkov8/h/fXxC38c6Z/dqHfbZcP48j0HJpMD80u83fWukzvgaynXLyFNBXZseP2XXm5zi/7pWDgR3mFKyp8nbveOP8+dfEARTY8n+hEO2gOlTjNGk/g+6gF2Y9DCgcxezI4jcAwCEDxuHfbiZcY4PTfb5KLtgdkloAmgnv13/99z9P365CyvZhOK2ROULkbwLE7ai1E2+rhwqPoD4DK28RpQOWS2RlXm6rsqvy6S5PWLY3fo9V4itMi/Mti1s0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0VzCKttewg+p0C6HOm4vfot/g7VHLccfYjBKW9l1Vg=;
 b=LgqLxwDvNZTNObCOLFC+kZ9JUXxgkqbG3klSvUk0Qta8nWQoo7YDOwr2/6JBuCMjdjINWzY3uYrHEBBiiUAx2A1C4Gr5Xu30RDI8D3wAJTug8KTEQKIfIXTEWD+9eGSHq4ee0uiBgFwJgN71TdU2zX0QZjGPPyon5/vFXH1A+GU=
Received: from DM5PR15MB1276.namprd15.prod.outlook.com (10.173.209.146) by
 dm5SPR00MB67.namprd15.prod.outlook.com (10.172.186.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Thu, 16 Jan 2020 19:20:15 +0000
Received: from DM5PR15MB1276.namprd15.prod.outlook.com
 ([fe80::a009:df56:7a8d:a35e]) by DM5PR15MB1276.namprd15.prod.outlook.com
 ([fe80::a009:df56:7a8d:a35e%9]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 19:20:15 +0000
Received: from [IPv6:2620:10d:c083:1309:c13:c9a5:618e:9452] (2620:10d:c090:200::2:e61a) by MWHPR22CA0060.namprd22.prod.outlook.com (2603:10b6:300:12a::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend Transport; Thu, 16 Jan 2020 19:20:14 +0000
From:   Andrii Nakryiko <andriin@fb.com>
To:     Vincent Li <mchun.li@gmail.com>,
        =?iso-8859-15?Q?Toke_H=F8iland-J=F8rgensen?= <toke@redhat.com>
CC:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
        "daniel@iogearbox.net" <daniel@iogearbox.net>,
        "dsahern@gmail.com" <dsahern@gmail.com>
Subject: Re: XDP invalid memory access
Thread-Topic: XDP invalid memory access
Thread-Index: AQHVzE/jnvb+sjenzku6eod7VQkVZqftCsgAgACcvICAAAPOAA==
Date:   Thu, 16 Jan 2020 19:20:14 +0000
Message-ID: <2cf8f3e2-d7ce-237e-7076-951c3f53061e@fb.com>
References: <CAK86TEf+GY3F8resRW11DNvate5uqSsh=JAQuJHhBuL0sQpvjg@mail.gmail.com>
 <20200116022459.GA2853@ranger.igk.intel.com> <87y2u7spj3.fsf@toke.dk>
 <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local>
In-Reply-To: <alpine.OSX.2.21.2001161059220.5400@jiadeimac.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR22CA0060.namprd22.prod.outlook.com
 (2603:10b6:300:12a::22) To DM5PR15MB1276.namprd15.prod.outlook.com
 (2603:10b6:3:b3::18)
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:e61a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ca25df9-6b93-4a9c-2c85-08d79ab91d53
x-ms-traffictypediagnostic: DM5SPR00MB67:
x-microsoft-antispam-prvs: <dm5SPR00MB67305A688CBECD96E582D6C6360@dm5SPR00MB67.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(53546011)(186003)(36756003)(16526019)(71200400001)(86362001)(5660300002)(52116002)(2616005)(31696002)(64756008)(66946007)(66476007)(66556008)(66446008)(4326008)(3480700007)(54906003)(2906002)(8936002)(31686004)(6486002)(110136005)(81156014)(8676002)(966005)(81166006)(478600001)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:dm5SPR00MB67;H:DM5PR15MB1276.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aoto/+BEUmcXAFI3tJMFlsBtt69sijyXiuS3ULeMtk62vsLGdan15f76qm8rV1/ham4f6m2maDgzpJI88q7C9fRUMm7o6Bjoi/JNRorAmNgtNcKK9QttTE6gT7TruGH6VOaWmIg5UVAEx5Aan9SIQVREnySQGOplA+iXIBLj8AzmowNgfu+kuh1B5VnbyB3ygdKrxTrWZpro1v8iZp6QHum2f86u/keoPKl1wfilTQiRCZgTahDLHdu7p+PPnt3KReVn/ZNC5byMUOVf9Anyu5ykJCgAbKvqWNdApa5RYn2hWRl7c4HrG+d2Q0GzGprQaAQIK9NNPdJP7l64/iYFGUV08Ux6U/f4nrfGnVv4sFNREKsCM+fR/cirvbjfQ1bBkSwbeamv/1TIhMDwlzf84J4vzfV+z8KOxHOjbBr49/SYOc2Nr17Mkhg88sjxfmA7aUWYyCVXzSoFdwFAlD3jUa9euMK9YfhTXkPCaQOoAMg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <D0A81EEAC697ED4DAAD3EABBDA91FBB0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca25df9-6b93-4a9c-2c85-08d79ab91d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 19:20:14.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3b9B1pRzvtb9Xuh+cr1vUxe2TbTqH/smmM+qekvtJP+Qzv5DNxL/ku2EK/8WXlH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: dm5SPR00MB67
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-16_05:2020-01-16,2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=999
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160154
X-FB-Internal: deliver
Sender: xdp-newbies-owner@vger.kernel.org
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On 1/16/20 11:06 AM, Vincent Li wrote:
>=20
>=20
> On Thu, 16 Jan 2020, Toke H=F8iland-J=F8rgensen wrote:
>=20
> Hi Toke,
>=20
>>
>> You could also try the xdp-loader in xdp-tools:
>> https://github.com/xdp-project/xdp-tools
>>
>> It's somewhat basic still, but should be able to at least load a basic
>> program - please file a bug report if it fails.
>=20
> I tried the xdp-tools xdp-loader, when the optlen is global variable, I
> got:
> # xdp-loader load enp3s0 tcp_option.o
> Couldn't load BPF program: Relocation failed
>=20
> if I move the optlen, i variable to local variable, I got:
>=20
> # xdp-loader load enp3s0 tcp_option.o
> Couldn't load eBPF object: Invalid argument(-22)
>=20
> Here is the complete code:
>=20
> #include <stdint.h>
> #include <arpa/inet.h>
> #include <asm/byteorder.h>
> #include <linux/bpf.h>
> #include <linux/if_ether.h>
> #include <linux/ip.h>
> #include <linux/tcp.h>
> #include <linux/pkt_cls.h>
>=20
> /*
>   * Sample XDP to parse tcp option.
>   * compile it with:
>   * clang -O2 -emit-llvm -c tcp_option.c -o - |llc -march=3Dbpf -filetype=
=3Dobj -o tcp_option.o
>   * attach it to a device with XDP as:
>   * 	ip link set dev lo xdp object tcp_option.o verbose
>   */
>=20
> #define SEC(NAME) __attribute__((section(NAME), used))
>=20
> #define TCPOPT_EOL        0       /* End of options (1)              */
> #define TCPOPT_NOP        1       /* No-op (1)                       */
> #define TCPOPT_MAXSEG     2       /* Maximum segment size (4)        */
> #define TCPOPT_WSCALE     3       /* Window scaling (3)              */
> #define TCPOPT_SACKOK     4       /* Selective ACK permitted (2)     */
> #define TCPOPT_SACK       5       /* Actual selective ACK (10-34)    */
> #define TCPOPT_TSTAMP     8       /* Timestamp (10)                  */
>=20
>=20
> /* from bpf_helpers.h */
>=20
> static int (*bpf_trace_printk)(const char *fmt, int fmt_size, ...) =3D
> (void *) BPF_FUNC_trace_printk;
>=20
> static unsigned long long (*bpf_get_prandom_u32)(void) =3D
> (void *) BPF_FUNC_get_prandom_u32;
>=20
>=20
> static int tcp_option(void *data, void *data_end)

I don't know if xdp-loader handles subprogram calls and relocations.=20
Mark it as __always_inline.

> {
> 	struct ethhdr *eth =3D (struct ethhdr *)data;
> 	struct iphdr *iph =3D (struct iphdr *)(eth + 1);
> 	struct tcphdr *tcphdr =3D (struct tcphdr *)(iph + 1);
> 	const __u8 *op;
> 	int i, optlen;
>=20
> 	/* sanity check needed by the eBPF verifier */
> 	if ((void *)(tcphdr + 1)  > data_end)
> 		return 0;
>=20
> 	/* skip non TCP packets */
> 	if (eth->h_proto !=3D __constant_htons(ETH_P_IP) || iph->protocol !=3D I=
PPROTO_TCP)
> 		return 0;
>=20
> 	/* incompatible flags, or PSH already set */
> 	if (tcphdr->ack || tcphdr->fin || tcphdr->rst || tcphdr->psh)
> 		return 0;
>=20
> 	if (tcphdr->syn) {
> 		if (((void *)(tcphdr + 1) + tcphdr->doff*4) > data_end)
> 			return 0;
>=20
> 		optlen =3D tcphdr->doff*4 - sizeof(*tcphdr);
> 		for (i =3D 0; i < optlen; ) {
> 			if (op[i] =3D=3D TCPOPT_EOL ) {
> 				char fmt[] =3D "XDP: tcp source : %d tcp option eol\n";
> 				bpf_trace_printk(fmt, sizeof(fmt), (int)tcphdr->source);
> 				return 1;
> 			}
> 			if (op[i] < 2)
> 				i++;
> 			else
> 				i +=3D op[i+1] ? : 1;
> 		}
> #if 0
> 		if (tcphdr->doff*4 =3D=3D 44 || tcphdr->doff*4 =3D=3D 28) {
> 			char fmt[] =3D "XDP: tcp source : %d data offset :%d\n";
> 			bpf_trace_printk(fmt, sizeof(fmt), (int)tcphdr->source, (int)tcphdr->d=
off*4);
> 			return 1;
> 		}
> #endif
> 	}
> 	return 0;
> }
>=20
> SEC("prog")
> int xdp_main(struct xdp_md *ctx)
> {
> 	void *data_end =3D (void *)(uintptr_t)ctx->data_end;
> 	void *data =3D (void *)(uintptr_t)ctx->data;
>=20
> 	if (tcp_option(data, data_end))
> 		return XDP_DROP;
>=20
> 	return XDP_PASS;
> }
>=20
>=20
> char _license[] SEC("license") =3D "GPL";
>=20

