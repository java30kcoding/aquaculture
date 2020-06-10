package com.etc.aquaculture.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

/**
 * 预警实体类
 *
 * @author yuanyl
 * @date 2020/6/9 21:54
 **/
@Entity
@Table(name = "t_warning")
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class Warning {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 池塘含氧量最小
     */
    private String poolOxygenMin;
    private String poolOxygenMax;
    private String poolPhMin;
    private String poolPhMax;
    private String poolAmmoniaMin;
    private String poolAmmoniaMax;
    private String poolTemperatureMin;
    private String poolTemperatureMax;

}
