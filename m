Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1058963C4AC
	for <lists+xdp-newbies@lfdr.de>; Tue, 29 Nov 2022 17:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbiK2QIE (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Tue, 29 Nov 2022 11:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235578AbiK2QHv (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Tue, 29 Nov 2022 11:07:51 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8FA1181B
        for <xdp-newbies@vger.kernel.org>; Tue, 29 Nov 2022 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669738069; x=1701274069;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mRyDhTDbuPd0oBU2svJLDnTlj14HdAyIbCqls7u6msk=;
  b=VXjQE8AR0wjT93pcKqtqvtrXmXfYszdXm2dNAJHe1EsGuEy7DfYRbRz5
   kOVgB/3/ksWfaMfudMZHh8yHqlOuExIY/QVWt8/LGeAKGIdgwZH75AXDJ
   NCtY0noXC0i2/yvbYGfzl6moqkG5+Vbfq4/na9YSMOhc+YBxM/EGqaGji
   NhesHoBz+wHS8TBTgGPwBYLk8L8e+se11do0urgjvJTrJ8cSs5BV/Nt52
   KAzx04hVbhlWrnbCDCRE3spbN3tgg4A49qm5g60exdS5QfDUXbT3k+GbN
   F208gRdN2r8UoXHK5SQjaxOj8yiKVLG2dw1lyB3Es/NJJlmi8iWyU0SyD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="294842386"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="294842386"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 08:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="712419704"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="712419704"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2022 08:04:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 08:04:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 08:04:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 08:04:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 08:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLCaPvQz75d3GwXtvCQOcxNCzfGgk/JGlZCw25hgO6KmKMi1zwVBUm+H6B3LjQUVuFEc0CLENZE9WnHvK/FIAhq/AQIMPbEDtV5nDmGgDoi2wdDqmqbEMNQSVN6XvAG2rfpvOQg85yOElr9bFuA4ntqn5lNiO86IqI5EmE6FtSozrVaSZSnm1KSeE6x3nPTv48LyDruJIvh9lnxEAmBf1O2HfXNG1KTHsSqBn0QWxq0RaZVovOvljJ+5GeCfJosxT0EAiqbhFUOZxOEURQKNclqQtp6goMNgwrxlcfxZkfzy1BZrfDrusBJ9lNe2AwqV0hwlwnfHKi5gAAJYdPPzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLBVcQijnZ8noGgom5jXek792xMApjdZiAEBQ6sOW14=;
 b=TS4T6wmnnmDDrN34oOW+ue5RkVb5jUwJvrcNCXW67QFEMYRJIp/bOuxryPskLYlaPq3/zie9uPxhyI+4Y8pYUubG04rkkG5A07/3KpalS8J0lBZbe9FKbmwlKq9jZgYzVzlUksmYDdWHjrlGn3dOG9D+5KSHUDIlQ8WTvvxIA2Mvwm06ElS8dqqyFgzMIXpTlgxyRXeTkxUWvbxENOlwaDp5VVX/pDt4zb/4nzW2IQ0qj/P3olzs11Hbh8wdnBCQD/4YLOGKF/AShkyY/wky+uSWp7zMdTGZuNOe66ro3uQPtB4yw6GatawV4j8hB89z3sdMf2ZmxXGL+4suk54sbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 16:04:48 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 16:04:48 +0000
Date:   Tue, 29 Nov 2022 17:04:37 +0100
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Robin Cowley <Robin.Cowley@thehutgroup.com>
CC:     "magnus.karlsson@intel.com" <magnus.karlsson@intel.com>,
        "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: [PATCH bpf] ice: xsk: do not use xdp_return_frame() on
 tx_buf->raw_buf
Message-ID: <Y4YtlcXcqx9xTHRp@boxer>
References: <20221129142528.4089347-1-maciej.fijalkowski@intel.com>
 <LO4P265MB3758A8524A7C978D214D468B87129@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <LO4P265MB3758A8524A7C978D214D468B87129@LO4P265MB3758.GBRP265.PROD.OUTLOOK.COM>
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4422395e-656f-4b12-aae4-08dad2237074
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ao0YEXOCPj/P9BKK6PmySQK+hb7nwzv1vaWu4QWWgux3mhUFyTaWFp7k5d8/GysdI41ZesK7AQ1jqS5Bc8LjTGZisdBwqDr+pOcQigGQsMFm8hr6OErZwvG1ZodX3UUwLsNYOei/vjcCQP8JMiO3Zbkv2GfMcO/aU7iU74+X1rGTNPdQYO8hITzbWLCPSTIcTo8NtFSgBVIXsZX1aUEudj3kFaMQdxb3hln53V1CxNp0gTiNKRk85i9eCjyrDlYQx8MclHLlkzit8ywL6BHiStRipv2yB58ku93vyYk6dkZCyZ0X4dCQoQ/WvEsT6IDVvtlKQXiTums7xJNIJQEvrno9ecj102XwUG5hyKAHXfxykk0GXSunZvvbFVLfJaL274epII7w20OC7GzNRlLjPCbjL1M/ncEeyMlBxVYqhbhqkW9UWvLWE9gU7jRW5KQH1YTCT23nKryAhQBWPzSmH+FLER3QFqyYBtIwoSBI03+dPVO6VeRMUSlxSwTJTtIDJG0WCQ8Lhfk3d88g4MuYLz7Vcv+h72UPnAPW9X9Nr6pj53L0g/7qYs9hzGyba6yQ9BJnEPv52w5YVqJh8JmqYH2vK7bHh28rD7F0Wjgs7DI+7XmcmII3MOJj0jK7SXWdakWzSwe7RpbI1rSTAvrU2TkbyCQKNArDy1lDr5DI1AQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(86362001)(6916009)(6486002)(316002)(54906003)(41300700001)(66946007)(8676002)(66556008)(4326008)(26005)(6506007)(9686003)(83380400001)(66574015)(53546011)(6666004)(66476007)(6512007)(5660300002)(186003)(82960400001)(478600001)(33716001)(8936002)(44832011)(2906002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ik6oDc6IvO1IbTFnlny7bPrXqpIQg+qCyswRUB+APBlH9xfdJ8DCpP5hXfZ7?=
 =?us-ascii?Q?Q1icx4VuePXjDBBwQlpsxtee7MgXE71bzAoNP0Jb2MVUxhM8EcT7VUB0CrQ2?=
 =?us-ascii?Q?jb5b976B9VM7OGNb0iRnpub5pIiQsZ95QzJSM49Fzdu4pS4MRJY047euSxwZ?=
 =?us-ascii?Q?H6gpr7bnsfH3pdTpc339Q4vyqmTjnR0Tl/ji4oDEc0LmmRbM5AVKiIugCc9D?=
 =?us-ascii?Q?97PWvEbAPaXx8F8ZJck6Mi3tEut+pkVLGb3AlV2fP8+TP7jp5rpXYTUuWVzq?=
 =?us-ascii?Q?NwFge5e74I3WiLllrOica+YZR/mCllk0cIbLr5KOUdMy0lt81fDmdvmze0Kc?=
 =?us-ascii?Q?YZ76hVeTpjYIAn0xaj8tiLP3erSGf6ZMbHNYfx26UXOrGckjREGP1mst3xdf?=
 =?us-ascii?Q?LQFndzL9TRZetjvdoUhsGE8DJ2vx4JX3Jb9OQ4h+hrlJxTKVe5A+isp/FpSk?=
 =?us-ascii?Q?Bc7V+1MoExgZJcWZasv7+3pa6o/QzhsgDkFmEZMWw3F9OehLOazX/hdf9ieA?=
 =?us-ascii?Q?ZPvg56NppmhRXPLvd8l0J9hPPGTIYavdukv0vWJufgaN+GxYOg1Ka87Cl6AX?=
 =?us-ascii?Q?6wEgNSmsyZitI76dmpzLGSZo0a70wlb6nTrpWF/zfOALKMlwSBj8Takwlpqa?=
 =?us-ascii?Q?0PUXnQefmIEzoXwgJAxTbPkdg0mYaXSELg5l3JQ8yz0cRMwjLNK4cpmJHpy8?=
 =?us-ascii?Q?2OhhgzAkDQ1UK+f5A3XdKvMwb9wss+E+GIRX5GxJqWrerhHg3iNMpAZ7AXnA?=
 =?us-ascii?Q?HyNBezZvys5mzP63gzwrSMWAMQfPPq9yxWtferzSMNapLfP5GHhZZSNheZb5?=
 =?us-ascii?Q?VtxlHJfULmCftbZWP0lF08484G+Y9tdehLgjvrkO28Vf1dn2XhSkREoN43Rq?=
 =?us-ascii?Q?M5lVPsvEVFFyGcesd9wYvo3+K6vIiBOb3H+AKSUnj7PSj3+jCgxvYEtCkA58?=
 =?us-ascii?Q?cKV7ZOwGkbvHRJaNC8bVqiuytvBjstpiMNoJkrrZzQbsrUkLjm9YgYAdDSOq?=
 =?us-ascii?Q?S99ooW5oCnJbARcLIxN+KUrAOVcBmK+s+XK0nFqUHFBTbhF3ekpNWZVxXXMU?=
 =?us-ascii?Q?dzWSY72HLrhW1cp/6TViRy0H/jGqs0K6M+g9HMB7xAL1FJ7LvEfTUOI8YnA+?=
 =?us-ascii?Q?kNO1zL54oHf9UjslDKHC0FPoRYa61NDJy53CWqnEq1CnVIh12XAgNcv0stCf?=
 =?us-ascii?Q?7zAu3/8up4Fg2YKaCwu5Y9M68ZSCDhXy2yKFDdjFcpC18Ts2RPVcnh127ZDe?=
 =?us-ascii?Q?JDfFUW8Iq4WCDjCcpjRgx9rK24Ksks8Mcg232b8PxTvC7WKopQbTnxvjkrPc?=
 =?us-ascii?Q?F9dacJ2C7OUFxWEG8bM0MvcUJgD+wtvWFK1/5sxWH14L6L1yzEv791V5UgqW?=
 =?us-ascii?Q?kqiwCsx/rXclFUKizA2ny1EKppx76p6F6EMejA3jGdReyfvlnrZTyXZQj23J?=
 =?us-ascii?Q?ajQDaUYz9kscJfdO6Jaf5K7Rp/CkTLXWHiX4AhYlzkIqz+ibOIYKsESIc7Cd?=
 =?us-ascii?Q?ocrvPoK4fVX95rRwrn3shUH4gHZtu1cV0HvAXHF4jbRQIMUZSi71nPYUHdiY?=
 =?us-ascii?Q?Ba99RTwftJ0MQf74x3kMSD38CF6zUj6TU0fVB0N8jLmhqqd1Xx8Z1A3hOawS?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4422395e-656f-4b12-aae4-08dad2237074
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 16:04:47.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wlaUVbUH9KopqSXCIHGz91+Biz4I+LW00wjjbFfLMBUOltxH7J75FhkzBVAjQ8ZyqxdyCKX34ZMu12gdAXg51WXyfbFRuZhvhP09dWStkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Tue, Nov 29, 2022 at 03:48:44PM +0000, Robin Cowley wrote:
> Hi Maciej,
> 
> I've just tested the patch you supplied and that seems to have worked perfectly when using multi FCQs.
> Thank you getting back so quickly with the patch.

Awesome. I will add your tag to commit message and send it to upstream.
Thanks for giving it a spin!

> 
> Thanks,
> Robin
> ________________________________
> From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> Sent: 29 November 2022 14:25
> To: Robin Cowley <Robin.Cowley@thehutgroup.com>; magnus.karlsson@intel.com <magnus.karlsson@intel.com>
> Cc: xdp-newbies@vger.kernel.org <xdp-newbies@vger.kernel.org>; Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> Subject: [PATCH bpf] ice: xsk: do not use xdp_return_frame() on tx_buf->raw_buf
> 
> CAUTION: This email originates from outside THG
> 
> Previously ice XDP xmit routine was changed in a way that it avoids
> xdp_buff->xdp_frame conversion as it is simply not needed for handling
> XDP_TX action and what is more it saves us CPU cycles. This routine is
> re-used on ZC driver to handle XDP_TX action.
> 
> Although for XDP_TX on Rx ZC xdp_buff that comes from xsk_buff_pool is
> converted to xdp_frame, xdp_frame itself is not stored inside
> ice_tx_buf, we only store raw data pointer. Casting this pointer to
> xdp_frame and calling against it xdp_return_frame in
> ice_clean_xdp_tx_buf() results in undefined behavior.
> 
> To fix this, simply call page_frag_free() on tx_buf->raw_buf.
> Later intention is to remove the buff->frame conversion in order to
> simplify the codebase and improve XDP_TX performance on ZC.
> 
> Fixes: 126cdfe1007a ("ice: xsk: Improve AF_XDP ZC Tx and use batching API")
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_xsk.c b/drivers/net/ethernet/intel/ice/ice_xsk.c
> index 056c904b83cc..79fa65d1cf20 100644
> --- a/drivers/net/ethernet/intel/ice/ice_xsk.c
> +++ b/drivers/net/ethernet/intel/ice/ice_xsk.c
> @@ -772,7 +772,7 @@ int ice_clean_rx_irq_zc(struct ice_rx_ring *rx_ring, int budget)
>  static void
>  ice_clean_xdp_tx_buf(struct ice_tx_ring *xdp_ring, struct ice_tx_buf *tx_buf)
>  {
> -       xdp_return_frame((struct xdp_frame *)tx_buf->raw_buf);
> +       page_frag_free(tx_buf->raw_buf);
>          xdp_ring->xdp_tx_active--;
>          dma_unmap_single(xdp_ring->dev, dma_unmap_addr(tx_buf, dma),
>                           dma_unmap_len(tx_buf, len), DMA_TO_DEVICE);
> --
> 2.34.1
> 
> 
> Robin Cowley
> Software Engineer
> The Hut Group<http://www.thehutgroup.com/>
> 
> Tel:
> Email: Robin.Cowley@thehutgroup.com<mailto:Robin.Cowley@thehutgroup.com>
> 
> For the purposes of this email, the "company" means The Hut Group Limited, a company registered in England and Wales (company number 6539496) whose registered office is at Fifth Floor, Voyager House, Chicago Avenue, Manchester Airport, M90 3DQ and/or any of its respective subsidiaries.
> 
> Confidentiality Notice
> This e-mail is confidential and intended for the use of the named recipient only. If you are not the intended recipient please notify us by telephone immediately on +44(0)1606 811888 or return it to us by e-mail. Please then delete it from your system and note that any use, dissemination, forwarding, printing or copying is strictly prohibited. Any views or opinions are solely those of the author and do not necessarily represent those of the company.
> 
> Encryptions and Viruses
> Please note that this e-mail and any attachments have not been encrypted. They may therefore be liable to be compromised. Please also note that it is your responsibility to scan this e-mail and any attachments for viruses. We do not, to the extent permitted by law, accept any liability (whether in contract, negligence or otherwise) for any virus infection and/or external compromise of security and/or confidentiality in relation to transmissions sent by e-mail.
> 
> Monitoring
> Activity and use of the company's systems is monitored to secure its effective use and operation and for other lawful business purposes. Communications using these systems will also be monitored and may be recorded to secure effective use and operation and for other lawful business purposes.
> 
> hgvyjuv
