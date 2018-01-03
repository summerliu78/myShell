1、一度联系人过去一个月在本平台申请的人数
--weibo
SELECT 
count(1) num 
FROM
        (SELECT
        count(MOBILE) num
        from
        xiaodai.CREDIT_APPLY

         WHERE
        MOBILE IN (...手机号需要自己添加)
        
        AND
       
         DATEDIFF(NOW(),APPLY_TIME)<=30
        
        GROUP BY mobile) a

--pingtai
SELECT COUNT(1) num FROM
      (SELECT
        count(MOBILE) num
        from
        xiaodai.CREDIT_APPLY
        WHERE
        MOBILE IN (...手机号需要自己添加)
        
        AND
         DATEDIFF(NOW(),APPLY_TIME)<=30
        GROUP BY MOBILE) a


2、一度联系人申请通过人的逾期人数
--weibo
SELECT COUNT(1) num FROM
          (SELECT count(1) c from  xiaodai.LOAN_REPAY_PLAN r
		,xiaodai.LOAN_INFO i 
		WHERE  i.USER_ID=r.USER_ID AND
		DATEDIFF(NOW(),r.DUE_DAY) >=1 AND
		(r.REPAY_STATUS = '002005001' or (r.REPAY_STATUS ='002005002' AND  DATEDIFF(r.DUE_DAY,r.ACT_DAY) >=1)) AND
		MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)          
	      GROUP BY r.USER_ID) c_a

--pingtai
SELECT COUNT(1) num FROM
          (SELECT count(1) c from  xiaodai.LOAN_REPAY_PLAN r
		,xiaodai.LOAN_INFO i 
		WHERE  i.USER_ID=r.USER_ID AND
		DATEDIFF(NOW(),r.DUE_DAY) >=1 AND
		(r.REPAY_STATUS = '002005001' or (r.REPAY_STATUS ='002005002' AND  DATEDIFF(r.DUE_DAY,r.ACT_DAY) >=1)) AND
		MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)          
	      GROUP BY r.USER_ID,r.CHANNEL) c_a

3、一度联系人中申请授信被拒绝人数
--weibo
SELECT COUNT(gro.co) FROM
 (SELECT
	    count(1) co FROM xiaodai.CREDIT_APPLY
      WHERE
	MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)
	 AND APPLY_STATUS IN (001002007,001002005,001002006) GROUP BY MOBILE) gro

--pingtai
SELECT sum(gro.co)
FROM
(SELECT COUNT(1) co  FROM xiaodai.CREDIT_APPLY
    WHERE
	MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)
	 AND APPLY_STATUS IN (001002007,001002005,001002006) GROUP BY USER_ID,CHANNEL) gro
4、一度联系人中借款但未还人数
--weibo
SELECT
	COUNT(a.ui)
FROM
(SELECT 
	lrp.USER_ID ui,lrp.CHANNEL c
FROM
	xiaodai.LOAN_REPAY_PLAN lrp,xiaodai.LOAN_INFO li
WHERE 
	lrp.REPAY_STATUS='002005001'
	AND li.CHANNEL = lrp.CHANNEL 
	AND li.ID = lrp.LOAN_ID
	AND MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)
GROUP BY
	li.USER_ID,li.CHANNEL) a
--pingtai
SELECT
	COUNT(a.ui)
FROM
(SELECT 
	lrp.USER_ID ui,lrp.CHANNEL c
FROM
	xiaodai.LOAN_REPAY_PLAN lrp,xiaodai.LOAN_INFO li
WHERE 
	lrp.REPAY_STATUS='002005001'
	AND li.CHANNEL = lrp.CHANNEL 
	AND li.ID = lrp.LOAN_ID
	AND MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)
GROUP BY
	li.USER_ID,li.CHANNEL) a
5、一度联系人中逾期金额
	
--weibo
SELECT
SUM(lrp.DUE_AMOUNT)
FROM
			xiaodai.LOAN_REPAY_PLAN lrp,xiaodai.LOAN_INFO li
		WHERE
			li.ID = lrp.LOAN_ID
			AND DATEDIFF(NOW(),lrp.DUE_DAY) >= 1 AND
			(lrp.REPAY_STATUS = '002005001' or (lrp.REPAY_STATUS ='002005002' AND  DATEDIFF(lrp.DUE_DAY,lrp.ACT_DAY) >=1)) 
			AND li.MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)

--pingtai
SELECT
SUM(lrp.DUE_AMOUNT)
FROM
			xiaodai.LOAN_REPAY_PLAN lrp,xiaodai.LOAN_INFO li
		WHERE
			li.ID = lrp.LOAN_ID and lrp.CHANNEL=li.CHANNEL
			AND DATEDIFF(NOW(),lrp.DUE_DAY) >= 1 AND
			(lrp.REPAY_STATUS = '002005001' or (lrp.REPAY_STATUS ='002005002' AND  DATEDIFF(lrp.DUE_DAY,lrp.ACT_DAY) >=1)) 
			AND li.MOBILE IN (15595673736,18673997261,13192786848,15196032201,13623423731,15230445557,18925316639,15051334422,18520280865,15874573760,15695517169)