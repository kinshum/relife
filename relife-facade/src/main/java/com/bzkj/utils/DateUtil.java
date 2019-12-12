package com.bzkj.utils;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 日期工具类
 */
public class DateUtil {
    public static final String PATTERN_DATE_1 = "yyyy-MM-dd";
    public static final String PATTERN_DATE_2 = "HH:mm:ss";
    public static final String PATTERN_DATE_3 = "yyyy-MM-dd HH:mm:ss";
    public static final String PATTERN_DATE_4 = "yyyy-MM";
    public static final String PATTERN_DATE_5 = "yyyyMM";
    public static final String PATTERN_DATE_6 = "yyyy";
    public static final String PATTERN_DATE_7 = "yyyyMMddHHmmss";
    public static final String PATTERN_DATE_8 = "yyyyMMdd";
    public static final String PATTERN_DATE_9 = "HHmmss";
    public static final String TIME1 = " 00:00:00";
    public static final String TIME2 = " 23:59:59";
    public static final String FIRST = "first";
    public static final String LAST = "last";
    private static final Logger logger = LoggerFactory.getLogger(DateUtil.class);

    private DateUtil() {
    }

    /**
     * 将日期字符串格式化为指定日期格式的日期类型
     *
     * @param dateString 日期字符串
     * @param pattern    日期格式
     * @return Date 日期类型
     * @author ATNC
     * @date 2015年1月6日下午4:34:14
     * @since 1.0.0
     */
    public static Date parseDate(String dateString, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            return sdf.parse(dateString);
        } catch (Exception e) {
            return null;
        }
    }
    
    /**
     * 日期比较
     * 
     * @param dateTime1
     * @param dateTime2
     * @return
     */
    public static int compare(String dateTime1, String dateTime2 ) {
    	SimpleDateFormat format = new SimpleDateFormat(DateUtil.PATTERN_DATE_3);
		try {
			Date dt1 = format.parse(dateTime1);
			Date dt2 = format.parse(dateTime2);
			if (dt1.getTime() < dt2.getTime()) {
				return 1;
			} else if (dt1.getTime() > dt2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			logger.error("格式转换出错:{}",e.getMessage());
		}
		return 0;
    }

    public static String timeStamp2DateStr(String seconds, String format) {
        if (seconds == null || seconds.isEmpty() || seconds.equals("null")) {
            return "";
        }
        if (format == null || format.isEmpty()) {
            format = PATTERN_DATE_3;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(Long.valueOf(seconds + "000")));
    }

    /**
     * 将日期类型格式化为指定日期格式的日期字符串
     *
     * @param date    日期类型
     * @param pattern 日期格式
     * @return String 日期字符串
     * @author ATNC
     * @date 2015年1月6日下午4:35:11
     * @since 1.0.0
     */
    public static String format(Date date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            return sdf.format(date);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 得到当前系统时间字符串 格式：yyyy-MM-dd HH:mm:ss
     *
     * @return String 日期字符串
     * @author KuYonggang
     * @date 2015年1月6日下午4:31:29
     * @since 1.0.0
     */
    public static String getCurrentDate() {
        return format(new Date(), DateUtil.PATTERN_DATE_3);
    }


    /**
     * @return
     * @Title: getCurrentDate
     * @Description: 指定格式日期字符串
     * @author muxueliang
     * @date 2018年11月1日 下午4:32:06
     */
    public static String getCurrentDate(String pattern) {
        return format(new Date(), pattern);
    }

    /**
     * 得到指定格式的当前系统时间对象类型 格式：yyyy-MM-dd HH:mm:ss
     *
     * @return Date 日期类型
     * @author ATNC
     * @date 2015年1月6日下午4:30:58
     * @since 1.0.0
     */
    public static Date getNowDateTime() {
        return DateUtil.parseDate(getCurrentDate(), PATTERN_DATE_3);
    }

    /**
     * 得到指定格式的当前系统时间对象类型 格式：yyyy-MM-dd
     *
     * @return Date 日期类型
     * @author ATNC
     * @date 2015年1月6日下午4:30:08
     * @since 1.0.0
     */
    public static Date getNowDate() {
        return DateUtil.parseDate(getCurrentDate(), DateUtil.PATTERN_DATE_1);
    }

    /**
     * 得到指定格式的当前系统年月字符串 格式：yyyy-MM
     *
     * @return String 日期字符串
     * @author ATNC
     * @date 2015年1月6日下午4:30:08
     * @since 1.0.0
     */
    public static String getNowYearMonthStr() {
        return format(new Date(), DateUtil.PATTERN_DATE_4);
    }

    /**
     * 得到指定格式的当前系统月字符串 格式：MM
     *
     * @return String 日期字符串
     * @author ATNC
     * @date 2015年1月6日下午4:30:08
     * @since 1.0.0
     */
    public static String getNowMonthStr() {
        return format(new Date(), "MM");
    }

    /**
     * 得到指定格式的当前系统年份字符串 格式：yyyy
     *
     * @return String 日期字符串
     * @author ATNC
     * @date 2015年1月21日上午9:41:09
     * @since 1.0.0
     */
    public static String getNowYearStr() {
        return format(new Date(), DateUtil.PATTERN_DATE_6);
    }

    /**
     * 得到指定格式的当前系统时间字符串 格式：yyyyMMddHHmmss
     *
     * @return String 日期字符串
     * @author ATNC
     * @date 2015年1月21日上午9:41:09
     * @since 1.0.0
     */
    public static String getMyDateStr() {
        return format(new Date(), DateUtil.PATTERN_DATE_7);
    }

    /**
     * @param begin
     * @param end
     * @return
     * @Title: getBetweenDates
     * @Description: 获取两个日期之间的所有日期（yyyy-MM-dd）
     * @author muxueliang
     * @date 2018年9月16日 下午4:01:16
     */
    public static List<String> getBetweenDates(String begin, String end) {
        Date beginDate = parseDate(begin, PATTERN_DATE_1);
        Date endDate = parseDate(end, PATTERN_DATE_1);
        List<String> result = new ArrayList<>();
        Calendar tempStart = Calendar.getInstance();
        tempStart.setTime(beginDate);
        while (beginDate != null && endDate != null && beginDate.getTime() <= endDate.getTime()) {
            result.add(format(tempStart.getTime(), PATTERN_DATE_1));
            tempStart.add(Calendar.DAY_OF_YEAR, 1);
            beginDate = tempStart.getTime();
        }
        return result;
    }

    /***
     * @comments 计算两个时间的时间差
     * @param sTime
     * @param eTime
     *
     * @return diffNum 返回时间差秒
     */
    public static Long getTimeDiff(String sTime, String eTime) {
        Long diffNum = 0L;
        SimpleDateFormat df = new SimpleDateFormat(PATTERN_DATE_3);
        try {
            Date sdate = df.parse(sTime);
            Date edate = df.parse(eTime);
            Long time = edate.getTime() - sdate.getTime(); // 获取时间差
            if (time > 0) {
                diffNum = time / 1000;
            }
        } catch (Exception e) {
            logger.error("Exception->{}", e.getMessage());
        }

        return diffNum;
    }

    /**
     * 根据日期计算所在周的上下界
     *
     * @param time
     */
    public static Map<String, Object> convertWeekByDate(Date time) {
        Map<String, Object> map = new HashMap<>();
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        // 判断要计算的日期是否是周日，如果是则减一天计算周六的，否则会出问题，计算到下一周去了
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天
        if (1 == dayWeek) {
            cal.add(Calendar.DAY_OF_MONTH, -1);
        }
        cal.setFirstDayOfWeek(Calendar.MONDAY);// 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
        int day = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);// 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值
        String imptimeBegin = format(cal.getTime(), PATTERN_DATE_1) + TIME1;
        cal.add(Calendar.DATE, 6);
        String imptimeEnd = format(cal.getTime(), PATTERN_DATE_1) + TIME2;

        map.put(FIRST, imptimeBegin);

        map.put(LAST, imptimeEnd);

        return map;
    }

    /**
     * 根据日期计算当月的第一天与最后一天
     *
     * @param date
     * @return
     */
    public static Map<String, Object> convertMonthByDate(Date date) {
        Map<String, Object> map = new HashMap<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        Date theDate = calendar.getTime();
        // 当月第一天
        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        String dayFirst = format(gcLast.getTime(), PATTERN_DATE_1) + TIME1;

        // 当月最后一天
        calendar.add(Calendar.MONTH, 1); // 加一个月
        calendar.set(Calendar.DATE, 1); // 设置为该月第一天
        calendar.add(Calendar.DATE, -1); // 再减一天即为上个月最后一天
        String dayLast = format(calendar.getTime(), PATTERN_DATE_1) + TIME2;
        map.put(FIRST, dayFirst);
        map.put(LAST, dayLast);
        return map;

    }

    /**
     * 根据日期计算当年的第一天与最后一天
     *
     * @param date
     * @return
     */
    public static Map<String, Object> convertYearByDate(Date date) {
        Map<String, Object> map = new HashMap<>();
        Calendar calendar = Calendar.getInstance();
        int year = date.getYear() + 1900;
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        Date currYearFirst = calendar.getTime();
        calendar.set(Calendar.YEAR, year + 1);
        calendar.add(Calendar.DATE, -1);
        Date lastYearFirst = calendar.getTime();
        map.put(FIRST, format(currYearFirst, PATTERN_DATE_1) + TIME1);
        map.put(LAST, format(lastYearFirst, PATTERN_DATE_1) + TIME2);
        return map;

    }

    /**
     * 获取当前季度
     */
    public static int getQuarter() {
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH) + 1;
        int quarter = 0;
        if (month >= 1 && month <= 3) {
            quarter = 1;
        } else if (month >= 4 && month <= 6) {
            quarter = 2;
        } else if (month >= 7 && month <= 9) {
            quarter = 3;
        } else {
            quarter = 4;
        }
        return quarter;
    }

    /**
     * 获取某季度的第一天和最后一天
     *
     * @param num 第几季度
     */
    public static Map<String, Object> getCurrQuarter(int num) {
        Map<String, Object> map = new HashMap<>();
        String[] s = new String[2];
        String str = "";
        // 设置本年的季
        Calendar quarterCalendar = null;
        switch (num) {
            case 1:
                // 本年到现在经过了一个季度，在加上前4个季度
                quarterCalendar = Calendar.getInstance();
                quarterCalendar.set(Calendar.MONTH, 3);
                quarterCalendar.set(Calendar.DATE, 1);
                quarterCalendar.add(Calendar.DATE, -1);
                s[0] = str.substring(0, str.length() - 5) + "01-01 00:00:00";
                s[1] = str;
                break;
            case 2:
                // 本年到现在经过了二个季度，在加上前三个季度
                quarterCalendar = Calendar.getInstance();
                quarterCalendar.set(Calendar.MONTH, 6);
                quarterCalendar.set(Calendar.DATE, 1);
                quarterCalendar.add(Calendar.DATE, -1);
                str = format(quarterCalendar.getTime(), PATTERN_DATE_1);
                s[0] = str.substring(0, str.length() - 5) + "04-01 00:00:00";
                s[1] = str;
                break;
            case 3:
                // 本年到现在经过了三个季度，在加上前二个季度
                quarterCalendar = Calendar.getInstance();
                quarterCalendar.set(Calendar.MONTH, 9);
                quarterCalendar.set(Calendar.DATE, 1);
                quarterCalendar.add(Calendar.DATE, -1);
                str = format(quarterCalendar.getTime(), PATTERN_DATE_1);
                s[0] = str.substring(0, str.length() - 5) + "07-01 00:00:00";
                s[1] = str;
                break;
            case 4:
                // 本年到现在经过了四个季度，在加上前一个季度
                quarterCalendar = Calendar.getInstance();
                str = format(quarterCalendar.getTime(), PATTERN_DATE_1);
                s[0] = str.substring(0, str.length() - 5) + "10-01 00:00:00";
                s[1] = str.substring(0, str.length() - 5) + "12-31 23:59:59";
                break;
            default:
                break;
        }
        map.put(FIRST, s[0]);
        map.put(LAST, s[1]);
        return map;
    }

    // 获取上月的月末时间
    public static String getBeforeLastMonthdate() {
        SimpleDateFormat sf = new SimpleDateFormat(PATTERN_DATE_8);
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH);
        calendar.set(Calendar.MONTH, month - 1);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        logger.info("上个月最后一天：{}" ,sf.format(calendar.getTime()));
        return sf.format(calendar.getTime());

    }

    /**
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return int
     * @method daysBetween
     * @description 计算两个日期之间的差值
     * @date 2018/10/25 9:44
     * @author wangyulan
     */
    public static int daysBetween(String startTime, String endTime) {
        Date earlyDate = new Date();
        Date lateDate = new Date();
        DateFormat dateFormat = DateFormat.getDateInstance();
        try {
            earlyDate = dateFormat.parse(startTime);
            lateDate = dateFormat.parse(endTime);


        } catch (ParseException e) {
            logger.error("ParseException->{}", e.getMessage());
        }
        Calendar calendarStart = Calendar.getInstance();
        Calendar calendarEnd = Calendar.getInstance();
        calendarStart.setTime(earlyDate);
        calendarEnd.setTime(lateDate);
        calendarStart.set(Calendar.MINUTE, 0);
        calendarStart.set(Calendar.SECOND, 0);
        calendarStart.set(Calendar.HOUR_OF_DAY, 0);

        calendarEnd.set(Calendar.MINUTE, 0);
        calendarEnd.set(Calendar.SECOND, 0);
        calendarEnd.set(Calendar.HOUR_OF_DAY, 0);
        return ((int) (calendarEnd.getTime().getTime() / 1000) - (int) (calendarStart.getTime().getTime() / 1000)) / 3600 / 24;

    }

    /**
     * 去掉时间字符串中的分隔符(- / : " ")等
     *
     * @param timeStr 待处理字符串
     * @return 返回新字符串
     */
    public static String timeFormat(String timeStr) {
        if (StringUtils.isBlank(timeStr)) {
            return "";
        }
        return timeStr.replace("-", "").replace(":", "").replace("/", "").replace(" ", "");
    }

    /**
     * 日期字符串格式化
     *
     * @param timeStr
     * @param pattern
     * @return
     */
    public static String timeFormat(String timeStr, String pattern) {
        if (StringUtils.isBlank(timeStr)) {
            return "";
        }
        return format(parseDate(timeStr, PATTERN_DATE_3), pattern);
    }

    /**
     * date2比date1多的天数
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDays(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        int day1 = cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);

        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if (year1 != year2) {
            //同一年
            int timeDistance = 0;
            for (int i = year1; i < year2; i++) {
                if (i % 4 == 0 && i % 100 != 0 || i % 400 == 0) {
                    //闰年
                    timeDistance += 366;
                } else {
                    //不是闰年
                    timeDistance += 365;
                }
            }

            return timeDistance + (day2 - day1);
        } else    //不同年
        {
            return day2 - day1;
        }
    }

    /**
     * 获取两个字符串类日期的天数差
     *
     * @param start
     * @param end
     * @param partten
     * @return
     * @throws Exception
     */
    public static long daysBetween(String start, String end, String partten) {
        long day = 0;
        SimpleDateFormat sdf = new SimpleDateFormat(partten);
        Date beginDate = null;
        Date endDate = null;
        if (start != null) {
            try {
                beginDate = sdf.parse(start);
            } catch (ParseException e) {
                beginDate = new Date();
                e.printStackTrace();
            }
        }
        if (end != null) {
            try {
                endDate = sdf.parse(end);
            } catch (ParseException e) {
                endDate = new Date();
                e.printStackTrace();
            }
        }
        day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
        return day;
    }

    /**
     * 获取两个日期的小时数差
     *
     * @param start
     * @param end
     * @return
     * @throws Exception
     */
    public static long hoursBetween(Date start, Date end) {
        long day = 0;
        Date beginDate = start;
        Date endDate = end;
        if (start == null) {
            beginDate = new Date();
        }
        if (end == null) {
            endDate = new Date();
        }
        day = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
        return day;
    }


    /**
     * 时间差返回毫秒
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public static long timeDifferenceValue(String startTime, String endTime) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long diff = 0;
        try {
            Date d1 = df.parse(endTime);
            Date d2 = df.parse(startTime);
            diff = d1.getTime() - d2.getTime();
            //long days = diff / (1000 * 60 * 60 * 24);
            //long hours = (diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60);
            //long minutes = (diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60);
        } catch (Exception e) {
        }
        return diff;
    }


    
    public static void main(String[] args) {
    	System.out.println(DateUtil.hoursBetween(new Date(), DateUtil.parseDate("2019-09-30 00:00:00", "yyyy-MM-dd HH:mm:ss")));
		
	}
}
