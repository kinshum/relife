package com.bzkj.auth.handle;import org.aspectj.lang.ProceedingJoinPoint;import org.aspectj.lang.annotation.Around;import org.aspectj.lang.annotation.Pointcut;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.web.bind.annotation.ControllerAdvice;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.web.context.request.RequestAttributes;import org.springframework.web.context.request.RequestContextHolder;import org.springframework.web.context.request.ServletRequestAttributes;import javax.servlet.http.HttpServletRequest;/** * @description: REST接口统一的日志处理 * @author: jensen * @date: created by 2019/9/11 2:47 */@ControllerAdvice@ResponseBodypublic class LogHandle {    private final Logger logger = LoggerFactory.getLogger("authLogger");    @Pointcut("execution(public * com.bzkj.auth.controller..*.*(..))")    public void restLog() {    }    @Around("restLog()")    public void doAround(ProceedingJoinPoint joinPoint) throws Throwable {        // 生成本次请求时间戳        String timestamp = System.currentTimeMillis() + "";        RequestAttributes ra = RequestContextHolder.getRequestAttributes();        ServletRequestAttributes sra = (ServletRequestAttributes) ra;        HttpServletRequest request = sra.getRequest();        String url = request.getRequestURL().toString();        String method = request.getMethod();        String uri = request.getRequestURI();        String queryString = request.getQueryString();        logger.info(timestamp + ", url: {}, method: {}, uri: {}, params: {}", url, method, uri, queryString);        // result的值就是被拦截方法的返回值        Object result = joinPoint.proceed();        logger.info(timestamp + " , " + result.toString());    }}