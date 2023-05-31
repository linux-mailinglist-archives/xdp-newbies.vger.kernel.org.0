Return-Path: <xdp-newbies-owner@vger.kernel.org>
X-Original-To: lists+xdp-newbies@lfdr.de
Delivered-To: lists+xdp-newbies@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DE5718346
	for <lists+xdp-newbies@lfdr.de>; Wed, 31 May 2023 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237031AbjEaNtL (ORCPT <rfc822;lists+xdp-newbies@lfdr.de>);
        Wed, 31 May 2023 09:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236965AbjEaNsf (ORCPT
        <rfc822;xdp-newbies@vger.kernel.org>);
        Wed, 31 May 2023 09:48:35 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB33226BB
        for <xdp-newbies@vger.kernel.org>; Wed, 31 May 2023 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685540690; x=1717076690;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oMOfvVWwCPhDSHW/5zJ0RMBQx+PBCXk5Jn4pxJIHhYQ=;
  b=NUw5ZKJofktvBRKxJfUYbedVpmPCRqzUcBs554IhuzE/24k6loTgPt2D
   nAv0hznLby1fDdc+BWAgKxTRrEIGjzyhu5nD3hhQmzCMDXtRMp878Fxu3
   cHNrdOOjJO4aokNLX9w6SUWFxNBIVey93i74eIKlnyLyD7S3TTdzRMc80
   ANia5iIeo8mS2HZajCcixiN0oSbzEYqGyNoPX9XRe4KwpXHdnMrF+86FO
   QpVDZKg0zdyNGXhSmuX0PgXJgy/MW4NZscYmAokigipKgxH/3aaizI1yD
   lh8mvQUzMYkbwd70K9ubru+UvPIXv5mWLsl9783cunN1BujVPBJbcBGt8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="334860106"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="334860106"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 06:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="771993623"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="771993623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 06:43:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 06:43:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 06:43:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 06:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi6p5PUsvU8PvwY0JsC2DXCf/MW6sX66HDpgfRv8/mq13lP8gOH70hnK/WT/xNQuEry6pK63xEVVSH9Vc0SNcNh/z8mdUO+kvcQZBL75Rc9WjOtuKqacqGkqlaLxdE5DK7Dw1rFZQ20+0nIRwKz15N2k2k2ruJyJx0jmEjbmo0Cju4Bi1pytwSUPYR3cUA4j3TTNf350W/YHBzETTJC3y076VsBVG3hniXCMrgU8qi/DyYmeZGRIXr2kQj5AAPwpTg96zrf1uvoiaXT193FZEoePXOVyQK3whDHwk2b5Ny7FfuOnjtoO4oRI3sjPBiQdzBEBb1ANHdaSxbPsAf3hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOga8FlMhiyNvAL1znhIUPiJwOD3/x5hNdCuC7QWzig=;
 b=oACmQeiBdSkqgncrVatqC0MTM+HyTT0Jcv7SBR8Bh7ZrDhMuYCrxqXf9uNfnEMhCUH5I9lfNfOxPhUn+kMDscjekblWVtE1jZvklPumzuV/3xGpzvD9UmoL05tWsIi3cjy8KoSt6oTyQ83qmobpzKUZRTl0swyE/UkvuvPgPdBZKF/V6muc55NjeDEAuiic3T6ALJ2jxwuKJtOcQOEZtreaFLgXeSWmpKAnDPpmPSX0VubOu/nzjpt5iv5kMZUnKCYRXkM6+InXlsK0efesA7u90MxrGdwFr3JI59UVBe65tuy7BO4DI1iWSgtWghIRDkheS1ewO/BISI/fGz+touw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 13:43:03 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9e4f:80cc:e0aa:6809]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9e4f:80cc:e0aa:6809%2]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:43:02 +0000
