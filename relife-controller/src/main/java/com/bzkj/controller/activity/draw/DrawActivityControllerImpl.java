package com.bzkj.controller.activity.draw;import com.alibaba.dubbo.config.annotation.Reference;import com.bzkj.controller.base.BaseController;import com.bzkj.dto.UserDrawInfo;import com.bzkj.dto.UserInfo;import com.bzkj.exception.CommonBizException;import com.bzkj.exception.ExpCodeEnum;import com.bzkj.facade.activity.draw.DrawActivityService;import com.bzkj.facade.redis.CacheUserService;import com.bzkj.req.DrawReq;import com.bzkj.rsp.Result;import org.apache.commons.lang3.StringUtils;import org.springframework.web.bind.annotation.RestController;/** * @description: 抽奖活动 * @author: jensen * @date: created by 2019/9/16 11:50 */@RestControllerpublic class DrawActivityControllerImpl extends BaseController implements DrawActivityController {    @Reference(version = "1.0.0")    private DrawActivityService iDrawActivityService;    @Reference(version = "1.0.0")    private CacheUserService cacheUserService;    @Override    public Result<UserDrawInfo> count(DrawReq drawReq) {        UserInfo userInfo = cacheUserService.getUserInfo(drawReq.getLoginToken());        if (null == userInfo) {            throw new CommonBizException(ExpCodeEnum.LOGIN_NULL);        }        Result<UserDrawInfo> count = iDrawActivityService.count(drawReq.getActivityId(), userInfo.getUserId());        return count;    }}