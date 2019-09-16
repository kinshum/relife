package com.bzkj.activity.service.draw;import com.alibaba.dubbo.config.annotation.Reference;import com.alibaba.dubbo.config.annotation.Service;import com.baomidou.mybatisplus.mapper.EntityWrapper;import com.baomidou.mybatisplus.service.impl.ServiceImpl;import com.bzkj.activity.dao.OlmpAcAwardRuleMapper;import com.bzkj.activity.dao.OlmpActivityMapper;import com.bzkj.constants.DrawConstants;import com.bzkj.dto.UserDrawInfo;import com.bzkj.dto.activity.ActivityInfo;import com.bzkj.entity.activity.OlmpAcAwardRule;import com.bzkj.entity.activity.OlmpActivityWithBLOBs;import com.bzkj.enumeration.activity.ActivityStatusEnum;import com.bzkj.facade.activity.draw.DrawActivityService;import com.bzkj.facade.redis.RedisService;import com.bzkj.rsp.Result;import com.bzkj.utils.JsonUtil;import org.springframework.beans.factory.annotation.Autowired;import java.util.Optional;import java.util.concurrent.TimeUnit;/** * @description: * @author: jensen * @date: created by 2019/9/16 13:41 */@Service(interfaceClass = DrawActivityService.class, version = "1.0.0")@org.springframework.stereotype.Servicepublic class DrawActivityServiceImpl extends ServiceImpl<OlmpAcAwardRuleMapper, OlmpAcAwardRule> implements DrawActivityService {    @Reference(version = "1.0.0")    private RedisService redisService;    @Autowired    OlmpAcAwardRuleMapper olmpAcAwardRuleMapper;    @Autowired    OlmpActivityMapper olmpActivityMapper;    @Override    public Result<ActivityInfo> status(String activityId) {        // 从缓存中查询活动状态，活动类型        ActivityInfo activityInfo = this.getActivityInfo(activityId);        if (activityInfo == null) {            ActivityStatusEnum activityStatus = ActivityStatusEnum.ACTIVITY_DISABLE;            int acStatus;            // 查询活动信息            Optional<OlmpActivityWithBLOBs> first = olmpActivityMapper.selectList(new EntityWrapper<OlmpActivityWithBLOBs>()                    .where("ac_id = {0} and delete_flag = 0", activityId))                    .stream().findFirst();            if (first.isPresent()) {                OlmpActivityWithBLOBs invitationActivity = first.get();                acStatus = invitationActivity.getAcState();                // 状态转换，活动状态数字(0:生成中 1:已生成2:待审核3:已驳回 4:审核通过 5:已发布 6:已暂停 7:已结束)                if (acStatus == 5) {                    activityStatus = ActivityStatusEnum.ACTIVITY_GOING;                }                if (acStatus == 6) {                    activityStatus = ActivityStatusEnum.ACTIVITY_SUSPEND;                }                if (acStatus == 7) {                    activityStatus = ActivityStatusEnum.ACTIVITY_END;                }                activityInfo = new ActivityInfo();                activityInfo.setActivityId(invitationActivity.getAcId());                activityInfo.setActivityStatus(activityStatus.getStatus());                activityInfo.setActivityType(invitationActivity.getAcType());                activityInfo.setBeginTime(invitationActivity.getBeginDate());                activityInfo.setEndTime(invitationActivity.getEndDate());                activityInfo.setActivityName(invitationActivity.getAcName());                activityInfo.setOrgId(invitationActivity.getAcOrgId());                activityInfo.seteId(invitationActivity.geteId());                this.cacheActivityInfo(activityId, activityInfo);            }        }        return Result.newSuccessResult(activityInfo);    }    @Override    public Result<UserDrawInfo> count(String activityId, String userId) {        UserDrawInfo userDrawInfo = this.getUserDrawInfo(userId, activityId);        userDrawInfo.setUserId("");        return Result.newSuccessResult(userDrawInfo);    }    @Override    public Result goodsList(String activityId) {        return null;    }    @Override    public Result join(String activityId, String userId) {        return null;    }    @Override    public UserDrawInfo getUserDrawInfo(String userId, String activityId) {        //从缓存中获取用户抽奖信息        UserDrawInfo userDrawInfo = this.getUserInfoForDraw(userId, activityId);        //互动规则        OlmpAcAwardRule olmpAcAwardRule = this.getAcAwardRuleByAcId(activityId);        if (userDrawInfo == null) {            userDrawInfo = new UserDrawInfo();            userDrawInfo.setUserId(userId);            userDrawInfo.setActivityId(activityId);            //抽奖周期信息            userDrawInfo.setDrawPeriod(olmpAcAwardRule.getAwardCycleType());            userDrawInfo.setPeriodDrawTimes(olmpAcAwardRule.getAwardCycleType(), olmpAcAwardRule.getCycleAwardNum());            //中奖概率            userDrawInfo.setWinningRate(olmpAcAwardRule.getPrizeRate().intValue());            //中奖周期信息            userDrawInfo.setWinningPeriod(olmpAcAwardRule.getPrizeCycleType());            userDrawInfo.setPeriodWinningTimes(olmpAcAwardRule.getPrizeCycleType(), olmpAcAwardRule.getCyclePrizeNum());            //抽奖次数清理规则            userDrawInfo.setCleanPeriod(olmpAcAwardRule.getAwardNumRule());            //会话内连续未中奖次数            userDrawInfo.setInSessionNotWinningTimes(0);        } else {            //======            //若用户抽奖信息已存在            //1.当切换抽奖周期或中奖周期，删除周期设置信息，重新计数            //2.当获取的周期KEY值不存在时，更新抽奖或中奖周期信息            //======            //清理抽奖周期信息            userDrawInfo.setDrawPeriod(olmpAcAwardRule.getAwardCycleType());            userDrawInfo.cleanPeriodDrawTimes(olmpAcAwardRule.getAwardCycleType(), olmpAcAwardRule.getCycleAwardNum());            //清理中奖周期信息            userDrawInfo.setWinningPeriod(olmpAcAwardRule.getPrizeCycleType());            userDrawInfo.cleanPeriodWinningTimes(olmpAcAwardRule.getPrizeCycleType(), olmpAcAwardRule.getCyclePrizeNum());            //清理抽奖次数            userDrawInfo.cleanDrawTimes(olmpAcAwardRule.getAwardNumRule());        }        this.cacheUserInfoForDraw(userId, activityId, userDrawInfo);        return userDrawInfo;    }    @Override    public Result horseRace(String activityId) {        return null;    }    @Override    public Result delRedis(String activityId) {        return null;    }    private void cacheActivityInfo(String activityId, ActivityInfo activityInfo) {        String cacheKey = DrawConstants.LUCK_DRAW_ACTIVITY_R_K + activityId;        redisService.put(cacheKey, JsonUtil.getJsonString(activityInfo));    }    private ActivityInfo getActivityInfo(String activityId) {        String cacheKey = DrawConstants.LUCK_DRAW_ACTIVITY_R_K + activityId;        if (redisService.contain(cacheKey)) {            Object object = redisService.get(cacheKey);            return JsonUtil.json2Obj(object.toString(), ActivityInfo.class);        }        return null;    }    /**     * 用户统计信息     *     * @param userId     * @param activityId     * @return     */    private UserDrawInfo getUserInfoForDraw(String userId, String activityId) {        String cacheKey = DrawConstants.USER_DRAW_INFO + activityId + DrawConstants.SPACE + userId;        if (redisService.contain(cacheKey)) {            Object object = redisService.get(cacheKey);            UserDrawInfo userDrawInfo = JsonUtil.json2Obj(object.toString(), UserDrawInfo.class);            return userDrawInfo;        }        return null;    }    /**     * @param userId     * @param activityId     * @param userDrawInfo     */    private void cacheUserInfoForDraw(String userId, String activityId, UserDrawInfo userDrawInfo) {        String cacheKey = DrawConstants.USER_DRAW_INFO + activityId + DrawConstants.SPACE + userId;        redisService.put(cacheKey, JsonUtil.getJsonString(userDrawInfo));    }    private OlmpAcAwardRule getAcAwardRuleByAcId(String activityId) {        OlmpAcAwardRule acAwardRule = this.getAcAwardRule(activityId);        if (acAwardRule == null) {            acAwardRule = olmpAcAwardRuleMapper.getOlmpAcAwardRuleByAcId(activityId);            if (acAwardRule != null) {                this.cacheAcAwardRule(activityId, acAwardRule);            }        }        return acAwardRule;    }    private OlmpAcAwardRule getAcAwardRule(String activityId) {        String cacheKey = DrawConstants.ACTIVITY_AWARD_RULE_INFO + activityId;        if (redisService.contain(cacheKey)) {            Object object = redisService.get(cacheKey);            OlmpAcAwardRule acAwardRule = JsonUtil.json2Obj(object.toString(), OlmpAcAwardRule.class);            return acAwardRule;        }        return null;    }    private void cacheAcAwardRule(String activityId, OlmpAcAwardRule acAwardRule) {        String cacheKey = DrawConstants.ACTIVITY_AWARD_RULE_INFO + activityId;        redisService.put(cacheKey, JsonUtil.getJsonString(acAwardRule), 1, TimeUnit.DAYS);    }}