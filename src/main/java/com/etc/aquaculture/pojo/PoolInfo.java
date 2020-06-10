package com.etc.aquaculture.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @author yanxq
 * @date 2020/6/8 17:27
 **/
@Entity
@Table(name = "t_pool_info")
@Data
@JsonIgnoreProperties(value = { "hibernateLazyInitializer"})
public class PoolInfo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    private Long poolAreaId;
    private String poolName;
    private String poolArea;
    private String poolDeep;
    private String poolType;
    private String poolDensity;
    private String poolOxygen;
    private String poolPh;
    private String poolAmmonia;
    private String poolTemperature;
    private Date poolCurrentTime;

}