Date:   Wed, 31 May 2023 15:42:52 +0200
From:   Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To:     Tomas Jansky <Tomas.Jansky@progress.com>
CC:     "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>
Subject: Re: Processing Jumbo Packets via AF_XDP Sockets
Message-ID: <ZHdO3DYOdjh7KKNi@boxer>
References: <SA1PR13MB4925B288F75F21F3709C8049E6489@SA1PR13MB4925.namprd13.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR13MB4925B288F75F21F3709C8049E6489@SA1PR13MB4925.namprd13.prod.outlook.com>
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|IA0PR11MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca309ad-60d2-4b9a-7911-08db61dcf47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtWLbySvCfdrDy79qTwvdl9MAjzGIqnucrkIzi9OAFzVF1s8mYkP1avAR8v8HEaGV+afOWMIY6lihdqOYFZ2Pw9pSfBG+NQWDCT26jC6FLQK6wA5VR2Y8I6DWmIq6VAbsHJvad1JE5k++j1G+/Bc4Oilz/M7fiLc4tlTWDaGCrU1VnT2swOzw5Yj4WTImccmwhUgYT5eIvXI7JLqY9ctuhvWip5PsfE4wFXxuleIf033BIR7ce7imhovzVR6hNTfDE7+jEzAxorz8eVfZ3Y7/NLIZqjBSjs9+nusfBif3o/k8dDeiRbcePXz11em9r22q0jyxC4CUoiVW+peHulAyuWw9v5JsgrrDDSsO5LPR5Dyo+gX2z72+bTIfwEu03s70WqN9REUXXuIuQtBY/Olo/HxcrdI8E/xFGXJEx/rgvK8hw1WDkPhatdZVRVtO8R5r+DU+eerSehtCR4w35/vMNLpbtKvMsCkgJwbb8SN2B404ZYx9mQ3+5N1Ng32EJ1uwiolisMQQgH73EQvQdYBlUtV7EYXdF5lZEJgOJP3AgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6117.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199021)(6916009)(4326008)(6486002)(66556008)(5660300002)(66946007)(66476007)(86362001)(478600001)(41300700001)(8676002)(8936002)(966005)(44832011)(6666004)(9686003)(316002)(6512007)(6506007)(26005)(186003)(4744005)(2906002)(33716001)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzQF6a3qb0scnCNCVydbuO9x//RzRrmfAJtZiQMURfpjtcapT07oWWa+itPg?=
 =?us-ascii?Q?sR1heLJjZwbrmoC5c2DvOz0k9FXKDycNeQQ7lv/kBc0+mxPGFB9sWoB9q/t7?=
 =?us-ascii?Q?rR8gE6vnUF+/5Tye0zuBp5Uc+LSK9x0MisUZBDuUoGxWy9GblIYod0FUr0nw?=
 =?us-ascii?Q?OQ0im73gN+l7Wfuche4BbJu3G1Yna1+T7FvC073mVgwMeZ+bRzcBO1as7v5F?=
 =?us-ascii?Q?wCM8IqTT7u+qGQhYjOwX17HZGl3TLIXkqHxiKnplsaKsgH3Tckzdm7OfJCO2?=
 =?us-ascii?Q?YMol17IFgxf7eW9DlZBQK5GWc9n4Peuct6TYjU/BVEqW1JPtgDexG0L8sBlS?=
 =?us-ascii?Q?a1EbyalUX62XE+B8yJ4o3UBMKI75HKV+TGZ8JZfQQu1/nu18cIzk3EnGL96Y?=
 =?us-ascii?Q?tk9VSWOSnktHMMRf+tWxm3dQ3O+ZC9eHT+J8VO3NrDa1hn46+JMxwfi1KvXu?=
 =?us-ascii?Q?KuOFFuHT5UUtY3+pY9a0dzFqOY/HufOENty0SzQ1BN1q323FPkwbVtDjD/Fx?=
 =?us-ascii?Q?Csv/8m9peftgqA+u6fTHJzl6MPPd0iNvlSHc3nrKuU7HuaYDDv4M4wsq0ay6?=
 =?us-ascii?Q?q2Jv7hNd2MSKawY58CNxNlUm6chWCIOyvT5qAkxpZNiE55D8JPrE06LKWcuH?=
 =?us-ascii?Q?yJHrtewj1Tdnp4hTU8CD9hdEZikTmyQ77pA8WgPZKClcbp7Jrcqwz119a56o?=
 =?us-ascii?Q?7TX+v5jCcr6K6FGdO+IuAXYi4dGqoZiricjxfcaVpNpajfxPZIql0s8H+lXG?=
 =?us-ascii?Q?yj02USwukJEAbCoEqwTvAHtwKENIHgAtW9Ky3HU9M9HPJx1jinpCbQmtYYDp?=
 =?us-ascii?Q?JWqbiHvRFUy+NFLKKfUajw8MWQQ1WRdZ4W9Hlufl+Q3WUIAET4ghEmPXa026?=
 =?us-ascii?Q?A+pG08vnjC1QamSxNaBFSsG7zPVkafwBdArpxKV58s4SYMQDBwhSw5drjLJd?=
 =?us-ascii?Q?sBTuI1N94WLC7hVk4/we0uUkw7cfSOXF6NBv2MpsFV4eL1AOTsfobJ8KhZ4N?=
 =?us-ascii?Q?jwe5lx/tJ8tj4RjjhUdezclT2jOL65VdE+/c85kNNF8Fs94q3rWdEHSDOyQb?=
 =?us-ascii?Q?QVYWCXUlpm2eiiABGucFUDbUCFctSqHIJDANxLml++2Grpih+OYNSNoU8clt?=
 =?us-ascii?Q?/jRrxVPuGJbAVMjaNe4Oi0bCK8C9stzZafswRiYFSRBYvNRLKXxwP5uL0t6P?=
 =?us-ascii?Q?yjU6SpEVFVfrrfgiLoMj2T+L0M4VyrLERAHGABL0xr1j4bBM4aUXMIyakurF?=
 =?us-ascii?Q?01S8IJp7Z+lWtDzhcqMQiMhVQS0z7y9UJUrUPBOYIx4mjm74Kbdp6Ell8gaF?=
 =?us-ascii?Q?SRydG2WCFHTPF084whBL3rZQta9C7brTCc1103XGvW3tbRoajxC5uNq/XS4Q?=
 =?us-ascii?Q?3fcYqBzvBYS7WPk2ZtL6UE3YXNmBeC/NeJhBkZ2rIB+wES5zJJxtOliiSFUj?=
 =?us-ascii?Q?jyBQbvJ83z/cYhEXuvbDSTxLwACIZthYaI+5iTd+/gfSAWhr68M+FLnP7EUk?=
 =?us-ascii?Q?wtwBoBVLzJ4ekAcCKj2CvJfXPkPz1/fSZDtko9lPWCobus9k4jone8+h5WPi?=
 =?us-ascii?Q?+os1bAnq47IzT0cbFcgip8rKMs5/RrodbvjLsoPxjcGSuoPtV2Xca7bO56N1?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca309ad-60d2-4b9a-7911-08db61dcf47b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:43:02.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5eK29oTHPrqxgUp2keO/GNuaUv9fMPX97Mf+WNltTkw/e0u76QMGwlBTe26m8Qv/BCjaI/DECmomkUapt7nmbbW4UAtb4Z2qaaZtY4tXXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7257
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <xdp-newbies.vger.kernel.org>
X-Mailing-List: xdp-newbies@vger.kernel.org

On Wed, May 31, 2023 at 01:10:07PM +0000, Tomas Jansky wrote:
> Hi,
> 
> I came across a year-old thread about multipacket buffer support in
> AF_XDP (https://www.spinics.net/lists/xdp-newbies/msg02212.html).
> 
> My company is very interested in the possibility of processing jumbo
> packets via AF_XDP socket with Intel X710 and Mellanox ConnectX-5 cards,
> so I wanted to ask about the current status of multipacket buffer
> support in AF_XDP sockets and also the possibility of using huge pages
> for UMEM with unaligned chunk flag to achieve the same goal.
> 
> Could we expect any of these features to be supported in the nearby
> future? Let's say a year from now.

AF_XDP multi-buffer support is on mailing lists now:
https://lore.kernel.org/bpf/20230529155024.222213-1-maciej.fijalkowski@intel.com/T/

you already can try this out on your side but for zero-copy currently this
patchset only enables ice driver. We will follow up with i40e (X710)
support.
