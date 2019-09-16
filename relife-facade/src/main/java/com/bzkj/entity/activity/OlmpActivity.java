package com.bzkj.entity.activity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * olmp_activity
 * @author 
 */
public class OlmpActivity implements Serializable {
    /**
     * 自增主键
     */
    private Long id;

    /**
     * 活动id
     */
    private String acId;

    /**
     * 地区(包含省市)，可以是多组
     */
    private String acArea;

    /**
     * 活动分发栏位
     */
    private String acBanner;

    /**
     * 活动预算
     */
    private BigDecimal acBudget;

    /**
     * 活动编号，编号规则：日期+两位随机数
     */
    private String acCode;

    /**
     * 活动主题
     */
    private String acContent;

    /**
     * 活动形式：线上，线下，线上和线下
     */
    private String acForms;

    /**
     * 活动方式
     */
    private String acModel;

    /**
     * 活动名称
     */
    private String acName;

    /**
     * 活动所属机构id
     */
    private String acOrgId;

    /**
     * 签报编号
     */
    private String acSignNum;

    /**
     * 活动状态(0:生成中 1:已生成2:待审核3:已驳回 4:审核通过 5:上线 6:下线 7:已结束)
     */
    private Integer acState;

    /**
     * 活动类型编号
     */
    private String acType;

    /**
     * 开始日期YYYY-MM-DD
     */
    private String beginDate;

    /**
     * 新增时间
     */
    private String createDt;

    /**
     * 责任人id
     */
    private String acCreator;

    /**
     * 活动缩略图(推广mgm)
     */
    private String diagrams;

    /**
     * 租户号
     */
    private String eId;

    /**
     * 结束日期
     */
    private String endDate;

    /**
     * 活动海报(推广mgm)
     */
    private String piaoster;

    /**
     * 记录步骤状态（活动信息填写-活动模板配置-活动预发布-提交审批）
     */
    private String stepState;

    /**
     * 更新时间
     */
    private String updateDt;

    /**
     * 活动客群类型
     */
    private String acCustType;

    /**
     * 活动开始时间
     */
    private String acBegindate;

    /**
     * 活动结束时间
     */
    private String acEndDate;

    /**
     * 审批状态
     */
    private Integer approveStatus;

    /**
     * 审批人
     */
    private String approver;

    /**
     * 活动图片
     */
    private String acImg;

    /**
     * 1逻辑删除，0正常
     */
    private Byte deleteFlag;

    /**
     * 分享图片路径
     */
    private String shareImg;

    /**
     * 预警发送标识
     */
    private Integer flag;

    /**
     * 当前操作人名称
     */
    private String useName;

    /**
     * 活动页是否展示达标路径（0不展示，1展示）
     */
    private Byte isShowPath;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAcId() {
        return acId;
    }

    public void setAcId(String acId) {
        this.acId = acId;
    }

    public String getAcArea() {
        return acArea;
    }

    public void setAcArea(String acArea) {
        this.acArea = acArea;
    }

    public String getAcBanner() {
        return acBanner;
    }

    public void setAcBanner(String acBanner) {
        this.acBanner = acBanner;
    }

    public BigDecimal getAcBudget() {
        return acBudget;
    }

    public void setAcBudget(BigDecimal acBudget) {
        this.acBudget = acBudget;
    }

    public String getAcCode() {
        return acCode;
    }

    public void setAcCode(String acCode) {
        this.acCode = acCode;
    }

    public String getAcContent() {
        return acContent;
    }

    public void setAcContent(String acContent) {
        this.acContent = acContent;
    }

    public String getAcForms() {
        return acForms;
    }

    public void setAcForms(String acForms) {
        this.acForms = acForms;
    }

    public String getAcModel() {
        return acModel;
    }

    public void setAcModel(String acModel) {
        this.acModel = acModel;
    }

    public String getAcName() {
        return acName;
    }

    public void setAcName(String acName) {
        this.acName = acName;
    }

    public String getAcOrgId() {
        return acOrgId;
    }

    public void setAcOrgId(String acOrgId) {
        this.acOrgId = acOrgId;
    }

    public String getAcSignNum() {
        return acSignNum;
    }

    public void setAcSignNum(String acSignNum) {
        this.acSignNum = acSignNum;
    }

    public Integer getAcState() {
        return acState;
    }

    public void setAcState(Integer acState) {
        this.acState = acState;
    }

    public String getAcType() {
        return acType;
    }

    public void setAcType(String acType) {
        this.acType = acType;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getCreateDt() {
        return createDt;
    }

    public void setCreateDt(String createDt) {
        this.createDt = createDt;
    }

    public String getAcCreator() {
        return acCreator;
    }

    public void setAcCreator(String acCreator) {
        this.acCreator = acCreator;
    }

    public String getDiagrams() {
        return diagrams;
    }

    public void setDiagrams(String diagrams) {
        this.diagrams = diagrams;
    }

    public String geteId() {
        return eId;
    }

    public void seteId(String eId) {
        this.eId = eId;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getPiaoster() {
        return piaoster;
    }

    public void setPiaoster(String piaoster) {
        this.piaoster = piaoster;
    }

    public String getStepState() {
        return stepState;
    }

    public void setStepState(String stepState) {
        this.stepState = stepState;
    }

    public String getUpdateDt() {
        return updateDt;
    }

    public void setUpdateDt(String updateDt) {
        this.updateDt = updateDt;
    }

    public String getAcCustType() {
        return acCustType;
    }

    public void setAcCustType(String acCustType) {
        this.acCustType = acCustType;
    }

    public String getAcBegindate() {
        return acBegindate;
    }

    public void setAcBegindate(String acBegindate) {
        this.acBegindate = acBegindate;
    }

    public String getAcEndDate() {
        return acEndDate;
    }

    public void setAcEndDate(String acEndDate) {
        this.acEndDate = acEndDate;
    }

    public Integer getApproveStatus() {
        return approveStatus;
    }

    public void setApproveStatus(Integer approveStatus) {
        this.approveStatus = approveStatus;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getAcImg() {
        return acImg;
    }

    public void setAcImg(String acImg) {
        this.acImg = acImg;
    }

    public Byte getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Byte deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public String getShareImg() {
        return shareImg;
    }

    public void setShareImg(String shareImg) {
        this.shareImg = shareImg;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getUseName() {
        return useName;
    }

    public void setUseName(String useName) {
        this.useName = useName;
    }

    public Byte getIsShowPath() {
        return isShowPath;
    }

    public void setIsShowPath(Byte isShowPath) {
        this.isShowPath = isShowPath;
    }
}