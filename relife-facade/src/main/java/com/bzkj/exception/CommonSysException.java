package com.bzkj.exception;import java.io.Serializable;/** * @description: 系统异常 * @author: jensen * @date: created by 2019/9/11 0:35 */public class CommonSysException extends RuntimeException implements Serializable {    private ExpCodeEnum codeEnum;    public CommonSysException(ExpCodeEnum codeEnum) {        super(codeEnum.getMessage());        this.codeEnum = codeEnum;    }    public CommonSysException() {    }}