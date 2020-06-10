package com.etc.aquaculture.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * @author yanxq
 * @date 2020/6/9 16:34
 **/
@Entity
@Table(name = "t_pool_area")
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class PoolArea {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String poolCode;
    private String poolRemark;
    private String poolTotal;
    private String poolLocation;
    @Transient
    private List<PoolInfo> poolInfoList;

}
