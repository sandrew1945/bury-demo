/**
 *   自动生成的PO,不要手动修改
 *
 */
package com.sandrew.mvc.model;

import com.sandrew.bury.annotations.TableName;
import com.sandrew.bury.annotations.ColumnName;
import com.sandrew.bury.bean.PO;
import java.util.Date;

@TableName("tr_role_func")
public class RoleFuncPO extends PO
{

    public RoleFuncPO()
    {
    }

                                
    public RoleFuncPO(Integer id)
    {
        this.id = id;
    }

    @ColumnName(value = "id", isPK = true, autoIncrement = true)
    private Integer id;

    @ColumnName(value = "role_id", isPK = false, autoIncrement = false)
    private Integer roleId;

    @ColumnName(value = "function_id", isPK = false, autoIncrement = false)
    private Integer functionId;

    @ColumnName(value = "create_by", isPK = false, autoIncrement = false)
    private Integer createBy;

    @ColumnName(value = "create_date", isPK = false, autoIncrement = false)
    private Date createDate;

    @ColumnName(value = "update_by", isPK = false, autoIncrement = false)
    private Integer updateBy;

    @ColumnName(value = "update_date", isPK = false, autoIncrement = false)
    private Date updateDate;


    public void setId(Integer id)
    {
        this.id = id;
    }
        
    public Integer getId()
    {
        return this.id;
    }
    public void setRoleId(Integer roleId)
    {
        this.roleId = roleId;
    }
        
    public Integer getRoleId()
    {
        return this.roleId;
    }
    public void setFunctionId(Integer functionId)
    {
        this.functionId = functionId;
    }
        
    public Integer getFunctionId()
    {
        return this.functionId;
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