package com.etc.aquaculture.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

/**
 * @author yuanyl
 * @date 2020/6/8 17:51
 **/
@Entity
@Table(name = "t_pool_detail")
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class PoolDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String poolId;
    private String poolOxygen;
    private String poolPh;
    private String poolAmmonia;
    private String poolNitrite;
    private String poolChlorine;
    private String poolTemperature;

}
