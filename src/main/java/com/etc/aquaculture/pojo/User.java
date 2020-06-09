package com.etc.aquaculture.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

/**
 * 用户实体类
 *
 * @author yuanyl
 * @date 2020/6/8 16:30
 **/
@Entity
@Table(name = "t_user")
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String code;
    private String username;
    private String password;
    private String name;
    private Integer sex;
    private String email;
    private String phone;
    private String headImg;
    private String say;
    private Integer state;
    private Integer type;
}
