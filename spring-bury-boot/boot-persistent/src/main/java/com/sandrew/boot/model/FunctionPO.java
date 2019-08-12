/**
 *   自动生成的PO,不要手动修改
 *
 */
package com.sandrew.mvc.model;

import com.sandrew.bury.annotations.TableName;
import com.sandrew.bury.annotations.ColumnName;
import com.sandrew.bury.bean.PO;
import java.util.Date;

@TableName("tm_function")
public class FunctionPO extends PO
{

    public FunctionPO()
    {
    }

                                                            
    public FunctionPO(Integer functionId)
    {
        this.functionId = functionId;
    }

    @ColumnName(value = "function_id", isPK = true, autoIncrement = true)
    private Integer functionId;

    @ColumnName(value = "function_code", isPK = false, autoIncrement = false)
    private String functionCode;

    @ColumnName(value = "function_name", isPK = false, autoIncrement = false)
    private String functionName;

    @ColumnName(value = "father_func", isPK = false, autoIncrement = false)
    private Integer fatherFunc;

    @ColumnName(value = "function_type", isPK = false, autoIncrement = false)
    private Integer functionType;

    @ColumnName(value = "function_status", isPK = false, autoIncrement = false)
    private Integer functionStatus;

    @ColumnName(value = "access_url", isPK = false, autoIncrement = false)
    private String accessUrl;

    @ColumnName(value = "function_order", isPK = false, autoIncrement = false)
    private Integer functionOrder;

    @ColumnName(value = "icon", isPK = false, autoIncrement = false)
    private String icon;

    @ColumnName(value = "is_delete", isPK = false, autoIncrement = false)
    private Integer isDelete;

    @ColumnName(value = "create_by", isPK = false, autoIncrement = false)
    private Integer createBy;

    @ColumnName(value = "create_date", isPK = false, autoIncrement = false)
    private Date createDate;

    @ColumnName(value = "update_by", isPK = false, autoIncrement = false)
    private Integer updateBy;

    @ColumnName(value = "update_date", isPK = false, autoIncrement = false)
    private Date updateDate;


    public void setFunctionId(Integer functionId)
    {
        this.functionId = functionId;
    }
        
    public Integer getFunctionId()
    {
        return this.functionId;
    }
    public void setFunctionCode(String functionCode)
    {
        this.functionCode = functionCode;
    }
        
    public String getFunctionCode()
    {
        return this.functionCode;
    }
    public void setFunctionName(String functionName)
    {
        this.functionName = functionName;
    }
        
    public String getFunctionName()
    {
        return this.functionName;
    }
    public void setFatherFunc(Integer fatherFunc)
    {
        this.fatherFunc = fatherFunc;
    }
        
    public Integer getFatherFunc()
    {
        return this.fatherFunc;
    }
    public void setFunctionType(Integer functionType)
    {
        this.functionType = functionType;
    }
        
    public Integer getFunctionType()
    {
        return this.functionType;
    }
    public void setFunctionStatus(Integer functionStatus)
    {
        this.functionStatus = functionStatus;
    }
        
    public Integer getFunctionStatus()
    {
        return this.functionStatus;
    }
    public void setAccessUrl(String accessUrl)
    {
        this.accessUrl = accessUrl;
    }
        
    public String getAccessUrl()
    {
        return this.accessUrl;
    }
    public void setFunctionOrder(Integer functionOrder)
    {
        this.functionOrder = functionOrder;
    }
        
    public Integer getFunctionOrder()
    {
        return this.functionOrder;
    }
    public void setIcon(String icon)
    {
        this.icon = icon;
    }
        
    public String getIcon()
    {
        return this.icon;
    }
    public void setIsDelete(Integer isDelete)
    {
        this.isDelete = isDelete;
    }
        
    public Integer getIsDelete()
    {
        return this.isDelete;
    }
    public void setCreateBy(Integer createBy)
    {
        this.createBy = createBy;
    }
        
    public Integer getCreateBy()
    {
        return this.createBy;
    }
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }
        
    public Date getCreateDate()
    {
        return this.createDate;
    }
    public void setUpdateBy(Integer updateBy)
    {
        this.updateBy = updateBy;
    }
        
    public Integer getUpdateBy()
    {
        return this.updateBy;
    }
    public void setUpdateDate(Date updateDate)
    {
        this.updateDate = updateDate;
    }
        
    public Date getUpdateDate()
    {
        return this.updateDate;
    }
}