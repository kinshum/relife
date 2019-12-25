package com.bzkj.rsp;import com.bzkj.exception.CommonBizException;import com.bzkj.exception.ExpCodeEnum;import java.io.Serializable;/** * @description: restful接口通用返回结果 * @author: jensen * @date: created by 2019/9/11 0:29 */public class Result<T> implements Serializable {    /**     * 执行结果     */    private boolean isSuccess;    /**     * 0:操作成功     */    private String code = "0";    /**     *     */    private String message = "操作成功";    /**     * 返回数据     */    private T data;    /**     * 返回成功的结果     *     * @param data 需返回的结果     * @param <T>     * @return     */    public static <T> Result<T> newSuccessResult(T data) {        Result<T> result = new Result<>();        result.isSuccess = true;        result.data = data;        return result;    }    /**     * 返回成功的结果     *     * @param <T>     * @return     */    public static <T> Result<T> newSuccessResult() {        Result<T> result = new Result<>();        result.isSuccess = true;        return result;    }    /**     * 返回失败的结果     * PS：返回"未知异常"     *     * @param <T>     * @return     */    public static <T> Result<T> newFailureResult() {        Result<T> result = new Result<>();        result.isSuccess = false;        result.code = ExpCodeEnum.UNKNOW_ERROR.getCode();        result.message = ExpCodeEnum.UNKNOW_ERROR.getMessage();        return result;    }    /**     * 返回失败的结果     *     * @param commonBizException 异常     * @param <T>     * @return     */    public static <T> Result<T> newFailureResult(CommonBizException commonBizException) {        Result<T> result = new Result<>();        result.isSuccess = false;        result.code = commonBizException.getCodeEnum().getCode();        result.message = commonBizException.getCodeEnum().getMessage();        return result;    }    /**     * 返回失败的结果     *     * @param commonBizException 异常     * @param data               需返回的数据     * @param <T>     * @return     */    public static <T> Result<T> newFailureResult(CommonBizException commonBizException, T data) {        Result<T> result = new Result<>();        result.isSuccess = false;        result.code = commonBizException.getCodeEnum().getCode();        result.message = commonBizException.getCodeEnum().getMessage();        result.data = data;        return result;    }    public boolean isSuccess() {        return isSuccess;    }    public void setSuccess(boolean success) {        isSuccess = success;    }    public String getCode() {        return code;    }    public void setCode(String code) {        this.code = code;    }    public String getMessage() {        return message;    }    public void setMessage(String message) {        this.message = message;    }    public T getData() {        return data;    }    public void setData(T data) {        this.data = data;    }    @Override    public String toString() {        return "Result{" +                "isSuccess=" + isSuccess +                ", code='" + code + '\'' +                ", message='" + message + '\'' +                ", data=" + data +                '}';    }}