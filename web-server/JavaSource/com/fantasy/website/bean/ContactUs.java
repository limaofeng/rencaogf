package com.fantasy.website.bean;

import com.fantasy.attr.framework.query.DynaBeanEntityPersister;
import com.fantasy.framework.dao.BaseBusEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Persister;

import javax.persistence.*;

@Entity
@Table(name = "ZXW_CONTACTUS")
@Persister(impl = DynaBeanEntityPersister.class)
@JsonIgnoreProperties({"hibernateLazyInitializer"})
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ContactUs extends BaseBusEntity {

    @Id
    @Column(name = "ID", nullable = false, insertable = true, updatable = true, precision = 22, scale = 0)
    @GeneratedValue(generator = "fantasy-sequence")
    @GenericGenerator(name = "fantasy-sequence", strategy = "fantasy-sequence")
    private Long id;
    /**
     * 需求
     */
    @Column(name = "DEMAND")
    private String demand;
    /**
     * 姓名
     */
    @Column(name = "NAME")
    private String name;
    /**
     * 电话
     */
    @Column(name = "PHONE")
    private String phone;
    /**
     * 地址
     */
    @Column(name = "ADDRESS")
    private String address;
    /**
     * 房型
     */
    @Column(name = "HOUSING_TYPE")
    private String housingType;
    /**
     * 描述
     */
    @Column(name = "DESCRIPTION")
    private String description;
    /**
     * 了解渠道
     */
    @Column(name = "CHANNELS")
    private String channels;
    /**
     * 量房时间
     */
    @Column(name = "AMOUNT_TIME")
    private String amountTime;
    /**
     * 装房面积
     */
    @Column(name = "HOUSING_AREA")
    private String housingArea;
    /**
     * 装修时间
     */
    @Column(name = "ATE_TIME")
    private String ateTime;
    /**
     * 装修类型
     */
    @Column(name = "DECORATE_TYPE")
    private String decorateType;
    /**
     * 装修预算
     */
    @Column(name = "DECORATE_BUDGET")
    private String decorateBudget;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHousingType() {
        return housingType;
    }

    public void setHousingType(String housingType) {
        this.housingType = housingType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getChannels() {
        return channels;
    }

    public void setChannels(String channels) {
        this.channels = channels;
    }

    public String getAmountTime() {
        return amountTime;
    }

    public void setAmountTime(String amountTime) {
        this.amountTime = amountTime;
    }

    public String getHousingArea() {
        return housingArea;
    }

    public void setHousingArea(String housingArea) {
        this.housingArea = housingArea;
    }

    public String getAteTime() {
        return ateTime;
    }

    public void setAteTime(String ateTime) {
        this.ateTime = ateTime;
    }

    public String getDecorateType() {
        return decorateType;
    }

    public void setDecorateType(String decorateType) {
        this.decorateType = decorateType;
    }

    public String getDecorateBudget() {
        return decorateBudget;
    }

    public void setDecorateBudget(String decorateBudget) {
        this.decorateBudget = decorateBudget;
    }
}
