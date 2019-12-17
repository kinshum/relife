package com.bzkj.kafka;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import org.springframework.util.CollectionUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class BatchTest {

    public static void main(String[] args) {
        /*ThreadPoolTaskExecutor poolTaskExecutor = new ThreadPoolTaskExecutor();
        poolTaskExecutor.setMaxPoolSize(10);
        poolTaskExecutor.setCorePoolSize(3);
        poolTaskExecutor.initialize();
        poolTaskExecutor.execute(BatchTest::batchInsert);*/
        List<String> data = Lists.newArrayList();

        for (int i = 0; i < 360; i++) {
            data.add(i + "");
        }

        Integer size = data.size();
        if (null != data && size > 0) {
            int pointsDataLimit = 10;//限制条数
            //判断是否有必要分批
            if (pointsDataLimit < data.size()) {
                int part = size / pointsDataLimit;//分批数
                for (int i = 0; i <= part; i++) {
                    //10
                    if (data.size() >= pointsDataLimit) {
                        List<String> listPage = data.subList(0, pointsDataLimit);
                        System.out.println(JSON.toJSONString(listPage));
                        data.subList(0, pointsDataLimit).clear();
                    } else {
                        if (!CollectionUtils.isEmpty(data)) {
                            System.out.println(JSON.toJSONString(data));
                        }
                    }
                }
            } else {
                //不分批插入数据
                System.out.println(JSON.toJSONString(data));
            }
        }
    }

    private static void batchInsert() {
        String url = "jdbc:mysql://127.0.0.1:3306/relife?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
        String name = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "root";
        Connection conn = null;
        try {
            Class.forName(name);
            conn = DriverManager.getConnection(url, user, password);
            // 关闭自动提交，不然conn.commit()运行到这句会报错
            conn.setAutoCommit(false);
        } catch (ClassNotFoundException | SQLException e1) {
            e1.printStackTrace();
        }
        if (conn == null) {
            return;
        }
        Long begin = System.currentTimeMillis();
        String prefix = "INSERT INTO rcloud_consumer_right_detail (" +
                "consumer_detail_id," +
                "ac_id," +
                "ac_name," +
                "alive_type," +
                "platform_id," +
                "app_id," +
                "channel_no," +
                "scene_id," +
                "clear_time," +
                "consumer_id," +
                "contack_phone," +
                "contack_user," +
                "coupon_code," +
                "create_time," +
                "creator," +
                "deduce_coupon_value," +
                "delete_flag," +
                "end_time," +
                "except_earnings," +
                "get_money," +
                "get_rate_money," +
                "get_way," +
                "integral_count," +
                "merchant_id," +
                "open_id," +
                "organization_id," +
                "over_day," +
                "overlay," +
                "qrcode_url," +
                "red_packet_channel," +
                "relative_time," +
                "remark," +
                "reserve1," +
                "reserve2," +
                "reserve3," +
                "reserve4," +
                "receive_time," +
                "right_name," +
                "right_pic," +
                "send_address," +
                "specifaction," +
                "start_time," +
                "status," +
                "tenant_id," +
                "transation_code," +
                "transfer_accounts," +
                "right_type_id," +
                "right_type," +
                "unit," +
                "update_time," +
                "update_user," +
                "update_username," +
                "use_pic," +
                "use_time," +
                "wishing," +
                "withdraw," +
                "verifi_userid," +
                "verifi_username," +
                "face_value," +
                "market_price," +
                "rate," +
                "real_price," +
                "use_detail," +
                "commit_time," +
                "express_id," +
                "express_name," +
                "ident_card," +
                "order_num," +
                "send_time," +
                "secret_code," +
                "store_type," +
                "store_id," +
                "reduce_value," +
                "witraw," +
                "consume_time," +
                "reissue_reason," +
                "reissue_time," +
                "reissue_user_name," +
                "reissue_user," +
                "consume_type," +
                "integral_value," +
                "global_uuid," +
                "change_reason) VALUES ";
        StringBuffer suffix;
        try {
            // 设置事务为非自动提交
            conn.setAutoCommit(false);
            PreparedStatement pst = conn.prepareStatement("");

            List<String> data = Lists.newArrayList();
            Integer size = data.size();

            // 外层控制总提交事务次数
            for (int i = 1; i <= 10; i++) {
                suffix = new StringBuffer();
                for (int j = 1; j <= 10000; j++) {
                    List<String> values = Lists.newArrayList(i * j + "",
                            1 + "",
                            "第" + i * j + "个用户");
                    suffix.append("('").append(Joiner.on("','").join(values)).append("'),");
                }
                String sql = prefix + suffix.substring(0, suffix.length() - 1);
                pst.addBatch(sql);
                pst.executeBatch();
                conn.commit();
                suffix = new StringBuffer();
            }
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Long end = System.currentTimeMillis();
        // 耗时
        System.out.println("100万条数据插入花费时间: " + (end - begin) / 1000 + " s" + "插入完成");
    }
}