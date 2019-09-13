package com.bzkj.controller.redis;import com.alibaba.dubbo.config.annotation.Reference;import com.bzkj.controller.base.BaseController;import com.bzkj.facade.redis.RedisService;import com.bzkj.rsp.Result;import org.springframework.web.bind.annotation.RequestParam;import org.springframework.web.bind.annotation.RestController;/** * @description: * @author: jensen * @date: created by 2019/9/11 19:44 */@RestControllerpublic class RedisControllerImpl extends BaseController implements RedisController {    @Reference(version = "1.0.0")    RedisService redisService;    @Override    public Result set(@RequestParam(name = "key") String key, @RequestParam(name = "val") String val) {        logger.info("存储的key={}#######value={}",key,val);        redisService.put(key,val);        return  Result.newSuccessResult();    }    @Override    public Result get(@RequestParam(name = "key") String key) {        logger.info("获取的key是{}",key);        return Result.newSuccessResult(redisService.get(key));    }}