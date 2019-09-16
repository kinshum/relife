package com.bzkj.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.collections.CollectionUtils;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class JacksonUtil {
    private static final ObjectMapper MAPPER;
    static {
        MAPPER = new ObjectMapper();
        MAPPER.setSerializationInclusion( Include.NON_NULL );
        MAPPER.disable( DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES );
    }

    public static <T> T toBean( String json, Class<T> clazz ) throws RuntimeException{
        try {
            return MAPPER.readValue( json, clazz );
        }
        catch ( IOException e ) {
            throw new RuntimeException( e );
        }
    }

    public static String toJson( Object obj ) throws RuntimeException{
        try {
            return MAPPER.writeValueAsString( obj );
        } catch ( JsonProcessingException e ) {
            throw new RuntimeException( e.getMessage() );
        }
    }

    public static ObjectMapper getObjectMapper() {
        return MAPPER;
    }
    
    /**
	 * List<T> 转 json 保存到数据库
	 */
	public static <T> String listToJson(List<T> ts) {
	    return JSON.toJSONString(ts);
	}
	
	/**
	 * json 转 List<T>
	 */
	public static <T> List<T> jsonToList(String jsonString, Class<T> clazz) {
	    List<T> ts = (List<T>) JSONArray.parseArray(jsonString, clazz);
	    return ts;
	}
	
	/**
	 * Set<T> 转 json 保存到数据库
	 */
	public static <T> String setToJson(Set<T> ts) {
		return JSON.toJSONString(ts);
	}
	
	/**
	 * json 转 set<T>
	 */
	public static <T> Set<T> jsonToSet(String jsonString, Class<T> clazz) {
		Set<T> set = new HashSet<T>();
		List<T> ts = (List<T>) JSONArray.parseArray(jsonString, clazz);
		set.addAll(ts);
		return set;
	}
	
	/**
	 * Set<String> 转 json 保存到数据库
	 */
	public static String setStringToJson(Set<String> ts) {
		return  JSON.toJSONString(ts);
	}
	
	/**
	 * json 转 set<String>
	 */
	public static Set<String> jsonToSetString(String jsonString, Class<String> clazz) {
		Set<String> set = new HashSet<String>();
		List<String> ts = (List<String>) JSONArray.parseArray(jsonString, clazz);
		if(CollectionUtils.isNotEmpty(ts)){
			set.addAll(ts);
		}
		return set;
	}
    
}
