package com.bzkj.controller.runtime;import com.alibaba.dubbo.config.annotation.Reference;import com.bzkj.controller.base.BaseController;import com.bzkj.facade.runtime.KafkaService;import com.bzkj.facade.runtime.RedisService;import com.bzkj.rsp.Result;import org.springframework.web.bind.annotation.RequestParam;import org.springframework.web.bind.annotation.RestController;/** * @description: redis * @author: jensen * @date: created by 2019/9/11 19:44 */@RestControllerpublic class RedisControllerImpl extends BaseController implements RedisController {    @Reference    RedisService redisService;    @Reference    KafkaService kafkaService;    @Override    public Result set(@RequestParam(name = "key") String key, @RequestParam(name = "val") String val) {        logger.info("存储的key={}#######value={}",key,val);        redisService.put(key,val);        kafkaService.send(val);        return  Result.newSuccessResult();    }    @Override    public Result get(@RequestParam(name = "key") String key) {        logger.info("获取的key是{}",key);        return Result.newSuccessResult(redisService.get(key));    }}