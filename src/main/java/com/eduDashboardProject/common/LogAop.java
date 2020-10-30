package com.eduDashboardProject.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAop {
	@Before("execution(* com.eduDashboardProject..*.*(..))")
	public void before(JoinPoint join) {

		Logger logger=LoggerFactory.getLogger(join.getTarget().toString());
		logger.info("----------log-----------");
		//메서드명 출력
		logger.info("methid: "+join.getSignature().getName());
		//매개변수들을 object[]에 받아서
		Object[] args=join.getArgs();
		if(args.length >0) {
			logger.info("-------매개변수------");
			for (Object object : args) {
				if(object != null) {
				logger.info(object.toString());
				}
			}
		}
	}

}