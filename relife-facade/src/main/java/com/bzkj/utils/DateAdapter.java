package com.bzkj.utils;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateAdapter implements JsonDeserializer<Date> {
    private final DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final Logger logger = LoggerFactory.getLogger(DateAdapter.class);
    public Date deserialize(JsonElement arg0, java.lang.reflect.Type arg1, JsonDeserializationContext arg2) {
        try {
            return df.parse(arg0.getAsString());
        } catch (ParseException e) {
            logger.error("ParseException->{}",e.getMessage());
        }
        return null;
    }
}
